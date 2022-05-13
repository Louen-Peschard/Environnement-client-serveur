-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 20 avr. 2022 à 10:25
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `i-garden`
--

-- --------------------------------------------------------

--
-- Structure de la table `classification`
--

DROP TABLE IF EXISTS `classification`;
CREATE TABLE IF NOT EXISTS `classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `id_niveau` int(11) DEFAULT NULL,
  `id_classification` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `titre` (`titre`),
  KEY `id_classification` (`id_classification`),
  KEY `id_niveau` (`id_niveau`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `classification`
--

INSERT INTO `classification` (`id`, `titre`, `id_niveau`, `id_classification`) VALUES
(1, 'Plantae', 1, NULL),
(2, 'Tracheobionta', 2, 1),
(3, 'Magnoliophyta', 3, 2),
(4, 'Liliopsida', 4, 3),
(5, 'Liliidae', 5, 4),
(6, 'Orchidales', 6, 5),
(7, 'Orchidaceae', 7, 6),
(8, 'Vandoideae', 8, 7),
(9, 'Magnoliopsida', 4, 3),
(10, 'Magnoliidae', 5, 9),
(11, 'Papaverales', 6, 10),
(12, 'Papaveraceae', 7, 11),
(13, 'Papaver', 8, 12);

-- --------------------------------------------------------

--
-- Structure de la table `cycle_vegetatif`
--

DROP TABLE IF EXISTS `cycle_vegetatif`;
CREATE TABLE IF NOT EXISTS `cycle_vegetatif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `graine`
--

