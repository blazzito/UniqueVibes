
const alertsFunctions = {
    alerts: [],
    markers: {}, 
    activeAlertId: null,
    maxAlerts: 24, 
    maxAgeMs: 10 * 60 * 1000, 

    normalizeCode: function(code) {
        if (code == null) return '';
        const n = Number(code);
        return Number.isFinite(n) ? String(n) : String(code).trim();
    },

    alertIdFromCode: function(code) {
        return `dispatch-${this.normalizeCode(code)}`;
    },

    extractCoords: function(source) {
        if (!source) return null;
        const toCoords = (obj) => {
            if (!obj) return null;
            const x = Number(obj.x ?? obj.posX ?? obj.coordX ?? obj.lng ?? obj.lon);
            const y = Number(obj.y ?? obj.posY ?? obj.coordY ?? obj.lat);
            if (Number.isFinite(x) && Number.isFinite(y)) {
                return { x, y };
            }
            return null;
        };
        const arrToCoords = (arr) => {
            if (!Array.isArray(arr) || arr.length < 2) return null;
            const x = Number(arr[0]);
            const y = Number(arr[1]);
            return Number.isFinite(x) && Number.isFinite(y) ? { x, y } : null;
        };

        return (
            toCoords(source) ||
            arrToCoords(source.coords) ||
            toCoords(source.coords) ||
            toCoords(source.position) ||
            toCoords(source.pos) ||
            toCoords(source.location) ||
            toCoords(source.locationCoords) ||
            toCoords(source.xyz) ||
            arrToCoords(source.xyz) ||
            toCoords(source.data && source.data.coords) ||
            toCoords(source.data && source.data.position) ||
            toCoords(source.metadata && source.metadata.coords) ||
            toCoords(source.metadata && source.metadata.position) ||
            toCoords(source.alert && source.alert.coords) ||
            toCoords(source.alert && source.alert.position) ||
            (source.coords && Number.isFinite(Number(source.coords.lng)) && Number.isFinite(Number(source.coords.lat))
                ? { x: Number(source.coords.lng), y: Number(source.coords.lat) }
                : null) ||
            null
        );
    },

    
    upsertAlert: function(alert) {
        const nextAlert = { ...alert };
        if (nextAlert.dispatchCode != null) {
            nextAlert.dispatchCode = this.normalizeCode(nextAlert.dispatchCode);
            nextAlert.id = this.alertIdFromCode(nextAlert.dispatchCode);
        } else if (nextAlert.id && String(nextAlert.id).startsWith('dispatch-')) {
            nextAlert.dispatchCode = this.normalizeCode(String(nextAlert.id).replace('dispatch-', ''));
            nextAlert.id = this.alertIdFromCode(nextAlert.dispatchCode);
        }

        const idx = this.alerts.findIndex(a => String(a.id) === String(nextAlert.id));
        if (idx >= 0) {
            
            const safeCoords = nextAlert.coords && nextAlert.coords.x != null && nextAlert.coords.y != null
                ? nextAlert.coords
                : this.alerts[idx].coords;
            const safePlayerId = (nextAlert.playerId != null && String(nextAlert.playerId).trim() !== '' && String(nextAlert.playerId).trim() !== '-')
                ? nextAlert.playerId
                : this.alerts[idx].playerId;
            this.alerts[idx] = { ...this.alerts[idx], ...nextAlert, coords: safeCoords, playerId: safePlayerId };
        } else {
            this.alerts.push(nextAlert);
        }
        this.cleanupOldAlerts();
        this.renderAlerts();
        this.updateCount();
        
        
        const target = idx >= 0 ? this.alerts[idx] : this.alerts[this.alerts.length - 1];
        
        this.addMarkerToMap(target);
    },

    
    addAlert: function(alert) {
        this.upsertAlert(alert);
    },

    
    removeAlert: function(alertId) {
        this.alerts = this.alerts.filter(a => a.id !== alertId);
        this.renderAlerts();
        this.updateCount();
        this.removeMarkerFromMap(alertId);
        
        if (this.activeAlertId === alertId) {
            this.activeAlertId = null;
        }
    },

    
    removeByCode: function(code) {
        const alertId = this.alertIdFromCode(code);
        this.removeAlert(alertId);
    },

    cleanupOldAlerts: function() {
        const now = Date.now();
        const toRemove = [];

        this.alerts.forEach(a => {
            if (!a || !a.timestamp) return;
            if (now - a.timestamp > this.maxAgeMs) toRemove.push(a.id);
        });
        toRemove.forEach(id => this.removeMarkerFromMap(id));

        if (toRemove.length > 0) {
            this.alerts = this.alerts.filter(a => !toRemove.includes(a.id));
        }

        
        if (this.alerts.length > this.maxAlerts) {
            this.alerts.sort((a, b) => (b.timestamp || 0) - (a.timestamp || 0));
            const keepIds = new Set(this.alerts.slice(0, this.maxAlerts).map(a => a.id));
            this.alerts.forEach(a => {
                if (!keepIds.has(a.id)) this.removeMarkerFromMap(a.id);
            });
            this.alerts = this.alerts.filter(a => keepIds.has(a.id));
        }
    },

    
    updateCount: function() {
        $('.alerts-badge').text(this.alerts.length);
        
        if (this.alerts.length > 0) {
            $('.alerts-badge').addClass('pulse');
        } else {
            $('.alerts-badge').removeClass('pulse');
        }
    },

    
    renderAlerts: function() {
        const $list = $('#alerts-panel-list');
        
        
        if ($list.length === 0) {
            
            
            return;
        }
        
        $list.empty();

        if (this.alerts.length === 0) {
            $list.html(`
                <div class="no-alerts">
                    <i class="fas fa-info-circle"></i>
                    <span translate="NoAlerts">No hay avisos de entorno</span>
                </div>
            `);
            return;
        }

        this.alerts.forEach(alert => {
            const timeAgo = this.getTimeAgo(alert.timestamp);
            const isActive = this.activeAlertId === alert.id ? 'active' : '';
            
            const iconClass = this.getAlertIcon(alert.type);
            
            const $item = $(`
                <div class="alert-item ${isActive}" data-id="${alert.id}">
                    <div class="alert-icon">
                        <i class="${iconClass}"></i>
                    </div>
                    <div class="alert-content">
                        <div class="alert-type">${alert.type}</div>
                        <div class="alert-location">
                            <i class="fas fa-location-dot"></i>
                            <span>${alert.location}</span>
                        </div>
                        <div class="alert-player">
                            <i class="fas fa-user"></i>
                            <span>ID: ${alert.playerId || '-'}</span>
                        </div>
                        <div class="alert-time">${timeAgo}</div>
                    </div>
                    <button class="alert-view-btn btn-sound" data-id="${alert.id}">
                        <i class="fas fa-map-marker-alt"></i>
                    </button>
                </div>
            `);

            
            $item.on('click', function(e) {
                if (!$(e.target).closest('.alert-view-btn').length) {
                    alertsFunctions.viewAlertOnMap(alert.id);
                }
            });

            $list.append($item);
        });
    },

    
    getAlertIcon: function(type) {
        const icons = {
            'emergencia': 'fas fa-exclamation-triangle',
            'accidente': 'fas fa-car-crash',
            'robo': 'fas fa-mask',
            'incendio': 'fas fa-fire',
            'tiroteo': 'fas fa-gun',
            'medico': 'fas fa-ambulance',
            'persecucion': 'fas fa-car-side',
            'asalto': 'fas fa-hand-fist',
            'default': 'fas fa-bullhorn'
        };
        
        const lowerType = type.toLowerCase();
        for (const key in icons) {
            if (lowerType.includes(key)) {
                return icons[key];
            }
        }
        return icons.default;
    },

    
    getTimeAgo: function(timestamp) {
        const now = Date.now();
        const diff = Math.floor((now - timestamp) / 1000);

        if (diff < 60) {
            return `Hace ${diff}s`;
        } else if (diff < 3600) {
            return `Hace ${Math.floor(diff / 60)} min`;
        } else {
            return `Hace ${Math.floor(diff / 3600)}h`;
        }
    },

    
    viewAlertOnMap: function(alertId) {
        const alert = this.alerts.find(a => a.id === alertId);
        if (!alert) return;

        
        this.activeAlertId = alertId;
        $('.alert-item').removeClass('active');
        $(`.alert-item[data-id="${alertId}"]`).addClass('active');

        
        if (typeof mapHome !== 'undefined' && mapHome) {
            const coords = alert.coords;
            if (coords && coords.x != null && coords.y != null) {
                
                const leafletCoords = this.gtaToLeaflet(coords.x, coords.y);
                
                
                mapHome.flyTo(leafletCoords, 4, {
                    duration: 1.5,
                    easeLinearity: 0.25
                });

                
                const marker = this.markers[alertId];
                if (marker) {
                    this.pulseMarker(marker);
                }
            }
        }
    },

    
    addMarkerToMap: function(alert) {
        
        if (typeof mapHome === 'undefined' || !mapHome) return;
        
        const extractedCoords = this.extractCoords(alert);
        
        if (!extractedCoords || extractedCoords.x == null || extractedCoords.y == null) return;
        
        
        this.removeMarkerFromMap(alert.id);
        
        const x = Number(extractedCoords.x);
        const y = Number(extractedCoords.y);
        if (!Number.isFinite(x) || !Number.isFinite(y)) return;
        
        
        const coords = [y, x];
        
        
        const icon = L.icon({
            iconUrl: './img/webp/alert2.webp',
            className: 'alert-blip',
            iconSize: [32, 32],
            iconAnchor: [16, 16],
            popupAnchor: [8, -16]
        });
        
        
        const marker = L.marker(coords, { icon: icon })
            .addTo(mapHome)
            .bindPopup(`
                <div style="font-family: 'Quicksand', sans-serif; text-align: center;">
                    <strong>${alert.type}</strong><br>
                    <small>${alert.location}</small><br>
                    <small>ID: ${alert.playerId || '-'}</small>
                </div>
            `);
        
        
        marker.on('click', () => {
            this.viewAlertOnMap(alert.id);
        });
        
        this.markers[alert.id] = marker;
    },

    
    syncMarkersWithMap: function() {
        this.markers = {};
        if (typeof mapHome === 'undefined' || !mapHome) return;
        this.alerts.forEach(alert => this.addMarkerToMap(alert));
    },

    
    upsertDispatchAlert: function(dispatchAlert) {
        
        if (!dispatchAlert || dispatchAlert.code == null) return;
        const parsedCoords = this.extractCoords(dispatchAlert);
        
        const meta = dispatchAlert.metadata || {};
        const playerIdRaw = (
            dispatchAlert.playerID ||
            dispatchAlert.playerId ||
            dispatchAlert.source ||
            dispatchAlert.id ||
            meta.playerId ||
            meta.id ||
            meta.source ||
            meta.cid ||
            '-'
        );
        const playerId = (playerIdRaw != null && String(playerIdRaw).trim() !== '') ? String(playerIdRaw).trim() : '-';
        const elapsed = dispatchAlert.time != null ? dispatchAlert.time : (dispatchAlert.ago || 0);
        const elapsedSeconds = Number(elapsed);
        const timestamp = Number.isFinite(elapsedSeconds) ? (Date.now() - (elapsedSeconds * 1000)) : Date.now();
        this.upsertAlert({
            dispatchCode: dispatchAlert.code,
            type: dispatchAlert.title || 'Aviso',
            location: dispatchAlert.street || 'Desconocido',
            playerId,
            coords: parsedCoords || null,
            timestamp
        });
    },

    syncFromCentralStore: function() {
        
        
        if (typeof centralFunctions === 'undefined' || !Array.isArray(centralFunctions.alerts)) return;
        centralFunctions.alerts.forEach((alert) => {
            if (alert && alert.code != null) {
                
                const coords = alert.coords ? {
                    x: alert.coords.x,
                    y: alert.coords.y,
                    z: alert.coords.z
                } : null;
                
                this.upsertDispatchAlert({
                    ...alert,
                    coords: coords,
                    playerID: alert.playerID || alert.playerId || alert.source || (alert.metadata && (alert.metadata.playerId || alert.metadata.id || alert.metadata.source))
                });
            }
        });
    },

    
    removeMarkerFromMap: function(alertId) {
        if (this.markers[alertId]) {
            if (typeof mapHome !== 'undefined' && mapHome) {
                mapHome.removeLayer(this.markers[alertId]);
            }
            delete this.markers[alertId];
        }
    },

    
    pulseMarker: function(marker) {
        if (marker && marker.getElement) {
            const element = marker.getElement();
            if (element) {
                const markerDiv = element.querySelector('.custom-alert-marker');
                if (markerDiv) {
                    markerDiv.style.animation = 'none';
                    setTimeout(() => {
                        markerDiv.style.animation = 'pulse 0.5s 3';
                    }, 10);
                }
            }
        }
    },

    
    init: function() {
        
        $(document).on('click', '.alert-view-btn', function(e) {
            e.stopPropagation();
            const alertId = String($(this).data('id'));
            alertsFunctions.viewAlertOnMap(alertId);
        });

        
        setInterval(() => {
            alertsFunctions.cleanupOldAlerts();
            if (alertsFunctions.alerts.length > 0) {
                alertsFunctions.renderAlerts();
                alertsFunctions.updateCount();
            }
        }, 30000);

        
        
        
        

        
        this.renderAlerts();
        this.updateCount();
    }
};


$(document).ready(function() {
    alertsFunctions.init();
});














