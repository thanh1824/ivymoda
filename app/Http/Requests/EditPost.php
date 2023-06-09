<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EditPost extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'news_id'       =>  'required',
            'title'         =>  'required',
            'content'       =>  'required'
        ];
    }
    public function messages(){
        return [
            'news_id.required'    =>   'Bạn chưa nhập tiêu đề.',
            'news_id.required'   =>   'Bạn chưa chọn loại tin tức.',
            'content.required'     =>   'Bạn chưa nhập nội dung',
        ];
    }
}
