-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2023 at 09:47 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dashboard_pondok`
--

-- --------------------------------------------------------

--
-- Table structure for table `rekapkonflik`
--

CREATE TABLE `rekapkonflik` (
  `idKonflik` int(6) NOT NULL,
  `konflik` enum('Ya','Tidak') NOT NULL,
  `catatanKonflik` varchar(255) NOT NULL,
  `idKlien` int(6) NOT NULL,
  `idJadwal` int(6) NOT NULL,
  `tanggalPencatatan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rekapkonflik`
--

INSERT INTO `rekapkonflik` (`idKonflik`, `konflik`, `catatanKonflik`, `idKlien`, `idJadwal`, `tanggalPencatatan`) VALUES
(1, 'Ya', 'Emosi tidak stabil', 1, 1, '2023-10-30'),
(2, 'Ya', 'Konflik dengan temannya', 1, 5, '2023-10-31'),
(3, 'Tidak', '-', 1, 2, '2023-11-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rekapkonflik`
--
ALTER TABLE `rekapkonflik`
  ADD PRIMARY KEY (`idKonflik`),
  ADD KEY `rekapkonflik_ibfk_1` (`idKlien`),
  ADD KEY `rekapkonflik_ibfk_2` (`idJadwal`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rekapkonflik`
--
ALTER TABLE `rekapkonflik`
  ADD CONSTRAINT `rekapkonflik_ibfk_1` FOREIGN KEY (`idKlien`) REFERENCES `dataklien` (`idKlien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekapkonflik_ibfk_2` FOREIGN KEY (`idJadwal`) REFERENCES `jadwalharian` (`idJadwal`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
