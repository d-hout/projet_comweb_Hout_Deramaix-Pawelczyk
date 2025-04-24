import { useState } from 'react';
import Bandeau from './Bandeau.jsx';
import Poulpe from './Poulpe.jsx';

function PageAccueilConnexion() {
    const [connexionEleve, setConnexionEleve] = useState(false);
    const [connexionProf, setConnexionProf] = useState(false);
  
    const afficherConnexionEleve = () => {
        setConnexionEleve(true);
    }

    const afficherConnexionProf = () => {
        setConnexionProf(true);
    }

    if (connexionEleve==false && connexionProf==false)
    {
        return (
            <>
            <Bandeau/>
            <Poulpe/>
            <div className="boutonsConnexion">
                <button className="boutonConnexionEleve" onClick={afficherConnexionEleve}>
                    <img src="/images/eleve.png" alt="Icône représentant un élève"/>
                    <p>Connexion Élève</p>
                </button>
                <button className="boutonConnexionProf" onClick={afficherConnexionProf}>
                    <img src="/images/professeur.png" alt="Icône représentant un professeur"/>
                    <p>Connexion Professeur</p>
                </button>
            </div>
            </>
        );
    }
    else if (connexionEleve==true)
    {
        return (
            <>
            <Bandeau/>
            <Poulpe/>
            <form>
                <label htmlFor="username">Identifiant</label>
                <input type="text" id="identifiant" name="identifiant" />
                <label htmlFor="password">Mot de passe</label>
                <input type="password" id="mdp" name="mdp" />
                <button type="submit">Se connecter</button>
            </form>
            </>
        )
    }
    else (connexionProf==true)
    {
        return (
            <>
            <Bandeau/>
            <Poulpe/>
            <form>
                <label htmlFor="username">Identifiant</label>
                <input type="text" id="identifiant" name="identifiant" />
                <label htmlFor="password">Mot de passe</label>
                <input type="password" id="mdp" name="mdp" />
                <button type="submit">Se connecter</button>
            </form>
            </>
        )
    }
}

export default PageAccueilConnexion;