-- Procédure stockée pour lister les films d'un réalisateur :
DELIMITER //
CREATE PROCEDURE ListeFilmsRealisateur(IN nom_realisateur VARCHAR(50), IN prenom_realisateur VARCHAR(50))
BEGIN
    SELECT films.titre, films.annee
    FROM films
    INNER JOIN realisateurs ON films.id_realisateur = realisateurs.id_realisateur
    WHERE realisateurs.nom = nom_realisateur AND realisateurs.prenom = prenom_realisateur;
END //
DELIMITER ;


-- Déclencheur (Trigger) pour garder une trace des modifications des utilisateurs :
DELIMITER //
CREATE TRIGGER ArchiveModificationsUtilisateurs
AFTER UPDATE ON utilisateurs
FOR EACH ROW
BEGIN
    INSERT INTO archives (date_modif, ancienne_val, nouvelle_val)
    VALUES (NOW(), OLD.nom, NEW.nom);
END //
DELIMITER ;
