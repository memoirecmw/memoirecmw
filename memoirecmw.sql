-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2025 at 12:37 PM
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
-- Table structure for table `bloc_note`
--

CREATE TABLE `bloc_note` (
  `idNote` int(11) NOT NULL,
  `descriptionNote` text,
  `idCompteEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bloc_note`
--

INSERT INTO `bloc_note` (`idNote`, `descriptionNote`, `idCompteEtudiant`) VALUES
(6, 'Saki prout prout', 59);

-- --------------------------------------------------------

--
-- Table structure for table `categorie_documentation`
--

CREATE TABLE `categorie_documentation` (
  `idCategorieDocumentation` int(11) NOT NULL,
  `titreCategorieDocumentation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie_documentation`
--

INSERT INTO `categorie_documentation` (`idCategorieDocumentation`, `titreCategorieDocumentation`) VALUES
(1, 'Travaux préparatoires'),
(2, 'Recherches / Enquêtes'),
(3, 'Rédaction'),
(4, 'Soutenance');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_rendu`
--

CREATE TABLE `categorie_rendu` (
  `idCategorieRendu` int(11) NOT NULL,
  `titreCategorieRendu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie_rendu`
--

INSERT INTO `categorie_rendu` (`idCategorieRendu`, `titreCategorieRendu`) VALUES
(1, 'fiche-validation'),
(2, 'bibliographie'),
(3, 'fiche-terrain'),
(4, 'plan'),
(5, 'introduction'),
(6, 'premiere-partie'),
(7, 'mini-soutenance');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_ressources`
--

CREATE TABLE `categorie_ressources` (
  `idCategorieRessources` int(11) NOT NULL,
  `titreCategorieRessources` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorie_ressources`
--

INSERT INTO `categorie_ressources` (`idCategorieRessources`, `titreCategorieRessources`) VALUES
(1, 'Sciences sociales'),
(2, 'Autour du numérique'),
(3, 'Outils Bibliographiques'),
(4, 'Du côté des labos');

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

-- --------------------------------------------------------

--
-- Table structure for table `documentation`
--

CREATE TABLE `documentation` (
  `idDocumentation` int(11) NOT NULL,
  `titreDocumentation` varchar(50) DEFAULT NULL,
  `descriptionDocumentation` text,
  `idCategorieDocumentation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documentation`
--

INSERT INTO `documentation` (`idDocumentation`, `titreDocumentation`, `descriptionDocumentation`, `idCategorieDocumentation`) VALUES
(1, 'Fiche validation', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ornare libero faucibus eleifend venenatis. Sed viverra vitae ex sed lobortis. Etiam luctus est vel ultricies blandit. Nam sit amet lacinia enim. Sed vel lacinia dolor, a aliquam nunc. Ut eu cursus odio, fringilla euismod turpis. Cras faucibus malesuada ipsum, eget imperdiet tellus ultrices viverra. Pellentesque viverra eu nulla id dapibus. Praesent et lorem mauris. Curabitur ut ultrices turpis. Aliquam porta ultrices elit, eget tincidunt lacus dignissim at.\n\nFusce tristique scelerisque pharetra. Donec ultricies nibh quis iaculis tristique. Nam vulputate aliquet justo non convallis. Praesent sodales nisl at est scelerisque semper. Nunc tempor neque vel eleifend pretium. Morbi mattis congue fringilla. Maecenas at nulla luctus, faucibus eros a, vulputate velit. Ut imperdiet arcu urna, et volutpat tellus porta id. Integer non posuere diam. Praesent tincidunt diam malesuada, elementum eros rutrum, egestas mauris.\n\nQuisque viverra nisi in ante facilisis, vel accumsan sapien malesuada. Nulla cursus aliquam neque, euismod tempus velit iaculis sed. Nulla sed est vitae risus elementum ultrices. Nam fringilla leo nec dictum laoreet. Vivamus condimentum diam vel felis commodo maximus. Sed aliquam varius ornare. Nullam mi ante, ultrices id mi in, dignissim dapibus velit. Aenean ipsum leo, rutrum ac dapibus eget, auctor vitae est.\n\nVivamus vehicula aliquet posuere. Morbi efficitur magna sit amet facilisis tempor. Vivamus nec semper diam, laoreet accumsan tortor. Duis commodo id quam et dignissim. Duis volutpat mollis tellus ut accumsan. Nullam lacinia id ante quis convallis. Duis convallis risus vitae nulla porta cursus. Quisque ex nulla, viverra non risus vitae, tincidunt suscipit leo. Phasellus nec lectus tincidunt, tincidunt elit sed, dapibus ante.\n\nDonec egestas mauris at fermentum tincidunt. Quisque cursus nisl justo, ut condimentum lacus cursus non. Integer finibus urna tempus, placerat urna non, volutpat odio. Nullam pretium elit urna, vitae euismod sapien rhoncus id. Morbi ultricies vulputate leo tincidunt cursus. Etiam commodo nibh ornare ex aliquam, vel aliquet lectus molestie. Praesent sollicitudin euismod erat, eu tempus dui pellentesque eu. Aenean vulputate elit sit amet diam eleifend rhoncus. Vivamus placerat egestas mattis. Ut euismod pharetra vehicula. In hac habitasse platea dictumst. Maecenas ac porttitor mi.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ornare libero faucibus eleifend venenatis. Sed viverra vitae ex sed lobortis. Etiam luctus est vel ultricies blandit. Nam sit amet lacinia enim. Sed vel lacinia dolor, a aliquam nunc. Ut eu cursus odio, fringilla euismod turpis. Cras faucibus malesuada ipsum, eget imperdiet tellus ultrices viverra. Pellentesque viverra eu nulla id dapibus. Praesent et lorem mauris. Curabitur ut ultrices turpis. Aliquam porta ultrices elit, eget tincidunt lacus dignissim at.\n\nFusce tristique scelerisque pharetra. Donec ultricies nibh quis iaculis tristique. Nam vulputate aliquet justo non convallis. Praesent sodales nisl at est scelerisque semper. Nunc tempor neque vel eleifend pretium. Morbi mattis congue fringilla. Maecenas at nulla luctus, faucibus eros a, vulputate velit. Ut imperdiet arcu urna, et volutpat tellus porta id. Integer non posuere diam. Praesent tincidunt diam malesuada, elementum eros rutrum, egestas mauris.\n\nQuisque viverra nisi in ante facilisis, vel accumsan sapien malesuada. Nulla cursus aliquam neque, euismod tempus velit iaculis sed. Nulla sed est vitae risus elementum ultrices. Nam fringilla leo nec dictum laoreet. Vivamus condimentum diam vel felis commodo maximus. Sed aliquam varius ornare. Nullam mi ante, ultrices id mi in, dignissim dapibus velit. Aenean ipsum leo, rutrum ac dapibus eget, auctor vitae est.\n\nVivamus vehicula aliquet posuere. Morbi efficitur magna sit amet facilisis tempor. Vivamus nec semper diam, laoreet accumsan tortor. Duis commodo id quam et dignissim. Duis volutpat mollis tellus ut accumsan. Nullam lacinia id ante quis convallis. Duis convallis risus vitae nulla porta cursus. Quisque ex nulla, viverra non risus vitae, tincidunt suscipit leo. Phasellus nec lectus tincidunt, tincidunt elit sed, dapibus ante.\n\nDonec egestas mauris at fermentum tincidunt. Quisque cursus nisl justo, ut condimentum lacus cursus non. Integer finibus urna tempus, placerat urna non, volutpat odio. Nullam pretium elit urna, vitae euismod sapien rhoncus id. Morbi ultricies vulputate leo tincidunt cursus. Etiam commodo nibh ornare ex aliquam, vel aliquet lectus molestie. Praesent sollicitudin euismod erat, eu tempus dui pellentesque eu. Aenean vulputate elit sit amet diam eleifend rhoncus. Vivamus placerat egestas mattis. Ut euismod pharetra vehicula. In hac habitasse platea dictumst. Maecenas ac porttitor mi.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ornare libero faucibus eleifend venenatis. Sed viverra vitae ex sed lobortis. Etiam luctus est vel ultricies blandit. Nam sit amet lacinia enim. Sed vel lacinia dolor, a aliquam nunc. Ut eu cursus odio, fringilla euismod turpis. Cras faucibus malesuada ipsum, eget imperdiet tellus ultrices viverra. Pellentesque viverra eu nulla id dapibus. Praesent et lorem mauris. Curabitur ut ultrices turpis. Aliquam porta ultrices elit, eget tincidunt lacus dignissim at.\n\nFusce tristique scelerisque pharetra. Donec ultricies nibh quis iaculis tristique. Nam vulputate aliquet justo non convallis. Praesent sodales nisl at est scelerisque semper. Nunc tempor neque vel eleifend pretium. Morbi mattis congue fringilla. Maecenas at nulla luctus, faucibus eros a, vulputate velit. Ut imperdiet arcu urna, et volutpat tellus porta id. Integer non posuere diam. Praesent tincidunt diam malesuada, elementum eros rutrum, egestas mauris.\n\nQuisque viverra nisi in ante facilisis, vel accumsan sapien malesuada. Nulla cursus aliquam neque, euismod tempus velit iaculis sed. Nulla sed est vitae risus elementum ultrices. Nam fringilla leo nec dictum laoreet. Vivamus condimentum diam vel felis commodo maximus. Sed aliquam varius ornare. Nullam mi ante, ultrices id mi in, dignissim dapibus velit. Aenean ipsum leo, rutrum ac dapibus eget, auctor vitae est.\n\nVivamus vehicula aliquet posuere. Morbi efficitur magna sit amet facilisis tempor. Vivamus nec semper diam, laoreet accumsan tortor. Duis commodo id quam et dignissim. Duis volutpat mollis tellus ut accumsan. Nullam lacinia id ante quis convallis. Duis convallis risus vitae nulla porta cursus. Quisque ex nulla, viverra non risus vitae, tincidunt suscipit leo. Phasellus nec lectus tincidunt, tincidunt elit sed, dapibus ante.\n\nDonec egestas mauris at fermentum tincidunt. Quisque cursus nisl justo, ut condimentum lacus cursus non. Integer finibus urna tempus, placerat urna non, volutpat odio. Nullam pretium elit urna, vitae euismod sapien rhoncus id. Morbi ultricies vulputate leo tincidunt cursus. Etiam commodo nibh ornare ex aliquam, vel aliquet lectus molestie. Praesent sollicitudin euismod erat, eu tempus dui pellentesque eu. Aenean vulputate elit sit amet diam eleifend rhoncus. Vivamus placerat egestas mattis. Ut euismod pharetra vehicula. In hac habitasse platea dictumst. Maecenas ac porttitor mi.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ornare libero faucibus eleifend venenatis. Sed viverra vitae ex sed lobortis. Etiam luctus est vel ultricies blandit. Nam sit amet lacinia enim. Sed vel lacinia dolor, a aliquam nunc. Ut eu cursus odio, fringilla euismod turpis. Cras faucibus malesuada ipsum, eget imperdiet tellus ultrices viverra. Pellentesque viverra eu nulla id dapibus. Praesent et lorem mauris. Curabitur ut ultrices turpis. Aliquam porta ultrices elit, eget tincidunt lacus dignissim at.\n\nFusce tristique scelerisque pharetra. Donec ultricies nibh quis iaculis tristique. Nam vulputate aliquet justo non convallis. Praesent sodales nisl at est scelerisque semper. Nunc tempor neque vel eleifend pretium. Morbi mattis congue fringilla. Maecenas at nulla luctus, faucibus eros a, vulputate velit. Ut imperdiet arcu urna, et volutpat tellus porta id. Integer non posuere diam. Praesent tincidunt diam malesuada, elementum eros rutrum, egestas mauris.\n\nQuisque viverra nisi in ante facilisis, vel accumsan sapien malesuada. Nulla cursus aliquam neque, euismod tempus velit iaculis sed. Nulla sed est vitae risus elementum ultrices. Nam fringilla leo nec dictum laoreet. Vivamus condimentum diam vel felis commodo maximus. Sed aliquam varius ornare. Nullam mi ante, ultrices id mi in, dignissim dapibus velit. Aenean ipsum leo, rutrum ac dapibus eget, auctor vitae est.\n\nVivamus vehicula aliquet posuere. Morbi efficitur magna sit amet facilisis tempor. Vivamus nec semper diam, laoreet accumsan tortor. Duis commodo id quam et dignissim. Duis volutpat mollis tellus ut accumsan. Nullam lacinia id ante quis convallis. Duis convallis risus vitae nulla porta cursus. Quisque ex nulla, viverra non risus vitae, tincidunt suscipit leo. Phasellus nec lectus tincidunt, tincidunt elit sed, dapibus ante.\n\nDonec egestas mauris at fermentum tincidunt. Quisque cursus nisl justo, ut condimentum lacus cursus non. Integer finibus urna tempus, placerat urna non, volutpat odio. Nullam pretium elit urna, vitae euismod sapien rhoncus id. Morbi ultricies vulputate leo tincidunt cursus. Etiam commodo nibh ornare ex aliquam, vel aliquet lectus molestie. Praesent sollicitudin euismod erat, eu tempus dui pellentesque eu. Aenean vulputate elit sit amet diam eleifend rhoncus. Vivamus placerat egestas mattis. Ut euismod pharetra vehicula. In hac habitasse platea dictumst. Maecenas ac porttitor mi.', 1),
(2, 'Bibliographie', NULL, 1),
(3, 'Fiche terrain', NULL, 1),
(4, 'Plan', NULL, 1),
(5, 'Réaliser un questionnaire', NULL, 2),
(6, 'Préparer un entretien', NULL, 2),
(7, 'Faire sa bibliographie', NULL, 2),
(8, 'Interpréter des données', NULL, 2),
(9, 'Citer ses sources', NULL, 3),
(10, 'Mettre en page', NULL, 3),
(11, 'Argumenter', NULL, 3),
(12, 'Consignes', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `enseignant`
--

CREATE TABLE `enseignant` (
  `idEnseignant` int(11) NOT NULL,
  `nomEnseignant` varchar(50) DEFAULT NULL,
  `prenomEnseignant` varchar(50) DEFAULT NULL,
  `mailEnseignant` varchar(50) DEFAULT NULL,
  `mdpEnseignant` text,
  `autorisationAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enseignant`
--

INSERT INTO `enseignant` (`idEnseignant`, `nomEnseignant`, `prenomEnseignant`, `mailEnseignant`, `mdpEnseignant`, `autorisationAdmin`) VALUES
(1, 'Bozo', 'Thierry', 'thierrybozo@gmail.com', '$2y$10$mOUKQ/THI6Mh3TbavG06buFmbzfKOndVlL38zzb17pqG3qBtcCovW', 1);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `idEvent` int(11) NOT NULL,
  `nomEvent` varchar(50) DEFAULT NULL,
  `descriptionEvent` text,
  `dateDebutEvent` date DEFAULT NULL,
  `dateFinEvent` date DEFAULT NULL,
  `typeEvent` varchar(50) DEFAULT NULL,
  `idCompteEtudiant` int(11) DEFAULT NULL,
  `idEnseignant` int(11) DEFAULT NULL,
  `idGroupeEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exemple`
--

CREATE TABLE `exemple` (
  `idExemple` int(11) NOT NULL,
  `titreExemple` text NOT NULL,
  `lienExemple` text NOT NULL,
  `idCategorieDocumentation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groupe_tache`
--

CREATE TABLE `groupe_tache` (
  `idGroupeTache` int(11) NOT NULL,
  `titreGroupeTache` varchar(50) DEFAULT NULL,
  `idCompteEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_tache`
--

INSERT INTO `groupe_tache` (`idGroupeTache`, `titreGroupeTache`, `idCompteEtudiant`) VALUES
(47, 'Untitled', 1);

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `idPromo` int(11) NOT NULL,
  `anneePromo` varchar(4) NOT NULL,
  `lienNotation` text NOT NULL,
  `anneeActuelle` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `idQuestionnaire` int(11) NOT NULL,
  `titreQuestionnaire` varchar(50) DEFAULT NULL,
  `lienAcces` varchar(50) DEFAULT NULL,
  `idCompteEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rendu`
--

CREATE TABLE `rendu` (
  `idRendu` int(11) NOT NULL,
  `nomRendu` text NOT NULL,
  `dateRendu` date DEFAULT NULL,
  `lienRendu` text,
  `idCompteEtudiant` int(11) DEFAULT NULL,
  `idCategorieRendu` int(11) DEFAULT NULL,
  `idSujet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rendu`
--

INSERT INTO `rendu` (`idRendu`, `nomRendu`, `dateRendu`, `lienRendu`, `idCompteEtudiant`, `idCategorieRendu`, `idSujet`) VALUES
(1, '', '2025-03-12', 'https://docs.google.com/document/d/1qb42I2QvuIFYKO2-kZbdjXSpuBhHok-hQZqCDjuqLyI/edit?tab=t.0', 2, 1, 2),
(2, '', '2025-03-12', 'https://docs.google.com/document/d/1bfwxrbi8efa8w6XUzrburUooNyV3sEZ9kQXT88FHPWs/edit?tab=t.0', 3, 1, 3),
(3, '', '2025-03-12', 'https://docs.google.com/document/d/1zB-43yUfss5GD13xEptgAOxPEuIFbKCuR-YoMxkwqbI/edit?tab=t.0', 5, 1, 5),
(4, '', '2025-03-12', 'https://docs.google.com/document/d/1-8bhtY9EmMjRupcSL2Q8H1P4tq-N0kwNBjYO1pFw7iw/edit?tab=t.0', 6, 1, 6),
(5, '', '2025-03-12', 'https://docs.google.com/document/d/1ooYPCy1lhBW2AuQwaP59FH-qd5gFJSuItRi5DR0ARn4/edit?tab=t.0', 7, 1, 7),
(6, '', '2025-03-12', 'https://docs.google.com/document/d/1JH-h-Ndncr6RE-q7XF5RsNcnS0yUE-wow_gq5v-qRlc/edit?tab=t.0', 8, 1, 8),
(7, '', '2025-03-12', 'https://docs.google.com/document/d/1ko9ddftIiMvK-g92rt27kZ-Kp-PaSp4TWfEBaxeqnCY/edit?tab=t.0#heading=h.7gcfrlbv5ldl', 9, 1, 9),
(8, '', '2025-03-12', 'https://docs.google.com/document/d/1M2JRpMUVeAYMTmx7W06csOhFJ0knJrvOfNjw12FceLc/edit?tab=t.0#heading=h.hlbin8obsj8', 10, 1, 10),
(9, '', '2025-03-12', 'https://docs.google.com/document/d/10a3ecqMHRDUbRtu7x1b_on__lvTMkmhWsStkdJUlLfg/edit?tab=t.0', 11, 1, 11),
(10, '', '2025-03-12', 'https://docs.google.com/document/d/1FZEq-s5G98Wlfh8a59jeMT3Ka1SglqBAaZfoVeuCg_U/edit?tab=t.0', 12, 1, 12),
(11, '', '2025-03-12', 'https://docs.google.com/document/d/1RBwaPZW0g8nzwJNmd6WW0X7m42rd54Ut/edit?tab=t.0', 13, 1, 13),
(12, '', '2025-03-12', 'https://docs.google.com/document/d/1LghC1fJjfqbxTfBXGMxKJZzNaQQnl4kabvwO_tHwydM/edit?tab=t.0', 14, 1, 14),
(13, '', '2025-03-12', 'https://docs.google.com/document/d/1YOfhkXn4tLGf7O17PH1lWkM3UsAolBTh/edit?rtpof=true&sd=true', 15, 1, 15),
(14, '', '2025-03-12', 'https://docs.google.com/document/d/1neA0O86TKvG_hiKEJufYR9qCAlBk3HsViQZXkC4WsH4/edit?tab=t.0', 16, 1, 16),
(15, '', '2025-03-12', 'https://docs.google.com/document/d/10qiDfgGSXbqtodcUlyGYYffWn2MATpSet_hGmXqwvN4/edit?tab=t.0', 17, 1, 17),
(16, '', '2025-03-12', 'https://docs.google.com/document/d/19cS5VxJdRW052RxXC-0c8L0C-ORlzorEnQEk2qhy8oY/edit?tab=t.0#heading=h.f9cch0jh6jy9', 18, 1, 18),
(17, '', '2025-03-12', 'https://docs.google.com/document/d/1k8fTXnz5SpyfEaLTdkgh7yulYKu8vKeJaE9kYvKXo-g/edit?tab=t.0', 19, 1, 19),
(18, '', '2025-03-12', 'https://docs.google.com/document/d/1iYx2DHiM0du6WxC0kyzGSFKOyN8gV2dXMJrkSRsdCUY/edit?tab=t.0', 20, 1, 20),
(19, '', '2025-03-12', 'https://docs.google.com/document/d/16qOpsSe7K18-0eXDkvOH0QvaiOb-3Mx5RXAyhBV7ec4/edit?tab=t.0#heading=h.fic5ew8h4xvk', 21, 1, 21),
(20, '', '2025-03-12', 'https://docs.google.com/document/d/1wHuw2m58SWjHKX2Fv1E-ZWa27Rg1Pu--d_P-kRtTco4/edit?tab=t.0', 22, 1, 22),
(21, '', '2025-03-12', 'https://docs.google.com/document/d/1Nu4bw5NIX92f7AvB2o9rpol2KR6gOiGx/edit?tab=t.0', 23, 1, 23),
(22, '', '2025-03-12', 'https://docs.google.com/document/d/1HYq_6UpTB3goDgz15wdtn_zbkKxNQ-xTG8lMtYoHFMU/edit?tab=t.0', 24, 1, 24),
(23, '', '2025-03-12', 'https://docs.google.com/document/d/1zooulDbH-XhWcA3uMispsHCcb5oxwiH_QtgLwLtGH9A/edit?tab=t.0', 25, 1, 25),
(24, '', '2025-03-12', 'https://docs.google.com/document/d/11zONQ-j6IjyAS6P09bNGvQv6G5aNJLQs_debx_116RQ/edit?tab=t.0', 26, 1, 26),
(25, '', '2025-03-12', 'https://docs.google.com/document/d/1CYflQTPuTMl4rpTHndoAdKVEZRpeOyEBriiftecj_f0/edit?tab=t.0', 27, 1, 27),
(26, '', '2025-03-12', 'https://docs.google.com/document/d/1s89X9Cj31RDqU7wiGGjipewRJjbDb6JrnUtQc46s8Wk/edit?tab=t.0', 28, 1, 28),
(27, '', '2025-03-12', 'https://docs.google.com/document/d/1RUC2gj9k-XrRUjzKj6tiIiXaTVS9BdVKNxQfAezA_II/edit?tab=t.0#heading=h.73p5yxjez9cr', 29, 1, 29),
(28, '', '2025-03-12', 'https://docs.google.com/document/d/1hORRTzDmWttDS1LmFkasz2UKa7WOTuAgEY8YGIsPrM4/edit?tab=t.0', 30, 1, 30),
(29, '', '2025-03-12', 'https://docs.google.com/document/d/1sMfZ50yEW7YBWFBxC66P7kFMJ1lBHiC1zjRjv2eH8cM/edit?tab=t.0', 31, 1, 31),
(30, '', '2025-03-12', 'https://docs.google.com/document/d/1SR7K-O9OsXRUXbquknRK3ggbj51KWA5GVYeaxpOJOPg/edit?tab=t.0', 32, 1, 32),
(31, '', '2025-03-12', 'https://docs.google.com/document/d/19t6pyqZooyuS17Mr_rPCMKJuTx9WorxkPSioqQbOqZc/edit?tab=t.0', 33, 1, 33),
(32, '', '2025-03-12', 'https://docs.google.com/document/d/1YMTuC7uvJlzJdyH1XoX6tPxZDSj1Nqf1xggdr33SgOw/edit?tab=t.0#heading=h.d29dw8wnhb1a', 34, 1, 34),
(33, '', '2025-03-12', 'https://docs.google.com/document/d/15ObWOXd1_puRsnvRHjzBAt1iY-8wMUTIjRFO1dBfza0/edit?tab=t.0', 35, 1, 35),
(34, '', '2025-03-12', 'https://docs.google.com/document/d/1soeuBPvv_vFKXHYnZuImSHL8EY7LJ8NItlEsRMzN3AY/edit?tab=t.0', 36, 1, 36),
(35, '', '2025-03-12', 'https://docs.google.com/document/d/1l0wDUfoGDnI371fTvbJh4-79JSZ3d_HdWtqCLDRYzJ8/edit?tab=t.0', 2, 2, 2),
(36, '', '2025-03-12', 'https://docs.google.com/document/d/1g3T7I8G_TNbJ-1L507cK0ha3BCuI__jXdfniFKNlo9w/edit?tab=t.0#heading=h.nieijkht2jbm', 3, 2, 3),
(37, '', '2025-03-12', 'https://docs.google.com/document/d/13jirPNFtZYBVqiHOCEsgSF7qnBxmDRrTYAIwZuLpXu8/edit?tab=t.0#heading=h.tv7r8dhu8gai', 5, 2, 5),
(38, '', '2025-03-12', 'https://docs.google.com/document/d/1fBG7gsaVcTrGvLex6dV9j64X0UGuslk4oKGhQ524VVQ/edit?tab=t.0', 6, 2, 6),
(39, '', '2025-03-12', 'https://docs.google.com/document/d/1gDQJxUY9j1RANZx0UyTf-TGbiAb_wDOjoMlFiuBaoRw/edit?tab=t.0', 7, 2, 7),
(40, '', '2025-03-12', 'https://docs.google.com/document/d/194XmnE_PJavtJfUooH83oe6bzJ9vD9lJrwUG7I1n4Lk/edit?tab=t.0', 8, 2, 8),
(41, '', '2025-03-12', 'https://docs.google.com/document/d/1delPgZFpUT9i5LZ6eNQUoO9OWwDK3p5zqD1_WBxFA1s/edit?tab=t.0', 9, 2, 9),
(42, '', '2025-03-12', 'https://docs.google.com/document/d/1WcrVoVXWnC8c-Yd0xs0QUSXHi6omS_iyIKdAhkky6KQ/edit?tab=t.0', 10, 2, 10),
(43, '', '2025-03-12', 'https://docs.google.com/document/d/1FgCoXQsz8Hu775mw1wSdiXKq3mNFuq8I-WRjw-DHjAs/edit?tab=t.0', 11, 2, 11),
(44, '', '2025-03-12', 'https://docs.google.com/document/d/1SEZ1ScECqpgJoJRZUIVaR5SNA_PN4wLhxHltACrim9U/edit?tab=t.0#heading=h.6r5sc522v68z', 12, 2, 12),
(45, '', '2025-03-12', 'https://docs.google.com/document/d/15R0c86BeSL-1jUG7Ap7UbzVMoYaVEa0k1r9qme_Pji0/edit?tab=t.0', 13, 2, 13),
(46, '', '2025-03-12', 'https://docs.google.com/document/d/1tQ5i2G6qWgLi-DW5ZtRCjTKS2peGBEVtga1Ah2XK1t0/edit?tab=t.0', 14, 2, 14),
(47, '', '2025-03-12', 'https://docs.google.com/document/d/1gb24bXZRm5Gm2FAiIHH736jEmRBl-cxwohVrgLIkOmI/edit?tab=t.0', 15, 2, 15),
(48, '', '2025-03-12', 'https://docs.google.com/document/d/1B5jeYf-hQSBgcUGQgvmx48YfAEXVx2FTzj0Uoz1iK7Q/edit?tab=t.0', 16, 2, 16),
(49, '', '2025-03-12', 'https://drive.google.com/file/d/1vwYK9rMU_kYLiRSi0EGUBoPtKgIQiJOS/view', 18, 2, 18),
(50, '', '2025-03-12', 'https://docs.google.com/document/d/1ubXJYAqalcxBBaFx_jx8P7-hUjGKBSRTl1H48XWpWFc/edit?tab=t.0', 19, 2, 19),
(51, '', '2025-03-12', 'https://docs.google.com/document/d/1VJ_G8SHYcEmhHhCXUE9PIDkYpzGTgQJ5ND33XN-wCVc/edit?tab=t.0#heading=h.y2srbl242khv', 20, 2, 20),
(52, '', '2025-03-12', 'https://docs.google.com/document/d/15PO6VptAWzY_Pq3zCkWgHX53nLmlXmgQgHxEndWtmR0/edit?tab=t.0#heading=h.fic5ew8h4xvk', 21, 2, 21),
(53, '', '2025-03-12', 'https://docs.google.com/document/d/1VidvQbov9wFFxl7p68aK_dMjQvIgPwGvLroBm9COwDo/edit?tab=t.0', 22, 2, 22),
(54, '', '2025-03-12', 'https://docs.google.com/document/d/16tjoX86xghnF6-VpVQqvTibppIstBwoNIXTtYWAztd8/edit?tab=t.0', 23, 2, 23),
(55, '', '2025-03-12', 'https://docs.google.com/document/d/1EmvGSlk0hSh2zTHFV9ZQfLzAwwdIo91bMLfTPFiyW_c/edit?tab=t.0#heading=h.kirnkhiht396', 24, 2, 24),
(56, '', '2025-03-12', 'https://docs.google.com/document/d/1O153ffSenjJluH-63TTor4OfenxIvzfYP3KkTTymLic/edit?usp=sharing', 25, 2, 25),
(57, '', '2025-03-12', 'https://docs.google.com/document/d/1ZqiNGYo6zlKzNtWjiYVxfhNgbkLm0LvieSYfOhOZp-s/edit?tab=t.0', 26, 2, 26),
(58, '', '2025-03-12', 'https://docs.google.com/document/d/14Wk0xoG0vxRbatxLJ9PmBmfhFXNtNO1v8NIBjLIrfvs/edit?tab=t.0', 27, 2, 27),
(59, '', '2025-03-12', 'https://docs.google.com/document/d/1NlzewAgOPzIro-lDMW77OsdmCs9doN0ygY4QsvXkBkc/edit?tab=t.0', 28, 2, 28),
(60, '', '2025-03-12', 'https://docs.google.com/document/d/10snbuSlkWr3UOCy5nGRkM3yLQ_9iaI5yg_uX_HYURl8/edit?tab=t.0#heading=h.73p5yxjez9cr', 29, 2, 29),
(61, '', '2025-03-12', 'https://docs.google.com/document/d/1by7c0Le1FW9XhLJzIHoRC8CrtPfJ3ZaHkJHlwBCQ74U/edit?tab=t.0', 30, 2, 30),
(62, '', '2025-03-12', 'https://docs.google.com/document/d/1m33SxvmQ4QSzJdNguQoMzafC75Kf-EE4UNFB4sdONAo/edit?tab=t.0', 31, 2, 31),
(63, '', '2025-03-12', 'https://docs.google.com/document/d/1i34IcSXWVAfUw80VZeJGmxn-x2wWHo_-9rMlOe49LUU/edit?tab=t.0', 32, 2, 32),
(64, '', '2025-03-12', 'https://docs.google.com/document/d/1wuLHAhIXrAJKjFXS0PhVIcXrP627AFs-5eiJV_ItUGo/edit?tab=t.0#heading=h.pvqve33s50d9', 34, 2, 34),
(65, '', '2025-03-12', 'https://docs.google.com/document/d/1vPRfNEs1uTmTPmHWMiS2qI23chSDh2612CfaxaA8L5U/edit?tab=t.0', 35, 2, 35),
(66, '', '2025-03-12', 'https://docs.google.com/document/d/17LtYIvkA0abAVInmH20LfvyanMHGbllQCkuP1rin5s4/edit?tab=t.0#heading=h.t6vscd4sxpek', 36, 2, 36),
(67, '', '2025-03-12', 'https://docs.google.com/document/d/1GWs6i-j3jLW77J5b5vBnVk2AindULvf6PlOMz1ujMa4/edit?tab=t.0', 2, 3, 2),
(68, '', '2025-03-12', 'https://docs.google.com/document/d/1w7-odOMYru852FuEop7I_H43dc6VeSuX7b8Yb6fZqqc/edit?tab=t.0', 3, 3, 3),
(69, '', '2025-03-12', 'https://docs.google.com/document/d/1blwYPkcOa1Z5pM3fgNn3CsL94Em_QSce2s-k8zgo6BU/edit?tab=t.0', 5, 3, 5),
(70, '', '2025-03-12', 'https://docs.google.com/document/d/10bNjpkaxw5w2q0Yv0DiS3dZbNAs13XhhqEnF7Qao46I/edit?tab=t.0', 6, 3, 6),
(71, '', '2025-03-12', 'https://docs.google.com/document/d/1sM89cKo59Xj_6AUuj0ugsQvielHORD6FPXiEYnI-fNc/edit?tab=t.0', 7, 3, 7),
(72, '', '2025-03-12', 'https://docs.google.com/document/d/1QHONRIit9kPM4aXjp2EPIHggwYfcgcG5JQlTyzP4tcM/edit?tab=t.0', 8, 3, 8),
(73, '', '2025-03-12', 'https://docs.google.com/document/d/1l2aqcgWybEQNl8SWJqAHloZ0bbz9AbxTgrYG1RTPYxU/edit?tab=t.0', 9, 3, 9),
(74, '', '2025-03-12', 'https://docs.google.com/document/d/1VJnl4SJeLv4C8fM7TFkJb4572DA_DvH1zHXSGcvr8do/edit?tab=t.0#heading=h.yovs4ndf6t4d', 10, 3, 10),
(75, '', '2025-03-12', 'https://docs.google.com/document/d/13d1-uIVisUFI3880LCL65-OUCi1QhdnTg9C9cF4vpMc/edit?tab=t.0', 11, 3, 11),
(76, '', '2025-03-12', 'https://docs.google.com/document/d/18JAefxX6_8auYh6PldIqX-HxwhYTjG9KctouvS75hzQ/edit?tab=t.0', 12, 3, 12),
(77, '', '2025-03-12', 'https://docs.google.com/document/d/1W29VAPQ9oPoAKna03PW5TfKOu4dO00p2lKLQqi5II9U/edit?tab=t.0', 13, 3, 13),
(78, '', '2025-03-12', 'https://docs.google.com/document/d/1WvJkL4Fpy4_nZjZrB5zl7hwdsuQZOshTXT2RZfuEOXI/edit?tab=t.0', 14, 3, 14),
(79, '', '2025-03-12', 'https://docs.google.com/document/d/1wbYsRAlYcwtsH-nvpX_JUs9nhqzYR8_AUHGrqskUdKA/edit?tab=t.0', 15, 3, 15),
(80, '', '2025-03-12', 'https://docs.google.com/document/d/1mmhjScELv-gBVC2anD8wiynE_AdrtFomwXCL5MmVIw4/edit?tab=t.0', 16, 3, 16),
(81, '', '2025-03-12', 'https://docs.google.com/document/d/19VqEBtKaJuivY7qVF7ErPgbP2ob4DqoiMPE75Wom6bc/edit?tab=t.0', 19, 3, 19),
(82, '', '2025-03-12', 'https://docs.google.com/document/d/10BIyNTwfOACw4f1zSUvC3fJYJb2B-O9-hP8cgahI4-I/edit?tab=t.0#heading=h.z9ur7gt6unmp', 20, 3, 20),
(83, '', '2025-03-12', 'https://docs.google.com/document/d/1kFr0ICVPsWmmRP_vMIWplnEB8Da8YNZclpljObVtKGc/edit?tab=t.0#heading=h.aqyyeoufmgxc', 21, 3, 21),
(84, '', '2025-03-12', 'https://docs.google.com/document/d/1QL3xzjgdbFfwmrZ7gkSbLzgNiKO5B6dKniR5gkus4bc/edit?tab=t.0', 22, 3, 22),
(85, '', '2025-03-12', 'https://docs.google.com/document/d/1rnthn6T-6Z3HQ77dzTrtIie0QIDBZAhB4yia1EH0R0k/edit?tab=t.0', 23, 3, 23),
(86, '', '2025-03-12', 'https://docs.google.com/document/d/1Wcb9vNvf4j6IN8rNKuZOPnCcsEKNPJART-1GaOsf46k/edit?tab=t.0#heading=h.ls9i5lx0rnco', 24, 3, 24),
(87, '', '2025-03-12', 'https://docs.google.com/document/d/1kbw2tA2sTfNEeV4KWsTJyyypI-VfxWunWnYIYQqxTfc/edit?tab=t.0', 26, 3, 26),
(88, '', '2025-03-12', 'https://docs.google.com/document/d/1s3SG-Trbiwn4o4tO95GLUEsER6OcWMvjnFvF5_rGdE0/edit?tab=t.0', 27, 3, 27),
(89, '', '2025-03-12', 'https://docs.google.com/document/d/17mTSORW1mfMRQgSSAADDYq03xGFRH33FwgpvK_G6yOs/edit?tab=t.0', 28, 3, 28),
(90, '', '2025-03-12', 'https://docs.google.com/document/d/1Dh53HvVQ-Wm6D_OXvfBHA0KcPCLrTvRRIkQrD4Ss6xo/edit?tab=t.0#heading=h.b8r2x7uzfc50', 29, 3, 29),
(91, '', '2025-03-12', 'https://docs.google.com/document/d/14MmrPqHYuBQpz7zYcR0GEZclmbvTpngW927IRDnU4qs/edit?tab=t.0', 30, 3, 30),
(92, '', '2025-03-12', 'https://docs.google.com/document/d/1Temc7VBd83kWhSTIEqGI0Jjlmsc9B-0lmTbtdYDd_QY/edit?tab=t.0', 31, 3, 31),
(93, '', '2025-03-12', 'https://docs.google.com/document/d/1MyLcKyVjHbxZaZwqOFbveF9h1n-hzSJB65_SJ0d0GNA/edit?tab=t.0#heading=h.x737ydetmd9o', 32, 3, 32),
(94, '', '2025-03-12', 'https://docs.google.com/document/d/17G0w3DnD4vmFAoXMKHvwVYJvufqH04q6WBoesry15r4/edit', 33, 3, 33),
(95, '', '2025-03-12', 'https://docs.google.com/document/d/1VMAglTTLXTfgSjjsaWmWHk_MASqrtwbpW0pW52zDVd8/edit?tab=t.0', 35, 3, 35),
(96, '', '2025-03-12', 'https://docs.google.com/document/d/1FKcEk97Jk_I4hntVrv9zxY5NNfU-3g7h-rQA5fhsEK0/edit?tab=t.0', 36, 3, 36),
(97, '', '2024-03-12', 'https://docs.google.com/document/d/1dXoVsmlUNOkXsltNAS1t0czSARdGqnIl/edit', 37, 4, 37),
(98, '', '2024-03-13', 'https://docs.google.com/document/d/1HpQyLWlHuHFFTLKdO8V8p3PwDXLL28kxQ0Uzsff9_Ks/edit?tab=t.0', 38, 4, 38),
(99, '', '2024-03-14', 'https://docs.google.com/document/d/1QJ0DbDxVo7Orpyw4VlBi_guL507JHijQwyRg7u94JF8/edit?tab=t.0', 39, 4, 39),
(100, '', '2024-03-15', 'https://docs.google.com/document/d/1_ajv8FXKUON3zVOy4UM9w-BUlwY-M_XuvTMQGkMOEv4/edit?tab=t.0', 40, 4, 40),
(101, '', '2024-03-16', 'https://docs.google.com/document/d/1NOcwD_4UVIX2akEURJmVjsrdZ4OlRCDl7oi5BIohNVg/edit?tab=t.0', 41, 4, 41),
(102, '', '2024-03-17', 'https://docs.google.com/document/d/15RyqR9597AI5W9ArdCWFYb3cZsF59_vkbl-wsA3Bn34/edit?tab=t.0', 42, 4, 42),
(103, '', '2024-03-18', 'https://docs.google.com/document/d/1nQK4SK7i5sE2oqKP4du-P9F5mHXB-onrM_Ix6iEnv2M/edit?tab=t.0', 43, 4, 43),
(104, '', '2024-03-19', 'https://drive.google.com/file/d/1N_kCDtHCIQVRJikbdZsNJhdLyK5wRNoU/view', 44, 4, 44),
(105, '', '2024-03-20', 'https://drive.google.com/file/d/1NSkvXt8SN6Tn_fFrFJZKWSGQ6AfTY-Dn/view', 45, 4, 45),
(106, '', '2024-03-21', 'https://docs.google.com/document/d/1TpI0Mellg_bnpVedUxxU7pU7Fp-rmO0_cuzqRuSp_rc/edit?tab=t.0', 46, 4, 46),
(107, '', '2024-03-22', 'https://docs.google.com/document/d/1BomCIgJY4skWLVJ2l9A8gacl-c8wABLhXSeMrPC9CDw/edit?tab=t.0', 47, 4, 47),
(108, '', '2024-03-23', 'https://docs.google.com/document/d/1J1cG4168Y-IV6frf6JUAN2HzmP6UskbSvo0UJTv9H_k/edit?tab=t.0', 48, 4, 48),
(109, '', '2024-03-24', 'https://docs.google.com/document/d/13KyDihwOQVu0fpfcW8LViKatAqJyWlGQFGZ_KQ55bxk/edit?tab=t.0', 49, 4, 49),
(110, '', '2024-03-25', 'https://docs.google.com/document/d/1p2u-qhFZym2A-klIxdQxDcKq9m8saU0Ka-TTEQ_VQ44/edit?tab=t.0', 50, 4, 50),
(111, '', '2024-03-26', 'https://docs.google.com/document/d/1rL3F2owixTkEWTHUTk3JGuXGwD_VXnPWvkWY3IxS_Ko/edit?tab=t.0', 51, 4, 51),
(112, '', '2024-03-27', 'https://docs.google.com/document/d/1fMW020Ycnq5nWMACbiYvIyIeE5tosP3f0FIIeGI1ejA/edit?tab=t.0', 52, 4, 52),
(113, '', '2024-03-28', 'https://docs.google.com/document/d/1S7vrMPmYAY7JaBnKL0Dkl0bTjpHqZEmhxxA79WJDW_0/edit?tab=t.0', 53, 4, 53),
(114, '', '2024-03-29', 'https://drive.google.com/file/d/1Zk0l-_bhxeHFEoXBOLazmhYZqmaBG8tC/view', 54, 4, 54),
(115, '', '2024-03-30', 'https://drive.google.com/file/d/1IcpdSEoilzPHhctKHX_l8xB_uZqLduHv/view', 55, 4, 55),
(116, '', '2024-03-31', 'https://drive.google.com/file/d/1IcpdSEoilzPHhctKHX_l8xB_uZqLduHv/view', 56, 4, 56),
(117, '', '2024-04-01', 'https://docs.google.com/document/d/1UXJG4NUAmrhXJdYvr38hZOaloL7KomQD2r4kv0ZvkO4/edit?tab=t.0', 57, 4, 57),
(118, '', '2024-04-02', 'https://docs.google.com/document/d/1gfEKx5G_GuOxnGGbMWQWikqBYzVpRv8aKpAy709BXXE/edit?tab=t.0', 58, 4, 58),
(119, '', '2025-03-04', 'https://drive.google.com/file/d/1sz0EgQ0jbx5kpB4MqqKFDaE9y9NeDfSp/view?usp=sharing', 3, 7, 3),
(120, '', '2025-03-06', 'https://www.canva.com/design/DAGgARf0-x4/pwQdI-J6VsV9HLdOsL8mAg/edit?utm_content=DAGgARf0-x4&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 5, 7, 5),
(121, '', '2025-03-04', 'https://1drv.ms/p/c/48e6b5a4c4f3d794/EReAmWu7Oq1CtRriQxslyM0BWlGuazEEaj7w_653tujsxw?e=knxjPH', 7, 7, 7),
(122, '', '2025-03-04', 'https://docs.google.com/document/d/16td7FhHDpZg59WEdHOSq5hkaOPYi_6vf-LMlR9pPre8/edit?usp=sharing', 9, 7, 9),
(123, '', '2025-03-06', 'https://docs.google.com/presentation/d/1xN-VXpwDou6YelTJKGBOsyYLaz5TEkja/edit?usp=sharing&ouid=106649786678723002791&rtpof=true&sd=true', 10, 7, 10),
(124, '', '2025-03-06', 'https://www.canva.com/design/DAGg5RrMSTA/WHVIYvJctoL3MqaaXOxJog/edit?utm_content=DAGg5RrMSTA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 11, 7, 11),
(125, '', '2025-03-04', 'https://www.canva.com/design/DAGgrxyvxPY/feYWygy1eL2YQ6o_j1e_dA/edit?utm_content=DAGgrxyvxPY&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 12, 7, 12),
(126, '', '2025-03-04', 'https://www.canva.com/design/DAGglHNIRIw/seIZFeYPezzyW74_ojozBA/edit?utm_content=DAGglHNIRIw&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 13, 7, 13),
(127, '', '2025-03-04', 'https://www.canva.com/design/DAGgsSAIf3U/ud6HbkrC1-eTxXwoClMWVQ/view?utm_content=DAGgsSAIf3U&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=ha2380c7217', 14, 7, 14),
(128, '', '2025-03-04', 'https://www.canva.com/design/DAGgZiBr2WI/_BiVhntkO4j_A6urxolrxA/edit?utm_content=DAGgZiBr2WI&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 15, 7, 15),
(129, '', '2025-03-06', 'https://docs.google.com/presentation/d/1RAMbH-C7lVjVBQJaAFQhtW5IfLpmLQqGnG4yth3IIE8/edit', 16, 7, 16),
(130, '', '2025-02-28', 'https://docs.google.com/presentation/d/1emckYYnV48XAuP8O7Fu4JPzM0RxIEo2PuS2An8mcvlQ/edit?usp=sharing', 17, 7, 17),
(131, '', '2025-02-28', 'https://www.canva.com/design/DAGgVOMbHLU/xmHdnpRO2ujl_x2oW-xQFA/view?utm_content=DAGgVOMbHLU&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=h98f3545443', 18, 7, 18),
(132, '', '2025-02-28', 'https://www.canva.com/design/DAGgCJaX8J4/a-v9PPBFmMMnd74gPD_RWA/edit', 19, 7, 19),
(133, '', '2025-02-26', 'https://www.canva.com/design/DAGgIh4PGp4/6eWaUKJwJfIaH0Z7gAOGuQ/edit?utm_content=DAGgIh4PGp4&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 20, 7, 20),
(134, '', '2025-02-26', 'https://drive.google.com/file/d/1PwmIVE0T3QgoYrDLpOM42Kf_Hhc7gv2h/view?usp=sharing', 21, 7, 21),
(135, '', '2025-02-26', 'https://docs.google.com/presentation/d/1BxzKibmLQ5PNJ98G8xZ54rXfqT0u8B9bbnQRSe19Hus/edit#slide=id.g33a2d5ab0c3_0_4525', 23, 7, 23),
(136, '', '2025-02-26', 'https://www.canva.com/design/DAGgMND_QKk/QMpYPdgI50OFhMcZyMhb6A/edit?utm_content=DAGgMND_QKk&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 26, 7, 26),
(137, '', '2025-02-26', 'https://www.canva.com/design/DAGfL1DHdFQ/-_FY1HJ9WCMfEvqvkkafrQ/edit?utm_content=DAGfL1DHdFQ&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 27, 7, 27),
(138, '', '2025-02-26', 'https://www.canva.com/design/DAGgGMcRazI/RTLT444GwzTvkDnne04baw/edit?utm_content=DAGgGMcRazI&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 28, 7, 28),
(139, '', '2025-02-28', 'https://www.figma.com/deck/wUlTHY1qVNtzx5bTMC3FXz', 29, 7, 29),
(140, '', '2025-02-28', 'https://www.figma.com/deck/R8rBqcEWHbueEWm3gJBUTn/Mini-soutenance?node-id=1-337&t=YB9BfaXX5bfcgYdJ-1&scaling=min-zoom&content-scaling=fixed&page-id=0%3A1', 30, 7, 30),
(141, '', '2025-02-26', 'https://www.canva.com/design/DAGgHSsouDk/V4S7fIx03e_qDS57mruZCA/edit?utm_content=DAGgHSsouDk&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton', 31, 7, 31),
(142, '', '2025-02-26', 'https://docs.google.com/presentation/d/1OyQGep6-Hn-OMCehZ-YHbL6d6L45R_oMmfjLqFgtLhY/edit?usp=drivesdk', 32, 7, 32);

-- --------------------------------------------------------

--
-- Table structure for table `ressource`
--

CREATE TABLE `ressource` (
  `idRessource` int(11) NOT NULL,
  `titreRessource` varchar(150) DEFAULT NULL,
  `lienRessource` text,
  `idCategorieRessources` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ressource`
--

INSERT INTO `ressource` (`idRessource`, `titreRessource`, `lienRessource`, `idCategorieRessources`) VALUES
(1, 'Revue Réseaux', 'https://www.cairn.info/revue-reseaux.htm#liste', 1),
(2, 'La vie des idées', 'http://www.laviedesidees.fr/-Revue-.html', 1),
(3, 'Lectures', 'http://lectures.revues.org/1440', 1),
(4, 'Les classiques des sciences sociales', 'http://classiques.uqac.ca/', 1),
(5, 'La Boite à Outils des Historiens', 'http://www.boiteaoutils.info/', 1),
(7, 'INSEE', 'http://www.insee.fr/fr/', 1),
(8, 'Le code a changé', 'https://www.radiofrance.fr/franceinter/podcasts/le-code-a-change', 2),
(9, 'Mais où va le web ?', 'https://maisouvaleweb.fr/', 2),
(10, 'La Quadrature du Net', 'https://www.laquadrature.net/', 2),
(11, 'Affordance', 'https://affordance.framasoft.org/', 2),
(12, 'internetactu', 'http://www.internetactu.net/', 2),
(14, 'Pixel', 'http://www.franceculture.fr/emission-pixel-0', 2),
(16, 'Catalogue de la Bibliothèque de Gustave Eiffel', 'https://bu.univ-gustave-eiffel.fr/accueil/ressources_electroniques_a_z', 3),
(17, 'Catalogue général de la BNF', 'http://catalogue.bnf.fr/index.do', 3),
(18, 'Catalogue de la Bibliothèque Publique d\'Information (BPI)', 'http://catalogue.bpi.fr/tout', 3),
(19, 'Catalogue Sudoc', 'http://www.sudoc.abes.fr/xslt/DB=2.1/LNG=FR/START_WELCOME', 3),
(20, 'Catalogue des Bibliothèques d\'arrondissement de la ville de Paris', 'https://bibliotheques.paris.fr/', 3),
(21, 'CAIRN', 'http://www.cairn.info/', 3),
(22, 'Persee', 'http://www.persee.fr/web/revues/home', 3),
(23, 'Revues.org', 'http://www.revues.org/', 3),
(24, 'Médialab Sciences Po', 'https://medialab.sciencespo.fr/', 4),
(25, 'LISIS', 'http://umr-lisis.fr/', 4);

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

-- --------------------------------------------------------

--
-- Table structure for table `tache`
--

CREATE TABLE `tache` (
  `idTache` int(11) NOT NULL,
  `titreTache` varchar(50) DEFAULT NULL,
  `validation` tinyint(1) DEFAULT NULL,
  `idGroupeTache` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloc_note`
--
ALTER TABLE `bloc_note`
  ADD PRIMARY KEY (`idNote`),
  ADD KEY `idCompteEtudiant` (`idCompteEtudiant`);

--
-- Indexes for table `categorie_documentation`
--
ALTER TABLE `categorie_documentation`
  ADD PRIMARY KEY (`idCategorieDocumentation`);

--
-- Indexes for table `categorie_rendu`
--
ALTER TABLE `categorie_rendu`
  ADD PRIMARY KEY (`idCategorieRendu`);

--
-- Indexes for table `categorie_ressources`
--
ALTER TABLE `categorie_ressources`
  ADD PRIMARY KEY (`idCategorieRessources`);

--
-- Indexes for table `compte_etudiant`
--
ALTER TABLE `compte_etudiant`
  ADD PRIMARY KEY (`idCompteEtudiant`);

--
-- Indexes for table `documentation`
--
ALTER TABLE `documentation`
  ADD PRIMARY KEY (`idDocumentation`),
  ADD KEY `idCategorieDocumentation` (`idCategorieDocumentation`);

--
-- Indexes for table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`idEnseignant`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`idEvent`),
  ADD KEY `idCompteEtudiant` (`idCompteEtudiant`),
  ADD KEY `idEnseignant` (`idEnseignant`);

--
-- Indexes for table `exemple`
--
ALTER TABLE `exemple`
  ADD PRIMARY KEY (`idExemple`),
  ADD KEY `fkExempleCateDocumentation` (`idCategorieDocumentation`);

--
-- Indexes for table `groupe_tache`
--
ALTER TABLE `groupe_tache`
  ADD PRIMARY KEY (`idGroupeTache`),
  ADD KEY `idCompteEtudiant` (`idCompteEtudiant`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`idPromo`);

--
-- Indexes for table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`idQuestionnaire`),
  ADD KEY `idCompteEtudiant` (`idCompteEtudiant`);

--
-- Indexes for table `rendu`
--
ALTER TABLE `rendu`
  ADD PRIMARY KEY (`idRendu`),
  ADD KEY `idEtudiant` (`idCompteEtudiant`),
  ADD KEY `idCategorieRendu` (`idCategorieRendu`),
  ADD KEY `idSujet` (`idSujet`);

--
-- Indexes for table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`idRessource`),
  ADD KEY `idCategorieRessources` (`idCategorieRessources`);

--
-- Indexes for table `sujet`
--
ALTER TABLE `sujet`
  ADD PRIMARY KEY (`idSujet`),
  ADD KEY `idEtudiant` (`idCompteEtudiant`);

--
-- Indexes for table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`idTache`),
  ADD KEY `idGroupeTache` (`idGroupeTache`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloc_note`
--
ALTER TABLE `bloc_note`
  MODIFY `idNote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categorie_documentation`
--
ALTER TABLE `categorie_documentation`
  MODIFY `idCategorieDocumentation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categorie_rendu`
--
ALTER TABLE `categorie_rendu`
  MODIFY `idCategorieRendu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categorie_ressources`
--
ALTER TABLE `categorie_ressources`
  MODIFY `idCategorieRessources` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `compte_etudiant`
--
ALTER TABLE `compte_etudiant`
  MODIFY `idCompteEtudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `documentation`
--
ALTER TABLE `documentation`
  MODIFY `idDocumentation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `idEnseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `idEvent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exemple`
--
ALTER TABLE `exemple`
  MODIFY `idExemple` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groupe_tache`
--
ALTER TABLE `groupe_tache`
  MODIFY `idGroupeTache` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `idPromo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `idQuestionnaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rendu`
--
ALTER TABLE `rendu`
  MODIFY `idRendu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `idRessource` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `idSujet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `tache`
--
ALTER TABLE `tache`
  MODIFY `idTache` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloc_note`
--
ALTER TABLE `bloc_note`
  ADD CONSTRAINT `bloc_note_ibfk_1` FOREIGN KEY (`idCompteEtudiant`) REFERENCES `compte_etudiant` (`idCompteEtudiant`);

--
-- Constraints for table `documentation`
--
ALTER TABLE `documentation`
  ADD CONSTRAINT `documentation_ibfk_1` FOREIGN KEY (`idCategorieDocumentation`) REFERENCES `categorie_documentation` (`idCategorieDocumentation`);

--
-- Constraints for table `exemple`
--
ALTER TABLE `exemple`
  ADD CONSTRAINT `fkExempleCateDocumentation` FOREIGN KEY (`idCategorieDocumentation`) REFERENCES `categorie_documentation` (`idCategorieDocumentation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
