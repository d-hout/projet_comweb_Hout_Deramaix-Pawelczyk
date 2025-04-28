CREATE DATABASE IF NOT EXISTS `not_ensc`;
USE `not_ensc`;

DROP TABLE IF EXISTS eleves;
CREATE TABLE IF NOT EXISTS eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_utilisateur_eleve VARCHAR(50) UNIQUE NOT NULL,
    mdp_eleve VARCHAR(255) NOT NULL,
    nom_eleve VARCHAR(100) NOT NULL,
    prenom_eleve VARCHAR(100) NOT NULL,
    classe VARCHAR(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, classe) VALUES ('mderamaix', 'bonbon', 'Deramaix', 'Mathilde', '1A');
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, classe) VALUES ('dhout', 'plage', 'Hout', 'Dounia', '1A');
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, classe) VALUES ('bpawelczyk', 'cookie', 'Pawelczyk', 'Baptiste', '1A');

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
    note FLOAT NOT NULL,
    commentaire TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Anglais', 'Essay', 16, 'Good structure and vocabulary, minor grammar mistakes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Anglais', 'Essay', 12, 'Relevant ideas but unclear organization');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Anglais', 'Essay', 18, 'Excellent writing and deep analysis');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Anglais', 'For or against', 14, 'Clear speech but some pronunciation issues');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Anglais', 'For or against', 11, 'Weak arguments and poor structure');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Anglais', 'For or against', 17, 'Strong arguments and great public speaking');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Communication Web', 'COMWEB-TPNoté1', 15, 'Manipulation correcte mais code peu optimisé');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Communication Web', 'COMWEB-TPNoté1', 10, 'Fonctionnalités incomplètes et code confus');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Communication Web', 'COMWEB-TPNoté1', 18, 'Excellent respect des consignes et code clair');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Communication Web', 'COMWEB-TPNoté2', 8, 'Échec dans l’exploitation correcte de l’API');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Communication Web', 'COMWEB-TPNoté2', 13, 'Connexion fonctionnelle mais présentation pauvre');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Communication Web', 'COMWEB-TPNoté2', 17, 'Bonne gestion de l’API et affichage soigné');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', 14, 'Analyse correcte mais interprétations inexactes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', 17, 'Rigueur et bonne précision dans l’analyse');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Statistique inférentielle et analyse de données', 'Examen mai 2025', 9, 'Erreurs dans les calculs et incompréhensions');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Statistique inférentielle et analyse de données', 'Projet R', 7, 'Projet inachevé et résultats non exploitables');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Statistique inférentielle et analyse de données', 'Projet R', 18, 'Projet complet avec code bien optimisé');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Statistique inférentielle et analyse de données', 'Projet R', 12, 'Travail fonctionnel mais analyse trop superficielle');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Programmation Avancée', 'Examen machine 2025', 9, 'Nombreuses erreurs et fonctionnalités manquantes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Programmation Avancée', 'Examen machine 2025', 13, 'Logique correcte mais plusieurs erreurs');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Programmation Avancée', 'Examen machine 2025', 16, 'Code fonctionnel et logique solide');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Programmation Avancée', 'Projet ENSemenC 2025', 19, 'Excellente structure et usage efficace des classes');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Programmation Avancée', 'Projet ENSemenC 2025', 15, 'Projet solide mais classes mal exploitées');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Programmation Avancée', 'Projet ENSemenC 2025', 11, 'Utilisation limitée des classes et faible évolutivité');