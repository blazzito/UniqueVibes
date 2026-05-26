import { NuiStateProvider } from './hooks/nuiState';
import GlobalStyles from './styles/global';

import Appearance from './components/Appearance';
import AdminPanel from './components/Admin/AdminPanel';
import ZoneHUD from './components/Admin/ZoneHUD';
import Notification from './components/Notification';
import { ThemeProvider } from 'styled-components';
import Nui from './Nui';
import { useCallback, useEffect, useState } from 'react';

const defaultTheme: any = {
  id: 'default',
  borderRadius: '4px',
  fontColor: '255, 255, 255',
  fontColorHover: '255, 255, 255',
  fontColorSelected: '0, 0, 0',
  fontFamily: 'Inter',
  primaryBackground: '0, 0, 0',
  primaryBackgroundSelected: '255, 255, 255',
  secondaryBackground: '0, 0, 0',
  scaleOnHover: false,
  sectionFontWeight: 'normal',
  smoothBackgroundTransition: false,
};

const App: React.FC = () => {
  const [currentTheme, setCurrentTheme] = useState(defaultTheme);

  const [showAdmin, setShowAdmin] = useState(false);
  const [showZoneHUD, setShowZoneHUD] = useState(false);
  const [zonePointsCount, setZonePointsCount] = useState(0);

  const getCurrentTheme = (themeData: any) => {
    for (let index = 0; index < themeData.themes.length; index++) {
      if (themeData.themes[index].id === themeData.currentTheme) {
        return themeData.themes[index];
      }
    }
  };

  const loadTheme = useCallback(async () => {
    const themeData = await Nui.post('get_theme_configuration');
    setCurrentTheme(getCurrentTheme(themeData));
  }, []);

  useEffect(() => {
    loadTheme().catch(console.error);

    const handleMessage = (event: MessageEvent) => {
      if (event.data.action === 'setShowAdmin') {
        setShowAdmin(event.data.data);
      } else if (event.data.action === 'setShowZoneHUD') {
        setShowZoneHUD(event.data.data);
      } else if (event.data.action === 'setZonePointsCount') {
        setZonePointsCount(event.data.data);
      }
    };
    window.addEventListener('message', handleMessage);
    return () => window.removeEventListener('message', handleMessage);
  }, [loadTheme]);

  return (
    <NuiStateProvider>
      <ThemeProvider theme={currentTheme}>
        <div style={{ display: showAdmin ? 'block' : 'none' }}>
          <AdminPanel onClose={() => { setShowAdmin(false); Nui.post('illenium-appearance:client:closeAdmin'); }} />
        </div>
        {showZoneHUD && <ZoneHUD pointsCount={zonePointsCount} />}
        {!showAdmin && !showZoneHUD && <Appearance />}
        <Notification />
        <GlobalStyles />
      </ThemeProvider>
    </NuiStateProvider>
  );
};

export default App;
