<?php

namespace App\Http\Controllers;
use DB;
use Session;
use App\User;
use App\Batch;
use App\Course;
use App\Notice;
use App\Department;
use App\ExamRoutine;
use App\ClassRoutine;
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
        return $query->orderBy('id', 'desc')->paginate($total);
    }
    public function admin_class_routine(Request $request){
        $query =  ClassRoutine::orderBy('id', 'desc');
        return $query->paginate(10);
    }
    public function admin_class_routine_store(Request $request){
        $data = $request->all();
        return  ClassRoutine::create($data);
    }
    public function admin_class_routine_delete(Request $request){
        return  ClassRoutine::where('id', $request->id)->delete();
    }
    
    public function admin_exam_routine(Request $request){
        $query =  ExamRoutine::orderBy('id', 'desc');
        return $query->paginate(10);
    }
    public function admin_exam_routine_store(Request $request){
        $data = $request->all();
        return  ExamRoutine::create($data);
    }
    public function admin_exam_routine_delete(Request $request){
        return  ExamRoutine::where('id', $request->id)->delete();
    }

    public function student_class_routine(Request $request){
        $batch = Auth::user()->batch;
        $query =  ClassRoutine::where('batch_name',$batch)->orderBy('id', 'desc');
        return $query->paginate(10);
    }
    public function student_exam_routine(Request $request){
        $batch = Auth::user()->batch;
        $query =  ExamRoutine::where('batch_name',$batch)->orderBy('id', 'desc');
        return $query->paginate(10);
    }
    public function teacher_class_routine(Request $request){
        $batch = Auth::user()->name;
        $query =  ClassRoutine::where('teacher_name',$batch)->orderBy('id', 'desc');
        return $query->paginate(10);
    }
    public function teacher_exam_routine(Request $request){
        $batch = Auth::user()->name;
        $query =  ExamRoutine::where('teacher_name',$batch)->orderBy('id', 'desc');
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
}
