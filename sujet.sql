-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2025 at 12:34 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `memoirecmw`
--

-- --------------------------------------------------------

--
-- Table structure for table `sujet`
--

CREATE TABLE `sujet` (
  `idSujet` int(11) NOT NULL,
  `titreSujet` varchar(50) DEFAULT NULL,
  `dateSujet` date DEFAULT NULL,
  `idCompteEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sujet`
--

INSERT INTO `sujet` (`idSujet`, `titreSujet`, `dateSujet`, `idCompteEtudiant`) VALUES
(2, '', '2025-03-12', 2),
(3, '', '2025-03-12', 3),
(4, '', '2025-03-12', 4),
(5, '', '2025-03-12', 5),
(6, '', '2025-03-12', 6),
(7, '', '2025-03-12', 7),
(8, '', '2025-03-12', 8),
(9, '', '2025-03-12', 9),
(10, '', '2025-03-12', 10),
(11, '', '2025-03-12', 11),
(12, '', '2025-03-12', 12),
(13, '', '2025-03-12', 13),
(14, '', '2025-03-12', 14),
(15, '', '2025-03-12', 15),
(16, '', '2025-03-12', 16),
(17, '', '2025-03-12', 17),
(18, '', '2025-03-12', 18),
(19, '', '2025-03-12', 19),
(20, '', '2025-03-12', 20),
(21, '', '2025-03-12', 21),
(22, '', '2025-03-12', 22),
(23, '', '2025-03-12', 23),
(24, '', '2025-03-12', 24),
(25, '', '2025-03-12', 25),
(26, '', '2025-03-12', 26),
(27, '', '2025-03-12', 27),
(28, '', '2025-03-12', 28),
(29, '', '2025-03-12', 29),
(30, '', '2025-03-12', 30),
(31, '', '2025-03-12', 31),
(32, '', '2025-03-12', 32),
(33, '', '2025-03-12', 33),
(34, '', '2025-03-12', 34),
(35, '', '2025-03-12', 35),
(36, '', '2025-03-12', 36),
(37, '', '2024-03-12', 37),
(38, '', '2024-03-13', 38),
(39, '', '2024-03-14', 39),
(40, '', '2024-03-15', 40),
(41, '', '2024-03-16', 41),
(42, '', '2024-03-17', 42),
(43, '', '2024-03-18', 43),
(44, '', '2024-03-19', 44),
(45, '', '2024-03-20', 45),
(46, '', '2024-03-21', 46),
(47, '', '2024-03-22', 47),
(48, '', '2024-03-23', 48),
(49, '', '2024-03-24', 49),
(50, '', '2024-03-25', 50),
(51, '', '2024-03-26', 51),
(52, '', '2024-03-27', 52),
(53, '', '2024-03-28', 53),
(54, '', '2024-03-29', 54),
(55, '', '2024-03-30', 55),
(56, '', '2024-03-31', 56),
(57, '', '2024-04-01', 57),
(58, '', '2024-04-02', 58);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sujet`
--
ALTER TABLE `sujet`
  ADD PRIMARY KEY (`idSujet`),
  ADD KEY `idEtudiant` (`idCompteEtudiant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `idSujet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
