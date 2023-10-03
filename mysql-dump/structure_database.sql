DROP DATABASE streaming-lp-db;
CREATE DATABASE streaming-lp-db;

USE streaming-lp-db;

CREATE TABLE acteurs (
   id_acteur INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   date_naissance DATE NOT NULL,
   PRIMARY KEY (id_acteur)
);

CREATE TABLE realisateurs (
   id_realisateur INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   PRIMARY KEY (id_realisateur)
);

CREATE TABLE archives (
   id_archives INT AUTO_INCREMENT,
   date_modif TIMESTAMP NOT NULL,
   ancienne_val VARCHAR(50) NOT NULL,
   nouvelle_val VARCHAR(50) NOT NULL,
   PRIMARY KEY (id_archives)
);

CREATE TABLE roles (
   id_role INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   PRIMARY KEY (id_role)
);

CREATE TABLE films (
   id_film INT AUTO_INCREMENT,
   titre VARCHAR(100) NOT NULL,
   duree TIME NOT NULL,
   annee INT NOT NULL,
   id_realisateur INT NOT NULL,
   PRIMARY KEY (id_film),
   FOREIGN KEY (id_realisateur) REFERENCES realisateurs (id_realisateur)
);

CREATE TABLE utilisateurs (
   id_utilisateur INT AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   mail VARCHAR(100) NOT NULL,
   mdp VARCHAR(50) NOT NULL,
   id_role INT NOT NULL,
   PRIMARY KEY (id_utilisateur),
   FOREIGN KEY (id_role) REFERENCES roles (id_role)
);

CREATE TABLE jouer (
   id_film INT,
   id_acteur INT,
   PRIMARY KEY (id_film, id_acteur),
   FOREIGN KEY (id_film) REFERENCES films (id_film),
   FOREIGN KEY (id_acteur) REFERENCES acteurs (id_acteur)
);

CREATE TABLE visionner (
   id_film INT,
   id_utilisateur INT,
   PRIMARY KEY (id_film, id_utilisateur),
   FOREIGN KEY (id_film) REFERENCES films (id_film),
   FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs (id_utilisateur)
);

CREATE TABLE modifier (
   id_utilisateur INT,
   id_archives INT,
   PRIMARY KEY (id_utilisateur, id_archives),
   FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs (id_utilisateur),
   FOREIGN KEY (id_archives) REFERENCES archives (id_archives)
);

CREATE TABLE favoris (
   id_film INT,
   id_utilisateur INT,
   PRIMARY KEY (id_film, id_utilisateur),
   FOREIGN KEY (id_film) REFERENCES films (id_film),
   FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs (id_utilisateur)
);

