<?php
function envoiJSON($donnees)
{
    $json = json_encode($donnees, JSON_UNESCAPED_UNICODE);
    echo $json;
}

// Fonction pour récupérer les notes d’un élève à partir de son nom d’utilisateur et de son mot de passe
function recupererNotes($nom_utilisateur, $mdp)
{
    header('Access-Control-Allow-Origin: *'); // Autorise toutes les origines
    $host = 'localhost'; // Variables de connexion
    $dbname = 'bpawelczyk';
    $username = 'bpawelczyk';
    $password = 'avion';
    try {
        $bdd = new PDO('mysql:host='. $host .';dbname='. $dbname .';charset=utf8', $username, $password);
    } catch(Exception $e) {
        // Si erreur, tout arrêter
        die('Erreur : '. $e->getMessage());
    }
    $requete = "SELECT nom_eleve, prenom_eleve
    FROM eleves
    WHERE nom_utilisateur_eleve = :nom_utilisateur AND mdp_eleve = :mdp";
    $resultat = $bdd->prepare($requete);
    $resultat->execute([':nom_utilisateur' => $nom_utilisateur, ':mdp' => $mdp]);
    $tab = $resultat->fetchAll();
    // Envoi du résultat au format JSON
    envoiJSON($tab);
}

// Vérifie que les paramètres GET 'nom_utilisateur' et 'mdp' sont bien fournis
if (empty($_GET['nom_utilisateur']) || empty($_GET['mdp']))
{
    // Si l’un des paramètres est manquant, on affiche un message d’aide
    header("Content-Type: text/html; charset=UTF-8");
    echo "L'API s'utilise en écrivant bpawelczyk.zzz.bordeaux-inp.fr/not_ensc/nom_prenom_eleves.php?nom_utilisateur={NOM D'UTILISATEUR}&mdp={MOT DE PASSE} pour récupérer les informations.";
}
else
{
    // Si les paramètres sont bien fournis, on appelle la fonction principale
    header('Content-Type: application/json');
    $nom_utilisateur = $_GET['nom_utilisateur'];
    $mdp = $_GET['mdp'];
    recupererNotes($nom_utilisateur, $mdp);
}
?>
