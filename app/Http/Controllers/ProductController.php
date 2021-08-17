<?php

namespace App\Http\Controllers;

use App\Product;
use Carbon\Carbon;
use App\ProductTag;
use App\ProductImage;
use App\Report;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    //
    public function product_add(Request $request){
        $data = $request->all();
        $mdata = $request->all();
        unset($mdata['image']);
        unset($mdata['productTags']);
        $tag =  $data['productTags'];
        $createData = Product::create($mdata);
        // $createData = Product::create([
        //     'title'=>$data['title'],
        //     'description'=>$data['description'], 
        //     'price'=>$data['price'],
        //     'address'=>$data['address'],
        //     'city'=>$data['city'],
        //     // 'state'=>$data['state'],
        //     'zip_code'=>$data['zip_code'],
        //     'category_id'=>$data['category_id'],
        //     'breed_id'=>$data['breed_id'],
        //     'animal_type_id'=>$data['animal_type_id'],
        //     'color'=>$data['color'],
        //     'lat'=>$data['lat'],
        //     'lng'=>$data['lng'],
        //     'gender'=>$data['gender'],
        //     'age'=>$data['age'],
        //     'user_id'=>$data['user_id'],
        // ]);
        $uploadList = $data['image'];
        $size = sizeof($uploadList);
        $allImgItem=[];
        $allTagItem=[];
        if($createData ){
            for($i = 0 ; $i<$size; $i++){
                $ob = ([
                    'product_id' => $createData->id,
                    'image' => $uploadList[$i]['image'],
                ]);
                array_push($allImgItem,$ob);
                
            }
            for($i = 0 ; $i< sizeof($tag); $i++){
                $ob = ([
                    'product_id' => $createData->id,
                    'tag_id' => $tag[$i],
                ]);
                array_push($allTagItem,$ob);
                
            }
        }
        ProductImage::insert($allImgItem);
        ProductTag::insert($allTagItem);
        $total = $request->total;
        $dataaa = Product::with('category','tags','allImages','breed','animal_type')->orderBy('id','desc');
        return $dataaa->paginate($total);
    }
    public function all_ads_pagi(Request $request){
        $total = $request->total;
        $searchString = $request->email;
        $query =  Product::where(function ($query) use ($searchString){
            $query->orWhere('title',  'like', "%$searchString%");
            $query->orWhere('id',  'like', "%$searchString%");
        });
        return $query->with('category','allImages' ,'tags','breed','animal_type')->orderBy('id', 'desc')->paginate($total);
        
    } 
    public function productStatus(Request $request, $id){
        $product = Product::where('id',$request->id)->first();
        $updateData['status'] = $request->status;
        if($product->isFeatured == 1 && $request->status == 'Approved' && $product->isActive == 1){
            $date =  Carbon::now();
            $updateData['activated_at'] = $date->toDateTimeString();
        }
        return Product::where('id',$request->id)->update($updateData);        
    }
    public function count_pending_list(){
        return Product::where('status','Pending')->count();
    }
    public function product_edit(Request $request){
        $data = $request->all();
        $tag =  $data['productTags'];
        $uploadList = $data['uploadList'];
        unset($data['uploadList']);
        unset($data['productTags']);
        $list = [];
        $ProductTaglist = [];
       
        foreach ($uploadList as $value) {
            $ob = ([ 
                'product_id' => $request->id,
                'image' => $value['image'],
            ]);
            array_push($list,$ob);
            
        }
        foreach ($tag as $value) {
            $ob = ([
                'product_id' => $request->id,
                'tag_id' => $value,
            ]);
            array_push($ProductTaglist,$ob);
            
        }
        ProductTag::where('product_id',$request->id)->delete();
        ProductImage::where('product_id',$request->id)->delete();
        ProductImage::insert($list);
        ProductTag::insert($ProductTaglist);
        Product::where('id', $request->id)->update($data);  
        return Product::with('category','tags','allImages','breed','animal_type')->where('id', $request->id)->first(); 
    }
    public function featured_product_edit(Request $request){
        $data = $request->all();
        $tag =  $data['productTags'];
        $uploadList = $data['uploadList'];
        unset($data['uploadList']);
        unset($data['productTags']);
        $list = [];
        $ProductTaglist = [];
       
        foreach ($uploadList as $value) {
            $ob = ([ 
                'product_id' => $request->id,
                'image' => $value['image'],
            ]);
            array_push($list,$ob);
            
        }
        foreach ($tag as $value) {
            $ob = ([
                'product_id' => $request->id,
                'tag_id' => $value,
            ]);
            array_push($ProductTaglist,$ob);
            
        }
        ProductTag::where('product_id',$request->id)->delete();
        ProductImage::where('product_id',$request->id)->delete();
        ProductImage::insert($list);
        ProductTag::insert($ProductTaglist);
        Product::where('id', $request->id)->update($data);  
        return Product::where('isFeatured',1)->with('category','tags','allImages','breed','animal_type')->where('id', $request->id)->first(); 
    }

    public function product_delete(Request $request){
        $data = $request->all();
        Product::where('id',$data['id'])->delete();
        $total = $request->total;
        $dataaa = Product::with('category','tags','allImages','breed','animal_type')->orderBy('id','desc');
        return $dataaa->paginate($total);
    }
    public function product_deleteV2(Request $request){
        $data = $request->all();
        $p = Product::where('id',$data['product_id'])->delete();
        Report::where('id',$data['id'])->delete();
        return $p;
    }
    public function featured_product_delete(Request $request){
        $data = $request->all();
        Product::where('id',$data['id'])->delete();
        $total = $request->total;
        $dataaa = Product::where('isFeatured',1)->with('category','tags','allImages','breed','animal_type')->orderBy('id','desc');
        return $dataaa->paginate($total);
    }
}
