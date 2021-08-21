<?php

use App\Http\Middleware\AdminCheck;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/app/admin/all_batch', 'HomeController@all_batch');
Route::get('/app/admin/all_department', 'HomeController@all_department');

Route::prefix('app')->middleware([AdminCheck::class])->group(function(){
     
    //User
    Route::get('all_user', 'UserController@all_user');
    
    Route::post('user_delete', 'UserController@user_delete');
    Route::put('user/{id}', 'UserController@userTypeChange');
    Route::post('changePassword', 'UserController@changePassword');
    
    //contuct_us

    //profile
    Route::get('profileData', 'UserController@profileData');
    Route::put('adminInfoUpdate/{id}', 'UserController@adminInfoUpdate');
    Route::put('adminPasswordUpdate/{id}', 'UserController@adminPasswordUpdate');
    Route::put('addProfilePicture/{id}', 'UserController@addProfilePicture');
    


    // ------------------------------------------------------------------------------------------------

   

    // New Routes

     // Authentication Routes
     Route::post('/admin_login', 'HomeController@adminLogin');
     Route::post('/admin_registration', 'HomeController@adminRegistration');


    Route::get('getDashboardData', 'HomeController@getDashboardData');
    Route::get('all_user_pagi', 'HomeController@all_user_pagi');
    Route::get('/admin/class_routine', 'HomeController@admin_class_routine');
    Route::post('/admin/class_routine/store', 'HomeController@admin_class_routine_store');
    Route::post('/admin/class_routine/delete', 'HomeController@admin_class_routine_delete');

    Route::get('/admin/notice', 'HomeController@admin_notice');
    Route::post('/admin/notice/add', 'HomeController@admin_notice_add');
    Route::post('admin/notice/delete', 'HomeController@admin_notice_delte');

    Route::get('/admin/all_teachers', 'HomeController@all_teachers');
    Route::get('/admin/all_course', 'HomeController@all_course');
 

    // Teacher Routes
    Route::get('/teacher/class_routine', 'HomeController@teacher_class_routine');
    
    // Student Routes
    Route::get('/student/class_routine', 'HomeController@student_class_routine');




});


Route::get('/logout', 'HomeController@logout');
Route::get('/', 'HomeController@index');
Route::any('{slug}', 'HomeController@index');
