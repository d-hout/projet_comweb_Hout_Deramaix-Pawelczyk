import { useState } from 'react';

function PageAccueilConnexion(){
    function BoutonChoixConnexion() {
        const [count, setCount] = useState(0);
        // Fonction de gestion du clic
        const ClickBouton = () => {};
    
        return (
            <button
                className="boutonConnexionEleve"
                onClick={ClickBouton}
            >
                Connexion Élève
            </button>
        );
    }
    return (
        <BoutonChoixConnexion/>
    );
}

export default PageAccueilConnexion;



