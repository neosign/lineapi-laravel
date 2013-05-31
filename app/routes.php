<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	return View::make('hello');
});

// Route group for API versioning
Route::group(array('prefix' => 'api/v1'), function()
{
    
	Route::resource('user', 'UserController');
	Route::resource('friend', 'FriendController');
	Route::resource('group', 'GroupController');
	Route::resource('message', 'MessageController');
	Route::resource('user.friend', 'FriendController');
	Route::resource('user.message', 'MessageController');
	Route::resource('group.user', 'UserController');
	Route::resource('group.message', 'MessageController');
	
});