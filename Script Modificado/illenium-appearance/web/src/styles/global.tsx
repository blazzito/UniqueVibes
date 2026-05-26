import { createGlobalStyle } from 'styled-components';

export default createGlobalStyle<{ theme: any }>`
  @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Bebas+Neue&family=Inter:wght@400;700;900&display=swap');

  :root {
    --color-orange: #ff6b00;
    --color-petrol: #00a8cc;
    --color-bg-dark: transparent;
    --glass-bg: rgba(12, 12, 14, 0.95);
    --glass-border: rgba(255, 255, 255, 0.08);
    --font-main: 'Quicksand', sans-serif;
    --font-accent: 'Bebas Neue', sans-serif;
    --radius-lg: 16px;
    --radius-md: 10px;

    --bg-favro: var(--color-bg-dark);
    --bg-favro-card: transparent;
    --grad-main: transparent;
    --grad-petrol: linear-gradient(180deg, #00202f 0%, #00121b 100%);
    --grad-orange: linear-gradient(135deg, var(--color-orange) 0%, #ff8800 100%);
    --accent-petrol: var(--color-petrol);
    --orange-favro: var(--color-orange);
    --orange-glow: rgba(255, 107, 0, 0.3);
    --yellow-favro: #ffcc00;
    --border-favro: var(--glass-border);
    --text-main: #ffffff;
    --text-dim: #a0a0a0;
    --radius-main: var(--radius-lg);
    --radius-sub: var(--radius-md);
    --font-bebas: var(--font-accent);
    --font-inter: var(--font-main);
  }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    outline: 0;
    font-family: var(--font-inter);
  }
  
  body {
    background: transparent;
    -webkit-font-smoothing: antialiased;
    overflow: hidden;
  }

  button {
    cursor: pointer;
    outline: 0;
    border: none;
    background: none;
  }

  /* Custom scrollbar */
  ::-webkit-scrollbar {
    width: 6px;
  }
  ::-webkit-scrollbar-track {
    background: var(--bg-favro);
  }
  ::-webkit-scrollbar-thumb {
    background: var(--orange-favro);
    border-radius: 0;
  }
`;
