<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TeacherCourse extends Model
{
    protected $fillable = [
        'teacher_name','course_name',
        'teacher_id','course_id'
    ];
}
