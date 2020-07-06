-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2020 at 04:46 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biro_perjalanan`
--

-- --------------------------------------------------------

--
-- Table structure for table `costumer`
--

CREATE TABLE `costumer` (
  `kode_costumer` char(4) NOT NULL,
  `nama_costumer` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `notelp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `costumer`
--

INSERT INTO `costumer` (`kode_costumer`, `nama_costumer`, `alamat`, `notelp`) VALUES
('123', 'Reza', 'Tulungagung Asri', '0818118181'),
('456', 'Kurnia', 'Graha Tulungagung', '08228282282');

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE `detail` (
  `no_trans` char(10) NOT NULL,
  `kode_paket` char(4) NOT NULL,
  `tujuan_wisata` varchar(15) NOT NULL,
  `tanggal_pesan` datetime(2) NOT NULL,
  `tgl_berangkat` datetime NOT NULL,
  `transportasi` varchar(15) NOT NULL,
  `penginapan` varchar(15) NOT NULL,
  `restoran` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`no_trans`, `kode_paket`, `tujuan_wisata`, `tanggal_pesan`, `tgl_berangkat`, `transportasi`, `penginapan`, `restoran`) VALUES
('055', '001', 'Pulau Nipaw', '2020-07-14 20:57:05.00', '2020-07-17 21:03:25', 'jet', 'tenda', 'kak ros'),
('056', '002', 'jogs', '2020-07-19 21:23:05.00', '2020-07-20 21:23:05', 'becak', 'hotel', 'poso');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `kode_paket` char(4) NOT NULL,
  `nama_paket` varchar(10) NOT NULL,
  `kode_costumer` char(4) NOT NULL,
  `tujuan` varchar(15) NOT NULL,
  `jam_berangkat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jam_tiba` datetime NOT NULL,
  `harga` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`kode_paket`, `nama_paket`, `kode_costumer`, `tujuan`, `jam_berangkat`, `jam_tiba`, `harga`) VALUES
('001', 'Asik', '123', 'pulau nipaw', '2020-07-16 13:47:36', '2020-07-17 20:47:36', 0),
('002', 'mantap', '456', 'jogs', '2020-07-21 14:20:49', '2020-07-22 21:20:27', 20000000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_trans` char(10) NOT NULL,
  `tgl_trans` datetime NOT NULL,
  `sub_total` int(8) NOT NULL,
  `total_chars` int(8) NOT NULL,
  `total` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_trans`, `tgl_trans`, `sub_total`, `total_chars`, `total`) VALUES
('055', '2020-06-16 08:34:53', 30, 40000, 50),
('056', '2020-07-20 21:22:20', 25000, 26000, 27000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`kode_costumer`);

--
-- Indexes for table `detail`
--
ALTER TABLE `detail`
  ADD KEY `no_trans` (`no_trans`,`kode_paket`),
  ADD KEY `kode_paket` (`kode_paket`),
  ADD KEY `no_trans_2` (`no_trans`,`kode_paket`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`kode_paket`),
  ADD KEY `kode_costumer` (`kode_costumer`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_trans`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail`
--
ALTER TABLE `detail`
  ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`no_trans`) REFERENCES `transaksi` (`no_trans`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_ibfk_2` FOREIGN KEY (`kode_paket`) REFERENCES `paket` (`kode_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paket`
--
ALTER TABLE `paket`
  ADD CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`kode_costumer`) REFERENCES `costumer` (`kode_costumer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
