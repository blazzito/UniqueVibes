let currentVehicles = [];
let garagesList = {};
let currentGarage = "";
let transferFee = 0;
let recoveryFee = 0;
let isMouseDown = false;
let selectedIndex = -1;

window.addEventListener('message', function(event) {
    let data = event.data;

    if (data.action === "open") {
        currentVehicles = data.vehicles;
        currentGarage = data.garage;
        garagesList = data.garages;
        transferFee = data.transferFee || 500;
        recoveryFee = data.recoveryFee || 1000;
        
        document.getElementById('garage-name').innerText = (data.garageName || "GARAGE").toUpperCase();
        document.getElementById('app').style.display = "flex";
        
        document.getElementById('transfer-fee-display').innerText = transferFee;
        
        populateVehicleList();
        populateTransferSelect();
        
        document.getElementById('details-card').style.display = "none";
        document.getElementById('no-selection').style.display = "flex";
        selectedIndex = -1;
        
        if (currentVehicles.length > 0) {
            selectVehicle(0);
        }
    }

    if (data.action === "close") {
        document.getElementById('app').style.display = "none";
        closeTransferModal();
    }
});

function populateVehicleList() {
    const list = document.getElementById('vehicle-list');
    list.innerHTML = '';
    
    document.getElementById('vehicle-count').innerText = `${currentVehicles.length} Vehículos`;

    currentVehicles.forEach((veh, index) => {
        const item = document.createElement('div');
        item.className = 'vehicle-item';
        item.onclick = () => selectVehicle(index);
        
        let props = {};
        try {
            if (veh.vehicle) props = JSON.parse(veh.vehicle);
        } catch(e) {}
        
        let vehName = veh.name || "Vehículo " + (index + 1);
        
        let locText = "";
        if (veh.stored == 1) {
            locText = (veh.garage === currentGarage) ? "En este garaje" : `Garaje: ${veh.garage}`;
        } else {
            locText = "Fuera / Destruido";
        }
        let statusClass = veh.stored == 1 ? "status-stored" : "status-out";

        item.innerHTML = `
            <div class="veh-info">
                <span class="veh-name">${vehName}</span>
                <span class="veh-plate">${veh.plate}</span>
            </div>
            <div class="veh-status ${statusClass}">${locText}</div>
        `;
        list.appendChild(item);
    });
}

function selectVehicle(index) {
    if (selectedIndex === index) return;
    
    const items = document.querySelectorAll('.vehicle-item');
    items.forEach(el => el.classList.remove('active'));
    items[index].classList.add('active');
    
    selectedIndex = index;
    const veh = currentVehicles[index];
    
    document.getElementById('no-selection').style.display = "none";
    document.getElementById('details-card').style.display = "flex";
    
    let props = {};
    try {
        if (veh.vehicle) props = JSON.parse(veh.vehicle);
    } catch(e) {}
    
    document.getElementById('detail-name').innerText = veh.name || "Vehículo Desconocido";
    document.getElementById('detail-plate').innerText = veh.plate;
    
    const engineHealth = props.engineHealth || 1000;
    const bodyHealth = props.bodyHealth || 1000;
    const fuelLevel = props.fuelLevel || 100;
    
    const enginePct = Math.max(0, Math.min(100, Math.round(engineHealth / 10)));
    const bodyPct = Math.max(0, Math.min(100, Math.round(bodyHealth / 10)));
    const fuelPct = Math.max(0, Math.min(100, Math.round(fuelLevel)));
    
    document.getElementById('stat-engine-val').innerText = enginePct + '%';
    document.getElementById('stat-engine-fill').style.width = enginePct + '%';
    
    document.getElementById('stat-body-val').innerText = bodyPct + '%';
    document.getElementById('stat-body-fill').style.width = bodyPct + '%';
    
    document.getElementById('stat-fuel-val').innerText = fuelPct + '%';
    document.getElementById('stat-fuel-fill').style.width = fuelPct + '%';

    let actionBtn = document.getElementById('btn-spawn');
    actionBtn.onclick = null;
    actionBtn.className = "btn btn-primary";

    if (veh.stored == 1 && veh.garage === currentGarage) {
        actionBtn.innerHTML = '<i class="fa-solid fa-key"></i> Sacar Vehículo';
        actionBtn.onclick = () => spawnVehicle(veh.plate);
    } else if (veh.stored == 1 && veh.garage !== currentGarage) {
        actionBtn.innerHTML = `<i class="fa-solid fa-truck-moving"></i> Traer ($${transferFee})`;
        actionBtn.onclick = () => transferToCurrent(veh.plate);
    } else {
        actionBtn.innerHTML = `<i class="fa-solid fa-truck-pickup"></i> Recuperar ($${recoveryFee})`;
        actionBtn.onclick = () => recoverVehicle(veh.plate);
    }

    let transferBtn = document.getElementById('btn-transfer');
    if (veh.stored == 1) {
        transferBtn.style.display = "block";
    } else {
        transferBtn.style.display = "none";
    }
    
    fetch(`https://${GetParentResourceName()}/previewVehicle`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ index: index, plate: veh.plate })
    });
}

function transferToCurrent(plate) {
    fetch(`https://${GetParentResourceName()}/transferToCurrent`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ plate: plate })
    });
}

function spawnVehicle(plate) {
    fetch(`https://${GetParentResourceName()}/spawnVehicle`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ plate: plate })
    });
}

function recoverVehicle(plate) {
    fetch(`https://${GetParentResourceName()}/recoverVehicle`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ plate: plate })
    });
}

function populateTransferSelect() {
    const select = document.getElementById('transfer-select');
    select.innerHTML = '';
    for (const [key, data] of Object.entries(garagesList)) {
        if (key !== currentGarage) {
            const opt = document.createElement('option');
            opt.value = key;
            opt.innerText = data.Name || key;
            select.appendChild(opt);
        }
    }
}

function openTransferModal() {
    let veh = currentVehicles[selectedIndex];
    if (!veh) return;
    document.getElementById('modal-title').innerText = `Traspasar a otro Garaje ($${transferFee})`;
    document.getElementById('transfer-modal').style.display = "flex";
}

function closeTransferModal() {
    document.getElementById('transfer-modal').style.display = 'none';
}

function confirmTransfer() {
    let veh = currentVehicles[selectedIndex];
    let select = document.getElementById('transfer-select');
    let target = select.value;
    
    if (!veh || !target || target === "") return;

    fetch(`https://${GetParentResourceName()}/transferVehicle`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            plate: veh.plate,
            target: target
        })
    });
}

function closeUI() {
    document.getElementById('app').style.display = "none";
    closeTransferModal();
    fetch(`https://${GetParentResourceName()}/closeUI`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

// Escuchar tecla ESC
document.onkeyup = function (data) {
    if (data.which == 27) { // Escape
        closeUI();
    }
};

// Control de rotación de cámara
document.addEventListener('mousedown', function(e) {
    if (e.target.closest('#app .garage-container') || e.target.closest('#transfer-modal')) return;
    isMouseDown = true;
});

document.addEventListener('mouseup', function(e) {
    isMouseDown = false;
});

document.addEventListener('mousemove', function(e) {
    if (isMouseDown) {
        // Enviar delta X al cliente para rotar cámara
        fetch(`https://${GetParentResourceName()}/rotateCamera`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ movementX: e.movementX })
        });
    }
});
