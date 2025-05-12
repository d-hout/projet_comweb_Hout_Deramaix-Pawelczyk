import { useState, useEffect } from 'react';
import Bandeau from './Bandeau.jsx';
import Poulpe from './Poulpe.jsx';

function PageFormulaireProf() {
    const [data, setData] = useState([]);
    const [data2, setData2] = useState([]);
    const [nomProf, setNomProf] = useState('');
    const [prenomProf, setPrenomProf] = useState('');
    const [clicConnexion, setClicConnexion] = useState(false);
    const [erreurConnexion, setErreurConnexion] = useState(false);
    const [identifiant, setIdentifiant] = useState('');
    const [mdp, setMdp] = useState('');
    const [groupesSelectionnes, setGroupesSelectionnes] = useState({1: true, 2: true, 3: true, 4: true});

    const API = () => {
        fetch(`https://bpawelczyk.zzz.bordeaux-inp.fr/not_ensc/professeurs.php?nom_utilisateur=${identifiant}&mdp=${mdp}`)
            .then(r => r.json())
            .then(data => {
                if (data.length==0) {
                    setErreurConnexion(true);
                    setClicConnexion(false);
                } else {
                    setErreurConnexion(false);
                    setData(data);
                }
            })

        fetch(`https://bpawelczyk.zzz.bordeaux-inp.fr/not_ensc/nom_prenom_professeurs.php?nom_utilisateur=${identifiant}&mdp=${mdp}`)
            .then(r => r.json())
            .then(data2 => {
                if (data2.length==0) {
                    setErreurConnexion(true);
                    setClicConnexion(false);
                } else {
                    setErreurConnexion(false);
                    setData2(data2);
                    setNomProf(data2[0].nom_prof);
                    setPrenomProf(data2[0].prenom_prof);
                }
            })
    };

    useEffect(() => {
        if (clicConnexion) {
            API();
        }
    }, [clicConnexion]);

    const afficherNotesProf = () => {
        setClicConnexion(true);
    };

    const afficherNotesGroupes = (numeroGroupe) => {
        const nouvelEtat = {...groupesSelectionnes};
        nouvelEtat[numeroGroupe] = !groupesSelectionnes[numeroGroupe];
        setGroupesSelectionnes(nouvelEtat);
    };

    const afficherTableaux = (donnees) => {
        const controles = [];
        const tableaux = [];
    
        // Récupérer le nom des contrôles
        for (let i = 0; i < donnees.length; i++) {
            const controle = donnees[i].nom_controle;
            let estPresent = false;
            for (let j = 0; j < controles.length; j++)
                if (controles[j] == controle)
                    estPresent = true;
            if (estPresent == false)
                controles.push(controle);
        }
    
        // Générer un tableau pour chaque contrôle
        for (let i = 0; i < controles.length; i++) {
            let sommeNotesPonderees = 0;
            let sommeCoefficients = 0;
            const tableau = [];
            for (let j = 0; j < donnees.length; j++)
                if (donnees[j].nom_controle == controles[i] && groupesSelectionnes[donnees[j].groupe]==true) {
                    tableau.push(
                        <tr key={`${donnees[j].nom_controle}_${j}`}>
                            <td>{donnees[j].nom_eleve}</td>
                            <td>{donnees[j].prenom_eleve}</td>
                            <td>{donnees[j].note}</td>
                            <td>{donnees[j].commentaire}</td>
                        </tr>
                    );
                    let coefficient = donnees[j].coefficient;
                    let [note, surCombien] = donnees[j].note.split('/');
                    coefficient = parseFloat(coefficient);
                    note = parseFloat(note);
                    surCombien = parseFloat(surCombien);
                    const noteSurVingt = note*20/surCombien;
                    sommeNotesPonderees += noteSurVingt*coefficient;
                    sommeCoefficients += coefficient;
                }
    
            tableaux.push(
                <div className='tableau' key={controles[i]}>
                    <h2>{controles[i]}</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Noms</th>
                                <th>Prénoms</th>
                                <th>Notes</th>
                                <th>Commentaires</th>
                            </tr>
                        </thead>
                        <tbody>
                            {tableau}
                        </tbody>
                        <tfoot>
                            <tr>
                                <td className='moyenne' colSpan="4">Coefficient : {sommeCoefficients/tableau.length} — Moyenne : {(sommeNotesPonderees/sommeCoefficients).toFixed(2)}/20</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            );
        }
    
        return tableaux;
    };
    
    const notes = afficherTableaux(data);

    return (
        <>
        <Bandeau/>
        <Poulpe/>
        {!clicConnexion ? (
            <form onSubmit={afficherNotesProf}>
                <label>Identifiant</label>
                <input type="text" id="identifiant" value={identifiant} onChange={(e) => setIdentifiant(e.target.value)}/>
                <label>Mot de passe</label>
                <input type="password" id="mdp" value={mdp} onChange={(e) => setMdp(e.target.value)}/>
                <button type="submit">Se connecter</button>
                {erreurConnexion ? (
                    <p>Identifiant ou mot de passe incorrect !</p>
                ) : (
                    <p></p>
                )}
            </form>
        ) : (
            <>
            <div className='nomProf'>
                <p className='nomProf'>Bienvenue, {nomProf} {prenomProf}</p>
            </div>
            <div className="groupes">
                <label>
                    <input type="checkbox" checked={groupesSelectionnes[1]} onChange={() => afficherNotesGroupes(1)}/> Groupe 1
                </label>
                <label>
                    <input type="checkbox" checked={groupesSelectionnes[2]} onChange={() => afficherNotesGroupes(2)}/> Groupe 2
                </label>
                <label>
                    <input type="checkbox" checked={groupesSelectionnes[3]} onChange={() => afficherNotesGroupes(3)}/> Groupe 3
                </label>
                <label>
                    <input type="checkbox" checked={groupesSelectionnes[4]} onChange={() => afficherNotesGroupes(4)}/> Groupe 4
                </label>
            </div>
            <div className="notes">
                {notes}
            </div>
            </>
        )}
        </>
    );
}

export default PageFormulaireProf;