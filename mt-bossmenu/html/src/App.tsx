import React, { useState, useEffect, useMemo } from 'react';
import {
  Users,
  Wallet,
  TrendingUp,
  UserPlus,
  UserMinus,
  ArrowUpCircle,
  ArrowDownCircle,
  DollarSign,
  History,
  Settings,
  X,
  Search,
  ChevronRight,
  Award,
  LogOut,
  LayoutDashboard,
  Bell,
  CreditCard,
  Clock,
  CheckCircle2,
  AlertCircle,
  Power,
  Briefcase,
  FileText,
  Calendar,
  Phone,
  Edit2
} from 'lucide-react';
import { motion, AnimatePresence } from 'motion/react';

// --- Types ---
interface Employee {
  identifier: string;
  firstname: string;
  lastname: string;
  jobgrade: string;
  jobgradenr: number;
  salary: number;
  isOnline?: boolean;
}

interface BossPoint {
  id: string;
  name: string;
  job: string;
  grades: number[];
  account: string;
  coords: string;
}

interface SalaryGrade {
  label: string;
  grade: number;
  salary: number;
}

interface Stats {
  employeesamount: number;
  ondutyamount: number;
  account: string;
  currency: string;
  billingEnabled?: boolean;
  jobName: string;
  jobLabel: string;
}

interface JobOffer {
  id: number;
  business_name: string;
  position: string;
  salary: string;
  benefits: string;
  description: string;
  logo: string;
  author_identifier: string;
  job?: string;
}

interface JobApplication {
  id: number;
  job: string;
  identifier: string;
  name: string;
  age: number;
  phone: string;
  experience: string;
  time: string;
}

// --- Mock Data ---
const MOCK_DATA = {
  stats: {
    employeesamount: 24,
    ondutyamount: 8,
    account: "1.250.000",
    currency: "$",
    billingEnabled: true,
    jobName: "",
    jobLabel: ""
  },
  employees: [
    { identifier: '1', firstname: 'Diego', lastname: 'Garcia', jobgrade: 'Boss', jobgradenr: 4, salary: 5000, isOnline: true },
    { identifier: '2', firstname: 'John', lastname: 'Doe', jobgrade: 'Manager', jobgradenr: 3, salary: 3500, isOnline: true },
    { identifier: '3', firstname: 'Jane', lastname: 'Smith', jobgrade: 'Worker', jobgradenr: 1, salary: 1500, isOnline: false },
    { identifier: '4', firstname: 'Robert', lastname: 'Brown', jobgrade: 'Recruit', jobgradenr: 0, salary: 800, isOnline: true },
  ],
  salaries: [
    { label: 'Recruit', grade: 0, salary: 800 },
    { label: 'Worker', grade: 1, salary: 1500 },
    { label: 'Supervisor', grade: 2, salary: 2500 },
    { label: 'Manager', grade: 3, salary: 3500 },
    { label: 'Boss', grade: 4, salary: 5000 },
  ],
  bossPoints: [
    { id: '1', name: 'Comisaría Central', job: 'police', account: 'society_police', coords: '425.1, -979.5, 30.7' },
    { id: '2', name: 'Hospital Pillbox', job: 'ambulance', account: 'society_ambulance', coords: '291.1, -581.5, 43.2' },
    { id: '3', name: 'Mecánico Benny\'s', job: 'mechanic', account: 'society_mechanic', coords: '-31.5, -1050.2, 28.4' },
  ],
  availableJobs: [
    { label: 'Policía', value: 'police' },
    { label: 'Ambulancia', value: 'ambulance' },
    { label: 'Mecánico', value: 'mechanic' },
    { label: 'Taxi', value: 'taxi' },
    { label: 'Cardealer', value: 'cardealer' },
    { label: 'Real Estate', value: 'realestate' },
  ],
  billingSettings: [
    { job: 'police', enabled: true },
    { job: 'ambulance', enabled: true },
    { job: 'mechanic', enabled: false },
    { job: 'taxi', enabled: false },
  ],
  paymentSchedules: [
    { id: '1', job: 'police', pointName: 'Comisaría Central', time: '12:00' },
    { id: '2', job: 'ambulance', pointName: 'Hospital Pillbox', time: '18:30' },
    { id: '3', job: 'mechanic', pointName: 'Mecánico Benny\'s', time: '00:00' },
  ]
};

// --- NUI Helpers ---
const isEnvBrowser = () => !(window as any).invokeNative;

