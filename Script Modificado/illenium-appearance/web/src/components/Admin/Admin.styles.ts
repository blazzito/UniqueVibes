import styled, { css } from 'styled-components';

export const FullScreenContainer = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: radial-gradient(circle at 50% -20%, rgba(255, 107, 0, 0.08) 0%, rgba(10, 12, 16, 0.95) 60%);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px;
  z-index: 1000;
  font-family: var(--font-inter);
  
  /* Noise / grid overlay pattern */
  &::after {
    content: '';
    position: absolute;
    top: 0; left: 0; width: 100%; height: 100%;
    background-image: radial-gradient(rgba(255, 255, 255, 0.03) 1px, transparent 1px);
    background-size: 24px 24px;
    z-index: -1;
    pointer-events: none;
  }
`;

export const WindowContainer = styled.div`
  width: 90vw;
  max-width: 1600px;
  height: 85vh;
  background: linear-gradient(180deg, rgba(20,24,30,1) 0%, #0a0c10 100%);
  border: 1px solid rgba(255, 107, 0, 0.3);
  border-radius: 8px; /* Sharper */
  display: flex;
  flex-direction: column;
  overflow: hidden;
  box-shadow: 0 40px 100px rgba(0, 0, 0, 0.9), inset 0 1px 0 rgba(255, 255, 255, 0.1);
  position: relative;

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, transparent, var(--color-orange), transparent);
    opacity: 1;
    box-shadow: 0 0 15px rgba(255, 107, 0, 0.5);
  }
`;

export const TopBar = styled.div`
  height: 90px;
  background: linear-gradient(180deg, rgba(255,255,255,0.03) 0%, rgba(255,255,255,0) 100%);
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
  display: flex;
  align-items: center;
  padding: 0 40px;
  gap: 30px;
  flex-shrink: 0;
