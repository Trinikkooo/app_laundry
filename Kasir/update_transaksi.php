<?php 
// koneksi database
include '../koneksi.php';

// menangkap data yang di kirim dari form
$id = $_POST['id'];
$kode_invoice = $_POST['kode_invoice'];
$id_member = $_POST['id_member'];
$id_outlet = $_POST['id_outlet'];
$qty = $_POST['qty'];
$biaya_tambahan = $_POST['biaya_tambahan'];
$tdiskon = $_POST['diskon'];
$pajak = $_POST['pajak'];
$id_user = $_POST['id_user'];
$tgl = date('Y-m-d');
$batas_waktu = date('Y-m-d', strtotime('+6 days'));

// menginput data ke database
mysqli_query($koneksi,"update tb_transaksi set kode_invoice='$kode_invoice', id_member='$id_member', id_outlet='$id_outlet', qty='$qty',tgl='$tgl',batas_waktu='$batas_waktu', biaya_tambahan='$biaya_tambahan', diskon='$tdiskon',pajak='$pajak', id_user='$id_user' where id='$id'");

// mengalihkan halaman kembali ke index.php
header("location:transaksi.php?info=update");

?>