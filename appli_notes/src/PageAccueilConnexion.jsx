import { useState } from 'react';

function PageAccueilConnexion(){
    function BoutonChoixConnexion() {
        const [count, setCount] = useState(0);
        // Fonction de gestion du clic
        const ClickBouton = () => {};
    
        return (
            <div>
                <button
                    className="boutonConnexionEleve"
                    onClick={ClickBouton}
                    style={{ color: 'white' }}
                >
                    Connexion Élève
                </button>

                <button
                    className="boutonConnexionProf"
                    onClick={ClickBouton}
                    style={{ color: 'white' }}
                >
                    Connexion Professeur
                </button>
            </div>
        );
    }
    return (
        <div>
            <Bandeau/>
            <BoutonChoixConnexion/>
        </div>
    );
}

export default PageAccueilConnexion;



