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

INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, classe) VALUES ('mderamaix', 'mdp123', 'Deramaix', 'Mathilde', '1A');
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, classe) VALUES ('hdounia', 'mdp456', 'Hout', 'Dounia', '1A');
INSERT INTO eleves (nom_utilisateur_eleve, mdp_eleve, nom_eleve, prenom_eleve, classe) VALUES ('bpawelczyk', 'mdp789', 'Pawelczyk', 'Baptiste', '1A');

DROP TABLE IF EXISTS professeurs;
            CREATE TABLE IF NOT EXISTS professeurs (
                id INT AUTO_INCREMENT PRIMARY KEY,
                nom_utilisateur_prof VARCHAR(50) UNIQUE NOT NULL,
                mdp_prof VARCHAR(255) NOT NULL,
                nom_prof VARCHAR(100) NOT NULL,
                prenom_prof VARCHAR(100) NOT NULL,
                nom_matiere VARCHAR(100) NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO professeurs (nom_utilisateur_prof, mdp_prof, nom_prof, prenom_prof, nom_matiere) VALUES ('jsaracco', 'mdp123', 'Saracco', 'Jérôme', 'Mathématiques');
INSERT INTO professeurs (nom_utilisateur_prof, mdp_prof, nom_prof, prenom_prof, nom_matiere) VALUES ('fplacin', 'mdp456', 'Placin', 'Frédéric', 'Informatique');
INSERT INTO professeurs (nom_utilisateur_prof, mdp_prof, nom_prof, prenom_prof, nom_matiere) VALUES ('ssolomas', 'mdp789', 'Solomas', 'Sophie', 'Anglais');

DROP TABLE IF EXISTS notes;
            CREATE TABLE IF NOT EXISTS notes (
                id INT AUTO_INCREMENT PRIMARY KEY,
                eleve_id INT NOT NULL,
                nom_matiere VARCHAR(100) NOT NULL,
                nom_controle VARCHAR(100) NOT NULL,
                note FLOAT NOT NULL,
                commentaire TEXT
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Mathématiques', 'Contrôle 1', 15.5, 'Bon travail');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Mathématiques', 'Contrôle 1', 17, 'Très satisfaisant');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Mathématiques', 'Contrôle 1', 13, 'Peut mieux faire');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Informatique', 'TP 1', 15.5, 'Bon travail');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Informatique', 'TP 1', 13, 'Peut mieux faire');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Informatique', 'TP 1', 17, 'Très satisfaisant');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Anglais', 'Oral', 17, 'Très satisfaisant');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Anglais', 'Oral', 15, 'Bon travail');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Anglais', 'Oral', 13, 'Peut mieux faire');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (1, 'Mathématiques', 'Contrôle 2', 17, 'Très satisfaisant');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (2, 'Mathématiques', 'Contrôle 2', 15.5, 'Bon travail');
INSERT INTO notes (eleve_id, nom_matiere, nom_controle, note, commentaire) VALUES (3, 'Mathématiques', 'Contrôle 2', 13, 'Peut mieux faire');

