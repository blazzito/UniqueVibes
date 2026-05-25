document.addEventListener('DOMContentLoaded', () => {
    let floors = [];
    const floorColumnsContainer = document.getElementById('floor-columns');
    const digit1 = document.getElementById('digit-1');
    const digit2 = document.getElementById('digit-2');
    const directionUp = document.getElementById('direction-up');
    const directionDown = document.getElementById('direction-down');
    const stopButton = document.getElementById('stop-button');
    const buttonSound = document.getElementById('button-sound');
    const arrivalSound = document.getElementById('arrival-sound');
    const ambientSound = document.getElementById('ambient-sound');
    const modal = document.getElementById('modal');
    const closeButton = document.querySelector('.close-button');
    const submitPasswordButton = document.getElementById('submit-password');
    const passwordInput = document.getElementById('password-input');
    const errorMessage = document.getElementById('error-message');

    let currentFloor = 1;
    let isAnimating = false;
    let activeButton = null;
    let animationInterval = null;
    let targetFloor = null;
    let targetFloorButton = null;
    let targetFloorCode = null;
    const floorTravelTime = 1800; // Slightly faster for comic feel
    const startDelay = 400;

    document.addEventListener('keydown', (event) => {
        if (event.key === 'Escape' && !isAnimating && !activeButton) {
            closeElevatorUI();
        }
    });

    function closeElevatorUI() {
        $.post(`https://${GetParentResourceName()}/CLOSE_UI`);
        document.body.classList.add('hidden');
        document.querySelector('.elevator-container').classList.add('hidden');
        adminPanel.classList.add('hidden');
    }

    function openElevatorUI() {
        document.body.classList.remove('hidden');
        document.getElementById('background-image').classList.remove('hidden');
        document.querySelector('.elevator-container').classList.remove('hidden');
        adminPanel.classList.add('hidden');
    }

    const getIconForFloor = (name) => {
        const lower = name.toLowerCase();
        if (lower.includes('garage') || lower.includes('park')) return 'fa-car';
        if (lower.includes('helipad') || lower.includes('heli')) return 'fa-helicopter';
        if (lower.includes('roof') || lower.includes('terraza') || lower.includes('rooftop')) return 'fa-cloud';
        if (lower.includes('lobby') || lower.includes('recepcion') || lower.includes('piso 1')) return 'fa-door-open';
        if (lower.includes('office') || lower.includes('oficina')) return 'fa-briefcase';
        if (lower.includes('casino') || lower.includes('juego')) return 'fa-dice';
        if (lower.includes('vanilla') || lower.includes('club') || lower.includes('hotel')) return 'fa-glass-martini-alt';
        return 'fa-layer-group';
    };

    function createFloorButtons(floorsData) {
        floorColumnsContainer.innerHTML = '';
        floorsData.forEach((floor) => {
            const button = document.createElement('div');
            button.classList.add('floor-button');
            const iconClass = getIconForFloor(floor.name || 'Piso');

            button.innerHTML = `
                <i class="fas ${iconClass}"></i>
                <span>${floor.number}</span>
                <div class="button-label">${floor.name || ''}</div>
            `;

            if (floor.number === currentFloor) {
                button.classList.add('active-floor');
                activeButton = button;
            }

            button.addEventListener('click', () => {
                if (isAnimating) return;
                if (floor.number === currentFloor) return;

                targetFloor = floor.number;
                targetFloorButton = button;
                targetFloorCode = floor.code;

                if (floor.code) {
                    openModal();
                } else {
                    proceedToFloor(button, targetFloor, floor);
                }
            });

            floorColumnsContainer.appendChild(button);
        });
    }

    function proceedToFloor(button, targetFloorNum, data) {
        if (targetFloorNum !== currentFloor && !isAnimating) {
            $.post(`https://${GetParentResourceName()}/USE_ELEVATOR`);

            buttonSound.currentTime = 0;
            buttonSound.play();
            ambientSound.currentTime = 0;
            ambientSound.play();

            if (activeButton) activeButton.classList.remove('active-floor');
            button.classList.add('active-floor');
            activeButton = button;

            setTimeout(() => animateFloorChange(currentFloor, targetFloorNum, data.pos), startDelay);
        }
    }

    function updateFloorDisplay(floor) {
        const s = floor.toString().padStart(2, '0');
        digit1.textContent = s[0];
        digit2.textContent = s[1];

        // Comic vibration effect
        const display = document.querySelector('.floor-display');
        display.style.transform = 'scale(1.1) rotate(' + (Math.random() * 4 - 2) + 'deg)';
        setTimeout(() => { display.style.transform = 'scale(1) rotate(0deg)'; }, 100);
    }

    function animateFloorChange(from, to, pos) {
        isAnimating = true;
        let step = from < to ? 1 : -1;

        if (step === 1) directionUp.classList.add('active');
        else directionDown.classList.add('active');

        animationInterval = setInterval(() => {
            currentFloor += step;
            updateFloorDisplay(currentFloor);

            if (currentFloor === to) {
                clearInterval(animationInterval);
                directionUp.classList.remove('active');
                directionDown.classList.remove('active');
                isAnimating = false;

                $.post(`https://${GetParentResourceName()}/TELEPORT`, JSON.stringify({ pos: pos }));
                ambientSound.pause();

                setTimeout(() => {
                    arrivalSound.play();
                    if (activeButton) {
                        activeButton.classList.remove('active-floor');
                        activeButton = null;
                    }
                    closeElevatorUI();
                }, 1000);
            }
        }, floorTravelTime);
    }

    function openModal() {
        modal.classList.add('show');
        passwordInput.focus();
        errorMessage.textContent = '';
    }
    function closeModal() { modal.classList.remove('show'); }

    closeButton.addEventListener('click', closeModal);
    document.getElementById('close-password-modal').addEventListener('click', closeModal);

    // --- CUSTOM DIALOGS (Confirm/Alert) ---
    const confirmationModal = document.getElementById('confirmation-modal');
    const confirmTitle = document.getElementById('confirm-title');
    const confirmMessage = document.getElementById('confirm-message');
    const confirmYes = document.getElementById('confirm-yes');
    const confirmNo = document.getElementById('confirm-no');
    let confirmCallback = null;

    function showConfirm(title, message, callback) {
        confirmTitle.textContent = title;
        confirmMessage.textContent = message;
        confirmYes.style.display = 'block';
        confirmNo.style.display = 'block';
        confirmCallback = callback;
        confirmationModal.classList.add('show');
    }

    function showAlert(title, message) {
        confirmTitle.textContent = title;
        confirmMessage.textContent = message;
        confirmYes.style.display = 'block';
        confirmNo.style.display = 'none'; // Hide cancel for alerts
        confirmCallback = null;
        confirmationModal.classList.add('show');
    }

    confirmYes.addEventListener('click', () => {
        confirmationModal.classList.remove('show');
        if (confirmCallback) confirmCallback();
    });

    confirmNo.addEventListener('click', () => {
        confirmationModal.classList.remove('show');
    });

    submitPasswordButton.addEventListener('click', () => {
        if (passwordInput.value === targetFloorCode) {
            closeModal();
            const floorData = floors.find(f => f.number === targetFloor);
            proceedToFloor(targetFloorButton, targetFloor, floorData);
        } else {
            errorMessage.textContent = 'ACCESO DENEGADO';
            errorMessage.classList.add('shake');
            setTimeout(() => errorMessage.classList.remove('shake'), 400);
            passwordInput.value = '';
        }
    });

    stopButton.addEventListener('click', () => {
        buttonSound.play();
        if (isAnimating) {
            clearInterval(animationInterval);
            isAnimating = false;
            directionUp.classList.remove('active');
            directionDown.classList.remove('active');
            const currentData = floors.find(f => f.number === currentFloor);
            $.post(`https://${GetParentResourceName()}/TELEPORT`, JSON.stringify({ pos: currentData.pos }));
            ambientSound.pause();
            setTimeout(closeElevatorUI, 500);
        } else {
            closeElevatorUI();
        }
    });

    // --- ADMIN PANEL LOGIC ---
    const adminPanel = document.getElementById('admin-panel');
    const adminElevatorList = document.getElementById('admin-elevator-list');
    const adminEditor = document.getElementById('admin-editor');
    const btnCreateGroup = document.getElementById('btn-create-group');
    const btnCloseAdmin = document.getElementById('btn-close-admin');
    const inputGroupName = document.getElementById('input-group-name');
    const floorsContainer = document.getElementById('floors-container');
    const btnAddFloor = document.getElementById('btn-add-floor');
    const btnSaveGroup = document.getElementById('btn-save-group');
    const btnDeleteGroup = document.getElementById('btn-delete-group');
    const editorTitle = document.getElementById('editor-title');

    let allElevators = {};
    let currentEditingGroup = null;

    function openAdminPanel(elevators) {
        allElevators = elevators;
        renderElevatorList();
        adminPanel.classList.remove('hidden');
        document.body.classList.remove('hidden');
        adminEditor.classList.add('hidden');
        document.getElementById('background-image').classList.add('hidden');
        document.querySelector('.elevator-container').classList.add('hidden');
    }

    function renderElevatorList() {
        adminElevatorList.innerHTML = '';
        Object.keys(allElevators).forEach(groupName => {
            const item = document.createElement('div');
            item.classList.add('elevator-item');
            item.innerHTML = `
                <span>${groupName}</span>
                <button class="comic-btn Success small-btn">EDIT</button>
            `;
            item.querySelector('button').onclick = () => editGroup(groupName);
            adminElevatorList.appendChild(item);
        });
    }

    function editGroup(groupName) {
        currentEditingGroup = groupName;
        const groupData = allElevators[groupName] || [];
        editorTitle.textContent = groupName ? `EDITANDO: ${groupName}` : "NUEVO GRUPO";
        inputGroupName.value = groupName || "";
        renderFloorsEditor(groupData);
        adminEditor.classList.remove('hidden');
    }

    function renderFloorsEditor(floorsData) {
        floorsContainer.innerHTML = '';
        floorsData.forEach((floor, index) => {
            addFloorItem(floor);
        });
    }

    function addFloorItem(data = {}) {
        const item = document.createElement('div');
        item.classList.add('floor-editor-item');
        item.innerHTML = `
            <input type="number" class="floor-input-small floor-num" placeholder="Num" value="${data.number ?? ''}">
            <input type="text" class="floor-input-mid floor-name" placeholder="Nombre (ej: Lobby)" value="${data.name ?? ''}">
            <button class="comic-btn Success btn-get-coords">GET COORDS</button>
            <button class="comic-btn Primary btn-tp">TP</button>
            <button class="comic-btn Danger btn-rem-floor">X</button>
            <div class="floor-coords-display" style="width: 100%; font-size: 0.8rem; color: #666;">
                Pos: ${data.pos ? `${data.pos.x.toFixed(2)}, ${data.pos.y.toFixed(2)}, ${data.pos.z.toFixed(2)}` : 'No definida'}
            </div>
        `;

        const posData = data.pos ? { ...data.pos } : null;
        const headingData = data.heading || 0;

        item.querySelector('.btn-get-coords').onclick = () => {
            $.post(`https://${GetParentResourceName()}/GET_COORDS`, JSON.stringify({}), (res) => {
                item.querySelector('.floor-coords-display').textContent = `Pos: ${res.pos.x.toFixed(2)}, ${res.pos.y.toFixed(2)}, ${res.pos.z.toFixed(2)}`;
                item.dataset.pos = JSON.stringify(res.pos);
                item.dataset.heading = res.heading;
            });
        };

        item.querySelector('.btn-tp').onclick = () => {
            const p = item.dataset.pos ? JSON.parse(item.dataset.pos) : posData;
            const h = item.dataset.heading || headingData;
            if (p) $.post(`https://${GetParentResourceName()}/TP_TO_ELEVATOR`, JSON.stringify({ pos: p, heading: h }));
        };

        item.querySelector('.btn-rem-floor').onclick = () => item.remove();

        if (data.pos) {
            item.dataset.pos = JSON.stringify(data.pos);
            item.dataset.heading = data.heading;
        }

        floorsContainer.appendChild(item);
    }

    btnCreateGroup.onclick = () => {
        editGroup(null);
    };

    btnAddFloor.onclick = () => {
        addFloorItem();
    };

    btnSaveGroup.onclick = () => {
        const groupName = inputGroupName.value.trim();
        if (!groupName) return showAlert("ERROR", "Nombre de grupo requerido");

        const floors = [];
        floorsContainer.querySelectorAll('.floor-editor-item').forEach(item => {
            const num = parseInt(item.querySelector('.floor-num').value);
            const name = item.querySelector('.floor-name').value;
            const pos = item.dataset.pos ? JSON.parse(item.dataset.pos) : null;
            const heading = parseFloat(item.dataset.heading) || 0;

            if (!isNaN(num) && pos) {
                floors.push({ number: num, name, pos, heading });
            }
        });

        $.post(`https://${GetParentResourceName()}/SAVE_ELEVATOR`, JSON.stringify({
            groupName: groupName,
            floors: floors
        }));

        // Optimistic update
        allElevators[groupName] = floors;
        renderElevatorList();
        adminEditor.classList.add('hidden');
    };

    btnDeleteGroup.onclick = () => {
        if (!currentEditingGroup) return;
        showConfirm("ELIMINAR", `¿Deseas eliminar el grupo ${currentEditingGroup}?`, () => {
            $.post(`https://${GetParentResourceName()}/DELETE_ELEVATOR`, JSON.stringify({ groupName: currentEditingGroup }));
            delete allElevators[currentEditingGroup];
            renderElevatorList();
            adminEditor.classList.add('hidden');
        });
    };

    btnCloseAdmin.onclick = () => {
        adminPanel.classList.add('hidden');
        document.body.classList.add('hidden');
        $.post(`https://${GetParentResourceName()}/CLOSE_UI`);
    };

    window.addEventListener("message", (event) => {
        const data = event.data;
        if (data.action === "SHOW_UI") {
            floors = data.floors;
            currentFloor = data.current;
            createFloorButtons(floors);
            updateFloorDisplay(currentFloor);
            openElevatorUI();
        } else if (data.action === "OPEN_ADMIN") {
            openAdminPanel(data.elevators);
        }
    });
});
