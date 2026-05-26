import { useCallback, useRef } from 'react';
import styled from 'styled-components';

interface RangeInputProps {
  title?: string;
  min: number;
  max: number;
  factor?: number;
  defaultValue?: number;
  clientValue?: number;
  onChange: (value: number) => void;
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
    display: flex;
    align-items: center;
    position: relative;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border-favro);
    border-radius: var(--radius-sub);
    height: 40px;
    padding: 0 15px;
    transition: all 0.3s ease;
 
    &:hover {
        background: rgba(255, 255, 255, 0.06);
        border-color: rgba(255, 255, 255, 0.2);
    }
 
    > small {
      font-family: var(--font-bebas);
      font-size: 1.1rem;
      font-weight: 500;
      color: #fff;
      opacity: 0.8;
    }
  }

  input[type='range'] {
    -webkit-appearance: none;
    appearance: none;
    width: 100%;
    height: 4px;
    background: rgba(0, 0, 0, 0.3);
    border-radius: 2px;
    outline: none;
    margin: 0 15px;
  }
 
  input[type='range']::-webkit-slider-thumb {
    -webkit-appearance: none;
    appearance: none;
    width: 18px;
    height: 18px;
    background: var(--color-orange);
    cursor: pointer;
    border-radius: 4px;
    border: none;
    box-shadow: 0 0 15px var(--orange-glow);
    transition: all 0.2s ease;
 
    &:hover {
      transform: scale(1.15) rotate(45deg);
      box-shadow: 0 0 20px var(--orange-glow);
    }
  }
`;

const RangeInput: React.FC<RangeInputProps> = ({
  min,
  max,
  factor = 1,
  title,
  defaultValue = 1,
  clientValue,
  onChange,
}) => {
  const inputRef = useRef<HTMLInputElement>(null);

  const handleContainerClick = useCallback(() => {
    if (inputRef.current) {
      inputRef.current.focus();
    }
  }, [inputRef]);

  const handleChange = useCallback(
    (e: { target: { value: string } }) => {
      const parsedValue = parseFloat(e.target.value);
      onChange(parsedValue);
    },
    [onChange],
  );

  return (
    <Container onClick={handleContainerClick}>
      <span>
        <small>
          {title}: {defaultValue}
        </small>
        <small>{clientValue}</small>
      </span>
      <div>
        <small>{min}</small>
        <input
          type="range"
          ref={inputRef}
          value={defaultValue}
          min={min}
          max={max}
          step={factor}
          onChange={handleChange}
        />
        <small>{max}</small>
      </div>
    </Container>
  );
};

export default RangeInput;
