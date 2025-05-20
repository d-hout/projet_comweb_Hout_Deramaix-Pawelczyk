<?php
function envoiJSON($donnees)
{
    $json = json_encode($donnees, JSON_UNESCAPED_UNICODE);
    echo $json;
}

// Fonction pour récupérer les notes d’un élève à partir de son identifiant et mot de passe
function recupererNotes($nom_utilisateur, $mdp)
{
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
    
    // Requête SQL pour récupérer les notes de l’élève
    $requete = "SELECT nom_matiere, nom_controle, note, coefficient, commentaire
    FROM notes
    JOIN eleves ON notes.eleve_id=eleves.id
    WHERE nom_utilisateur_eleve = :nom_utilisateur AND mdp_eleve = :mdp
    ORDER BY nom_matiere";
    
    // Préparation et exécution de la requête
    $resultat = $bdd->prepare($requete);
    $resultat->execute([':nom_utilisateur' => $nom_utilisateur, ':mdp' => $mdp]);
    // Récupération des résultats sous forme de tableau
    $tab = $resultat->fetchAll();
    envoiJSON($tab);
}

// Vérifie si les paramètres nom_utilisateur et mdp sont fournis dans l’URL
if (empty($_GET['nom_utilisateur']) || empty($_GET['mdp']))
{
    header("Content-Type: text/html; charset=UTF-8");
    echo "L'API s'utilise en écrivant bpawelczyk.zzz.bordeaux-inp.fr/not_ensc/eleves.php?nom_utilisateur={NOM D'UTILISATEUR}&mdp={MOT DE PASSE} pour récupérer les informations.";
}
else
{
    // Si les deux paramètres sont fournis, on envoie une réponse JSON avec les notes
    header('Content-Type: application/json');
    $nom_utilisateur = $_GET['nom_utilisateur'];
    $mdp = $_GET['mdp'];
    recupererNotes($nom_utilisateur, $mdp);
}
?>
