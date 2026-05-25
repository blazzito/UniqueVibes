
const robberiesFunctions = {
    robberies: [],   // { id, type, location, playerId, timestamp, status, expiresAt, locallyConfirmed, confirmedAt }

    // ── Countdown util ─────────────────────────────────────────
    formatCountdown: function(expiresAtSeconds) {
        const now  = Math.floor(Date.now() / 1000);
        const secs = Math.max(0, expiresAtSeconds - now);
        const m    = Math.floor(secs / 60);
        const s    = secs % 60;
        return String(m).padStart(2, '0') + ':' + String(s).padStart(2, '0');
    },

    getTimeAgo: function(timestamp) {
        const diff = Math.floor((Date.now() - timestamp) / 1000);
        if (diff < 60) return `Hace ${diff}s`;
        if (diff < 3600) return `Hace ${Math.floor(diff / 60)} min`;
        return `Hace ${Math.floor(diff / 3600)}h`;
    },

    // ── Actualizar SOLO los countdowns sin reconstruir el DOM ──
    tickCountdowns: function() {
        this.robberies.forEach(rob => {
            if (!rob.expiresAt) return;
            const cd = this.formatCountdown(rob.expiresAt);
            const $item = $('#robberies-list .robbery-item[data-id="' + rob.id + '"]');
            if (!$item.length) return;
            $item.find('.rp-countdown').text(cd);
        });
    },

    // ── Render completo (solo cuando cambia la lista) ──────────
    renderRobberies: function() {
        const $list = $('#robberies-list');
        $list.empty();

        if (this.robberies.length === 0) {
            $list.html(`
                <div class="no-robberies">
                    <i class="fas fa-check-circle"></i>
                    <span>No hay robos pendientes de confirmación</span>
                </div>
            `);
            return;
        }

        this.robberies.forEach(rob => {
            this._renderItem($list, rob);
        });
    },

    // ── Renderizar un único item (compacto, una fila) ─────────
    _renderItem: function($list, rob) {
        const isPending   = rob.status !== 'approved';
        const countdown   = rob.expiresAt ? this.formatCountdown(rob.expiresAt) : '--:--';
        const timeAgo     = this.getTimeAgo(rob.timestamp);
        const statusClass = isPending ? 'is-pending' : 'is-approved';

        const timeSection = isPending
            ? `<div class="rbi-time">
                   <i class="fas fa-hourglass-half"></i>
                   <span class="rp-timeago">${timeAgo}</span>
               </div>`
            : `<div class="rbi-status-approved">
                   <i class="fas fa-circle-check"></i>
                   <span>AUTORIZADO — <span class="rp-countdown">${countdown}</span></span>
               </div>`;

        const actionsSection = isPending
            ? `<div class="rbi-actions">
                   <button class="rbi-btn rbi-confirm btn-sound" data-id="${rob.id}">
                       <i class="fas fa-check"></i>
                       <span>Confirmar</span>
                   </button>
                   <button class="rbi-btn rbi-deny btn-sound" data-id="${rob.id}">
                       <i class="fas fa-times"></i>
                       <span>Denegar</span>
                   </button>
               </div>`
            : '';

        const typeIcon = isPending ? 'fas fa-store' : 'fas fa-shield-check';

        const $item = $(`
            <div class="robbery-item ${statusClass}" data-id="${rob.id}">
                <div class="rbi-type">
                    <i class="${typeIcon}"></i>
                    <span class="rbi-type-label">${rob.type}</span>
                </div>
                <div class="rbi-details">
                    <div class="rbi-detail-row">
                        <i class="fas fa-location-dot"></i>
                        <span>${rob.location}</span>
                    </div>
                    <div class="rbi-detail-row">
                        <i class="fas fa-user"></i>
                        <span>ID: ${rob.playerId}</span>
                    </div>
                </div>
                ${timeSection}
                ${actionsSection}
            </div>
        `);

        $list.append($item);
    },

    updateCount: function() {
        const total = this.robberies.length;
        $('.count-badge').text(total);
        total > 0 ? $('.count-badge').addClass('pulse') : $('.count-badge').removeClass('pulse');
    },

    // ── Agregar solicitud pendiente ────────────────────────────
    addRobbery: function(rob) {
        if (this.robberies.find(r => r.id === rob.id)) return;
        this.robberies.push(rob);
        this.renderRobberies();
        this.updateCount();
    },

    // ── Cambiar a estado aprobado ──────────────────────────────
    approveRobbery: function(id, expiresAt, type, location, playerId) {
        const existing = this.robberies.find(r => r.id === id);
        if (existing) {
            const wasAlreadyApproved = existing.status === 'approved';
            existing.status    = 'approved';
            existing.expiresAt = expiresAt;
            if (wasAlreadyApproved) {
                // Solo actualizar el countdown sin reconstruir el DOM
                this.tickCountdowns();
                return;
            }
        } else {
            this.robberies.push({
                id: id, type: type, location: location, playerId: playerId,
                timestamp: Date.now(), status: 'approved', expiresAt: expiresAt,
            });
        }
        this.renderRobberies();
        this.updateCount();
    },

    // ── Eliminar solicitud ─────────────────────────────────────
    removeRobbery: function(id) {
        const prev = this.robberies.length;
        this.robberies = this.robberies.filter(r => r.id !== id);
        if (this.robberies.length !== prev) {
            this.renderRobberies();
            this.updateCount();
        }
    },

    // ── Confirmar robo: actualización inmediata del DOM sin re-render completo ──
    confirmRobbery: function(robberyId) {
        const rob = this.robberies.find(r => r.id === robberyId);
        if (!rob || rob.status === 'approved') return;

        // Marcar como confirmado localmente (protege contra race condition del poll)
        rob.status           = 'approved';
        rob.expiresAt        = Math.floor(Date.now() / 1000) + 600;
        rob.locallyConfirmed = true;
        rob.confirmedAt      = Date.now();

        // Actualizar SOLO el item específico en el DOM (sin destruir toda la lista)
        const $item = $('#robberies-list .robbery-item[data-id="' + robberyId + '"]');
        if ($item.length) {
            $item.removeClass('is-pending').addClass('is-approved');
            // Cambiar icono del tipo
            $item.find('.rbi-type i').attr('class', 'fas fa-shield-check');
            // Reemplazar tiempo por estado aprobado
            $item.find('.rbi-time').replaceWith(`
                <div class="rbi-status-approved">
                    <i class="fas fa-circle-check"></i>
                    <span>AUTORIZADO — <span class="rp-countdown">${this.formatCountdown(rob.expiresAt)}</span></span>
                </div>
            `);
            // Quitar botones
            $item.find('.rbi-actions').remove();
        } else {
            // Fallback: re-render si el elemento no existe en el DOM
            this.renderRobberies();
        }

        this.updateCount();

        $.post('https://origen_police/confirmRobbery', JSON.stringify({
            id: robberyId, playerId: rob.playerId, type: rob.type, location: rob.location
        }));
    },

    denyRobbery: function(robberyId) {
        const rob = this.robberies.find(r => r.id === robberyId);
        if (!rob || rob.status === 'approved') return;

        // Actualización optimista: eliminar AHORA, sin esperar al servidor
        this.removeRobbery(robberyId);

        $.post('https://origen_police/denyRobbery', JSON.stringify({
            id: robberyId, playerId: rob.playerId, type: rob.type
        }));
    },

    init: function() {
        $(document).on('click', '.rbi-confirm', function() {
            const $btn = $(this);
            if ($btn.prop('disabled')) return;
            $btn.prop('disabled', true);
            robberiesFunctions.confirmRobbery(parseInt($btn.data('id')));
        });
        $(document).on('click', '.rbi-deny', function() {
            const $btn = $(this);
            if ($btn.prop('disabled')) return;
            $btn.prop('disabled', true);
            robberiesFunctions.denyRobbery(parseInt($btn.data('id')));
        });
    }
};

