-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 03 nov. 2022 à 05:29
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `webgate`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id_activity` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `concern` varchar(20) NOT NULL,
  PRIMARY KEY (`id_activity`),
  KEY `fk_author` (`author`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `activity`
--

INSERT INTO `activity` (`id_activity`, `author`, `type`, `description`, `date`, `concern`) VALUES
(1, 'ADM1', 'Create', 'Rapport activity of 2022-11-03 02:53:53.212 : User ADM1 have realize action to Create REC2', '2022-11-03 02:53:53', 'REC2');

-- --------------------------------------------------------

--
-- Structure de la table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `id_catalog` int(11) NOT NULL,
  `id_product` varchar(10) NOT NULL,
  `number` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id_catalog`),
  KEY `fk_product` (`id_product`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commands`
--

DROP TABLE IF EXISTS `commands`;
CREATE TABLE IF NOT EXISTS `commands` (
  `id_command` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `date_command` datetime NOT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `id_product` varchar(10) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_partner` varchar(10) NOT NULL,
  PRIMARY KEY (`id_command`),
  KEY `fk_product` (`id_product`) USING BTREE,
  KEY `fk_customer` (`id_customer`),
  KEY `fk_partner` (`id_partner`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `adress` varchar(30) NOT NULL,
  `id_partner` varchar(10) NOT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(10) NOT NULL,
  `date_login` datetime NOT NULL,
  `date_logout` datetime DEFAULT NULL,
  PRIMARY KEY (`id_login`),
  KEY `fk_log` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id_login`, `id_user`, `date_login`, `date_logout`) VALUES
(1, 'ADM1', '2022-11-03 04:01:05', NULL),
(2, 'ADM1', '2022-11-03 04:07:18', NULL),
(3, 'REC1', '2022-11-03 04:07:47', NULL),
(4, 'ADM1', '2022-11-03 04:14:01', NULL),
(5, 'ADM1', '2022-11-03 04:19:19', NULL),
(6, 'ADM1', '2022-11-03 05:15:14', NULL),
(7, 'ADM1', '2022-11-03 06:15:57', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id_product` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id_user`, `name`, `password`, `role`, `email`) VALUES
('ADM1', 'nash', 'a29d8998d29ff842a4c5a0be85349ec8bd63e457bfd6f258af70847f28f65fa4', 'admin', 'nash@gate.cm'),
('PTN1', 'skyb', '9b8769a4a742959a2d0298c36fb70623f2dfacda8436237df08d8dfd5b37374c', 'partners', 'skyb@gate.cm'),
('REC1', 'quentin', '27b2968f03b878dd3209c9a4c3d7f301a222a829c562358fefec66401e31cf6d', 'customManager', 'quentin@gate.cm'),
('PTN2', 'dafa', '60e91f1532f85c7be77fb4535177ff0f6041bd32c4eaeae9e682955490f0865e', 'partners', 'dada@gate.cm'),
('REC2', 'Test', 'b0d4329cbbb26f48157008a102bef347a5c4fc2eea21fc7c4166d01f5adae2bf', 'customManager', 'test@gate.cm');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
