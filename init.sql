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
   designation VARCHAR(50)  NOT NULL,
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
   role_acteur VARCHAR(50) NOT NULL,
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

INSERT INTO acteurs (nom, prenom, date_naissance)
VALUES
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
    ('Gosling', 'Ryan', '1980-11-12'),
    ('Cumberbatch', 'Benedict', '1976-07-19'),
    ('Law', 'Jude', '1972-12-29'),
    ('Blunt', 'Emily', '1983-02-23'),
    ('Bullock', 'Sandra', '1964-07-26'),
    ('Hemsworth', 'Chris', '1983-08-11'),
    ('Stone', 'Emma', '1988-11-06'),
    ('Pine', 'Chris', '1980-08-26'),
    ('Hiddleston', 'Tom', '1981-02-09'),
    ('Johnson', 'Dwayne "The Rock"', '1972-05-02'),
    ('Kunis', 'Mila', '1983-08-14'),
    ('Affleck', 'Ben', '1972-08-15'),
    ('Lawrence', 'Jude', '1972-12-29'),
    ('Roberts', 'Emma', '1991-02-10'),
    ('Farrell', 'Colin', '1976-05-31'),
    ('Jolie', 'Angelina', '1975-06-04'),
    ('Evans', 'Chris', '1981-06-13'),
    ('Holland', 'Tom', '1996-06-01'),
    ('Fassbender', 'Michael', '1977-04-02'),
    ('Harris', 'Naomie', '1976-09-06'),
    ('Johnson', 'Dakota', '1989-10-04'),
    ('Smith', 'Jaden', '1998-07-08'),
    ('Stewart', 'Kristen', '1990-04-09'),
    ('Hoult', 'Nicholas', '1989-12-07'),
    ('Keaton', 'Michael', '1951-09-05'),
    ('Theron', 'Charlize', '1975-08-07'),
    ('Hardy', 'Tom', '1977-09-15'),
    ('Neeson', 'Liam', '1952-06-07'),
    ('Cranston', 'Bryan', '1956-03-07'),
    ('Thompson', 'Emma', '1959-04-15'),
    ('Pfeiffer', 'Michelle', '1958-04-29'),
    ('Smith', 'Maggie', '1934-09-24'),
    ('McConaughey', 'Matthew', '1969-11-04'),
    ('Cavill', 'Henry', '1983-05-05'),
    ('Stewart', 'Patrick', '1940-07-13'),
    ('Ford', 'Harrison', '1942-07-13'),
    ('Lawson', 'Jennifer', '1949-12-31'),
    ('Connery', 'Sean', '1930-08-25'),
    ('Hopkins', 'Anthony', '1937-12-31'),
    ('Lee', 'Christopher', '1922-05-27'),
    ('Keanu', 'Reeves', '1964-09-02'),
    ('Thompson', 'Tessa', '1983-10-03'),
    ('Swinton', 'Tilda', '1960-11-05'),
    ('Malkovich', 'John', '1953-12-09'),
    ('Redmayne', 'Eddie', '1982-01-06'),
    ('Lawrence', 'Martin', '1962-04-16'),
    ('Paltrow', 'Gwyneth', '1972-09-27'),
    ('Robbie', 'Margot', '1990-07-02'),
    ('Hanks', 'Colin', '1977-11-24'),
    ('Diesel', 'Vin', '1967-07-18'),
    ('Norton', 'Edward', '1969-08-18');

