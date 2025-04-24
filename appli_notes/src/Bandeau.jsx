import { useState } from 'react';

function Bandeau() {
    return (
        <div style={{
            position: 'absolute',
            top: 0,
            left: 0,
            right: 0,
            display: 'flex',
            justifyContent: 'center',
            alignItems: 'center',
            height: '160px',
            boxShadow: '0 4px 6px rgba(0, 0, 0, 0.1)',
            zIndex: 10
        }}>
            <img
                src="/images/logoo.png"
                alt="Logo Not'ENSC"
                style={{
                    height: '100%',
                    objectFit: 'contain'
                }}
            />
        </div>
    );
}

export default Bandeau;
