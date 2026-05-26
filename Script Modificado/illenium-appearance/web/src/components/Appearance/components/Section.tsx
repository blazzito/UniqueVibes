import { useState, useEffect, useRef, ReactNode } from 'react';
import styled, { css } from 'styled-components';
import { FiChevronDown, FiChevronUp } from 'react-icons/fi';
import { useSpring, animated } from 'react-spring';

interface SectionProps {
  title: string;
  deps?: any[];
  children?: ReactNode;
}

interface HeaderProps {
  active: boolean;
}

const Container = styled.div`
  width: 100%;

  display: flex;
  flex-direction: column;

  color: rgba(${props => props.theme.fontColor || '255, 255, 255'}, 1);

  user-select: none;

  & + div {
    margin-top: 10px;
  }
`;

const Header = styled.div<HeaderProps>`
  width: 100%;
  min-height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px 20px;
  margin-bottom: 20px;
  background: var(--orange-favro);
  border: 4px solid #000;
  box-shadow: 6px 6px 0px rgba(0, 0, 0, 1);
  transition: all 0.1s ease;
  font-family: var(--font-bebas);
  position: relative;

  span {
    font-size: 2rem;
    font-weight: 900;
    letter-spacing: 2px;
    text-transform: uppercase;
    color: #000;
    font-family: var(--font-bebas);
    z-index: 2;
  }

  svg {
    display: none;
  }
`;

const Items = styled.div`
  padding: 0 2px 5px 2px;

  overflow: hidden;
`;

const Section: React.FC<SectionProps> = ({ children }) => {
  return (
    <Container>
      <Items>{children}</Items>
    </Container>
  );
};

export default Section;
