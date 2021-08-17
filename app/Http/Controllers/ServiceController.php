<?php

namespace App\Http\Controllers;
use App\Service;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
  
class ServiceController extends Controller
{ 
    public function all_service(Request $request){
        return Service::all();
    }
    public function getAllService(Request $request){
     
        $total = $request->total;
        $data = Service::orderBy('id','desc');
        return $data->paginate($total);
    }
    public function storeService(Request $request){
        $data = $request->all();
        $createData = Service::create($data);
        return $createData;
    }
    public function editService(Request $request){
        return Service::where('id', $request->id)->update([
            'title' => $request->title,
            'subTitle' => $request->subTitle,
            'categoryName' => $request->categoryName,
            'category_id' => $request->category_id,
            'description' => $request->description,
            'price' => $request->price,
            'pages' => $request->pages,
            'duration' => $request->duration,
        ]);     
    }
    public function delete_service(Request $request){
        $data = $request->all();
        $dd = Service::where('id',$data['id'])->delete();
        return $dd;
    }

   
}
