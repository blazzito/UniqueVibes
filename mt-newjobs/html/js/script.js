/*  */// ===========================
// JOBS UI CONTROLLER - SISTEMA UNIFICADO
// ===========================

const JobsUI = {
    // Estado
    currentJob: null,
    isMenuOpen: false,
    isHudVisible: false,
    workStartTime: null,
    timerInterval: null,
    selectedTruckerOptions: {
        route: null,
        truck: null,
        trailer: null
    },

    // Configuraciones por trabajo
    jobConfigs: {
        garbage: {
            name: 'garbage',
            icon: 'trash-2',
            title: 'Centro de Recolección',
            subtitle: 'Gestión de Residuos Urbanos',
            hudTitle: 'Basurero Activo',
            itemLabel: 'Bolsas',
            itemLabelPlural: 'bolsas',
            itemIcon: 'package',
            payment: '$5 por bolsa',
            vehicle: 'Camión de Basura',
            steps: [
                {
                    title: 'Inicia tu Turno',
                    description: 'Pulsa "Iniciar Turno" para recibir tu camión de basura.'
                },
                {
                    title: 'Recolecta Basura',
                    description: 'Conduce por la ciudad y acércate a contenedores y bolsas de basura. Presiona <kbd>E</kbd> para recogerlas.'
                },
                {
                    title: 'Deposita en el Camión',
                    description: 'Lleva la basura a la parte trasera de tu camión y deposítala.'
                },
                {
                    title: 'Devuelve el Camión',
                    description: 'Regresa al punto de inicio y entrega el camión para recibir tu pago.'
                }
            ],
            tips: [
                'Busca zonas concurridas para encontrar más basura',
                'El pago es de <strong>$5 por bolsa</strong>',
                'No puedes entregar el camión mientras llevas basura',
                'Tu progreso se guarda automáticamente'
            ]
        },
        miner: {
            name: 'miner',
            icon: 'pickaxe',
            title: 'Centro de Minería',
            subtitle: 'Extracción de Minerales',
            hudTitle: 'Minero Activo',
            itemLabel: 'Minerales',
            itemLabelPlural: 'minerales',
            itemIcon: 'gem',
            payment: '$5 por mineral procesado',
            vehicle: 'Camioneta Bison',
            steps: [
                {
                    title: 'Inicia tu Turno',
                    description: 'Pulsa "Iniciar Turno" para recibir tu vehículo de trabajo.'
                },
                {
                    title: 'Ve a la Mina',
                    description: 'Conduce hasta los puntos de minería marcados en el mapa.'
                },
                {
                    title: 'Extrae Minerales',
                    description: 'Acércate a los puntos de extracción y presiona <kbd>E</kbd> para picar mineral con tu pico.'
                },
                {
                    title: 'Guarda en el Vehículo',
                    description: 'Lleva el mineral a tu vehículo y deposítalo.'
                },
                {
                    title: 'Procesa los Minerales',
                    description: 'Ve a la planta de procesamiento para convertir el mineral bruto en lingotes.'
                },
                {
                    title: 'Entrega el Pedido',
                    description: 'Lleva los lingotes al punto de entrega marcado y recibe tu pago.'
                }
            ],
            tips: [
                'Los puntos de minería tienen un tiempo de cooldown de 20 segundos',
                'El pago es de <strong>$5 por mineral procesado</strong>',
                '1 mineral bruto = 2 lingotes procesados',
                'Debes procesar los minerales antes de entregarlos',
                'Tu progreso se guarda automáticamente'
            ]
        },
        lumberjack: {
            name: 'lumberjack',
            icon: 'axe',
            title: 'Centro de Carpintería',
            subtitle: 'Procesamiento de Madera',
            hudTitle: 'Leñador Activo',
            itemLabel: 'Troncos',
            itemLabelPlural: 'troncos',
            itemIcon: 'tree-pine',
            payment: '$2 por tablón',
            vehicle: 'Camioneta Bison',
            steps: [
                {
                    title: 'Inicia tu Turno',
                    description: 'Pulsa "Iniciar Turno" para recibir tu vehículo de trabajo.'
                },
                {
                    title: 'Ve al Bosque',
                    description: 'Conduce hasta los árboles marcados en el mapa.'
                },
                {
                    title: 'Tala Árboles',
                    description: 'Acércate a los árboles y presiona <kbd>E</kbd> para talarlos con tu hacha.'
                },
                {
                    title: 'Guarda en el Vehículo',
                    description: 'Lleva los troncos a tu vehículo y deposítalos.'
                },
                {
                    title: 'Procesa la Madera',
                    description: 'Ve al aserradero para convertir los troncos en tablones procesados.'
                },
                {
                    title: 'Entrega el Pedido',
                    description: 'Lleva los tablones al punto de entrega y recibe tu pago.'
                }
            ],
            tips: [
                'Los árboles tienen un tiempo de cooldown de 182 segundos',
                'El pago es de <strong>$2 por tablón procesado</strong>',
                '1 tronco = 2 tablones procesados',
                'Debes procesar los troncos antes de entregarlos',
                'Tu progreso se guarda automáticamente'
            ]
        },
        bus: {
            name: 'bus',
            icon: 'bus',
            title: 'Central de Autobuses',
            subtitle: 'Transporte de Pasajeros',
            hudTitle: 'Conductor Activo',
            itemLabel: 'Pasajeros',
            itemLabelPlural: 'pasajeros',
            itemIcon: 'users',
            payment: '$5 por pasajero',
            vehicle: 'Autobús',
            steps: [
                {
                    title: 'Inicia tu Turno',
                    description: 'Pulsa "Iniciar Turno" para recibir tu autobús.'
                },
                {
                    title: 'Dirígete a las Paradas',
                    description: 'Sigue las paradas marcadas en el GPS para recoger pasajeros.'
                },
                {
                    title: 'Recoge Pasajeros',
                    description: 'Detente en las paradas marcadas y presiona <kbd>E</kbd> para que los pasajeros suban.'
                },
                {
                    title: 'Transporta con Cuidado',
                    description: 'Conduce con precaución. Los pasajeros aprecian un viaje seguro y cómodo.'
                },
                {
                    title: 'Deja Pasajeros',
                    description: 'En cada parada, algunos pasajeros bajarán automáticamente.'
                },
                {
                    title: 'Finaliza tu Turno',
                    description: 'Regresa al punto de inicio y devuelve el autobús para recibir tu pago.'
                }
            ],
            tips: [
                'Cada parada puede tener entre 1 y 5 pasajeros esperando',
                'El pago es de <strong>$5 por pasajero transportado</strong>',
                'Los pasajeros suben y bajan automáticamente en las paradas',
                'Conduce con cuidado para mantener a tus pasajeros felices',
                'Tu progreso se guarda automáticamente'
            ]
        },
        trucker: {
            name: 'trucker',
            icon: 'truck',
            title: 'Central de Camioneros',
            subtitle: 'Transporte de Carga Pesada',
            hudTitle: 'Camionero Activo',
            itemLabel: 'Cargas',
            itemLabelPlural: 'cargas',
            itemIcon: 'package',
            payment: '$1200+ por ruta',
            vehicle: 'Camión con Remolque',
            steps: [
                {
                    title: 'Inicia tu Turno',
                    description: 'Pulsa "Iniciar Turno" para recibir tu camión y remolque asignado.'
                },
                {
                    title: 'Engancha el Remolque',
                    description: 'Acopla el remolque a la cabina de tu camión antes de salir.'
                },
                {
                    title: 'Transporta la Carga',
                    description: 'Conduce hasta el punto de entrega marcado en tu GPS, siguiendo la ruta asignada.'
                },
                {
                    title: 'Entrega la Mercancía',
                    description: 'Descarga la mercancía en el destino para recibir tu pago.'
                },
                {
                    title: 'Finaliza tu Turno',
                    description: 'Regresa al punto de inicio y devuelve el camión para recibir tu pago final.'
                }
            ],
            tips: [
                'Cuanto mayor sea tu nivel, mejores camiones y pagos recibirás',
                'Debes llevar el remolque enganchado para poder entregar la carga',
                'Las rutas más largas suelen tener un pago adicional por dificultad',
                'Conduce con precaución para evitar daños a la carga y al vehículo',
                'Tu progreso se guarda automáticamente'
            ]
        },
        chicken: {
            name: 'chicken',
            icon: 'egg',
            title: 'Granja Avícola',
            subtitle: 'Procesamiento de Pollos',
            hudTitle: 'Pollero Activo',
            itemLabel: 'Pollos',
            itemLabelPlural: 'pollos',
            itemIcon: 'egg',
            payment: '$8 por pieza procesada',
            vehicle: 'Camioneta Bison',
            steps: [
                {
                    title: 'Inicia tu Turno',
                    description: 'Pulsa "Iniciar Turno" para recibir tu vehículo de trabajo.'
                },
                {
                    title: 'Ve a los Corrales',
                    description: 'Conduce hasta los corrales marcados en el mapa.'
                },
                {
                    title: 'Captura Pollos',
                    description: 'Acércate a los pollos y presiona <kbd>E</kbd> para capturarlos.'
                },
                {
                    title: 'Guarda en el Vehículo',
                    description: 'Lleva los pollos a tu vehículo y deposítalos.'
                },
                {
                    title: 'Procesa los Pollos',
                    description: 'Ve al punto de procesamiento para preparar las piezas.'
                },
                {
                    title: 'Entrega el Pedido',
                    description: 'Lleva las piezas procesadas al punto de entrega y recibe tu pago.'
                }
            ],
            tips: [
                'Los corrales tienen un tiempo de cooldown de 120 segundos',
                'El pago es de <strong>$8 por pieza procesada</strong>',
                '1 pollo = 2 piezas procesadas',
                'Debes procesar los pollos antes de entregarlos',
                'Tu progreso se guarda automáticamente'
            ]
        },
        taxi: {
            name: 'taxi',
            icon: 'car',
            title: 'Central de Taxi',
            subtitle: 'Transporte de Ciudadanos',
            hudTitle: 'Taxista Activo',
            itemLabel: 'Carreras',
            itemLabelPlural: 'carreras',
            itemIcon: 'car',
            payment: '$50+ por carrera',
            vehicle: 'Taxi',
            steps: [
                {
                    title: 'Inicia tu Turno',
                    description: 'Pulsa "Iniciar Turno" para recibir tu taxi.'
                },
                {
                    title: 'Espera Solicitudes',
                    description: 'Mantente atento a las notificaciones de los clientes.'
                },
                {
                    title: 'Recoge al Cliente',
                    description: 'Ve a la ubicación marcada y espera a que el cliente suba.'
                },
                {
                    title: 'Llévalo al Destino',
                    description: 'Sigue la ruta del GPS hasta el punto de entrega.'
                }
            ],
            tips: [
                'Mantén tu vehículo limpio para mejores propinas',
                'El pago base es de <strong>$50 por carrera</strong>',
                'Puedes recibir avisos de ciudadanos y de NPCs',
                'Tu progreso se guarda automáticamente'
            ]
        }
    },

    // Elementos del DOM
    elements: {},

    // ===========================
    // INICIALIZACIÓN
    // ===========================
    init() {
        console.log('🎮 Jobs UI Initialized');
        this.cacheElements();
        this.setupEventListeners();
        this.hideAll();
    },

    cacheElements() {
        // Containers
        this.elements.hudContainer = document.getElementById('hud-container');
        this.elements.menuContainer = document.getElementById('menu-container');

        // HUD
        this.elements.hudIcon = document.getElementById('hud-icon');
        this.elements.hudTitle = document.getElementById('hud-title');
        this.elements.hudLevel = document.getElementById('hud-level');
        this.elements.hudLabel1 = document.getElementById('hud-label-1');
        this.elements.itemsCount = document.getElementById('items-count');
        this.elements.statItem2 = document.getElementById('stat-item-2');
        this.elements.hudLabel2 = document.getElementById('hud-label-2');
        this.elements.itemsCount2 = document.getElementById('items-count-2');
        this.elements.statDivider2 = document.getElementById('stat-divider-2');
        this.elements.earnings = document.getElementById('earnings');
        this.elements.workTime = document.getElementById('work-time');
        this.elements.progressFill = document.getElementById('progress-fill');
        this.elements.progressText = document.querySelector('.progress-text');

        // Menu Header
        this.elements.menuIcon = document.getElementById('menu-icon');
        this.elements.menuTitle = document.getElementById('menu-title');
        this.elements.menuSubtitle = document.getElementById('menu-subtitle');

        // Menu Stats
        this.elements.lastSessionEarnings = document.getElementById('last-session-earnings');
        this.elements.statIconItems = document.getElementById('stat-icon-items');
        this.elements.statLabelItems = document.getElementById('stat-label-items');
        this.elements.totalItems = document.getElementById('total-items');
        this.elements.totalTime = document.getElementById('total-time');
        this.elements.levelNumber = document.getElementById('level-number');
        this.elements.levelBonus = document.getElementById('level-bonus');
        this.elements.currentXP = document.getElementById('current-xp');
        this.elements.nextLevelXP = document.getElementById('next-level-xp');
        this.elements.xpProgressFill = document.getElementById('xp-progress-fill');
        this.elements.workerLevel = document.getElementById('worker-level');

        // Info Section
        this.elements.infoPaymentLabel = document.getElementById('info-payment-label');
        this.elements.infoPaymentValue = document.getElementById('info-payment-value');
        this.elements.infoVehicle = document.getElementById('info-vehicle');

        // Detailed Stats
        this.elements.shiftsCompleted = document.getElementById('shifts-completed');
        this.elements.totalEarned = document.getElementById('total-earned');
        this.elements.statsItemsLabel = document.getElementById('stats-items-label');
        this.elements.statsTotalItems = document.getElementById('stats-total-items');
        this.elements.avgPerShift = document.getElementById('avg-per-shift');
        this.elements.bestShift = document.getElementById('best-shift');
        this.elements.statsTotalTime = document.getElementById('stats-total-time');

        // Info View
        this.elements.infoSteps = document.getElementById('info-steps');
        this.elements.infoTipsList = document.getElementById('info-tips-list');

        // Views
        this.elements.mainView = document.getElementById('main-view');
        this.elements.statsView = document.getElementById('stats-view');
        this.elements.infoView = document.getElementById('info-view');

        // Buttons
        this.elements.closeMenu = document.getElementById('close-menu');
        this.elements.startJob = document.getElementById('start-job');
        this.elements.viewStats = document.getElementById('view-stats');
        this.elements.viewInfo = document.getElementById('view-info');
        this.elements.endShift = document.getElementById('end-shift');
        this.elements.backFromStats = document.getElementById('back-from-stats');
        this.elements.backFromInfo = document.getElementById('back-from-info');
    },

    setupEventListeners() {
        this.elements.closeMenu.addEventListener('click', () => this.closeMenu());
        this.elements.startJob.addEventListener('click', () => this.startJob());
        this.elements.viewStats.addEventListener('click', () => this.showView('stats'));
        if (this.elements.viewInfo) {
            this.elements.viewInfo.addEventListener('click', () => this.showView('info'));
        }
        this.elements.backFromStats.addEventListener('click', () => this.showView('main'));
        this.elements.backFromInfo.addEventListener('click', () => this.showView('main'));
        this.elements.endShift.addEventListener('click', () => this.endShift());

        window.addEventListener('message', (event) => {
            const data = event.data;

            switch (data.action) {
                case 'showMenu':
                    this.openMenu(data.jobType, data.stats);
                    break;
                case 'hideMenu':
                    this.closeMenu();
                    break;
                case 'showHud':
                    this.showHud(data.jobType, data.level, data.bonusPercent);
                    break;
                case 'hideHud':
                    this.hideHud();
                    break;
                case 'resetHudLabels':
                    if (this.elements.statItem2) this.elements.statItem2.style.display = 'none';
                    if (this.elements.statDivider2) this.elements.statDivider2.style.display = 'none';
                    break;
                case 'updateHud':
                    this.updateHud(data);
                    break;
                case 'updateStats':
                    this.updateStats(data.stats);
                    break;
            }
        });

        document.addEventListener('keyup', (e) => {
            if (e.key === 'Escape' && this.isMenuOpen) {
                this.closeMenu();
            }
        });
    },

    // ===========================
    // CONFIGURACIÓN DE TRABAJO
    // ===========================
    setJobTheme(jobType) {
        this.currentJob = jobType;
        const config = this.jobConfigs[jobType];

        if (!config) {
            console.error('Job config not found:', jobType);
            return;
        }

        // Aplicar tema de colores
        this.elements.hudContainer.setAttribute('data-job', jobType);
        this.elements.menuContainer.setAttribute('data-job', jobType);

        // Actualizar textos del menú con iconos Lucide
        this.elements.menuIcon.innerHTML = `<i data-lucide="${config.icon}"></i>`;
        this.elements.menuTitle.textContent = config.title;
        this.elements.menuSubtitle.textContent = config.subtitle;

        // Actualizar HUD con iconos Lucide
        this.elements.hudIcon.innerHTML = `<i data-lucide="${config.icon}"></i>`;
        this.elements.hudTitle.textContent = config.hudTitle;
        this.elements.hudLabel1.textContent = config.itemLabel;

        // Actualizar labels de stats con iconos Lucide
        this.elements.statIconItems.innerHTML = `<i data-lucide="${config.itemIcon}"></i>`;
        this.elements.statLabelItems.textContent = `Total ${config.itemLabel}`;
        this.elements.statsItemsLabel.textContent = `${config.itemLabel} Recolectados`;

        // Actualizar info de pago
        this.elements.infoPaymentLabel.textContent = 'Pago';
        this.elements.infoPaymentValue.textContent = config.payment;

        // Recargar iconos de Lucide
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }
        this.elements.infoVehicle.textContent = config.vehicle;

        // Mostrar/Ocultar configuración de camionero (Desactivado para hacerlo automático)
        const truckerSection = document.getElementById('trucker-config-section');
        if (truckerSection) {
            truckerSection.style.display = 'none';
        }

        // Actualizar vista de información
        this.updateInfoView(config);
    },

    updateInfoView(config) {
        // Limpiar y llenar steps
        this.elements.infoSteps.innerHTML = '';
        config.steps.forEach((step, index) => {
            const stepEl = document.createElement('div');
            stepEl.className = 'step';
            stepEl.innerHTML = `
                <div class="step-number">${index + 1}</div>
                <div class="step-content">
                    <h3>${step.title}</h3>
                    <p>${step.description}</p>
                </div>
            `;
            this.elements.infoSteps.appendChild(stepEl);
        });

        // Limpiar y llenar tips
        this.elements.infoTipsList.innerHTML = '';
        config.tips.forEach(tip => {
            const li = document.createElement('li');
            li.innerHTML = tip;
            this.elements.infoTipsList.appendChild(li);
        });
    },

    // ===========================
    // GESTIÓN DE VISTAS
    // ===========================
    showView(viewName) {
        this.elements.mainView.style.display = 'none';
        this.elements.statsView.style.display = 'none';
        this.elements.infoView.style.display = 'none';

        switch (viewName) {
            case 'main':
                this.elements.mainView.style.display = 'block';
                break;
            case 'stats':
                this.elements.statsView.style.display = 'block';
                break;
            case 'info':
                this.elements.infoView.style.display = 'block';
                this.loadJobInfo(); // Cargar info del trabajo actual
                break;
        }

        // Recargar iconos de Lucide
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }
    },

    loadJobInfo() {
        const config = this.jobConfigs[this.currentJob];
        if (!config) return;

        // Cargar pasos
        this.elements.infoSteps.innerHTML = config.steps.map((step, index) => `
            <div class="step-item">
                <div class="step-number">${index + 1}</div>
                <div class="step-content">
                    <h4>${step.title}</h4>
                    <p>${step.description}</p>
                </div>
            </div>
        `).join('');

        // Cargar consejos
        this.elements.infoTipsList.innerHTML = config.tips.map(tip => `<li>${tip}</li>`).join('');

        // Recargar iconos
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }
    },

    // ===========================
    // MENÚ (Panel NPC)
    // ===========================
    openMenu(jobType, stats) {
        this.setJobTheme(jobType);
        this.isMenuOpen = true;
        this.elements.menuContainer.classList.remove('menu-hidden');
        this.showView('main');

        if (stats) {
            this.updateMenuStats(stats);
        }

        fetch(`https://${GetParentResourceName()}/menuOpened`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ jobType: jobType })
        });

        // Mostrar/ocultar botón de finalizar turno
        const hasShift = stats && stats.hasActiveShift;
        if (hasShift) {
            this.elements.startJob.style.display = 'none';
            this.elements.endShift.style.display = 'flex';
        } else {
            this.elements.startJob.style.display = 'flex';
            this.elements.endShift.style.display = 'none';
        }

        // Recargar iconos
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }
    },

    closeMenu() {
        this.isMenuOpen = false;
        this.elements.menuContainer.classList.add('menu-hidden');

        fetch(`https://${GetParentResourceName()}/closeMenu`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ jobType: this.currentJob })
        });
    },

    startJob() {
        this.closeMenu();

        let data = { jobType: this.currentJob };

        if (this.currentJob === 'trucker') {
            // El servidor elegirá aleatoriamente basado en el nivel
            data.route = null;
            data.truck = null;
            data.trailer = null;
        }

        fetch(`https://${GetParentResourceName()}/startJob`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });
    },

    endShift() {
        this.closeMenu();

        fetch(`https://${GetParentResourceName()}/endShift`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ jobType: this.currentJob })
        });
    },

    updateMenuStats(stats) {
        const config = this.jobConfigs[this.currentJob];

        this.elements.lastSessionEarnings.textContent = this.formatMoney(stats.lastSession || 0);
        this.elements.totalItems.textContent = stats.totalItems || 0;
        this.elements.totalTime.textContent = this.formatTime(stats.totalTime || 0);
        this.elements.workerLevel.textContent = stats.level || 1;

        // Actualizar progreso de nivel y XP
        if (stats.levelProgress) {
            const progress = stats.levelProgress;
            const bonusPercent = stats.bonusPercent || 0;

            this.elements.levelNumber.textContent = progress.level || 1;
            this.elements.levelBonus.textContent = bonusPercent > 0
                ? `+${bonusPercent}% de bonificación`
                : 'Sin bonificación aún';

            if (progress.isMaxLevel) {
                this.elements.currentXP.textContent = 'MAX';
                this.elements.nextLevelXP.textContent = 'MAX';
                this.elements.xpProgressFill.style.width = '100%';
            } else {
                this.elements.currentXP.textContent = progress.currentXP || 0;
                this.elements.nextLevelXP.textContent = progress.nextLevelXP || 150;
                this.elements.xpProgressFill.style.width = (progress.percentage || 0) + '%';
            }
        }

        // Detailed stats
        this.elements.shiftsCompleted.textContent = stats.shiftsCompleted || 0;
        this.elements.totalEarned.textContent = this.formatMoney(stats.totalEarned || 0);
        this.elements.statsTotalItems.textContent = stats.totalItems || 0;
        this.elements.avgPerShift.textContent = `${stats.avgPerShift || 0} ${config.itemLabelPlural}`;
        this.elements.bestShift.textContent = this.formatMoney(stats.bestShift || 0);
        this.elements.statsTotalTime.textContent = this.formatTime(stats.totalTime || 0);

        // Poblar opciones de camionero si existen
        if (this.currentJob === 'trucker' && stats.truckerOptions) {
            this.populateTruckerOptions(stats.truckerOptions, stats.level || 1);
        }
    },

    populateTruckerOptions(options, level) {
        const routeList = document.getElementById('trucker-route-list');
        const truckList = document.getElementById('trucker-truck-list');
        const trailerList = document.getElementById('trucker-trailer-list');

        if (!routeList || !truckList || !trailerList) return;

        // Reset Selection State
        this.selectedTruckerOptions = { route: null, truck: null, trailer: null };

        // Helper to create card
        const createCard = (title, info, value, type, activeByDefault = false) => {
            const card = document.createElement('div');
            card.className = `selection-card ${activeByDefault ? 'active' : ''}`;
            if (activeByDefault) this.selectedTruckerOptions[type] = value;

            card.innerHTML = `
                <span class="card-title">${title}</span>
                <span class="card-info">${info}</span>
            `;

            card.onclick = () => {
                const parent = card.parentElement;
                parent.querySelectorAll('.selection-card').forEach(c => c.classList.remove('active'));
                card.classList.add('active');
                this.selectedTruckerOptions[type] = value;
            };

            return card;
        };

        // Limpiar
        routeList.innerHTML = '';
        truckList.innerHTML = '';
        trailerList.innerHTML = '';

        // Rutas
        options.routes.filter(r => level >= (r.minLevel || 1)).forEach((route, index) => {
            const info = `<span class="highlight">Pago: $${route.payment}</span>`;
            routeList.appendChild(createCard(route.label, info, index, 'route', index === 0));
        });

        // Camiones
        options.trucks.filter(t => level >= (t.minLevel || 1)).forEach((truck, index) => {
            const info = `<span>Nivel Requerido: ${truck.minLevel || 1}</span>`;
            truckList.appendChild(createCard(truck.label, info, truck.model, 'truck', index === 0));
        });

        // Remolques
        options.trailers.filter(t => level >= (t.minLevel || 1)).forEach((trailer, index) => {
            const info = `<span>Nivel ${trailer.minLevel || 1}</span>`;
            trailerList.appendChild(createCard(trailer.label, info, trailer.model, 'trailer', index === 0));
        });
    },

    // ===========================
    // HUD (Durante el trabajo)
    // ===========================
    showHud(jobType, level, bonusPercent) {
        this.setJobTheme(jobType);
        this.isHudVisible = true;
        this.elements.hudContainer.classList.remove('hud-hidden');
        this.workStartTime = Date.now();
        this.startTimer();

        // Resetear segundo item para evitar residuos de otros jobs
        if (this.elements.statItem2) this.elements.statItem2.style.display = 'none';
        if (this.elements.statDivider2) this.elements.statDivider2.style.display = 'none';

        // Actualizar nivel en HUD
        if (level) {
            const bonusText = bonusPercent > 0 ? ` (+${bonusPercent}%)` : '';
            this.elements.hudLevel.textContent = `Nivel ${level}${bonusText}`;
        }
    },

    hideHud() {
        this.isHudVisible = false;
        this.elements.hudContainer.classList.add('hud-hidden');
        this.stopTimer();
    },

    updateHud(data) {
        const config = this.jobConfigs[this.currentJob];
        const plural = data.itemLabelPlural || (config ? config.itemLabelPlural : 'items');

        if (data.itemLabel && this.elements.hudLabel1) {
            this.elements.hudLabel1.textContent = data.itemLabel;
        }

        if (data.items !== undefined) {
            this.elements.itemsCount.textContent = data.items;
            this.animateValue(this.elements.itemsCount);
        }

        // Segundo item (Opcional)
        if (data.items2 !== undefined && this.elements.statItem2) {
            this.elements.statItem2.style.display = 'flex';
            if (this.elements.statDivider2) this.elements.statDivider2.style.display = 'block';

            if (data.itemLabel2) this.elements.hudLabel2.textContent = data.itemLabel2;
            this.elements.itemsCount2.textContent = data.items2;
            this.animateValue(this.elements.itemsCount2);
        }

        if (data.earnings !== undefined) {
            this.elements.earnings.textContent = this.formatMoney(data.earnings);
            this.animateValue(this.elements.earnings);
        }

        if (data.progress !== undefined) {
            this.elements.progressFill.style.width = `${data.progress}%`;
        }

        // Actualizar texto de progreso
        if (data.items !== undefined && data.maxItems !== undefined && this.elements.progressText) {
            if (config) {
                if (data.items >= data.maxItems) {
                    this.elements.progressText.innerHTML = `<strong style="color: var(--primary-color);">${data.items}/${data.maxItems} ${plural} - ¡Vuelve a la central!</strong>`;
                } else {
                    this.elements.progressText.innerHTML = `${data.items}/${data.maxItems} ${plural} - Presiona <kbd>E</kbd> para recoger`;
                }
            }
        }
    },

    startTimer() {
        this.timerInterval = setInterval(() => {
            if (this.workStartTime) {
                const elapsed = Math.floor((Date.now() - this.workStartTime) / 1000);
                const minutes = Math.floor(elapsed / 60);
                const seconds = elapsed % 60;
                this.elements.workTime.textContent =
                    `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            }
        }, 1000);
    },

    stopTimer() {
        if (this.timerInterval) {
            clearInterval(this.timerInterval);
            this.timerInterval = null;
        }
        this.workStartTime = null;
    },

    // ===========================
    // UTILIDADES
    // ===========================
    formatMoney(amount) {
        return `$${amount.toLocaleString('en-US')}`;
    },

    formatTime(minutes) {
        const hours = Math.floor(minutes / 60);
        const mins = minutes % 60;
        return `${hours}h ${mins}m`;
    },

    animateValue(element) {
        element.style.transform = 'scale(1.1)';
        setTimeout(() => {
            element.style.transform = 'scale(1)';
        }, 200);
        element.style.transition = 'transform 0.2s ease';
    },

    hideAll() {
        this.hideHud();
        this.elements.menuContainer.classList.add('menu-hidden');
    },

    updateStats(stats) {
        this.updateMenuStats(stats);
    }
};

// ===========================
// INICIALIZAR AL CARGAR
// ===========================
document.addEventListener('DOMContentLoaded', () => {
    JobsUI.init();
    JobCenterUI.init();
    JobOffersUI.init();
});

// Debug
window.JobsUI = JobsUI;

// ===========================
// JOB CENTER UI CONTROLLER
// ===========================

const JobCenterUI = {
    container: null,
    jobsGrid: null,
    rankingsContent: null,
    currentRankingType: 'hours',
    currentFilter: 'all',
    currentRankings: null,

    init() {
        this.container = document.getElementById('jobcenter-container');
        this.jobsGrid = document.getElementById('jobs-grid');
        this.rankingsContent = document.getElementById('rankings-content');
        this.setupListeners();
    },

    setupListeners() {
        window.addEventListener('message', (event) => {
            const data = event.data;

            if (data.action === 'showJobCenter') {
                this.show(data.jobs, data.rankings, data.offers);
            } else if (data.action === 'hideJobCenter') {
                this.hide();
                JobOffersUI.stopAutoSlide();
            }
        });

        // Tabs de rankings
        document.querySelectorAll('.ranking-tab').forEach(tab => {
            tab.addEventListener('click', (e) => {
                const rankingType = e.currentTarget.dataset.ranking;
                this.switchRanking(rankingType);
            });
        });

        // Filtros de trabajo
        document.querySelectorAll('.ranking-filter').forEach(filter => {
            filter.addEventListener('click', (e) => {
                const filterType = e.currentTarget.dataset.filter;
                this.switchFilter(filterType);
            });
        });

        // ESC para cerrar Job Center
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && !this.container.classList.contains('jobcenter-hidden')) {
                this.closeJobCenter();
            }
        });
    },

    show(jobs, rankings, offers) {
        this.renderJobs(jobs);
        if (rankings) {
            this.currentRankings = rankings;
            this.renderCurrentRankings();
        }
        if (offers) {
            JobOffersUI.loadOffers(offers);
        }
        this.container.classList.remove('jobcenter-hidden');

        // Reinicializar iconos de Lucide
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }
    },

    hide() {
        this.container.classList.add('jobcenter-hidden');
    },

    closeJobCenter() {
        this.hide();
        JobOffersUI.stopAutoSlide();
        fetch(`https://${GetParentResourceName()}/closeJobCenter`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({})
        });
    },

    renderJobs(jobs) {
        if (!jobs || jobs.length === 0) return;

        this.jobsGrid.innerHTML = '';

        jobs.forEach(job => {
            const jobCard = document.createElement('div');
            jobCard.className = 'job-card';
            jobCard.setAttribute('data-job-id', job.id);

            jobCard.innerHTML = `
                <div class="job-icon">
                    <i data-lucide="${job.icon}"></i>
                </div>
                <div class="job-info">
                    <div class="job-name">${job.name}</div>
                    <div class="job-description">${job.description}</div>
                    <div class="job-payment">${job.payment}</div>
                </div>
                <div class="job-arrow">
                    <i data-lucide="map-pin"></i>
                </div>
            `;

            jobCard.addEventListener('click', () => {
                this.selectJob(job.id);
            });

            this.jobsGrid.appendChild(jobCard);
        });

        // Reinicializar iconos de Lucide
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }
    },

    switchRanking(type) {
        this.currentRankingType = type;

        // Actualizar tabs activos
        document.querySelectorAll('.ranking-tab').forEach(tab => {
            if (tab.dataset.ranking === type) {
                tab.classList.add('active');
            } else {
                tab.classList.remove('active');
            }
        });

        // Renderizar rankings correspondientes
        this.renderCurrentRankings();
    },

    switchFilter(filter) {
        this.currentFilter = filter;

        // Actualizar filtros activos
        document.querySelectorAll('.ranking-filter').forEach(filterBtn => {
            if (filterBtn.dataset.filter === filter) {
                filterBtn.classList.add('active');
            } else {
                filterBtn.classList.remove('active');
            }
        });

        // Renderizar rankings correspondientes
        this.renderCurrentRankings();
    },

    renderCurrentRankings() {
        if (!this.currentRankings) return;

        let rankingData = [];
        const type = this.currentRankingType; // 'hours' o 'earnings'

        if (this.currentFilter === 'all') {
            // Usar ranking GLOBAL
            rankingData = this.currentRankings.overall[type] || [];
        } else {
            // Usar ranking ESPECÍFICO del trabajo
            if (this.currentRankings.jobs[this.currentFilter]) {
                rankingData = this.currentRankings.jobs[this.currentFilter][type] || [];
            }
        }

        this.renderRankings(rankingData);
    },

    renderRankings(rankings) {
        this.rankingsContent.innerHTML = '';

        if (!rankings || rankings.length === 0) {
            this.rankingsContent.innerHTML = '<div class="ranking-empty">No hay datos disponibles</div>';
            return;
        }

        rankings.forEach((player, index) => {
            const rankItem = document.createElement('div');
            rankItem.className = `ranking-item${index < 3 ? ' top-' + (index + 1) : ''}`;

            const icon = this.currentRankingType === 'hours' ? 'clock' : 'dollar-sign';
            const value = this.currentRankingType === 'hours'
                ? this.formatTime(player.value)
                : '$' + player.value.toLocaleString('en-US');

            // Mostrar badge del trabajo solo si no hay filtro y hay información del trabajo
            const jobBadge = (this.currentFilter === 'all' && player.jobIcon)
                ? `<span class="ranking-job-badge" title="${player.jobLabel}">${player.jobIcon}</span>`
                : '';

            rankItem.innerHTML = `
                <div class="ranking-position">${index + 1}</div>
                <div class="ranking-info">
                    <div class="ranking-name">
                        ${player.name}
                        ${jobBadge}
                    </div>
                    <div class="ranking-value">${value}</div>
                </div>
                <div class="ranking-icon">
                    <i data-lucide="${icon}"></i>
                </div>
            `;

            this.rankingsContent.appendChild(rankItem);
        });

        // Reinicializar iconos de Lucide
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }
    },

    formatTime(minutes) {
        const hours = Math.floor(minutes / 60);
        const mins = minutes % 60;
        return `${hours}h ${mins}m`;
    },

    selectJob(jobId) {
        fetch(`https://${GetParentResourceName()}/selectJob`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ jobId: jobId })
        });
    },

    close() {
        fetch(`https://${GetParentResourceName()}/closeJobCenter`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({})
        });
    }
};

