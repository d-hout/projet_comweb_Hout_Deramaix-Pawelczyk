<?php
function envoiJSON($donnees)
{
    $json = json_encode($donnees, JSON_UNESCAPED_UNICODE);
    echo $json;
}

function recupererNotes($nom_utilisateur, $mdp)
{
    header('Access-Control-Allow-Origin: *'); // Autorise toutes les origines
    $host = 'localhost'; // Variables de connexion
    $dbname = 'not_ensc';
    $username = 'root';
    $password = '';
    try {
        $bdd = new PDO('mysql:host='. $host .';dbname='. $dbname .';charset=utf8', $username, $password);
    } catch(Exception $e) {
        // Si erreur, tout arrêter
        die('Erreur : '. $e->getMessage());
    }
    $requete = "SELECT nom_eleve, prenom_eleve, nom_controle, note, commentaire
    FROM notes
    JOIN eleves ON notes.eleve_id=eleves.id JOIN professeurs ON notes.nom_matiere=professeurs.nom_matiere
    WHERE nom_utilisateur_prof = :nom_utilisateur AND mdp_prof = :mdp
    ORDER BY nom_eleve";
    $resultat = $bdd->prepare($requete);
    $resultat->execute([':nom_utilisateur' => $nom_utilisateur, ':mdp' => $mdp]);
    $tab = $resultat->fetchAll();
    envoiJSON($tab);
}

if (empty($_GET['nom_utilisateur']) || empty($_GET['mdp']))
{
    header("Content-Type: text/html; charset=UTF-8");
    echo "L'API s'utilise en écrivant localhost/API/professeurs.php?nom_utilisateur={NOM D'UTILISATEUR}&mdp={MOT DE PASSE} pour récupérer les informations.";
}
else
{
    header('Content-Type: application/json');
    $nom_utilisateur = $_GET['nom_utilisateur'];
    $mdp = $_GET['mdp'];
    recupererNotes($nom_utilisateur, $mdp);
}
?>