<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\SizeController;
use App\Http\Controllers\ColorController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\PostsController;
use App\Http\Controllers\SlideController;
use App\Http\Controllers\ParameterController;
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
	Route::group(['prefix' => 'news'], function () {
		Route::get('/list', [NewsController::class, 'list'])->name('news.list');
		Route::get('/create', [NewsController::class, 'create'])->name('news.add');
		Route::post('/store', [NewsController::class, 'store'])->name('news.store');
		Route::get('/edit/{id}', [NewsController::class, 'edit'])->name('news.edit');
		Route::post('/update/{id}',[NewsController::class, 'update'])->name('news.update');
		Route::get('/delete/{id}', [NewsController::class, 'delete'])->name('news.delete');
	});
	Route::group(['prefix' => 'posts'], function () {
		Route::get('/list', [PostsController::class, 'list'])->name('posts.list');
		Route::get('/create', [PostsController::class, 'create'])->name('posts.add');
		Route::post('/store', [PostsController::class, 'store'])->name('posts.store');
		Route::get('/edit/{id}', [PostsController::class, 'edit'])->name('posts.edit');
		Route::post('/update/{id}',[PostsController::class, 'update'])->name('posts.update');
		Route::get('/delete/{id}', [PostsController::class, 'delete'])->name('posts.delete');
	});
	Route::group(['prefix' => 'slides'], function () {
		Route::get('/list', [SlideController::class, 'list'])->name('slides.list');
		Route::get('/create', [SlideController::class, 'create'])->name('slides.add');
		Route::post('/store', [SlideController::class, 'store'])->name('slides.store');
		Route::get('/edit/{id}', [SlideController::class, 'edit'])->name('slides.edit');
		Route::post('/update/{id}',[SlideController::class, 'update'])->name('slides.update');
		Route::get('/delete/{id}', [SlideController::class, 'delete'])->name('slides.delete');
	});
	Route::group(['prefix' => 'parameters'], function () {
		Route::get('/list', [ParameterController::class, 'list'])->name('parameters.list');
		Route::get('/create', [ParameterController::class, 'create'])->name('parameters.add');
		Route::post('/store', [ParameterController::class, 'store'])->name('parameters.store');
		Route::get('/edit/{id}', [ParameterController::class, 'edit'])->name('parameters.edit');
		Route::post('/update/{id}',[ParameterController::class, 'update'])->name('parameters.update');
		Route::get('/delete/{id}', [ParameterController::class, 'delete'])->name('parameters.delete');
	});
});



