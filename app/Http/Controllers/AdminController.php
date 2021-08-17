<?php

namespace App\Http\Controllers;

use App\Tag;  
use App\Role;
use App\User;
use App\Colour;
 use App\Breed;
 use App\AnimalType;
use App\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Session;
class AdminController extends Controller
{
    public function add_breeds(Request $request){
        $data = $request->all();
        Breed::create($data);
        $total = $request->total;
        $dataaa = Breed::orderBy('id','desc');
        return $dataaa->paginate($total);
    }

    public function all_breeds_pagi(Request $request){
        $total = $request->total;
        $data = Breed::orderBy('id','desc');
        return $data->paginate($total);
    }

    public function edit_breeds(Request $request){
        return Breed::where('id', $request->id)->update([
            'name' => $request->name,
         ]);     
    }

    public function breeds_delete(Request $request){
        $data = $request->all();
        return Breed::where('id',$data['id'])->delete();
         
    }
    public function all_breeds(Request $request){
        return Breed::all();
    }
    public function add_animalTypes(Request $request){
        $data = $request->all();
        AnimalType::create($data);
        $total = $request->total;
        $dataaa = AnimalType::orderBy('id','desc');
        return $dataaa->paginate($total);
    }

    public function all_animalTypes_pagi(Request $request){
        $total = $request->total;
        $data = AnimalType::orderBy('id','desc');
        return $data->paginate($total);
    }

    public function edit_animalTypes(Request $request){
        return AnimalType::where('id', $request->id)->update([
            'name' => $request->name,
         ]);     
    }

    public function animalTypes_delete(Request $request){
        $data = $request->all();
        return AnimalType::where('id',$data['id'])->delete();
         
    }
    public function all_animalTypes(Request $request){
        return AnimalType::all();
    }
    public function add_colour(Request $request){
        $data = $request->all();
        Colour::create($data);
        $total = $request->total;
        $dataaa = Colour::orderBy('id','desc');
        return $dataaa->paginate($total);
    }

    public function all_colour_pagi(Request $request){
        $total = $request->total;
        $data = Colour::orderBy('id','desc');
        return $data->paginate($total);
    }

    public function edit_colour(Request $request){
        return Colour::where('id', $request->id)->update([
            'name' => $request->name,
         ]);     
    }

    public function colour_delete(Request $request){
        $data = $request->all();
        return Colour::where('id',$data['id'])->delete();
         
    }
    public function all_colour(Request $request){
        return Colour::all();
    }
    public function add_tag(Request $request){
        $data = $request->all();
        Tag::create($data);
        $total = $request->total;
        $dataaa = Tag::orderBy('id','desc');
        return $dataaa->paginate($total);
    }

    public function all_tag_pagi(Request $request){
        $total = $request->total;
        $data = Tag::orderBy('id','desc');
        return $data->paginate($total);
    }

    public function edit_tag(Request $request){
        return Tag::where('id', $request->id)->update([
            'name' => $request->name,
         ]);     
    }

    public function tag_delete(Request $request){
        $data = $request->all();
        return Tag::where('id',$data['id'])->delete();
         
    }
    public function all_tag(Request $request){
        return Tag::all();
    }
    
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

  
   
  
    // public function createUser(Request $request){
    //      // validate request 
    //      $this->validate($request, [
    //         'fullName' => 'required',
    //         'email' => 'bail|required|email|unique:users',
    //         'password' => 'bail|required|min:6',
    //         'role_id' => 'required',
    //     ]);
    //     $password = bcrypt($request->password);
    //     $user = User::create([
    //         'fullName' => $request->fullName,
    //         'email' => $request->email,
    //         'password' => $password,
    //         'userType' => $request->userType,
    //     ]);
    //     return $user;
    // }
    // public function editUser(Request $request){
    //      // validate request 
    //      $this->validate($request, [
    //         'fullName' => 'required',
    //         'email' => "bail|required|email|unique:users,email,$request->id",
    //         'password' => 'min:6',
    //         'userType' => 'required',
    //     ]);
    //     $data = [
    //         'fullName' => $request->fullName,
    //         'email' => $request->email,
    //         'userType' => $request->userType,
    //     ];
    //     if($request->password){
    //         $password = bcrypt($request->password);
    //         $data['password'] = $password;
    //     }
    //     $user = User::where('id', $request->id)->update($data);
    //     return $user;
    // }

    public function getUsers(){
        return User::get();
    }
    public function adminLogin(Request $request){
         // validate request 
         if((User::where('email',$request->email)->count())==0){  
            return response()->json([
                // 'msg'=>"Email doesn't exist!",
                'msg'=>"Incorrect login details!",
            ],401);
        }
        // if((User::where('email',$request->email)->where('isActive',0)->count())==0){
        //     return response()->json([
        //         'msg'=>"Please activated your Account!",
        //     ],401);
        // }
        if((User::where('email',$request->email)->where('userType','Admin')->count())==0){
            return response()->json([
                'msg'=>"Incorrect login details!",
                // 'msg'=>"You don't have authorization!",
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
                'msg' => 'Incorrect login details', 
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

    public function uploadCategory(Request $request){
        $validation = $request->validate([
            'img' => 'required|file|image|mimes:jpeg,png,jpg|max:2048'
            // for multiple file uploads
            // 'photo.*' => 'required|file|image|mimes:jpeg,png,gif,webp|max:2048'
        ]);
        request()->file('img')->store('uploads');
        $pic= $request->img->hashName();
        $url = env('APP_URL');
        $pic= "$url/uploads/$pic";
        // $pic= "/uploads/$pic";
        /*update the profile pic*/
        //return Gallery::create($data); 
        return response()->json([
            'imageUrl'=> $pic
        ],200);
    }
    public function upload(Request $request){
        $this->validate($request, [
            'file' => 'required|mimes:jpeg,jpg,png'
        ]);
        $picName = time().'.'.$request->file->extension();
        $request->file->move(public_path('uploads'),$picName );
        return $picName;
    }
    //Delete image from server
    public function deleteImage(Request $request){
        $fileName = $request->imageName; 
        $this->deleteFileFromServer($fileName, false);
        return 'done';
    }
    public function deleteFileFromServer($fileName, $hasFullPath = false){
        if(!$hasFullPath){
            $filePath = public_path().$fileName;
        }
        if(file_exists($filePath)){
            @unlink($filePath);
        }
        return;
    }

    public function get_settings(Request $request){
        return Setting::all();
     }
     
     public function helpUpdate(Request $request, $id){
             return Setting::where('id',$request->id)->update([
                'description' => $request->description,
             ]);        
    }
      public function editSettings(Request $request){
         $data= $request->all();
         $user = Setting::where('id', $request->id)->update($data);
         return $user;
     }


}


