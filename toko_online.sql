-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2020 at 02:50 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'sepatu', 'sepatu merk all start', 'pakaian wanita', 300000, 10, '1.jpg'),
(2, 'sepatu', 'sepatu all stras', 'pakaian pria', 100000, 20, '2.jpg\r\n'),
(3, 'sepatu putsal', 'futsal', 'elektronik', 250000, 19, '3.jpg\r\n'),
(4, 'sepatu ilham', 'sepatu', 'peralatan olahraga', 100000, 100, '4.jpg'),
(5, 'sepatu ilham', 'coba', 'pakaian anak-anak', 20000, 20, '2_(2).jpg'),
(9, 'sepatu baru', 'coba', 'elektronik', 20000, 9, '2_(2)1.jpg'),
(10, 'coba sepatu', 'asli bener', 'pakaian wanita', 30000, 10, '2_(3).jpg'),
(11, 'sepatu', 'coba', 'pakaian anak-anak', 30000, 20, '2_(3)1.jpg'),
(14, 'sepatu ilham', 'coba', 'peralatan olahraga', 30000, 29, '2_(2)2.jpg'),
(15, 'coba sepatu', 'asli yah', 'peralatan olahraga', 30000, 10, 'user2.png'),
(16, 'sepatu baruuuuu', 'asli bener', 'elektronik', 20000, 10, 'user3.png'),
(17, 'sepatu ', 'asli bener', 'pakaian pria', 30000, 10, 'user4.png'),
(18, 'sepatu baruuuuu', 'asli bener', 'pakaian wanita', 20000, 10, 'user5.png'),
(19, 'coba sepatu', 'coba', 'pakaian anak-anak', 30000, 10, 'user6.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(38, 'ilham zakaria', 'kp. pancawati', '2020-03-03 22:25:13', '2020-03-03 22:25:13'),
(39, 'ikhsan maulana', 'kp. pancawati', '2020-03-03 22:26:13', '2020-03-03 22:26:13'),
(40, '', '', '2020-03-04 12:12:36', '2020-03-04 12:12:36'),
(41, '', '', '2020-03-04 12:13:26', '2020-03-04 12:13:26'),
(42, '', '', '2020-03-04 15:10:56', '2020-03-04 15:10:56');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(60) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 10, 1, 'sepatu', 1, 300000, ''),
(2, 10, 2, 'sepatu', 1, 100000, ''),
(3, 15, 4, 'sepatu ilham', 1, 100000, ''),
(4, 24, 1, 'sepatu', 1, 300000, ''),
(5, 27, 2, 'sepatu', 1, 100000, ''),
(6, 28, 4, 'sepatu ilham', 1, 100000, ''),
(7, 29, 2, 'sepatu', 1, 100000, ''),
(8, 30, 2, 'sepatu', 1, 100000, ''),
(9, 30, 4, 'sepatu ilham', 1, 100000, ''),
(10, 38, 2, 'sepatu', 1, 100000, ''),
(11, 39, 4, 'sepatu ilham', 1, 100000, ''),
(12, 40, 14, 'sepatu ilham', 1, 30000, ''),
(13, 41, 3, 'sepatu putsal', 1, 250000, ''),
(14, 42, 9, 'sepatu baru', 1, 20000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '123', 1),
(2, 'user', 'user', '321', 2),
(3, 'ilham zakaria', 'ilham', '123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
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
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
