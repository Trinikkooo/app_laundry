-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 05:00 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_transaksi`
--

CREATE TABLE `tb_detail_transaksi` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` int(20) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_detail_transaksi`
--

INSERT INTO `tb_detail_transaksi` (`id`, `id_transaksi`, `id_paket`, `qty`, `keterangan`) VALUES
(4, 1, 1, 4, 'done'),
(9, 11, 0, 20, 'done'),
(11, 15, 0, 20, 'done'),
(12, 16, 0, 12, 'done'),
(13, 14, 0, 30, 'done'),
(15, 17, 0, 3, 'done'),
(16, 18, 0, 1, 'done'),
(17, 23, 0, 4, 'done'),
(18, 28, 0, 2, 'done'),
(19, 29, 0, 4, 'done'),
(20, 31, 0, 4, 'done'),
(21, 32, 0, 5, 'done'),
(22, 34, 0, 5, 'done'),
(24, 36, 0, 4, 'done'),
(25, 40, 0, 4, 'done'),
(26, 41, 0, 5, 'done'),
(27, 42, 0, 4, 'done'),
(28, 43, 0, 3, 'done'),
(29, 44, 0, 5, 'done'),
(30, 45, 0, 4, 'done'),
(31, 47, 0, 2, 'done'),
(32, 51, 0, 10, 'done'),
(33, 53, 0, 5, 'done'),
(34, 54, 0, 10, 'done'),
(35, 55, 0, 5, 'done');

-- --------------------------------------------------------

--
-- Table structure for table `tb_member`
--

CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_member`
--

INSERT INTO `tb_member` (`id`, `nama`, `alamat`, `jenis_kelamin`, `tlp`) VALUES
(9, 'Dayat', 'Lawang, Malang', 'L', '097676545782'),
(10, 'Sri Rahayu', 'Singosari, Malang', 'P', '0897654322'),
(11, 'Ririn', 'Turen, Malang', 'P', '098987655444'),
(12, 'Ginanjar', 'Gondanglegi, Malang', 'L', '08976545632'),
(13, 'Supri', 'Buduran, Sidoarjo', 'L', '07678825637'),
(14, 'Putri', 'Waru, Sidoarjo', 'P', '078987543342'),
(15, 'Putra', 'Sukodono, Sidoarjo', 'L', '09873455322'),
(16, 'Ajeng', 'Candi, Sidoarjo', 'P', '06344874234623'),
(17, 'Susi', 'Benowo, Surabaya', 'P', '09835462346654'),
(18, 'Satria', 'Kenjeran, Surabaya', 'L', '088976456545'),
(19, 'Riho', 'Rungkut, Surabaya', 'L', '097823248754'),
(20, 'Syifa', 'Tandes, Surabaya', 'P', '093428734562345'),
(21, 'reza', 'Sidoarjo, Sidoarjo', 'L', '08964745467'),
(27, 'Budi', 'Waru, Sidoarjo', 'L', '08798765456');

-- --------------------------------------------------------

--
-- Table structure for table `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_outlet`
--

INSERT INTO `tb_outlet` (`id`, `nama`, `alamat`, `tlp`) VALUES
(1, 'OUTLET 1', 'Singosari, Malang', '080997799777'),
(4, 'OUTLET 2', 'Jenggolo, Sidoarjo', '0809977997799'),
(5, 'OUTLET 3', 'Wiyung, Surabaya', '088976789765'),
(9, 'OUTLET 4', 'Jakarta', '089777678584');

-- --------------------------------------------------------

--
-- Table structure for table `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `jenis` enum('kiloan','selimut','bed_cover','jas','gorden','lain') NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_paket`
--

