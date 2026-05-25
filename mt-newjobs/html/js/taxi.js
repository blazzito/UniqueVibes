// ===========================
// TAXI QUICKACCESS CONTROLLER
// ===========================

const TaxiUI = {
    isOpen: false,
    alerts: [],
    currentAlertIndex: 0,
    isOnDuty: false,
    isBoss: false,
    vehicles: [],

    // NPC pending mission
    pendingNPCMission: null,
    activeNPCMission: null,
    npcCountdownInterval: null,

    init() {
        this.setupEventListeners();
        this.setupNUIListeners();

        // Actualizar tiempos cada 10 segundos (mismo patrón que policía)
        setInterval(function () {
            if (TaxiUI.alerts.length > 0 && $('.taxi-dispatch').hasClass('show')) {
                TaxiUI.renderDispatchAlerts();
            }
        }, 10000);
    },

    // ===========================
    // EVENT LISTENERS (DOM)
    // ===========================
    setupEventListeners() {
        // Tab switching
        $(document).on('click', '.taxi-tab', (e) => {
            const tab = $(e.currentTarget).data('tab');
            this.switchTab(tab);
        });

        // Duty toggle
        $(document).on('change', '#taxi-duty-check', (e) => {
            const checked = $(e.target).prop('checked');
            $('#taxi-duty-text').text(checked ? 'En Servicio' : 'Fuera de Servicio');
            this.postNUI('taxiAction', { action: 'toggleDuty' });
        });

        // Action buttons
        $(document).on('click', '#taxi-btn-vehicle', () => {
            this.showSubPanel('vehicle-select');
        });

        $(document).on('click', '#taxi-btn-save-vehicle', () => {
            this.postNUI('taxiAction', { action: 'saveVehicle' });
            this.close();
        });

        $(document).on('click', '#taxi-btn-mission', () => {
            this.postNUI('taxiAction', { action: 'requestMission' });
            this.close();
        });

        $(document).on('click', '#taxi-btn-wardrobe', () => {
            this.postNUI('taxiAction', { action: 'openWardrobe' });
            this.close();
        });

        $(document).on('click', '#taxi-btn-stash', () => {
            this.postNUI('taxiAction', { action: 'openStash' });
            this.close();
        });

        $(document).on('click', '#taxi-btn-toggle-dispatch', () => {
            this.postNUI('taxiAction', { action: 'toggleDispatch' });
        });

        $(document).on('click', '.taxi-toggle-config', (e) => {
            const config = $(e.currentTarget).data('config');
            this.postNUI('taxiAction', { action: 'toggleConfig', key: config });
        });

        $(document).on('click', '#taxi-btn-boss', () => {
            this.showSubPanel('boss-settings');
        });

        // Boss settings
        $(document).on('click', '.taxi-boss-setting', (e) => {
            const key = $(e.currentTarget).data('key');
            this.postNUI('taxiAction', { action: 'saveSetting', key: key });
            this.close();
        });

        // Back buttons for sub-panels
        $(document).on('click', '#taxi-boss-back', () => {
            $('.taxi-tab-content').removeClass('active');
            $('.taxi-tab-content[data-tab="acciones"]').addClass('active');
        });

        $(document).on('click', '#taxi-vehicle-back', () => {
            $('.taxi-tab-content').removeClass('active');
            $('.taxi-tab-content[data-tab="acciones"]').addClass('active');
        });

        // Dispatch navigation (separate panel)
        $(document).on('click', '#taxi-dispatch-prev', () => {
            if (this.currentAlertIndex > 0) {
                this.currentAlertIndex--;
                this.renderDispatchAlerts();
            }
        });

        $(document).on('click', '#taxi-dispatch-next', () => {
            if (this.currentAlertIndex < this.alerts.length - 1) {
                this.currentAlertIndex++;
                this.renderDispatchAlerts();
            }
        });

        // Dispatch alert card click (player requests)
        $(document).on('click', '.taxi-dispatch .taxi-alert-card', (e) => {
            const index = $(e.currentTarget).data('index');
            const alert = this.alerts[index];
            if (alert) {
                this.postNUI('taxiAction', {
                    action: 'acceptAlert',
                    coords: alert.coords,
                    playerID: alert.playerID,
                    alertIndex: index
                });
            }
        });

        // NPC mission — accept
        $(document).on('click', '.taxi-npc-accept', () => {
            this.postNUI('taxiNPCAccept', {});
            this.clearNPCMission();
        });

        // NPC mission — reject
        $(document).on('click', '.taxi-npc-reject', () => {
            this.postNUI('taxiNPCReject', {});
            this.clearNPCMission();
        });

        // Vehicle selection
        $(document).on('click', '.taxi-vehicle-option', (e) => {
            const model = $(e.currentTarget).data('model');
            this.postNUI('taxiAction', { action: 'spawnVehicle', model: model });
            this.close();
        });

        // Escape key - close menu only (dispatch only closes with F6)
        $(document).on('keyup', (e) => {
            if (e.key === 'Escape') {
                if (this.isOpen) {
                    this.close();
                }
            }
        });

        // Keyboard shortcuts removed - now handled by native Lua keymappings
        // (LEFT/RIGHT/ENTER/DELETE work without NUI focus)

        // Make dispatch draggable (vanilla JS, no jQuery UI needed)
        const dispatchEl = document.querySelector('.taxi-dispatch');
        const handleEl = document.querySelector('.taxi-dispatch-header');
        if (dispatchEl && handleEl) {
            let isDragging = false;
            let offsetX = 0, offsetY = 0;

            handleEl.addEventListener('mousedown', (e) => {
                isDragging = true;
                const rect = dispatchEl.getBoundingClientRect();
                offsetX = e.clientX - rect.left;
                offsetY = e.clientY - rect.top;
                dispatchEl.style.transition = 'none';
                e.preventDefault();
            });

            document.addEventListener('mousemove', (e) => {
                if (!isDragging) return;
                let x = e.clientX - offsetX;
                let y = e.clientY - offsetY;
                // Containment
                x = Math.max(0, Math.min(x, window.innerWidth - dispatchEl.offsetWidth));
                y = Math.max(0, Math.min(y, window.innerHeight - dispatchEl.offsetHeight));
                dispatchEl.style.left = x + 'px';
                dispatchEl.style.top = y + 'px';
                dispatchEl.style.bottom = 'auto';
                dispatchEl.style.right = 'auto';
            });

            document.addEventListener('mouseup', () => {
                if (isDragging) {
                    isDragging = false;
                    dispatchEl.style.transition = '';
                }
            });
        }
    },

    // ===========================
    // NUI MESSAGE LISTENERS
    // ===========================
    setupNUIListeners() {
        window.addEventListener('message', (event) => {
            const data = event.data;

            switch (data.action) {
                case 'openTaxiMenu':
                    console.log('[TAXI NUI] openTaxiMenu received', data);
                    this.open(data);
                    break;
                case 'closeTaxiMenu':
                    // Called from Lua - just hide UI, don't post back
                    this.hide();
                    break;
                case 'taxiDutyChanged':
                    this.isOnDuty = data.duty;
                    $('#taxi-duty-check').prop('checked', data.duty);
                    break;
                case 'taxiAlertReceived':
                    this.addAlert(data.alert);
                    break;
                case 'taxiAlertsSync': {
                    let incomingAlerts = data.alerts || [];
                    // Siempre asegurar timestamp válido
                    let oldAlerts = this.alerts;
                    incomingAlerts.forEach(function (a) {
                        // Buscar timestamp existente de la misma alerta
                        var found = null;
                        for (var i = 0; i < oldAlerts.length; i++) {
                            if (oldAlerts[i].playerID == a.playerID && oldAlerts[i].code === a.code) {
                                found = oldAlerts[i];
                                break;
                            }
                        }
                        // Usar timestamp existente, o asignar nuevo
                        a.time = (found && found.time) ? found.time : Date.now();
                    });
                    this.alerts = incomingAlerts;
                    if (data.currentIndex !== undefined && data.currentIndex >= 0) {
                        this.currentAlertIndex = data.currentIndex;
                    } else {
                        this.currentAlertIndex = Math.max(0, this.alerts.length - 1);
                    }
                    this.renderDispatchAlerts();
                    this.updateDispatchBadge();
                    break;
                }
                case 'showDispatchFocus':
                    this.showDispatch();
                    break;
                case 'hideDispatchFocus':
                    this.hideDispatch();
                    break;
                case 'taxiNPCMissionPending':
                    this.showNPCMission(data);
                    break;
                case 'taxiNPCMissionCleared':
                    this.clearNPCMission();
                    break;
                case 'taxiNPCMissionActive':
                    this.updateActiveNPCMission(data);
                    break;
            }
        });
    },

    // ===========================
    // OPEN / CLOSE
    // ===========================
    open(data) {
        this.isOpen = true;
        const context = data.context || 'f6';
        this.isOnDuty = data.isOnDuty || false;
        this.isBoss = data.isBoss || false;
        this.vehicles = data.vehicles || [];
        this.alerts = data.alerts || this.alerts;

        // Reset UI state
        $('.taxi-action-item').hide();
        $('.taxi-tab').show();
        $('.taxi-tab-list').show();
        
        // Contextual Filtering
        if (context === 'garage') {
            this.switchTab('vehicle-select');
            $('.taxi-tab-list').hide();
        } else if (context === 'duty') {
            $('.taxi-tab-list').hide();
            $('.taxi-action-item[data-context="duty"]').show();
            this.switchTab('acciones');
        } else {
            // F6 Menu
            $('.taxi-action-item[data-context="f6"]').show();
            if (!this.isBoss) $('.taxi-tab[data-tab="boss"]').hide();
            this.switchTab('acciones');
        }

        // Set duty toggle
        $('#taxi-duty-check').prop('checked', this.isOnDuty);
        $('#taxi-duty-text').text(this.isOnDuty ? 'En Servicio' : 'Fuera de Servicio');

        // Update duty count
        if (data.dutyCount !== undefined) {
            $('#taxi-duty-count').text(data.dutyCount + ' taxistas en servicio');
        }

        // Populate vehicle list
        this.populateVehicles();

        // Show main panel
        $('.taxi-quickaccess').addClass('show');
    },

    close() {
        // User-initiated close (Escape, button) - notify Lua to release focus
        if (!this.isOpen) return;
        this.isOpen = false;
        $('.taxi-quickaccess').removeClass('show');
        this.postNUI('taxiClose', {});
    },

    hide() {
        // Lua-initiated close - just hide UI, don't post back
        this.isOpen = false;
        $('.taxi-quickaccess').removeClass('show');
    },

    // ===========================
    // TAB SYSTEM
    // ===========================
    switchTab(tab) {
        $('.taxi-tab').removeClass('active');
        $(`.taxi-tab[data-tab="${tab}"]`).addClass('active');

        $('.taxi-tab-content').removeClass('active');
        $(`.taxi-tab-content[data-tab="${tab}"]`).addClass('active');
    },

    // ===========================
    // SUB-PANEL NAVIGATION
    // ===========================

    showSubPanel(panel) {
        $('.taxi-tab-content').removeClass('active');
        $(`.taxi-tab-content[data-tab="${panel}"]`).addClass('active');
    },

    // ===========================
    // ALERTS
    // ===========================
    addAlert(alert) {
        // Asignar timestamp JS para cálculo de tiempo relativo
        alert.time = Date.now();
        // Agregar la nueva alerta al principio (más reciente primero)
        this.alerts.unshift(alert);
        // Mostrar la nueva alerta (índice 0)
        this.currentAlertIndex = 0;
        this.renderDispatchAlerts();
        this.updateDispatchBadge();
        this.showDispatch();
    },

    renderDispatchAlerts() {
        const container = $('#taxi-dispatch-list');
        container.empty();

        const hasActiveNPC = !!this.activeNPCMission;
        const hasNPC = !!this.pendingNPCMission;
        const hasAlerts = this.alerts.length > 0;

        if (hasActiveNPC) {
            const mission = this.activeNPCMission;
            const stageText = mission.stage === 'dropoff' ? 'Pasajero a bordo' : 'Carrera aceptada';
            const stageHint = mission.stage === 'dropoff'
                ? `Destino: ${mission.dropoffLabel || 'Zona desconocida'}`
                : `Recoge en: ${mission.pickupLabel || 'Zona desconocida'}`;

            container.append(`
                <div class="taxi-alert-card alerta taxi-npc-active-card">
                    <div class="taxi-alert-top">
                        <div class="alert-title">Carrera NPC en curso</div>
                        <div class="alert-distance"><i class="fa-solid fa-circle-check"></i>${stageText}</div>
                    </div>
                    <div class="alert-description">${stageHint}</div>
                    <div class="alert-data">
                        <div class="alert-location"><i class="fa-solid fa-location-dot"></i>${mission.pickupLabel || 'Zona desconocida'}</div>
                        <div class="alert-code"><i class="fa-solid fa-flag-checkered"></i>${mission.dropoffLabel || 'Zona desconocida'}</div>
                        <div class="alert-time"><i class="fa-solid fa-dollar-sign"></i>$${mission.payment || 0}</div>
                    </div>
                </div>
            `);
        }

        // ── NPC pending card (mismo layout que dispatch) ──
        if (hasNPC) {
            const npc = this.pendingNPCMission;
            const secsLeft = Math.max(0, Math.ceil((npc.timeoutAt - Date.now()) / 1000));
            container.append(`
                <div class="taxi-alert-card alerta taxi-npc-pending-card" id="taxi-npc-pending">
                    <div class="taxi-alert-top">
                        <div class="alert-title">Solicitud de Taxi NPC</div>
                        <div class="alert-distance"><i class="fa-solid fa-hourglass-half"></i><span id="taxi-npc-countdown">${secsLeft}s</span></div>
                    </div>
                    <div class="alert-description">Cliente NPC esperando recogida. Acepta con ↑ o rechaza con ↓.</div>
                    <div class="alert-data">
                        <div class="alert-location"><i class="fa-solid fa-location-dot"></i>${npc.pickupLabel || 'Zona desconocida'}</div>
                        <div class="alert-code"><i class="fa-solid fa-flag-checkered"></i>${npc.dropoffLabel || 'Zona desconocida'}</div>
                        <div class="alert-time"><i class="fa-solid fa-dollar-sign"></i>$${npc.payment || 0}</div>
                    </div>
                </div>
            `);
        }

        if (!hasAlerts) {
            if (!hasNPC && !hasActiveNPC) {
                container.html(`
                    <div class="taxi-no-alerts">
                        <i class="fa-solid fa-inbox"></i>
                        <span>No hay solicitudes</span>
                    </div>
                `);
            }
            $('#taxi-dispatch-nav').css('display', 'none');
            return;
        }

        // ── Normal alert ──────────────────────────────────
        $('#taxi-dispatch-nav').css('display', 'flex');
        $('#taxi-dispatch-position').text(`${this.currentAlertIndex + 1}/${this.alerts.length}`);

        const alert = this.alerts[this.currentAlertIndex];
        if (!alert) return;

        const timeAgo = this.getTimeAgo(alert.time);
        const acceptedClass = alert.acceptedBy ? ' accepted' : '';
        const acceptedBadge = alert.acceptedBy
            ? `<div class="taxi-alert-accepted"><i class="fa-solid fa-user-check"></i> Atendida por ${alert.acceptedBy}</div>`
            : '';
        const distanceText = alert.distanceText || '-- m';

        container.append(`
            <div class="taxi-alert-card alerta${acceptedClass}" data-index="${this.currentAlertIndex}">
                <div class="taxi-alert-top">
                    <div class="alert-title">${alert.street || 'Zona desconocida'}</div>
                    <div class="alert-distance"><i class="fa-solid fa-road"></i>${distanceText}</div>
                </div>
                <div class="alert-description">${alert.message || 'Sin mensaje'}</div>
                <div class="alert-data">
                    <div class="alert-location"><i class="fa-solid fa-location-dot"></i>${alert.street || 'Zona desconocida'}</div>
                    <div class="alert-code"><i class="fa-solid fa-list-ol"></i>#${alert.code || 'TAXI'}</div>
                    <div class="alert-time"><i class="fa-solid fa-clock"></i>${timeAgo}</div>
                    ${acceptedBadge}
                </div>
            </div>
        `);
    },

    showNPCMission(data) {
        // Clear previous if any
        if (this.npcCountdownInterval) clearInterval(this.npcCountdownInterval);

        const timeout = data.timeout || 30;
        this.pendingNPCMission = {
            pickupLabel:  data.pickupLabel  || 'Zona desconocida',
            dropoffLabel: data.dropoffLabel || 'Zona desconocida',
            payment:      data.payment      || 0,
            timeoutAt:    Date.now() + timeout * 1000,
        };

        this.renderDispatchAlerts();
        this.updateDispatchBadge();
        this.showDispatch();

        // Countdown tick
        this.npcCountdownInterval = setInterval(() => {
            const el = document.getElementById('taxi-npc-countdown');
            if (!this.pendingNPCMission) { clearInterval(this.npcCountdownInterval); return; }
            const secsLeft = Math.max(0, Math.ceil((this.pendingNPCMission.timeoutAt - Date.now()) / 1000));
            if (el) el.textContent = secsLeft + 's';
            if (secsLeft <= 0) {
                clearInterval(this.npcCountdownInterval);
                this.postNUI('taxiNPCReject', {});
                this.clearNPCMission();
            }
        }, 1000);
    },

    clearNPCMission() {
        if (this.npcCountdownInterval) { clearInterval(this.npcCountdownInterval); this.npcCountdownInterval = null; }
        this.pendingNPCMission = null;
        this.renderDispatchAlerts();
        this.updateDispatchBadge();
        // Mantener dispatch abierto aunque se cancele la NPC
    },

    updateActiveNPCMission(data) {
        if (data && data.active) {
            // Si pasa a activa, forzar limpieza del estado pendiente para evitar duplicados.
            if (this.npcCountdownInterval) {
                clearInterval(this.npcCountdownInterval);
                this.npcCountdownInterval = null;
            }
            this.pendingNPCMission = null;
            this.activeNPCMission = {
                stage: data.stage || 'pickup',
                pickupLabel: data.pickupLabel || 'Zona desconocida',
                dropoffLabel: data.dropoffLabel || 'Zona desconocida',
                payment: data.payment || 0
            };
        } else {
            this.activeNPCMission = null;
        }
        this.renderDispatchAlerts();
        this.updateDispatchBadge();
    },

    updateDispatchBadge() {
        const badge = $('#taxi-dispatch-count');
        const pendingCount = this.pendingNPCMission ? 1 : 0;
        const activeCount = this.activeNPCMission ? 1 : 0;
        badge.text(this.alerts.length + pendingCount + activeCount);
    },

    showDispatch() {
        $('.taxi-dispatch').addClass('show');
    },

    hideDispatch() {
        $('.taxi-dispatch').removeClass('show');
    },

    getTimeAgo: function (timestamp) {
        if (!timestamp) return 'ahora';
        var now = Date.now();
        var diff = Math.floor((now - timestamp) / 1000);
        if (diff < 0) diff = 0;

        if (diff < 60) {
            return 'Hace ' + diff + 's';
        } else if (diff < 3600) {
            return 'Hace ' + Math.floor(diff / 60) + ' min';
        } else {
            return 'Hace ' + Math.floor(diff / 3600) + 'h';
        }
    },

    // ===========================
    // VEHICLES
    // ===========================
    populateVehicles() {
        const container = $('#taxi-vehicle-list');
        container.empty();

        if (!this.vehicles || this.vehicles.length === 0) {
            container.html(`
                <div class="taxi-no-alerts" style="padding: 2vh;">
                    <i class="fa-solid fa-car"></i>
                    <span>No hay vehículos disponibles</span>
                </div>
            `);
            return;
        }

        this.vehicles.forEach(vehicle => {
            container.append(`
                <div class="taxi-action-item taxi-vehicle-option" data-model="${vehicle.model}">
                    <i class="fa-solid fa-taxi"></i>
                    <div class="taxi-action-text">
                        <span class="taxi-action-title">${vehicle.label}</span>
                        <span class="taxi-action-sub">${vehicle.model}</span>
                    </div>
                </div>
            `);
        });
    },

    // ===========================
    // NUI POST HELPER
    // ===========================
    postNUI(endpoint, data) {
        $.post(`https://${GetParentResourceName()}/${endpoint}`, JSON.stringify(data));
    }
};

// Initialize when DOM is ready
$(document).ready(function () {
    try {
        TaxiUI.init();
        if (typeof lucide !== 'undefined') {
            lucide.createIcons();
        }
    } catch (e) {
        console.error('[TAXI NUI] Error initializing UI:', e);
    }
});

