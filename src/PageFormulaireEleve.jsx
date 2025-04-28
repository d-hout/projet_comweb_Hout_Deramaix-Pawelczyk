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

    const organiserParMatiere = (donnees) => {
        const matieres = {};
        donnees.forEach((item) => {
            const matiere = item.nom_matiere;
            if (!matieres[matiere]) {
                matieres[matiere] = [];
            }
            matieres[matiere].push(item);
        });
        return matieres;
    };

    const matieresOrganisees = organiserParMatiere(data);

    return (
        <>
        <Bandeau />
        <Poulpe />
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
            {Object.keys(matieresOrganisees).map((matiere) => (
                <div className="tableau">
                    <h2>{matiere}</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Nom du contrôle</th>
                                <th>Notes</th>
                                <th>Commentaires</th>
                            </tr>
                        </thead>
                        <tbody>
                            {matieresOrganisees[matiere].map(devoir => (
                                <tr>
                                    <td>{devoir.nom_controle}</td>
                                    <td>{devoir.note}</td>
                                    <td>{devoir.commentaire}</td>
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

export default PageFormulaireEleve;