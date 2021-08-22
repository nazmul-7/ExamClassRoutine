<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TeacherExamRoutine extends Model
{
    protected $fillable = [
        'teacher_name',
        'teacher_id',
        'routine_id'
    ];
}
