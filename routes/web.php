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

Route::prefix('app')->middleware([AdminCheck::class])->group(function(){
   
 
    
   

    //Category
    Route::post('add_category', 'CategoryController@add_category');
    Route::post('edit_category', 'CategoryController@edit_category');
    Route::post('category_delete', 'CategoryController@category_delete');
    Route::get('all_category_pagi', 'CategoryController@all_category_pagi');
    Route::get('all_category', 'CategoryController@all_category');

    //Service
    Route::post('storeService', 'ServiceController@storeService');
    Route::post('editService', 'ServiceController@editService');
    Route::post('delete_service', 'ServiceController@delete_service');
    Route::get('getAllService', 'ServiceController@getAllService');
    Route::get('all_service', 'ServiceController@all_service');
    //Order
    Route::post('storeOrder', 'OrderController@storeOrder');
    Route::post('editOrder', 'OrderController@editOrder');
    Route::post('delete_Order', 'OrderController@delete_Order');
    Route::get('getAllOrder', 'OrderController@getAllOrder');
    //Customer orders
    Route::get('customOrders','OrderController@showCustomOrders');
    Route::post('customOrders','OrderController@addCustomOrders');
    Route::put('customOrders','OrderController@editCustomOrders');
    Route::post('delcustomOrders/{id}','OrderController@deleteCustomOrders');

    
    //Portfolio
    Route::post('storePortfolio', 'PortfolioController@storePortfolio');
    Route::post('editPortfolio', 'PortfolioController@editPortfolio');
    Route::post('delete_Portfolio', 'PortfolioController@delete_Portfolio');
    Route::get('getAllPortfolio', 'PortfolioController@getAllPortfolio');

     
    //User
    Route::get('all_user', 'UserController@all_user');
    
    Route::post('user_delete', 'UserController@user_delete');
    Route::put('user/{id}', 'UserController@userTypeChange');
    Route::post('changePassword', 'UserController@changePassword');
    
    //contuct_us
    Route::get('contuct_us', 'CrudController@getcontuct_us');
    Route::delete('msgDelete/{id}', 'CrudController@msgDelete');
    //profile
    Route::get('profileData', 'UserController@profileData');
    Route::put('adminInfoUpdate/{id}', 'UserController@adminInfoUpdate');
    Route::put('adminPasswordUpdate/{id}', 'UserController@adminPasswordUpdate');
    Route::put('addProfilePicture/{id}', 'UserController@addProfilePicture');
    //getDashboardData
    Route::get('getDashboardData', 'CrudController@getDashboardData');


    // ------------------------------------------------------------------------------------------------

    // Authentication Routes
    Route::post('/admin_login', 'AdminController@adminLogin');
    Route::post('/admin_registration', 'AdminController@adminRegistration');

    // New Routes
    Route::get('getDashboardData', 'HomeController@getDashboardData');
    Route::get('all_user_pagi', 'HomeController@all_user_pagi');
    Route::get('/admin/class_routine', 'HomeController@admin_class_routine');
    Route::post('/admin/class_routine/store', 'HomeController@admin_class_routine_store');
    Route::post('/admin/class_routine/delete', 'HomeController@admin_class_routine_delete');

    Route::get('/admin/all_teachers', 'HomeController@all_teachers');
    Route::get('/admin/all_batch', 'HomeController@all_batch');
    Route::get('/admin/all_course', 'HomeController@all_course');
    Route::get('/admin/all_department', 'HomeController@all_department');



});

Route::post('/uploadCategory', 'AdminController@uploadCategory');

Route::get('/logout', 'AdminController@logout');

Route::get('/', 'AdminController@index');
Route::any('{slug}', 'AdminController@index');
