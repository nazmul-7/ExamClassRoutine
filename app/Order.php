<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $fillable = [
         "status",
        "customer_id",
        "service_id",
        "price",
    ];
    public function customer(){
        return $this->belongsto('App\User');
    } 
    public function service(){
        return $this->belongsTo('App\Service');
    } 
}
