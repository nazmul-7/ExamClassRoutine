<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CustomOrder extends Model
{
    protected $fillable = [
        "customer_name",
        "company",
        "description",
        "price",
        "link",
        "code",
        "status",
        "click_count", 
    ];
}
