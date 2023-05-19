<?php

namespace App\Http\Controllers;

use App\Models\Size;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class SizeController extends Controller
{
    private $size;
	public function __construct(Size $size){
		$this->size = $size;
	}

    public function create(){
    	return view('admin.sizes.add');
    }

    public function store(Request $res){
    	$this->size->create([
    		'name'	=>	$res->name,
    		'slug'	=>	Str::slug($res->name)
    	]);
    	return redirect()->route('size.list');
    }

    public function list(){
    	$data = $this->size->all();
    	return view('admin.sizes.list',compact('data'));
    }

    public function edit($id){
        $data = $this->size->find($id);
    	return view('admin.sizes.edit',compact('data'));
    }

    public function update(Request $res, $id){
        $this->size->find($id)->update([
            'name'  =>  $res->name,
            'slug'  =>  Str::slug($res->name)
        ]);
        return redirect()->route('size.list');
    }

    public function delete($id){
        $this->size->find($id)->delete();
        return redirect()->route('size.list');
    }
}
