-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2025 at 12:36 PM
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
-- Table structure for table `compte_etudiant`
--

CREATE TABLE `compte_etudiant` (
  `idCompteEtudiant` int(11) NOT NULL,
  `prenomEtudiant` varchar(30) NOT NULL,
  `nomEtudiant` varchar(40) NOT NULL,
  `mailEtudiant` varchar(50) DEFAULT NULL,
  `mdpEtudiant` text,
  `anneePromotion` int(11) NOT NULL,
  `actif` tinyint(1) DEFAULT '1',
  `groupeEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `compte_etudiant`
--

INSERT INTO `compte_etudiant` (`idCompteEtudiant`, `prenomEtudiant`, `nomEtudiant`, `mailEtudiant`, `mdpEtudiant`, `anneePromotion`, `actif`, `groupeEtudiant`) VALUES
(1, 'Xuxu', 'Tran', 'naux.pro@gmail.com', '$2y$10$pyQ9SgI/DtPRQ2IiRoSypexckk/HYVZMh06ae4z5XFYFHya82.3Qe', 2025, 1, NULL),
(2, 'Carolina', 'APOLINARIO DA ROSA', '', '', 2024, 0, 1),
(3, 'Marie', 'BABKINE', '', '', 2024, 0, 1),
(4, 'Yona', 'CADIN', '', '', 2024, 0, 1),
(5, 'Virgil', 'CANTIN', '', '', 2024, 0, 1),
(6, 'Mey', 'KSANTINI', '', '', 2024, 0, 1),
(7, 'Vincent', 'KUNTZ', '', '', 2024, 0, 1),
(8, 'Martin', 'LAPLAIZE', '', '', 2024, 0, 1),
(9, 'Eliott', 'LECLERC', '', '', 2024, 0, 1),
(10, 'Thi To Tam', 'NGUYEN', '', '', 2024, 0, 1),
(11, 'Ines', 'REZKI', '', '', 2024, 0, 1),
(12, 'Nolan', 'ROBIC', '', '', 2024, 0, 1),
(13, 'Moubine', 'SEKALAOUDINE', '', '', 2024, 0, 1),
(14, 'Eliane', 'SELE NGANI', '', '', 2024, 0, 1),
(15, 'Aïssata', 'SOW', '', '', 2024, 0, 1),
(16, 'Amélie', 'VERGNAUD', '', '', 2024, 0, 1),
(17, 'Eldi', 'BICARI', '', '', 2024, 0, 2),
(18, 'Alicia', 'BIWOLE', '', '', 2024, 0, 2),
(19, 'Elise', 'CELADON', '', '', 2024, 0, 2),
(20, 'Anne-Laure', 'CERDA', '', '', 2024, 0, 2),
(21, 'Sarah', 'DERMOUCHE', '', '', 2024, 0, 2),
(22, 'Schmide', 'DORANTE', '', '', 2024, 0, 2),
(23, 'Aurélien', 'DUBERVILLE', '', '', 2024, 0, 2),
(24, 'Alexia', 'FILLAUD', '', '', 2024, 0, 2),
(25, 'Marie-Eunice', 'GNACO', '', '', 2024, 0, 2),
(26, 'Babylone', 'ISSHAK', '', '', 2024, 0, 2),
(27, 'Kyannah', 'JEANNE', '', '', 2024, 0, 2),
(28, 'Feryel', 'KHELIFI', '', '', 2024, 0, 2),
(29, 'Valérie', 'LAPEYRE', '', '', 2024, 0, 2),
(30, 'Clara', 'MANY', '', '', 2024, 0, 2),
(31, 'Pauline', 'MAS', '', '', 2024, 0, 2),
(32, 'Evan', 'MELET', '', '', 2024, 0, 2),
(33, 'Malick', 'NIANG', '', '', 2024, 0, 2),
(34, 'Elodie', 'PUSHPANATHAN', '', '', 2024, 0, 2),
(35, 'Iloniaina', 'RATSIMBAZAFY', '', '', 2024, 0, 2),
(36, 'Alexandru', 'VASILE', '', '', 2024, 0, 2),
(37, 'Lea ', 'SPASARO', '', '', 2023, 0, 2),
(38, 'Kety', 'ROMAIN', '', '', 2023, 0, 2),
(39, 'Maryam', 'RHARSALLA', '', '', 2023, 0, 2),
(40, 'Aline ', 'REZENDE DA SILVA', '', '', 2023, 0, 2),
(41, 'Charlène', 'ODUNLAMI', '', '', 2023, 0, 2),
(42, 'Agathe', 'MORNET', '', '', 2023, 0, 2),
(43, 'Anne-Laure', 'LIBON', '', '', 2023, 0, 2),
(44, 'Hyunji', 'KIM', '', '', 2023, 0, 2),
(45, 'Kerby', 'JANVIER', '', '', 2023, 0, 2),
(46, 'Lou', 'HERNANDEZ', '', '', 2023, 0, 2),
(47, 'Camille ', 'DIXIT', '', '', 2023, 0, 2),
(48, 'Emma ', 'BREHIN', '', '', 2023, 0, 2),
(49, 'Rim', 'BEN JABER', '', '', 2023, 0, 2),
(50, 'Cihan Nur', 'ABUT', '', '', 2023, 0, 2),
(51, 'Emeline', 'VINCENOT', '', '', 2023, 0, 1),
(52, 'Xuan-Minh', 'TRAN', '', '', 2023, 0, 1),
(53, 'Faïza', 'SAÏDANI', '', '', 2023, 0, 1),
(54, 'Brian', 'MAI', '', '', 2023, 0, 1),
(55, 'Sakina', 'DOUIOU', '', '', 2023, 0, 1),
(56, 'Dylan ', 'BLANDEL', '', '', 2023, 0, 1),
(57, 'Mariama', 'ASSOUMANI', '', '', 2023, 0, 1),
(58, 'Karen', 'ANDRIANAVELOMANANA', '', '', 2023, 0, 1),
(59, 'Sakina', 'Douiou', 'saki@gmail.com', '$2y$10$hHPztzX5953AWnWpVIcCReP3UM2zoKM6uzU5o2mtTKj0gR1q8Q7Ui', 2025, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compte_etudiant`
--
ALTER TABLE `compte_etudiant`
  ADD PRIMARY KEY (`idCompteEtudiant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compte_etudiant`
--
ALTER TABLE `compte_etudiant`
  MODIFY `idCompteEtudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
