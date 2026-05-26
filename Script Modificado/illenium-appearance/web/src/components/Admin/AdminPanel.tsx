import React, { useState, useEffect, useCallback } from 'react';
import Nui from '../../Nui';
import {
  FullScreenContainer,
  TopBar,
  Title,
  SearchBar,
  ActionButton,
  MainContent,
  SidebarFilter,
  FilterItem,
  GridArea,
  StoreCard,
  CardHeader,
  CardWatermark,
  CardBody,
  CardActions,
  ModalOverlay,
  ModalContent,
  WindowContainer,
  ModalRow,
  ModalGroup,
  ModalLabel,
  ModalInput,
  ModalSelect,
  CheckboxGroup,
  CodeBlock
} from './Admin.styles';
import { FaTshirt, FaCut, FaSyringe, FaUserMd, FaEdit, FaTrash, FaMapMarkerAlt, FaEye, FaEyeSlash } from 'react-icons/fa';

interface Store {
  id?: number;
  type: string;
  coords: { x: number, y: number, z: number, w?: number };
  size?: { x: number, y: number, z: number };
  rotation?: number;
  usePoly: boolean;
  points?: { x: number, y: number, z: number }[];
  job?: string;
  gang?: string;
  showBlip?: boolean | number;
  cost?: number;
}

const defaultStore: Store = {
  type: 'clothing',
  coords: { x: 0, y: 0, z: 0 },
  size: { x: 4, y: 4, z: 4 },
  rotation: 0,
  usePoly: false,
  showBlip: true,
};

