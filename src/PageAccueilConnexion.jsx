import { useState } from 'react';
import Bandeau from './Bandeau.jsx';
import Poulpe from './Poulpe.jsx';
import PageFormulaireEleve from './PageFormulaireEleve.jsx';
import PageFormulaireProf from './PageFormulaireProf.jsx';

function PageAccueilConnexion() {
    const [connexionEleve, setConnexionEleve] = useState(false);
    const [connexionProf, setConnexionProf] = useState(false);

    // Fonction déclenchée au clic sur le bouton "Élève"
    const afficherConnexionEleve = () => {
        setConnexionEleve(true);
    }

    // Fonction déclenchée au clic sur le bouton "Professeur"
    const afficherConnexionProf = () => {
        setConnexionProf(true);
    }

    if (connexionEleve==false && connexionProf==false)
    {
        return (
            <>
            <Bandeau/>
            <Poulpe/>
            
            {/* Boutons de connexion */}
            <div className="boutonsConnexion">
                <button onClick={afficherConnexionEleve}>
                    <img src="/images/eleve.png" alt="Icône représentant un élève"/>
                    <p>Connexion Élève</p>
                </button>
                <button onClick={afficherConnexionProf}>
                    <img src="/images/professeur.png" alt="Icône représentant un professeur"/>
                    <p>Connexion Professeur</p>
                </button>
            </div>
            </>
        );
    }

    // Si l'utilisateur a cliqué sur "Connexion Élève", on affiche le formulaire élève
    else if (connexionEleve==true)
    {
        return (
            <PageFormulaireEleve/>
        )
    }
    // Sinon, s’il a cliqué sur "Connexion Prof", on affiche le formulaire professeur
    else (connexionProf==true)
    {
        return (
            <PageFormulaireProf/>
        )
    }
}

export default PageAccueilConnexion;
