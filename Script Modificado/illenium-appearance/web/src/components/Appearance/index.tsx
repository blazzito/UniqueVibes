import { useState, useEffect, useCallback, useMemo } from 'react';
import { useTransition as useTransitionAnimation, animated } from 'react-spring';
import { useNuiState } from '../../hooks/nuiState';
import Nui from '../../Nui';
import mock from '../../mock';

import {
  CustomizationConfig,
  PedAppearance,
  AppearanceSettings,
  PedHeadBlend,
  PedFaceFeatures,
  PedHeadOverlays,
  PedHeadOverlayValue,
  PedHair,
  CameraState,
  ClothesState,
  Tattoo,
  TattoosSettings,
} from './interfaces';
import { FaUser, FaDna, FaSmile, FaPalette, FaTshirt, FaGlasses, FaPalette as FaTattoo, FaShoePrints, FaSave, FaTimes, FaArrowRight } from 'react-icons/fa';
import { BsArrow90DegDown } from 'react-icons/bs';

import {
  APPEARANCE_INITIAL_STATE,
  SETTINGS_INITIAL_STATE,
  CAMERA_INITIAL_STATE,
  ROTATE_INITIAL_STATE,
  CLOTHES_INITIAL_STATE,
} from './settings';

import Ped from './Ped';
import HeadBlend from './HeadBlend';
import FaceFeatures from './FaceFeatures';
import HeadOverlays from './HeadOverlays';
import Components from './Components';
import Props from './Props';
import Options from './Options';
import Modal from '../Modal';
import Tattoos from './Tattoos';

import {
  Wrapper,
  Container,
  SideColumn,
  TabsContainer,
  TabButton,
  ScrollContainer,
  SubTabsContainer,
  SubTabButton,
  GlobalStyle,
  ContainerInner,
  PaintDrip,
  CameraContainer,
  CameraButton,
  MenuWrapper,
  ActionContainer,
  ActionButton,
  RotationHint
} from './styles';
import { ThemeContext } from 'styled-components';

if (!import.meta.env.PROD) {
  mock('appearance_get_settings', () => ({
    appearanceSettings: {
      ...SETTINGS_INITIAL_STATE,
      eyeColor: { min: 0, max: 24 },
      hair: {
        ...SETTINGS_INITIAL_STATE.hair,
        color: {
          items: [
            [255, 0, 0],
            [0, 255, 0],
            [0, 0, 255],
            [0, 0, 255],
          ],
        },
      },
    },
  }));

  mock('appearance_get_data', () => ({
    appearanceData: { ...APPEARANCE_INITIAL_STATE, model: 'mp_f_freemode_01' },
  }));

  mock('appearance_change_model', () => SETTINGS_INITIAL_STATE);

  mock('appearance_change_component', () => SETTINGS_INITIAL_STATE.components);

  mock('appearance_change_prop', () => SETTINGS_INITIAL_STATE.props);
}

