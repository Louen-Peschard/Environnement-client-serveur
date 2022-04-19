-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 19 Avril 2022 à 13:01
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `i-garden`
--

-- --------------------------------------------------------

--
-- Structure de la table `changement_zone`
--

CREATE TABLE `changement_zone` (
  `id_plante` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `classification`
--

CREATE TABLE `classification` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `id_classification` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `cycle_vegetatif`
--

CREATE TABLE `cycle_vegetatif` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `graine`
--

CREATE TABLE `graine` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `nom_latin` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `icone` varchar(250) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `hauteur_max` decimal(5,2) NOT NULL,
  `id_classification` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `historique_cycle`
--

CREATE TABLE `historique_cycle` (
  `id_plante` int(11) NOT NULL,
  `id_cycle` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `historique_etat`
--

CREATE TABLE `historique_etat` (
  `id_plante` int(11) NOT NULL,
  `id_etat` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jardin`
--

CREATE TABLE `jardin` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `id_rusticite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jardin_utilisateur`
--

CREATE TABLE `jardin_utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `id_jardin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `plante`
--

CREATE TABLE `plante` (
  `id` int(11) NOT NULL,
  `date_semis` datetime NOT NULL,
  `date_repiquage` datetime NOT NULL,
  `date_recolte` datetime NOT NULL,
  `quantite_recolte` int(10) NOT NULL,
  `id_graine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rusticite`
--

CREATE TABLE `rusticite` (
  `id` int(11) NOT NULL,
  `code` varchar(30) NOT NULL,
  `temperature_min` decimal(5,2) NOT NULL,
  `temperature_max` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE `zone` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `type_sol` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `id_jardin` int(11) NOT NULL,
  `id_rusticite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `changement_zone`
--
ALTER TABLE `changement_zone`
  ADD PRIMARY KEY (`id_plante`,`id_zone`),
  ADD KEY `id_plante` (`id_plante`),
  ADD KEY `id_zone` (`id_zone`);

--
-- Index pour la table `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `titre` (`titre`),
  ADD KEY `id_classification` (`id_classification`);

--
-- Index pour la table `cycle_vegetatif`
--
ALTER TABLE `cycle_vegetatif`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `graine`
--
ALTER TABLE `graine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_classification` (`id_classification`);

--
-- Index pour la table `historique_cycle`
--
ALTER TABLE `historique_cycle`
  ADD PRIMARY KEY (`id_plante`,`id_cycle`),
  ADD KEY `id_cycle` (`id_cycle`);

--
-- Index pour la table `historique_etat`
--
ALTER TABLE `historique_etat`
  ADD PRIMARY KEY (`id_plante`,`id_etat`,`id_statut`),
  ADD KEY `id_etat` (`id_etat`),
  ADD KEY `id_statut` (`id_statut`);

--
-- Index pour la table `jardin`
--
ALTER TABLE `jardin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rusticite` (`id_rusticite`);

--
-- Index pour la table `jardin_utilisateur`
--
ALTER TABLE `jardin_utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`,`id_jardin`),
  ADD KEY `id_jardin` (`id_jardin`);

--
-- Index pour la table `plante`
--
ALTER TABLE `plante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_graine` (`id_graine`);

--
-- Index pour la table `rusticite`
--
ALTER TABLE `rusticite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jardin` (`id_jardin`),
  ADD KEY `id_rusticite` (`id_rusticite`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `classification`
--
ALTER TABLE `classification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `cycle_vegetatif`
--
ALTER TABLE `cycle_vegetatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `etat`
--
ALTER TABLE `etat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `graine`
--
ALTER TABLE `graine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `jardin`
--
ALTER TABLE `jardin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `rusticite`
--
ALTER TABLE `rusticite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `statut`
--
ALTER TABLE `statut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `zone`
--
ALTER TABLE `zone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `changement_zone`
--
ALTER TABLE `changement_zone`
  ADD CONSTRAINT `changement_zone_ibfk_1` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`id`),
  ADD CONSTRAINT `changement_zone_ibfk_2` FOREIGN KEY (`id_plante`) REFERENCES `plante` (`id`);

--
-- Contraintes pour la table `classification`
--
ALTER TABLE `classification`
  ADD CONSTRAINT `classification_ibfk_1` FOREIGN KEY (`id_classification`) REFERENCES `classification` (`id`);

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
  ADD CONSTRAINT `plante_ibfk_1` FOREIGN KEY (`id_graine`) REFERENCES `graine` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`id_jardin`) REFERENCES `jardin` (`id`),
  ADD CONSTRAINT `zone_ibfk_2` FOREIGN KEY (`id_rusticite`) REFERENCES `rusticite` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
