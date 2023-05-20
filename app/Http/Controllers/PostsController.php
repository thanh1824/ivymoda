<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\TinTuc;
use App\Models\News;
use App\Http\Requests\Posts;
use App\Http\Requests\EditPost;
use Illuminate\Support\Facades\Storage;
use File;

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
        $path = $res->file('news_image')->storeAs('public/uploads/news',$img_name);
        $img_url = Storage::url($path);
        $this->post->create([
            'title'  =>  $res->title,
            'slug'  =>  Str::slug($res->title),
            'image' =>  $img_url,
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
        $data = $this->post->find($id);
        if(!empty($res->file('news_image'))){
            $file_name = $res->file('news_image')->getClientOriginalName();
            $path = $res->file('news_image')->storeAs('public/uploads/news',$file_name);
            $img_url = Storage::url($path);
            $data->image = $img_url;
            Storage::disk('public')->delete($data->image);
        }else { echo "không có file"; }
        $data->title    =   $res->title;
        $data->slug    =   Str::slug($res->title);
        $data->content    =   $res->content;
        $data->news_id    =   $res->news_id;
        $data->seo_title    =   $res->seo_title;
        $data->seo_key    =   $res->seo_key;
        $data->seo_des    =   $res->seo_des;
        $data->save();
        return redirect()->route('posts.list')->with(['flash_level' => 'success', 'flash_message' => 'Sửa tin thành công !']);
    }

    public function delete($id){
        Storage::disk('public')->delete($this->post->find($id)->image);
        $this->post->find($id)->delete();
        return redirect()->route('posts.list')->with(['flash_level' => 'success', 'flash_message' => 'Tin đã được xóa']);
    }
}
