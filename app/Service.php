<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $fillable = [
        "categoryName",
        "category_id",
        "description",
        "price",
        "subTitle",
        "title",
        "pages",
        "duration"
    ];
}
