<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ClassRoutine extends Model
{
    protected $fillable = [
        'day',
        'start_time',
        'end_time',
        'department_name',
        'teacher_name',
        'batch_name',
        'semister',
        'room',
        'course_name',
    ];
}
