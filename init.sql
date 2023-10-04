DROP DATABASE IF EXISTS streamingDB;
CREATE DATABASE streamingDB;

USE streamingDB;

CREATE TABLE acteurs(
   id_acteur INT AUTO_INCREMENT,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   date_naissance DATE NOT NULL,
   PRIMARY KEY(id_acteur)
);

CREATE TABLE realisateurs(
   id_realisateur INT AUTO_INCREMENT,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_realisateur)
);

CREATE TABLE roles(
   id_role INT AUTO_INCREMENT,
   nom VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_role)
);

CREATE TABLE films(
   id_film INT AUTO_INCREMENT,
   titre VARCHAR(100)  NOT NULL,
   duree TIME NOT NULL,
   annee INT NOT NULL,
   id_realisateur INT NOT NULL,
   PRIMARY KEY(id_film),
   FOREIGN KEY(id_realisateur) REFERENCES realisateurs(id_realisateur)
);

CREATE TABLE utilisateurs(
   id_utilisateur INT AUTO_INCREMENT,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   mail VARCHAR(100)  NOT NULL,
   mdp VARCHAR(50)  NOT NULL,
   id_role INT NOT NULL,
   PRIMARY KEY(id_utilisateur),
   FOREIGN KEY(id_role) REFERENCES roles(id_role)
);

CREATE TABLE archives(
   id_archives INT AUTO_INCREMENT,
   date_modif DATETIME NOT NULL,
   ancienne_val VARCHAR(50)  NOT NULL,
   nouvelle_val VARCHAR(50)  NOT NULL,
   id_utilisateur INT NOT NULL,
   nom_col VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_archives),
   FOREIGN KEY(id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);

CREATE TABLE jouer(
   id_film INT,
   id_acteur INT,
   PRIMARY KEY(id_film, id_acteur),
   FOREIGN KEY(id_film) REFERENCES films(id_film),
   FOREIGN KEY(id_acteur) REFERENCES acteurs(id_acteur)
);

