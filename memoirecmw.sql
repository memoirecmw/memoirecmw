-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 13 mars 2025 à 15:36
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `memoirecmw`
--

-- --------------------------------------------------------

--
-- Structure de la table `bloc_note`
--

CREATE TABLE `bloc_note` (
  `idNote` int(11) NOT NULL,
  `descriptionNote` text,
  `idCompteEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bloc_note`
--

INSERT INTO `bloc_note` (`idNote`, `descriptionNote`, `idCompteEtudiant`) VALUES
(6, 'Saki ', 59),
(7, '', 64);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_documentation`
--

CREATE TABLE `categorie_documentation` (
  `idCategorieDocumentation` int(11) NOT NULL,
  `titreCategorieDocumentation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_documentation`
--

INSERT INTO `categorie_documentation` (`idCategorieDocumentation`, `titreCategorieDocumentation`) VALUES
(1, 'Travaux préparatoires'),
(2, 'Recherches / Enquêtes'),
(3, 'Rédaction'),
(4, 'Soutenance');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_rendu`
--

CREATE TABLE `categorie_rendu` (
  `idCategorieRendu` int(11) NOT NULL,
  `titreCategorieRendu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_rendu`
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
-- Structure de la table `categorie_ressources`
--

CREATE TABLE `categorie_ressources` (
  `idCategorieRessources` int(11) NOT NULL,
  `titreCategorieRessources` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_ressources`
--

INSERT INTO `categorie_ressources` (`idCategorieRessources`, `titreCategorieRessources`) VALUES
(1, 'Sciences sociales'),
(2, 'Autour du numérique'),
(3, 'Outils Bibliographiques'),
(4, 'Du côté des labos');

-- --------------------------------------------------------

--
-- Structure de la table `compte_etudiant`
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
-- Déchargement des données de la table `compte_etudiant`
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
(59, 'Sakina', 'Douiou', 'saki@gmail.com', '$2y$10$hHPztzX5953AWnWpVIcCReP3UM2zoKM6uzU5o2mtTKj0gR1q8Q7Ui', 2025, 1, NULL),
(60, 'Caca', 'Zizi', 'zizi@gmail.com', '$2y$10$7wk/gjr8UF5llE066k3hceijPdUcZtUDelmJ6g26jjv7dsuy.ulFK', 2026, 1, NULL),
(61, 'Cucul', 'Caca', 'caca@gmail.com', '$2y$10$.gEBM46EFO3HQu6kU5ab9u.cZdLZf9mQ2AATjqZKYfuYQHWkfEVIi', 2026, 1, NULL),
(62, 'Gaming', 'Prouprou', 'pipi@gmail.com', '$2y$10$DzyQFcg6rvro2phlj/ZpaeW49AD3jI5ELvkKN3t0Xt/krU4E1sLD.', 2026, 1, 1),
(63, 'Pepi', 'Peps', 'pepi@gmail.com', '$2y$10$/zzofmzYj7Z5ZW12IMyK4.P0YYcAVjsKIVTi/BQnRuEX6Vq0gnRwS', 2026, 1, 1),
(64, 'Rudy', 'Dyru', 'rudy@gmail.com', '$2y$10$Rh2r0LHU1NaOOdGIwlHhzOSlGagF7hXm0amXn//THKwSS2IYGNnjy', 2026, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `documentation`
--

CREATE TABLE `documentation` (
  `idDocumentation` int(11) NOT NULL,
  `titreDocumentation` varchar(50) DEFAULT NULL,
  `descriptionDocumentation` text,
  `idCategorieDocumentation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `documentation`
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
(12, 'Consignes', NULL, 4),
(13, 'Utiliser l\'IA', NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
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
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`idEnseignant`, `nomEnseignant`, `prenomEnseignant`, `mailEnseignant`, `mdpEnseignant`, `autorisationAdmin`) VALUES
(1, 'Bozo', 'Thierry', 'thierrybozo@gmail.com', '$2y$10$mOUKQ/THI6Mh3TbavG06buFmbzfKOndVlL38zzb17pqG3qBtcCovW', 1);

-- --------------------------------------------------------

--
-- Structure de la table `event`
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
-- Structure de la table `exemple`
--

CREATE TABLE `exemple` (
  `idExemple` int(11) NOT NULL,
  `titreExemple` text NOT NULL,
  `lienExemple` text NOT NULL,
  `idCategorieDocumentation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `groupe_tache`
--

CREATE TABLE `groupe_tache` (
  `idGroupeTache` int(11) NOT NULL,
  `titreGroupeTache` varchar(50) DEFAULT NULL,
  `idCompteEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groupe_tache`
--

INSERT INTO `groupe_tache` (`idGroupeTache`, `titreGroupeTache`, `idCompteEtudiant`) VALUES
(47, 'Untitled', 1);

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `idQuestionnaire` int(11) NOT NULL,
  `titreQuestionnaire` varchar(50) DEFAULT NULL,
  `lienAcces` varchar(50) DEFAULT NULL,
  `idCompteEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rendu`
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
-- Déchargement des données de la table `rendu`
--

INSERT INTO `rendu` (`idRendu`, `nomRendu`, `dateRendu`, `lienRendu`, `idCompteEtudiant`, `idCategorieRendu`, `idSujet`) VALUES
(117, 'mini-soutenanceDOUIOUsakina20250312122918', '2025-03-12', 'includes/upload/mini-soutenance/mini-soutenanceDOUIOUsakina20250312122918.pdf', 59, 7, 2),
(118, 'mini-soutenanceZIZIcaca202503121410', '2025-03-12', 'includes/upload/mini-soutenance/mini-soutenanceZIZIcaca202503121410.pdf', 60, 7, 3),
(119, 'bibliographieZIZIcaca20250312', '2025-03-12', 'includes/upload/bibliographie/bibliographieZIZIcaca20250312.pdf', 60, 2, 4),
(120, 'mini-soutenanceDYRUrudy20250312', '2025-03-12', 'includes/upload/mini-soutenance/mini-soutenanceDYRUrudy20250312.pdf', 64, 7, 5),
(121, 'mini-soutenanceDYRUrudy20250312', '2025-03-12', 'includes/upload/mini-soutenance/mini-soutenanceDYRUrudy20250312.pdf', 64, 7, 6),
(122, 'fiche-validationDYRUrudy20250313', '2025-03-13', 'includes/upload/fiche-validation/fiche-validationDYRUrudy20250313.pdf', 64, 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `ressource`
--

CREATE TABLE `ressource` (
  `idRessource` int(11) NOT NULL,
  `titreRessource` varchar(150) DEFAULT NULL,
  `lienRessource` text,
  `idCategorieRessources` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ressource`
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
-- Structure de la table `sujet`
--

CREATE TABLE `sujet` (
  `idSujet` int(11) NOT NULL,
  `titreSujet` varchar(50) DEFAULT NULL,
  `dateSujet` date DEFAULT NULL,
  `idCompteEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sujet`
--

INSERT INTO `sujet` (`idSujet`, `titreSujet`, `dateSujet`, `idCompteEtudiant`) VALUES
(1, 'rest', '2025-03-12', 1),
(2, 'Savoir, Culture & Youtube', '2025-03-12', 59),
(3, 'EAZAZAEAZEAZ', '2025-03-12', 60),
(4, 'eazeazeazeza', '2025-03-12', 60),
(5, 'azeazezazazaeaz', '2025-03-12', 64),
(6, 'eazezsqedqzeaedasq', '2025-03-12', 64),
(7, '', '2025-03-13', 64);

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE `tache` (
  `idTache` int(11) NOT NULL,
  `titreTache` varchar(50) DEFAULT NULL,
  `validation` tinyint(1) DEFAULT NULL,
  `idGroupeTache` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bloc_note`
--
ALTER TABLE `bloc_note`
  ADD PRIMARY KEY (`idNote`),
  ADD KEY `idCompteEtudiant` (`idCompteEtudiant`);

--
-- Index pour la table `categorie_documentation`
--
ALTER TABLE `categorie_documentation`
  ADD PRIMARY KEY (`idCategorieDocumentation`);

--
-- Index pour la table `categorie_rendu`
--
ALTER TABLE `categorie_rendu`
  ADD PRIMARY KEY (`idCategorieRendu`);

--
-- Index pour la table `categorie_ressources`
--
ALTER TABLE `categorie_ressources`
  ADD PRIMARY KEY (`idCategorieRessources`);

--
-- Index pour la table `compte_etudiant`
--
ALTER TABLE `compte_etudiant`
  ADD PRIMARY KEY (`idCompteEtudiant`);

--
-- Index pour la table `documentation`
--
ALTER TABLE `documentation`
  ADD PRIMARY KEY (`idDocumentation`),
  ADD KEY `idCategorieDocumentation` (`idCategorieDocumentation`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`idEnseignant`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`idEvent`),
  ADD KEY `idCompteEtudiant` (`idCompteEtudiant`),
  ADD KEY `idEnseignant` (`idEnseignant`);

--
-- Index pour la table `exemple`
--
ALTER TABLE `exemple`
  ADD PRIMARY KEY (`idExemple`),
  ADD KEY `fkExempleCateDocumentation` (`idCategorieDocumentation`);

--
-- Index pour la table `groupe_tache`
--
ALTER TABLE `groupe_tache`
  ADD PRIMARY KEY (`idGroupeTache`),
  ADD KEY `idCompteEtudiant` (`idCompteEtudiant`);

--
-- Index pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`idQuestionnaire`),
  ADD KEY `idCompteEtudiant` (`idCompteEtudiant`);

--
-- Index pour la table `rendu`
--
ALTER TABLE `rendu`
  ADD PRIMARY KEY (`idRendu`),
  ADD KEY `idEtudiant` (`idCompteEtudiant`),
  ADD KEY `idCategorieRendu` (`idCategorieRendu`),
  ADD KEY `idSujet` (`idSujet`);

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`idRessource`),
  ADD KEY `idCategorieRessources` (`idCategorieRessources`);

--
-- Index pour la table `sujet`
--
ALTER TABLE `sujet`
  ADD PRIMARY KEY (`idSujet`),
  ADD KEY `idEtudiant` (`idCompteEtudiant`);

--
-- Index pour la table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`idTache`),
  ADD KEY `idGroupeTache` (`idGroupeTache`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bloc_note`
--
ALTER TABLE `bloc_note`
  MODIFY `idNote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `categorie_documentation`
--
ALTER TABLE `categorie_documentation`
  MODIFY `idCategorieDocumentation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `categorie_rendu`
--
ALTER TABLE `categorie_rendu`
  MODIFY `idCategorieRendu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `categorie_ressources`
--
ALTER TABLE `categorie_ressources`
  MODIFY `idCategorieRessources` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `compte_etudiant`
--
ALTER TABLE `compte_etudiant`
  MODIFY `idCompteEtudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `documentation`
--
ALTER TABLE `documentation`
  MODIFY `idDocumentation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `idEnseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `idEvent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exemple`
--
ALTER TABLE `exemple`
  MODIFY `idExemple` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe_tache`
--
ALTER TABLE `groupe_tache`
  MODIFY `idGroupeTache` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `idQuestionnaire` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rendu`
--
ALTER TABLE `rendu`
  MODIFY `idRendu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `idRessource` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `sujet`
--
ALTER TABLE `sujet`
  MODIFY `idSujet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `tache`
--
ALTER TABLE `tache`
  MODIFY `idTache` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bloc_note`
--
ALTER TABLE `bloc_note`
  ADD CONSTRAINT `bloc_note_ibfk_1` FOREIGN KEY (`idCompteEtudiant`) REFERENCES `compte_etudiant` (`idCompteEtudiant`);

--
-- Contraintes pour la table `documentation`
--
ALTER TABLE `documentation`
  ADD CONSTRAINT `documentation_ibfk_1` FOREIGN KEY (`idCategorieDocumentation`) REFERENCES `categorie_documentation` (`idCategorieDocumentation`);

--
-- Contraintes pour la table `exemple`
--
ALTER TABLE `exemple`
  ADD CONSTRAINT `fkExempleCateDocumentation` FOREIGN KEY (`idCategorieDocumentation`) REFERENCES `categorie_documentation` (`idCategorieDocumentation`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
