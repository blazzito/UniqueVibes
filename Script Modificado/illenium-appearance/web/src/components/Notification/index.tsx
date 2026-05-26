import React, { useState, useEffect } from 'react';
import styled, { keyframes, css } from 'styled-components';
import { useNuiState } from '../../hooks/nuiState';
import Nui from '../../Nui';
import { FaInfoCircle, FaCheckCircle, FaExclamationTriangle, FaTimesCircle } from 'react-icons/fa';

const slideIn = keyframes`
  from { transform: translateX(120%); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
`;

const slideOut = keyframes`
  from { transform: translateX(0); opacity: 1; }
  to { transform: translateX(120%); opacity: 0; }
`;

const NotificationContainer = styled.div`
  position: fixed;
  top: 40px;
  right: 40px;
  display: flex;
  flex-direction: column;
  gap: 15px;
  z-index: 9999;
  pointer-events: none;
`;

const Toast = styled.div<{ type: string; closing: boolean }>`
  min-width: 320px;
  max-width: 420px;
  background: var(--grad-petrol);
  border: 1px solid var(--border-favro);
  border-radius: var(--radius-sub);
  box-shadow: 0 15px 40px rgba(0, 0, 0, 0.8), inset 0 0 1px rgba(255,255,255,0.1);
  padding: 20px;
  display: flex;
  align-items: center;
  gap: 20px;
  animation: ${props => props.closing ? css`${slideOut} 0.3s forwards` : css`${slideIn} 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards`};
  position: relative;
  overflow: hidden;

  &::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: ${props => {
    switch (props.type) {
      case 'success': return '#2ecc71';
      case 'error': return '#e74c3c';
      case 'warning': return 'var(--orange-favro)';
      default: return 'var(--yellow-favro)';
    }
  }};
    box-shadow: 0 0 20px ${props => {
    switch (props.type) {
      case 'success': return 'rgba(46, 204, 113, 0.8)';
      case 'error': return 'rgba(231, 76, 60, 0.8)';
      default: return 'var(--orange-glow)';
    }
  }};
  }
`;

const IconWrapper = styled.div<{ type: string }>`
  font-size: 28px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: ${props => {
    switch (props.type) {
      case 'success': return '#2ecc71';
      case 'error': return '#e74c3c';
      case 'warning': return 'var(--orange-favro)';
      default: return 'var(--orange-favro)';
    }
  }};
`;

const Content = styled.div`
  display: flex;
  flex-direction: column;
`;

const Title = styled.span`
  font-family: var(--font-bebas);
  font-size: 1.6rem;
  font-weight: 900;
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 1.5px;
  line-height: 1;
`;

const Message = styled.span`
  font-family: var(--font-inter);
  font-size: 0.95rem;
  font-weight: 600;
  color: #888;
  margin-top: 5px;
`;

interface NotificationItem {
  id: number;
  title: string;
  description: string;
  type: 'success' | 'error' | 'warning' | 'info';
  duration?: number;
  closing?: boolean;
}

const Notification = () => {
  const [notifications, setNotifications] = useState<NotificationItem[]>([]);

  useEffect(() => {
    const handleNotify = (data: Omit<NotificationItem, 'id'>) => {
      const id = Date.now();
      const newNotification = { ...data, id, closing: false };

      setNotifications(prev => [...prev, newNotification]);

      setTimeout(() => {
        setNotifications(prev => prev.map(n => n.id === id ? { ...n, closing: true } : n));
        setTimeout(() => {
          setNotifications(prev => prev.filter(n => n.id !== id));
        }, 500); // Wait for slideOut animation
      }, data.duration || 5000);
    };

    Nui.onEvent('appearance_notify', handleNotify);

    return () => {
      // Cleanup if needed, though Nui.onEvent might not have an off method exposed directly in this context without looking at Nui.ts
    };
  }, []);

  return (
    <NotificationContainer>
      {notifications.map(n => (
        <Toast key={n.id} type={n.type} closing={n.closing || false}>
          <IconWrapper type={n.type}>
            {n.type === 'success' && <FaCheckCircle />}
            {n.type === 'error' && <FaTimesCircle />}
            {n.type === 'warning' && <FaExclamationTriangle />}
            {n.type === 'info' && <FaInfoCircle />}
          </IconWrapper>
          <Content>
            <Title>{n.title}</Title>
            <Message>{n.description}</Message>
          </Content>
        </Toast>
      ))}
    </NotificationContainer>
  );
};

export default Notification;
