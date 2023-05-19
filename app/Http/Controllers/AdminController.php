<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function loginAdmin(){
    	if (auth()->check()) {
    		return redirect()->to('quan-tri-he-thong');
    	}
    	return view('admin.login');
    }

    public function postLoginAdmin(Request $res){
    	$remember = $res->has('remember_me') ? true : false;
    	if(auth()->attempt([
    		'email'	=>	$res->email,
    		'password'	=>	$res->password
    	],$remember)){
    		return redirect()->to('quan-tri-he-thong');
    	}else{
    		return redirect()->back();
    	}
    }
}
