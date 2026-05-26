import { useState, useEffect } from 'react';
import styled from 'styled-components';
import { useNuiState } from '../../hooks/nuiState';

import Section from './components/Section';
import Item from './components/Item';

import { PedSettings } from './interfaces';

const ModelList = styled.div`
  display: flex;
  flex-direction: column;
  gap: 10px;
  max-height: 400px;
  overflow-y: auto;
  padding-right: 5px;

  &::-webkit-scrollbar {
    width: 6px;
  }
`;

const ModelButton = styled.button<{ active: boolean }>`
  width: 100%;
  padding: 15px;
  background: ${props => props.active ? 'var(--grad-orange)' : 'rgba(0,0,0,0.3)'};
  color: ${props => props.active ? '#000' : '#fff'};
  border: 1px solid ${props => props.active ? 'transparent' : 'rgba(255,255,255,0.05)'};
  border-radius: var(--radius-sub);
  font-family: var(--font-bebas);
  font-size: 1.2rem;
  letter-spacing: 1px;
  text-transform: uppercase;
  font-weight: 900;
  text-align: left;
  transition: all 0.15s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: ${props => props.active ? '0 0 15px var(--orange-glow)' : 'none'};
  cursor: pointer;

  &:hover {
    background: ${props => props.active ? 'var(--grad-orange)' : 'rgba(255,136,0,0.1)'};
    transform: translateX(4px);
    border-color: var(--orange-favro);
    filter: brightness(1.1);
  }

  &:active {
    transform: scale(0.98);
  }
`;

interface PedProps {
  settings: PedSettings;
  storedData: string;
  data: string;
  handleModelChange: (value: string) => void;
}

const Ped = ({ settings, storedData, data, handleModelChange }: PedProps) => {
  const { locales } = useNuiState();
  const [localSelection, setLocalSelection] = useState(data);

  useEffect(() => {
    setLocalSelection(data);
  }, [data]);

  const onSelect = (model: string) => {
    setLocalSelection(model);
    handleModelChange(model);
  };

  if (!locales) {
    return null;
  }

  return (
    <Section title={locales.ped.title}>
      <Item title={locales.ped.model}>
        <ModelList>
          {settings.model.items.map((model) => (
            <ModelButton
              key={model}
              active={localSelection === model}
              onClick={() => onSelect(model)}
            >
              {model}
            </ModelButton>
          ))}
        </ModelList>
      </Item>
    </Section>
  );
};

export default Ped;
