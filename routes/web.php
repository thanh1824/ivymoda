<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\SizeController;
use App\Http\Controllers\ColorController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/admin', [AdminController::class, 'loginAdmin'])->name('login');
Route::post('/admin',[AdminController::class, 'postLoginAdmin'])->name('post.login');

Route::get('/quan-tri-he-thong', function(){
	return view('admin.home');
});

Route::group(['prefix' => 'quan-tri-he-thong'], function () {
	Route::group(['prefix' => 'categorys'], function () {
		Route::get('/list', [CategoryController::class, 'list'])->name('categorys.list');
		Route::get('/create', [CategoryController::class, 'create'])->name('categorys.add');
		Route::post('/store', [CategoryController::class, 'store'])->name('categorys.store');
		Route::get('/edit/{id}', [CategoryController::class, 'edit'])->name('categorys.edit');
		Route::post('/update/{id}',[CategoryController::class, 'update'])->name('categorys.update');
		Route::get('/delete/{id}', [CategoryController::class, 'delete'])->name('categorys.delete');
	});
	Route::group(['prefix' => 'size'], function () {
		Route::get('/list', [SizeController::class, 'list'])->name('size.list');
		Route::get('/create', [SizeController::class, 'create'])->name('size.add');
		Route::post('/store', [SizeController::class, 'store'])->name('size.store');
		Route::get('/edit/{id}', [SizeController::class, 'edit'])->name('size.edit');
		Route::post('/update/{id}',[SizeController::class, 'update'])->name('size.update');
		Route::get('/delete/{id}', [SizeController::class, 'delete'])->name('size.delete');
	});
	Route::group(['prefix' => 'color'], function () {
		Route::get('/list', [ColorController::class, 'list'])->name('color.list');
		Route::get('/create', [ColorController::class, 'create'])->name('color.add');
		Route::post('/store', [ColorController::class, 'store'])->name('color.store');
		Route::get('/edit/{id}', [ColorController::class, 'edit'])->name('color.edit');
		Route::post('/update/{id}',[ColorController::class, 'update'])->name('color.update');
		Route::get('/delete/{id}', [ColorController::class, 'delete'])->name('color.delete');
	});
});



