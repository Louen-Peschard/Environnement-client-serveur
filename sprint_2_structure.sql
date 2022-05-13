-- Ajout des tables notes (3 au total)
-- Notes plante
DROP TABLE IF EXISTS `notes_plante`;
CREATE TABLE IF NOT EXISTS `notes_plante` (
  `id_note` INT NOT NULL AUTO_INCREMENT,
  `id_plante` INT NOT NULL,
  `type` enum('Texte','Audio') NOT NULL,
  `description` TEXT DEFAULT NULL,
  `lien_audio` VARCHAR(150) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_note`),
  KEY `id_plante_idx` (`id_plante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `notes_plante`
  ADD CONSTRAINT `fk_id_notes_plante` FOREIGN KEY (`id_plante`) REFERENCES `plante` (`id_plante`) ON DELETE CASCADE;

-- Notes zone
DROP TABLE IF EXISTS `notes_zone`;
CREATE TABLE IF NOT EXISTS `notes_zone` (
  `id_note` INT NOT NULL AUTO_INCREMENT,
  `id_zone` INT NOT NULL,
  `type` enum('Texte','Audio') NOT NULL,
  `description` TEXT DEFAULT NULL,
  `lien_audio` VARCHAR(150) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_note`),
  KEY `id_zone_idx` (`id_zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `notes_zone`
  ADD CONSTRAINT `fk_id_notes_zone` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`id_zone`) ON DELETE CASCADE;

-- Notes graine
DROP TABLE IF EXISTS `notes_graine`;
CREATE TABLE IF NOT EXISTS `notes_graine` (
  `id_note` INT NOT NULL AUTO_INCREMENT,
  `id_graine` INT NOT NULL,
  `type` enum('Texte','Audio') NOT NULL,
  `description` TEXT DEFAULT NULL,
  `lien_audio` VARCHAR(150) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_note`),
  KEY `id_graine_idx` (`id_graine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `notes_graine`
  ADD CONSTRAINT `fk_id_notes_graine` FOREIGN KEY (`id_graine`) REFERENCES `graine` (`id_graine`) ON DELETE CASCADE;


--
--------------------------
--
--Triggers notes_plante
DELIMITER //
CREATE TRIGGER notes_plante_insert BEFORE INSERT ON notes_plante
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
DELIMITER //
CREATE TRIGGER notes_plante_update BEFORE UPDATE ON notes_plante
  FOR EACH ROW
  BEGIN
	IF new.type = 'Texte' AND new.description IS NULL THEN
		signal sqlstate '02000' set message_text = "Veillez remplir la description";
    ELSEIF new.type = 'Texte' AND (new.lien_audio IS NOT NULL OR old.lien_audio IS NOT NULL) THEN
    	signal sqlstate '02000' set message_text = "Vous ne pouvez pas remplir de lien audio avec un type texte";
    ELSEIF new.type = 'Audio' AND new.lien_audio IS NULL THEN
		signal sqlstate '02000' set message_text = "Veillez remplir le lien audio";
    ELSEIF new.type = 'Audio' AND (new.description IS NOT NULL OR old.description IS NOT NULL) THEN
    	signal sqlstate '02000' set message_text = "Vous ne pouvez pas remplir une description avec un type audio";
    END IF;
  END//
 DELIMITER ;


--Triggers notes_graine
DELIMITER //
CREATE TRIGGER notes_graine_insert BEFORE INSERT ON notes_graine
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
DELIMITER //
CREATE TRIGGER notes_graine_update BEFORE UPDATE ON notes_graine
  FOR EACH ROW
  BEGIN
	IF new.type = 'Texte' AND new.description IS NULL THEN
		signal sqlstate '02000' set message_text = "Veillez remplir la description";
    ELSEIF new.type = 'Texte' AND (new.lien_audio IS NOT NULL OR old.lien_audio IS NOT NULL) THEN
    	signal sqlstate '02000' set message_text = "Vous ne pouvez pas remplir de lien audio avec un type texte";
    ELSEIF new.type = 'Audio' AND new.lien_audio IS NULL THEN
		signal sqlstate '02000' set message_text = "Veillez remplir le lien audio";
    ELSEIF new.type = 'Audio' AND (new.description IS NOT NULL OR old.description IS NOT NULL) THEN
    	signal sqlstate '02000' set message_text = "Vous ne pouvez pas remplir une description avec un type audio";
    END IF;
  END//
 DELIMITER ;

--Triggers notes_zone
DELIMITER //
CREATE TRIGGER notes_zone_insert BEFORE INSERT ON notes_zone
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
 DELIMITER //
CREATE TRIGGER notes_zone_update BEFORE UPDATE ON notes_zone
  FOR EACH ROW
  BEGIN
	IF new.type = 'Texte' AND new.description IS NULL THEN
		signal sqlstate '02000' set message_text = "Veillez remplir la description";
    ELSEIF new.type = 'Texte' AND (new.lien_audio IS NOT NULL OR old.lien_audio IS NOT NULL) THEN
    	signal sqlstate '02000' set message_text = "Vous ne pouvez pas remplir de lien audio avec un type texte";
    ELSEIF new.type = 'Audio' AND new.lien_audio IS NULL THEN
		signal sqlstate '02000' set message_text = "Veillez remplir le lien audio";
    ELSEIF new.type = 'Audio' AND (new.description IS NOT NULL OR old.description IS NOT NULL) THEN
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