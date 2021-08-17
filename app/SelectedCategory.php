<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SelectedCategory extends Model
{
    protected $fillable = [
        "category_id",
        "contact_us_id", 
    ];	
    public function categoryName(){
        return $this->belongsTo('App\Category', "category_id");
    } 
}
