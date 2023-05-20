<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Slide;

class SlideController extends Controller
{
    private $slide;
    public function __construct(Slide $slide){
        $this->slide = $slide;
    }

    public function create(){
        $data = $this->slide->all();
        return view('admin.slides.add',compact('data'));
    }

    public function store(Request $res){
        $this->validate($res,
            ['slide_image' => 'required|image'],
            ['slide_image.required' => 'Hình ảnh không được bỏ trống', 'slide_image.image'  =>  'Ảnh không đúng định dạng']
        );
        $file = $res->file('slide_image');
        $img_name = $file->getClientOriginalName();
        $path = $res->file('slide_image')->storeAs('public/uploads/slides',$img_name);
        $img_url = Storage::url($path);
        $this->slide->create([
            'title'  =>  $res->title,
            'image' =>  $img_url,
            'url'   =>  $res->url

        ]);
        return redirect()->route('slides.list')->with(['flash_level' => 'success', 'flash_message' => 'Thêm slide thành công']);
    }

    public function list(){
        $data = $this->slide->all();
        return view('admin.slides.list',compact('data'));
    }

    public function edit($id){
        $data = $this->slide->find($id);
        return view('admin.slides.edit',compact('data'));
    }

    public function update(Request $res, $id){
        $this->validate($res,
            ['slide_image' => 'image'],
            ['slide_image.image'  =>  'Ảnh không đúng định dạng']
        );
        $data = $this->slide->find($id);
        if(!empty($res->file('slide_image'))){
            $file_name = $res->file('slide_image')->getClientOriginalName();
            $path = $res->file('slide_image')->storeAs('public/uploads/slides',$file_name);
            $img_url = Storage::url($path);
            $data->image = $img_url;
            Storage::disk('public')->delete($data->image);
        }else { echo "không có file"; }
        $data->title    =   $res->title;
        $data->url    =   $res->url;
        $data->save();
        return redirect()->route('slides.list')->with(['flash_level' => 'success', 'flash_message' => 'Sửa Slide thành công !']);
    }

    public function delete($id){
        Storage::disk('public')->delete($this->slide->find($id)->image);
        $this->slide->find($id)->delete();
        return redirect()->route('slides.list')->with(['flash_level' => 'success', 'flash_message' => 'Slide đã được xóa']);
    }
}
