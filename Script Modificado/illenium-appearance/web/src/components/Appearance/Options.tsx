import { useState, useRef, useEffect, ReactElement, useCallback, ReactNode } from 'react';
import styled, { css } from 'styled-components';
import {
  FaVideo,
  FaStreetView,
  FaUndo,
  FaRedo,
  FaSmile,
  FaMale,
  FaShoePrints,
  FaSave,
  FaTimes,
  FaTshirt,
  FaHatCowboy,
  FaSocks,
} from 'react-icons/fa';
import { GiClothes } from 'react-icons/gi';

import { CameraState, ClothesState } from './interfaces';

interface ToggleButtonProps {
  active: boolean;
}

interface ToggleOptionProps {
  active: boolean;
  onClick: () => void;
  children?: ReactNode;
}

interface ExtendendContainerProps {
  width: number;
}

interface ExtendendOptionProps {
  icon: ReactElement;
  children?: ReactNode;
}


const Container = styled.div`
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  z-index: 200;
  pointer-events: auto;
  position: absolute;
  bottom: -20px; /* Lowered as requested */
  left: 1px;
  width: max-content;
`;

const ToggleButton = styled.button<ToggleButtonProps>`
  height: 48px;
  width: 48px;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: var(--radius-sub);
  transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
  background: ${props => (props.active ? 'var(--grad-orange)' : 'var(--grad-petrol)')};
  color: ${props => (props.active ? '#000' : '#fff')};
  cursor: pointer;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px ${props => props.active ? 'var(--orange-glow)' : 'rgba(0,0,0,0.6)'};
    filter: brightness(1.2);
  }

  &:active {
    transform: translateY(1px);
    transform: scale(0.95);
  }
`;

const ExtendedContainer = styled.div<ExtendendContainerProps>`
  height: 52px;
  display: flex;
  flex-direction: row; /* Expand to the right */
  align-items: center;
  justify-content: flex-start;
  width: ${({ width }) => `${width + 52}px`};
  transition: width 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  overflow: hidden;
  background: var(--grad-main);
  border: 1px solid var(--border-favro);
  border-radius: var(--radius-sub);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.6);
  position: relative;
`;

const ExtendedIcon = styled.div`
  height: 52px;
  width: 52px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  color: var(--orange-favro);
  font-size: 1.6rem;
  z-index: 1;
  background: var(--grad-petrol);
  border-left: 1px solid rgba(255,136,0,0.3);
`;

const ExtendedChildren = styled.div`
  display: flex;
  align-items: center;
  justify-content: flex-start;
  padding: 0 15px;
  gap: 12px;
  z-index: 1;
`;

const ToggleOption: React.FC<ToggleOptionProps> = ({ children, active, onClick }) => {
  return (
    <ToggleButton type="button" active={active} onClick={onClick}>
      {children}
    </ToggleButton>
  );
};

const ExtendedOption: React.FC<ExtendendOptionProps> = ({ children, icon }) => {
  const [extended, setExtended] = useState(false);
  const [width, setWidth] = useState(0);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (ref.current) {
      setWidth(ref.current.offsetWidth);
    }
  }, [ref]);

  const toggleExtended = useCallback(() => {
    setExtended(prev => !prev);
  }, []);

  return (
    <ExtendedContainer width={extended ? width : 0} onClick={toggleExtended}>
      <ExtendedIcon>{icon}</ExtendedIcon>
      <ExtendedChildren ref={ref} onClick={(e) => e.stopPropagation()}>
        {children}
      </ExtendedChildren>
    </ExtendedContainer>
  );
};

interface OptionsProps {
  clothes: ClothesState;
  handleSetClothes: (key: keyof ClothesState) => void;
}

const Options = ({
  clothes,
  handleSetClothes,
}: OptionsProps) => {
  return (
    <Container onMouseDown={(e) => e.stopPropagation()} onWheel={(e) => e.stopPropagation()}>
      <ExtendedOption icon={<GiClothes size={24} />}>
        <ToggleOption active={clothes.head} onClick={() => handleSetClothes('head')}>
          <FaHatCowboy size={20} />
        </ToggleOption>
        <ToggleOption active={clothes.body} onClick={() => handleSetClothes('body')}>
          <FaTshirt size={20} />
        </ToggleOption>
        <ToggleOption active={clothes.bottom} onClick={() => handleSetClothes('bottom')}>
          <FaSocks size={20} />
        </ToggleOption>
      </ExtendedOption>
    </Container>
  );
};


export default Options;
