<?php
include '../Layouts/header.php';
include '../Layouts/navbar.php';

?>

  <div class="content-wrapper">
    
    <div class="content-header">
      <div class="container">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"> Pengguna</h1>
         
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container">
        <div class="row">
          <!-- /.col-md-6 -->
          <div class="col-lg-12">
            <div class="card">
            <div class="card-header">
                <h3 class="card-title"><b>Data Pengguna</b></h3>

                <div class="card-tools">
                  <button class="btn btn-danger btn-sm "  data-toggle="modal" data-target="#modal-tambah"><i class="fas fa-plus"></i>Tambah Data</button>
</div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>Nama</th>
                      <th>Username</th>
                      <th>Nama Outlet</th>
                      <th>Akses</th>
                      <th style="width: 200px">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php
                    $no = 1;
                    include "../koneksi.php";
                    $tb_user     =mysqli_query($koneksi, "SELECT * FROM tb_user");
                    while($d_tb_user = mysqli_fetch_array($tb_user)){
                        $tb_outlet_d  = mysqli_query($koneksi,"SELECT * FROM tb_outlet where id='$d_tb_user[id_outlet]'");
                        while($d_tb_outlet_d= mysqli_fetch_array($tb_outlet_d )){

                      ?>
                    <tr>
                    <td><?php echo $no++; ?></td>
                      <td><?=$d_tb_user['nama']?></td>
                      <td><?=$d_tb_user['username']?></td>
                      <td><?=$d_tb_outlet_d['nama']?></td>
                      <td><?=$d_tb_user['role']?></td>
                     <td>
                      <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#modal-edit<?php echo $d_tb_user['id']; ?>"><i class="fas fa-edit"></i> Edit</button>
                      <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modal-hapus<?php echo $d_tb_user['id']; ?>"><i class="fas fa-trash"></i> Hapus</button>
                      </td>
                    </tr>

                    <div class="modal fade" id="modal-hapus<?php echo $d_tb_user['id']; ?>">
                    <div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title"><b>Hapus Data Pengguna</b></h4>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">

 <p>Yakin? apakah anda akan menghapus data <b><?php echo $d_tb_user['nama']; ?></b>...?</p>

</div>
<div class="modal-footer justify-content-between">
<button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
<a href="hapus_pengguna.php?id=<?php echo $d_tb_user['id'];?>" class="btn btn-primary">Hapus</a>
</div>
</div>
</div>
</div>

                    <div class="modal fade" id="modal-edit<?php echo $d_tb_user['id']; ?>">>
                    <div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title"><b>Edit Data Pengguna</b></h4>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<form method="post" action="update_pengguna.php">
<div class="modal-body">
<div class="form-group">
    <label>Nama Pengguna</label>
    <input type ="text" name="id"value="<?php echo $d_tb_user['id']; ?>"class="form-control"hidden>
    <input type="text" name="nama" value="<?php $d_tb_user['nama']; ?>" class="form-control" placeholder="Masukkan Nama Pengguna">
</div>
<div class="form-group">
    <label>Username</label>
    <input type="text" name="username" value="<?php $d_tb_user['username']; ?>"class="form-control" placeholder="Masukkan Username">
</div>
<div class="form-group">
    <label>Password</label>
    <input type="password" name="password" class="form-control" placeholder="Masukkan Password" required="">
</div>
<div class="form-group">
<label>Nama Outlet</label>
<select class="form-control" name="id_outlet">
<option>--- Memilih Nama Outlet --</option>
<?php
include "../koneksi.php";
$tb_outlet   =mysqli_query($koneksi, "SELECT * FROM tb_outlet");
while($d_tb_outlet = mysqli_fetch_array($tb_outlet)){
  ?>
  <option value="<?=$d_tb_outlet['id']?>" <?php if($d_tb_outlet['id'] == $d_tb_user['id_outlet']){ echo 'selected'; } ?>>
  <?=$d_tb_outlet['nama']?></option>
  <?php } ?>
</select>
</div>
<div class="form-group">
<label>Akses</label>
<select class="form-control" name="role">
    <option>--- Silahkan Memilih Akses --</option>
    <option value="admin"<?php if('admin' == $d_tb_user['role']){ echo 'selected'; } ?>>Admin</option>
    <option value="kasir"<?php if('kasir' == $d_tb_user['role']){ echo 'selected'; } ?>>Kasir</option>
    <option value="owner"<?php if('owner' == $d_tb_user['role']){ echo 'selected'; } ?>>Owner</option>
</select>
</div>


</div>
<div class="modal-footer justify-content-between">
<button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
<button type="submit" class="btn btn-primary">Perbarui</button>
</div>
</form>
</div>

</div>

</div>

<?php } } ?>

                    <div class="modal fade" id="modal-tambah">
                    <div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title"><b>Tambah Data Pengguna</b></h4>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<form method="post" action="simpan_pengguna.php">
<div class="modal-body">
<div class="form-group">
    <label>Nama Pengguna</label>
    <input type="text" name="nama" class="form-control" placeholder="Masukkan Nama Pengguna">
</div>
<div class="form-group">
    <label>Username</label>
    <input type="text" name="username" class="form-control" placeholder="Masukkan Username">
</div>
<div class="form-group">
    <label>Password</label>
    <input type="password" name="password" class="form-control" placeholder="Masukkan Password">
</div>
<div class="form-group">
<label>Nama Outlet</label>
<select class="form-control" name="id_outlet">
<option>--- Memilih Nama Outlet --</option>

<?php
                    include "../koneksi.php";
                    $tb_outlet     =mysqli_query($koneksi, "SELECT * FROM  tb_outlet");
                    while($d_tb_outlet = mysqli_fetch_array($tb_outlet)){

                    
                      ?>
<option value="<?=$d_tb_outlet['id']?>"><?=$d_tb_outlet['nama']?></option>
<?php } ?>
</select>
</div>
<div class="form-group">
<label>Akses</label>
<select class="form-control" name="role">
    <option>--- Silahkan Memilih Akses --</option>
    <option value="admin">Admin</option>
<option value="kasir">Kasir</option>
<option value="owner"> Owner</option>
</select>
</div>


</div>
<div class="modal-footer justify-content-between">
<button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
<button type="submit" class="btn btn-primary">Simpan</button>
</div>
</form>
</div>

</div>

</div>


                  </tbody>
                </table>
              </div>

          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
</div>
<?php
include '../Layouts/footer.php';


?>
  
  
