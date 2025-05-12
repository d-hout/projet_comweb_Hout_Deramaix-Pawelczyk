CREATE DATABASE IF NOT EXISTS `bpawelczyk`;
USE `bpawelczyk`;

DROP TABLE IF EXISTS eleves;
CREATE TABLE IF NOT EXISTS eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_utilisateur_eleve VARCHAR(50) UNIQUE NOT NULL,
    mdp_eleve VARCHAR(255) NOT NULL,
    nom_eleve VARCHAR(100) NOT NULL,
    prenom_eleve VARCHAR(100) NOT NULL,
    groupe INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('lbourely', 'pluie', 'Bourely', 'Louis', 1);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('tpelichet', 'cascade', 'Pelichet', 'Thibert', 1);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('eprudhommeaux', 'sapin', 'Prudhommeaux', 'Erwan', 1);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('mderamaix', 'bonbon', 'Deramaix', 'Mathilde', 2);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('dhout', 'plage', 'Hout', 'Dounia', 2);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('bpawelczyk', 'cookie', 'Pawelczyk', 'Baptiste', 2);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('vbalachandran', 'lilas', 'Balachandran', 'Vanathy', 3);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('mdemongelas', 'volcan', 'De Mongelas', 'Maxence', 3);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('lpepin', 'citron', 'Pepin', 'Lou', 3);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('phoussemaine', 'orage', 'Houssemaine', 'Pascal', 4);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('npeyrot', 'montagne', 'Peyrot', 'Noé', 4);
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, groupe) VALUES ('mtieu', 'nuage', 'Tieu', 'Mattéo', 4);

DROP TABLE IF EXISTS professeurs;
CREATE TABLE IF NOT EXISTS professeurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_utilisateur_prof VARCHAR(50) UNIQUE NOT NULL,
    mdp_prof VARCHAR(255) NOT NULL,
    nom_prof VARCHAR(100) NOT NULL,
    prenom_prof VARCHAR(100) NOT NULL,
    nom_matiere VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO professeurs (nom_utilisateur_prof, mdp_prof, nom_prof, prenom_prof, nom_matiere) VALUES ('ssolomas', 'soleil', 'Solomas', 'Sophie', 'Anglais');
INSERT INTO professeurs (nom_utilisateur_prof, mdp_prof, nom_prof, prenom_prof, nom_matiere) VALUES ('fplacin', 'voiture', 'Placin', 'Frédéric', 'Communication Web');
INSERT INTO professeurs (nom_utilisateur_prof, mdp_prof, nom_prof, prenom_prof, nom_matiere) VALUES ('atetelin', 'chat', 'Tetelin', 'Angélique', 'Programmation Avancée');
INSERT INTO professeurs (nom_utilisateur_prof, mdp_prof, nom_prof, prenom_prof, nom_matiere) VALUES ('jsaracco', 'arbre', 'Saracco', 'Jérôme', 'Statistique inférentielle et analyse de données');

