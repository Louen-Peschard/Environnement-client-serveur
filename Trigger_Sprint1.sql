-- Trigger histo cycle végétatif : 
DROP TRIGGER IF EXISTS `histo_cycle_vege`;
DELIMITER //
CREATE TRIGGER `histo_cycle_vege` AFTER UPDATE ON `plante` FOR EACH ROW 
BEGIN
IF OLD.id_cycle_vegetatif != NEW.id_cycle_vegetatif
    THEN 
        INSERT INTO historique_cycle (id_plante, id_cycle_vegetatif, date_changement) VALUES (OLD.id_plante, OLD.id_cycle_vegetatif, CURRENT_TIMESTAMP);
        
END IF;
END// 
DELIMITER ;

-- Trigger histo état plante :
DROP TRIGGER IF EXISTS `histo_etat_plante`;
DELIMITER //
CREATE TRIGGER `histo_etat_plante` AFTER UPDATE ON `etat_plante` FOR EACH ROW 
BEGIN
IF OLD.id_etat != NEW.id_etat
    THEN 
        INSERT INTO historique_etat (id_etat, id_plante, date_changement, date, status) 
        VALUES 
(OLD.id_etat, OLD.id_plante, CURRENT_TIMESTAMP, OLD.date, OLD.status);
        
END IF;
END// 
DELIMITER ;

-- Trigger histo zone plante : 
DROP TRIGGER IF EXISTS `histo_changement_zone`;
DELIMITER //
CREATE TRIGGER `histo_changement_zone` AFTER UPDATE ON `plante` FOR EACH ROW 
BEGIN
IF OLD.id_zone != NEW.id_zone
    THEN 
        INSERT INTO historique_zone (id_plante, id_zone, date_changement) 
        VALUES 
( OLD.id_plante, OLD.id_zone, CURRENT_TIMESTAMP);
        
END IF;
END// 
DELIMITER ;

-- Trigger suppresion plante :
DROP TRIGGER IF EXISTS suppression_plante;
DELIMITER //
CREATE TRIGGER suppression_plante AFTER DELETE ON plante
 FOR EACH ROW BEGIN
    DELETE FROM historique_etat
    WHERE historique_etat.id_plante = OLD.id_plante;

    DELETE FROM historique_zone
    WHERE historique_zone.id_plante = OLD.id_plante;

    DELETE FROM historique_cycle
    WHERE historique_cycle.id_plante = OLD.id_plante;

END// 
DELIMITER ;
