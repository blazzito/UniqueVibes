import React from 'react';
import {
    ZoneHUDContainer,
    ZoneHUDItem
} from './Admin.styles';

interface ZoneHUDProps {
    pointsCount: number;
}

const ZoneHUD: React.FC<ZoneHUDProps> = ({ pointsCount }) => {
    return (
        <ZoneHUDContainer>
            <ZoneHUDItem>
                <div className="key-cap">F</div>
                <span className="label">Añadir Punto</span>
                {pointsCount > 0 && <span className="count">{pointsCount}</span>}
            </ZoneHUDItem>

            <ZoneHUDItem>
                <div className="key-cap">X</div>
                <span className="label">Deshacer</span>
            </ZoneHUDItem>

            <ZoneHUDItem>
                <div className="key-cap">↑/↓</div>
                <span className="label">Altura</span>
            </ZoneHUDItem>

            <ZoneHUDItem>
                <div className="key-cap">G</div>
                <span className="label">Preview</span>
            </ZoneHUDItem>

             <ZoneHUDItem>
                <div className="key-cap" style={{ background: 'var(--color-orange)' }}>ENTER</div>
                <span className="label">Guardar</span>
            </ZoneHUDItem>
        </ZoneHUDContainer>
    );
};

export default ZoneHUD;
