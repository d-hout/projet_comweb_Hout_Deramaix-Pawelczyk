<?php
function envoiJSON($donnees)
{
    $json = json_encode($donnees, JSON_UNESCAPED_UNICODE);
    echo $json;
}

// Fonction pour récupérer le nom et prénom d’un professeur via son identifiant et mot de passe
function recupererNotes($nom_utilisateur, $mdp)
{
     // Informations de connexion à la base de données
    header('Access-Control-Allow-Origin: *'); // Autorise toutes les origines
    $host = 'localhost'; // Variables de connexion
    $dbname = 'bpawelczyk';
    $username = 'bpawelczyk';
    $password = 'avion';
    
    // Connexion à la base de données avec gestion d’erreur
    try {
        $bdd = new PDO('mysql:host='. $host .';dbname='. $dbname .';charset=utf8', $username, $password);
    } catch(Exception $e) {
        // Si erreur, tout arrêter
        die('Erreur : '. $e->getMessage());
    }
    
    // Requête SQL : récupère le nom et prénom du professeur correspondant à l’identifiant et mot de passe
    $requete = "SELECT nom_prof, prenom_prof
    FROM professeurs
    WHERE nom_utilisateur_prof = :nom_utilisateur AND mdp_prof = :mdp";
    $resultat = $bdd->prepare($requete);
    $resultat->execute([':nom_utilisateur' => $nom_utilisateur, ':mdp' => $mdp]);
    
    // Récupération des résultats sous forme de tableau
    $tab = $resultat->fetchAll();
    envoiJSON($tab);
}

// Vérifie que les deux paramètres sont bien fournis dans l’URL
if (empty($_GET['nom_utilisateur']) || empty($_GET['mdp']))
{
    header("Content-Type: text/html; charset=UTF-8");
    echo "L'API s'utilise en écrivant bpawelczyk.zzz.bordeaux-inp.fr/not_ensc/nom_prenom_professeurs.php?nom_utilisateur={NOM D'UTILISATEUR}&mdp={MOT DE PASSE} pour récupérer les informations.";
}
else
{
    header('Content-Type: application/json');
    $nom_utilisateur = $_GET['nom_utilisateur'];
    $mdp = $_GET['mdp'];
    recupererNotes($nom_utilisateur, $mdp);
}
?>
