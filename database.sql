DROP DATABASE IF EXISTS streamingDB;
CREATE DATABASE streamingDB;

USE streamingDB;

CREATE TABLE acteurs(
   id_acteur INT AUTO_INCREMENT,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   date_naissance DATE NOT NULL,
   date_creation DATETIME,
   date_modification DATETIME,
   PRIMARY KEY(id_acteur)
);

CREATE TABLE realisateurs(
   id_realisateur INT AUTO_INCREMENT,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   date_creation DATETIME,
   date_modification DATETIME,
   PRIMARY KEY(id_realisateur)
);

CREATE TABLE roles(
   id_role INT AUTO_INCREMENT,
   designation VARCHAR(50)  NOT NULL,
   date_creation DATETIME,
   date_modification DATETIME,
   PRIMARY KEY(id_role)
);

CREATE TABLE films(
   id_film INT AUTO_INCREMENT,
   titre VARCHAR(100)  NOT NULL,
   duree TIME NOT NULL,
   annee INT NOT NULL,
   id_realisateur INT NOT NULL,
   date_creation DATETIME,
   date_modification DATETIME,
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
   date_creation DATETIME,
   date_modification DATETIME,
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

INSERT INTO acteurs (nom, prenom, date_naissance, date_creation)
VALUES
    ('Smith', 'Will', '1968-09-25', NOW()),
    ('Johansson', 'Scarlett', '1984-11-22', NOW()),
    ('DiCaprio', 'Leonardo', '1974-11-11', NOW()),
    ('Roberts', 'Julia', '1967-10-28', NOW()),
    ('Pitt', 'Brad', '1963-12-18', NOW()),
    ('Lawrence', 'Jennifer', '1990-08-15', NOW()),
    ('Hanks', 'Tom', '1956-07-09', NOW()),
    ('Kidman', 'Nicole', '1967-06-20', NOW()),
    ('Cruise', 'Tom', '1962-07-03', NOW()),
    ('Streep', 'Meryl', '1949-06-22', NOW()),
    ('Hathaway', 'Anne', '1982-11-12', NOW()),
    ('Jackson', 'Samuel L.', '1948-12-21', NOW()),
    ('Portman', 'Natalie', '1981-06-09', NOW()),
    ('Damon', 'Matt', '1970-10-08', NOW()),
    ('Depp', 'Johnny', '1963-06-09', NOW()),
    ('Winslet', 'Kate', '1975-10-05', NOW()),
    ('Efron', 'Zac', '1987-10-18', NOW()),
    ('Watson', 'Emma', '1990-04-15', NOW()),
    ('Mara', 'Rooney', '1985-04-17', NOW()),
    ('Gosling', 'Ryan', '1980-11-12', NOW()),
    ('Cumberbatch', 'Benedict', '1976-07-19', NOW()),
    ('Law', 'Jude', '1972-12-29', NOW()),
    ('Blunt', 'Emily', '1983-02-23', NOW()),
    ('Bullock', 'Sandra', '1964-07-26', NOW()),
    ('Hemsworth', 'Chris', '1983-08-11', NOW()),
    ('Stone', 'Emma', '1988-11-06', NOW()),
    ('Pine', 'Chris', '1980-08-26', NOW()),
    ('Hiddleston', 'Tom', '1981-02-09', NOW()),
    ('Johnson', 'Dwayne "The Rock"', '1972-05-02', NOW()),
    ('Kunis', 'Mila', '1983-08-14', NOW()),
    ('Affleck', 'Ben', '1972-08-15', NOW()),
    ('Lawrence', 'Jude', '1972-12-29', NOW()),
    ('Roberts', 'Emma', '1991-02-10', NOW()),
    ('Farrell', 'Colin', '1976-05-31', NOW()),
    ('Jolie', 'Angelina', '1975-06-04', NOW()),
    ('Evans', 'Chris', '1981-06-13', NOW()),
    ('Holland', 'Tom', '1996-06-01', NOW()),
    ('Fassbender', 'Michael', '1977-04-02', NOW()),
    ('Harris', 'Naomie', '1976-09-06', NOW()),
    ('Johnson', 'Dakota', '1989-10-04', NOW()),
    ('Smith', 'Jaden', '1998-07-08', NOW()),
    ('Stewart', 'Kristen', '1990-04-09', NOW()),
    ('Hoult', 'Nicholas', '1989-12-07', NOW()),
    ('Keaton', 'Michael', '1951-09-05', NOW()),
    ('Theron', 'Charlize', '1975-08-07', NOW()),
    ('Hardy', 'Tom', '1977-09-15', NOW()),
    ('Neeson', 'Liam', '1952-06-07', NOW()),
    ('Cranston', 'Bryan', '1956-03-07', NOW()),
    ('Thompson', 'Emma', '1959-04-15', NOW()),
    ('Pfeiffer', 'Michelle', '1958-04-29', NOW()),
    ('Smith', 'Maggie', '1934-09-24', NOW()),
    ('McConaughey', 'Matthew', '1969-11-04', NOW()),
    ('Cavill', 'Henry', '1983-05-05', NOW()),
    ('Stewart', 'Patrick', '1940-07-13', NOW()),
    ('Ford', 'Harrison', '1942-07-13', NOW()),
    ('Lawson', 'Jennifer', '1949-12-31', NOW()),
    ('Connery', 'Sean', '1930-08-25', NOW()),
    ('Hopkins', 'Anthony', '1937-12-31', NOW()),
    ('Lee', 'Christopher', '1922-05-27', NOW()),
    ('Keanu', 'Reeves', '1964-09-02', NOW()),
    ('Thompson', 'Tessa', '1983-10-03', NOW()),
    ('Swinton', 'Tilda', '1960-11-05', NOW()),
    ('Malkovich', 'John', '1953-12-09', NOW()),
    ('Redmayne', 'Eddie', '1982-01-06', NOW()),
    ('Lawrence', 'Martin', '1962-04-16', NOW()),
    ('Paltrow', 'Gwyneth', '1972-09-27', NOW()),
    ('Robbie', 'Margot', '1990-07-02', NOW()),
    ('Hanks', 'Colin', '1977-11-24', NOW()),
    ('Diesel', 'Vin', '1967-07-18', NOW()),
    ('Norton', 'Edward', '1969-08-18', NOW());

INSERT INTO realisateurs (nom, prenom, date_creation)
VALUES
    ('Nolan', 'Christopher', NOW()),
    ('Spielberg', 'Steven', NOW()),
    ('Tarantino', 'Quentin', NOW()),
    ('Scorsese', 'Martin', NOW()),
    ('Cameron', 'James', NOW()),
    ('Coppola', 'Francis Ford', NOW()),
    ('Anderson', 'Wes', NOW()),
    ('Bigelow', 'Kathryn', NOW()),
    ('Fincher', 'David', NOW()),
    ('Burton', 'Tim', NOW()),
    ('Lee', 'Ang', NOW()),
    ('Kubrick', 'Stanley', NOW()),
    ('Wright', 'Edgar', NOW()),
    ('Miller', 'George', NOW()),
    ('Coen', 'Joel', NOW()),
    ('Coen', 'Ethan', NOW()),
    ('Villeneuve', 'Denis', NOW()),
    ('Ritchie', 'Guy', NOW()),
    ('Del Toro', 'Guillermo', NOW()),
    ('Shyamalan', 'M. Night', NOW()),
    ('Johnson', 'Rian', NOW()),
    ('Reeves', 'Matt', NOW()),
    ('Lynch', 'David', NOW()),
    ('Allen', 'Woody', NOW()),
    ('Eastwood', 'Clint', NOW()),
    ('Stone', 'Oliver', NOW()),
    ('Cronenberg', 'David', NOW()),
    ('Gibson', 'Mel', NOW()),
    ('Cohen', 'Andrew', NOW()),
    ('Farrelly', 'Peter', NOW()),
    ('Farrelly', 'Bobby', NOW()),
    ('Raimi', 'Sam', NOW()),
    ('McQueen', 'Steve', NOW()),
    ('Favreau', 'Jon', NOW()),
    ('Darabont', 'Frank', NOW()),
    ('Lee', 'Spike', NOW()),
    ('Gilliam', 'Terry', NOW()),
    ('Gondry', 'Michel', NOW()),
    ('Mann', 'Michael', NOW()),
    ('Scott', 'Ridley', NOW()),
    ('Snyder', 'Zack', NOW()),
    ('Park', 'Chan-wook', NOW()),
    ('Allen', 'Ethan', NOW()),
    ('Scott', 'Tony', NOW()),
    ('Soderbergh', 'Steven', NOW()),
    ('Cuarón', 'Alfonso', NOW()),
    ('Coogler', 'Ryan', NOW()),
    ('Tarantino', 'Tony', NOW()),
    ('Apatow', 'Judd', NOW()),
    ('Wes', 'Craven', NOW()),
    ('Liman', 'Doug', NOW()),
    ('Spielberg', 'Joel', NOW()),
    ('Shyamalan', 'Manoj', NOW()),
    ('Marshall', 'Penny', NOW()),
    ('Johnson', 'Clark', NOW()),
    ('Nolan', 'Jonathan', NOW()),
    ('Stoller', 'Nicholas', NOW()),
    ('Wright', 'Joe', NOW()),
    ('McKay', 'Adam', NOW()),
    ('Zemeckis', 'Robert', NOW()),
    ('Mann', 'Anthony', NOW()),
    ('Ferrell', 'Will', NOW()),
    ('Friedkin', 'William', NOW()),
    ('Michell', 'Roger', NOW()),
    ('Greengrass', 'Paul', NOW()),
    ('LaBute', 'Neil', NOW()),
    ('Berg', 'Peter', NOW()),
    ('Wachowski', 'Lana', NOW()),
    ('Wachowski', 'Lilly', NOW()),
    ('Carruth', 'Shane', NOW()),
    ('Cassavetes', 'Nick', NOW()),
    ('Baumbach', 'Noah', NOW()),
    ('Foster', 'Jonathan', NOW()),
    ('Weir', 'Peter', NOW()),
    ('Schnabel', 'Julian', NOW()),
    ('Lelouch', 'Claude', NOW()),
    ('Besson', 'Luc', NOW()),
    ('Refn', 'Nicolas Winding', NOW()),
    ('Linklater', 'Richard', NOW()),
    ('Greengrass', 'Paul', NOW()),
    ('Miller', 'George', NOW());

INSERT INTO films (titre, duree, annee, id_realisateur, date_creation)
VALUES
    ('The Shawshank Redemption', '02:22:00', 1994, 1, NOW()),
    ('The Godfather: Part II', '03:22:00', 1974, 6, NOW()),
    ('The Dark Knight', '02:32:00', 2008, 1, NOW()),
    ('Pulp Fiction', '02:34:00', 1994, 3, NOW()),
    ('Schindler''s List', '03:15:00', 1993, 6, NOW()),
    ('The Lord of the Rings: The Return of the King', '03:21:00', 2003, 8, NOW()),
    ('Fight Club', '02:19:00', 1999, 9, NOW()),
    ('Forst Gump', '02:22:00', 1994, 7, NOW()),
    ('Inception', '02:28:00', 2010, 1, NOW()),
    ('The Matrix', '02:16:00', 1999, 49, NOW()),
    ('The Silence of the Lambs', '01:58:00', 1991, 7, NOW()),
    ('Se7en', '02:07:00', 1995, 8, NOW()),
    ('Gladiator', '02:35:00', 2000, 17, NOW()),
    ('The Lord of the Rings: The Fellowship of the Ring', '02:58:00', 2001, 8, NOW()),
    ('The Departed', '02:31:00', 2006, 4, NOW()),
    ('The Green Mile', '03:09:00', 1999, 1, NOW()),
    ('The Social Network', '02:00:00', 2010, 2, NOW()),
    ('Toy Story 3', '01:43:00', 2010, 3, NOW()),
    ('Black Swan', '01:48:00', 2010, 4, NOW()),
    ('The King''s Speech', '01:58:00', 2010, 5, NOW()),
    ('Drive', '01:40:00', 2011, 6, NOW()),
    ('The Artist', '01:40:00', 2011, 7, NOW()),
    ('The Girl with the Dragon Tattoo', '02:38:00', 2011, 8, NOW()),
    ('The Descendants', '01:55:00', 2011, 9, NOW()),
    ('Midnight in Paris', '01:34:00', 2011, 10, NOW()),
    ('Django Unchained', '02:45:00', 2012, 3, NOW()),
    ('Argo', '02:00:00', 2012, 11, NOW()),
    ('Life of Pi', '02:07:00', 2012, 12, NOW()),
    ('Silver Linings Playbook', '02:02:00', 2012, 13, NOW()),
    ('Lincoln', '02:30:00', 2012, 14, NOW()),
    ('Gravity', '01:31:00', 2013, 15, NOW()),
    ('12 Years a Slave', '02:14:00', 2013, 16, NOW()),
    ('The Wolf of Wall Street', '03:00:00', 2013, 3, NOW()),
    ('Her', '02:06:00', 2013, 17, NOW()),
    ('Birdman', '01:59:00', 2014, 18, NOW()),
    ('Boyhood', '02:45:00', 2014, 19, NOW()),
    ('Whiplash', '01:47:00', 2014, 20, NOW()),
    ('The Grand Budapest Hotel', '01:39:00', 2014, 7, NOW()),
    ('The Revenant', '02:36:00', 2015, 1, NOW()),
    ('Mad Max: Fury Road', '02:00:00', 2015, 21, NOW()),
    ('Spotlight', '02:09:00', 2015, 22, NOW()),
    ('The Martian', '02:24:00', 2015, 23, NOW()),
    ('La La Land', '02:08:00', 2016, 24, NOW()),
    ('Moonlight', '01:51:00', 2016, 25, NOW()),
    ('Manchester by the Sea', '02:17:00', 2016, 26, NOW()),
    ('Arrival', '01:56:00', 2016, 27, NOW()),
    ('Get Out', '01:44:00', 2017, 28, NOW()),
    ('Dunkirk', '01:46:00', 2017, 29, NOW()),
    ('The Shape of Water', '02:03:00', 2017, 30, NOW()),
    ('Three Billboards Outside Ebbing, Missouri', '01:55:00', 2017, 31, NOW()),
    ('Black Panther', '02:14:00', 2018, 32, NOW()),
    ('A Star Is Born', '02:16:00', 2018, 33, NOW()),
    ('Bohemian Rhapsody', '02:14:00', 2018, 34, NOW()),
    ('Green Book', '02:10:00', 2018, 35, NOW()),
    ('Parasite', '02:12:00', 2019, 36, NOW()),
    ('Joker', '02:02:00', 2019, 37, NOW()),
    ('1917', '01:59:00', 2019, 38, NOW()),
    ('Once Upon a Time in Hollywood', '02:41:00', 2019, 3, NOW()),
    ('Nomadland', '01:47:00', 2020, 39, NOW()),
    ('The Trial of the Chicago 7', '02:09:00', 2020, 40, NOW()),
    ('Soul', '01:40:00', 2020, 41, NOW()),
    ('Mank', '02:11:00', 2020, 42, NOW()),
    ('Minari', '01:55:00', 2020, 43, NOW());


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

INSERT INTO utilisateurs (nom, prenom, mail, mdp, id_role, date_creation) VALUES
    ('Doe', 'John', 'john.doe@example.com', 'motdepasse1', 1, NOW()),
    ('Smith', 'Jane', 'jane.smith@example.com', 'motdepasse2', 1, NOW()),
    ('Brown', 'Robert', 'robert.brown@example.com', 'motdepasse3', 2, NOW()),
    ('Johnson', 'Mary', 'mary.johnson@example.com', 'motdepasse4', 2, NOW()),
    ('Wilson', 'David', 'david.wilson@example.com', 'motdepasse5', 2, NOW()),
    ('Lee', 'Sarah', 'sarah.lee@example.com', 'motdepasse6', 2, NOW()),
    ('Garcia', 'Michael', 'michael.garcia@example.com', 'motdepasse7', 2, NOW()),
    ('Martinez', 'Linda', 'linda.martinez@example.com', 'motdepasse8', 2, NOW()),
    ('Hernandez', 'James', 'james.hernandez@example.com', 'motdepasse9', 2, NOW()),
    ('Lopez', 'Susan', 'susan.lopez@example.com', 'motdepasse10', 2, NOW()),
    ('Gonzalez', 'William', 'william.gonzalez@example.com', 'motdepasse11', 2, NOW()),
    ('Davis', 'Patricia', 'patricia.davis@example.com', 'motdepasse12', 2, NOW()),
    ('Rodriguez', 'Richard', 'richard.rodriguez@example.com', 'motdepasse13', 2, NOW()),
    ('Jackson', 'Barbara', 'barbara.jackson@example.com', 'motdepasse14', 2, NOW()),
    ('White', 'Joseph', 'joseph.white@example.com', 'motdepasse15', 2, NOW()),
    ('Williams', 'Dorothy', 'dorothy.williams@example.com', 'motdepasse16', 2, NOW()),
    ('Thomas', 'Charles', 'charles.thomas@example.com', 'motdepasse17', 2, NOW()),
    ('Moore', 'Betty', 'betty.moore@example.com', 'motdepasse18', 2, NOW()),
    ('Taylor', 'George', 'george.taylor@example.com', 'motdepasse19', 2, NOW()),
    ('Anderson', 'Margaret', 'margaret.anderson@example.com', 'motdepasse20', 2, NOW());


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

        INSERT INTO utilisateurs(date_modification)
        VALUES (NOW());

    ELSEIF OLD.prenom <> NEW.prenom THEN
        INSERT INTO archives (id_utilisateur, nom_col, date_modif, ancienne_val, nouvelle_val)
        VALUES (NEW.id_utilisateur, 'prenom', NOW(), OLD.prenom, NEW.prenom);

        INSERT INTO utilisateurs(date_modification)
        VALUES (NOW());

    ELSEIF OLD.mail <> NEW.mail THEN
        INSERT INTO archives (id_utilisateur, nom_col, date_modif, ancienne_val, nouvelle_val)
        VALUES (NEW.id_utilisateur, 'mail', NOW(), OLD.mail, NEW.mail);

        INSERT INTO utilisateurs(date_modification)
        VALUES (NOW());

    ELSEIF OLD.mdp <> NEW.mdp THEN
        INSERT INTO archives (id_utilisateur, nom_col, date_modif, ancienne_val, nouvelle_val)
        VALUES (NEW.id_utilisateur, 'mdp', NOW(), OLD.mdp, NEW.mdp);

        INSERT INTO utilisateurs(date_modification)
        VALUES (NOW());

    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER films_before_update
BEFORE UPDATE ON films
FOR EACH ROW
BEGIN
    SET NEW.date_modification = NOW();
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER acteurs_before_update
BEFORE UPDATE ON acteurs
FOR EACH ROW
BEGIN
    SET NEW.date_modification = NOW();
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER realisateurs_before_update
BEFORE UPDATE ON realisateurs
FOR EACH ROW
BEGIN
    SET NEW.date_modification = NOW();
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER utilisateurs_before_update
BEFORE UPDATE ON utilisateurs
FOR EACH ROW
BEGIN
    SET NEW.date_modification = NOW();
END;
//
DELIMITER ;

