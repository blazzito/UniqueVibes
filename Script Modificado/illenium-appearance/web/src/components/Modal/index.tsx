import { FaCheck, FaTimes } from 'react-icons/fa';
import {
  Overlay,
  ModalCard,
  Title,
  Description,
  ButtonsContainer,
  ModalButton,
  PaintDrip
} from './styles';

interface ModalProps {
  title: string;
  description: string;
  accept: string;
  decline: string;
  handleAccept: () => Promise<void> | void;
  handleDecline: () => Promise<void> | void;
}

const Modal = ({ title, description, accept, decline, handleAccept, handleDecline }: ModalProps) => {
  return (
    <Overlay>
      <ModalCard>
        <Title>{title}</Title>
        <Description>{description}</Description>

        <ButtonsContainer>
          <ModalButton variant="decline" onClick={handleDecline}>
            <FaTimes /> {decline}
          </ModalButton>
          <ModalButton variant="accept" onClick={handleAccept}>
            <FaCheck /> {accept}
          </ModalButton>
        </ButtonsContainer>
      </ModalCard>
    </Overlay>
  );
};

export default Modal;
