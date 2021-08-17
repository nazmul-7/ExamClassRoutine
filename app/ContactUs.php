<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ContactUs extends Model
{
    protected $fillable = [
        "first_name",
        "last_name",
        "email",
        "phone",
        "company_name",
        "current_website",
        "city",
        "state",
        "note"  
    ];
    public function categories(){
        return $this->hasMany('App\SelectedCategory');
    } 
}
