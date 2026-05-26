import styled, { css, createGlobalStyle, keyframes } from 'styled-components';

export const GlobalStyle = createGlobalStyle`
  :root {
    --font-bebas: 'Bebas Neue', sans-serif;
    --font-inter: 'Inter', sans-serif;
  }
`;

export const Wrapper = styled.div`
  height: 100vh;
  width: 100vw;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: flex-start;
  padding-left: 80px;
  gap: 30px;
  overflow: hidden;
`;

export const ContainerInner = styled.div`
  display: flex;
  flex-direction: row;
  align-items: flex-start;
  justify-content: center;
  gap: 25px;
  width: auto;
  max-width: 95vw;
`;

export const Container = styled.div`
  height: 800px;
  max-height: 85vh;
  width: 450px;
  display: flex;
  flex-direction: column;
  background: var(--grad-main);
  border: 1px solid var(--border-favro);
  border-radius: var(--radius-main);
  box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6);
  position: relative;
  overflow: hidden;
  padding: 0;

  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
  }
`;

export const PaintDrip = styled.div`
  display: none; /* Removed for Favro aesthetic */
`;

export const SideColumn = styled.div`
  display: flex;
  flex-direction: column;
  height: 800px;
  max-height: 85vh;
  width: 54px;
  align-items: center;
  position: relative;
`;

export const TabsContainer = styled.div`
  display: flex;
  flex-direction: column;
  gap: 12px;
  width: auto;
  margin-top: 105px; /* Aligned with mirror */
  z-index: 100;
`;

export const MenuWrapper = styled.div`
  display: flex;
  flex-direction: column;
  gap: 20px;
  width: 450px;
  align-items: flex-start;
  position: relative;
`;

export const ActionContainer = styled.div`
  display: flex;
  flex-direction: row;
  gap: 15px;
  width: 100%;
`;

export const ActionButton = styled.button<{ variant: 'save' | 'cancel' }>`
  flex: 1;
  background: ${props => (props.variant === 'save' ? 'var(--grad-orange)' : 'rgba(255, 255, 255, 0.05)')};
  color: ${props => (props.variant === 'save' ? '#000' : '#fff')};
  border: 1px solid ${props => props.variant === 'save' ? 'transparent' : 'rgba(255, 255, 255, 0.1)'};
  border-radius: var(--radius-sub);
  padding: 14px 0;
  font-family: var(--font-bebas);
  font-size: 1.6rem;
  letter-spacing: 1px;
  text-transform: uppercase;
  transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
  font-weight: 500;
  position: relative;
  overflow: hidden;

  &::after {
    content: "";
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: 0.5s;
  }

  &:hover {
    transform: translateY(-2px);
    background: ${props => props.variant === 'save' ? 'var(--grad-orange)' : 'rgba(255, 255, 255, 0.08)'};
    box-shadow: 0 8px 20px ${props => props.variant === 'save' ? 'var(--orange-glow)' : 'rgba(0,0,0,0.4)'};
    
    &::after {
      left: 100%;
    }
  }

  &:active {
    transform: translateY(0);
  }
`;

export const CameraContainer = styled.div`
  display: flex;
  width: 100%;
  background: var(--grad-petrol);
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: var(--radius-sub);
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
  overflow: hidden;
  margin-bottom: 5px;
`;

export const CameraButton = styled.button<{ active: boolean }>`
  flex: 1;
  background: ${props => (props.active ? 'var(--orange-favro)' : 'transparent')};
  color: ${props => (props.active ? '#000' : '#fff')};
  padding: 12px;
  font-family: var(--font-bebas);
  font-size: 1.2rem;
  text-transform: uppercase;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  border: none;
  border-right: ${props => props.active ? 'none' : '1px solid #222'};
  transition: all 0.1s ease;

  &:last-child {
    border-right: none;
  }

  &:hover {
    background: ${props => props.active ? 'var(--orange-favro)' : 'rgba(255,119,0,0.1)'};
  }
`;