$(document).ready(function() {
    robberiesFunctions.init();

    // Tick de countdown: actualiza SOLO el texto, NO reconstruye el DOM
    setInterval(function() {
        robberiesFunctions.tickCountdowns();
    }, 1000);
});

// ── Polling ─────────────────────────────────────────────────────
let robberyPollInterval = null;

function parseResp(resp) {
    if (typeof resp === 'string') {
        try { return JSON.parse(resp); } catch(e) {}
    }
    return resp;
}

function syncRobberies(serverRequests) {
    const serverIds = new Set(serverRequests.map(r => r.id));
    let changed = false;

    // Eliminar items que ya no existen en servidor
    const prevLen = robberiesFunctions.robberies.length;
    robberiesFunctions.robberies = robberiesFunctions.robberies.filter(r => serverIds.has(r.id));
    if (robberiesFunctions.robberies.length !== prevLen) changed = true;

    // Añadir nuevos o actualizar estado si cambió
    serverRequests.forEach(function(req) {
        const expiresAtSec = req.expiresAt ? Math.floor(req.expiresAt / 1000) : null;
        const existing = robberiesFunctions.robberies.find(r => r.id === req.id);
        if (!existing) {
            robberiesFunctions.robberies.push({
                id:        req.id,
                type:      req.type,
                location:  req.location,
                playerId:  req.playerId,
                timestamp: req.timestamp || Date.now(),
                status:    req.status || 'pending',
                expiresAt: expiresAtSec,
            });
            changed = true;
        } else if (existing.status !== (req.status || 'pending')) {
            // Protección contra race condition: si fue confirmado localmente en los últimos 8 segundos,
            // no revertir el estado aunque el servidor aún no lo haya procesado
            const recentlyConfirmed = existing.locallyConfirmed && (Date.now() - (existing.confirmedAt || 0)) < 8000;
            if (!recentlyConfirmed) {
                existing.status    = req.status || 'pending';
                existing.expiresAt = expiresAtSec || existing.expiresAt;
                changed = true;
            }
        }
    });

    // Solo reconstruir el DOM si la lista cambió; los countdowns se actualizan por tick
    if (changed) {
        robberiesFunctions.renderRobberies();
        robberiesFunctions.updateCount();
    }
}

