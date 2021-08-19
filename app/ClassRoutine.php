<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClassRoutine extends Model
{
    protected $fillable = [
        'day',
        'time',
        'department_name',
        'teacher_name',
        'batch_name',
        'semister',
        'room',
        'course_name',
    ];
}
