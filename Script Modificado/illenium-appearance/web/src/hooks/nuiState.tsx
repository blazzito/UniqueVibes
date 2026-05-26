import React, { createContext, useState, useCallback, useContext, ReactNode } from 'react';
import Locales from '../shared/interfaces/locales';

interface Display {
  appearance: boolean;
  asynchronous: boolean;
}

interface NuiState {
  display: Display;
  locales?: Locales;
  tattooPrice: number;
  shopType?: string;
}


interface NuiContextData {
  display: Display;
  setDisplay(value: Display): void;
  locales?: Locales;
  setLocales(value: Locales): void;
  tattooPrice: number;
  setTattooPrice(value: number): void;
  shopType?: string;
  setShopType(value: string): void;
}


const INITIAL_STATE: NuiState = {
  display: {
    appearance: false,
    asynchronous: false,
  },
  tattooPrice: 0,
};


const NuiContext = createContext<NuiContextData>({} as NuiContextData);

const NuiStateProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
  const [data, setData] = useState<NuiState>(INITIAL_STATE);

  const setDisplay = useCallback(
    (value: Display) => {
      setData(state => ({
        ...state,
        display: {
          ...value,
        },
      }));
    },
    [setData],
  );

  const setLocales = useCallback(
    (value: Locales) => {
      setData(state => ({
        ...state,
        locales: value,
      }));
    },
    [setData],
  );

  const setTattooPrice = useCallback(
    (value: number) => {
      setData(state => ({
        ...state,
        tattooPrice: value,
      }));
    },
    [setData],
  );

  const setShopType = useCallback(
    (value: string) => {
      setData(state => ({
        ...state,
        shopType: value,
      }));
    },
    [setData],
  );

  const contextValue = {
    display: data.display,
    setDisplay,
    locales: data.locales,
    setLocales,
    tattooPrice: data.tattooPrice,
    setTattooPrice,
    shopType: data.shopType,
    setShopType,
  };


  return <NuiContext.Provider value={contextValue}>{children}</NuiContext.Provider>;
};

function useNuiState(): NuiContextData {
  const context = useContext(NuiContext);

  return context;
}

export { NuiStateProvider, useNuiState };