`;

export const Title = styled.h1`
  font-family: var(--font-bebas);
  font-size: 2.8rem;
  background: linear-gradient(to right, #ffffff, rgba(255, 107, 0, 0.8));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  margin: 0;
  padding: 5px 0;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-weight: 500;
  position: relative;
  
  /* Corner fold accent */
  &::before {
    content: '';
    position: absolute;
    top: -5px;
    left: -15px;
    width: 15px;
    height: 15px;
    border-top: 3px solid var(--color-orange);
    border-left: 3px solid var(--color-orange);
  }
`;

export const SearchBar = styled.input`
  flex: 1;
  background: rgba(255, 255, 255, 0.02);
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-radius: var(--radius-md); /* Matching sharp aesthetic */
  color: white;
  padding: 15px 30px;
  font-size: 1rem;
  font-family: var(--font-inter);
  letter-spacing: 0.5px;
  transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  
  &:focus {
    border-color: var(--color-orange);
    background: rgba(255, 255, 255, 0.05);
    box-shadow: 0 0 20px rgba(255, 107, 0, 0.1);
    outline: none;
  }

  &::placeholder {
    color: rgba(255, 255, 255, 0.2);
  }
`;

export const ActionButton = styled.button<{ variant?: 'primary' | 'secondary' }>`
  background: ${props => props.variant === 'secondary' ? 'rgba(255, 255, 255, 0.05)' : 'linear-gradient(45deg, #FF6B00, #ff9900)'};
  color: ${props => props.variant === 'secondary' ? 'rgba(255,255,255,0.7)' : '#000'};
  border: 1px solid ${props => props.variant === 'secondary' ? 'rgba(255, 255, 255, 0.1)' : 'transparent'};
  border-radius: 4px; /* Sharp edges */
  padding: 12px 30px;
  font-family: var(--font-bebas);
  font-size: 1.2rem;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  font-weight: 600;
  transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
  box-shadow: ${props => props.variant === 'secondary' ? 'none' : '0 4px 15px rgba(255, 107, 0, 0.2)'};

  &.small {
    padding: 8px 15px;
    font-size: 1.1rem;
    border-radius: 4px;
  }

  &:hover {
    transform: translateY(-2px);
    background: ${props => props.variant === 'secondary' ? 'rgba(255, 255, 255, 0.1)' : 'linear-gradient(45deg, #ff8c00, #ffb31a)'};
    color: ${props => props.variant === 'secondary' ? '#fff' : '#000'};
    box-shadow: 0 8px 25px ${props => props.variant === 'secondary' ? 'rgba(0,0,0,0.5)' : 'rgba(255, 107, 0, 0.4)'};
  }

  &:active {
    transform: translateY(1px);
  }
`;

export const MainContent = styled.div`
  flex: 1;
  display: flex;
  overflow: hidden;
`;

export const SidebarFilter = styled.div`
  width: 250px;
  background: #080a0d; /* Ultra dark distinct zone */
  border-right: 1px solid rgba(255, 255, 255, 0.04);
  padding: 30px 20px;
  display: flex;
  flex-direction: column;
  gap: 10px;
  box-shadow: inset -10px 0 20px rgba(0,0,0,0.3);
`;

export const FilterItem = styled.div<{ active: boolean }>`
  padding: 16px 20px;
  cursor: pointer;
  font-weight: 500;
  font-family: var(--font-bebas);
  font-size: 1.25rem;
  letter-spacing: 1.5px;
  text-transform: uppercase;
  color: ${props => props.active ? '#fff' : 'rgba(255, 255, 255, 0.4)'};
  background: ${props => props.active ? 'linear-gradient(90deg, rgba(255, 107, 0, 0.15), transparent)' : 'transparent'};
  border-left: ${props => props.active ? '4px solid var(--color-orange)' : '4px solid transparent'};
  border-radius: 4px;
  transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
  display: flex;
  align-items: center;
  justify-content: space-between;

  &:hover {
    color: #fff;
    background: ${props => props.active ? 'linear-gradient(90deg, rgba(255, 107, 0, 0.2), transparent)' : 'rgba(255, 255, 255, 0.02)'};
    border-left-color: ${props => props.active ? 'var(--color-orange)' : 'rgba(255, 255, 255, 0.1)'};
    transform: translateX(3px);
  }
`;

export const GridArea = styled.div`
  flex: 1;
  padding: 40px;
  overflow-y: auto;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 30px;

  /* Custom Scrollbar */
  &::-webkit-scrollbar {
    width: 6px;
  }
  &::-webkit-scrollbar-track {
    background: transparent;
  }
  &::-webkit-scrollbar-thumb {
    background: rgba(255, 255, 255, 0.1);
    border-radius: 10px;
  }
`;

export const StoreCard = styled.div`
  background: #0f1217;
  border: 1px solid rgba(255, 255, 255, 0.05);
  border-top: 1px solid rgba(255, 255, 255, 0.12);
  border-radius: 8px; /* Sharp corners */
  display: flex;
  flex-direction: column;
  position: relative;
  height: 240px;
  transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0,0,0,0.5);

  /* Left accent line default */
  &::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background: transparent;
    transition: all 0.3s ease;
    z-index: 10;
  }

  &:hover {
    transform: translateY(-5px);
    border-color: rgba(255, 107, 0, 0.3);
    border-top-color: rgba(255, 107, 0, 0.6);
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.6), 0 0 20px rgba(255, 107, 0, 0.05);

    &::before {
        background: var(--color-orange);
        box-shadow: 2px 0 10px rgba(255, 107, 0, 0.5);
    }

    .actions {
      opacity: 1;
      transform: translateY(0);
    }
  }
`;

export const CardHeader = styled.div<{ type: string }>`
  height: 80px;
  background: repeating-linear-gradient(-45deg, rgba(0,0,0,0), rgba(0,0,0,0) 10px, rgba(255,255,255,0.01) 10px, rgba(255,255,255,0.01) 20px),
              linear-gradient(180deg, rgba(255, 107, 0, 0.05) 0%, rgba(0, 0, 0, 0.3) 100%);
  border-bottom: 1px solid rgba(255, 255, 255, 0.03);
  display: flex;
  align-items: center;
  justify-content: flex-start;
  padding: 0 25px;
  font-size: 2rem;
  color: var(--color-orange);
  position: relative;
  z-index: 2;
`;

export const CardWatermark = styled.div<{ type: string }>`
  display: none; 
