
@extends('admin.layouts.admin')

@section('title','Ivy Moda')
@section('controller','List Category')
@section('action','Danh sách')
@section('content')

<!-- Main content -->
<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <a href="{{ route('size.add') }}" class="btn btn-success">Add</a>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Size</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  @foreach($data as $item)
                    
                  <tr>
                    <td>{{ $item['name'] }}</td>
                    
                    <td><a href="{{ route('size.edit', ['id'=>$item['id']]) }}"><i class="fas fa-pen"></i></a> <span style="padding: 10px">|</span>
                      <a href="{{ route('size.delete',['id'=>$item['id']]) }}" onclick="return confirm('Bạn chắc muốn xóa mã size này ?')" style="color:red"><i class="fas fa-light fa-trash"></i></a></td>
                  </tr>
                  @endforeach
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>

@endsection
@section('script')
<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
@endsection