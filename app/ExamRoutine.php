<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExamRoutine extends Model
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

    public function teachers(){
        return $this->hasMany('App\TeacherExamRoutine','routine_id');
      }
}
