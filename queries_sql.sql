-- Les titres et mes dates de sortie des films du plus récent au plus ancien 
SELECT titre, annee FROM films ORDER BY annee DESC;

-- Les noms, prénoms et âges des acteurs/actrices de plus de 50 ans dans l'ordre alphabetique
SELECT nom, prenom, date_naissance, 
    YEAR(CURDATE()) - YEAR(date_naissance) AS age 
FROM acteurs
WHERE date_naissance <= DATE_SUB(CURDATE(), INTERVAL 50 YEAR)
ORDER BY nom, prenom;

-- La liste des acteurs/actrices principaux pour un film donné (en supposant que l'acteur principal est celui avec le rôle "Acteur Principal")
SELECT acteurs.nom, acteurs.prenom, films.titre
FROM acteurs
INNER JOIN jouer ON acteurs.id_acteur = jouer.id_acteur
INNER JOIN films ON jouer.id_film = films.id_film
WHERE jouer.role_acteur = 'Principal'
AND films.titre = 'The Dark Knight'

-- La liste des films pour un acteur/actrice donné (en supposant que vous connaissez l'ID de l'acteur/actrice)
SELECT films.titre, films.annee
FROM films
INNER JOIN jouer ON films.id_film = jouer.id_film
WHERE jouer.id_acteur = 1;

-- Ajouter un acteur/actrice (assumant que vous avez les valeurs pour nom, prenom et date de naissance)
INSERT INTO acteurs (nom, prenom, date_naissance, date_creation)
VALUES ('Nouveau', 'Acteur', '1990-01-01', NOW());

-- Modifier un film (assumant que vous avez l'ID du film que vous souhaitez modifier et la nouvelle valeur pour le titre) 
UPDATE films
SET titre = 'Nouveau Titre'
WHERE id_film = 1;

-- Supprimer un acteur/actrice (assumant que vous avez l'ID de l'acteur/actrice que vous souhaitez supprimer
DELETE FROM acteurs
WHERE id_acteur = 1;

-- Afficher les 3 derniers acteurs/actrices ajouté(e)s
SELECT nom, prenom, date_naissance
FROM acteurs
ORDER BY id_acteur DESC
LIMIT 3;

-- Afficher le nombres total de films 
SELECT COUNT(*) AS total_films
FROM films;

-- Afficher les films entre 2000 et 2010
SELECT titre, annee
FROM films
WHERE annee BETWEEN 2000 AND 2010;

-- Appeler la procédure pour obtenir la liste des films de Christopher Nolan
USE streamingDB;

CALL listeFilmParRealisateur('Nolan', 'Christopher');
