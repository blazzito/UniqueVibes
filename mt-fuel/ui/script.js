let currentFuelData = {};
let allStations = [];
let currentStationId = null;
let selectedFuel = null;
let currentTab = 'stations';
let isDragging = false;
let currentPoints = null;

// --- ESCUCHA DE MENSAJES NUI ---
window.addEventListener('message', function(event) {
    const action = event.data.action;
    const data = event.data.data;

    if (action === "openFuel") {
        openRefuelMenu(data);
    } else if (action === "openAdminFuel") {
        openAdminMenu(data);
    } else if (action === "hideAllTemporarily") {
        $("#admin-container, #modal-overlay").fadeOut(200);
    } else if (action === "zoneCreated") {
        $("#admin-container, #modal-overlay").fadeIn(200);
        $("#zone-status").html('<div class="status-alert success"><i data-lucide="check-circle"></i> Zona Guardada Temporalmente</div>');
        currentPoints = data.points;
        console.log("Zona capturada en UI:", JSON.stringify(currentPoints));
        lucide.createIcons();
    } else if (action === "close") {
        closeAll();
    }
});

// --- MENU DE REPOSTAJE (USUARIO) ---
function openRefuelMenu(data) {
    $("#refuel-container").fadeIn(300);
    $("#fuel-list").empty();
    
    currentFuelData = data;
    selectedFuel = null;
    
    const fuels = data.fuelTypes;
    Object.keys(fuels).forEach(key => {
        if (key === key.toLowerCase()) {
            const fuel = fuels[key];
            const fuelElement = `
                <div class="fuel-item" id="fuel-${key}" onclick="selectFuel('${key}')">
                    <div class="price-tag">$${fuel.price}</div>
                    <i data-lucide="droplet"></i>
                    <div class="name">${fuel.label}</div>
                </div>
            `;
            $("#fuel-list").append(fuelElement);
        }
    });

    const fuelPercent = (data.currentFuel / 100) * 100;
    $("#gauge-current").css("width", fuelPercent + "%");
    $("#gauge-selected").css("width", "0%");
    $("#selected-amount").text(0);
    $("#total-price").text(0);

    lucide.createIcons();
}

function selectFuel(key) {
    selectedFuel = key;
    $(".fuel-item").removeClass("selected");
    $(`#fuel-${key}`).addClass("selected");
}

$(".progress-bar-container").on("mousedown", function(e) {
    if (!selectedFuel) return;
    isDragging = true;
    updateGaugeFromClick(e);
});

$(document).on("mousemove", function(e) {
    if (isDragging) updateGaugeFromClick(e);
});

$(document).on("mouseup", function() {
    isDragging = false;
});

function updateGaugeFromClick(e) {
    const container = $(".progress-bar-container");
    const offset = container.offset();
    const width = container.width();
    const clickX = e.pageX - offset.left;
    let percent = (clickX / width) * 100;
    
    const currentFuelPercent = (currentFuelData.currentFuel / 100) * 100;
    
    // Si ya está lleno, no permitir mover nada
    if (currentFuelPercent >= 99.5) {
        $("#selected-amount").text(0);
        $("#total-price").text("0.00");
        return;
    }

    if (percent < currentFuelPercent) percent = currentFuelPercent;
    if (percent > 100) percent = 100;
    
    const fillPercent = percent - currentFuelPercent;
    $("#gauge-selected").css("width", fillPercent + "%").css("left", currentFuelPercent + "%");
    
    const litersToAdd = (fillPercent / 100) * 100;
    const price = litersToAdd * currentFuelData.fuelTypes[selectedFuel].price;
    
    $("#selected-amount").text(litersToAdd.toFixed(0));
    $("#total-price").text(price.toFixed(2));
}

function payFuel(type) {
    const amount = parseFloat($("#selected-amount").text());
    if (!selectedFuel || amount <= 0) return;
    
    $.post(`https://${GetParentResourceName()}/payFuel`, JSON.stringify({
        type: type,
        fuelType: selectedFuel,
        amount: amount,
        price: parseFloat($("#total-price").text())
    }));
    closeAll();
}

function buyJerrycan(type) {
    $.post(`https://${GetParentResourceName()}/buyJerrycan`, JSON.stringify({
        type: type,
        price: 50 // Se puede hacer dinámico desde Config si se desea
    }));
    closeAll();
}

// --- PANEL DE ADMINISTRACIÓN ---
function openAdminMenu(data) {
    $("#admin-container").fadeIn(300);
    allStations = data.stations;
    renderStations();
    lucide.createIcons();
}

function switchTab(tab) {
    currentTab = tab;
    $(".tab-item").removeClass("active");
    $(`.tab-item[onclick="switchTab('${tab}')"]`).addClass("active");
    renderStations();
    lucide.createIcons();
}

