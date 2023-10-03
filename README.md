# Plateforme de streaming

streaming-lp

## Contexte du projet

En tant que développeur passionné par le cinéma, vous avez toujours été fasciné par la magie du grand écran. Cette passion ne se limite pas seulement à regarder des films. Vous avez toujours été curieux de connaître les coulisses, d'étudier qui a joué dans tel film, qui l'a réalisé, et comment ces chefs-d'œuvre ont été créés. Vous trouvez aussi que les plateformes de streaming sont un formidable accès à un catalogue d'oeuvres de toute sorte à découvrir.

Vous avez donc envie de créer, vous aussi, votre propre plateforme de streaming sur votre temps libre.

Mais comme Rome ne s'est pas construite en un jour, vous voulez commencer par la mise en place d'un site web permettant de procéder à différentes opérations de recherches à propos de films, d'acteurs/actrices ou de réalisateurs.

Sauf que. La partie site web n'est pas pour tout de suite 😃

Avant celà, vous avez besoin d'une base de données pour le stockage. Et donc de la concevoir et la mettre en place!

A vous de jouer 🙂

## Modalités pédagogiques

**Activité individuelle en mode collaboratif.**

### Structure de la base de donnée

*Les films*  
Un film comporte un titre, un ou plusieurs acteurs, un réalisateur, une durée et l'année de sa sortie.

*Les acteurs, actrices*  
Nom, prénom, rôle et date de naissance.

*Les réalisateurs*  
Nom et prénom.

*Les utilisateurs*  
Nom, prénom, email, mot de passe, rôle et liste des films préférés.

### Les requêtes

Voici un jeu de requêtes minimal à fournir pour tester votre bdd :
- les titres et dates de sortie des films du plus récent au plus ancien
- les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique
- la liste des acteurs/actrices principaux pour un film donné
- la liste des films pour un acteur/actrice donné
- ajouter un film
- ajouter un acteur/actrice
- modifier un film
- supprimer un acteur/actrice
- afficher les 3 derniers acteurs/actrices ajouté(e)s

Nous avons aussi besoin de manipulations avancées:
- Lister grâce à une procédure stockée les films d'un réalisateur donné en paramètre
- Garder grâce à un trigger une trace de toutes les modifications apportées à la table des utilisateurs. Ainsi, une table d'archive conservera la date de la mise à jour, l'identifiant de l'utilisateur concerné, l'ancienne valeur ainsi que la nouvelle.

A placer dans le *README.md*.
​
### Contraintes

- Le noSQL (MongoDB...) n'est pas autorisé
- Vous devez créer votre propre environnement Docker
- Un *trigger* doit être mis en place, également appelé déclencheur

- Seul l'administrateur de la BDD pourra ajouter, modifier ou supprimer des données. 
- Pour chaque entrée dans la base de données, il y aura la date de création et de modification.


### Deadline

4 jours.

## Modalités d'évaluation

Correction entre pairs.  
Vos requêtes seront testées en local après l'importation de votre environnemnt docker.

## Livrables

Un dépôt GitHub contenant :
- l'environnement docker
- le dictionnaire de données
- MCD
- MPD
- MLD
- un fichier permettant de générer la bdd (incluant quelques données)
- le jeu de requêtes dans le *README.md*
