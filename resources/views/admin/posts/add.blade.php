@extends('admin.layouts.admin')

@section('title','Add Post')
@section('controller','Create Post')
@section('action','Thêm tin')
@section('content')

    <section class="content">
      <div class="container-fluid">
      	<form action="{{ route('posts.store') }}" method="post" enctype="multipart/form-data">
      		@csrf
      		<div class="row">
	          <div class="col-md-12">
              @include('admin.patials.error')
	            <div class="card card-info">
	              <div class="card-header">
	                <h3 class="card-title">Thêm Tin</h3>
	              </div>
	              <div class="card-body">
                  <div class="row">
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label>Loại tin</label>
                        <select class="form-control select2" name="news_id" style="width: 100%;">
                          <option selected="selected">---Chọn---</option>
                          @foreach($data as $item)
                          <option value="{{ $item['id'] }}">{{ $item['name'] }}</option>
                          @endforeach
                        </select>
                      </div>
                      <!-- Color Picker -->
                      <div class="form-group">
                        <label>Tiêu đề:</label>
                        <input type="text" name="title" value="{{ old('title') }}" class="form-control my-colorpicker1">
                      </div>
                      <div class="form-group">
                        <label for="exampleFormControlFile1">Hình Ảnh</label>
                        <input type="file" name="news_image" class="form-control-file" id="exampleFormControlFile1">
                      </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                      <div class="form-group">
                        <label>Seo title:</label>
                        <input type="text" name="seo_title" value="{{ old('seo_title') }}" class="form-control my-colorpicker1">
                      </div>
                      <div class="form-group">
                        <label>Seo key:</label>
                        <input type="text" name="seo_key" value="{{ old('seo_key') }}" class="form-control my-colorpicker1">
                      </div>
                      <div class="form-group">
                        <label>Seo description:</label>
                        <input type="text" name="seo_des" value="{{ old('seo_des') }}" class="form-control my-colorpicker1">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="">
                        <label>Nội dung:</label>
                        <textarea id="summernote" name="content" value="{{ old('content') }}" rows=""></textarea>
                      </div>
                      
                    </div>
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

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });

    //Date and time picker
    $('#reservationdatetime').datetimepicker({ icons: { time: 'far fa-clock' } });

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

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