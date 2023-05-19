<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\TinTuc;
use App\Models\News;
use App\Http\Requests\Posts;
use App\Http\Requests\EditPost;

class PostsController extends Controller
{
    private $post;
    public function __construct(TinTuc $post){
        $this->post = $post;
    }

    public function create(){
        $data = News::select('id','name')->get();
        return view('admin.posts.add',compact('data'));
    }

    public function store(Posts $res){
        $file = $res->file('news_image');
        $img_name = $file->getClientOriginalName();
        $path = $res->file('news_image')->storeAs('uploads/news',$img_name);
        
        $this->post->create([
            'title'  =>  $res->title,
            'slug'  =>  Str::slug($res->title),
            'image' =>  $img_name,
            'content'   =>  $res->content,
            'news_id'   =>  $res->news_id,
            'seo_title' =>  $res->seo_title,
            'seo_key'   =>  $res->seo_key,
            'seo_des'   =>  $res->seo_des

        ]);
        return redirect()->route('posts.list')->with(['flash_level' => 'success', 'flash_message' => 'Thêm tin thành công !']);
    }

    public function list(){
        $data = $this->post->all();
        return view('admin.posts.list',compact('data'));
    }

    public function edit($id){
        $news = News::select('id','name')->get();
        $data = $this->post->find($id);
        return view('admin.posts.edit',compact('data','news'));
    }

    public function update(EditPost $res, $id){
        $this->post->find($id)->update([
            'name'  =>  $res->name,
            'slug'  =>  Str::slug($res->name)
        ]);
        return redirect()->route('posts.list');
    }

    public function delete($id){
        $this->post->find($id)->delete();
        return redirect()->route('posts.list');
    }
}
