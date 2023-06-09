@extends('admin.layouts.admin')

@section('title','Add Parameter')
@section('controller','Add Parameter')
@section('action','Thêm')
@section('content')

    <section class="content">
      <div class="container-fluid">
      	<form action="{{ route('parameters.store') }}" method="post">
      		@csrf
      		<div class="row">
	          <div class="col-md-8">
              @include('admin.patials.error')
	            <div class="card card-info">
	              <div class="card-header">
	                <h3 class="card-title">Thêm thông số</h3>
	              </div>
	              <div class="card-body">
	              	
	                <div class="form-group">
	                  <label>Thông số:</label>
	                  <input type="text" name="name" value="{{ old('name') }}" class="form-control my-colorpicker1">
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
	          <div class="col-md-4">
	          </div>
	          <!-- /.col (right) -->
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
  
  
</script>
@endsection