const Appearance = () => {
  const [config, setConfig] = useState<CustomizationConfig>();

  const [data, setData] = useState<PedAppearance>();
  const [storedData, setStoredData] = useState<PedAppearance>();
  const [appearanceSettings, setAppearanceSettings] = useState<AppearanceSettings>();

  const [camera, setCamera] = useState(CAMERA_INITIAL_STATE);
  const [rotate, setRotate] = useState(ROTATE_INITIAL_STATE);
  const [clothes, setClothes] = useState(CLOTHES_INITIAL_STATE);

  const [saveModal, setSaveModal] = useState(false);
  const [exitModal, setExitModal] = useState(false);
  const [isDragging, setIsDragging] = useState(false);
  const [lastX, setLastX] = useState(0);

  const { display, setDisplay, locales, setLocales, tattooPrice, setTattooPrice, shopType, setShopType } = useNuiState();


  const wrapperTransition = useTransitionAnimation(display.appearance, null, {
    from: { transform: 'translateX(-50px)', opacity: 0 },
    enter: { transform: 'translateY(0)', opacity: 1 },
    leave: { transform: 'translateX(-50px)', opacity: 0 },
  });

  const saveModalTransition = useTransitionAnimation(saveModal, null, {
    from: { opacity: 0 },
    enter: { opacity: 1 },
    leave: { opacity: 0 },
  });

  const exitModalTransition = useTransitionAnimation(exitModal, null, {
    from: { opacity: 0 },
    enter: { opacity: 1 },
    leave: { opacity: 0 },
  });

  const handleTurnAround = useCallback(() => {
    Nui.post('appearance_turn_around');
  }, []);

  const handleSetClothes = useCallback(
    (key: keyof ClothesState) => {
      setClothes({ ...clothes, [key]: !clothes[key] });
      if (!clothes[key]) {
        Nui.post('appearance_remove_clothes', key);
      } else {
        Nui.post('appearance_wear_clothes', { data, key });
      }
    },
    [data, clothes, setClothes],
  );

  const handleSetCamera = useCallback(
    (key: keyof CameraState) => {
      const isAlreadyActive = camera[key];
      setCamera({ ...CAMERA_INITIAL_STATE, [key]: !isAlreadyActive });
      setRotate(ROTATE_INITIAL_STATE);

      if (!isAlreadyActive) {
        Nui.post('appearance_set_camera', key);
      } else {
        Nui.post('appearance_set_camera', 'default');
      }
    },
    [camera, setCamera, setRotate],
  );

  const handleRotateLeft = useCallback(() => {
    setRotate({ left: !rotate.left, right: false });

    if (!rotate.left) {
      Nui.post('appearance_rotate_camera', 'left');
    } else {
      Nui.post('appearance_set_camera', 'current');
    }
  }, [setRotate, rotate]);

  const handleRotateRight = useCallback(() => {
    setRotate({ left: false, right: !rotate.right });

    if (!rotate.right) {
      Nui.post('appearance_rotate_camera', 'right');
    } else {
      Nui.post('appearance_set_camera', 'current');
    }
  }, [setRotate, rotate]);

  const handleWheel = useCallback((e: React.WheelEvent) => {
    const delta = e.deltaY > 0 ? -15 : 15;
    Nui.post('rotate_character', delta);
  }, []);

  const handleMouseDown = useCallback((e: React.MouseEvent) => {
    setIsDragging(true);
    setLastX(e.clientX);
  }, []);

  const handleMouseMove = useCallback((e: React.MouseEvent) => {
    if (!isDragging) return;

    const deltaX = e.clientX - lastX;
    if (Math.abs(deltaX) >= 1) {
      Nui.post('rotate_character', deltaX * -4.5);
      setLastX(e.clientX);
    }
  }, [isDragging, lastX]);

  const handleMouseUp = useCallback(() => {
    setIsDragging(false);
  }, []);

  const handleSaveModal = useCallback(() => {
    setSaveModal(true);
  }, [setSaveModal]);

  const handleExitModal = useCallback(() => {
    setExitModal(true);
  }, [setExitModal]);

  const handleSave = useCallback(
    async (accept: boolean) => {
      if (accept) {
        // If it's a tattoo shop, we need to buy the added tattoos first
        if (shopType === 'tattoo') {
          const addedTattoos: Tattoo[] = [];
          if (data && storedData) {
            Object.keys(data.tattoos).forEach(zone => {
              const currentZoneTattoos = data.tattoos[zone] || [];
              const storedZoneTattoos = storedData.tattoos[zone] || [];
              const newInZone = currentZoneTattoos.filter(t =>
                !storedZoneTattoos.some(st => st.name === t.name)
              );
              newInZone.forEach(t => addedTattoos.push(t));
            });
          }

          if (addedTattoos.length > 0) {
            const success = await Nui.post('appearance_buy_tattoo_cart', { 
              tattoos: addedTattoos, 
              shopDefaultCost: tattooPrice 
            });
            if (!success) {
              setSaveModal(false);
              return;
            }
          }
        }

        await Nui.post('appearance_save', data);
        setSaveModal(false);
      } else {
        setSaveModal(false);
      }
    },
    [setSaveModal, data, storedData, shopType, tattooPrice],
  );


  const handleExit = useCallback(
    async (accept: boolean) => {
      if (accept) {
        // 1. Visually revert to stored tattoos (clean state)
        if (storedData && storedData.tattoos) {
          await Nui.post('appearance_preview_tattoo', {
            data: storedData.tattoos,
            tattoo: {
              zone: 'ZONE_HEAD',
              collection: '',
              name: 'revert_dummy',
              label: '',
              hashMale: '',
              hashFemale: '',
              price: 0,
              opacity: 0
            }
          });
        }

        // 2. Call exit WITHOUT data. Passing data triggers the "Save/Charge" callback in lua.
        // We want to exit without saving/charging.
        await Nui.post('appearance_exit');
        setExitModal(false);
      } else {
        setExitModal(false);
      }
    },
    [setExitModal, storedData],
  );

  const handleModelChange = useCallback(
    async (value: string) => {
      // Optimistic update for immediate UI feedback
      setData(prev => prev ? { ...prev, model: value } : prev);

      const { appearanceSettings: _appearanceSettings, appearanceData } = await Nui.post(
        'appearance_change_model',
        value,
      );

      setAppearanceSettings(_appearanceSettings);
      setData(appearanceData);
    },
    [setData, setAppearanceSettings],
  );

  const handleHeadBlendChange = useCallback(
    (key: keyof PedHeadBlend, value: number) => {
      if (!data) return;

      const updatedHeadBlend = { ...data.headBlend, [key]: value };

      const updatedData = { ...data, headBlend: updatedHeadBlend };

      setData(updatedData);

      Nui.post('appearance_change_head_blend', updatedHeadBlend);
    },
    [data, setData],
  );

  const handleFaceFeatureChange = useCallback(
    (key: keyof PedFaceFeatures, value: number) => {
      if (!data) return;

      const updatedFaceFeatures = { ...data.faceFeatures, [key]: value };

      const updatedData = { ...data, faceFeatures: updatedFaceFeatures };

      setData(updatedData);

      Nui.post('appearance_change_face_feature', updatedFaceFeatures);
    },
    [data, setData],
  );

  const handleHairChange = useCallback(
    async (key: keyof PedHair, value: number) => {
      if (!data || !appearanceSettings) return;

      const updatedHair = { ...data.hair, [key]: value };

      const updatedData = { ...data, hair: updatedHair };

      setData(updatedData);

      const updatedHairSettings = await Nui.post('appearance_change_hair', updatedHair);

      const updatedSettings = { ...appearanceSettings, hair: updatedHairSettings };

      setAppearanceSettings(updatedSettings);
    },
    [data, setData, appearanceSettings, setAppearanceSettings],
  );

  const handleChangeFade = useCallback(async (value: number) => {
    if (!data || !appearanceSettings) return;
    const { tattoos } = data;
    const updatedTattoos = { ...tattoos };
    const tattoo = appearanceSettings.tattoos.items['ZONE_HAIR'][value]
    if (!updatedTattoos[tattoo.zone]) updatedTattoos[tattoo.zone] = [];
    updatedTattoos[tattoo.zone] = [tattoo];
    await Nui.post('appearance_apply_tattoo', updatedTattoos);
    setData({ ...data, tattoos: updatedTattoos });
  }, [appearanceSettings, data, setData])

  const handleHeadOverlayChange = useCallback(
    (key: keyof PedHeadOverlays, option: keyof PedHeadOverlayValue, value: number) => {
      if (!data) return;

      const updatedValue = { ...data.headOverlays[key], [option]: value };

      const updatedData = { ...data, headOverlays: { ...data.headOverlays, [key]: updatedValue } };

      setData(updatedData);

      Nui.post('appearance_change_head_overlay', { ...data.headOverlays, [key]: updatedValue });
    },
    [data, setData],
  );

  const handleEyeColorChange = useCallback(
    (value: number) => {
      if (!data) return;

      const updatedData = { ...data, eyeColor: value };

      setData(updatedData);

      Nui.post('appearance_change_eye_color', value);
    },
    [data, setData],
  );

  const handleComponentDrawableChange = useCallback(
    async (component_id: number, drawable: number) => {
      if (!data || !appearanceSettings) return;

      const component = data.components.find(c => c.component_id === component_id);

      if (!component) return;

      const updatedComponent = { ...component, drawable, texture: 0 };

      const filteredComponents = data.components.filter(c => c.component_id !== component_id);

      const updatedComponents = [...filteredComponents, updatedComponent];

      const updatedData = { ...data, components: updatedComponents };

      setData(updatedData);

      const updatedComponentSettings = await Nui.post('appearance_change_component', updatedComponent);

      const filteredComponentsSettings = appearanceSettings.components.filter(c => c.component_id !== component_id);

      const updatedComponentsSettings = [...filteredComponentsSettings, updatedComponentSettings];

      const updatedSettings = { ...appearanceSettings, components: updatedComponentsSettings };

      setAppearanceSettings(updatedSettings);
    },
    [data, setData, appearanceSettings, setAppearanceSettings],
  );

  const handleComponentTextureChange = useCallback(
    async (component_id: number, texture: number) => {
      if (!data || !appearanceSettings) return;

      const component = data.components.find(c => c.component_id === component_id);

      if (!component) return;

      const updatedComponent = { ...component, texture };

      const filteredComponents = data.components.filter(c => c.component_id !== component_id);

      const updatedComponents = [...filteredComponents, updatedComponent];

      const updatedData = { ...data, components: updatedComponents };

      setData(updatedData);

      const updatedComponentSettings = await Nui.post('appearance_change_component', updatedComponent);

      const filteredComponentsSettings = appearanceSettings.components.filter(c => c.component_id !== component_id);

      const updatedComponentsSettings = [...filteredComponentsSettings, updatedComponentSettings];

      const updatedSettings = { ...appearanceSettings, components: updatedComponentsSettings };

      setAppearanceSettings(updatedSettings);
    },
    [data, setData, appearanceSettings, setAppearanceSettings],
  );

  const handlePropDrawableChange = useCallback(
    async (prop_id: number, drawable: number) => {
      if (!data || !appearanceSettings) return;

      const prop = data.props.find(p => p.prop_id === prop_id);

      if (!prop) return;

      const updatedProp = { ...prop, drawable, texture: 0 };

      const filteredProps = data.props.filter(p => p.prop_id !== prop_id);

      const updatedProps = [...filteredProps, updatedProp];

      const updatedData = { ...data, props: updatedProps };

      setData(updatedData);

      const updatedPropSettings = await Nui.post('appearance_change_prop', updatedProp);

      const filteredPropsSettings = appearanceSettings.props.filter(c => c.prop_id !== prop_id);

      const updatedPropsSettings = [...filteredPropsSettings, updatedPropSettings];

      const updatedSettings = { ...appearanceSettings, props: updatedPropsSettings };

      setAppearanceSettings(updatedSettings);
    },
    [data, setData, appearanceSettings, setAppearanceSettings],
  );

  const handlePropTextureChange = useCallback(
    async (prop_id: number, texture: number) => {
      if (!data || !appearanceSettings) return;

      const prop = data.props.find(p => p.prop_id === prop_id);

      if (!prop) return;

      const updatedProp = { ...prop, texture };

      const filteredProps = data.props.filter(p => p.prop_id !== prop_id);

      const updatedProps = [...filteredProps, updatedProp];

      const updatedData = { ...data, props: updatedProps };

      setData(updatedData);

      const updatedPropSettings = await Nui.post('appearance_change_prop', updatedProp);

      const filteredPropsSettings = appearanceSettings.props.filter(c => c.prop_id !== prop_id);

      const updatedPropsSettings = [...filteredPropsSettings, updatedPropSettings];

      const updatedSettings = { ...appearanceSettings, props: updatedPropsSettings };

      setAppearanceSettings(updatedSettings);
    },
    [data, setData, appearanceSettings, setAppearanceSettings],
  );

  const isPedFreemodeModel = useMemo(() => {
    if (!data) return;

    return data.model === 'mp_m_freemode_01' || data.model === 'mp_f_freemode_01';
  }, [data]);

  const isPedMale = useMemo(() => {
    if (!data) return;

    if (data.model === 'mp_m_freemode_01') {
      return true;
    }

    return false
  }, [data]);

  const filterTattoos = (tattooSettings: TattoosSettings) => {
    for (const zone in tattooSettings.items) {
      tattooSettings.items[zone] = tattooSettings.items[zone].filter(tattoo => {
        if (isPedMale && tattoo.hashMale !== "") {
          return tattoo;
        } else if (!isPedMale && tattoo.hashFemale !== "") {
          return tattoo;
        }
      })
    }
    return tattooSettings;
  };

  const handleApplyTattoo = useCallback(
    async (tattoo: Tattoo, opacity: number) => {
      if (!data) return;
      tattoo.opacity = opacity;
      const { tattoos } = data;
      const updatedTattoos = JSON.parse(JSON.stringify({ ...tattoos }));
      if (!updatedTattoos[tattoo.zone]) updatedTattoos[tattoo.zone] = [];
      updatedTattoos[tattoo.zone].push(tattoo);

      // Use preview to update visual without charging/saving permanently yet
      await Nui.post('appearance_preview_tattoo', { data: updatedTattoos, tattoo });

      // Update local data immediately so Cart reflects changes
      setData({ ...data, tattoos: updatedTattoos });
    },
    [data, setData],
  );

  const handlePreviewTattoo = useCallback(
    (tattoo: Tattoo, opacity: number) => {
      if (!data) return;
      tattoo.opacity = opacity;
      const { tattoos } = data;
      Nui.post('appearance_preview_tattoo', { data: tattoos, tattoo });
    },
    [data],
  );

  const handleDeleteTattoo = useCallback(
    async (tattoo: Tattoo) => {
      if (!data) return;
      const { tattoos } = data;
      const updatedTattoos = tattoos;
      // eslint-disable-next-line prettier/prettier
      updatedTattoos[tattoo.zone] = updatedTattoos[tattoo.zone].filter(tattooDelete => tattooDelete.name !== tattoo.name);
      await Nui.post('appearance_delete_tattoo', updatedTattoos);
      setData({ ...data, tattoos: updatedTattoos });
    },
    [data, setData],
  );

  const handleClearTattoos = useCallback(
    async () => {
      if (!data) return;
      const { tattoos } = data;
      const updatedTattoos = { ...tattoos };
      for (var zone in updatedTattoos) {
        if (zone !== "ZONE_HAIR") {
          updatedTattoos[zone] = [];
        }
      }
      await Nui.post('appearance_delete_tattoo', updatedTattoos);
      setData({ ...data, tattoos: updatedTattoos });
    },
    [data, setData],
  );

  useEffect(() => {
    if (!locales) {
      Nui.post('appearance_get_locales').then(result => setLocales(result));
    }

    Nui.onEvent('appearance_display', (data: any) => {
      setDisplay({ appearance: true, asynchronous: data.asynchronous });
    });

    Nui.onEvent('appearance_hide', () => {
      setDisplay({ appearance: false, asynchronous: false });
      setData(APPEARANCE_INITIAL_STATE);
      setStoredData(APPEARANCE_INITIAL_STATE);
      //setAppearanceSettings(SETTINGS_INITIAL_STATE);
      setCamera(CAMERA_INITIAL_STATE);
      setRotate(ROTATE_INITIAL_STATE);
      setActiveTab('');
    });
  }, []);

  const fetchData = useCallback(async () => {
    const result = await Nui.post('appearance_get_data');
    setConfig(result.config);
    setStoredData(result.appearanceData);
    setData(result.appearanceData);
    setTattooPrice(result.tattooPrice || 0);
    setShopType(result.shopType || '');
  }, [setTattooPrice, setShopType]);


  const fetchSettings = useCallback(async () => {
    if (appearanceSettings === undefined || appearanceSettings === SETTINGS_INITIAL_STATE) {
      const result = await Nui.post('appearance_get_settings');
      setAppearanceSettings(result.appearanceSettings);
    }
  }, []);

  useEffect(() => {
    if (display.appearance) {
      if (display.asynchronous) {
        (async () => {
          await fetchSettings();
          await fetchData();
        })();
      } else {
        fetchSettings().catch(console.error);
        fetchData().catch(console.error);
      }
    }
  }, [display.appearance]);

  const [activeTab, setActiveTab] = useState('');
  const [activeSubTab, setActiveSubTab] = useState('');

  const tabs = useMemo(() => {
    if (!config || !locales) return [];
    return [
      { id: 'ped', label: locales.ped.title, icon: <FaUser />, config: config.ped },
      { id: 'genes', label: locales.headBlend.title, icon: <FaDna />, config: isPedFreemodeModel && config.headBlend },
      { id: 'faceFeatures', label: locales.faceFeatures.title, icon: <FaSmile />, config: isPedFreemodeModel && config.faceFeatures },
      { id: 'appearance', label: locales.headOverlays.title, icon: <FaPalette />, config: isPedFreemodeModel && config.headOverlays },
      { id: 'clothes', label: locales.components.title, icon: <FaTshirt />, config: config.components },
      { id: 'props', label: locales.props.title, icon: <FaGlasses />, config: config.props },
      { id: 'tattoos', label: locales.tattoos.title, icon: <FaTattoo />, config: isPedFreemodeModel && config.tattoos },
    ].filter(tab => tab.config);
  }, [config, locales, isPedFreemodeModel]);

  useEffect(() => {
    if (tabs.length > 0 && activeTab === '') {
      setActiveTab(tabs[0].id);
    }
  }, [tabs, activeTab]);

  useEffect(() => {
    setActiveSubTab('');
  }, [activeTab]);

  if (!display.appearance || !config || !appearanceSettings || !data || !storedData || !locales) {
    return null;
  }


  return (
    <>
      <GlobalStyle />
      <Wrapper
        onWheel={handleWheel}
        onMouseDown={handleMouseDown}
        onMouseMove={handleMouseMove}
        onMouseUp={handleMouseUp}
        onMouseLeave={handleMouseUp}
        style={{ cursor: isDragging ? 'grabbing' : 'default' }}
      >
        <RotationHint>
          <img src="https://r2.fivemanage.com/5nOEpfNnpHW9tfpLTFBoV/scroll_illen.gif" alt="rotate" />
          <span>ROTAR PERSONAJE</span>
        </RotationHint>
        <ContainerInner>
          <MenuWrapper
            onWheel={(e) => e.stopPropagation()}
            onMouseDown={(e) => e.stopPropagation()}
          >
            <CameraContainer>
              <CameraButton active={camera.head} onClick={() => handleSetCamera('head')}>
                <FaSmile size={16} /> Cabeza
              </CameraButton>
              <CameraButton active={camera.body} onClick={() => handleSetCamera('body')}>
                <FaUser size={16} /> Cuerpo
              </CameraButton>
              <CameraButton active={camera.bottom} onClick={() => handleSetCamera('bottom')}>
                <FaShoePrints size={16} /> Pies
              </CameraButton>
            </CameraContainer>

            <Container>
              <ScrollContainer>
                {activeTab === 'clothes' && config.components && (
                  <Components
                    settings={appearanceSettings.components}
                    data={data.components}
                    storedData={storedData.components}
                    handleComponentDrawableChange={handleComponentDrawableChange}
                    handleComponentTextureChange={handleComponentTextureChange}
                    componentConfig={config.componentConfig}
                    isPedFreemodeModel={isPedFreemodeModel}
                    hasTracker={config.hasTracker}
                  />
                )}
                {activeTab === 'props' && config.props && (
                  <Props
                    settings={appearanceSettings.props}
                    data={data.props}
                    storedData={storedData.props}
                    handlePropDrawableChange={handlePropDrawableChange}
                    handlePropTextureChange={handlePropTextureChange}
                    propConfig={config.propConfig}
                  />
                )}
                {activeTab === 'ped' && config.ped && (
                  <Ped
                    settings={appearanceSettings.ped}
                    data={data.model}
                    storedData={storedData.model}
                    handleModelChange={handleModelChange}
                  />
                )}
                {activeTab === 'genes' && isPedFreemodeModel && config.headBlend && (
                  <HeadBlend
                    settings={appearanceSettings.headBlend}
                    data={data.headBlend}
                    storedData={storedData.headBlend}
                    handleHeadBlendChange={handleHeadBlendChange}
                  />
                )}
                {activeTab === 'faceFeatures' && isPedFreemodeModel && config.faceFeatures && (
                  <FaceFeatures
                    settings={appearanceSettings.faceFeatures}
                    data={data.faceFeatures}
                    storedData={storedData.faceFeatures}
                    handleFaceFeatureChange={handleFaceFeatureChange}
                  />
                )}
                {activeTab === 'appearance' && config.headOverlays && (
                  <HeadOverlays
                    settings={{
                      hair: appearanceSettings.hair,
                      headOverlays: appearanceSettings.headOverlays,
                      eyeColor: appearanceSettings.eyeColor,
                      fade: appearanceSettings.tattoos.items['ZONE_HAIR'] || []
                    }}
                    data={{
                      hair: data.hair,
                      headOverlays: data.headOverlays,
                      eyeColor: data.eyeColor,
                      fade: (data.tattoos && data.tattoos['ZONE_HAIR'] && data.tattoos['ZONE_HAIR'].length > 0) ? data.tattoos['ZONE_HAIR'][0] : null
                    }}
                    storedData={{
                      hair: storedData.hair,
                      headOverlays: storedData.headOverlays,
                      eyeColor: storedData.eyeColor,
                      fade: (storedData.tattoos && storedData.tattoos['ZONE_HAIR'] && storedData.tattoos['ZONE_HAIR'].length > 0) ? storedData.tattoos['ZONE_HAIR'][0] : null
                    }}
                    isPedFreemodeModel={isPedFreemodeModel}
                    handleHairChange={handleHairChange}
                    handleHeadOverlayChange={handleHeadOverlayChange}
                    handleEyeColorChange={handleEyeColorChange}
                    handleChangeFade={handleChangeFade}
                    automaticFade={config.automaticFade}
                    activeSubTab={activeSubTab}
                  />
                )}
                {activeTab === 'tattoos' && isPedFreemodeModel && config.tattoos && (
                  <Tattoos
                    settings={appearanceSettings.tattoos}
                    data={data.tattoos}
                    storedData={storedData.tattoos}
                    handleApplyTattoo={handleApplyTattoo}
                    handlePreviewTattoo={handlePreviewTattoo}
                    handleDeleteTattoo={handleDeleteTattoo}
                    handleClearTattoos={handleClearTattoos}
                    handleSave={handleSaveModal}
                  />
                )}
              </ScrollContainer>
            </Container>

            <ActionContainer>
              <ActionButton variant="cancel" onClick={handleExitModal}>
                <FaTimes /> SALIR
              </ActionButton>
              {shopType !== 'tattoo' && (
                <ActionButton variant="save" onClick={handleSaveModal}>
                  <FaSave /> GUARDAR
                </ActionButton>
              )}
            </ActionContainer>
          </MenuWrapper>

          <SideColumn>
            <TabsContainer
              onWheel={(e) => e.stopPropagation()}
              onMouseDown={(e) => e.stopPropagation()}
            >
              {tabs.map(tab => (
                <TabButton
                  key={tab.id}
                  active={activeTab === tab.id}
                  onClick={() => setActiveTab(tab.id)}
                  title={tab.label}
                >
                  <div className="icon">{tab.icon}</div>
                </TabButton>
              ))}
            </TabsContainer>

            <Options
              clothes={clothes}
              handleSetClothes={handleSetClothes}
            />
          </SideColumn>
        </ContainerInner>

      </Wrapper>

      {
        saveModalTransition.map(
          ({ item, key, props: style }) =>
            item && (
              <animated.div key={key} style={style}>
                <Modal
                  title={locales.modal.save.title}
                  description={locales.modal.save.description}
                  accept={locales.modal.accept}
                  decline={locales.modal.decline}
                  handleAccept={() => handleSave(true)}
                  handleDecline={() => handleSave(false)}
                />
              </animated.div>
            ),
        )
      }
      {
        exitModalTransition.map(
          ({ item, key, props: style }) =>
            item && (
              <animated.div key={key} style={style}>
                <Modal
                  title={locales.modal.exit.title}
                  description={locales.modal.exit.description}
                  accept={locales.modal.accept}
                  decline={locales.modal.decline}
                  handleAccept={() => handleExit(true)}
                  handleDecline={() => handleExit(false)}
                />
              </animated.div>
            ),
        )
      }
    </>
  );
};

export default Appearance;
