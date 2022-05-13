-- Triggers notes_plante
DROP TRIGGER IF EXISTS notes_plante_insert;
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
DROP TRIGGER IF EXISTS notes_plante_update;
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


-- Triggers notes_graine
DROP TRIGGER IF EXISTS notes_graine_insert;
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
DROP TRIGGER IF EXISTS notes_graine_update;
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

-- Triggers notes_zone
DROP TRIGGER IF EXISTS notes_zone_insert;
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
 DROP TRIGGER IF EXISTS notes_zone_update;
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