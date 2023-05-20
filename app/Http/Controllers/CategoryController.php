<?php

namespace App\Http\Controllers;
use App\Models\Category;
use App\Compoments\Recusive;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
	private $category;
	public function __construct(Category $category){
		$this->category = $category;
	}

    public function getCategory($parentID){
        $data = $this->category->all();
        $recusive = new Recusive($data);
        $htmlOption = $recusive->categoryRecusive($parentID);
        return $htmlOption;
    }

    public function create(){
    	$htmlOption = $this->getCategory($parentID = '');
    	return view('admin.categorys.add', compact('htmlOption'));
    }

    public function store(Request $res){
        $this->validate($res,
            ['name' => 'required'],
            ['name.required' => 'Bạn cần nhập tên danh mục !']
        );
    	$this->category->create([
    		'name'	=>	$res->name,
    		'parent_id'	=>	$res->parent_id,
    		'slug'	=>	Str::slug($res->name)
    	]);
    	return redirect()->route('categorys.list')->with(['flash_level' => 'success', 'flash_message' => 'Thêm danh mục sp thành công !']);
    }

    public function list(){
    	$data = $this->category->all();
    	return view('admin.categorys.list',compact('data'));
    }

    public function edit($id){
        $cate = $this->category->find($id);
        $htmlOption = $this->getCategory($cate->parent_id);
    	return view('admin.categorys.edit',compact('cate','htmlOption'));
    }

    public function update(Request $res, $id){
        $this->validate($res,
            ['name' => 'required'],
            ['name.required' => 'Bạn cần nhập tên danh mục !']
        );
        $this->category->find($id)->update([
            'name'  =>  $res->name,
            'parent_id' =>  $res->parent_id,
            'slug'  =>  Str::slug($res->name)
        ]);
        return redirect()->route('categorys.list')->with(['flash_level' => 'success', 'flash_message' => 'Thêm danh mục sp thành công !']);
    }

    public function delete($id){
        $parent = Category::where('parent_id',$id)->count();
        if ($parent == 0) {
            $this->category->find($id)->delete();
            return redirect()->route('categorys.list')->with(['flash_level' => 'success', 'flash_message' => 'Xóa danh mục sp thành công !']);
        }else{
            return redirect()->route('categorys.list')->with(['flash_level' => 'danger', 'flash_message' => 'Xin lỗi, bạn cần xóa danh mục con trước!']);
        }
        
    }

    
}