INSERT INTO realisateurs (nom, prenom)
VALUES
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
    ('Shyamalan', 'M. Night'),
    ('Johnson', 'Rian'),
    ('Reeves', 'Matt'),
    ('Lynch', 'David'),
    ('Allen', 'Woody'),
    ('Eastwood', 'Clint'),
    ('Stone', 'Oliver'),
    ('Cronenberg', 'David'),
    ('Gibson', 'Mel'),
    ('Cohen', 'Andrew'),
    ('Farrelly', 'Peter'),
    ('Farrelly', 'Bobby'),
    ('Raimi', 'Sam'),
    ('McQueen', 'Steve'),
    ('Favreau', 'Jon'),
    ('Darabont', 'Frank'),
    ('Lee', 'Spike'),
    ('Gilliam', 'Terry'),
    ('Gondry', 'Michel'),
    ('Mann', 'Michael'),
    ('Scott', 'Ridley'),
    ('Snyder', 'Zack'),
    ('Park', 'Chan-wook'),
    ('Allen', 'Ethan'),
    ('Scott', 'Tony'),
    ('Soderbergh', 'Steven'),
    ('Cuarón', 'Alfonso'),
    ('Coogler', 'Ryan'),
    ('Tarantino', 'Tony'),
    ('Apatow', 'Judd'),
    ('Wes', 'Craven'),
    ('Liman', 'Doug'),
    ('Spielberg', 'Joel'),
    ('Shyamalan', 'Manoj'),
    ('Marshall', 'Penny'),
    ('Johnson', 'Clark'),
    ('Nolan', 'Jonathan'),
    ('Stoller', 'Nicholas'),
    ('Wright', 'Joe'),
    ('McKay', 'Adam'),
    ('Zemeckis', 'Robert'),
    ('Mann', 'Anthony'),
    ('Ferrell', 'Will'),
    ('Friedkin', 'William'),
    ('Michell', 'Roger'),
    ('Greengrass', 'Paul'),
    ('LaBute', 'Neil'),
    ('Berg', 'Peter'),
    ('Wachowski', 'Lana'),
    ('Wachowski', 'Lilly'),
    ('Carruth', 'Shane'),
    ('Cassavetes', 'Nick'),
    ('Baumbach', 'Noah'),
    ('Foster', 'Jonathan'),
    ('Weir', 'Peter'),
    ('Gilliam', 'Terry'),
    ('Schnabel', 'Julian'),
    ('Lelouch', 'Claude'),
    ('Besson', 'Luc'),
    ('Refn', 'Nicolas Winding'),
    ('Linklater', 'Richard'),
    ('Greengrass', 'Paul'),
    ('Miller', 'George'),
    ('Miller', 'George'),
    ('Miller', 'George');

INSERT INTO films (titre, duree, annee, id_realisateur)
VALUES
    ('The Shawshank Redemption', '02:22:00', 1994, 1),
    ('The Godfather: Part II', '03:22:00', 1974, 6),
    ('The Dark Knight', '02:32:00', 2008, 1),
    ('Pulp Fiction', '02:34:00', 1994, 3),
    ('Schindler''s List', '03:15:00', 1993, 6),
    ('The Lord of the Rings: The Return of the King', '03:21:00', 2003, 8),
    ('Fi Club', '02:19:00', 1999, 9),
    ('Forst Gump', '02:22:00', 1994, 7),
    ('Inception', '02:28:00', 2010, 1),
    ('The Matrix', '02:16:00', 1999, 49),
    ('The Silence of the Lambs', '01:58:00', 1991, 7),
    ('Se7en', '02:07:00', 1995, 8),
    ('Gladiator', '02:35:00', 2000, 17),
    ('The Lord of the Rings: The Fellowship of the Ring', '02:58:00', 2001, 8),
    ('The Departed', '02:31:00', 2006, 4),
    ('The Green Mile', '03:09:00', 1999, 1),
    ('The Shawshank Redemption', '02:22:00', 1994, 1),
    ('The Godfather: Part II', '03:22:00', 1974, 6),
    ('The Dark Knight', '02:32:00', 2008, 1),
    ('Inception', '02:28:00', 2010, 1),
    ('The Matrix', '02:16:00', 1999, 49),
    ('The Silence of the Lambs', '01:58:00', 1991, 7),
    ('Se7en', '02:07:00', 1995, 8),
    ('Gladiator', '02:35:00', 2000, 17),
    ('The Lord of the Rings: The Fellowship of the Ring', '02:58:00', 2001, 8),
    ('The Departed', '02:31:00', 2006, 4),
    ('The Green Mile', '03:09:00', 1999, 1),
    ('The Dark Knight', '02:32:00', 2008, 1),
    ('Inception', '02:28:00', 2010, 1),
    ('The Matrix', '02:16:00', 1999, 49),
    ('The Silence of the Lambs', '01:58:00', 1991, 7),
    ('Se7en', '02:07:00', 1995, 8),
    ('Gladiator', '02:35:00', 2000, 17),
    ('The Lord of the Rings: The Fellowship of the Ring', '02:58:00', 2001, 8),
    ('The Departed', '02:31:00', 2006, 4),
    ('The Green Mile', '03:09:00', 1999, 1),
    ('The Shawshank Redemption', '02:22:00', 1994, 1),
    ('The Dark Knight', '02:32:00', 2008, 1),
    ('Inception', '02:28:00', 2010, 1),
    ('The Matrix', '02:16:00', 1999, 49),
    ('The Silence of the Lambs', '01:58:00', 1991, 7),
    ('Se7en', '02:07:00', 1995, 8),
    ('Gladiator', '02:35:00', 2000, 17),
    ('The Lord of the Rings: The Fellowship of the Ring', '02:58:00', 2001, 8),
    ('The Departed', '02:31:00', 2006, 4),
    ('The Green Mile', '03:09:00', 1999, 1);

