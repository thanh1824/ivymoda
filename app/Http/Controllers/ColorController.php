<?php

namespace App\Http\Controllers;

use App\Models\Color;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ColorController extends Controller
{
    private $color;
	public function __construct(color $color){
		$this->color = $color;
	}

    public function create(){
    	return view('admin.colors.add');
    }

    public function store(Request $res){
    	$this->color->create([
    		'name'	=>	$res->name,
    		'slug'	=>	Str::slug($res->name)
    	]);
    	return redirect()->route('color.list');
    }

    public function list(){
    	$data = $this->color->all();
    	return view('admin.colors.list',compact('data'));
    }

    public function edit($id){
        $data = $this->color->find($id);
    	return view('admin.colors.edit',compact('data'));
    }

    public function update(Request $res, $id){
        $this->color->find($id)->update([
            'name'  =>  $res->name,
            'slug'  =>  Str::slug($res->name)
        ]);
        return redirect()->route('color.list');
    }

    public function delete($id){
        $this->color->find($id)->delete();
        return redirect()->route('color.list');
    }
}
