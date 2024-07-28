-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 19 avr. 2024 à 10:00
-- Version du serveur :  5.7.24
-- Version de PHP :  7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `profil_infos`
--

-- --------------------------------------------------------

--
-- Structure de la table `apprenants`
--

DROP TABLE IF EXISTS `apprenants`;
CREATE TABLE IF NOT EXISTS `apprenants` (
  `id_profil` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `referentiel` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `profil` blob NOT NULL,
  PRIMARY KEY (`id_profil`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `apprenants`
--

INSERT INTO `apprenants` (`id_profil`, `Nom`, `Prenom`, `referentiel`, `email`, `telephone`, `adresse`, `profil`) VALUES
(1, 'Diallo', 'Khadidiatou', '', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(2, 'Diallo', 'Khadidiatou', '', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(3, 'Diallo', 'Khadidiatou', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x536e6170636861742d3130393235373036332e6a7067),
(4, 'Diallo', 'Khadidiatou', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(5, 'Diallo', 'Khadidiatou', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(6, 'Diallo', 'Khadidiatou', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x536e6170636861742d3430353639313331392e6a7067),
(7, 'Diallo', 'Khadidiatou', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x32303233303730315f3232323533392e6a7067),
(8, 'Diallo', 'Khadidiatou', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x6b686164696469612e6a7067),
(9, 'Diallo', 'Khadidiatou', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x6b686164696469612e6a7067),
(10, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(11, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(12, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(13, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(14, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(15, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(16, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(17, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(18, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(19, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(20, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', ''),
(21, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(22, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(23, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(24, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(25, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(26, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(27, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(28, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(29, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(30, 'Khadidiatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(31, 'Fatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(32, 'Fatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(33, 'Fatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(34, 'Fatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(35, 'Fatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576),
(36, 'Fatou', 'Diallo', 'AWS', 'kadiallo96@gmail.com', '+221706698692', 'Dakar', 0x646576);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
