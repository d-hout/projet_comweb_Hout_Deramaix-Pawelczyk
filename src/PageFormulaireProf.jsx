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

    const organiserParControle = (donnees) => {
        const controles = {};
        donnees.forEach((item) => {
            const controle = item.nom_controle;
            if (!controles[controle]) {
                controles[controle] = [];
            }
            controles[controle].push(item);
        });
        return controles;
    };

    const controlesOrganises = organiserParControle(data);

    return (
        <>
        <Bandeau />
        <Poulpe />
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
            {Object.keys(controlesOrganises).map((controle) => (
                <div className="tableau">
                    <h2>{controle}</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Élèves</th>
                                <th>Notes</th>
                                <th>Commentaires</th>
                            </tr>
                        </thead>
                        <tbody>
                            {controlesOrganises[controle].map(eleve => (
                                <tr>
                                    <td>{eleve.nom_eleve} {eleve.prenom_eleve}</td>
                                    <td>{eleve.note}</td>
                                    <td>{eleve.commentaire}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            ))}
            </>
        )}
        </>
    );
}

export default PageFormulaireProf;