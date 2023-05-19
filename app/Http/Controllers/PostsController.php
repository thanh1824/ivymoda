<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\TinTuc;
use App\Models\News;

class PostsController extends Controller
{
    private $post;
    public function __construct(TinTuc $post){
        $this->post = $post;
    }

    public function create(){
        return view('admin.posts.add');
    }

    public function store(Request $res){
        $this->post->create([
            'name'  =>  $res->name,
            'slug'  =>  Str::slug($res->name)
        ]);
        return redirect()->route('posts.list');
    }

    public function list(){
        $data = $this->post->all();
        return view('admin.posts.list',compact('data'));
    }

    public function edit($id){
        $data = $this->post->find($id);
        return view('admin.posts.edit',compact('data'));
    }

    public function update(Request $res, $id){
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
