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

    IF OLD.nom <> NEW.nom THEN
        INSERT INTO archives (date_modif, ancienne_val, nouvelle_val, nom_col)
        VALUES ('nom', NOW(), OLD.nom, NEW.nom, nom_col);
    ELSEIF OLD.prenom <> NEW.prenom THEN
        INSERT INTO archives (date_modif, ancienne_val, nouvelle_val, nom_col)
        VALUES ('prenom', NOW(), OLD.prenom, NEW.prenom, nom_col);
    ELSEIF OLD.mail <> NEW.mail THEN
        INSERT INTO archives (date_modif, ancienne_val, nouvelle_val, nom_col)
        VALUES ('mail', NOW(), OLD.mail, NEW.mail, nom_col);
    ELSEIF OLD.mdp <> NEW.mdp THEN
        INSERT INTO archives (date_modif, ancienne_val, nouvelle_val, nom_col)
        VALUES ('mdp', NOW(), OLD.mdp, NEW.mdp, nom_col);
    END IF;

END //
DELIMITER ;