<?php
 
namespace App\Http\Controllers;
use App\User;
use App\EmailOpt;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class Usercontroller extends Controller
{
    public function all_user(Request $request){
        return User::all();
    }
    public function all_user_pagi(Request $request){
        $total = $request->total;
        $searchString = $request->email;
        $query =  User::where(function ($query) use ($searchString){
            $query->orWhere('email',  'like', "%$searchString%");
        });
        return $query->orderBy('id', 'desc')->paginate($total);
    }
    
    public function userTypeChange(Request $request, $id){
        return User::where('id',$request->id)->update(['userType'=> $request->userType]);        
    }
    public function adminInfoUpdate(Request $request, $id){
        if($request->id == Auth::user()->id){
            $data = $request->all();
            $user = Auth::user();
            if($user->email != $data['email'] ){
                $validator = Validator::make($request->all(), [ 
                    'email' => 'required|string|email|max:255|unique:users',
                ]);
                if($validator->fails()){
                    return response()->json($validator->errors(), 422);
                }
            }
            $result = User::where('id',Auth::user()->id)->update( $request->all()); 
            if($result)
            return  User::where('id',Auth::user()->id)->first();     
        }
        else{
            return response()->json([
                'msg' => "You are not authorised!",
                'success' => false
            ],422);
        }
    }
    public function addProfilePicture(Request $request, $id){
        if($request->id == Auth::user()->id){
             $result = User::where('id',Auth::user()->id)->update([
                'image' => $request->image,
             ]); 
            if($result)
            return  User::where('id',Auth::user()->id)->first();       
        }
        else{
            return response()->json([
                'msg' => "You are not authorised!",
                'success' => false
            ],422);
        }
    }
    public function adminPasswordUpdate(Request $request, $id){
        $data = $request->all();
        $currentPassword = $request->currentPassword;
        //$authPass = Auth::user()->makeVisible('password');
       if($request->id == Auth::user()->id){
        if(!Hash::check ($currentPassword , Auth::user()->password)){
            return response()->json([
                'msg' => "Current password doesn't match. Please try again!",
                'success' => false
            ],422);
        }else {
            if( $data['password'] == $data['confirmPassword']){
                unset($data['currentPassword']);
                unset($data['confirmPassword']);
                $validator = Validator::make($request->all(), [ 
                    'password' => 'required|string|min:6|max:20',
                ]);
                if($validator->fails()){
                    return response()->json($validator->errors(), 422);
                }
                $data['password'] = Hash::make($request->password);
                return User::where('id',Auth::user()->id)->update($data);
            }else{
                return response()->json([
                    'msg' => "Password doesn't match. Please try again!",
                    'success' => false
                ],422);
            }
        }
       }
       else{
        return response()->json([
            'msg' => "You are not authorised!",
            'success' => false
        ],422);
       }
    }
    public function profileData(){
        return User::where('id',Auth::user()->id)->first();        
    }
    public function user_delete(Request $request){
        $data = $request->all();
        User::where('id',$data['id'])->delete();
        $total = $request->total;
        $dataaa = User::orderBy('id','desc');
        return $dataaa->paginate($total);
    }
    public function changePassword(Request $request){
        $data = $request->all();
        $user = Auth::user();
       
        if(!Hash::check($request->current_password, $user->password)){
            return response()->json([
                'msg' => 'Old password is not correct.',
                'success' => false
            ],401);
        }

        $this->validate($request,[
            'new_password'=>'required|string|min:6'
            ]
        );
        $password = Hash::make($data['new_password']);
    
        $user = User::where('id', $user->id)->update(['password' => $password]);
        return response()->json([
        'user' => $user,
        'success' => true
        ],200);
    }
    public function email_opt(Request $request){
        $allEmail = $request->all();

        $url = env('APP_URL');
        $from_address = env('MAIL_FROM_ADDRESS');
       
        foreach ($allEmail as $allEmailObj) {
            $singleEmail=$allEmailObj;
            $data['msg'] = 'msg';
            \Mail::send('email/email_opt', $data, function ($message) use ($singleEmail,$from_address){
                $message->from($from_address, 'Email');
                $message->to($singleEmail)->subject('Email Opt Out');
            });

        }
    }
    public function email_delete($id)
    {       
        return EmailOpt::where('id',$id)->delete();
    }
    public function all_subscriptions_pagi(Request $request){
        $total = $request->total;
        $data = EmailOpt::orderBy('id','desc');
        return $data->paginate($total);
    }


}
