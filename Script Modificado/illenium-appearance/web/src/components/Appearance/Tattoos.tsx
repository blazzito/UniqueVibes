import { useNuiState } from '../../hooks/nuiState';
import Section from './components/Section';
import Item from './components/Item';
import { FlexWrapper } from './styles';
import SelectTattoo from './components/SelectTattoo';
import TattooCart from './components/TattooCart';

import { TattoosSettings, TattooList, Tattoo } from './interfaces';
import Button from './components/Button';

interface TattoosProps {
  settings: TattoosSettings;
  data: TattooList;
  storedData: TattooList;
  handleApplyTattoo: (value: Tattoo, opacity: number) => void;
  handlePreviewTattoo: (value: Tattoo, opacity: number) => void;
  handleDeleteTattoo: (value: Tattoo) => void;
  handleClearTattoos: () => void;
  handleSave: () => void;
}

const Tattoos = ({ settings, data, storedData, handleApplyTattoo, handlePreviewTattoo, handleDeleteTattoo, handleClearTattoos, handleSave }: TattoosProps) => {
  const { locales } = useNuiState();

  const { items } = settings;
  const keys = Object.keys(items);

  if (!locales) {
    return null;
  }

  // Calculate added tattoos (in data but not in storedData)
  const addedTattoos: TattooList = {};

  if (data && storedData) {
    Object.keys(data).forEach(zone => {
      const currentZoneTattoos = data[zone] || [];
      const storedZoneTattoos = storedData[zone] || [];

      const newInZone = currentZoneTattoos.filter(t =>
        !storedZoneTattoos.some(st => st.name === t.name)
      );

      if (newInZone.length > 0) {
        addedTattoos[zone] = newInZone;
      }
    });
  }

  return (
    <>
      <Section title={locales.tattoos.title}>
        {keys.map(key => (
          key !== 'ZONE_HAIR'
          &&
          <Item key={key} title={locales.tattoos.items[key]}>
            <FlexWrapper>
              <SelectTattoo
                handlePreviewTattoo={handlePreviewTattoo}
                handleApplyTattoo={handleApplyTattoo}
                handleDeleteTattoo={handleDeleteTattoo}
                items={items[key]}
                tattoosApplied={data[key] ?? null}
                settings={settings}
              />
            </FlexWrapper>
          </Item>
        ))}
        {/* Clear All button is now in the cart, but we can keep a backup or remove it */}
      </Section>

      <TattooCart
        data={addedTattoos}
        handleDeleteTattoo={handleDeleteTattoo}
        handleBuy={handleSave}
      />
    </>
  );
};

export default Tattoos;
