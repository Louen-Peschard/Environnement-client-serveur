-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 20 Avril 2022 à 08:27
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
-- Structure de la table `classification`
--

CREATE TABLE `classification` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `id_niveau` int(11) DEFAULT NULL,
  `id_classification` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `classification`
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
-- Structure de la table `historique_zone`
--

CREATE TABLE `historique_zone` (
  `id_plante` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
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
-- Structure de la table `niveau_classification`
--

CREATE TABLE `niveau_classification` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `niveau_classification`
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

CREATE TABLE `plante` (
  `id` int(11) NOT NULL,
  `date_semis` datetime NOT NULL,
  `date_repiquage` datetime NOT NULL,
  `date_recolte` datetime NOT NULL,
  `quantite_recolte` int(10) NOT NULL,
  `id_graine` int(11) NOT NULL,
  `id_zone` int(11) NOT NULL,
  `id_etat` int(11) NOT NULL,
  `id_statut` int(11) NOT NULL,
  `id_cycle` int(11) NOT NULL
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
-- Index pour la table `classification`
--
ALTER TABLE `classification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `titre` (`titre`),
  ADD KEY `id_classification` (`id_classification`),
  ADD KEY `id_niveau` (`id_niveau`);

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
-- Index pour la table `historique_zone`
--
ALTER TABLE `historique_zone`
  ADD PRIMARY KEY (`id_plante`,`id_zone`),
  ADD KEY `id_plante` (`id_plante`),
  ADD KEY `id_zone` (`id_zone`);

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
-- Index pour la table `niveau_classification`
--
ALTER TABLE `niveau_classification`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `plante`
--
ALTER TABLE `plante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_graine` (`id_graine`),
  ADD KEY `id_zone` (`id_zone`),
  ADD KEY `id_etat` (`id_etat`),
  ADD KEY `id_statut` (`id_statut`),
  ADD KEY `id_cycle` (`id_cycle`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
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
-- AUTO_INCREMENT pour la table `niveau_classification`
--
ALTER TABLE `niveau_classification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