DROP TABLE IF EXISTS notes;
CREATE TABLE IF NOT EXISTS notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    eleve_id INT NOT NULL,
    nom_matiere VARCHAR(100) NOT NULL,
    nom_controle VARCHAR(100) NOT NULL,
    note VARCHAR(5) NOT NULL,
    coefficient FLOAT NOT NULL,
    commentaire TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (1, 'Anglais', 'Essay', "16/20", 1, 'Good structure and vocabulary, minor grammar mistakes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (2, 'Anglais', 'Essay', "12/20", 1, 'Relevant ideas but unclear organization');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (3, 'Anglais', 'Essay', "18/20", 1, 'Excellent writing and deep analysis');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (4, 'Anglais', 'Essay', "14/20", 1, 'Good vocabulary but repetitive phrasing');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (5, 'Anglais', 'Essay', "11/20", 1, 'Simple ideas, needs to expand vocabulary');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (6, 'Anglais', 'Essay', "17/20", 1, 'Fluent and engaging writing style');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (7, 'Anglais', 'Essay', "15/20", 1, 'Coherent arguments with some grammar slips');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (8, 'Anglais', 'Essay', "13/20", 1, 'Good ideas but lacking depth');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (9, 'Anglais', 'Essay', "16/20", 1, 'Clear structure and well-developed thesis');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (10, 'Anglais', 'Essay', "10/20", 1, 'Insufficient development and basic vocabulary');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (11, 'Anglais', 'Essay', "14/20", 1, 'Logical flow but minor spelling issues');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (12, 'Anglais', 'Essay', "13/20", 1, 'Simple writing but good effort');

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (1, 'Anglais', 'For or against', "14/20", 2, 'Clear speech but some pronunciation issues');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (2, 'Anglais', 'For or against', "11/20", 2, 'Weak arguments and poor structure');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (3, 'Anglais', 'For or against', "17/20", 2, 'Strong arguments and great public speaking');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (4, 'Anglais', 'For or against', "13/20", 2, 'Fair structure and good effort in speaking');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (5, 'Anglais', 'For or against', "12/20", 2, 'Clear speech but too short');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (6, 'Anglais', 'For or against', "15/20", 2, 'Confident delivery and clear arguments');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (7, 'Anglais', 'For or against', "16/20", 2, 'Persuasive and well-articulated points');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (8, 'Anglais', 'For or against', "10/20", 2, 'Incoherent ideas and lack of fluency');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (9, 'Anglais', 'For or against', "14/20", 2, 'Good fluency but weak conclusion');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (10, 'Anglais', 'For or against', "11/20", 2, 'Too short and unclear vocabulary');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (11, 'Anglais', 'For or against', "13/20", 2, 'Clear opinion but lack of examples');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (12, 'Anglais', 'For or against', "15/20", 2, 'Well-balanced arguments and fluent speech');

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (1, 'Communication Web', 'COMWEB-TPNoté1', "3/5", 1, 'Manipulation correcte mais code peu optimisé');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (2, 'Communication Web', 'COMWEB-TPNoté1', "2/5", 1, 'Fonctionnalités incomplètes et code confus');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (3, 'Communication Web', 'COMWEB-TPNoté1', "5/5", 1, 'Excellent respect des consignes et code clair');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (4, 'Communication Web', 'COMWEB-TPNoté1', "3/5", 1, 'Respect partiel des consignes, code parfois confus');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (5, 'Communication Web', 'COMWEB-TPNoté1', "4/5", 1, 'Respect des consignes, effort de structuration');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (6, 'Communication Web', 'COMWEB-TPNoté1', "4/5", 1, 'Travail propre et bien structuré');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (7, 'Communication Web', 'COMWEB-TPNoté1', "3/5", 1, 'Fonctionnel mais peu commenté');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (8, 'Communication Web', 'COMWEB-TPNoté1', "4/5", 1, 'Bonne présentation mais code à améliorer');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (9, 'Communication Web', 'COMWEB-TPNoté1', "2/5", 1, 'Confusion dans la structure HTML/CSS');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (10, 'Communication Web', 'COMWEB-TPNoté1', "4/5", 1, 'Code clair mais sans initiative');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (11, 'Communication Web', 'COMWEB-TPNoté1', "2/5", 1, 'Fonctionnalités incomplètes et erreurs fréquentes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (12, 'Communication Web', 'COMWEB-TPNoté1', "3/5", 1, 'Structure correcte mais style peu travaillé');

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (1, 'Communication Web', 'COMWEB-TPNoté2', "2/5", 1, 'Échec dans l’exploitation correcte de l’API');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (2, 'Communication Web', 'COMWEB-TPNoté2', "3/5", 1, 'Connexion fonctionnelle mais présentation pauvre');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (3, 'Communication Web', 'COMWEB-TPNoté2', "5/5", 1, 'Bonne gestion de l’API et affichage soigné');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (4, 'Communication Web', 'COMWEB-TPNoté2', "2/5", 1, 'Erreurs dans les appels d’API');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (5, 'Communication Web', 'COMWEB-TPNoté2', "3/5", 1, 'Connexion établie mais mauvaises réponses traitées');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (6, 'Communication Web', 'COMWEB-TPNoté2', "4/5", 1, 'Implémentation correcte et affichage cohérent');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (7, 'Communication Web', 'COMWEB-TPNoté2', "2/5", 1, 'Manque de clarté dans la gestion des données');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (8, 'Communication Web', 'COMWEB-TPNoté2', "3/5", 1, 'Travail propre, données bien interprétées');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (9, 'Communication Web', 'COMWEB-TPNoté2', "3/5", 1, 'Requête correcte mais rendu faible');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (10, 'Communication Web', 'COMWEB-TPNoté2', "3/5", 1, 'Structure claire mais manque de validation');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (11, 'Communication Web', 'COMWEB-TPNoté2', "2/5", 1, 'Données incorrectes, mauvais parsing');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (12, 'Communication Web', 'COMWEB-TPNoté2', "4/5", 1, 'Excellent traitement et affichage des données');

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (1, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "14/20", 3, 'Analyse correcte mais interprétations inexactes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (2, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "17/20", 3, 'Rigueur et bonne précision dans l’analyse');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (3, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "9/20", 3, 'Erreurs dans les calculs et incompréhensions');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (4, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "15/20", 3, 'Démarche rigoureuse et interprétations justes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (5, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "13/20", 3, 'Calculs exacts mais interprétations floues');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (6, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "16/20", 3, 'Analyse claire et bien rédigée');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (7, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "10/20", 3, 'Confusions sur les hypothèses de tests');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (8, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "14/20", 3, 'Méthodologie correcte mais conclusion incomplète');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (9, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "12/20", 3, 'Moyennement structuré, mais résultats cohérents');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (10, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "11/20", 3, 'Calculs erronés mais démarche présente');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (11, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "15/20", 3, 'Très bon raisonnement statistique');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (12, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', "13/20", 3, 'Présentation correcte mais peu approfondie');

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (1, 'Statistique inférentielle et analyse de données', 'Projet R', "7/20", 1.5, 'Projet inachevé et résultats non exploitables');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (2, 'Statistique inférentielle et analyse de données', 'Projet R', "18/20", 1.5, 'Projet complet avec code bien optimisé');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (3, 'Statistique inférentielle et analyse de données', 'Projet R', "12/20", 1.5, 'Travail fonctionnel mais analyse trop superficielle');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (4, 'Statistique inférentielle et analyse de données', 'Projet R', "15/20", 1.5, 'Analyse rigoureuse, présentation claire');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (5, 'Statistique inférentielle et analyse de données', 'Projet R', "11/20", 1.5, 'Résultats corrects mais peu justifiés');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (6, 'Statistique inférentielle et analyse de données', 'Projet R', "17/20", 1.5, 'Bon code et analyse pertinente');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (7, 'Statistique inférentielle et analyse de données', 'Projet R', "9/20", 1.5, 'Faible exploitation des résultats');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (8, 'Statistique inférentielle et analyse de données', 'Projet R', "14/20", 1.5, 'Travail bien structuré, code lisible');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (9, 'Statistique inférentielle et analyse de données', 'Projet R', "10/20", 1.5, 'Présentation sommaire et résultats imprécis');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (10, 'Statistique inférentielle et analyse de données', 'Projet R', "16/20", 1.5, 'Code fluide et analyse détaillée');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (11, 'Statistique inférentielle et analyse de données', 'Projet R', "8/20", 1.5, 'Travail incomplet mais méthodologie correcte');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (12, 'Statistique inférentielle et analyse de données', 'Projet R', "13/20", 1.5, 'Analyse pertinente mais graphiques absents');

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (1, 'Programmation Avancée', 'Examen machine 2025', "9/20", 3, 'Nombreuses erreurs et fonctionnalités manquantes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (2, 'Programmation Avancée', 'Examen machine 2025', "13/20", 3, 'Logique correcte mais plusieurs erreurs');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (3, 'Programmation Avancée', 'Examen machine 2025', "16/20", 3, 'Code fonctionnel et logique solide');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (4, 'Programmation Avancée', 'Examen machine 2025', "15/20", 3, 'Structure maîtrisée et bonnes pratiques');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (5, 'Programmation Avancée', 'Examen machine 2025', "10/20", 3, 'Fonctionnalités partielles et bugs récurrents');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (6, 'Programmation Avancée', 'Examen machine 2025', "18/20", 3, 'Bonne gestion des cas limites');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (7, 'Programmation Avancée', 'Examen machine 2025', "11/20", 3, 'Manque d’organisation dans le code');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (8, 'Programmation Avancée', 'Examen machine 2025', "17/20", 3, 'Code propre, tests complets');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (9, 'Programmation Avancée', 'Examen machine 2025', "12/20", 3, 'Fonctionnalités présentes mais logique fragile');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (10, 'Programmation Avancée', 'Examen machine 2025', "14/20", 3, 'Algorithmes bien choisis, mais bugs mineurs');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (11, 'Programmation Avancée', 'Examen machine 2025', "13/20", 3, 'Bonne base mais manque de complétion');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (12, 'Programmation Avancée', 'Examen machine 2025', "16/20", 3, 'Approche claire et résultats fiables');

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (1, 'Programmation Avancée', 'Projet ENSemenC 2025', "19/20", 1.5, 'Excellente structure et usage efficace des classes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (2, 'Programmation Avancée', 'Projet ENSemenC 2025', "15/20", 1.5, 'Projet solide mais classes mal exploitées');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (3, 'Programmation Avancée', 'Projet ENSemenC 2025', "11/20", 1.5, 'Utilisation limitée des classes et faible évolutivité');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (4, 'Programmation Avancée', 'Projet ENSemenC 2025', "18/20", 1.5, 'Architecture robuste et bien pensée');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (5, 'Programmation Avancée', 'Projet ENSemenC 2025', "13/20", 1.5, 'Implémentation fonctionnelle mais rigide');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (6, 'Programmation Avancée', 'Projet ENSemenC 2025', "17/20", 1.5, 'Excellent découpage et réutilisabilité du code');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (7, 'Programmation Avancée', 'Projet ENSemenC 2025', "12/20", 1.5, 'Architecture correcte mais manque de modularité');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (8, 'Programmation Avancée', 'Projet ENSemenC 2025', "16/20", 1.5, 'Projet bien mené et classes bien utilisées');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (9, 'Programmation Avancée', 'Projet ENSemenC 2025', "14/20", 1.5, 'Code structuré mais manque de clarté');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (10, 'Programmation Avancée', 'Projet ENSemenC 2025', "15/20", 1.5, 'Résultat convaincant mais peu commenté');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (11, 'Programmation Avancée', 'Projet ENSemenC 2025', "10/20", 1.5, 'Peu de lisibilité et fonctions peu réutilisables');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, coefficient, commentaire) VALUES (12, 'Programmation Avancée', 'Projet ENSemenC 2025', "16/20", 1.5, 'Bonne architecture et résultats solides');