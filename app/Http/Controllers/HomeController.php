<?php

namespace App\Http\Controllers;
use App\Order;
use App\ContactUs;
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
}