async function postNui(eventName: string, data: any = {}) {
  if (isEnvBrowser()) {
    console.log(`[NUI Mock] ${eventName}`, data);
    return { status: 'ok' };
  }

  const resourceName = (window as any).GetParentResourceName ? (window as any).GetParentResourceName() : 'mt_bossmenu';
  try {
    const resp = await fetch(`https://${resourceName}/${eventName}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=UTF-8' },
      body: JSON.stringify(data),
    });
    return await resp.json();
  } catch (e) {
    return 'error';
  }
}

const formatCoords = (coords: any): string => {
  if (typeof coords === 'string') return coords;
  if (coords && typeof coords === 'object') {
    if ('x' in coords) {
      return `${Number(coords.x).toFixed(1)}, ${Number(coords.y).toFixed(1)}, ${Number(coords.z).toFixed(1)}`;
    }
    // Handle array-like or other object formats
    return JSON.stringify(coords);
  }
  return String(coords || 'N/A');
};

export default function App() {
  const [visible, setVisible] = useState(isEnvBrowser());
  const [activeTab, setActiveTab] = useState('dashboard');
  const [adminSubTab, setAdminSubTab] = useState('points');
  const [scale, setScale] = useState(1);

  // --- Scaling Logic for Responsiveness ---
  useEffect(() => {
    const handleResize = () => {
      const width = window.innerWidth;
      const height = window.innerHeight;
      // Base design resolution: 1600x900
      const scaleW = width / 1600;
      const scaleH = height / 900;
      // Use the smaller scale to ensure it fits perfectly
      setScale(Math.min(scaleW, scaleH));
    };

    handleResize();
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);
  const [stats, setStats] = useState<Stats>(MOCK_DATA.stats);
  const [employees, setEmployees] = useState<Employee[]>(MOCK_DATA.employees);
  const [salaries, setSalaries] = useState<SalaryGrade[]>(MOCK_DATA.salaries);
  const [bossPoints, setBossPoints] = useState<BossPoint[]>(MOCK_DATA.bossPoints);
  const [billingSettings, setBillingSettings] = useState(MOCK_DATA.billingSettings);
  const [paymentSchedules, setPaymentSchedules] = useState(MOCK_DATA.paymentSchedules);
  const [searchQuery, setSearchQuery] = useState('');
  const [filterOnline, setFilterOnline] = useState(false);
  const [availableJobs, setAvailableJobs] = useState(MOCK_DATA.availableJobs);
  const [offers, setOffers] = useState<JobOffer[]>([]);
  const [applications, setApplications] = useState<JobApplication[]>([]);
  const [employmentSubTab, setEmploymentSubTab] = useState<'offers' | 'applications'>('offers');
  const [modal, setModal] = useState<{
    type: 'fire' | 'hire' | 'bonus' | 'admin_point' | 'delete_point' | 'salary_edit' | 'payment_edit' | 'create_offer' | 'none',
    data?: any
  }>({ type: 'none' });

  // Form states for Admin Point
  const [pointForm, setPointForm] = useState({
    name: '',
    job: '',
    grades: [] as number[],
    account: '',
    coords: ''
  });

  // Form state for Salary Edit
  const [salaryInput, setSalaryInput] = useState('');

  // Form state for Payment Edit
  const [paymentTimeInput, setPaymentTimeInput] = useState('');
  const [offerForm, setOfferForm] = useState({
    business_name: '',
    position: '',
    salary: '',
    benefits: '',
    description: '',
    logo: 'briefcase'
  });
  const [editingOfferId, setEditingOfferId] = useState<number | null>(null);

  useEffect(() => {
    if (modal.type === 'admin_point') {
      if (modal.data) {
        setPointForm({
          name: modal.data.name,
          job: modal.data.job,
          grades: modal.data.grades || [],
          account: modal.data.account,
          coords: modal.data.coords
        });
      } else {
        setPointForm({
          name: '',
          job: availableJobs[0]?.value || '',
          grades: [],
          account: availableJobs[0] ? `society_${availableJobs[0].value}` : '',
          coords: ''
        });
      }
    } else if (modal.type === 'salary_edit') {
      setSalaryInput(modal.data.salary.toString());
    } else if (modal.type === 'payment_edit') {
      setPaymentTimeInput(modal.data.time);
    }
  }, [modal]);

  const [isAdmin, setIsAdmin] = useState(isEnvBrowser());

  // --- Mock Nearby Players ---
  const NEARBY_PLAYERS = [
    { id: 10, name: 'Carlos Rodriguez' },
    { id: 15, name: 'Marta Sanchez' },
    { id: 22, name: 'Juan Lopez' },
  ];

  // --- NUI Listeners ---
  useEffect(() => {
    const handleMessage = (event: MessageEvent) => {
      const { action, data, stats: newStats, employees: newEmployees, salaries: newSalaries, message, type } = event.data;

      switch (action) {
        case 'openNUI':
          setVisible(true);
          if (newStats) {
            setStats(newStats);
            setIsAdmin(newStats.isBoss || isEnvBrowser());
          }
          if (newEmployees) setEmployees(newEmployees);
          if (newSalaries) setSalaries(newSalaries);
          break;
        case 'getStats':
          if (newStats) setStats(newStats);
          break;
        case 'getEmployeesList':
          if (newEmployees) setEmployees(newEmployees);
          break;
        case 'closeNUI':
          setVisible(false);
          break;
        case 'openAdminPanel':
          setVisible(true);
          setActiveTab('admin');
          setIsAdmin(true);
          if (event.data.points) setBossPoints(Array.isArray(event.data.points) ? event.data.points : Object.values(event.data.points));
          if (event.data.availableJobs) setAvailableJobs(event.data.availableJobs);
          break;
        case 'getJobOffers':
          if (data) setOffers(data);
          break;
        case 'getApplications':
          if (data) setApplications(data);
          break;
      }
    };

    window.addEventListener('message', handleMessage);
    return () => window.removeEventListener('message', handleMessage);
  }, []);

  // --- Actions ---
  const handleClose = () => {
    if (!isEnvBrowser()) setVisible(false);
    postNui('closeNUI');
  };

  const handleAction = async (action: string, data: any) => {
    const res = await postNui(action, data);
    setModal({ type: 'none' });

    if (res === 'ok' || res?.status === 'ok') {
      if (!isEnvBrowser()) {
        postNui('notify', { message: 'Acción realizada con éxito', type: 'success' });
      }
    } else {
      if (!isEnvBrowser()) {
        postNui('notify', { message: `Error: ${res}`, type: 'error' });
      }
    }
  };

  // --- Filtered Data ---
  const filteredEmployees = useMemo(() => {
    return employees.filter(e => {
      const fullname = `${e.firstname || ''} ${e.lastname || ''}`.toLowerCase();
      const jobgrade = (e.jobgrade || '').toLowerCase();
      const search = searchQuery.toLowerCase();
      
      const matchesSearch = fullname.includes(search) || jobgrade.includes(search);
      const matchesOnline = filterOnline ? e.isOnline : true;
      return matchesSearch && matchesOnline;
    });
  }, [employees, searchQuery, filterOnline]);

  if (!visible) return null;

  return (
    <div className="h-screen w-screen flex items-center justify-center bg-black/40 backdrop-blur-sm font-main overflow-hidden">
      <div
        style={{
          transform: `scale(${scale})`,
          transformOrigin: 'center',
          width: '1600px',
          height: '900px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center'
        }}
        className="relative"
      >
        {/* Modals */}
        <AnimatePresence>
          {modal.type !== 'none' && (
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="absolute inset-0 z-[100] flex items-center justify-center bg-black/60 backdrop-blur-md p-4"
            >
              <motion.div
                initial={{ scale: 0.9, y: 20 }}
                animate={{ scale: 1, y: 0 }}
                exit={{ scale: 0.9, y: 20 }}
                className="container-premium max-w-md w-full p-8 space-y-6 bg-color-bg-dark"
              >
                {modal.type === 'fire' && (
                  <>
                    <div className="text-center space-y-2">
                      <div className="w-16 h-16 rounded-full bg-red-500/10 text-red-500 mx-auto flex items-center justify-center">
                        <UserMinus size={32} />
                      </div>
                      <h3 className="font-accent text-2xl tracking-widest uppercase">Despedir Empleado</h3>
                      <p className="text-sm text-white/40">
                        ¿Estás seguro de que deseas despedir a <span className="text-white font-medium">{modal.data.firstname} {modal.data.lastname}</span>? Esta acción no se puede deshacer.
                      </p>
                    </div>
                    <div className="flex gap-4">
                      <button
                        onClick={() => setModal({ type: 'none' })}
                        className="btn-premium btn-secondary flex-1"
                      >
                        Cancelar
                      </button>
                      <button
                        onClick={() => handleAction('fireEmployee', { employee: modal.data })}
                        className="btn-premium bg-red-500 text-white hover:bg-red-600 flex-1"
                      >
                        Confirmar
                      </button>
                    </div>
                  </>
                )}

                {modal.type === 'create_offer' && (
                  <div className="space-y-6">
                    <div className="flex items-center gap-3 border-b border-white/5 pb-4">
                      <div className="w-10 h-10 rounded-xl bg-orange/10 flex items-center justify-center text-orange border border-orange/20">
                        <Briefcase size={20} />
                      </div>
                      <div>
                        <h2 className="font-accent text-2xl text-white tracking-wider uppercase leading-none mb-1">Nueva Oferta de Empleo</h2>
                        <p className="text-[10px] text-white/40 uppercase tracking-[2px]">Centro de Trabajo Municipal</p>
                      </div>
                    </div>

                    <div className="space-y-4 max-h-[50vh] overflow-y-auto pr-2 custom-scrollbar">
                      <div className="form-group">
                        <label className="text-white/40 text-[10px] uppercase tracking-[2px] flex items-center gap-2 mb-2 font-bold">
                          <Briefcase size={12} className="text-orange" />
                          Nombre del Negocio <span className="text-orange">*</span>
                        </label>
                        <input
                          type="text"
                          value={offerForm.business_name}
                          readOnly
                          placeholder="Nombre del negocio..."
                          className="w-full bg-white/[0.01] border border-white/5 rounded-xl px-4 py-3 text-sm text-white/40 outline-none cursor-not-allowed transition-all"
                        />
                      </div>

                      <div className="form-group">
                        <label className="text-white/40 text-[10px] uppercase tracking-[2px] flex items-center gap-2 mb-2 font-bold">
                          <Users size={12} className="text-orange" />
                          Puesto de Trabajo <span className="text-orange">*</span>
                        </label>
                        <select
                          value={offerForm.position}
                          onChange={(e) => setOfferForm({ ...offerForm, position: e.target.value })}
                          className="w-full bg-white/[0.03] border border-white/10 rounded-xl px-4 py-3 text-sm text-white outline-none focus:border-orange/50 focus:bg-white/[0.05] transition-all appearance-none"
                        >
                          <option value="" disabled className="bg-[#1a1a1e]">Selecciona un rango...</option>
                          {salaries.map(grade => (
                            <option key={grade.grade} value={grade.label} className="bg-[#1a1a1e]">
                              {grade.label}
                            </option>
                          ))}
                        </select>
                      </div>

                      <div className="grid grid-cols-2 gap-4">
                        <div className="form-group">
                          <label className="text-white/40 text-[10px] uppercase tracking-[2px] flex items-center gap-2 mb-2 font-bold">
                            <DollarSign size={12} className="text-orange" />
                            Salario
                          </label>
                          <input
                            type="text"
                            value={offerForm.salary}
                            onChange={(e) => setOfferForm({ ...offerForm, salary: e.target.value })}
                            placeholder="Ej: $1500 + Propinas"
                            className="w-full bg-white/[0.03] border border-white/10 rounded-xl px-4 py-3 text-sm text-white outline-none focus:border-orange/50 focus:bg-white/[0.05] transition-all placeholder:text-white/10"
                          />
                        </div>
                        <div className="form-group">
                          <label className="text-white/40 text-[10px] uppercase tracking-[2px] flex items-center gap-2 mb-2 font-bold">
                            <Award size={12} className="text-orange" />
                            Beneficios
                          </label>
                          <input
                            type="text"
                            value={offerForm.benefits}
                            onChange={(e) => setOfferForm({ ...offerForm, benefits: e.target.value })}
                            placeholder="Ej: Seguro Médico"
                            className="w-full bg-white/[0.03] border border-white/10 rounded-xl px-4 py-3 text-sm text-white outline-none focus:border-orange/50 focus:bg-white/[0.05] transition-all placeholder:text-white/10"
                          />
                        </div>
                      </div>

                      <div className="form-group">
                        <label className="text-white/40 text-[10px] uppercase tracking-[2px] flex items-center gap-2 mb-2 font-bold">
                          <FileText size={12} className="text-orange" />
                          Descripción <span className="text-orange">*</span>
                        </label>
                        <textarea
                          value={offerForm.description}
                          onChange={(e) => setOfferForm({ ...offerForm, description: e.target.value })}
                          placeholder="Describe el puesto y los requisitos..."
                          rows={3}
                          className="w-full bg-white/[0.03] border border-white/10 rounded-xl px-4 py-3 text-sm text-white outline-none focus:border-orange/50 focus:bg-white/[0.05] transition-all resize-none placeholder:text-white/10"
                        />
                      </div>

                      <div className="form-group">
                        <label className="text-white/40 text-[10px] uppercase tracking-[2px] flex items-center gap-2 mb-2 font-bold">
                          <Bell size={12} className="text-orange" />
                          Icono Representativo
                        </label>
                        <select
                          value={offerForm.logo}
                          onChange={(e) => setOfferForm({ ...offerForm, logo: e.target.value })}
                          className="w-full bg-white/[0.03] border border-white/10 rounded-xl px-4 py-3 text-sm text-white outline-none focus:border-orange/50 focus:bg-white/[0.05] transition-all appearance-none"
                        >
                          <option value="briefcase" className="bg-[#1a1a1e]">Maletín (Negocios)</option>
                          <option value="car" className="bg-[#1a1a1e]">Coche (Transporte)</option>
                          <option value="utensils" className="bg-[#1a1a1e]">Comida (Restauración)</option>
                          <option value="shield" className="bg-[#1a1a1e]">Escudo (Seguridad)</option>
                          <option value="wrench" className="bg-[#1a1a1e]">Llave (Mecánico)</option>
                          <option value="pill" className="bg-[#1a1a1e]">Píldora (Sanitario)</option>
                        </select>
                      </div>
                    </div>

                    <div className="flex gap-3 pt-2">
                      <button
                        onClick={() => setModal({ type: 'none' })}
                        className="flex-1 px-4 py-3 rounded-xl bg-white/5 text-white/60 font-accent text-lg uppercase tracking-widest hover:bg-white/10 hover:text-white transition-all"
                      >
                        Cancelar
                      </button>
                      <button
                        onClick={async () => {
                          if (editingOfferId) {
                            await handleAction('updateJobOffer', { ...offerForm, id: editingOfferId });
                          } else {
                            await handleAction('createJobOffer', offerForm);
                          }
                          setModal({ type: 'none' });
                          setEditingOfferId(null);
                        }}
                        className="flex-[2] px-4 py-3 rounded-xl bg-orange text-black font-accent text-lg uppercase tracking-widest hover:bg-orange/90 shadow-[0_10px_20px_rgba(255,107,0,0.2)] transition-all"
                      >
                        {editingOfferId ? 'Guardar Cambios' : 'Publicar Oferta'}
                      </button>
                    </div>
                  </div>
                )}

                {modal.type === 'hire' && (
                  <>
                    <div className="text-center space-y-2">
                      <div className="w-16 h-16 rounded-full bg-orange/10 text-orange mx-auto flex items-center justify-center">
                        <UserPlus size={32} />
                      </div>
                      <h3 className="font-accent text-2xl tracking-widest uppercase">Contratar Personal</h3>
                      <p className="text-sm text-white/40">Selecciona a una persona cercana para contratarla.</p>
                    </div>

                    <div className="space-y-2 max-h-60 overflow-y-auto pr-2">
                      {NEARBY_PLAYERS.map(player => (
                        <button
                          key={player.id}
                          onClick={() => handleAction('addEmployee', { message: player.id.toString() })}
                          className="w-full item-premium flex items-center justify-between group !m-0"
                        >
                          <div className="flex flex-col items-start">
                            <span className="text-xs text-white/20 font-mono">ID: {player.id}</span>
                            <span className="font-medium">{player.name}</span>
                          </div>
                          <ChevronRight size={18} className="text-white/20 group-hover:text-orange transition-colors" />
                        </button>
                      ))}
                      {NEARBY_PLAYERS.length === 0 && (
                        <p className="text-center py-4 text-white/20 text-sm italic">No hay personas cerca...</p>
                      )}
                    </div>

                    <div className="pt-4 border-t border-white/5">
                      <div className="space-y-2">
                        <label className="text-[10px] uppercase tracking-widest text-white/40">O ingresa ID manualmente</label>
                        <div className="flex gap-2">
                          <input
                            type="number"
                            placeholder="ID..."
                            className="input-premium flex-1"
                            id="manual-hire-id"
                          />
                          <button
                            onClick={() => {
                              const id = (document.getElementById('manual-hire-id') as HTMLInputElement).value;
                              if (id) handleAction('addEmployee', { message: id });
                            }}
                            className="btn-premium btn-primary"
                          >
                            OK
                          </button>
                        </div>
                      </div>
                    </div>

                    <button
                      onClick={() => setModal({ type: 'none' })}
                      className="btn-premium btn-secondary w-full"
                    >
                      Cerrar
                    </button>
                  </>
                )}

                {modal.type === 'bonus' && (
                  <>
                    <div className="text-center space-y-2">
                      <div className="w-16 h-16 rounded-full bg-emerald-500/10 text-emerald-500 mx-auto flex items-center justify-center">
                        <DollarSign size={32} />
                      </div>
                      <h3 className="font-accent text-2xl tracking-widest uppercase">Confirmar Bono</h3>
                      <p className="text-sm text-white/40">
                        Vas a entregar un bono de <span className="text-emerald-400 font-accent">{stats.currency}{modal.data.amount}</span> a <span className="text-white">{modal.data.target === 'all' ? 'todos los empleados' : 'los empleados conectados'}</span>.
                      </p>

                      {modal.data.target === 'online' && (
                        <div className="bg-black/20 rounded-xl p-4 space-y-2 max-h-40 overflow-y-auto">
                          <p className="text-[10px] uppercase tracking-widest text-white/20 text-left">Beneficiarios ({employees.filter(e => e.isOnline).length})</p>
                          {employees.filter(e => e.isOnline).map(emp => (
                            <div key={emp.identifier} className="flex items-center justify-between text-xs">
                              <span className="text-white/60">{emp.firstname} {emp.lastname}</span>
                              <span className="text-emerald-400/60">{emp.jobgrade}</span>
                            </div>
                          ))}
                        </div>
                      )}

                      {modal.data.reason && (
                        <div className="p-3 bg-white/5 rounded-lg text-xs italic text-white/60">
                          "{modal.data.reason}"
                        </div>
                      )}
                    </div>
                    <div className="flex gap-4">
                      <button
                        onClick={() => setModal({ type: 'none' })}
                        className="btn-premium btn-secondary flex-1"
                      >
                        Cancelar
                      </button>
                      <button
                        onClick={() => handleAction(modal.data.target === 'all' ? 'giveBonusToAllEmployees' : 'giveBonusToOnlineEmployees', { amount: modal.data.amount, reason: modal.data.reason })}
                        className="btn-premium bg-emerald-500 text-white hover:bg-emerald-600 flex-1"
                      >
                        Enviar
                      </button>
                    </div>
                  </>
                )}

                {modal.type === 'admin_point' && (
                  <>
                    <div className="text-center space-y-2">
                      <div className="w-16 h-16 rounded-full bg-orange/10 text-orange mx-auto flex items-center justify-center">
                        <Settings size={32} />
                      </div>
                      <h3 className="font-accent text-2xl tracking-widest uppercase">
                        {modal.data ? 'Editar Punto' : 'Nuevo Punto Boss'}
                      </h3>
                      <p className="text-sm text-white/40">Configura la ubicación y el trabajo de este punto de gestión.</p>
                    </div>

                    <div className="space-y-4">
                      <div className="grid grid-cols-2 gap-4">
                        <div className="space-y-1">
                          <label className="text-[10px] uppercase tracking-widest text-white/40">Nombre del Punto</label>
                          <input
                            type="text"
                            placeholder="Ej: Comisaría"
                            className="input-premium w-full"
                            value={pointForm.name}
                            onChange={(e) => setPointForm({ ...pointForm, name: e.target.value })}
                          />
                        </div>
                        <div className="space-y-1">
                          <label className="text-[10px] uppercase tracking-widest text-white/40">Trabajo (Job)</label>
                          <select
                            className="input-premium w-full appearance-none bg-midnight"
                            value={pointForm.job}
                            onChange={(e) => {
                              const job = e.target.value;
                              setPointForm({
                                ...pointForm,
                                job,
                                account: `society_${job}`
                              });
                            }}
                          >
                            {availableJobs.map(job => (
                              <option key={job.value} value={job.value}>{job.label}</option>
                            ))}
                          </select>
                        </div>
                      </div>

                      <div className="space-y-2">
                        <label className="text-[10px] uppercase tracking-widest text-white/40">Grados con Acceso (Vacio = Todos)</label>
                        <div className="grid grid-cols-2 gap-2 max-h-40 overflow-y-auto pr-2 custom-scrollbar">
                          {(availableJobs.find(j => j.value === pointForm.job) as any)?.grades?.map((grade: any) => {
                            const isSelected = pointForm.grades.includes(grade.value);
                            return (
                              <button
                                key={grade.value}
                                onClick={() => {
                                  if (isSelected) {
                                    setPointForm({ ...pointForm, grades: pointForm.grades.filter(g => g !== grade.value) });
                                  } else {
                                    setPointForm({ ...pointForm, grades: [...pointForm.grades, grade.value] });
                                  }
                                }}
                                className={`flex items-center gap-3 p-3 rounded-xl border transition-all text-left ${isSelected ? 'bg-orange/10 border-orange/40 text-orange' : 'bg-white/5 border-white/5 text-white/40 hover:bg-white/10'}`}
                              >
                                <div className={`w-4 h-4 rounded border flex items-center justify-center shrink-0 ${isSelected ? 'bg-orange border-orange' : 'border-white/20'}`}>
                                  {isSelected && <CheckCircle2 size={12} className="text-black" />}
                                </div>
                                <div className="flex flex-col">
                                  <span className="text-xs font-medium truncate">{grade.label}</span>
                                  <span className="text-[10px] opacity-60 uppercase">Grado {grade.value}</span>
                                </div>
                              </button>
                            );
                          })}
                        </div>
                      </div>

                      <div className="space-y-1">
                        <label className="text-[10px] uppercase tracking-widest text-white/40">Cuenta Sociedad</label>
                        <input
                          type="text"
                          placeholder="Ej: society_police"
                          className="input-premium w-full opacity-60 cursor-not-allowed"
                          value={pointForm.account}
                          readOnly
                        />
                      </div>
                      <div className="space-y-1">
                        <label className="text-[10px] uppercase tracking-widest text-white/40">Coordenadas (X, Y, Z)</label>
                        <div className="flex gap-2">
                          <input
                            type="text"
                            placeholder="0.0, 0.0, 0.0"
                            className="input-premium flex-1 font-mono text-xs"
                            value={formatCoords(pointForm.coords)}
                            onChange={(e) => setPointForm({ ...pointForm, coords: e.target.value })}
                          />
                          <button
                            onClick={async () => {
                              const res = await postNui('getCurrentCoords');
                              if (res && res.coords) {
                                setPointForm({ ...pointForm, coords: res.coords });
                              } else if (isEnvBrowser()) {
                                setPointForm({ ...pointForm, coords: '425.1, -979.5, 30.7' }); // Mock
                              }
                            }}
                            className="btn-premium bg-petrol/20 border-petrol/40 text-petrol hover:bg-petrol/30 px-3"
                            title="Obtener Coords Actuales"
                          >
                            <TrendingUp size={18} />
                          </button>
                        </div>
                      </div>
                    </div>

                    <div className="flex gap-4">
                      <button
                        onClick={() => setModal({ type: 'none' })}
                        className="btn-premium btn-secondary flex-1"
                      >
                        Cancelar
                      </button>
                      <button
                        onClick={() => {
                          if (modal.data) {
                            handleAction('editBossPoint', { id: modal.data.id, ...pointForm });
                          } else {
                            handleAction('createBossPoint', pointForm);
                          }
                        }}
                        className="btn-premium btn-primary flex-1"
                      >
                        {modal.data ? 'Guardar' : 'Crear Punto'}
                      </button>
                    </div>
                  </>
                )}

                {modal.type === 'delete_point' && (
                  <>
                    <div className="text-center space-y-2">
                      <div className="w-16 h-16 rounded-full bg-red-500/10 text-red-500 mx-auto flex items-center justify-center">
                        <X size={32} />
                      </div>
                      <h3 className="font-accent text-2xl tracking-widest uppercase">Eliminar Punto</h3>
                      <p className="text-sm text-white/40">
                        ¿Seguro que quieres eliminar el punto <span className="text-white font-medium">{modal.data.name}</span>? Esta acción no se puede deshacer.
                      </p>
                    </div>
                    <div className="flex gap-4">
                      <button
                        onClick={() => setModal({ type: 'none' })}
                        className="btn-premium btn-secondary flex-1"
                      >
                        No, cancelar
                      </button>
                      <button
                        onClick={() => handleAction('deleteBossPoint', { id: modal.data.id })}
                        className="btn-premium bg-red-500 text-white hover:bg-red-600 flex-1"
                      >
                        Sí, eliminar
                      </button>
                    </div>
                  </>
                )}
                {modal.type === 'salary_edit' && (
                  <>
                    <div className="text-center space-y-2">
                      <div className="w-16 h-16 rounded-full bg-emerald-500/10 text-emerald-500 mx-auto flex items-center justify-center">
                        <TrendingUp size={32} />
                      </div>
                      <h3 className="font-accent text-2xl tracking-widest uppercase">Editar Salario</h3>
                      <p className="text-sm text-white/40">
                        Ajustando el salario base para el rango <span className="text-white font-medium">{modal.data.label}</span>.
                      </p>
                    </div>

                    <div className="space-y-4">
                      <div className="space-y-1">
                        <label className="text-[10px] uppercase tracking-widest text-white/40">Nuevo Salario</label>
                        <div className="relative">
                          <DollarSign className="absolute left-4 top-1/2 -translate-y-1/2 text-emerald-400" size={20} />
                          <input
                            type="number"
                            placeholder="0.00"
                            className="input-premium w-full pl-12 py-4 text-2xl font-accent"
                            value={salaryInput}
                            onChange={(e) => setSalaryInput(e.target.value)}
                          />
                        </div>
                      </div>
                    </div>

                    <div className="flex gap-4">
                      <button
                        onClick={() => setModal({ type: 'none' })}
                        className="btn-premium btn-secondary flex-1"
                      >
                        Cancelar
                      </button>
                      <button
                        onClick={() => handleAction('changeSalary', { grade: modal.data.grade, salary: salaryInput })}
                        className="btn-premium btn-primary flex-1"
                      >
                        Guardar
                      </button>
                    </div>
                  </>
                )}

                {modal.type === 'payment_edit' && (
                  <div className="space-y-8 py-4">
                    <div className="text-center relative">
                      <div className="absolute -top-10 left-1/2 -translate-x-1/2 w-24 h-24 bg-petrol/5 rounded-full blur-2xl" />
                      <div className="w-16 h-16 rounded-2xl bg-black/40 border border-petrol/20 text-petrol mx-auto flex items-center justify-center shadow-lg mb-4 relative z-10 group-hover:scale-110 transition-transform">
                        <Clock size={32} className="drop-shadow-[0_0_8px_rgba(0,183,255,0.4)]" />
                      </div>
                      <h3 className="font-accent text-3xl tracking-widest uppercase text-white mb-2">Editar Horario</h3>
                      <p className="text-xs text-white/40 max-w-[280px] mx-auto leading-relaxed">
                        Configura la hora exacta del ciclo de pago automático para <span className="text-petrol font-medium">{modal.data.pointName}</span>.
                      </p>
                    </div>

                    <div className="space-y-6">
                      <div className="container-premium bg-black/40 border-petrol/20 p-6 relative overflow-hidden group">
                        <div className="absolute top-0 right-0 p-2 opacity-5">
                          <History size={48} />
                        </div>
                        <label className="text-[10px] uppercase tracking-[0.2em] text-petrol mb-4 block font-accent">Hora de Pago (Formato 24h)</label>
                        <div className="relative">
                          <input
                            type="time"
                            className="input-premium w-full py-6 text-4xl font-accent text-center tracking-[0.2em] bg-black/40 border-petrol/30 focus:border-petrol text-white drop-shadow-[0_0_10px_rgba(0,183,255,0.1)]"
                            value={paymentTimeInput}
                            onChange={(e) => setPaymentTimeInput(e.target.value)}
                          />
                          <div className="absolute inset-y-0 right-4 flex items-center pointer-events-none text-petrol/40">
                            <Clock size={20} />
                          </div>
                        </div>
                      </div>
                    </div>

                    <div className="flex gap-4">
                      <button
                        onClick={() => setModal({ type: 'none' })}
                        className="btn-premium bg-white/5 border-white/10 hover:bg-white/10 text-white/60 flex-1 py-4 text-xs tracking-widest uppercase font-accent"
                      >
                        Cancelar
                      </button>
                      <button
                        onClick={() => handleAction('updatePaymentSchedule', { id: modal.data.id, time: paymentTimeInput })}
                        className="btn-premium bg-petrol text-black hover:bg-petrol/90 shadow-lg shadow-petrol/20 flex-1 py-4 text-xs tracking-widest uppercase font-accent"
                      >
                        Aplicar Cambios
                      </button>
                    </div>
                  </div>
                )}
              </motion.div>
            </motion.div>
          )}
        </AnimatePresence>



        <motion.div
          initial={{ opacity: 0, scale: 0.9, y: 20 }}
          animate={{ opacity: 1, scale: 1, y: 0 }}
          className="container-premium w-full max-w-6xl h-[800px] flex relative"
        >
          {/* Sidebar */}
          <div className="w-64 bg-black/20 border-r border-white/5 flex flex-col">
            <div className="p-8 flex flex-col items-center gap-4">
              <div className="w-20 h-20 rounded-2xl bg-gradient-to-br from-orange to-petrol p-0.5 shadow-lg shadow-orange/20">
                <div className="w-full h-full bg-midnight rounded-[14px] flex items-center justify-center overflow-hidden">
                  <img
                    src="https://r2.fivemanage.com/7eE9bRZZNtIRxfBqnOxDV/mtlogo.png"
                    alt="Logo"
                    className="w-12 h-12 object-contain"
                    referrerPolicy="no-referrer"
                  />
                </div>
              </div>
              <div className="text-center">
                <h1 className="font-accent text-xl tracking-widest text-orange">UNIQUEVIBE</h1>
                <p className="text-[10px] uppercase tracking-[0.2em] text-white/40">Elite Management</p>
              </div>
            </div>

            <nav className="flex-1 px-4 py-2 space-y-1">
              <SidebarItem
                active={activeTab === 'dashboard'}
                icon={<LayoutDashboard size={20} />}
                label="Dashboard"
                onClick={() => setActiveTab('dashboard')}
              />
              <SidebarItem
                active={activeTab === 'employees'}
                icon={<Users size={20} />}
                label="Empleados"
                onClick={() => setActiveTab('employees')}
              />
              <SidebarItem
                active={activeTab === 'salaries'}
                icon={<TrendingUp size={20} />}
                label="Salarios"
                onClick={() => setActiveTab('salaries')}
              />
              <SidebarItem
                active={activeTab === 'bonus'}
                icon={<Award size={20} />}
                label="Bonificaciones"
                onClick={() => setActiveTab('bonus')}
              />
              <SidebarItem
                active={activeTab === 'finance'}
                icon={<Wallet size={20} />}
                label="Finanzas"
                onClick={() => setActiveTab('finance')}
              />
              <SidebarItem
                active={activeTab === 'employment'}
                icon={<Briefcase size={20} />}
                label="Empleo"
                onClick={() => {
                  setActiveTab('employment');
                  postNui('getJobOffers');
                  postNui('getApplications');
                }}
              />
            </nav>

            <div className="p-4 border-t border-white/5">
              <button
                onClick={handleClose}
                className="w-full flex items-center gap-3 px-4 py-3 rounded-xl text-white/60 hover:text-red-400 hover:bg-red-400/10 transition-all duration-300 group"
              >
                <LogOut size={20} className="group-hover:-translate-x-1 transition-transform" />
                <span className="font-accent tracking-widest uppercase text-sm">Cerrar Menú</span>
              </button>
            </div>
          </div>

          {/* Main Content */}
          <div className="flex-1 flex flex-col overflow-hidden bg-gradient-to-br from-transparent to-white/[0.02]">
            <header className="header-premium flex items-center justify-between px-8 py-6">
              <div className="flex flex-col">
                <span className="text-xs text-white/40 tracking-[0.3em] font-main mb-1">GESTIÓN DE SOCIEDAD</span>
                <span className="text-3xl">
                  {activeTab === 'admin' ? 'Administración' : activeTab.replace(/^\w/, c => c.toUpperCase())}
                </span>
              </div>

              <div className="flex items-center gap-6">
                <div className="flex flex-col items-end">
                  <span className="text-[10px] text-white/40 tracking-widest uppercase">Balance Total</span>
                  <span className="text-2xl font-accent text-orange tracking-tighter">
                    {stats.currency}{stats.account}
                  </span>
                </div>
                <div className="h-10 w-[1px] bg-white/10" />
                {isAdmin && (
                  <div className="flex items-center gap-3">
                    <button
                      onClick={() => setActiveTab('admin')}
                      className={`w-10 h-10 rounded-full flex items-center justify-center border transition-all ${activeTab === 'admin' ? 'bg-orange border-orange text-black' : 'bg-white/5 border-white/10 text-white/40 hover:text-white hover:bg-white/10'}`}
                    >
                      <Settings size={18} />
                    </button>
                  </div>
                )}
              </div>
            </header>

            <main className="flex-1 overflow-y-auto p-8">
              <AnimatePresence mode="wait">
                {activeTab === 'dashboard' && (
                  <motion.div
                    key="dashboard"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    className="space-y-8"
                  >
                    <div className="grid grid-cols-3 gap-6">
                      <StatCard
                        icon={<Users className="text-orange" />}
                        label="Empleados Totales"
                        value={stats.employeesamount}
                        sub="Contratados"
                      />
                      <StatCard
                        icon={<TrendingUp className="text-petrol" />}
                        label="En Servicio"
                        value={stats.ondutyamount}
                        sub="Actualmente"
                      />
                      <StatCard
                        icon={<Wallet className="text-emerald-400" />}
                        label="Balance"
                        value={`${stats.currency}${stats.account}`}
                        sub="Disponible"
                      />
                    </div>

                    <div className="grid grid-cols-2 gap-8">
                      <div className="space-y-4">
                        <h3 className="font-accent text-lg tracking-widest text-white/60 uppercase">Acciones Rápidas</h3>
                        <div className="grid grid-cols-2 gap-4">
                          <QuickAction
                            icon={<UserPlus size={24} />}
                            label="Contratar"
                            onClick={() => setActiveTab('employees')}
                          />
                          <QuickAction
                            icon={<Award size={24} />}
                            label="Dar Bono"
                            onClick={() => setActiveTab('bonus')}
                          />
                          <QuickAction
                            icon={<ArrowUpCircle size={24} />}
                            label="Depositar"
                            onClick={() => setActiveTab('finance')}
                          />
                          <QuickAction
                            icon={<ArrowDownCircle size={24} />}
                            label="Retirar"
                            onClick={() => setActiveTab('finance')}
                          />
                        </div>
                      </div>

                      <div className="bg-white/5 rounded-2xl border border-white/5 p-6 flex flex-col justify-center relative overflow-hidden group">
                        <div className="absolute top-0 right-0 w-32 h-32 bg-orange/10 blur-3xl rounded-full -translate-y-1/2 translate-x-1/2 group-hover:bg-orange/20 transition-colors" />
                        <h3 className="font-accent text-xl mb-2 tracking-widest">ESTADO DE EMPRESA</h3>
                        <p className="text-sm text-white/40 leading-relaxed">
                          Tu sociedad se encuentra en un estado óptimo. El balance ha crecido un 12% esta semana.
                        </p>
                        <div className="mt-6 h-2 w-full bg-white/5 rounded-full overflow-hidden">
                          <motion.div
                            initial={{ width: 0 }}
                            animate={{ width: '75%' }}
                            className="h-full bg-gradient-to-r from-orange to-petrol"
                          />
                        </div>
                        <div className="mt-2 flex justify-between text-[10px] uppercase tracking-widest text-white/40">
                          <span>Eficiencia</span>
                          <span>75%</span>
                        </div>
                      </div>
                    </div>
                  </motion.div>
                )}

                {activeTab === 'employees' && (
                  <motion.div
                    key="employees"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    className="space-y-6"
                  >
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-4">
                        <div className="relative w-96">
                          <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-white/20" size={18} />
                          <input
                            type="text"
                            placeholder="Buscar empleado por nombre o rango..."
                            className="input-premium w-full pl-12 py-3"
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                          />
                        </div>
                        <button
                          onClick={() => setFilterOnline(!filterOnline)}
                          className={`btn-premium flex items-center gap-2 border ${filterOnline ? 'bg-emerald-500/20 border-emerald-500 text-emerald-400' : 'bg-white/5 border-white/5 text-white/40'}`}
                        >
                          <div className={`w-2 h-2 rounded-full ${filterOnline ? 'bg-emerald-400 animate-pulse' : 'bg-white/20'}`} />
                          Solo Online
                        </button>
                      </div>
                      <button
                        onClick={() => setModal({ type: 'hire' })}
                        className="btn-premium btn-primary flex items-center gap-2"
                      >
                        <UserPlus size={18} />
                        Contratar Nuevo
                      </button>
                    </div>

                    <div className="container-premium bg-black/20">
                      <table className="w-full text-left border-collapse">
                        <thead>
                          <tr className="border-b border-white/5 font-accent tracking-widest text-white/40 text-sm uppercase">
                            <th className="px-6 py-4 font-medium">Empleado</th>
                            <th className="px-6 py-4 font-medium">Rango</th>
                            <th className="px-6 py-4 font-medium">Salario</th>
                            <th className="px-6 py-4 font-medium text-right">Acciones</th>
                          </tr>
                        </thead>
                        <tbody className="divide-y divide-white/5">
                          {filteredEmployees.map(emp => (
                            <tr key={emp.identifier} className="group hover:bg-white/[0.02] transition-colors">
                              <td className="px-6 py-4">
                                <div className="flex items-center gap-3">
                                  <div className="relative">
                                    <div className="w-10 h-10 rounded-xl bg-orange/10 flex items-center justify-center text-orange font-accent text-lg">
                                      {emp.firstname[0]}{emp.lastname[0]}
                                    </div>
                                    {emp.isOnline && (
                                      <div className="absolute -top-1 -right-1 w-3 h-3 bg-emerald-500 border-2 border-color-bg-dark rounded-full shadow-[0_0_10px_rgba(16,185,129,0.5)]" />
                                    )}
                                  </div>
                                  <div className="flex flex-col">
                                    <span className="font-medium">{emp.firstname} {emp.lastname}</span>
                                    <span className="text-[10px] text-white/20 font-mono">{emp.identifier}</span>
                                  </div>
                                </div>
                              </td>
                              <td className="px-6 py-4">
                                <span className="px-3 py-1 rounded-full bg-white/5 border border-white/5 text-xs text-white/60">
                                  {emp.jobgrade}
                                </span>
                              </td>
                              <td className="px-6 py-4">
                                <span className="text-emerald-400 font-accent tracking-wider">
                                  {stats.currency}{emp.salary}
                                </span>
                              </td>
                              <td className="px-6 py-4">
                                <div className="flex items-center justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
                                  <ActionButton
                                    icon={<ArrowUpCircle size={16} />}
                                    color="text-petrol"
                                    onClick={() => handleAction('promoteEmployee', { employee: emp })}
                                    tooltip="Ascender"
                                  />
                                  <ActionButton
                                    icon={<ArrowDownCircle size={16} />}
                                    color="text-orange"
                                    onClick={() => handleAction('demoteEmployee', { employee: emp })}
                                    tooltip="Degradar"
                                  />
                                  <ActionButton
                                    icon={<UserMinus size={16} />}
                                    color="text-red-400"
                                    onClick={() => setModal({ type: 'fire', data: emp })}
                                    tooltip="Despedir"
                                  />
                                </div>
                              </td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    </div>
                  </motion.div>
                )}

                {activeTab === 'salaries' && (
                  <motion.div
                    key="salaries"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    className="grid grid-cols-2 gap-8"
                  >
                    <div className="space-y-6">
                      <div className="flex flex-col">
                        <h3 className="font-accent text-2xl tracking-widest text-orange uppercase">Gestión de Nómina</h3>
                        <p className="text-sm text-white/40">Ajusta los salarios base para cada rango de la sociedad.</p>
                      </div>

                      <div className="space-y-3">
                        {salaries.map(grade => (
                          <div key={grade.grade} className="item-premium flex items-center justify-between group">
                            <div className="flex flex-col">
                              <span className="text-xs text-white/40 uppercase tracking-widest">Rango {grade.grade}</span>
                              <span className="text-lg font-medium">{grade.label}</span>
                            </div>
                            <div className="flex items-center gap-4">
                              <div className="text-right">
                                <span className="text-xs text-white/40 block">Salario Actual</span>
                                <span className="text-xl font-accent text-emerald-400">{stats.currency}{grade.salary}</span>
                              </div>
                              <button
                                onClick={() => setModal({ type: 'salary_edit', data: grade })}
                                className="w-10 h-10 rounded-lg bg-white/5 border border-white/5 flex items-center justify-center hover:bg-orange hover:text-black transition-all"
                              >
                                <DollarSign size={18} />
                              </button>
                            </div>
                          </div>
                        ))}
                      </div>
                    </div>

                    <div className="bg-white/5 rounded-2xl border border-white/5 p-8 flex flex-col items-center justify-center text-center space-y-6">
                      <div className="w-20 h-20 rounded-full bg-orange/10 flex items-center justify-center text-orange">
                        <TrendingUp size={40} />
                      </div>
                      <div className="space-y-2">
                        <h4 className="font-accent text-xl tracking-widest uppercase">Información Salarial</h4>
                        <p className="text-sm text-white/40 leading-relaxed max-w-xs">
                          Los cambios en los salarios se aplican inmediatamente. Asegúrate de tener fondos suficientes en la sociedad para cubrir los pagos automáticos.
                        </p>
                      </div>
                      <div className="w-full pt-6 border-t border-white/5 grid grid-cols-2 gap-4">
                        <div className="p-4 bg-black/20 rounded-xl">
                          <span className="text-[10px] uppercase tracking-widest text-white/40 block mb-1">Gasto Diario Est.</span>
                          <span className="text-xl font-accent text-orange">$12.500</span>
                        </div>
                        <div className="p-4 bg-black/20 rounded-xl">
                          <span className="text-[10px] uppercase tracking-widest text-white/40 block mb-1">Próximo Pago</span>
                          <span className="text-xl font-accent text-petrol">12:00 PM</span>
                        </div>
                      </div>
                    </div>
                  </motion.div>
                )}

                {activeTab === 'bonus' && (
                  <motion.div
                    key="bonus"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    className="max-w-2xl mx-auto space-y-8"
                  >
                    <div className="text-center space-y-2">
                      <h3 className="font-accent text-3xl tracking-widest text-orange uppercase">Sistema de Bonos</h3>
                      <p className="text-sm text-white/40">Recompensa el esfuerzo de tus empleados con bonificaciones directas.</p>
                    </div>

                    <div className="container-premium bg-black/20 p-8 space-y-6">
                      <div className="space-y-4">
                        <label className="text-xs uppercase tracking-widest text-white/40">Monto del Bono</label>
                        <div className="relative">
                          <DollarSign className="absolute left-4 top-1/2 -translate-y-1/2 text-orange" size={20} />
                          <input
                            type="number"
                            placeholder="0.00"
                            className="input-premium w-full pl-12 py-4 text-2xl font-accent"
                            id="bonus-amount"
                          />
                        </div>
                      </div>

                      <div className="space-y-4">
                        <label className="text-xs uppercase tracking-widest text-white/40">Razón (Opcional)</label>
                        <textarea
                          placeholder="Buen desempeño, evento especial, etc..."
                          className="input-premium w-full h-24 resize-none"
                          id="bonus-reason"
                        />
                      </div>

                      <div className="grid grid-cols-2 gap-4 pt-4">
                        <button
                          onClick={() => {
                            const amount = (document.getElementById('bonus-amount') as HTMLInputElement).value;
                            const reason = (document.getElementById('bonus-reason') as HTMLTextAreaElement).value;
                            if (amount) setModal({ type: 'bonus', data: { amount, reason, target: 'all' } });
                          }}
                          className="btn-premium btn-primary py-4 flex flex-col items-center gap-1"
                        >
                          <span className="text-lg">Todos</span>
                          <span className="text-[10px] opacity-60">Toda la plantilla</span>
                        </button>
                        <button
                          onClick={() => {
                            const amount = (document.getElementById('bonus-amount') as HTMLInputElement).value;
                            const reason = (document.getElementById('bonus-reason') as HTMLTextAreaElement).value;
                            if (amount) setModal({ type: 'bonus', data: { amount, reason, target: 'online' } });
                          }}
                          className="btn-premium btn-secondary py-4 flex flex-col items-center gap-1"
                        >
                          <span className="text-lg">Online</span>
                          <span className="text-[10px] opacity-60">Solo conectados</span>
                        </button>
                      </div>
                    </div>
                  </motion.div>
                )}

                {activeTab === 'finance' && (
                  <motion.div
                    key="finance"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    className="grid grid-cols-2 gap-8"
                  >
                    <FinanceBox
                      type="deposit"
                      title="Depositar Fondos"
                      desc="Añade dinero de tu bolsillo a la cuenta de la sociedad."
                      icon={<ArrowUpCircle size={32} />}
                      onAction={(amount) => handleAction('deposit', { amount })}
                    />
                    <FinanceBox
                      type="withdraw"
                      title="Retirar Fondos"
                      desc="Extrae dinero de la sociedad para uso personal."
                      icon={<ArrowDownCircle size={32} />}
                      onAction={(amount) => handleAction('withdraw', { amount })}
                    />
                  </motion.div>
                )}

                {activeTab === 'employment' && (
                  <motion.div
                    key="employment"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    className="h-full flex flex-col space-y-6 overflow-hidden"
                  >
                    <div className="flex items-center justify-between">
                      <div className="flex flex-col">
                        <h3 className="font-accent text-2xl tracking-widest text-orange uppercase">Gestión de Empleo</h3>
                        <p className="text-sm text-white/40">Gestiona las ofertas de tu empresa y revisa postulaciones.</p>
                      </div>
                    </div>

                    <div className="flex gap-2 p-1 bg-white/5 rounded-xl w-fit">
                      <button
                        onClick={() => setEmploymentSubTab('offers')}
                        className={`flex items-center gap-2 px-6 py-2 rounded-lg font-accent text-xs tracking-widest uppercase transition-all ${employmentSubTab === 'offers' ? 'bg-orange text-black shadow-lg shadow-orange/20' : 'text-white/40 hover:text-white hover:bg-white/5'}`}
                      >
                        <Briefcase size={14} />
                        Ofertas Activas
                      </button>
                      <button
                        onClick={() => setEmploymentSubTab('applications')}
                        className={`flex items-center gap-2 px-6 py-2 rounded-lg font-accent text-xs tracking-widest uppercase transition-all ${employmentSubTab === 'applications' ? 'bg-orange text-black shadow-lg shadow-orange/20' : 'text-white/40 hover:text-white hover:bg-white/5'}`}
                      >
                        <FileText size={14} />
                        Postulaciones
                      </button>
                    </div>

                    <AnimatePresence mode="wait">
                      {employmentSubTab === 'offers' && (
                        <motion.div
                          key="sub-offers"
                          initial={{ opacity: 0, x: -10 }}
                          animate={{ opacity: 1, x: 0 }}
                          exit={{ opacity: 0, x: 10 }}
                          className="flex-1 flex flex-col space-y-4 overflow-hidden"
                        >
                          <div className="flex justify-end">
                            <button
                              onClick={() => {
                                setEditingOfferId(null);
                                setModal({ type: 'create_offer' });
                                setOfferForm({ 
                                  business_name: stats.jobLabel || stats.jobName,
                                  position: salaries[0]?.label || '',
                                  salary: '',
                                  benefits: '',
                                  description: '',
                                  logo: 'briefcase'
                                });
                              }}
                              className="btn-premium btn-primary flex items-center gap-2"
                            >
                              <UserPlus size={18} />
                              Nueva Oferta
                            </button>
                          </div>
                          <div className="flex-1 overflow-y-auto pr-2 custom-scrollbar space-y-4">
                            {offers.filter(o => isAdmin || (stats?.jobName && (o.job === stats.jobName || o.business_name === stats.jobName || o.position.toLowerCase().includes(stats.jobName.toLowerCase())))).map(offer => (
                              <div key={offer.id} className="item-premium flex items-center justify-between group">
                                <div className="flex items-center gap-4">
                                  <div className="w-12 h-12 rounded-xl bg-orange/10 flex items-center justify-center text-orange font-accent text-lg">
                                    {offer.business_name[0]}
                                  </div>
                                  <div className="flex flex-col">
                                    <span className="font-medium text-lg">{offer.position}</span>
                                    <span className="text-[10px] uppercase tracking-widest text-white/20">{offer.salary}</span>
                                  </div>
                                </div>
                                  <div className="flex gap-2">
                                    <button
                                      onClick={() => {
                                        setOfferForm({
                                          business_name: offer.business_name,
                                          position: offer.position,
                                          salary: offer.salary,
                                          benefits: offer.benefits,
                                          description: offer.description,
                                          logo: offer.logo || 'briefcase'
                                        });
                                        setEditingOfferId(offer.id);
                                        setModal({ type: 'create_offer' });
                                      }}
                                      className="w-10 h-10 rounded-lg bg-orange/10 border border-orange/20 text-orange flex items-center justify-center hover:bg-orange hover:text-black transition-all"
                                    >
                                      <Edit2 size={18} />
                                    </button>
                                    <button
                                      onClick={() => handleAction('deleteOffer', { id: offer.id })}
                                      className="w-10 h-10 rounded-lg bg-petrol/10 border border-petrol/20 text-petrol flex items-center justify-center hover:bg-petrol hover:text-black transition-all"
                                    >
                                      <X size={18} />
                                    </button>
                                  </div>
                              </div>
                            ))}
                            {offers.length === 0 && (
                              <div className="text-center py-12 text-white/20 italic">No hay ofertas publicadas para esta empresa.</div>
                            )}
                          </div>
                        </motion.div>
                      )}

                      {employmentSubTab === 'applications' && (
                        <motion.div
                          key="sub-apps"
                          initial={{ opacity: 0, x: -10 }}
                          animate={{ opacity: 1, x: 0 }}
                          exit={{ opacity: 0, x: 10 }}
                          className="flex-1 overflow-y-auto pr-2 custom-scrollbar space-y-4"
                        >
                          {applications.map(app => (
                            <div key={app.id} className="item-premium flex flex-col gap-4 group border-l-2 border-l-petrol/30">
                              <div className="flex items-center justify-between border-b border-white/5 pb-3">
                                <div className="flex items-center gap-4">
                                  <div className="w-12 h-12 rounded-xl bg-petrol/10 flex items-center justify-center text-petrol font-accent text-lg shadow-inner">
                                    {app.name[0]}
                                  </div>
                                  <div className="flex flex-col">
                                    <span className="font-accent text-lg text-white tracking-wide uppercase">{app.name}</span>
                                    <div className="flex items-center gap-3">
                                      <div className="flex items-center gap-1">
                                        <Calendar size={10} className="text-petrol" />
                                        <span className="text-[10px] text-white/40 uppercase">{app.age} años</span>
                                      </div>
                                      <div className="w-px h-2 bg-white/10" />
                                      <div className="flex items-center gap-1">
                                        <Phone size={10} className="text-petrol" />
                                        <span className="text-[10px] text-white/60 font-mono tracking-wider">{app.phone}</span>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div className="flex flex-col items-end">
                                  <span className="text-[9px] text-white/20 uppercase tracking-tighter">Recibida</span>
                                  <span className="text-[10px] text-white/40 font-mono">{app.time}</span>
                                </div>
                              </div>
                              
                              <div className="space-y-2">
                                <div className="flex items-center gap-2 text-[9px] uppercase tracking-widest text-white/20 font-bold">
                                  <FileText size={10} className="text-petrol" />
                                  Experiencia y Perfil
                                </div>
                                <div className="p-4 bg-white/[0.02] rounded-xl border border-white/5 relative overflow-hidden group-hover:bg-white/[0.04] transition-all">
                                  <div className="absolute top-0 left-0 w-1 h-full bg-petrol/20" />
                                  <p className="text-sm text-white/70 leading-relaxed italic">"{app.experience}"</p>
                                </div>
                              </div>
                              <div className="flex gap-2">
                                <button className="btn-premium btn-primary flex-1 py-2 text-xs">Contratar</button>
                                <button
                                  onClick={() => handleAction('deleteApplication', { id: app.id })}
                                  className="w-10 rounded-lg bg-white/5 border border-white/5 flex items-center justify-center text-white/40 hover:text-petrol hover:border-petrol/30 transition-all"
                                >
                                  <X size={16} />
                                </button>
                              </div>
                            </div>
                          ))}
                          {applications.length === 0 && (
                            <div className="text-center py-12 text-white/20 italic">No se han recibido postulaciones aún.</div>
                          )}
                        </motion.div>
                      )}
                    </AnimatePresence>
                  </motion.div>
                )}

                {activeTab === 'admin' && (
                  <motion.div
                    key="admin"
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -10 }}
                    className="h-full flex flex-col space-y-6 overflow-hidden"
                  >
                    <div className="flex items-center justify-between">
                      <div className="flex flex-col">
                        <h3 className="font-accent text-2xl tracking-widest text-orange uppercase">Panel de Administración</h3>
                        <p className="text-sm text-white/40">Configuración avanzada de UniqueVibe.</p>
                      </div>
                    </div>

                    {/* Sub-navigation */}
                    <div className="flex gap-2 p-1 bg-white/5 rounded-xl w-fit">
                      <button
                        onClick={() => setAdminSubTab('points')}
                        className={`flex items-center gap-2 px-6 py-2 rounded-lg font-accent text-xs tracking-widest uppercase transition-all ${adminSubTab === 'points' ? 'bg-orange text-black shadow-lg shadow-orange/20' : 'text-white/40 hover:text-white hover:bg-white/5'}`}
                      >
                        <Settings size={14} />
                        Puntos
                      </button>
                      <button
                        onClick={() => setAdminSubTab('billing')}
                        className={`flex items-center gap-2 px-6 py-2 rounded-lg font-accent text-xs tracking-widest uppercase transition-all ${adminSubTab === 'billing' ? 'bg-orange text-black shadow-lg shadow-orange/20' : 'text-white/40 hover:text-white hover:bg-white/5'}`}
                      >
                        <CreditCard size={14} />
                        Billing
                      </button>
                      <button
                        onClick={() => setAdminSubTab('payments')}
                        className={`flex items-center gap-2 px-6 py-2 rounded-lg font-accent text-xs tracking-widest uppercase transition-all ${adminSubTab === 'payments' ? 'bg-orange text-black shadow-lg shadow-orange/20' : 'text-white/40 hover:text-white hover:bg-white/5'}`}
                      >
                        <Clock size={14} />
                        Pagos
                      </button>
                    </div>

                    <AnimatePresence mode="wait">
                      {adminSubTab === 'points' && (
                        <motion.div
                          key="sub-points"
                          initial={{ opacity: 0, x: -10 }}
                          animate={{ opacity: 1, x: 0 }}
                          exit={{ opacity: 0, x: 10 }}
                          className="flex-1 flex flex-col space-y-4 overflow-hidden"
                        >
                          <div className="flex justify-end">
                            <button
                              onClick={() => setModal({ type: 'admin_point' })}
                              className="btn-premium btn-primary flex items-center gap-2"
                            >
                              <UserPlus size={18} />
                              Crear Punto
                            </button>
                          </div>
                          <div className="flex-1 overflow-y-auto pr-2 custom-scrollbar space-y-4">
                            {bossPoints.map(point => (
                              <div key={point.id} className="item-premium flex items-center justify-between group">
                                <div className="flex items-center gap-4">
                                  <div className="w-12 h-12 rounded-xl bg-white/5 flex items-center justify-center text-orange">
                                    {point.job === 'police' ? <Award size={24} /> : point.job === 'ambulance' ? <Bell size={24} /> : <Settings size={24} />}
                                  </div>
                                  <div className="flex flex-col">
                                    <span className="font-medium text-lg">{point.name}</span>
                                    <div className="flex items-center gap-3 text-[10px] uppercase tracking-widest text-white/20">
                                      <span>Job: <span className="text-orange/60">{point.job}</span></span>
                                      <span>Cuenta: <span className="text-petrol/60">{point.account}</span></span>
                                    </div>
                                  </div>
                                </div>

                                <div className="flex items-center gap-2">
                                  <div className="text-right mr-4">
                                    <span className="text-[10px] uppercase tracking-widest text-white/20 block">Ubicación</span>
                                    <span className="text-xs font-mono text-white/40">{formatCoords(point.coords)}</span>
                                  </div>
                                  <ActionButton
                                    icon={<Settings size={16} />}
                                    color="text-petrol"
                                    onClick={() => setModal({ type: 'admin_point', data: point })}
                                    tooltip="Editar"
                                  />
                                  <ActionButton
                                    icon={<X size={16} />}
                                    color="text-red-400"
                                    onClick={() => setModal({ type: 'delete_point', data: point })}
                                    tooltip="Eliminar"
                                  />
                                </div>
                              </div>
                            ))}
                          </div>
                        </motion.div>
                      )}

                      {adminSubTab === 'billing' && (
                        <motion.div
                          key="sub-billing"
                          initial={{ opacity: 0, x: -10 }}
                          animate={{ opacity: 1, x: 0 }}
                          exit={{ opacity: 0, x: 10 }}
                          className="flex-1 overflow-hidden"
                        >
                          <div className="grid grid-cols-3 gap-6 h-full">
                            <div className="col-span-2 flex flex-col h-full overflow-hidden">
                              <div className="container-premium bg-black/20 p-6 flex flex-col h-full overflow-hidden">
                                <div className="flex items-center gap-4 mb-6 shrink-0">
                                  <div className="w-12 h-12 rounded-xl bg-orange/10 flex items-center justify-center text-orange">
                                    <CreditCard size={24} />
                                  </div>
                                  <div>
                                    <h4 className="font-accent text-lg tracking-widest uppercase">Permisos de Facturación</h4>
                                    <p className="text-xs text-white/40">Controla qué sociedades pueden emitir cobros a ciudadanos.</p>
                                  </div>
                                </div>

                                <div className="flex items-center justify-between mb-8 pb-6 border-b border-white/5 shrink-0">
                                  <div className="flex items-center gap-4">
                                    <div className={`w-12 h-12 rounded-xl transition-colors flex items-center justify-center ${stats.billingEnabled ? 'bg-emerald-500/10 text-emerald-500' : 'bg-red-500/10 text-red-500'}`}>
                                      <Power size={24} />
                                    </div>
                                    <div>
                                      <h4 className="font-accent text-lg tracking-widest uppercase">Sistema de Facturación</h4>
                                      <p className="text-xs text-white/40">{stats.billingEnabled ? 'El sistema está activo globalmente.' : 'El sistema está desactivado.'}</p>
                                    </div>
                                  </div>
                                  <button
                                    onClick={() => {
                                      setStats({ ...stats, billingEnabled: !stats.billingEnabled });
                                      handleAction('toggleBillingSystem', { enabled: !stats.billingEnabled });
                                    }}
                                    className={`relative w-16 h-8 rounded-full transition-all duration-300 shadow-lg ${stats.billingEnabled ? 'bg-emerald-500 shadow-emerald-500/40' : 'bg-white/10'}`}
                                  >
                                    <div className={`absolute top-1 w-6 h-6 rounded-full transition-all duration-300 ${stats.billingEnabled ? 'left-9 bg-white shadow-md' : 'left-1 bg-white/40'}`} />
                                  </button>
                                </div>

                                <div className="grid grid-cols-2 gap-3 overflow-y-auto pr-2 custom-scrollbar">
                                  {availableJobs.map(job => {
                                    const isEnabled = billingSettings.find(s => s.job === job.value)?.enabled;
                                    return (
                                      <div key={job.value} className="group p-4 bg-white/5 rounded-xl border border-white/5 hover:border-orange/30 transition-all flex items-center justify-between">
                                        <div className="flex items-center gap-3">
                                          <div className={`w-8 h-8 rounded-lg flex items-center justify-center ${isEnabled ? 'bg-emerald-500/20 text-emerald-500' : 'bg-white/5 text-white/20'}`}>
                                            {isEnabled ? <CheckCircle2 size={16} /> : <AlertCircle size={16} />}
                                          </div>
                                          <span className="font-medium text-xs tracking-wide">{job.label}</span>
                                        </div>
                                        <button
                                          onClick={() => {
                                            const newSettings = billingSettings.map(s => s.job === job.value ? { ...s, enabled: !s.enabled } : s);
                                            if (!billingSettings.find(s => s.job === job.value)) {
                                              newSettings.push({ job: job.value, enabled: true });
                                            }
                                            setBillingSettings(newSettings);
                                            handleAction('updateBillingPermission', { job: job.value, enabled: !isEnabled });
                                          }}
                                          className={`relative w-12 h-6 rounded-full transition-all duration-300 shadow-md ${isEnabled ? 'bg-emerald-500 shadow-emerald-500/30' : 'bg-white/10'}`}
                                        >
                                          <div className={`absolute top-1 w-4 h-4 rounded-full transition-all duration-300 ${isEnabled ? 'left-7 bg-white shadow-sm' : 'left-1 bg-white/40'}`} />
                                        </button>
                                      </div>
                                    );
                                  })}
                                </div>
                              </div>
                            </div>

                            <div className="space-y-4 shrink-0">
                              <div className="container-premium bg-orange/5 border-orange/20 p-6 space-y-4">
                                <h5 className="font-accent text-xs tracking-widest uppercase text-orange">Info de Facturación</h5>
                                <p className="text-xs text-white/60 leading-relaxed">
                                  Los trabajos con permisos activos podrán usar el sistema de facturación para cobrar servicios directamente a los jugadores.
                                </p>
                                <div className="pt-4 border-t border-orange/10">
                                  <span className="text-[10px] text-white/40 uppercase block mb-2">Total Activos</span>
                                  <span className="text-2xl font-accent text-white">{billingSettings.filter(s => s.enabled).length} Sociedades</span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </motion.div>
                      )}

                      {adminSubTab === 'payments' && (
                        <motion.div
                          key="sub-payments"
                          initial={{ opacity: 0, x: -10 }}
                          animate={{ opacity: 1, x: 0 }}
                          exit={{ opacity: 0, x: 10 }}
                          className="flex-1 overflow-hidden"
                        >
                          <div className="container-premium bg-black/20 p-6 h-full flex flex-col overflow-hidden">
                            <div className="flex items-center gap-4 mb-8 shrink-0">
                              <div className="w-12 h-12 rounded-xl bg-petrol/10 flex items-center justify-center text-petrol">
                                <Clock size={24} />
                              </div>
                              <div>
                                <h4 className="font-accent text-lg tracking-widest uppercase">Horarios de Pago</h4>
                                <p className="text-xs text-white/40">Gestión de ciclos de nómina automáticos por punto de sociedad.</p>
                              </div>
                            </div>

                            <div className="grid grid-cols-3 gap-4 overflow-y-auto pr-2 custom-scrollbar">
                              {paymentSchedules
                                .filter(s => bossPoints.some(p => p.job === s.job))
                                .map(schedule => (
                                <div key={schedule.id} className="flex flex-col p-4 bg-white/5 rounded-2xl border border-white/5 hover:border-petrol/30 transition-all group">
                                  <div className="flex items-center gap-4 mb-4">
                                    <div className="relative">
                                      <div className="w-10 h-10 rounded-xl bg-black/40 flex items-center justify-center text-petrol group-hover:scale-110 transition-transform">
                                        <History size={18} />
                                      </div>
                                      <div className={`absolute -bottom-1 -right-1 w-3 h-3 rounded-full border-2 border-color-bg-dark shadow-[0_0_8px_rgba(16,185,129,0.5)] bg-emerald-500`} />
                                    </div>
                                    <div className="flex flex-col overflow-hidden">
                                      <span className="font-accent text-[10px] tracking-widest uppercase truncate">{schedule.pointName}</span>
                                      <span className="text-[8px] text-white/20 uppercase tracking-widest">Auto-Pay</span>
                                    </div>
                                  </div>

                                  <div className="flex flex-col gap-3 mt-auto">
                                    <div className="flex items-center justify-between bg-black/20 p-2 rounded-lg">
                                      <span className="text-[8px] uppercase tracking-widest text-white/40">Próximo</span>
                                      <span className="text-xs font-accent text-white tracking-widest">{schedule.time}</span>
                                    </div>
                                    <button
                                      onClick={() => setModal({ type: 'payment_edit', data: schedule })}
                                      className="btn-premium bg-white/5 border-white/10 hover:bg-petrol hover:text-black hover:border-petrol w-full py-2 flex items-center justify-center gap-2 text-[8px]"
                                    >
                                      <Settings size={10} />
                                      AJUSTAR
                                    </button>
                                  </div>
                                </div>
                              ))}
                            </div>
                          </div>
                        </motion.div>
                      )}

                    </AnimatePresence>
                  </motion.div>
                )}
              </AnimatePresence>
            </main>
          </div>
        </motion.div>
      </div>
    </div>
  );
}

// --- Subcomponents ---

function SidebarItem({ active, icon, label, onClick }: { active: boolean, icon: React.ReactNode, label: string, onClick: () => void }) {
  return (
    <button
      onClick={onClick}
      className={`w-full flex items-center gap-4 px-4 py-3 rounded-xl transition-all duration-300 group ${active
          ? 'bg-orange text-black shadow-lg shadow-orange/20'
          : 'text-white/40 hover:text-white hover:bg-white/5'
        }`}
    >
      <div className={`${active ? 'text-black' : 'group-hover:text-orange'} transition-colors`}>
        {icon}
      </div>
      <span className="font-accent tracking-widest uppercase text-sm">{label}</span>
      {active && (
        <motion.div
          layoutId="sidebar-active"
          className="ml-auto"
        >
          <ChevronRight size={16} />
        </motion.div>
      )}
    </button>
  );
}

function StatCard({ icon, label, value, sub }: { icon: React.ReactNode, label: string, value: string | number, sub: string }) {
  return (
    <div className="bg-white/5 border border-white/5 rounded-2xl p-6 flex items-center gap-6 group hover:border-white/10 transition-colors">
      <div className="w-14 h-14 rounded-2xl bg-black/40 flex items-center justify-center shadow-inner group-hover:scale-110 transition-transform">
        {icon}
      </div>
      <div className="flex flex-col">
        <span className="text-[10px] uppercase tracking-[0.2em] text-white/40">{label}</span>
        <span className="text-3xl font-accent tracking-tighter">{value}</span>
        <span className="text-[10px] text-white/20 uppercase tracking-widest">{sub}</span>
      </div>
    </div>
  );
}

function QuickAction({ icon, label, onClick }: { icon: React.ReactNode, label: string, onClick: () => void }) {
  return (
    <button
      onClick={onClick}
      className="bg-white/5 border border-white/5 rounded-xl p-4 flex flex-col items-center gap-3 hover:bg-orange hover:text-black transition-all duration-300 group"
    >
      <div className="text-orange group-hover:text-black transition-colors">
        {icon}
      </div>
      <span className="font-accent text-xs tracking-widest uppercase">{label}</span>
    </button>
  );
}

function ActionButton({ icon, color, onClick, tooltip }: { icon: React.ReactNode, color: string, onClick: () => void, tooltip: string }) {
  return (
    <button
      onClick={onClick}
      title={tooltip}
      className={`w-8 h-8 rounded-lg bg-black/40 border border-white/5 flex items-center justify-center ${color} hover:bg-white/10 transition-all active:scale-90`}
    >
      {icon}
    </button>
  );
}

function FinanceBox({ type, title, desc, icon, onAction }: { type: 'deposit' | 'withdraw', title: string, desc: string, icon: React.ReactNode, onAction: (amount: string) => void }) {
  const [amount, setAmount] = useState('');

  return (
    <div className="container-premium bg-black/20 p-8 flex flex-col space-y-6">
      <div className="flex items-center gap-4">
        <div className={`w-16 h-16 rounded-2xl flex items-center justify-center ${type === 'deposit' ? 'bg-petrol/10 text-petrol' : 'bg-orange/10 text-orange'}`}>
          {icon}
        </div>
        <div className="flex flex-col">
          <h3 className="font-accent text-2xl tracking-widest uppercase">{title}</h3>
          <p className="text-xs text-white/40 max-w-[200px]">{desc}</p>
        </div>
      </div>

      <div className="space-y-4">
        <label className="text-xs uppercase tracking-widest text-white/40">Cantidad a {type === 'deposit' ? 'ingresar' : 'extraer'}</label>
        <div className="relative">
          <DollarSign className={`absolute left-4 top-1/2 -translate-y-1/2 ${type === 'deposit' ? 'text-petrol' : 'text-orange'}`} size={20} />
          <input
            type="number"
            placeholder="0.00"
            className="input-premium w-full pl-12 py-4 text-2xl font-accent"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
          />
        </div>
      </div>

      <button
        onClick={() => {
          if (amount) {
            onAction(amount);
            setAmount('');
          }
        }}
        className={`btn-premium py-4 text-lg ${type === 'deposit' ? 'bg-petrol text-black hover:bg-petrol/90' : 'bg-orange text-black hover:bg-orange/90'}`}
      >
        Confirmar {type === 'deposit' ? 'Depósito' : 'Retiro'}
      </button>
    </div>
  );
}
