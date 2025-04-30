import { useState, useEffect } from 'react';
import Bandeau from './Bandeau.jsx';
import Poulpe from './Poulpe.jsx';

function PageFormulaireProf() {
    const [data, setData] = useState([]);
    const [clicConnexion, setClicConnexion] = useState(false);
    const [erreurConnexion, setErreurConnexion] = useState(false);
    const [identifiant, setIdentifiant] = useState('');
    const [mdp, setMdp] = useState('');

    const API = () => {
        fetch(`http://localhost/API/professeurs.php?nom_utilisateur=${identifiant}&mdp=${mdp}`)
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

    const afficherNotesProf = () => {
        setClicConnexion(true);
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
            const tableau = [];
            for (let j = 0; j < donnees.length; j++)
                if (donnees[j].nom_controle == controles[i]) {
                    tableau.push(
                        <tr key={`${donnees[j].nom_controle}_${j}`}>
                            <td>{donnees[j].nom_eleve} {donnees[j].prenom_eleve}</td>
                            <td>{donnees[j].note}</td>
                            <td>{donnees[j].commentaire}</td>
                        </tr>
                    );
                }
    
            tableaux.push(
                <div className="tableau" key={controles[i]}>
                    <h2>{controles[i]}</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Élèves</th>
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
            {notes}
            </>
        )}
        </>
    );
}

export default PageFormulaireProf;