DROP VIEW IF EXISTS Plante_precaire;
CREATE VIEW Plante_precaire AS
SELECT graine.nom as nom_graine, zone.nom as nom_zone
FROM graine 
INNER JOIN plante ON graine.id_graine = plante.id_graine
INNER JOIN zone ON plante.id_zone = zone.id_zone
INNER JOIN rusticite ON zone.id_rusticite = rusticite.id_rusticite
WHERE plante.temperature_minimal < rusticite.temp_min