function renderStations() {
    const list = $("#stations-list");
    list.empty();

    const search = $("#station-search").val().toLowerCase();

    allStations.forEach(s => {
        if (s.name.toLowerCase().includes(search)) {
            if (currentTab === 'stations') {
                list.append(createStationCard(s));
            } else if (currentTab === 'stock') {
                list.append(createStockCard(s));
            } else if (currentTab === 'prices') {
                list.append(createPriceCard(s));
            }
        }
    });
    lucide.createIcons();
}

function createStationCard(s) {
    return `
        <div class="station-card">
            <div class="station-header">
                <div class="station-title">
                    <h3>${s.name}</h3>
                    <div class="station-id">ID: ${s.id}</div>
                </div>
                <div class="badge ${s.active ? 'badge-active' : 'badge-inactive'}">
                    ${s.active ? 'ACTIVA' : 'INACTIVA'}
                </div>
            </div>
            <div class="station-info" style="margin: 1.5vh 0;">
                <div style="display:flex; align-items:center; gap:1vh; color:rgba(255,255,255,0.6); font-size:1.2vh;">
                    <i data-lucide="map-pin" style="width:1.4vh; height:1.4vh; color:var(--primary-color);"></i> 
                    ${s.coords.x.toFixed(2)}, ${s.coords.y.toFixed(2)}, ${s.coords.z.toFixed(2)}
                </div>
            </div>
            <div class="station-actions" style="display:flex; gap:1vh;">
                <button class="action-btn" onclick="openEditModal(${s.id})" style="flex:1; border-color:#3b82f6; color:#3b82f6; background:rgba(59,130,246,0.1);">EDITAR</button>
                <button class="action-btn" onclick="toggleStation(${s.id})" style="flex:1; border-color:#fa0; color:#fa0; background:rgba(255,170,0,0.1);">${s.active ? 'DESACTIVAR' : 'ACTIVAR'}</button>
                <button class="action-btn" onclick="deleteStation(${s.id})" style="flex:1; border-color:#f44; color:#f44; background:rgba(244,67,54,0.1);">ELIMINAR</button>
            </div>
        </div>
    `;
}

function createStockCard(s) {
    return `
        <div class="station-card">
            <div class="station-header"><h3>${s.name} - INVENTARIO</h3></div>
            <div class="fuel-types" style="margin-top:2vh; display:flex; flex-direction:column; gap:1.5vh;">
                ${renderFuelStockRow(s, 'a', '98 OCT')}
                ${renderFuelStockRow(s, 'b', '95 OCT')}
                ${renderFuelStockRow(s, 'c', 'QUERO')}
            </div>
        </div>
    `;
}

function renderFuelStockRow(s, type, label) {
    const amount = s.stock[type] || 0;
    const percent = (amount / 15000) * 100;
    return `
        <div class="fuel-row-stock">
            <div style="display:flex; justify-content:space-between; margin-bottom:0.5vh; font-size:1.1vh; font-family:'Evogria';">
                <span>${label}</span>
                <span style="color:${percent < 20 ? '#f44' : '#0f8'}">${amount} L</span>
            </div>
            <div style="width:100%; height:0.8vh; background:rgba(255,255,255,0.05); border-radius:0.4vh; overflow:hidden;">
                <div style="width:${percent}%; height:100%; background:${percent < 20 ? '#f44' : 'var(--primary-color)'}; transition:width 0.5s ease;"></div>
            </div>
        </div>
    `;
}

function createPriceCard(s) {
    return `
        <div class="station-card">
            <div class="station-header"><h3>${s.name} - PRECIOS</h3></div>
            <div class="price-list" style="margin-top:2vh; display:flex; flex-direction:column; gap:1vh;">
                ${renderPriceRow(s, 'a', '98 OCT')}
                ${renderPriceRow(s, 'b', '95 OCT')}
                ${renderPriceRow(s, 'c', 'QUEROSENO')}
            </div>
        </div>
    `;
}

function renderPriceRow(s, type, label) {
    return `
        <div style="display:flex; justify-content:space-between; align-items:center; background:rgba(0,0,0,0.2); padding:1vh; border-radius:0.6vh;">
            <span style="font-family:'Evogria'; font-size:1.2vh;">${label}</span>
            <div style="display:flex; align-items:center; gap:0.5vh; background:rgba(255,255,255,0.05); padding:0.5vh 1vh; border-radius:0.4vh;">
                <span style="color:var(--primary-color); font-weight:bold;">$</span>
                <input type="number" value="${s.prices[type]}" step="0.01" onchange="updatePrice(${s.id}, '${type}', this.value)" style="background:transparent; border:none; color:#fff; width:6vh; text-align:center; outline:none;">
            </div>
        </div>
    `;
}