function startRobberyPoll() {
    if (robberyPollInterval) return;
    robberyPollInterval = setInterval(function() {
        $.post('https://origen_police/pollActiveRobberies', JSON.stringify({}), function(resp) {
            resp = parseResp(resp);
            if (resp && Array.isArray(resp.requests)) {
                syncRobberies(resp.requests);
            }
        }).fail(function() {});
    }, 15000);
}

function stopRobberyPoll() {
    if (robberyPollInterval) {
        clearInterval(robberyPollInterval);
        robberyPollInterval = null;
        robberiesFunctions.robberies = [];
        robberiesFunctions.renderRobberies();
        robberiesFunctions.updateCount();
    }
}

// ── Mensajes NUI ──────────────────────────────────────────────
window.addEventListener('message', function(event) {
    if (!event.data) return;

    if (event.data.open === true) {
        startRobberyPoll();
        $.post('https://origen_police/pollActiveRobberies', JSON.stringify({}), function(resp) {
            resp = parseResp(resp);
            if (resp && Array.isArray(resp.requests)) {
                syncRobberies(resp.requests);
            }
        }).fail(function() {});
        return;
    }

    if (event.data.action === 'addRobbery') {
        const req = event.data;
        robberiesFunctions.addRobbery({
            id: req.id, type: req.type, location: req.location, playerId: req.playerId,
            timestamp: Date.now(), status: 'pending',
            expiresAt: req.expiresAt || null,
        });
        return;
    }

    if (event.data.action === 'approveRobbery') {
        const req = event.data;
        robberiesFunctions.approveRobbery(
            req.id, req.expiresAt || null, req.type, req.location, req.playerId
        );
        return;
    }

    if (event.data.action === 'removeRobbery') {
        robberiesFunctions.removeRobbery(event.data.id);
        return;
    }
});

$(document).on('click', '.close-tablet, .close-menu', function() {
    stopRobberyPoll();
});