INSERT INTO `tb_paket` (`id`, `id_outlet`, `jenis`, `nama_paket`, `harga`) VALUES
(7, 1, 'kiloan', 'Cuci kering', 7000),
(8, 1, 'kiloan', 'Cuci seterika', 9000),
(14, 1, 'jas', 'Jas / pcs', 15000),
(15, 1, 'selimut', 'Selimut / pcs', 15000),
(16, 1, 'bed_cover', 'Bed cover / pcs', 20000),
(17, 1, 'gorden', 'Gorden / m', 12000),
(18, 4, 'kiloan', 'Cuci kering', 7000),
(19, 4, 'kiloan', 'Cuci seterika', 9000),
(20, 4, 'jas', 'Jas / pcs', 15000),
(21, 4, 'selimut', 'Selimut / pcs', 15000),
(22, 4, 'bed_cover', 'Bed cover / pcs', 20000),
(23, 4, 'gorden', 'Gorden / m', 12000),
(24, 5, 'kiloan', 'Cuci seterika', 7000),
(25, 5, 'kiloan', 'Cuci kering', 9000),
(26, 5, 'jas', 'Jas / pcs', 15000),
(27, 5, 'selimut', 'Selimut / pcs', 15000),
(28, 5, 'bed_cover', 'Bed cover / pcs', 20000),
(29, 5, 'gorden', 'Gorden / m', 12000),
(30, 0, '', '', 0),
(31, 6, 'kiloan', 'Cuci seterika', 10000),
(32, 9, 'lain', 'Cuci sepatu', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `id_member` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `batas_waktu` date NOT NULL,
  `tgl_bayar` date NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `diskon` double NOT NULL,
  `pajak` int(11) NOT NULL,
  `status` enum('baru','proses','selesai','diambil') NOT NULL,
  `dibayar` enum('dibayar','belum_dibayar') NOT NULL,
  `qty` double NOT NULL,
  `keterangan` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `durasi` enum('1_hari','2_hari','3_hari') NOT NULL,
  `komplain` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `id_outlet`, `id_paket`, `kode_invoice`, `id_member`, `tgl`, `batas_waktu`, `tgl_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `dibayar`, `qty`, `keterangan`, `id_user`, `durasi`, `komplain`) VALUES
(41, 1, 8, 'INV07032023171726', 9, '2023-03-07', '2023-03-13', '0000-00-00', 5000, 10, 1500, 'diambil', 'dibayar', 5, '', 11, '3_hari', 'Bajunya bau'),
(43, 5, 28, 'INV07032023172016', 18, '2023-03-07', '2023-03-13', '0000-00-00', 5000, 10, 1500, 'diambil', 'dibayar', 3, '', 11, '1_hari', ''),
(44, 5, 28, 'INV09032023173006', 20, '2023-03-09', '2023-03-15', '0000-00-00', 0, 0, 1500, 'diambil', 'dibayar', 5, '', 11, '2_hari', ''),
(50, 4, 0, 'INV18032023104857', 22, '2023-03-18', '2023-03-24', '0000-00-00', 10000, 5000, 1500, 'baru', 'belum_dibayar', 10, '', 8, '', ''),
(53, 4, 20, 'INV19032023044707', 25, '2023-03-19', '2023-03-25', '0000-00-00', 2000, 5, 1500, 'diambil', 'dibayar', 5, '', 11, '1_hari', 'Jasnya rusak'),
(54, 4, 19, 'INV19032023045945', 26, '2023-03-19', '2023-03-25', '0000-00-00', 2000, 5, 1500, 'diambil', 'dibayar', 10, '', 8, '1_hari', 'Hasilnya mantab'),
(55, 4, 19, 'INV19032023120740', 27, '2023-03-19', '2023-03-25', '0000-00-00', 1000, 5, 1500, 'diambil', 'dibayar', 5, '', 8, '2_hari', 'Bajunya rusak dan bau');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` text NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `role` enum('admin','kasir','kasirsatu','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `id_outlet`, `role`) VALUES
(6, 'kasir', 'kasir', 'd0338f12c886817431acc42ca1728c35', 1, 'kasir'),
(7, 'kasir', 'kasir', 'd0338f12c886817431acc42ca1728c35', 4, 'kasir'),
(8, 'kasir', 'kasir', 'd0338f12c886817431acc42ca1728c35', 5, 'kasir'),
(9, 'admin', 'admin', '2b6ec73fdb410382465cb8a01d1ee254', 1, 'admin'),
(10, 'admin', 'admin', '2b6ec73fdb410382465cb8a01d1ee254', 4, 'admin'),
(11, 'admin', 'admin', '2b6ec73fdb410382465cb8a01d1ee254', 5, 'admin'),
(12, 'owner', 'owner', '95f4338b171609be6df66ca396973646', 1, 'owner'),
(13, 'owner', 'owner', '95f4338b171609be6df66ca396973646', 4, 'owner'),
(14, 'owner', 'owner', '95f4338b171609be6df66ca396973646', 5, 'owner'),
(15, 'admin', 'admin', '2b6ec73fdb410382465cb8a01d1ee254', 6, 'admin'),
(16, 'admin', 'admin', '2b6ec73fdb410382465cb8a01d1ee254', 9, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
