import { useState, useEffect } from 'react';
import Bandeau from './Bandeau.jsx';
import Poulpe from './Poulpe.jsx';

function PageFormulaireEleve() {
    const [clicConnexion, setClicConnexion] = useState(false);
    const [erreurConnexion, setErreurConnexion] = useState(false);
    const [identifiant, setIdentifiant] = useState('');
    const [mdp, setMdp] = useState('');
    
    const afficherNotesEleve = () => {
        setClicConnexion(true);
    }

    let json = {name:"",sprites:{front_default:null}};
    const [data, setData] = useState(json);

    const cliquer = () => {
        fetch(`http://localhost/API/eleves.php?nom_utilisateur=${identifiant}&mdp=${mdp}`)
            .then(r => r.json())
            .then(datas => {setData(datas)})
        if (data==[])
        {
            setClicConnexion(false);
            setErreurConnexion(true);
        }
    }

    useEffect(() => {if (clicConnexion) cliquer();}, [clicConnexion]);

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
            <h2>Vos notes</h2>
            </>
        )}
        </>
    );
}

export default PageFormulaireEleve;