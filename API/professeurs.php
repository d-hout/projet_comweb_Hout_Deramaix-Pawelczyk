<?php
function envoiJSON($donnees)
{
    $json = json_encode($donnees, JSON_UNESCAPED_UNICODE);
    echo $json;
}

// Fonction pour récupérer les notes des élèves correspondant à un professeur authentifié
function recupererNotes($nom_utilisateur, $mdp)
{
    header('Access-Control-Allow-Origin: *'); // Autorise toutes les origines
    $host = 'localhost'; // Variables de connexion
    $dbname = 'bpawelczyk';
    $username = 'bpawelczyk';
    $password = 'avion';
    
    // Connexion à la base de données avec gestion d'erreurs
    try {
        $bdd = new PDO('mysql:host='. $host .';dbname='. $dbname .';charset=utf8', $username, $password);
    } catch(Exception $e) {
        // Si erreur, tout arrêter
        die('Erreur : '. $e->getMessage());
    }
    
    // Requête SQL : récupère les notes des élèves du professeur identifié
    $requete = "SELECT nom_eleve, prenom_eleve, nom_controle, note, coefficient, commentaire, groupe
    FROM notes
    JOIN eleves ON notes.eleve_id=eleves.id JOIN professeurs ON notes.nom_matiere=professeurs.nom_matiere
    WHERE nom_utilisateur_prof = :nom_utilisateur AND mdp_prof = :mdp
    ORDER BY nom_eleve";
    
    // Préparation et exécution de la requête avec les paramètres sécurisés
    $resultat = $bdd->prepare($requete);
    $resultat->execute([':nom_utilisateur' => $nom_utilisateur, ':mdp' => $mdp]);
    $tab = $resultat->fetchAll();
    envoiJSON($tab);
}

// Vérifie la présence des paramètres d’identification dans l’URL
if (empty($_GET['nom_utilisateur']) || empty($_GET['mdp']))
{
    header("Content-Type: text/html; charset=UTF-8");
    echo "L'API s'utilise en écrivant bpawelczyk.zzz.bordeaux-inp.fr/not_ensc/professeurs.php?nom_utilisateur={NOM D'UTILISATEUR}&mdp={MOT DE PASSE} pour récupérer les informations.";
}
else
{
    // Si les paramètres sont présents, appel de la fonction avec réponse en JSON
    header('Content-Type: application/json');
    $nom_utilisateur = $_GET['nom_utilisateur'];
    $mdp = $_GET['mdp'];
    recupererNotes($nom_utilisateur, $mdp);
}
?>
