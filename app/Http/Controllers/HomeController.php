<?php

namespace App\Http\Controllers;
use DB;
use Session;
use App\User;
use App\Room;
use App\Batch;
use App\Course;
use App\Notice;
use App\Semester;
use App\Department;
use App\ExamRoutine;
use App\ClassRoutine;
use App\TeacherCourse;
use App\TeacherExamRoutine;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class HomeController extends Controller
{
    public function index(Request $request){
        // first check if you are loggedin and admin user ... 
        if(!Auth::check() && $request->path() != 'login' && $request->path() != 'registration'){
            return redirect('/login');
        }
        if(!Auth::check() && ($request->path() == 'login' || $request->path() == 'registration' )){
            return view('welcome');
        }
        // you are already logged in... so check for if you are an admin user.. 
        // $user = Auth::user();
        // if($user->userType =='User'){
        //     return redirect('/login');
        // }
        // if($request->path() == 'login'){
        //     return redirect('/');
        // }
        return view('welcome');
        
    }
    public function logout(){
        Auth::logout();
         Auth::check();
        Session::flush();
         return redirect('/login');
    }
    public function adminLogin(Request $request){
        // validate request 
        if((User::where('email',$request->email)->count())==0){  
           return response()->json([
               // 'msg'=>"Email doesn't exist!",
               'msg'=>"Incorrect Email!",
           ],401);
       }
       if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
           $user = Auth::user();
           
           return response()->json([
               'msg' => 'You are logged in', 
               'user' => $user
           ]);
       }else{
           return response()->json([
               'msg'=>"Incorrect Password!",
           ], 401);
       }

   } 
   public function adminRegistration(Request $request){
       
       $this->validate($request, [
           'email' => 'required|string|max:255|email|unique:users',
           'password' => 'required|string',
          
       ]);
       $data = $request->all();
       $data['password'] = Hash::make($data['password']);
       User::create($data);
       Auth::attempt(['email' => $request->email, 'password' => $request->password]);
       $user = Auth::user();
       
       return response()->json([
           'msg' => 'Registration completed successfully!', 
           'user' => $user
       ]);
       
       

   } 
    public function getDashboardData(){
        $totaTeacher = User::where('userType','Teacher')->count();
        $totalStudent = User::where('userType','Student')->count();
        return response()->json([
                'totalStudent' => $totalStudent,
                'totaTeacher' => $totaTeacher,
                'success' => true
        ],200);
    }
    public function all_user_pagi(Request $request){
        $total = $request->total;
        $searchString = $request->email;
        $userType = $request->userType? $request->userType : "Teacher";
        $query =  User::where('userType', $userType);
        return $query->orderBy('id', 'asc')->paginate($total);
    }
    public function admin_class_routine(Request $request){
        $query =  ClassRoutine::orderBy('id', 'asc');
        return $query->paginate(10);
    }
    public function admin_class_routineBySession(Request $request){
        $query =  ClassRoutine::orderBy('id', 'asc')->get();
        $query->sortBy('start_time');
        $newQuery = $query->groupBy('day');
        $days_data = ['Sunday','Monday',"Tuesday",'Wednesday','Thusday'];
        $times_data = [8,9,10,11,12,1,2,3,4];

        foreach ($newQuery as $key => $value) {
            $newQuery[$key] =  $value->groupBy('start_time');
        }
        foreach ($days_data as $v) {
            if(isset($newQuery[$v])){
                $col = 1;
                foreach ($times_data as  $t) {
                    if($t == 1){
                        $newQuery[$v][$t] = [
                            [
                                'col'=>4
                            ]
                        ];
                    }
                    else if(isset($newQuery[$v][$t]) == false){
                        $col--;
                        $colVal = $col <=0 ? 1 : 3;
                        
                        $newQuery[$v][$t] = [
                            [
                                'col'=>$colVal,
                                'hours'=>1
                            ]
                        ];
                        // \Log::info("$v-$t-($col)-if");
                    }
                    else {
                        $col = $newQuery[$v][$t][0]['hours'];
                        $newQuery[$v][$t][0]['col'] = 2;
                        // \Log::info("$v-$t-($col)-".$newQuery[$v][$t][0]['hours']."-else ");
                    }



                }
                

            }
            else {
                $newQuery[$v] = null;
            }
        }
        // for($i=0;$i<sizeof($days_data);$i++){
        //     if(isset)
        // }

        return response()->json([
            'data' => $newQuery,
            'days_data' => $days_data,
            'times_data' => $times_data,
        ], 200); 
    }
    public function admin_class_routine_store(Request $request){
        $data = $request->all();
        return  ClassRoutine::create($data);
    }
    public function admin_class_routine_delete(Request $request){
        return  ClassRoutine::where('id', $request->id)->delete();
    }
    
    public function admin_exam_routine(Request $request){
        $query =  ExamRoutine::with('teachers')->orderBy('id', 'asc');
        return $query->paginate(10);
    }
    public function admin_exam_routine_store(Request $request){
        $data = $request->all();
        $teacherData = $data['formatTeachers'];
        unset($data['formatTeachers']);
        $dd =   ExamRoutine::create($data);
        foreach ($teacherData as  $value) {
            $value['routine_id'] = $dd->id;
            TeacherExamRoutine::create([
                'routine_id' => $dd->id,
                'teacher_name' => $value['teacher_name'],
                'teacher_id' => $value['teacher_id'],
            ]);
        }
        return $dd;

    }
    public function admin_exam_routine_delete(Request $request){
        return  ExamRoutine::where('id', $request->id)->delete();
    }

    public function student_class_routine(Request $request){
        $batch = Auth::user()->batch;
        $query =  ClassRoutine::where('batch_name',$batch)->orderBy('id', 'asc');
        return $query->paginate(10);
    }
    public function student_exam_routine(Request $request){
        $batch = Auth::user()->batch;
        $query =  ExamRoutine::with('teachers')->where('batch_name',$batch)->orderBy('id', 'asc');
        return $query->paginate(10);
    }
    public function teacher_class_routine(Request $request){
        $batch = Auth::user()->name;
        $query =  ClassRoutine::where('teacher_name',$batch)->orderBy('id', 'asc');
        return $query->paginate(10);
    }
    public function teacher_exam_routine(Request $request){
        $id = Auth::user()->id;
        $query =  ExamRoutine::with('teachers')->whereHas('teachers', function ($query) use ($id){
            $query->where('teacher_id',$id);
        });
        return $query->paginate(10);
    }
    public function all_teachers(Request $request){
        return  User::where('userType', "Teacher")->get();
    }




    public function admin_notice(Request $request){       
        return Notice::orderBy('id','desc')->paginate(10);
    }
    public function admin_notice_add(Request $request){       
        $data = $request->all();
        return  Notice::create($data);
    }
    public function admin_notice_delte(Request $request){
        return  Notice::where('id', $request->id)->delete();
    }



    public function all_course(Request $request){
        return  Course::all();
    }
    public function all_course_add(Request $request){
        $data = $request->all();
        return  Course::create($data);
    }
    public function all_course_edit(Request $request){
        $data = $request->all();
        return  Course::where('id',$data['id'])->update($data);
    }
    public function all_course_delete(Request $request){
        return  Course::where('id', $request->id)->delete();
    }


    public function all_department(Request $request){
        return  Department::all();
    }
    public function all_department_add(Request $request){
        $data = $request->all();
        return  Department::create($data);
    }
    public function all_department_edit(Request $request){
        $data = $request->all();
        return  Department::where('id',$data['id'])->update($data);
    }
    public function all_department_delete(Request $request){
        return  Department::where('id', $request->id)->delete();
    }


    public function all_batch(Request $request){
        return  Batch::all();
    }
    public function all_batch_add(Request $request){
        $data = $request->all();
        return  Batch::create($data);
    }
    public function all_batch_edit(Request $request){
        $data = $request->all();
        return  Batch::where('id',$data['id'])->update($data);
    }
    public function all_batch_delete(Request $request){
        return  Batch::where('id', $request->id)->delete();
    }

    public function all_semester(Request $request){
        return  Semester::all();
    }
    public function all_semester_add(Request $request){
        $data = $request->all();
        return  Semester::create($data);
    }
    public function all_semester_edit(Request $request){
        $data = $request->all();
        return  Semester::where('id',$data['id'])->update($data);
    }
    public function all_semester_delete(Request $request){
        return  Semester::where('id', $request->id)->delete();
    }


    public function all_rooms(Request $request){
        return  Room::all();
    }
    public function all_rooms_add(Request $request){
        $data = $request->all();
        return  Room::create($data);
    }
    public function all_rooms_edit(Request $request){
        $data = $request->all();
        return  Room::where('id',$data['id'])->update($data);
    }
    public function all_rooms_delete(Request $request){
        return  Room::where('id', $request->id)->delete();
    }

    public function all_teacher_course(Request $request){
        return  TeacherCourse::all();
    }
    public function all_teacher_course_add(Request $request){
        $data = $request->all();
        return  TeacherCourse::create($data);
    }
    public function all_teacher_course_edit(Request $request){
        $data = $request->all();
        return  TeacherCourse::where('id',$data['id'])->update($data);
    }
    public function all_teacher_course_delete(Request $request){
        return  TeacherCourse::where('id', $request->id)->delete();
    }
}
