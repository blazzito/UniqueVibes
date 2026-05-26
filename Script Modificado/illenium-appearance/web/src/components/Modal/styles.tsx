import styled, { keyframes } from 'styled-components';

export const Overlay = styled.div`
  width: 100vw;
  height: 100vh;
  position: fixed;
  left: 0;
  top: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.75);
  z-index: 1000;
  user-select: none;
`;

export const ModalCard = styled.div`
  width: 450px;
  background: var(--grad-main);
  border: 1px solid var(--border-favro);
  border-radius: var(--radius-main);
  padding: 40px;
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.8), inset 0 0 1px rgba(255, 255, 255, 0.1);
`;

export const Title = styled.h1`
  font-family: var(--font-bebas);
  font-size: 3rem;
  color: #fff;
  margin: 0;
  text-transform: uppercase;
  letter-spacing: 4px;
  line-height: 1;
  text-align: center;
  text-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
  background: var(--grad-orange);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
`;

export const Description = styled.p`
  font-family: var(--font-inter);
  font-size: 1rem;
  color: var(--text-dim);
  margin: 25px 0 35px;
  text-align: center;
  font-weight: 500;
  line-height: 1.6;
  max-width: 90%;
`;

export const ButtonsContainer = styled.div`
  display: flex;
  gap: 20px;
  width: 100%;
`;

export const ModalButton = styled.button<{ variant: 'accept' | 'decline' }>`
  flex: 1;
  padding: 15px 0;
  font-family: var(--font-bebas);
  font-size: 1.5rem;
  text-transform: uppercase;
  letter-spacing: 2px;
  border: 1px solid rgba(0, 0, 0, 0.3);
  border-radius: var(--radius-sub);
  cursor: pointer;
  background: ${props => (props.variant === 'accept' ? 'var(--grad-orange)' : 'var(--grad-petrol)')};
  color: ${props => (props.variant === 'accept' ? '#000' : '#fff')};
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
  transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  font-weight: 900;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px ${props => props.variant === 'accept' ? 'var(--orange-glow)' : 'rgba(0,0,0,0.6)'};
    filter: brightness(1.2);
  }

  &:active {
    transform: translateY(1px) scale(0.98);
  }
`;

export const PaintDrip = styled.div`
  display: none;
`;
