import { useCallback, useRef } from 'react';
import styled from 'styled-components';
import { FiChevronLeft, FiChevronRight } from 'react-icons/fi';
import { valueContainerCSS } from 'react-select/src/components/containers';

interface InputProps {
  title?: string;
  min?: number;
  max?: number;
  blacklisted?: number[];
  defaultValue: number;
  clientValue: number;
  onChange: (value: number) => void;
}

const Container = styled.div`
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 8px;
  margin-top: 8px;

  /* Info text (Value / Max) */
  > span {
    font-family: var(--font-inter);
    font-size: 1rem;
    font-weight: 900;
    text-transform: uppercase;
    color: var(--text-dim);
    letter-spacing: 1px;
    white-space: nowrap;
  }

  > div {
    display: flex;
    align-items: center;
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid var(--border-favro);
    border-radius: var(--radius-sub);
    height: 40px;
    width: 100%;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;

    &:hover {
      background: rgba(255, 255, 255, 0.06);
      border-color: rgba(255, 255, 255, 0.2);
    }

    button {
      height: 100%;
      width: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(0, 0, 0, 0.2);
      color: var(--color-orange);
      border: none;
      cursor: pointer;
      transition: all 0.2s ease;
      font-size: 1.2rem;

      &:hover {
        background: rgba(255, 107, 0, 0.1);
        color: #fff;
      }

      &:active {
        transform: scale(0.9);
      }

      svg {
        stroke-width: 3;
      }
    }

    input {
      flex: 1;
      background: transparent;
      border: none;
      color: #fff;
      text-align: center;
      font-family: var(--font-bebas);
      font-size: 1.4rem;
      font-weight: 500;
      width: 100%;
      padding: 0;
      letter-spacing: 1px;
      
      &::-webkit-outer-spin-button,
      &::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
      }
    }
  }
`;

const Input: React.FC<InputProps> = ({ title, min = 0, max = 255, blacklisted = [], defaultValue, clientValue, onChange }) => {
  const inputRef = useRef<HTMLInputElement>(null);

  const handleContainerClick = useCallback(() => {
    if (inputRef.current) {
      inputRef.current.focus();
    }
  }, [inputRef]);

  const isBlacklisted = function (_value: number, blacklisted: number[]) {
    for (var i = 0; i < blacklisted.length; i++) {
      if (blacklisted[i] == _value) {
        return true
      }
    }
    return false
  }

  const normalize = function (_value: number) {
    if (_value < min) {
      _value = max;
    } else if (_value > max) {
      _value = min;
    }

    return _value;
  }

  const checkBlacklisted = function (_value: number, blacklisted: number[], factor: number) {
    if (factor === 0) {
      if (!isBlacklisted(_value, blacklisted)) {
        return normalize(_value);
      }
      factor = _value > defaultValue ? 1 : -1;
    }

    do {
      _value = normalize(_value + factor);
    } while (isBlacklisted(_value, blacklisted))
    return _value;
  };

  const getSafeValue = useCallback(
    (_value: number, factor: number) => {
      let safeValue = _value;

      return checkBlacklisted(safeValue, blacklisted, factor);
    },
    [min, max, blacklisted],
  );

  const handleChange = useCallback(
    (_value: any, factor: number) => {
      let parsedValue;

      if (!_value && _value !== 0) return;

      if (Number.isNaN(_value)) return;

      if (typeof _value === 'string') {
        parsedValue = parseInt(_value);
      } else {
        parsedValue = _value;
      }

      const safeValue = getSafeValue(parsedValue, factor);

      onChange(safeValue);
    },
    [getSafeValue, onChange],
  );

  return (
    <Container onClick={handleContainerClick}>
      {title && (
        <span style={{ fontSize: '0.8rem', opacity: 0.9 }}>{title}</span>
      )}
      <div>
        <button type="button" onClick={() => handleChange(defaultValue, -1)}>
          <FiChevronLeft />
        </button>
        <input type="number" ref={inputRef} value={defaultValue} onChange={e => handleChange(e.target.value, 0)} />
        <button type="button" onClick={() => handleChange(defaultValue, 1)}>
          <FiChevronRight />
        </button>
      </div>
      <span>{defaultValue} / {max}</span>
    </Container>
  );
};

export default Input;
