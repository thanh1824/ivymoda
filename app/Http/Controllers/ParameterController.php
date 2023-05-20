<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Parameter;

class ParameterController extends Controller
{
    private $para;
    public function __construct(Parameter $para){
        $this->para = $para;
    }

    public function create(){
        return view('admin.parameters.add');
    }

    public function store(Request $res){
        $this->validate($res,
            ['name' => 'required'],
            ['name.required' => 'Bạn chưa nhập tên thông số']
        );
        $this->para->create([
            'name'  =>  $res->name,
        ]);
        return redirect()->route('parameters.list')->with(['flash_level' => 'success', 'flash_message' => 'Thêm mới một thông số thành công !']);
    }

    public function list(){
        $data = $this->para->all();
        return view('admin.parameters.list',compact('data'));
    }

    public function edit($id){
        $data = $this->para->find($id);
        return view('admin.parameters.edit',compact('data'));
    }

    public function update(Request $res, $id){
        $this->validate($res,
            ['name' => 'required'],
            ['name.required' => 'Bạn chưa nhập tên thông số']
        );
        $this->para->find($id)->update([
            'name'  =>  $res->name,
        ]);
        return redirect()->route('parameters.list')->with(['flash_level' => 'success', 'flash_message' => 'Sửa thông số thành công !']);
    }

    public function delete($id){
        $this->para->find($id)->delete();
        return redirect()->route('parameters.list')->with(['flash_level' => 'success', 'flash_message' => 'Thông số đã được xóa']);
    }
}