DROP TABLE IF EXISTS `graine`;
CREATE TABLE IF NOT EXISTS `graine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `nom_latin` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `icone` varchar(250) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `hauteur_max` decimal(5,2) NOT NULL,
  `id_classification` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_classification` (`id_classification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `historique_cycle`
--

DROP TABLE IF EXISTS `historique_cycle`;
CREATE TABLE IF NOT EXISTS `historique_cycle` (
  `id_plante` int(11) NOT NULL,
  `id_cycle` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_plante`,`id_cycle`),
  KEY `id_cycle` (`id_cycle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `historique_etat`
--

DROP TABLE IF EXISTS `historique_etat`;
CREATE TABLE IF NOT EXISTS `historique_etat` (
  `id_plante` int(11) NOT NULL,
  `id_etat` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_plante`,`id_etat`,`id_statut`),
  KEY `id_etat` (`id_etat`),
  KEY `id_statut` (`id_statut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `historique_zone`
--

DROP TABLE IF EXISTS `historique_zone`;
CREATE TABLE IF NOT EXISTS `historique_zone` (
  `id_plante` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_plante`,`id_zone`),
  KEY `id_plante` (`id_plante`),
  KEY `id_zone` (`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jardin`
--

DROP TABLE IF EXISTS `jardin`;
CREATE TABLE IF NOT EXISTS `jardin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `id_rusticite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_rusticite` (`id_rusticite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jardin_utilisateur`
--

DROP TABLE IF EXISTS `jardin_utilisateur`;
CREATE TABLE IF NOT EXISTS `jardin_utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `id_jardin` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_jardin`),
  KEY `id_jardin` (`id_jardin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `niveau_classification`
--

DROP TABLE IF EXISTS `niveau_classification`;
CREATE TABLE IF NOT EXISTS `niveau_classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `niveau_classification`
--

INSERT INTO `niveau_classification` (`id`, `nom`) VALUES
(1, 'Règne'),
(2, 'Sous-règne'),
(3, 'Division'),
(4, 'Classe'),
(5, 'Sous_classe'),
(6, 'Ordre'),
(7, 'Famille'),
(8, 'Sous-famille'),
(9, 'Genre');

-- --------------------------------------------------------

--
-- Structure de la table `plante`
--

DROP TABLE IF EXISTS `plante`;
CREATE TABLE IF NOT EXISTS `plante` (
  `id` int(11) NOT NULL,
  `date_semis` datetime NOT NULL,
  `date_repiquage` datetime NOT NULL,
  `date_recolte` datetime NOT NULL,
  `quantite_recolte` int(10) NOT NULL,
  `id_graine` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
  `id_etat` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  `id_cycle` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_graine` (`id_graine`),
  KEY `id_zone` (`id_zone`),
  KEY `id_etat` (`id_etat`),
  KEY `id_statut` (`id_statut`),
  KEY `id_cycle` (`id_cycle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déclencheurs `plante`
--
DROP TRIGGER IF EXISTS `changement_zone`;
DELIMITER $$
CREATE TRIGGER `changement_zone` BEFORE UPDATE ON `plante` FOR EACH ROW IF OLD.id_zone != NEW.id_zone
    THEN 
        INSERT INTO historique_zone (id_plante, id_zone, date) VALUES (OLD.id, OLD.id_zone, CURRENT_TIMESTAMP);
        
END IF
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_cycle_vegetatif`;
DELIMITER $$
CREATE TRIGGER `trigger_cycle_vegetatif` BEFORE UPDATE ON `plante` FOR EACH ROW IF OLD.id_cycle != NEW.id_cycle
    THEN 
        INSERT INTO historique_cycle (id_plante, id_cycle, date) VALUES (OLD.id, OLD.id_cycle, CURRENT_TIMESTAMP);
        
END IF
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_etat`;
DELIMITER $$
CREATE TRIGGER `trigger_etat` BEFORE UPDATE ON `plante` FOR EACH ROW IF OLD.id_etat != NEW.id_etat
    THEN 
        INSERT INTO historique_etat (id_plante,id_statut, id_etat, date) VALUES (OLD.id, OLD.id_statut, OLD.id_etat, CURRENT_TIMESTAMP);
        
END IF
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_statut`;
DELIMITER $$
CREATE TRIGGER `trigger_statut` BEFORE UPDATE ON `plante` FOR EACH ROW IF OLD.id_statut != NEW.id_statut
    THEN 
        INSERT INTO historique_etat (id_plante,id_statut, id_etat, date) VALUES (OLD.id, OLD.id_statut, OLD.id_etat, CURRENT_TIMESTAMP);
        
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `rusticite`
--

DROP TABLE IF EXISTS `rusticite`;
CREATE TABLE IF NOT EXISTS `rusticite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `temperature_min` decimal(5,2) NOT NULL,
  `temperature_max` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE IF NOT EXISTS `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `type_sol` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `id_jardin` int(11) NOT NULL,
  `id_rusticite` int(11) NOT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `largeur` decimal(5,2) DEFAULT NULL,
  `hauteur` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jardin` (`id_jardin`),
  KEY `id_rusticite` (`id_rusticite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classification`
--
ALTER TABLE `classification`
  ADD CONSTRAINT `classification_ibfk_1` FOREIGN KEY (`id_classification`) REFERENCES `classification` (`id`),
  ADD CONSTRAINT `classification_ibfk_2` FOREIGN KEY (`id_niveau`) REFERENCES `niveau_classification` (`id`);

--
-- Contraintes pour la table `graine`
--
ALTER TABLE `graine`
  ADD CONSTRAINT `graine_ibfk_1` FOREIGN KEY (`id_classification`) REFERENCES `classification` (`id`);

--
-- Contraintes pour la table `historique_cycle`
--
ALTER TABLE `historique_cycle`
  ADD CONSTRAINT `historique_cycle_ibfk_1` FOREIGN KEY (`id_plante`) REFERENCES `plante` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historique_cycle_ibfk_2` FOREIGN KEY (`id_cycle`) REFERENCES `cycle_vegetatif` (`id`);

--
-- Contraintes pour la table `historique_etat`
--
ALTER TABLE `historique_etat`
  ADD CONSTRAINT `historique_etat_ibfk_1` FOREIGN KEY (`id_etat`) REFERENCES `etat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historique_etat_ibfk_2` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historique_etat_ibfk_3` FOREIGN KEY (`id_plante`) REFERENCES `plante` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `historique_zone`
--
ALTER TABLE `historique_zone`
  ADD CONSTRAINT `historique_zone_ibfk_1` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`id`),
  ADD CONSTRAINT `historique_zone_ibfk_2` FOREIGN KEY (`id_plante`) REFERENCES `plante` (`id`);

--
-- Contraintes pour la table `jardin`
--
ALTER TABLE `jardin`
  ADD CONSTRAINT `jardin_ibfk_1` FOREIGN KEY (`id_rusticite`) REFERENCES `rusticite` (`id`);

--
-- Contraintes pour la table `jardin_utilisateur`
--
ALTER TABLE `jardin_utilisateur`
  ADD CONSTRAINT `jardin_utilisateur_ibfk_1` FOREIGN KEY (`id_jardin`) REFERENCES `jardin` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jardin_utilisateur_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `plante`
--
ALTER TABLE `plante`
  ADD CONSTRAINT `plante_ibfk_1` FOREIGN KEY (`id_graine`) REFERENCES `graine` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `plante_ibfk_2` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`id`),
  ADD CONSTRAINT `plante_ibfk_3` FOREIGN KEY (`id_statut`) REFERENCES `statut` (`id`),
  ADD CONSTRAINT `plante_ibfk_4` FOREIGN KEY (`id_etat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `plante_ibfk_5` FOREIGN KEY (`id_cycle`) REFERENCES `cycle` (`id`);

--
-- Contraintes pour la table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`id_jardin`) REFERENCES `jardin` (`id`),
  ADD CONSTRAINT `zone_ibfk_2` FOREIGN KEY (`id_rusticite`) REFERENCES `rusticite` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