export const TabButton = styled.button<{ active: boolean }>`
  width: 54px;
  height: 54px;
  background: ${props => (props.active ? 'var(--grad-orange)' : 'rgba(255, 255, 255, 0.03)')};
  color: ${props => (props.active ? '#000' : '#fff')};
  border: 1px solid ${props => props.active ? 'transparent' : 'rgba(255, 255, 255, 0.05)'};
  border-radius: var(--radius-sub);
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  box-shadow: ${props => props.active ? '0 8px 20px var(--orange-glow)' : 'none'};
  position: relative;

  .icon {
    font-size: 1.5rem;
    transition: transform 0.3s ease;
  }

  &:hover {
    transform: translateX(5px);
    color: ${props => props.active ? '#000' : 'var(--orange-favro)'};
    background: ${props => props.active ? 'var(--grad-orange)' : 'rgba(255, 255, 255, 0.08)'};
    
    .icon {
      transform: scale(1.1);
    }
  }

  &::before {
    content: "";
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 3px;
    height: 0;
    background: var(--orange-favro);
    transition: height 0.3s ease;
    border-radius: 0 2px 2px 0;
  }

  &:hover::before {
    height: 40%;
  }

  ${props => props.active && `
    &::before {
      height: 60%;
    }
  `}
`;

export const ScrollContainer = styled.div`
  flex: 1;
  width: 100%;
  overflow-y: auto;
  padding: 20px;

  &::-webkit-scrollbar {
    width: 6px;
  }
`;

export const Header = styled.div<{ active: boolean }>`
  width: 100%;
  padding: 20px 25px;
  background: rgba(0, 0, 0, 0.2);
  border-bottom: 2px solid var(--orange-favro);
  margin-bottom: 20px;
  display: flex;
  align-items: center;
  position: relative;

  /* Signature Corner Fold */
  &::before {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    width: 25px;
    height: 25px;
    background: linear-gradient(225deg, var(--orange-favro) 50%, transparent 50%);
    z-index: 10;
  }

  span {
    font-family: var(--font-bebas);
    font-size: 2.4rem;
    color: #fff;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-weight: 500;
    text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
  }
`;

export const SubTabsContainer = styled.div`
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-bottom: 25px;
  width: 100%;
  padding: 10px;
  background: rgba(0,0,0,0.3);
  border: 1px solid rgba(255,255,255,0.05);
  border-radius: var(--radius-sub);
  box-shadow: inset 0 0 10px rgba(0,0,0,0.5);
`;

export const SubTabButton = styled.button<{ active: boolean }>`
  background: ${props => (props.active ? 'var(--orange-favro)' : '#222')};
  color: ${props => (props.active ? '#000' : '#fff')};
  border: 2px solid #000;
  padding: 6px 15px;
  font-family: var(--font-bebas);
  font-size: 1.1rem;
  text-transform: uppercase;
  font-weight: 900;
  transition: all 0.1s ease;

  &:hover {
    background: ${props => props.active ? 'var(--orange-favro)' : '#333'};
  }
`;

export const TripleContent = styled.div`
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  align-items: center;
  gap: 15px;
  width: 100%;
`;

export const Column = styled.div`
  display: flex;
  flex-direction: column;
  gap: 8px;
`;

export const Label = styled.span`
  font-family: var(--font-inter);
  font-size: 0.8rem;
  font-weight: 900;
  color: var(--orange-favro);
  text-transform: uppercase;
  text-align: center;
`;

export const IconContainer = styled.div`
  height: 64px;
  width: 64px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: transparent;
  color: #fff;
  font-size: 2.5rem;
  position: relative;
`;

export const FlexWrapper = styled.div`
  display: flex;
  flex-direction: column;
  gap: 10px;
  width: 100%;
`;

export const RotationHint = styled.div`
  position: absolute;
  bottom: 8%; /* Positioned at the bottom */
  left: 50%;
  transform: translateX(-50%);
  z-index: 200;
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 15px;
  height: 52px;
  padding: 0 25px;
  background: rgba(0, 0, 0, 0.6); /* Slightly darker for better visibility */
  border: 1px solid var(--border-favro);
  border-radius: var(--radius-main);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  pointer-events: none; /* Let clicks pass through */

  img {
    width: 42px; /* Larger icon */
    height: 42px;
    filter: invert(61%) sepia(87%) saturate(3475%) hue-rotate(1deg) brightness(110%) contrast(110%);
    animation: pulse 2s infinite;
  }

  span {
    font-family: var(--font-bebas); /* Changed to Bebas for more impact */
    font-size: 1.2rem;
    font-weight: 500;
    color: var(--orange-favro);
    letter-spacing: 2px;
    text-transform: uppercase;
    white-space: nowrap;
    text-shadow: 0 0 15px rgba(255, 136, 0, 0.4);
  }
`;
