import { useCallback, useEffect, useState } from 'react';
import styled from 'styled-components';
import { FaChevronLeft, FaChevronRight } from 'react-icons/fa';
import { useNuiState } from '../../../hooks/nuiState';
import { Tattoo, TattoosSettings } from '../interfaces';
import RangeInput from './RangeInput';

interface SelectTattooProps {
  items: Tattoo[];
  tattoosApplied: Tattoo[] | null;
  handleApplyTattoo: (value: Tattoo, opacity: number) => void;
  handlePreviewTattoo: (value: Tattoo, opacity: number) => void;
  handleDeleteTattoo: (value: Tattoo) => void;
  settings: TattoosSettings;
}

const Container = styled.div`
  width: 100%;
  display: flex;
  flex-direction: column;
  gap: 15px;
`;

const CartItem = styled.div`
  background: #00121b;
  border: 2px solid var(--border-favro);
  padding: 12px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  transition: all 0.1s ease;
  box-shadow: 0 4px 6px rgba(0,0,0,0.3);

  &:hover {
    background: #001d2b;
  }
`;

const CartContainer = styled.div`
  position: fixed;
  bottom: 40px;
  right: 40px;
  width: 320px;
  height: auto;
  max-height: 500px;
  background: var(--bg-favro);
  border: 2px solid var(--border-favro);
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
  display: flex;
  flex-direction: column;
  overflow: hidden;
  z-index: 1000;
`;

const SelectorWrapper = styled.div`
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: rgba(0, 0, 0, 0.4);
  border: 1px solid var(--border-favro);
  border-radius: var(--radius-sub);
  padding: 8px;
  gap: 10px;
  box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.5);
`;

const NavButton = styled.button`
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--grad-petrol);
  color: var(--orange-favro);
  border: 1px solid rgba(255,255,255,0.05);
  border-radius: var(--radius-sub);
  cursor: pointer;
  transition: all 0.2s ease;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);

  &:hover {
    background: #ff8800;
    box-shadow: 0 0 8px rgba(255, 136, 0, 0.7); /* Enhanced glow on hover */
  }

  &:active {
    transform: scale(0.9);
  }

  svg {
    font-size: 1.2rem;
    color: #fff;
  }
`;

const LabelDisplay = styled.div`
  flex: 1;
  text-align: center;
  font-family: var(--font-inter);
  font-weight: 900;
  color: #fff;
  font-size: 1rem;
  text-transform: uppercase;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
`;

const CountDisplay = styled.div`
  font-family: var(--font-bebas);
  font-size: 1.4rem;
  color: var(--orange-favro);
  text-align: center;
  margin-bottom: 5px;
  letter-spacing: 2px;
  font-weight: 900;
`;

const ActionButton = styled.button<{ isApplied: boolean }>`
  width: 100%;
  padding: 15px;
  background: ${props => props.isApplied ? 'var(--grad-petrol)' : 'var(--grad-orange)'};
  color: ${props => props.isApplied ? '#fff' : '#000'};
  border: 1px solid rgba(0,0,0,0.3);
  border-radius: var(--radius-sub);
  font-family: var(--font-bebas);
  font-size: 1.6rem;
  letter-spacing: 2px;
  cursor: pointer;
  margin-top: 15px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
  text-transform: uppercase;
  font-weight: 900;
  transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 20px ${props => props.isApplied ? 'rgba(0,0,0,0.6)' : 'var(--orange-glow)'};
    filter: brightness(1.1);
  }

  &:active {
    transform: translateY(1px);
  }
`;

const BuyButton = styled.button`
  width: 100%;
  background: var(--orange-favro);
  color: #000;
  border: 2px solid #000;
  padding: 12px;
  font-family: var(--font-bebas);
  font-size: 1.8rem;
  text-transform: uppercase;
  letter-spacing: 2px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  cursor: pointer;
  box-shadow: 0 4px 0px #000;
  transition: all 0.1s ease;
  font-weight: 900;

  &:hover {
    background: var(--yellow-favro);
    transform: translateY(-2px);
    box-shadow: 0 6px 0px #000;
  }

  &:active {
    transform: translateY(2px);
    box-shadow: 0 2px 0px #000;
  }
`;