INSERT INTO jouer (id_film, id_acteur, role_acteur)
VALUES
    (1, 1, 'Principal'),
    (5, 2, 'Principal'),
    (9, 3, 'Principal'),
    (15, 4, 'Principal'),
    (21, 5, 'Principal'),
    (26, 6, 'Principal'),
    (30, 7, 'Principal'),
    (35, 8, 'Principal'),
    (40, 9, 'Principal'),
    (45, 10, 'Principal'),
    (1, 11, 'Principal'),
    (2, 12, 'Principal'),
    (6, 13, 'Principal'),
    (9, 14, 'Principal'),
    (12, 15, 'Principal'),
    (16, 16, 'Principal'),
    (22, 17, 'Principal'),
    (26, 18, 'Principal'),
    (29, 14, 'Principal'),
    (32, 20, 'Principal'),
    (36, 21, 'Principal'),
    (39, 22, 'Principal'),
    (43, 23, 'Principal'),
    (3, 24, 'Principal'),
    (4, 25, 'Principal'),
    (7, 26, 'Principal'),
    (11, 27, 'Principal'),
    (16, 28, 'Principal'),
    (19, 29, 'Principal'),
    (24, 30, 'Principal'),
    (28, 14, 'Principal'),
    (32, 32, 'Principal'),
    (35, 33, 'Principal'),
    (39, 34, 'Principal'),
    (42, 35, 'Principal'),
    (5, 36, 'Principal'),
    (8, 37, 'Principal'),
    (12, 38, 'Principal'),
    (17, 39, 'Principal'),
    (20, 40, 'Principal'),
    (25, 9, 'Principal'),
    (29, 42, 'Principal'),
    (33, 43, 'Principal'),
    (36, 44, 'Principal'),
    (40, 45, 'Principal'),
    (43, 46, 'Principal'),
    (10, 47, 'Principal'),
    (14, 48, 'Principal'),
    (18, 49, 'Principal'),
    (21, 50, 'Principal'),
    (25, 51, 'Principal'),
    (29, 52, 'Principal'),
    (33, 53, 'Principal'),
    (37, 54, 'Principal'),
    (40, 55, 'Principal'),
    (44, 56, 'Principal'),
    (13, 57, 'Principal'),
    (19, 58, 'Principal'),
    (23, 59, 'Principal'),
    (28, 60, 'Principal'),
    (34, 61, 'Principal'),
    (38, 62, 'Principal'),
    (43, 63, 'Principal');

INSERT INTO roles (designation) VALUES
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


DELIMITER //
CREATE PROCEDURE listeFilmParRealisateur(IN nom_realisateur VARCHAR(50), IN prenom_realisateur VARCHAR(50))
BEGIN
    DECLARE Liste VARCHAR(10000);

    SELECT GROUP_CONCAT(films.titre) INTO Liste
    FROM films
    INNER JOIN realisateurs ON films.id_realisateur = realisateurs.id_realisateur
    WHERE realisateurs.nom = nom_realisateur AND realisateurs.prenom = prenom_realisateur;

    SELECT Liste AS films_realisateur; 
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