CREATE TABLE favoris(
   id_film INT,
   id_utilisateur INT,
   PRIMARY KEY(id_film, id_utilisateur),
   FOREIGN KEY(id_film) REFERENCES films(id_film),
   FOREIGN KEY(id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);

USE streamingDB;

INSERT INTO acteurs (nom, prenom, date_naissance) VALUES
('Smith', 'Will', '1968-09-25'),
('Johansson', 'Scarlett', '1984-11-22'),
('DiCaprio', 'Leonardo', '1974-11-11'),
('Roberts', 'Julia', '1967-10-28'),
('Pitt', 'Brad', '1963-12-18'),
('Lawrence', 'Jennifer', '1990-08-15'),
('Hanks', 'Tom', '1956-07-09'),
('Kidman', 'Nicole', '1967-06-20'),
('Cruise', 'Tom', '1962-07-03'),
('Streep', 'Meryl', '1949-06-22'),
('Hathaway', 'Anne', '1982-11-12'),
('Jackson', 'Samuel L.', '1948-12-21'),
('Portman', 'Natalie', '1981-06-09'),
('Damon', 'Matt', '1970-10-08'),
('Depp', 'Johnny', '1963-06-09'),
('Winslet', 'Kate', '1975-10-05'),
('Efron', 'Zac', '1987-10-18'),
('Watson', 'Emma', '1990-04-15'),
('Mara', 'Rooney', '1985-04-17'),
('Gosling', 'Ryan', '1980-11-12');

INSERT INTO realisateurs (nom, prenom) VALUES
('Nolan', 'Christopher'),
('Spielberg', 'Steven'),
('Tarantino', 'Quentin'),
('Scorsese', 'Martin'),
('Cameron', 'James'),
('Coppola', 'Francis Ford'),
('Anderson', 'Wes'),
('Bigelow', 'Kathryn'),
('Fincher', 'David'),
('Burton', 'Tim'),
('Lee', 'Ang'),
('Kubrick', 'Stanley'),
('Wright', 'Edgar'),
('Miller', 'George'),
('Coen', 'Joel'),
('Coen', 'Ethan'),
('Villeneuve', 'Denis'),
('Ritchie', 'Guy'),
('Del Toro', 'Guillermo'),
('Shyamalan', 'M. Night');

INSERT INTO films (titre, duree, annee, id_realisateur) VALUES
('Inception', '02:28:00', 2010, 1),
('E.T. the Extra-Terrestrial', '01:55:00', 1982, 2),
('Pulp Fiction', '02:34:00', 1994, 3),
('Goodfellas', '02:26:00', 1990, 4),
('Avatar', '02:42:00', 2009, 5),
('The Godfather', '02:55:00', 1972, 6),
('The Grand Budapest Hotel', '01:39:00', 2014, 7),
('The Hurt Locker', '02:11:00', 2008, 8),
('Fight Club', '02:19:00', 1999, 9),
('Edward Scissorhands', '01:45:00', 1990, 10),
('Brokeback Mountain', '02:14:00', 2005, 11),
('A Clockwork Orange', '02:16:00', 1971, 12),
('Shaun of the Dead', '01:39:00', 2004, 13),
('Mad Max: Fury Road', '02:00:00', 2015, 14),
('Fargo', '01:38:00', 1996, 15),
('No Country for Old Men', '02:02:00', 2007, 16),
('Blade Runner 2049', '02:44:00', 2017, 17),
('Lock, Stock and Two Smoking Barrels', '01:47:00', 1998, 18),
('Pan s Labyrinth', '01:58:00', 2006, 19),
('The Sixth Sense', '01:47:00', 1999, 20);

INSERT INTO roles (nom) VALUES
('admin'),
('utilisateur');

INSERT INTO utilisateurs (nom, prenom, mail, mdp, id_role) VALUES
('Doe', 'John', 'john.doe@example.com', 'motdepasse1', 1),
('Smith', 'Jane', 'jane.smith@example.com', 'motdepasse2', 1),
('Brown', 'Robert', 'robert.brown@example.com', 'motdepasse3', 2),
('Johnson', 'Mary', 'mary.johnson@example.com', 'motdepasse4', 2),
('Wilson', 'David', 'david.wilson@example.com', 'motdepasse5', 2),
('Lee', 'Sarah', 'sarah.lee@example.com', 'motdepasse6', 2),
('Garcia', 'Michael', 'michael.garcia@example.com', 'motdepasse7', 2),
('Martinez', 'Linda', 'linda.martinez@example.com', 'motdepasse8', 2),
('Hernandez', 'James', 'james.hernandez@example.com', 'motdepasse9', 2),
('Lopez', 'Susan', 'susan.lopez@example.com', 'motdepasse10', 2),
('Gonzalez', 'William', 'william.gonzalez@example.com', 'motdepasse11', 2),
('Davis', 'Patricia', 'patricia.davis@example.com', 'motdepasse12', 2),
('Rodriguez', 'Richard', 'richard.rodriguez@example.com', 'motdepasse13', 2),
('Jackson', 'Barbara', 'barbara.jackson@example.com', 'motdepasse14', 2),
('White', 'Joseph', 'joseph.white@example.com', 'motdepasse15', 2),
('Williams', 'Dorothy', 'dorothy.williams@example.com', 'motdepasse16', 2),
('Thomas', 'Charles', 'charles.thomas@example.com', 'motdepasse17', 2),
('Moore', 'Betty', 'betty.moore@example.com', 'motdepasse18', 2),
('Taylor', 'George', 'george.taylor@example.com', 'motdepasse19', 2),
('Anderson', 'Margaret', 'margaret.anderson@example.com', 'motdepasse20', 2);

INSERT INTO jouer (id_film, id_acteur, role) VALUES
(1, 3, 'Principal'), 
(1, 2, 'Secondaire'),
(2, 2, 'Principal'),
(2, 1, 'Principal'),
(3, 3, 'Principal'), 
(3, 4, 'Secondaire'), 
(4, 4, 'Principal'), 
(4, 5, 'Secondaire'), 
(5, 5, 'Principal'), 
(5, 6, 'Principal'), 
(6, 6, 'Principal'), 
(6, 7, 'Secondaire'),
(7, 7, 'Principal'), 
(7, 8, 'Secondaire'), 
(12, 16, 'Principal'),
(15, 14, 'Principal'), 
(11, 10, 'Principal'), 
(10, 12, 'Secondaire'), 
(20, 13, 'Principal'), 
(18, 9, 'Secondaire'), 
(8, 19, 'Principal');

DELIMITER //
CREATE PROCEDURE ListeFilmsRealisateur(IN nom_realisateur VARCHAR(50), IN prenom_realisateur VARCHAR(50))
BEGIN
    SELECT films.titre, films.annee
    FROM films
    INNER JOIN realisateurs ON films.id_realisateur = realisateurs.id_realisateur
    WHERE realisateurs.nom = nom_realisateur AND realisateurs.prenom = prenom_realisateur;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER ArchiveModificationsUtilisateurs
AFTER UPDATE ON utilisateurs
FOR EACH ROW
BEGIN

    IF OLD.nom <> NEW.nom THEN
        INSERT INTO archives (id_utilisateur, nom_col, date_modif, ancienne_val, nouvelle_val)
        VALUES (NEW.id_utilisateur, 'nom', NOW(), OLD.nom, NEW.nom);

    ELSEIF OLD.prenom <> NEW.prenom THEN
        INSERT INTO archives (id_utilisateur, nom_col, date_modif, ancienne_val, nouvelle_val)
        VALUES (NEW.id_utilisateur, 'prenom', NOW(), OLD.prenom, NEW.prenom);

    ELSEIF OLD.mail <> NEW.mail THEN
        INSERT INTO archives (id_utilisateur, nom_col, date_modif, ancienne_val, nouvelle_val)
        VALUES (NEW.id_utilisateur, 'mail', NOW(), OLD.mail, NEW.mail);

    ELSEIF OLD.mdp <> NEW.mdp THEN
        INSERT INTO archives (id_utilisateur, nom_col, date_modif, ancienne_val, nouvelle_val)
        VALUES (NEW.id_utilisateur, 'mdp', NOW(), OLD.mdp, NEW.mdp);

    END IF;

END //
DELIMITER ;