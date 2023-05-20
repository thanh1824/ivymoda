@extends('admin.layouts.admin')

@section('title','Add Slide')
@section('controller','Edit Slide')
@section('action','Sửa slide')
@section('content')

    <section class="content">
      <div class="container-fluid">
        <form action="{{ route('slides.update',['id'=>$data->id]) }}" method="post" enctype="multipart/form-data">
          @csrf
          <div class="row">
            <div class="col-md-12">
              @include('admin.patials.error')
              <div class="card card-info">
                <div class="card-header">
                  <h3 class="card-title">Sửa Slide</h3>
                </div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-6 col-sm-12">
                      
                      <!-- Color Picker -->
                      <div class="form-group">
                        <label>Tiêu đề:</label>
                        <input type="text" name="title" value="{{ old('title',isset($data) ? $data->title : null) }}" class="form-control my-colorpicker1">
                      </div>
                      <div class="form-group">
                          <label>Hình hiện tại</label>
                          <img src="{{ asset($data->image) }}" width="150px" class="img-responsive">
                          <input type="hidden" name="fImageCurrent" value="{!! $data->image !!}">
                      </div>
                      <div class="form-group">
                        <label for="exampleFormControlFile1">Hình Ảnh</label>
                        <input type="file" name="slide_image" class="form-control-file" id="exampleFormControlFile1">
                      </div>
                      <div class="form-group">
                        <label>Link:</label>
                        <input type="text" name="url" value="{{ old('url',isset($data) ? $data->url : null) }}" class="form-control my-colorpicker1">
                      </div>
                    </div>
                     <div class="col-md-6"></div>
                    
                  </div>
                  
                  <div class="form-group">
                    <button class="btn btn-info" type="submit">Submit</button>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->

            </div>
            <!-- /.col (left) -->
            
          </div>
        </form>
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->

@endsection
@section('script')
<!-- Select2 -->
<script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
<!-- Summernote -->
<script src="{{ asset('plugins/summernote/summernote-bs4.min.js') }}"></script>
<!-- CodeMirror -->
<script src="{{ asset('plugins/codemirror/codemirror.js') }}"></script>
<script src="{{ asset('plugins/codemirror/mode/css/css.js') }}"></script>
<script src="{{ asset('plugins/codemirror/mode/xml/xml.js') }}"></script>
<script src="{{ asset('plugins/codemirror/mode/htmlmixed/htmlmixed.js') }}"></script>
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })


    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })

    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    })
  })
  $(function () {
    // Summernote
    $('#summernote').summernote()

    // CodeMirror
    CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
      mode: "htmlmixed",
      theme: "monokai"
    });
  })
  
</script>
@endsection