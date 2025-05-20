import { useState, useEffect } from 'react';
import Bandeau from './Bandeau.jsx';
import Poulpe from './Poulpe.jsx';

function PageFormulaireEleve() { 
    //etats
    const [data, setData] = useState([]);
    const [data2, setData2] = useState([]);
    const [nomEleve, setNomEleve] = useState('');
    const [prenomEleve, setPrenomEleve] = useState('');
    const [clicConnexion, setClicConnexion] = useState(false);
    const [erreurConnexion, setErreurConnexion] = useState(false);
    const [erreurChampsVides, setErreurChampsVides] = useState(false);
    const [identifiant, setIdentifiant] = useState('');
    const [mdp, setMdp] = useState('');
    
    // Appels API pour récupérer les données si les identifiants sont corrects
    const API = () => {
        fetch(`https://bpawelczyk.zzz.bordeaux-inp.fr/not_ensc/eleves.php?nom_utilisateur=${identifiant}&mdp=${mdp}`)
            .then(r => r.json())
            .then(data => {
                //verification qu'une saisie a été faite pour l'identifiant
                if (data.length == 0) { //si champs vides
                    setErreurConnexion(true);
                    setClicConnexion(false);
                } else {
                    //si champs remplis
                    setErreurConnexion(false);
                    setData(data);
                }
            })

        //même chose pour le mots de passe
        fetch(`https://bpawelczyk.zzz.bordeaux-inp.fr/not_ensc/nom_prenom_eleves.php?nom_utilisateur=${identifiant}&mdp=${mdp}`)
            .then(r => r.json())
            .then(data2 => {
                if (data2.length == 0) {
                    setErreurConnexion(true);
                    setClicConnexion(false);
                } else {
                    setErreurConnexion(false);
                    setData2(data2);
                    setNomEleve(data2[0].nom_eleve);
                    setPrenomEleve(data2[0].prenom_eleve);
                }
            })
    };
    
    // Déclenche l’appel API si le bouton a été cliqué
    useEffect(() => {
        if (clicConnexion) {
            API();
        }
    }, [clicConnexion]);

    const afficherNotesEleve = (e) => {
        e.preventDefault(); // Empêcher le rechargement de la page
        if (identifiant.trim() == "" || mdp.trim() == "") {
            setErreurChampsVides(true);
            setErreurConnexion(false);
        } else {
            setErreurChampsVides(false);
            setClicConnexion(true);
        }
    }
    
    // Crée les tableaux par matière à partir des données de notes
    const afficherTableaux = (donnees) => {
        const matieres = [];
        const tableaux = [];

        // Récupérer le nom des matières
        for (let i = 0; i < donnees.length; i++) {
            const matiere = donnees[i].nom_matiere;
            let estPresent = false;
            for (let j = 0; j < matieres.length; j++)
                if (matieres[j] == matiere)
                    estPresent = true;
            if (estPresent == false)
                matieres.push(matiere);
        }

        // Générer un tableau pour chaque matière
        for (let i = 0; i < matieres.length; i++) {
            let sommeNotesPonderees = 0;
            let sommeCoefficients = 0;
            const tableau = [];
            for (let j = 0; j < donnees.length; j++)
                if (donnees[j].nom_matiere == matieres[i]) {
                    tableau.push(
                        <tr key={donnees[j].nom_controle}>
                            <td>{donnees[j].nom_controle}</td>
                            <td>{donnees[j].coefficient}</td>
                            <td>{donnees[j].note}</td>
                            <td>{donnees[j].commentaire}</td>
                        </tr>
                    );

                    // Calcul moyenne pondérée par matière
                    let coefficient = donnees[j].coefficient;
                    let [note, surCombien] = donnees[j].note.split('/');
                    coefficient = parseFloat(coefficient);
                    note = parseFloat(note);
                    surCombien = parseFloat(surCombien);
                    const noteSurVingt = note * 20 / surCombien;
                    sommeNotesPonderees += noteSurVingt * coefficient;
                    sommeCoefficients += coefficient;
                }

            tableaux.push(
                <div className="tableau" key={matieres[i]}>
                    <h2>{matieres[i]}</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Nom des contrôles</th>
                                <th>Coefficients</th>
                                <th>Notes</th>
                                <th>Commentaires</th>
                            </tr>
                        </thead>
                        <tbody>
                            {tableau}
                        </tbody>
                        <tfoot>
                            <tr>
                                <td className='moyenne' colSpan="4">Moyenne : {(sommeNotesPonderees / sommeCoefficients).toFixed(2)}/20</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            );
        }

        return tableaux;
    };
    
    // Moyenne générale toutes matières confondues
    const calculerMoyenneGenerale = (donnees) => {
        let sommeNotesPonderees = 0;
        let sommeCoefficients = 0;

        for (let i = 0; i < donnees.length; i++) {
            const coefficient = parseFloat(donnees[i].coefficient);
            const [noteStr, surCombienStr] = donnees[i].note.split('/');
            const note = parseFloat(noteStr);
            const surCombien = parseFloat(surCombienStr);
            const noteSurVingt = note * 20 / surCombien;
            sommeNotesPonderees += noteSurVingt * coefficient;
            sommeCoefficients += coefficient;
        }

        return (sommeNotesPonderees / sommeCoefficients).toFixed(2);
    };

    const notes = afficherTableaux(data); // Génère les tableaux

    return (
        <>
        <Bandeau/>
        <Poulpe/>
        {!clicConnexion ? (
            <form onSubmit={afficherNotesEleve}>
                <label>Identifiant</label>
                <input type="text" id="identifiant" value={identifiant} onChange={(e) => setIdentifiant(e.target.value)}/>
                <label>Mot de passe</label>
                <input type="password" id="mdp" value={mdp} onChange={(e) => setMdp(e.target.value)}/>
                <button type="submit">Se connecter</button>
                {erreurChampsVides ? (
                    <p>Veuillez remplir tous les champs !</p>
                ) : erreurConnexion ? (
                    <p>Identifiant ou mot de passe incorrect !</p>
                ) : (
                    <p></p>
                )}
            </form>
        ) : (
            <>
            <p className='nomPrenom'>Bienvenue, {prenomEleve} {nomEleve}</p>
            <div className="notes">
                {notes}
            </div>
            <div className='moyenneGenerale'>
                <strong>Moyenne générale :</strong> {calculerMoyenneGenerale(data)}/20
            </div>
            </>
        )}
        </>
    );
}

export default PageFormulaireEleve;
