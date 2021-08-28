<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SemesterCourse extends Model
{
    protected $fillable = [
        'semester_name','course_name','teacher_name','room_name',
        'semester_id','course_id','teacher_id','room_id'
    ];
    public function course(){
        return $this->belongsTo('App\Course','course_id');
    }

}
