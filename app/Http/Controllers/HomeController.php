<?php

namespace App\Http\Controllers;
use App\Order;
use App\ContactUs;
use App\ClassRoutine;
use App\Batch;
use App\Course;
use App\Department;
use App\User;
use DB;
use App\Service;

use Illuminate\Http\Request;

class HomeController extends Controller
{
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
    public function all_teachers(Request $request){
        return  User::where('userType', "Teacher")->get();
    }
    public function all_batch(Request $request){
        return  Batch::all();
    }
    public function all_course(Request $request){
        return  Course::all();
    }
    public function all_department(Request $request){
        return  Department::all();
    }
}
