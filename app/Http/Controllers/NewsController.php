<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class NewsController extends Controller
{
    private $news;
    public function __construct(News $news){
        $this->news = $news;
    }

    public function create(){
        return view('admin.news.add');
    }

    public function store(Request $res){
        $this->validate($res,
            ['name' => 'required'],
            ['name.required' => 'Tên danh mục không được bỏ trống']
        );
        $this->news->create([
            'name'  =>  $res->name,
            'slug'  =>  Str::slug($res->name)
        ]);
        return redirect()->route('news.list')->with(['flash_level' => 'success', 'flash_message' => 'Thêm danh mục tin thành công !']);
    }

    public function list(){
        $data = $this->news->all();
        return view('admin.news.list',compact('data'));
    }

    public function edit($id){
        $data = $this->news->find($id);
        return view('admin.news.edit',compact('data'));
    }

    public function update(Request $res, $id){
        $this->validate($res,
            ['name' => 'required'],
            ['name.required' => 'Tên danh mục không được bỏ trống']
        );
        $this->news->find($id)->update([
            'name'  =>  $res->name,
            'slug'  =>  Str::slug($res->name)
        ]);
        return redirect()->route('news.list')->with(['flash_level' => 'success', 'flash_message' => 'Sửa danh mục thành công !']);
    }

    public function delete($id){
        $this->news->find($id)->delete();
        return redirect()->route('news.list')->with(['flash_level' => 'success', 'flash_message' => 'Danh mục đã được xóa']);
    }
}