`;

export const CardBody = styled.div`
  padding: 20px 25px;
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 6px;
  z-index: 1;

  h3 {
    margin: 0;
    font-family: var(--font-bebas);
    font-size: 1.5rem;
    color: #fff;
    letter-spacing: 1px;
    text-transform: uppercase;
    font-weight: 500;
  }
  
  p {
    margin: 0;
    font-size: 0.95rem;
    color: rgba(255, 255, 255, 0.5);
    font-family: var(--font-inter);
  }

  .meta-id {
      font-size: 0.75rem;
      color: rgba(255, 107, 0, 0.6);
      margin-top: auto;
      font-weight: 700;
      letter-spacing: 0.5px;
      text-transform: uppercase;
  }
`;

export const CardActions = styled.div`
  position: absolute;
  top: 15px;
  right: 15px;
  display: flex;
  gap: 8px;
  z-index: 5;
  opacity: 0;
  transform: translateX(10px);
  transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
`;

export const ModalOverlay = styled.div`
  position: fixed;
  top: 0; 
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0,0,0,0.8);
  z-index: 2000;
  display: flex;
  justify-content: center;
  align-items: center;
`;

export const ModalContent = styled.div`
  width: 580px;
  background: #0b0d11; /* Ultra dark */
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-top: 1px solid rgba(255, 107, 0, 0.8); /* Strong top accent */
  border-radius: 6px;
  box-shadow: 0 40px 100px rgba(0,0,0,0.95), 0 -2px 30px rgba(255, 107, 0, 0.1);
  padding: 40px;
  display: flex;
  flex-direction: column;
  gap: 25px;
  position: relative;
  overflow: hidden;

  /* Grid overlay in modal */
  &::before {
    content: '';
    position: absolute;
    top: 0; left: 0; width: 100%; height: 100%;
    background-image: radial-gradient(rgba(255, 255, 255, 0.02) 1px, transparent 1px);
    background-size: 16px 16px;
    z-index: 0;
    pointer-events: none;
  }

  > * {
    z-index: 1; /* Keep content above grid */
  }

  h2 {
    font-family: var(--font-bebas);
    font-size: 2.5rem;
    margin: 0;
    color: #fff;
    text-transform: uppercase;
    border-bottom: 1px dashed rgba(255, 255, 255, 0.1);
    padding-bottom: 20px;
    letter-spacing: 2px;
    
    /* Small orange square dot next to title */
    &::before {
      content: '';
      display: inline-block;
      width: 12px;
      height: 12px;
      background: var(--color-orange);
      margin-right: 15px;
      transform: translateY(-4px);
      box-shadow: 0 0 10px rgba(255, 107, 0, 0.5);
    }
  }
`;

export const ModalRow = styled.div`
  display: flex;
  gap: 20px;
  width: 100%;
`;

export const ModalGroup = styled.div<{ flex?: number }>`
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex: ${props => props.flex || 1};
`;

export const ModalLabel = styled.label`
  color: rgba(255, 255, 255, 0.6);
  font-size: 0.85rem;
  font-family: var(--font-inter);
  font-weight: 500;
`;

export const ModalInput = styled.input`
  width: 100%;
  background: rgba(0, 0, 0, 0.4);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-top: 1px solid rgba(255, 255, 255, 0.15); /* inner shadow lighting */
  border-radius: 4px;
  color: white;
  padding: 15px;
  font-family: var(--font-inter);
  font-size: 1rem;
  transition: all 0.2s;

  &:focus {
    border-color: var(--color-orange);
    background: rgba(0, 0, 0, 0.6);
    box-shadow: inset 0 0 0 1px var(--color-orange); /* crisp focus */
    outline: none;
  }

  &::placeholder {
    color: rgba(255, 255, 255, 0.15);
  }
