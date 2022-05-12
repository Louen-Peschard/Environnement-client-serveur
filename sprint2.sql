-- Ajout des tables notes (3 au total)
-- Notes plante
DROP TABLE IF EXISTS `notes_plante`;
CREATE TABLE IF NOT EXISTS `notes_plante` (
  `id_plante` INT NOT NULL,
  `id_note` INT NOT NULL,
  `type` enum('Texte','Audio') NOT NULL,
  `description` TEXT DEFAULT NULL,
  `lien_audio` VARCHAR(150) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_plante`, `id_note`),
  KEY `id_plante_idx` (`id_plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `notes_plante`
  ADD CONSTRAINT `fk_id_notes_plante` FOREIGN KEY (`id_plante`) REFERENCES `plante` (`id_plante`) ON DELETE CASCADE;

-- Notes zone
DROP TABLE IF EXISTS `notes_zone`;
CREATE TABLE IF NOT EXISTS `notes_zone` (
  `id_zone` INT NOT NULL,
  `id_note` INT NOT NULL,
  `type` enum('Texte','Audio') NOT NULL,
  `description` TEXT DEFAULT NULL,
  `lien_audio` VARCHAR(150) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_zone`, `id_note`),
  KEY `id_zone_idx` (`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `notes_zone`
  ADD CONSTRAINT `fk_id_notes_zone` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`id_zone`) ON DELETE CASCADE;

-- Notes graine
DROP TABLE IF EXISTS `notes_graine`;
CREATE TABLE IF NOT EXISTS `notes_graine` (
  `id_graine` INT NOT NULL,
  `id_note` INT NOT NULL,
  `type` enum('Texte','Audio') NOT NULL,
  `description` TEXT DEFAULT NULL,
  `lien_audio` VARCHAR(150) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_graine`, `id_note`),
  KEY `id_graine_idx` (`id_graine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `notes_graine`
  ADD CONSTRAINT `fk_id_notes_graine` FOREIGN KEY (`id_graine`) REFERENCES `graine` (`id_graine`) ON DELETE CASCADE;


--
--------------------------
--

DELIMITER //
CREATE TRIGGER type_notes_plante BEFORE INSERT ON notes_plante
  FOR EACH ROW
  BEGIN
	IF new.type = 'Texte' AND new.description IS NULL THEN
		signal sqlstate '02000' set message_text = "Veillez remplir la description";
    ELSEIF new.type = 'Texte' AND new.lien_audio IS NOT NULL THEN
    	signal sqlstate '02000' set message_text = "Vous ne pouvez pas remplir de lien audio avec un type texte";
    ELSEIF new.type = 'Audio' AND new.lien_audio IS NULL THEN
		signal sqlstate '02000' set message_text = "Veillez remplir le lien audio";
    ELSEIF new.type = 'Audio' AND new.description IS NOT NULL THEN
    	signal sqlstate '02000' set message_text = "Vous ne pouvez pas remplir une description avec un type audio";
    END IF;
  END//
 DELIMITER ;

 --
 -----------------------------
--

--Ajout de multiples colonnes
ALTER TABLE zone
  ADD `longitude` decimal(8,6) DEFAULT NULL,
  ADD `latitude` decimal(8,6) DEFAULT NULL,
  ADD `largeur` int(11) DEFAULT NULL,
  ADD `hauteur` int(11) DEFAULT NULL;

ALTER TABLE graine
  ADD `nom_falcutatif` varchar(30) DEFAULT NULL;

ALTER TABLE plante
  ADD `temperature_minimal` decimal(5,2) DEFAULT NULL;


/*Ajout d'un user Demo, accès aux consultations tables et vues de i_garden uniquement */
CREATE USER 'Demo'@'localhost' IDENTIFIED BY 'demo';
GRANT SELECT ON i_garden.* TO 'Demo'@'localhost';