const SelectTattoo = ({
  items,
  tattoosApplied,
  handleApplyTattoo,
  handlePreviewTattoo,
  handleDeleteTattoo,
  settings
}: SelectTattooProps) => {
  const defaultOpacity = 0.75;
  const [currentIndex, setCurrentIndex] = useState(0);
  const [opacity, setOpacity] = useState<number>(defaultOpacity);
  const { locales } = useNuiState();

  const currentTattoo = items[currentIndex];

  const clientOpacity = useCallback(() => {
    if (!tattoosApplied) return defaultOpacity;
    const { name } = currentTattoo;
    for (let i = 0; i < tattoosApplied.length; i++) {
      if (tattoosApplied[i].name === name) {
        return tattoosApplied[i].opacity ?? defaultOpacity;
      }
    }
    return defaultOpacity;
  }, [currentTattoo, tattoosApplied])();

  // Reset internal opacity state when tattoo changes or applied tattoos update
  useEffect(() => {
    setOpacity(clientOpacity);
  }, [clientOpacity]);

  const handleNext = () => {
    const nextIndex = (currentIndex + 1) % items.length;
    setCurrentIndex(nextIndex);
    handlePreviewTattoo(items[nextIndex], opacity);
    // Auto-apply logic could be here if desired, otherwise just preview
    // For now, based on user request "apply automatically", we can try triggering apply
    // But usually preview first is safer. Let's stick to preview on change, explicit apply via button OR distinct interaction
    // User said: "al darle comprar se aplican en autromatico" -> wait, user wants a "buy" button? 
    // "al poner uno quiero algo como tener eso de la opacidad y la seleccion del tatto sea como lo de la ropa que le doy a los lados tener boton de aplicar"
    // AND THEN "sale en bes de tener el boton de aplicar y remover al darle comprar se aplican en autromatico"
    // I will implement auto-preview and an explicit "add" button logic is replaced by just using the cart.
    // Actually, "Add to Cart" concept means we need a button to "Apply/Add".
    // User said "al darle comprar se aplican en automatico" (when clicking buy/add). 
    // BUT also "que le doy a los lados tener boton de aplicar o quitar".
    // Let's make it so: Arrows change preview. A clear "Apply/Add" button adds to cart.

    // Correction: User said "al darle comprar se aplican en autromatico" might refer to payment.
    // Let's implement auto-preview on arrow change. 
    // And an "Add" button that is easy to reach.
    // Actually simplicity: Arrows -> Preview. Click center/or separate button to Add.

    // Re-reading: "que sea como una chopalgo como esto no se que salga en bes de tener el boton de aplicar y remover al darle comprar se aplican en autromatico"
    // "shop-like something... instead of apply/remove button, when clicking buy it applies automatically"
    // I'll interpret this as: arrow keys navigate preview. "Add" button puts it in cart (applies it).
  };

  const handlePrev = () => {
    const prevIndex = (currentIndex - 1 + items.length) % items.length;
    setCurrentIndex(prevIndex);
    handlePreviewTattoo(items[prevIndex], opacity);
  };

  const onOpacityChange = (val: number) => {
    setOpacity(val);
    handlePreviewTattoo(currentTattoo, val);
  };

  const isApplied = tattoosApplied?.some(t => t.name === currentTattoo.name);

  // Auto-apply/preview logic: 
  // User wants "Apply" to be seamless. 
  // Let's keep a button "Add to Cart" or "Apply".
  // Or if we want true "clothing style", maybe just browsing applies it? No, clothing toggles.
  // Best approach: Arrows preview. Button "Add" to confirm.

  const toggleTattoo = () => {
    if (isApplied) {
      handleDeleteTattoo(currentTattoo);
    } else {
      handleApplyTattoo(currentTattoo, opacity);
    }
  };

  if (!locales) return null;

  return (
    <Container>
      <CountDisplay>
        TATTOO {currentIndex + 1} / {items.length}
      </CountDisplay>

      <SelectorWrapper>
        <NavButton onClick={handlePrev}><FaChevronLeft /></NavButton>
        <LabelDisplay>{currentTattoo.label}</LabelDisplay>
        <NavButton onClick={handleNext}><FaChevronRight /></NavButton>
      </SelectorWrapper>

      <RangeInput
        title={locales.tattoos.opacity}
        min={settings.opacity.min}
        max={settings.opacity.max}
        factor={settings.opacity.factor}
        defaultValue={opacity}
        clientValue={clientOpacity}
        onChange={onOpacityChange}
      />

      <ActionButton
        isApplied={isApplied || false}
        onClick={toggleTattoo}
      >
        {isApplied ? locales.tattoos.delete : (locales.tattoos.apply || "COMPRAR")}
      </ActionButton>

    </Container>
  );
};

export default SelectTattoo;
