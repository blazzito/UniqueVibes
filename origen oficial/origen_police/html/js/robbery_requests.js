const robberyRequestsFunctions = (() => {

    let currentRequests = [];
    let selectedId      = null;
    let expiryInterval  = null;
    let searchQuery     = '';

    function $tab() {
        const activeTab = $('.tabs-bar .tab.active').attr('data-tab');
        return $('#tab-' + activeTab);
    }

    function timeAgo(epoch) {
        if (!epoch) return '—';
        const diff = Math.floor(Date.now() / 1000) - Math.floor(epoch);
        if (diff < 5)    return 'ahora';
        if (diff < 60)   return `${diff}s`;
        if (diff < 3600) return `${Math.floor(diff / 60)}m`;
        return `${Math.floor(diff / 3600)}h`;
    }

    function secondsToCountdown(seconds) {
        if (seconds <= 0) return '00:00';
        const m = Math.floor(seconds / 60);
        const s = seconds % 60;
        return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
    }

    function statusLabel(status) {
        const labels = {
            pending: { text: (typeof Translations !== 'undefined' && Translations.Pending) || 'PENDING', cls: 'rr-status-pending' },
        };
        return labels[status] || { text: status.toUpperCase(), cls: '' };
    }

    function load() {
        fetch('getRobberyRequestList', {}).done((list) => {
            currentRequests = list || [];
            renderList();
            updateBadge();
            if (selectedId !== null) {
                const still = currentRequests.find(r => r.requestId === selectedId);
                if (still) renderDetail(still);
                else       clearDetail();
            }
        });
    }

    function renderList() {
        const $list = $tab().find('.rr-list');
        if (!$list.length) return;
        $list.html('');

        if (!currentRequests.length) {
            $list.html(`
                <div class="rr-empty-state">
                    <i class="fa-solid fa-shield-halved"></i>
                    <div>${Translations.NoRobberyRequests || 'No active robbery requests'}</div>
                </div>
            `);
            return;
        }

        const query   = searchQuery.toLowerCase().trim();
        const visible = query
            ? currentRequests.filter(r => (r.robberyLabel || '').toLowerCase().includes(query))
            : currentRequests;

        if (!visible.length) {
            $list.html(`
                <div class="rr-empty-state">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <div>${Translations.NoSearchResults || 'Sin coincidencias'}</div>
                </div>
            `);
            return;
        }

        visible.forEach(req => {
            const sl         = statusLabel(req.status);
            const isSelected = req.requestId === selectedId;
            const ago        = timeAgo(req.requestedAt);
            $list.append(`
                <div class="rr-list-item ${isSelected ? 'selected' : ''}" data-id="${req.requestId}">
                    <div class="rr-list-item-info">
                        <div class="rr-list-item-name">${req.robberyLabel}</div>
                        <div class="rr-list-item-meta">
                            <span><i class="fa-solid fa-user"></i> ${req.participants}</span>
                            <span><i class="fa-regular fa-clock"></i> ${ago}</span>
                        </div>
                    </div>
                    <div class="rr-list-item-right">
                        <span class="rr-status-badge ${sl.cls}">${sl.text}</span>
                        <div class="rr-list-item-gang">${req.gangLabel}</div>
                    </div>
                </div>
            `);
        });
    }

    function updateBadge() {
        const pending = currentRequests.filter(r => r.status === 'pending').length;
        const $badge  = $tab().find('.rr-active-count');
        const $num    = $badge.find('.rr-count-num');
        const pendingTitle = (typeof Translations !== 'undefined' && Translations.Pending) || 'Pending';
        $num.text(pending);
        $badge.attr('title', pending ? `${pending} ${pendingTitle}` : '');
        if (pending > 0) {
            $badge.css('display', 'inline-flex');
        } else {
            $badge.hide();
        }
    }

    function renderDetail(req) {
        selectedId = req.requestId;
        const sl   = statusLabel(req.status);
        const now  = Math.floor(Date.now() / 1000);
        const $t   = $tab();

        $t.find('.rr-list-item').removeClass('selected');
        $t.find(`.rr-list-item[data-id="${req.requestId}"]`).addClass('selected');

        const $img = $t.find('.rr-banner-img');
        if (req.robberyImage) {
            $img.attr('src', req.robberyImage).show();
        } else {
            $img.hide();
        }

        $t.find('.rr-detail-robbery-name').text(req.robberyLabel);
        $t.find('.rr-detail-gang-name').text(req.gangLabel);
        $t.find('.rr-detail-status-badge')
            .attr('class', 'rr-detail-status-badge rr-banner-badge rr-status-badge ' + sl.cls)
            .text(sl.text);

        $t.find('.rr-detail-requested-by').text(req.requestedBy || '—');
        $t.find('.rr-detail-requested-at').text(timeAgo(req.requestedAt));
        $t.find('.rr-detail-participants').text(`${req.participants} / ${req.maxParticipants}`);
        $t.find('.rr-detail-required-cops').text(req.requiredCops || '0');

        if (req.expiresAt && req.expiresAt > 0) {
            const left = req.expiresAt - now;
            $t.find('.rr-detail-expires').text(left > 0 ? secondsToCountdown(left) : 'EXPIRED');
        } else {
            $t.find('.rr-detail-expires').text('—');
        }

        $t.find('.rr-actions-pending').hide();

        if (req.status === 'pending') {
            $t.find('.rr-actions-pending').show();
            $t.find('.rr-btn-approve, .rr-btn-reject').attr('data-id', req.requestId);
        }

        $t.find('.rr-detail-placeholder').addClass('hidden');
        $t.find('.rr-detail-content').show();

        clearInterval(expiryInterval);
        expiryInterval = setInterval(() => {
            const $container = $tab();
            $container.find('.rr-detail-requested-at').text(timeAgo(req.requestedAt));
            if (req.expiresAt && req.expiresAt > 0) {
                const remaining = req.expiresAt - Math.floor(Date.now() / 1000);
                if (remaining > 0) {
                    $container.find('.rr-detail-expires').text(secondsToCountdown(remaining));
                } else {
                    $container.find('.rr-detail-expires').text('EXPIRED');
                    clearInterval(expiryInterval);
                }
            }
        }, 1000);
    }

    function clearDetail() {
        selectedId = null;
        clearInterval(expiryInterval);
        const $t = $tab();
        $t.find('.rr-list-item').removeClass('selected');
        $t.find('.rr-detail-content').hide();
        $t.find('.rr-detail-placeholder').removeClass('hidden');
    }

    function decide(requestId, action, reason) {
        const payload = { requestId, action };
        if (reason) payload.reason = reason;
        fetch('decideRobberyRequest', payload).done(() => {
            clearDetail();
            setTimeout(load, 300);
        });
    }

    function openRejectModal(requestId) {
        const title   = Translations.RejectRequest  || 'Rechazar solicitud';
        const label   = Translations.RejectReason   || 'Motivo de rechazo';
        const pholder = Translations.RejectReasonPh || 'Explicá por qué rechazás esta solicitud...';
        const confirm = Translations.ConfirmReject  || 'CONFIRMAR RECHAZO';
        const cancel  = Translations.Cancel         || 'Cancelar';

        const content = `
            <div class="rr-reject-modal">
                <p class="rr-reject-label">${label}</p>
                <textarea
                    class="rr-reject-textarea"
                    id="rr-reject-reason"
                    placeholder="${pholder}"
                    rows="4"
                    maxlength="300"
                ></textarea>
                <p class="rr-reject-error d-none">${Translations.RejectReasonRequired || 'El motivo es obligatorio.'}</p>
            </div>
        `;

        const footer = `<button class="btn-modal btn-danger-modal" onclick="robberyRequestsFunctions.confirmReject(${requestId})">${confirm}</button>`;

        OpenModal(title, content, footer, cancel, 45);

        setTimeout(() => {
            const $ta = $('#rr-reject-reason');
            $ta.focus();
            $ta.on('input.rr', function () {
                if ($(this).val().trim()) {
                    $(this).removeClass('rr-textarea-invalid');
                    $('.rr-reject-error').addClass('d-none');
                }
            });
        }, 120);
    }

    function confirmReject(requestId) {
        const reason = ($('#rr-reject-reason').val() || '').trim();
        if (!reason) {
            $('.rr-reject-error').removeClass('d-none');
            $('#rr-reject-reason').addClass('rr-textarea-invalid');
            return;
        }
        CloseModal();
        decide(requestId, 'rejected', reason);
    }

    function initEvents() {

        $(document).on('click', '.police .btn-robbery-requests', function () {
            if (!$(this).is(':visible')) return;
            searchQuery = '';
            policeFunctions.policeNavigation(
                Translations.RobberyRequests || 'Robbery Requests',
                $('.police-robbery-requests').html()
            );
            setTimeout(() => { load(); }, 400);
        });

        $(document).on('click', '.tab-content-menu .rr-list-item', function () {
            const id  = parseInt($(this).attr('data-id'));
            const req = currentRequests.find(r => r.requestId === id);
            if (req) renderDetail(req);
        });

        $(document).on('click', '.tab-content-menu .rr-btn-approve', function () {
            decide(parseInt($(this).attr('data-id')), 'approved');
        });

        $(document).on('click', '.tab-content-menu .rr-btn-reject', function () {
            openRejectModal(parseInt($(this).attr('data-id')));
        });

        $(document).on('input', '.tab-content-menu .rr-search-input', function () {
            searchQuery = $(this).val() || '';
            renderList();
            if (selectedId !== null) {
                const query = searchQuery.toLowerCase().trim();
                const still = currentRequests.find(r => r.requestId === selectedId);
                if (still && query && !(still.robberyLabel || '').toLowerCase().includes(query)) {
                    clearDetail();
                }
            }
        });

    }

    window.addEventListener('message', function (event) {
        if (event.data.action === 'robberyRequestRefresh') {
            if ($tab().find('.rr-list').length) load();
        }
    });

    return {
        init: initEvents,
        load,
        confirmReject,
    };

})();

$(document).ready(function () {
    robberyRequestsFunctions.init();
});