// ===========================
// JOB OFFERS SLIDER CONTROLLER
// ===========================

const JobOffersUI = {
    slider: null,
    offers: [],
    currentIndex: 0,
    autoSlideInterval: null,
    autoSlideDelay: 8000, // 8 segundos

    init() {
        this.slider = document.getElementById('job-offers-slider');
        this.setupModal();
    },

    setupModal() {
        const modal = document.getElementById('application-modal');
        const closeBtn = document.getElementById('close-application');
        const cancelBtn = document.getElementById('cancel-application');
        const submitBtn = document.getElementById('submit-application');
        const overlay = modal.querySelector('.application-overlay');

        closeBtn?.addEventListener('click', () => this.closeModal());
        cancelBtn?.addEventListener('click', () => this.closeModal());
        overlay?.addEventListener('click', () => this.closeModal());
        submitBtn?.addEventListener('click', () => this.submitApplication());
    },

    loadOffers(offers) {
        this.offers = offers || [];
        this.currentIndex = 0;
        this.stopAutoSlide();

        if (this.offers.length === 0) {
            this.showEmpty();
        } else {
            this.renderOffer();
            this.startAutoSlide();
        }
    },

    showEmpty() {
        this.slider.innerHTML = `
            <div class="offer-empty">
                <i data-lucide="inbox"></i>
                <p>No hay ofertas disponibles actualmente</p>
            </div>
        `;
        lucide.createIcons();
    },

    renderOffer() {
        if (this.offers.length === 0) return;

        const offer = this.offers[this.currentIndex];

        this.slider.innerHTML = `
            <div class="offer-card">
                <div class="offer-header">
                    <div class="offer-logo">
                        <i data-lucide="${offer.logo || 'briefcase'}"></i>
                    </div>
                    <div class="offer-title-section">
                        <div class="offer-business-name">${offer.business_name}</div>
                        <div class="offer-position">${offer.position}</div>
                    </div>
                </div>

                <div class="offer-body">
                    <div class="offer-info-item">
                        <i data-lucide="dollar-sign"></i>
                        <div class="offer-info-content">
                            <div class="offer-info-label">Salario</div>
                            <div class="offer-info-value">${offer.salary || 'A negociar'}</div>
                        </div>
                    </div>

                    <div class="offer-info-item">
                        <i data-lucide="gift"></i>
                        <div class="offer-info-content">
                            <div class="offer-info-label">Beneficios</div>
                            <div class="offer-info-value">${offer.benefits || 'No especificados'}</div>
                        </div>
                    </div>

                    <div class="offer-info-item offer-description-box">
                        <i data-lucide="file-text"></i>
                        <div class="offer-info-content">
                            <div class="offer-info-label">Descripción</div>
                            <div class="offer-info-value">${offer.description || 'Sin descripción'}</div>
                        </div>
                    </div>
                </div>

                <div class="offer-footer">
                    <div class="offer-navigation">
                        <button class="nav-btn" id="prev-offer" ${this.offers.length <= 1 ? 'disabled' : ''}>
                            <i data-lucide="chevron-left"></i>
                        </button>
                        <span class="offer-indicator">${this.currentIndex + 1} / ${this.offers.length}</span>
                        <button class="nav-btn" id="next-offer" ${this.offers.length <= 1 ? 'disabled' : ''}>
                            <i data-lucide="chevron-right"></i>
                        </button>
                    </div>
                    <button class="offer-apply-btn" data-offer-id="${offer.id}">
                        <i data-lucide="file-text"></i>
                        Postular
                    </button>
                </div>
            </div>
        `;

        lucide.createIcons();
        this.attachOfferListeners();
    },

    attachOfferListeners() {
        const prevBtn = document.getElementById('prev-offer');
        const nextBtn = document.getElementById('next-offer');
        const applyBtn = document.querySelector('.offer-apply-btn');

        prevBtn?.addEventListener('click', () => {
            this.prevOffer();
            this.resetAutoSlide();
        });

        nextBtn?.addEventListener('click', () => {
            this.nextOffer();
            this.resetAutoSlide();
        });

        applyBtn?.addEventListener('click', (e) => {
            const offerId = e.currentTarget.getAttribute('data-offer-id');
            this.openModal(offerId);
        });
    },

    nextOffer() {
        if (this.offers.length <= 1) return;
        this.currentIndex = (this.currentIndex + 1) % this.offers.length;
        this.renderOffer();
    },

    prevOffer() {
        if (this.offers.length <= 1) return;
        this.currentIndex = (this.currentIndex - 1 + this.offers.length) % this.offers.length;
        this.renderOffer();
    },

    startAutoSlide() {
        if (this.offers.length <= 1) return;

        this.autoSlideInterval = setInterval(() => {
            this.nextOffer();
        }, this.autoSlideDelay);
    },

    stopAutoSlide() {
        if (this.autoSlideInterval) {
            clearInterval(this.autoSlideInterval);
            this.autoSlideInterval = null;
        }
    },

    resetAutoSlide() {
        this.stopAutoSlide();
        this.startAutoSlide();
    },

    openModal(offerId) {
        const offer = this.offers.find(o => o.id == offerId);
        if (!offer) return;

        const modal = document.getElementById('application-modal');
        const businessName = document.getElementById('application-business-name');

        businessName.textContent = `${offer.business_name} - ${offer.position}`;
        modal.classList.remove('hidden');
        modal.setAttribute('data-offer-id', offerId);

        // Limpiar formulario
        document.getElementById('applicant-name').value = '';
        document.getElementById('applicant-age').value = '';
        document.getElementById('applicant-phone').value = '';
        document.getElementById('applicant-experience').value = '';

        lucide.createIcons();
    },

    closeModal() {
        const modal = document.getElementById('application-modal');
        modal.classList.add('hidden');
        modal.removeAttribute('data-offer-id');
    },

    submitApplication() {
        const modal = document.getElementById('application-modal');
        const offerId = modal.getAttribute('data-offer-id');

        const name = document.getElementById('applicant-name').value.trim();
        const age = document.getElementById('applicant-age').value.trim();
        const phone = document.getElementById('applicant-phone').value.trim();
        const experience = document.getElementById('applicant-experience').value.trim();

        if (!name || !age || !phone) {
            fetch(`https://${GetParentResourceName()}/notify`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ message: 'Completa todos los campos obligatorios.', type: 'error' })
            });
            return;
        }

        fetch(`https://${GetParentResourceName()}/submitApplication`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                offerId: parseInt(offerId),
                name: name,
                age: parseInt(age),
                phone: phone,
                experience: experience
            })
        });

        this.closeModal();
    }
};
