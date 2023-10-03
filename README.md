# Plateforme de streaming
## Contexte du projet
En tant que développeur passionné par le cinéma, vous avez toujours été fasciné par la magie du grand écran. Cette passion ne se limite pas seulement à regarder des films. Vous avez toujours été curieux de connaître les coulisses, d'étudier qui a joué dans tel film, qui l'a réalisé, et comment ces chefs-d'œuvre ont été créés. Vous trouvez aussi que les plateformes de streaming sont un formidable accès à un catalogue d'oeuvres de toute sorte à découvrir.
Vous avez donc envie de créer, vous aussi, votre propre plateforme de streaming sur votre temps libre.
Mais comme Rome ne s'est pas construite en un jour, vous voulez commencer par la mise en place d'un site web permettant de procéder à différentes opérations de recherches à propos de films, d'acteurs/actrices ou de réalisateurs.
Sauf que. La partie site web n'est pas pour tout de suite 😃
Avant celà, vous avez besoin d'une base de données pour le stockage. Et donc de la concevoir et la mettre en place!
A vous de jouer 🙂
​
#### Contraintes
- Le noSQL (MongoDB...) n'est pas autorisé
- Vous devez créer votre propre environnement Docker
- Un *trigger* doit être mis en place, également appelé déclencheur

- Seul l'administrateur de la BDD pourra ajouter, modifier ou supprimer des données. 
- Pour chaque entrée dans la base de données, il y aura la date de création et de modification.

#### Deadline
4 jours.

#### Modalités d'évaluation
Correction entre pairs.  
Vos requêtes seront testées en local après l'importation de votre environnemnt docker.

#### Livrables
Un dépôt GitHub contenant :
- l'environnement docker
- le dictionnaire de données
- MCD
- MPD
- MLD
- un fichier permettant de générer la bdd (incluant quelques données)
- le jeu de requêtes dans le *README.md*

# Result

## Dictionnaire de données
![img_png](./Conception/dictionnaire_de_donnees.png)

## Diagramme 

### MCD 

![img_mcd](./Conception/MCD.png)

### MLD 

![img_mld](./Conception/MLD.png)

### MPD 

![img_mpd](./Conception/MPD.png)

## Requete SQL 

*Les titres et mes dates de sortie des films du plus récent au plus ancien*
SELECT titre, annee FROM films ORDER BY annee DESC;

*Les noms, prénoms et âges des acteurs/actrices de plus de 50 ans dans l'ordre alphabetique*
SELECT nom, prenom, date_naissance, 
    YEAR(CURDATE()) - YEAR(date_naissance) AS age 
FROM acteurs
WHERE date_naissance <= DATE_SUB(CURDATE(), INTERVAL 50 YEAR)
ORDER BY nom, prenom;

*La liste des acteurs/actrices principaux pour un film donné (en supposant que l'acteur principal est celui avec le rôle "Acteur Principal")*
SELECT acteurs.nom, acteurs.prenom, films.titre
FROM acteurs
INNER JOIN jouer ON acteurs.id_acteur = jouer.id_acteur
INNER JOIN films ON jouer.id_film = films.id_film
WHERE jouer.role = 'Principal'
AND film.titre = ['Titre film']

*La liste des films pour un acteur/actrice donné (en supposant que vous connaissez l'ID de l'acteur/actrice)*
SELECT films.titre, films.annee
FROM films
INNER JOIN jouer ON films.id_film = jouer.id_film
WHERE jouer.id_acteur = [ID_de_l_acteur];

*Ajouter un acteur/actrice (assumant que vous avez les valeurs pour nom, prenom et date de naissance)*
INSERT INTO acteurs (nom, prenom, date_naissance)
VALUES ('Nouveau', 'Acteur', '1990-01-01');

*Modifier un film (assumant que vous avez l'ID du film que vous souhaitez modifier et la nouvelle valeur pour le titre)*
UPDATE films
SET titre = ['Nouveau Titre']
WHERE id_film = [ID_du_film];

*Supprimer un acteur/actrice (assumant que vous avez l'ID de l'acteur/actrice que vous souhaitez supprimer*
DELETE FROM acteurs
WHERE id_acteur = [ID_de_l_acteur];

*Afficher les 3 derniers acteurs/actrices ajouté(e)s*
SELECT nom, prenom, date_naissance
FROM acteurs
ORDER BY id_acteur DESC
LIMIT 3;