import { useCallback } from 'react';
import styled, { css } from 'styled-components';

interface ColorInputProps {
  title?: string;
  colors?: number[][];
  defaultValue?: number;
  clientValue?: number;
  onChange: (value: number) => void;
}

interface ButtonProps {
  selected: boolean;
}

const Container = styled.div`
  width: 100%;
  margin-top: 15px;

  > span {
    width: 100%;
    display: flex;
    justify-content: space-between;
    font-family: var(--font-inter);
    font-size: 0.8rem;
    font-weight: 900;
    text-transform: uppercase;
    color: var(--text-dim);
    margin-bottom: 8px;
    letter-spacing: 1px;
  }

  > div {
    display: grid;
    grid-template-columns: repeat(8, 1fr);
    gap: 8px;
    width: 100%;
    padding: 15px;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border-favro);
    border-radius: var(--radius-sub);
    transition: all 0.3s ease;

    &:hover {
      background: rgba(255, 255, 255, 0.05);
    }
  }
`;

const Button = styled.button<ButtonProps>`
  height: 24px;
  width: 100%;
  aspect-ratio: 1;
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
  position: relative;

  &:hover {
    transform: scale(1.2);
    z-index: 10;
    border-color: #fff;
  }

  ${({ selected }) =>
    selected &&
    css`
      border: 2px solid var(--color-orange);
      box-shadow: 0 0 10px var(--orange-glow);
      transform: scale(1.1);
      z-index: 5;
      
      &::after {
        content: "";
        position: absolute;
        top: -4px;
        left: -4px;
        right: -4px;
        bottom: -4px;
        border: 1px solid var(--color-orange);
        border-radius: 6px;
        opacity: 0.5;
      }
    `}
`;

const ColorInput: React.FC<ColorInputProps> = ({ title, colors = [], defaultValue, clientValue, onChange }) => {
  const selectColor = useCallback(
    (color: number) => {
      onChange(color);
    },
    [onChange],
  );

  return (
    <Container>
      <span>
        <small>{`${title}: ${defaultValue}`}</small>
        <small>{clientValue}</small>
      </span>
      <div>
        {colors.map((color, index) => (
          <Button
            key={index}
            style={{ backgroundColor: `rgb(${color[0]}, ${color[1]}, ${color[2]})` }}
            selected={defaultValue === index}
            onClick={() => selectColor(index)}
          />
        ))}
      </div>
    </Container>
  );
};

export default ColorInput;
