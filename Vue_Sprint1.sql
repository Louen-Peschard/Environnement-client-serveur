# « Liste_des_plantes » contenant : Le nom de la plante, le nom de la zone où elle se trouve, son cycle végétatif actuel :
DROP VIEW IF EXISTS liste_plantes;
CREATE VIEW liste_plantes AS
SELECT graine.nom as nom_plante, zone.nom as zone_nom, cycle_vegetatif.nom as cycle_nom
FROM graine INNER JOIN plante ON graine.id_graine = plante.id_graine
INNER JOIN cycle_vegetatif ON plante.id_cycle_vegetatif = cycle_vegetatif.id_cycle_vegetatif
INNER JOIN zone ON plante.id_zone = zone.id_zone;

# « Plantes_hors_zone » : liste des plantes qui ne sont affectées à aucune zone :
DROP VIEW IF EXISTS plantes_hors_zone;
CREATE VIEW plantes_hors_zone AS
Select graine.nom, utilisateur.pseudo
FROM plante 
INNER JOIN graine ON graine.id_graine = plante.id_graine
LEFT JOIN jardin ON plante.id_jardin = jardin.id_jardin
LEFT JOIN jardin_utilisateur ON jardin_utilisateur.id_jardin = jardin.id_jardin
LEFT JOIN utilisateur ON utilisateur.id_utilisateur = jardin_utilisateur.id_utilisateur
Where plante.id_zone IS NULL;

# « Zones_recap » Liste des zones : 
DROP VIEW IF EXISTS zones_recap;
CREATE VIEW Zones_recap AS
SELECT zone.nom, rusticite.code_rusticite, COUNT(zone.id_zone)
FROM graine
INNER JOIN plante ON graine.id_graine = plante.id_graine
INNER JOIN zone ON zone.id_zone = plante.id_zone
LEFT JOIN rusticite ON rusticite.id_rusticite = zone.id_rusticite
GROUP BY zone.nom;

# « Plantes_recap » Liste des graines : 
DROP VIEW IF EXISTS plantes_recap;
CREATE VIEW plantes_recap AS
SELECT graine.nom as Nom, famille.nom as famille, famille.id_famille_parente as parent,
(SELECT famille.nom from famille WHERE famille.id_famille = parent LIMIT 1) as espece, 
graine.nom_latin as Nom_Latin
FROM graine
INNER JOIN famille ON graine.id_famille = famille.id_famille
