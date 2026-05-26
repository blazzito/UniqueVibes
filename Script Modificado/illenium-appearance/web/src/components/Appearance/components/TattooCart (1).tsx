import styled from 'styled-components';
import { FaTrash, FaTimes } from 'react-icons/fa';
import { useNuiState } from '../../../hooks/nuiState';
import { Tattoo, TattooList } from '../interfaces';

interface TattooCartProps {
  data: TattooList;
  handleDeleteTattoo: (value: Tattoo) => void;
  handleBuy: () => void;
}

const CartContainer = styled.div`
  position: fixed;
  bottom: 40px;
  right: 40px;
  width: 320px;
  height: auto;
  max-height: 500px;
  background: var(--grad-main);
  border: 1px solid var(--border-favro);
  border-radius: var(--radius-main);
  box-shadow: 0 15px 40px rgba(0, 0, 0, 0.8);
  display: flex;
  flex-direction: column;
  overflow: hidden;
  z-index: 1000;
`;

const Header = styled.div`
  padding: 18px;
  background: var(--grad-petrol);
  border-bottom: 2px solid var(--orange-favro);
  display: flex;
  align-items: center;
  justify-content: space-between;
  z-index: 1;
  position: relative;
  
  span {
    font-family: var(--font-bebas);
    font-size: 1.8rem;
    color: #fff;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-weight: 900;
    text-shadow: 0 0 10px var(--orange-glow);
  }

  svg {
    color: var(--orange-favro);
    font-size: 1.4rem;
  }
`;

const Content = styled.div`
  flex: 1;
  overflow-y: auto;
  padding: 15px;
  display: flex;
  flex-direction: column;
  gap: 12px;
  z-index: 1;

  &::-webkit-scrollbar {
    width: 6px;
  }
  &::-webkit-scrollbar-track {
    background: #000;
  }
  &::-webkit-scrollbar-thumb {
    background: var(--orange-favro);
  }
`;

const CartItem = styled.div`
  background: rgba(0, 18, 27, 0.4);
  border: 1px solid rgba(255,255,255,0.05);
  border-radius: var(--radius-sub);
  padding: 12px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  transition: all 0.2s ease;
  box-shadow: 0 4px 10px rgba(0,0,0,0.3);

  &:hover {
    background: rgba(0, 29, 43, 0.6);
    border-color: rgba(255, 136, 0, 0.3);
    transform: translateY(-1px);
    box-shadow: 0 6px 12px rgba(0,0,0,0.4);
  }
`;

const ItemInfo = styled.div`
  display: flex;
  flex-direction: column;
  gap: 2px;

  .label {
    font-family: var(--font-bebas);
    font-size: 1.2rem;
    color: #fff;
    letter-spacing: 1px;
    font-weight: 900;
  }

  .zone {
    font-family: var(--font-inter);
    font-size: 0.75rem;
    color: var(--orange-favro);
    text-transform: uppercase;
    font-weight: 900;
  }
`;

const DeleteButton = styled.button`
  background: rgba(0, 18, 27, 0.6);
  color: #fff;
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: var(--radius-sub);
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.2s ease;
  box-shadow: 0 2px 5px rgba(0,0,0,0.3);

  &:hover {
    background: rgba(231, 76, 60, 0.8);
    transform: translateY(-1px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.4);
  }
`;

const Footer = styled.div`
  padding: 15px;
  background: #111;
  border-top: 4px solid #000;
  z-index: 1;
`;

const BuyButton = styled.button`
  width: 100%;
  background: var(--grad-orange);
  color: #000;
  border: 1px solid rgba(0,0,0,0.3);
  border-radius: var(--radius-sub);
  padding: 15px;
  font-family: var(--font-bebas);
  font-size: 1.8rem;
  text-transform: uppercase;
  letter-spacing: 2px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  cursor: pointer;
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
  transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
  font-weight: 900;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px var(--orange-glow);
    filter: brightness(1.1);
  }

  &:active {
    transform: translateY(1px);
  }
`;

const TattooCart = ({ data, handleDeleteTattoo, handleBuy }: TattooCartProps) => {
  const { locales } = useNuiState();
  const appliedTattoos: Tattoo[] = [];

  Object.values(data).forEach((zoneTattoos) => {
    if (Array.isArray(zoneTattoos)) {
      zoneTattoos.forEach((t) => appliedTattoos.push(t));
    }
  });

  if (!locales) return null;

  return (
    <CartContainer>
      <Header>
        <span>Carrito ({appliedTattoos.length})</span>
        <FaTrash />
      </Header>

      <Content>
        {appliedTattoos.length === 0 ? (
          <div style={{ padding: 20, textAlign: 'center', opacity: 0.5, fontFamily: 'var(--font-montserrat)', color: '#fff' }}>
            No hay tatuajes seleccionados
          </div>
        ) : (
          appliedTattoos.map((tattoo, index) => (
            <CartItem key={`${tattoo.name}-${index}`}>
              <ItemInfo>
                <span className="label">{tattoo.label}</span>
                <span className="zone">{tattoo.zone}</span>
              </ItemInfo>
              <DeleteButton onClick={() => handleDeleteTattoo(tattoo)}>
                <FaTimes />
              </DeleteButton>
            </CartItem>
          ))
        )}
      </Content>

      <Footer>
        <BuyButton onClick={handleBuy}>
          COMPRAR
        </BuyButton>
      </Footer>
    </CartContainer>
  );
};

export default TattooCart;
