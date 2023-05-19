
@extends('admin.layouts.admin')

@section('title','News Ivy Moda')

@section('content')
<div class="content-wrapper">
<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">Bài viết</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">bài viết</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <a href="{{ route('posts.add') }}" class="btn btn-success">Add</a>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>Tiêu đề</th>
                    <th>Hình Ảnh</th>
                    <th>Thời gian tạo</th>
                    <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  @foreach($data as $item)
                    
                  <tr>
                    <td>{{ $item['title'] }}</td>
                    <td><img src="https://pubcdn.ivymoda.com/files/news/2023/05/06/b49e652f57bb6183634060da67260916jpgjpgjpgjpgjpgjpg.jpg" alt=""></td>
                    <td>20.10.1945</td>
                    <td><a href="{{ route('posts.edit', ['id'=>$item['id']]) }}"><i class="fas fa-pen"></i></a> <span style="padding: 10px">|</span>
                      <a href="{{ route('posts.delete',['id'=>$item['id']]) }}" onclick="alert('Bạn có chắc muốn xóa danh mục này?')" style="color:red"><i class="fas fa-light fa-trash"></i></a></td>
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
    <!-- /.content -->
</div>
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