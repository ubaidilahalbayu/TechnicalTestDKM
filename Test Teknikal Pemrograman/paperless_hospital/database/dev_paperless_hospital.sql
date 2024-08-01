-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 01, 2024 at 09:38 PM
-- Server version: 8.0.37-0ubuntu0.22.04.3
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev_paperless_hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kd_dokter` varchar(4) NOT NULL,
  `nm_dokter` varchar(255) NOT NULL,
  `id_poli` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kd_dokter`, `nm_dokter`, `id_poli`) VALUES
('D001', 'Angga', 1),
('D002', 'Tiara', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `no_rekam_medis` double NOT NULL,
  `nama_pasien` varchar(255) NOT NULL,
  `NIK` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`no_rekam_medis`, `nama_pasien`, `NIK`) VALUES
(1, 'Iwan', '123892222'),
(2, 'Udin', '123892221'),
(3, 'Mamat', '123892223');

-- --------------------------------------------------------

--
-- Table structure for table `periksa_pasien`
--

CREATE TABLE `periksa_pasien` (
  `no_rekam_medis` double NOT NULL,
  `kd_dokter` varchar(4) NOT NULL,
  `ket_diagnosa` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `periksa_pasien`
--

INSERT INTO `periksa_pasien` (`no_rekam_medis`, `kd_dokter`, `ket_diagnosa`) VALUES
(1, 'D001', 'Batuk'),
(2, 'D002', 'Serangan Jantung'),
(3, 'D001', 'Gigi Berdarah');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id_poli` int NOT NULL,
  `nm_poli` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id_poli`, `nm_poli`) VALUES
(1, 'poli gigi'),
(2, 'poli jantung');

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_pasien`
--

CREATE TABLE `registrasi_pasien` (
  `no_rekam_medis` double NOT NULL,
  `no_registrasi` varchar(3) NOT NULL,
  `id_poli_tujuan` int NOT NULL,
  `tgl_registrasi` date DEFAULT (curdate())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `registrasi_pasien`
--

INSERT INTO `registrasi_pasien` (`no_rekam_medis`, `no_registrasi`, `id_poli_tujuan`, `tgl_registrasi`) VALUES
(1, '344', 1, '2024-07-28'),
(2, '345', 2, '2024-07-31'),
(3, '346', 1, '2024-08-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kd_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`no_rekam_medis`);

--
-- Indexes for table `periksa_pasien`
--
ALTER TABLE `periksa_pasien`
  ADD KEY `no_rekam_medis` (`no_rekam_medis`),
  ADD KEY `kd_dokter` (`kd_dokter`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Indexes for table `registrasi_pasien`
--
ALTER TABLE `registrasi_pasien`
  ADD KEY `no_rekam_medis` (`no_rekam_medis`),
  ADD KEY `id_poli_tujuan` (`id_poli_tujuan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id_poli` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`);

--
-- Constraints for table `periksa_pasien`
--
ALTER TABLE `periksa_pasien`
  ADD CONSTRAINT `periksa_pasien_ibfk_1` FOREIGN KEY (`no_rekam_medis`) REFERENCES `registrasi_pasien` (`no_rekam_medis`),
  ADD CONSTRAINT `periksa_pasien_ibfk_2` FOREIGN KEY (`kd_dokter`) REFERENCES `dokter` (`kd_dokter`);

--
-- Constraints for table `registrasi_pasien`
--
ALTER TABLE `registrasi_pasien`
  ADD CONSTRAINT `registrasi_pasien_ibfk_1` FOREIGN KEY (`no_rekam_medis`) REFERENCES `pasien` (`no_rekam_medis`),
  ADD CONSTRAINT `registrasi_pasien_ibfk_2` FOREIGN KEY (`id_poli_tujuan`) REFERENCES `poli` (`id_poli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
