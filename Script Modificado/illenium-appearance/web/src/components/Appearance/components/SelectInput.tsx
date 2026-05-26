import { useContext, useRef } from 'react';
import styled, { ThemeContext } from 'styled-components';
import Select from 'react-select';

interface SelectInputProps {
  title: string;
  items: string[];
  defaultValue: string;
  clientValue: string;
  onChange: (value: string) => void;
}

const Container = styled.div`
  min-width: 0;

  display: flex;
  flex-direction: column;
  flex-grow: 1;

  > span {
    width: 100%;

    display: flex;
    justify-content: space-between;
    font-weight: 200;
  }
`;

const customStyles: any = {
  control: (styles: any) => ({
    ...styles,
    marginTop: '8px',
    background: 'rgba(255, 255, 255, 0.03)',
    fontSize: '14px',
    color: '#fff',
    border: '1px solid var(--border-favro)',
    borderRadius: 'var(--radius-md)',
    outline: 'none',
    boxShadow: 'none',
    minHeight: '40px',
    '&:hover': {
      background: 'rgba(255, 255, 255, 0.06)',
      borderColor: 'rgba(255, 255, 255, 0.2)',
    }
  }),
  placeholder: (styles: any) => ({
    ...styles,
    fontSize: '14px',
    color: 'rgba(255, 255, 255, 0.5)',
    fontFamily: 'var(--font-main)',
  }),
  input: (styles: any) => ({
    ...styles,
    fontSize: '14px',
    color: '#fff',
    fontFamily: 'var(--font-main)',
  }),
  singleValue: (styles: any) => ({
    ...styles,
    fontSize: '14px',
    color: '#fff',
    fontFamily: 'var(--font-main)',
  }),
  indicatorContainer: (styles: any) => ({
    ...styles,
    color: 'var(--color-orange)',
  }),
  dropdownIndicator: (styles: any) => ({
    ...styles,
    color: 'var(--color-orange)',
    '&:hover': {
      color: '#fff',
    }
  }),
  indicatorsContainer: (styles: any) => ({
    ...styles,
    paddingRight: '10px',
  }),
  separator: () => ({
    display: 'none',
  }),
  menuPortal: (styles: any) => ({
    ...styles,
    color: '#fff',
    zIndex: 9999,
  }),
  menu: (styles: any) => ({
    ...styles,
    background: 'var(--glass-bg)',
    border: '1px solid var(--glass-border)',
    borderRadius: 'var(--radius-md)',
    boxShadow: '0 10px 30px rgba(0, 0, 0, 0.5)',
    overflow: 'hidden',
  }),
  menuList: (styles: any) => ({
    ...styles,
    padding: '5px',
    '&::-webkit-scrollbar': {
      width: '6px',
    },
    '&::-webkit-scrollbar-track': {
      background: 'transparent',
    },
    '&::-webkit-scrollbar-thumb': {
      borderRadius: '10px',
      background: 'rgba(255, 255, 255, 0.1)',
    },
  }),
  option: (styles: any, { isFocused, isSelected }: any) => ({
    ...styles,
    borderRadius: '6px',
    margin: '2px 0',
    padding: '10px 15px',
    fontSize: '14px',
    fontFamily: 'var(--font-main)',
    background: isSelected 
      ? 'var(--color-orange)' 
      : isFocused 
        ? 'rgba(255, 255, 255, 0.05)' 
        : 'transparent',
    color: isSelected ? '#000' : '#fff',
    cursor: 'pointer',
    transition: 'all 0.2s ease',
    '&:active': {
      background: 'var(--color-orange)',
      color: '#000',
    }
  }),
};

const SelectInput = ({ title, items, defaultValue, clientValue, onChange }: SelectInputProps) => {
  const selectRef = useRef<any>(null);

  const handleChange = (event: any, { action }: any): void => {
    if (action === 'select-option') {
      onChange(event.value);
    }
  };

  const onMenuOpen = () => {
    setTimeout(() => {
      const selectedEl = document.getElementsByClassName("Select" + title + "__option--is-selected")[0];
      if (selectedEl) {
        selectedEl.scrollIntoView({ behavior: 'auto', block: 'start', inline: 'nearest' });
      }
    }, 100);
  };

  const themeContext = useContext(ThemeContext);
  customStyles.control.background = `rgba(${themeContext.secondaryBackground || '0, 0, 0'}, 0.8)`;
  customStyles.menu.background = `rgba(${themeContext.secondaryBackground || '0, 0, 0'}, 0.8)`;
  customStyles.menuList.background = `rgba(${themeContext.secondaryBackground || '0, 0, 0'}, 0.8)`;

  return (
    <Container>
      <span>
        <small>{title}</small>
        <small>{clientValue}</small>
      </span>
      <Select
        ref={selectRef}
        styles={customStyles}
        options={items.map(item => ({ value: item, label: item }))}
        value={{ value: defaultValue, label: defaultValue }}
        onChange={handleChange}
        onMenuOpen={onMenuOpen}
        className={"Select" + title}
        classNamePrefix={"Select" + title}
        menuPortalTarget={document.body}
      />
    </Container>
  );
};

export default SelectInput;
