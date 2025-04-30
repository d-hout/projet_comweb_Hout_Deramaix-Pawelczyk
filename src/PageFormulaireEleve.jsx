import { useState, useEffect } from 'react';
import Bandeau from './Bandeau.jsx';
import Poulpe from './Poulpe.jsx';

function PageFormulaireEleve() {
    const [data, setData] = useState([]);
    const [clicConnexion, setClicConnexion] = useState(false);
    const [erreurConnexion, setErreurConnexion] = useState(false);
    const [identifiant, setIdentifiant] = useState('');
    const [mdp, setMdp] = useState('');

    const API = () => {
        fetch(`http://localhost/API/eleves.php?nom_utilisateur=${identifiant}&mdp=${mdp}`)
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
    };

    useEffect(() => {
        if (clicConnexion) {
            API();
        }
    }, [clicConnexion]);

    const afficherNotesEleve = () => {
        setClicConnexion(true);
    };

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
            const tableau = [];
            for (let j = 0; j < donnees.length; j++)
                if (donnees[j].nom_matiere == matieres[i]) {
                    tableau.push(
                        <tr key={donnees[j].nom_controle}>
                            <td>{donnees[j].nom_controle}</td>
                            <td>{donnees[j].note}</td>
                            <td>{donnees[j].commentaire}</td>
                        </tr>
                    );
                }
    
            tableaux.push(
                <div className="tableau" key={matieres[i]}>
                    <h2>{matieres[i]}</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Nom du contrôle</th>
                                <th>Notes</th>
                                <th>Commentaires</th>
                            </tr>
                        </thead>
                        <tbody>
                            {tableau}
                        </tbody>
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
            <form onSubmit={afficherNotesEleve}>
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
            {notes}
            </>
        )}
        </>
    );
}

export default PageFormulaireEleve;