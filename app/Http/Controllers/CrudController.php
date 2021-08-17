<?php

namespace App\Http\Controllers;
use App\Order;
use App\ContactUs;
use App\User;
use DB;
use App\Service;
use Illuminate\Http\Request;

class CrudController extends Controller
{
    public function getcontuct_us(Request $request)
    {       
        return ContactUs::orderBy('id','desc')->with('categories','categories.categoryName')->paginate(10);
    }
    public function msgDelete($id){
        $dd = ContactUs::where('id',$id)->delete();
        return $dd;
    }
    public function getDashboardData(){
                // $newOrder = Order::select(DB::raw ('count(id) as newOrder'))
                //                 ->where('status','Pending')
                //                 ->first();
                $totalOrder = Order::select(DB::raw ('count(id) as totalOrder'))
                                ->first();
                $totalMsg = ContactUs::select(DB::raw ('count(id) as totalMsg'))
                                ->first();
                $totalService = Service::select(DB::raw ('count(id) as totalService'))  
                                 ->first();
                $totalUser = User::select(DB::raw ('count(id) as totalUser'))
                            ->first();
                $latestUser =User::orderBy('id', 'desc')
                                 ->limit(5)
                                 ->get();
                $latestOrder = Order::orderBy('id', 'desc')
                                 ->with('customer', 'service')
                                 ->limit(5)
                                 ->get();
                return response()->json([
                        'totalOrder' => $totalOrder,
                        'totalMsg' => $totalMsg,
                        'totalService' => $totalService,
                        'totalUser' => $totalUser,
                        'latestUser' => $latestUser,
                        'latestOrder' => $latestOrder,
                        'success' => true
                    ],200);
    }
}
