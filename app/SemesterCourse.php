<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SemesterCourse extends Model
{
    protected $fillable = [
        'semester_name','course_name',
        'semester_id','course_id'
    ];
}
