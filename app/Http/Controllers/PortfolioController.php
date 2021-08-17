<?php

namespace App\Http\Controllers;
use App\Portfolio;
use Illuminate\Http\Request;

class PortfolioController extends Controller
{
    public function getAllPortfolio(Request $request){
        $total = $request->total;
        $data = Portfolio::orderBy('id','desc');
        return $data->paginate($total);
    }
    public function storePortfolio(Request $request){
        $data = $request->all();
        return Portfolio::create($data);
        // $result = Portfolio::where('id', $createData->id)->first();
        // return $result;
    }
    public function editPortfolio(Request $request){ 
        $update= Portfolio::where('id', $request->id)->update([
            'title' => $request->title,
            'image' => $request->image,
            'description' => $request->description,
        ]); 
        if($update == 1){
            $result = Portfolio::where('id', $request->id)->first();
            return $result;
        } else{
            return response()->json([
                'msg' => "Something went wrong!",
                'success' => false
            ],400);
        }   
    }
    public function delete_Portfolio(Request $request){
        $data = $request->all();
        $dd = Portfolio::where('id',$data['id'])->delete();
        return $dd;
    }
}
