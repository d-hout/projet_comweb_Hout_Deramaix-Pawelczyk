import { useState } from 'react';
import Bandeau from './Bandeau.jsx';
import Poulpe from './Poulpe.jsx';
import PageFormulaireEleve from './PageFormulaireEleve.jsx';
import PageFormulaireProf from './PageFormulaireProf.jsx';

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
    else if (connexionEleve==true)
    {
        return (
            <PageFormulaireEleve/>
        )
    }
    else (connexionProf==true)
    {
        return (
            <PageFormulaireProf/>
        )
    }
}

export default PageAccueilConnexion;