function toggleStation(id) {
    const station = allStations.find(s => s.id === id);
    $.post(`https://${GetParentResourceName()}/toggleStationActive`, JSON.stringify({
        stationId: id,
        active: !station.active
    }), function(res) {
        if (res.success) {
            allStations = res.stations;
            renderStations();
        }
    });
}

function deleteStation(id) {
    const s = allStations.find(st => st.id === id);
    $("#confirm-text").text(`¿Estás seguro de que quieres eliminar la estación "${s.name}"? Esta acción no se puede deshacer.`);
    $("#confirm-modal").fadeIn(200);
    $("#confirm-btn").off("click").on("click", function() {
        $.post(`https://${GetParentResourceName()}/deleteStation`, JSON.stringify({
            stationId: id
        }));
        closeConfirm();
        setTimeout(refreshData, 500);
    });
    lucide.createIcons();
}

function closeConfirm() {
    $("#confirm-modal").fadeOut(200);
}

function updatePrice(id, type, value) {
    $.post(`https://${GetParentResourceName()}/setStationPrice`, JSON.stringify({
        stationId: id,
        fuelType: type,
        price: parseFloat(value)
    }));
}

function refillAll() {
    $.post(`https://${GetParentResourceName()}/refillAllStations`, JSON.stringify({}), function(res) {
        if (res.success) {
            allStations = res.stations;
            renderStations();
        }
    });
}

function refreshData() {
    $.post(`https://${GetParentResourceName()}/refreshStations`, JSON.stringify({}), function(data) {
        allStations = data.stations;
        renderStations();
    });
}

function openEditModal(id) {
    currentStationId = id;
    const s = allStations.find(st => st.id === id);
    $("#modal-title").text("EDITAR ESTACIÓN");
    $("#edit-name").val(s.name);
    $("#edit-price-a").val(s.prices.a);
    $("#edit-price-b").val(s.prices.b);
    $("#edit-price-c").val(s.prices.c);
    $("#edit-stock-a").val(s.stock.a);
    $("#edit-stock-b").val(s.stock.b);
    $("#edit-stock-c").val(s.stock.c);
    
    currentPoints = s.polyzone || null;
    
    if (currentPoints) {
        $("#zone-status").html('<div class="status-alert success"><i data-lucide="check-circle"></i> Zona Configurada</div>');
    } else {
        $("#zone-status").html('<div class="status-alert warning"><i data-lucide="alert-triangle"></i> Sin zona creada</div>');
    }

    $("#modal-overlay").fadeIn(200);
    lucide.createIcons();
}

function openCreateModal() {
    currentStationId = null;
    $("#modal-title").text("CREAR ESTACIÓN");
    $("#edit-name").val("");
    $("#edit-price-a").val(1.0);
    $("#edit-price-b").val(1.0);
    $("#edit-price-c").val(1.0);
    $("#edit-stock-a").val(15000);
    $("#edit-stock-b").val(15000);
    $("#edit-stock-c").val(15000);
    currentPoints = null;
    $("#zone-status").html('<div class="status-alert warning"><i data-lucide="alert-triangle"></i> Sin zona creada</div>');
    $("#modal-overlay").fadeIn(200);
    lucide.createIcons();
}

function closeModal() {
    $("#modal-overlay").fadeOut(200);
}

function saveStation() {
    const data = {
        name: $("#edit-name").val(),
        prices: {
            a: parseFloat($("#edit-price-a").val()),
            b: parseFloat($("#edit-price-b").val()),
            c: parseFloat($("#edit-price-c").val())
        },
        stock: {
            a: parseInt($("#edit-stock-a").val()),
            b: parseInt($("#edit-stock-b").val()),
            c: parseInt($("#edit-stock-c").val())
        },
        polyzone: currentPoints
    };

    console.log("ENVIANDO DATOS AL SERVIDOR PARA ID:", currentStationId);
    if (currentStationId) {
        $.post(`https://${GetParentResourceName()}/updateStation`, JSON.stringify({
            stationId: currentStationId,
            data: data
        }));
    } else {
        $.post(`https://${GetParentResourceName()}/getCurrentCoords`, JSON.stringify({}), function(coords) {
            $.post(`https://${GetParentResourceName()}/createStation`, JSON.stringify({
                name: data.name,
                coords: coords,
                data: data // Mandar el resto de datos también
            }));
        });
    }
    closeModal();
    setTimeout(refreshData, 500);
}

function startZoneCreation() {
    $.post(`https://${GetParentResourceName()}/startZoneCreation`, JSON.stringify({}));
}

function closeAll() {
    $(".refuel-menu, .admin-panel, .modal-overlay").fadeOut(200);
    $.post(`https://${GetParentResourceName()}/closeAdminFuel`, JSON.stringify({}));
    $.post(`https://${GetParentResourceName()}/closeFuel`, JSON.stringify({}));
}

function filterStations() {
    renderStations();
}

$(document).keyup(function(e) {
    if (e.key === "Escape") closeAll();
});
