<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request; 

class CategoryController extends Controller
{
    //
    public function add_category(Request $request){
        $data = $request->all();
        Category::create($data);
        $total = $request->total;
        $dataaa = Category::orderBy('id','desc');
        return $dataaa->paginate($total);
    }

    public function all_category_pagi(Request $request){
        $total = $request->total ? $request->total : 10;
        $data = Category::orderBy('id','desc');
        return $data->paginate($total);
    }

    public function edit_category(Request $request){
        return Category::where('id', $request->id)->update([
            'name' => $request->name
        ]);     
    }

    public function category_delete(Request $request){
        $data = $request->all();
        Category::where('id',$data['id'])->delete();
        $total = $request->total;
        $dataaa = Category::orderBy('id','desc');
        return $dataaa->paginate($total);
    }
    public function all_category(Request $request){
        return Category::all();
    }
      
}
