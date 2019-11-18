<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::post('auth/loginadmin', 'UserController@loginadmin');
Route::post('auth/login', 'UserController@login');
Route::get('auth/gedung', 'UserController@gedung');
Route::get('auth/resep', 'UserController@resepsionis');
Route::get('lantai', 'SurveyController@lantai'); 
Route::get('reseps', 'SurveyController@reseps'); 
Route::group(['middleware' => 'jwt.auth'], function () {
     
     Route::get('survey', 'SurveyController@index');
      Route::get('getsaran', 'SurveyController@getsaran');
     
     Route::post('sendjwb', 'SurveyController@sendjwb');
      Route::post('sendsaran', 'SurveyController@sendsaran'); 
     
    
     Route::post('auth/logout', 'UserController@logout');

     Route::post('ruangan', 'SurveyController@ruangan');
     Route::post('resepsionis', 'SurveyController@resepsionis');
     Route::post('pertanyaan', 'SurveyController@pertanyaan');

        
     Route::post('auth/logoutadmin', 'UserController@logoutadmin');

     Route::get('lokasi', 'SurveyController@lokasi');
     Route::post('addlokasi', 'SurveyController@addlokasi');
     Route::post('updatelokasi', 'SurveyController@updatelokasi');
     Route::post('destroylokasi', 'SurveyController@destroylokasi');


     Route::get('resep', 'SurveyController@resep');
     Route::post('addresep', 'SurveyController@addresep');
     Route::post('updateresep', 'SurveyController@updateresep');
     Route::post('destroyresep', 'SurveyController@destroyresep');



     Route::get('soal', 'SurveyController@soal');
     Route::post('addsoal', 'SurveyController@addsoal');
     Route::post('updatesoal', 'SurveyController@updatesoal');
     Route::post('destroysoal', 'SurveyController@destroysoal');

      Route::get('admin', 'SurveyController@admin');
     Route::post('addadmin', 'SurveyController@addadmin');
     Route::post('updateadmin', 'SurveyController@updateadmin');
     Route::post('destroyadmin', 'SurveyController@destroyadmin');

     Route::get('saran', 'SurveyController@saran');
     Route::post('addsaran', 'SurveyController@addsaran');
     Route::post('updatesaran', 'SurveyController@updatesaran');
     Route::post('destroysaran', 'SurveyController@destroysaran');  

     Route::post('reportpasienrep', 'SurveyController@reportpasienrep');
     Route::post('reportpasienlok', 'SurveyController@reportpasienlok'); 
});

//Route::get('member', 'MemberController@register');