`;

export const ModalSelect = styled.select`
  width: 100%;
  background: rgba(0, 0, 0, 0.4);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-top: 1px solid rgba(255, 255, 255, 0.15);
  border-radius: 4px;
  color: white;
  padding: 15px;
  font-family: var(--font-inter);
  font-size: 1rem;
  cursor: pointer;
  appearance: none;
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-position: right 15px center;
  background-size: 16px;
  transition: all 0.2s;
  outline: none;

  &:focus {
    border-color: var(--color-orange);
    background-color: rgba(0, 0, 0, 0.6);
    box-shadow: inset 0 0 0 1px var(--color-orange);
  }

  option {
    background: #0f1216;
    color: white;
  }
`;

export const CheckboxGroup = styled.div`
  display: flex;
  align-items: center;
  gap: 15px;
  cursor: pointer;
  padding: 10px 0;

  input[type="checkbox"] {
    appearance: none;
    width: 24px;
    height: 24px;
    border: 2px solid rgba(255, 255, 255, 0.1);
    border-radius: 8px;
    cursor: pointer;
    position: relative;
    transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
    background: rgba(255, 255, 255, 0.03);

    &:checked {
      background: var(--color-orange);
      border-color: var(--color-orange);
      box-shadow: 0 0 15px rgba(255, 107, 0, 0.3);
    }

    &:checked::after {
      content: '✓';
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: black;
      font-size: 16px;
      font-weight: 800;
    }
  }

  label {
    cursor: pointer;
    color: rgba(255, 255, 255, 0.8);
    font-weight: 500;
    font-size: 1.05rem;
    transition: color 0.3s ease;
  }
  
  &:hover label {
    color: #fff;
  }
`;

export const CodeBlock = styled.div`
  background: rgba(0, 0, 0, 0.4);
  padding: 18px;
  border-radius: var(--radius-md);
  font-family: 'Consolas', monospace;
  font-size: 0.95rem;
  color: var(--color-orange);
  border: 1px dashed rgba(255, 255, 255, 0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  margin-top: 5px;
`;

// Assuming slideIn and slideOut are defined elsewhere or imported
const slideIn = css`
  from {
    transform: translateX(100%);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
`;

const slideOut = css`
  from {
    transform: translateX(0);
    opacity: 1;
  }
  to {
    transform: translateX(100%);
    opacity: 0;
  }
`;

export const Toast = styled.div<{ type: string; closing: boolean }>`
  min-width: 300px;
  max-width: 400px;
  background: #0f1216;
  border: 1px solid var(--border-favro);
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
  padding: 20px;
  display: flex;
  align-items: center;
  gap: 15px;
  animation: ${props => props.closing ? css`${slideOut} 0.3s forwards` : css`${slideIn} 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards`};
  position: relative;
  overflow: hidden;
`;

export const ZoneHUDContainer = styled.div`
  position: fixed;
  bottom: 40px;
  left: 50%;
  transform: translateX(-50%);
  background: rgba(12, 14, 18, 0.98); /* Solid dark instead of blur */
  border: 1px solid rgba(255, 107, 0, 0.3);
  border-radius: var(--radius-md);
  padding: 12px 25px;
  display: flex;
  align-items: center;
  gap: 30px;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.9), inset 0 1px 1px rgba(255, 255, 255, 0.05);
  z-index: 3000;
  pointer-events: none; /* Let clicks pass through since we use keys */

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 2px;
    background: var(--color-orange);
    border-radius: var(--radius-md) var(--radius-md) 0 0;
    opacity: 0.8;
  }
`;

export const ZoneHUDItem = styled.div`
  display: flex;
  align-items: center;
  gap: 12px;
  white-space: nowrap;

  .key-cap {
    background: #fff;
    color: #000;
    padding: 4px 8px;
    border-radius: 6px;
    font-weight: 800;
    font-size: 0.75rem;
    min-width: 24px;
    text-align: center;
    box-shadow: 0 3px 0 #ccc;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: var(--font-inter);
  }

  .mouse-icon {
     font-size: 1.4rem;
     color: #fff;
  }

  span.label {
    font-family: var(--font-bebas);
    font-size: 1.1rem;
    color: #fff;
    letter-spacing: 1px;
    text-transform: uppercase;
  }
  
  span.count {
    background: var(--color-orange);
    color: #000;
    padding: 2px 8px;
    border-radius: 4px;
    font-weight: 900;
    font-size: 0.9rem;
    margin-left: 5px;
  }
`;
