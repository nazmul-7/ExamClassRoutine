<?php

namespace App\Http\Controllers;
use App\Order;
use App\CustomOrder;

use Illuminate\Http\Request;

class OrderController extends Controller
{
    // public $MAIN_SITE = env('MAIN_SITE','https://kerpinkdigital.com');
    public function getAllOrder(Request $request){
        $total = $request->total;
        $data = Order::with('customer', 'service')->orderBy('id','desc');
        return $data->paginate($total);
    }
    public function storeOrder(Request $request){
        $data = $request->all();
        $createData = Order::create($data);
        $result = Order::where('id', $createData->id)->with('customer', 'service')->first();
        return $result;
    }
    public function editOrder(Request $request){ 
        $update= Order::where('id', $request->id)->update([
            'status' => $request->status,
            'service_id' => $request->service_id,
            'customer_id' => $request->customer_id,
            'price' => $request->price,
        ]); 
        if($update == 1){
            $result = Order::where('id', $request->id)->with('customer', 'service')->first();
            return $result;
        } else{
            return response()->json([
                'msg' => "Something went wrong!",
                'success' => false
            ],400);
        }   
    }
    public function delete_Order(Request $request){
        $data = $request->all();
        $dd = Order::where('id',$data['id'])->delete();
        return $dd;
    }

        // custom orders
        public function addCustomOrders(Request $request){
            $data = $request->all();
            $code = \Str::random();
            $data['link'] = "https://kerpinkdigital.com/custom_order_payment/$code";
            $data['code'] = $code;
           return CustomOrder::create($data);
        }
    
        public function showCustomOrders(Request $request){
            $total = $request->total ? $request->total : 10;
            $data = CustomOrder::orderBy('id','desc');
            return $data->paginate($total);
        }
    
        public function editCustomOrders(Request $request){
            $data = $request->all();
            return CustomOrder::where('id', $request->id)->update($data);     
        }
    
        public function deleteCustomOrders(Request $request){
            $data = $request->all();
            return CustomOrder::where('id',$data['id'])->delete();
        }
        
}