const AdminPanel: React.FC<{ onClose: () => void }> = ({ onClose }) => {
  const [stores, setStores] = useState<Store[]>([]);
  const [debugZones, setDebugZones] = useState(false);
  const [filter, setFilter] = useState('all');
  const [search, setSearch] = useState('');

  // Modal State
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingStore, setEditingStore] = useState<Store>(defaultStore);

  const fetchStores = useCallback(async () => {
    try {
      const data = await Nui.post('illenium-appearance:server:getStores');
      if (data) setStores(data);
    } catch (e) {
      console.error(e);
      // Mock for dev
      setStores([
        { id: 1, type: 'clothing', coords: { x: 0, y: 0, z: 0 }, usePoly: false },
        { id: 2, type: 'barber', coords: { x: 10, y: 10, z: 0 }, usePoly: false },
      ]);
    }
  }, []);

  useEffect(() => {
    fetchStores();

    const handleMessage = (event: MessageEvent) => {
      if (event.data.action === 'updatePolyOrCoords') {
        setEditingStore(prev => ({ ...prev, ...event.data.data }));
        // Ensure modal is open if we receive coords (in case NUI focus was lost/regained)
        setIsModalOpen(true);
      }
    };
    window.addEventListener('message', handleMessage);
    return () => window.removeEventListener('message', handleMessage);
  }, [fetchStores]);

  const handleSave = async () => {
    if (editingStore.id) {
      await Nui.post('illenium-appearance:server:updateStore', editingStore);
    } else {
      await Nui.post('illenium-appearance:server:addStore', editingStore);
    }
    setIsModalOpen(false);
    fetchStores();
  };

  const handleDelete = async (id?: number) => {
    if (!id) return;
    await Nui.post('illenium-appearance:server:deleteStore', id);
    fetchStores();
  };

  const openCreateModal = () => {
    setEditingStore(defaultStore);
    setIsModalOpen(true);
  };

  const openEditModal = (store: Store) => {
    setEditingStore(store);
    setIsModalOpen(true);
  };

  const requestCoords = () => Nui.post('illenium-appearance:client:requestCoords');
  const requestPoly = () => Nui.post('illenium-appearance:client:requestPoly');

  const toggleDebugZones = async () => {
    const newState = !debugZones;
    setDebugZones(newState);
    await Nui.post('illenium-appearance:client:toggleDebugZones', newState);
  };

  const handleTeleport = async (store: Store) => {
    // If poly, calculate center or use first point
    let coords = store.coords;
    if (store.usePoly && store.points && store.points.length > 0) {
      coords = { ...store.points[0], w: 0 };
    }
    await Nui.post('illenium-appearance:client:teleportToStore', coords);
    onClose();
  };

  const filteredStores = stores.filter(s => {
    const matchesFilter = filter === 'all' || s.type === filter;
    const matchesSearch = s.type.includes(search.toLowerCase()) || (s.job && s.job.includes(search.toLowerCase()));
    return matchesFilter && matchesSearch;
  });

  const getIcon = (type: string) => {
    switch (type) {
      case 'clothing': return <FaTshirt />;
      case 'barber': return <FaCut />;
      case 'tattoo': return <FaSyringe />;
      case 'surgeon': return <FaUserMd />;
      default: return <FaTshirt />;
    }
  };

  const getTypeName = (type: string) => {
    switch (type) {
      case 'clothing': return 'Tienda de Ropa';
      case 'barber': return 'Barbería';
      case 'tattoo': return 'Tatuajes';
      case 'surgeon': return 'Cirujano';
      default: return type;
    }
  };

  return (
    <FullScreenContainer>
      <WindowContainer>
        <TopBar>
          <Title>GESTIÓN DE TIENDAS</Title>
          <SearchBar
            placeholder="Buscar tiendas..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
          <ActionButton onClick={openCreateModal}>+ Crear Tienda</ActionButton>
          <ActionButton
            variant={debugZones ? 'primary' : 'secondary'}
            onClick={toggleDebugZones}
            title="Mostrar/Ocultar límites de zonas (Debug)"
          >
            {debugZones ? <FaEye /> : <FaEyeSlash />} Depurar Zonas
          </ActionButton>
          <ActionButton variant="secondary" onClick={onClose}>Cerrar</ActionButton>
        </TopBar>

        <MainContent>
          <SidebarFilter>
            <FilterItem active={filter === 'all'} onClick={() => setFilter('all')}>Todas</FilterItem>
            <FilterItem active={filter === 'clothing'} onClick={() => setFilter('clothing')}>Ropa</FilterItem>
            <FilterItem active={filter === 'barber'} onClick={() => setFilter('barber')}>Barbería</FilterItem>
            <FilterItem active={filter === 'tattoo'} onClick={() => setFilter('tattoo')}>Tatuajes</FilterItem>
            <FilterItem active={filter === 'surgeon'} onClick={() => setFilter('surgeon')}>Cirujano</FilterItem>
          </SidebarFilter>

          <GridArea>
            {filteredStores.map(store => (
              <StoreCard key={store.id}>
                <CardWatermark type={store.type}>
                  {getIcon(store.type)}
                </CardWatermark>
                <CardHeader type={store.type}>
                  {getIcon(store.type)}
                </CardHeader>
                <CardBody>
                  <h3>{getTypeName(store.type)}</h3>
                  <p>{store.job ? `Trabajo: ${store.job}` : 'Acceso: Público'}</p>
                  <p className="meta-id">ID: {store.id}</p>
                </CardBody>
                <CardActions className="actions">
                  <ActionButton className='small' title="Teletransportar" onClick={(e) => { e.stopPropagation(); handleTeleport(store); }}><FaMapMarkerAlt /></ActionButton>
                  <ActionButton className='small' title="Editar" onClick={() => openEditModal(store)}><FaEdit /></ActionButton>
                  <ActionButton className='small' variant="secondary" title="Eliminar" onClick={() => handleDelete(store.id)}><FaTrash /></ActionButton>
                </CardActions>
              </StoreCard>
            ))}
          </GridArea>
        </MainContent>
      </WindowContainer>

      {isModalOpen && (
        <ModalOverlay>
          <ModalContent>
            <h2>{editingStore.id ? 'Editar Tienda' : 'Nueva Tienda'}</h2>

            <ModalRow>
              <ModalGroup>
                <ModalLabel>Tipo</ModalLabel>
                <ModalSelect
                  value={editingStore.type}
                  onChange={(e) => setEditingStore({ ...editingStore, type: e.target.value })}
                >
                  <option value="clothing">Ropa</option>
                  <option value="barber">Barbería</option>
                  <option value="tattoo">Tatuajes</option>
                  <option value="surgeon">Cirujano</option>
                </ModalSelect>
              </ModalGroup>
              <ModalGroup>
                <ModalLabel>Restricción de Trabajo (Opcional)</ModalLabel>
                <ModalInput
                  value={editingStore.job || ''}
                  onChange={(e) => setEditingStore({ ...editingStore, job: e.target.value })}
                  placeholder="police, ambulance..."
                />
              </ModalGroup>
              <ModalGroup flex={0.5}>
                <ModalLabel>Costo ($)</ModalLabel>
                <ModalInput
                  type="number"
                  value={editingStore.cost || ''}
                  onChange={(e) => setEditingStore({ ...editingStore, cost: e.target.value ? parseInt(e.target.value) : undefined })}
                  placeholder="Defecto"
                />
              </ModalGroup>
            </ModalRow>

            <CheckboxGroup>
              <input
                type="checkbox"
                checked={editingStore.showBlip === undefined || editingStore.showBlip === true || editingStore.showBlip === 1}
                onChange={(e) => setEditingStore({ ...editingStore, showBlip: e.target.checked })}
                id="showBlip"
              />
              <label htmlFor="showBlip">Mostrar Blip en Mapa</label>
            </CheckboxGroup>

            <ModalGroup>
              <ModalLabel>Ubicación</ModalLabel>
              <ModalRow style={{ marginBottom: 10 }}>
                <ActionButton
                  style={{ flex: 1, fontSize: '1rem', padding: '10px' }}
                  onClick={requestCoords}
                >
                  Usar Coords Actuales
                </ActionButton>
                <ActionButton
                  style={{ flex: 1, fontSize: '1rem', padding: '10px' }}
                  onClick={requestPoly}
                >
                  Grabar PolyZone
                </ActionButton>
              </ModalRow>
              <CodeBlock>
                {editingStore.usePoly
                  ? `PolyZone: ${editingStore.points?.length || 0} puntos definidos.`
                  : `Vector: ${editingStore.coords.x.toFixed(2)}, ${editingStore.coords.y.toFixed(2)}, ${editingStore.coords.z.toFixed(2)}`}
              </CodeBlock>
            </ModalGroup>

            {!editingStore.usePoly && (
              <ModalGroup>
                <ModalLabel>Tamaño y Rotación (Box)</ModalLabel>
                <ModalRow>
                  <ModalInput type="number" placeholder="X" title="Ancho" value={editingStore.size?.x} onChange={e => setEditingStore({ ...editingStore, size: { ...editingStore.size!, x: parseFloat(e.target.value) } })} />
                  <ModalInput type="number" placeholder="Y" title="Largo" value={editingStore.size?.y} onChange={e => setEditingStore({ ...editingStore, size: { ...editingStore.size!, y: parseFloat(e.target.value) } })} />
                  <ModalInput type="number" placeholder="Z" title="Alto" value={editingStore.size?.z} onChange={e => setEditingStore({ ...editingStore, size: { ...editingStore.size!, z: parseFloat(e.target.value) } })} />
                  <ModalInput type="number" placeholder="Rot" title="Rotación" value={editingStore.rotation || 0} onChange={e => setEditingStore({ ...editingStore, rotation: parseFloat(e.target.value) })} />
                </ModalRow>
              </ModalGroup>
            )}

            <div style={{ display: 'flex', justifyContent: 'flex-end', gap: 10, marginTop: 10 }}>
              <ActionButton variant="secondary" onClick={() => setIsModalOpen(false)}>Cancelar</ActionButton>
              <ActionButton onClick={handleSave}>Guardar</ActionButton>
            </div>
          </ModalContent>
        </ModalOverlay>
      )}

    </FullScreenContainer>
  );
};

export default AdminPanel;
