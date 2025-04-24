import { useState } from 'react';
import iconeEleve from '../../../Image/icone élève 100px.png';
import iconeProf from '../../../Image/icone prof 100px.png';

function PageAccueilConnexion(){
    function BoutonChoixConnexion() {
        const [count, setCount] = useState(0);
        // Fonction de gestion du clic
        const ClickBouton = () => {};
    
        return (
            <div style={{
                display: 'flex',
                justifyContent: 'center', // centre les boutons horizontalement
                gap: '40px',              // espace entre les deux
                marginTop: '20px'         // espace au-dessus si tu veux
              }}>
                <button
                    className="boutonConnexionEleve"
                    onClick={ClickBouton}
                    style={{ 
                        color: 'white',
                        width: '180px',
                        height: '180px',
                     }}

                >
                    <img src={iconeEleve} alt="Icone représentant un élève"/>
                    <p class="boutonConnexion">Connexion Élève</p>
                </button>

                <button
                    className="boutonConnexionProf"
                    onClick={ClickBouton}
                    style={{ 
                        color: 'white',
                        width: '180px',
                        height: '180px',
                     }}
                >
                    <img src={iconeProf} alt="Icone représentant un professeur"/>
                    <p class="boutonConnexion">Connexion Professeur</p>
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



