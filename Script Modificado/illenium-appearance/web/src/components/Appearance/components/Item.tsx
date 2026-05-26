import styled from 'styled-components';
import { ReactNode, Children } from 'react';
import { TripleContent, Column, Label, IconContainer } from '../styles';

interface ItemProps {
  title?: string;
  children?: ReactNode;
  icon?: ReactNode;
  drawableLabel?: string;
  textureLabel?: string;
}

const ItemContainer = styled.div`
  margin-top: 15px;
  display: flex;
  flex-direction: column;
  background: rgba(255, 255, 255, 0.04);
  border: 1px solid var(--border-favro);
  border-radius: var(--radius-sub);
  position: relative;
  overflow: hidden;
  transition: all 0.3s ease;

  &::before {
    content: "";
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 4px;
    height: 30%;
    background: linear-gradient(to bottom, var(--color-orange), var(--color-petrol));
    transition: height 0.3s ease;
    z-index: 5;
  }

  &:hover {
    background: rgba(255, 255, 255, 0.07);
    &::before {
      height: 60%;
    }
  }
`;

const TagHeader = styled.div`
  background: rgba(0, 0, 0, 0.2);
  width: 100%;
  padding: 12px 20px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
  position: relative;
  z-index: 2;

  span {
    font-family: var(--font-bebas);
    font-size: 1.4rem;
    font-weight: 500;
    color: var(--orange-favro);
    text-transform: uppercase;
    letter-spacing: 1.5px;
    opacity: 0.9;
  }
`;

const ContentBody = styled.div`
  padding: 18px;
  position: relative;
  z-index: 2;
  width: 100%;
`;

const Item: React.FC<ItemProps> = ({ children, title, icon, drawableLabel, textureLabel }) => {
  const childrenArray = Children.toArray(children);

  return (
    <ItemContainer>
      {title && (
        <TagHeader>
          <span>{title}</span>
        </TagHeader>
      )}
      <ContentBody>
        {icon ? (
          <TripleContent>
            <Column>
              <Label>{drawableLabel || 'ELEMENTOS'}</Label>
              {childrenArray[0]}
            </Column>
            <IconContainer>{icon}</IconContainer>
            <Column>
              <Label>{textureLabel || 'TEXTURAS'}</Label>
              {childrenArray[1]}
            </Column>
          </TripleContent>
        ) : (
          children
        )}
      </ContentBody>
    </ItemContainer>
  );
};

export default Item;
