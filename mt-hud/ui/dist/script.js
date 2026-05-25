window.addEventListener('message', function(event) {
    const action = event.data.action;
    const data = event.data.data;

    switch (action) {
        case 'setVisible':
            if (event.data.value) {
                document.getElementById('app').classList.remove('hidden');
                initSegments();
            } else {
                document.getElementById('app').classList.add('hidden');
            }
            break;
        case 'updateVitals':
            updateVitals(data);
            break;
        case 'setInVehicle':
            const carHud = document.getElementById('car-hud');
            const locationHud = document.querySelector('.location-container');
            if (event.data.value) {
                carHud.classList.remove('hidden');
                locationHud.classList.remove('hidden');
            } else {
                carHud.classList.add('hidden');
                locationHud.classList.add('hidden');
            }
            break;
        case 'updateVehicle':
            updateVehicle(data);
            break;
        case 'updateLocation':
            document.getElementById('zone-name').innerText = data.zone.toUpperCase();
            document.getElementById('street-name').innerText = data.street.toUpperCase();
            break;
        case 'playSound':
            playSound(event.data.sound);
            break;
        case 'DoScreenFadeOut':
            const fadeOut = document.getElementById('screen-fade');
            fadeOut.style.transitionDuration = (event.data.time || 1000) + 'ms';
            fadeOut.style.opacity = '1';
            break;
        case 'DoScreenFadeIn':
            const fadeIn = document.getElementById('screen-fade');
            fadeIn.style.transitionDuration = (event.data.time || 1000) + 'ms';
            fadeIn.style.opacity = '0';
            break;
        case 'openSettings':
            openSettings(event.data.type);
            break;
    }
});

function initSegments() {
    const containers = document.querySelectorAll('.segments');
    containers.forEach(container => {
        if (container.children.length > 0) return;
        for (let i = 0; i < 8; i++) {
            const circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
            circle.setAttribute("cx", "50");
            circle.setAttribute("cy", "50");
            circle.setAttribute("r", "45");
            circle.setAttribute("class", "segment");
            circle.setAttribute("data-id", i);
            container.appendChild(circle);
        }
    });
}

const audioFiles = {};

function playSound(soundName) {
    if (!audioFiles[soundName]) {
        audioFiles[soundName] = new Audio(`./sounds/${soundName}.mp3`);
        if (soundName === 'buckle' || soundName === 'unbuckle') {
            audioFiles[soundName] = new Audio(`./sounds/${soundName}.ogg`);
        }
    }
    audioFiles[soundName].currentTime = 0;
    audioFiles[soundName].volume = 0.4;
    audioFiles[soundName].play().catch(e => {
        if (!soundName.includes('.ogg')) {
             audioFiles[soundName] = new Audio(`./sounds/${soundName}.ogg`);
             audioFiles[soundName].play().catch(err => {});
        }
    });
}

function updateVitals(vitals) {
    const processStatus = (id, value, alwaysVisible = false) => {
        const el = document.getElementById(id);
        if (!el) return;

        const segments = el.querySelectorAll('.segment');
        const activeSegments = Math.round(value / 12.5);
        
        segments.forEach((seg, i) => {
            seg.classList.toggle('active', i < activeSegments);
        });

        let shouldShow = alwaysVisible;
        if (!alwaysVisible) {
            const isVisible = el.classList.contains('visible');
            if (id === 'armor') {
                shouldShow = value > 0;
            } else if (id === 'stamina' || id === 'oxygen') {
                shouldShow = isVisible ? value < 98 : value < 90;
            } else {
                shouldShow = isVisible ? value < 55 : value < 50;
            }
        }

        if (shouldShow) {
            el.classList.add('visible');
        } else {
            el.classList.remove('visible');
        }

        let blinkThreshold = 20;
        if (id === 'hunger' || id === 'thirst') {
            blinkThreshold = 35;
        }
        
        const isLow = value > 0 && value < blinkThreshold;
        el.classList.toggle('blink', shouldShow && isLow);
    };

    if (vitals.health !== undefined) processStatus('health', vitals.health, true);
    if (vitals.armor !== undefined) processStatus('armor', vitals.armor);
    if (vitals.hunger !== undefined) processStatus('hunger', vitals.hunger);
    if (vitals.thirst !== undefined) processStatus('thirst', vitals.thirst);
    if (vitals.stamina !== undefined) processStatus('stamina', vitals.stamina, false);
    if (vitals.oxygen !== undefined) processStatus('oxygen', vitals.oxygen, false);
}

function updateVehicle(data) {
    if (data.speed !== undefined) document.getElementById('speed').innerText = Math.floor(data.speed);
    if (data.gear !== undefined) document.getElementById('gear').innerText = data.gear;
    if (data.fuel !== undefined) document.getElementById('fuel-value').innerText = Math.floor(data.fuel) + '%';
    if (data.engine !== undefined) document.getElementById('engine-value').innerText = Math.floor(data.engine / 10) + '%';
    if (data.mileage !== undefined) document.getElementById('kms-value').innerText = Math.floor(data.mileage);
    
    if (data.rpm !== undefined) {
        const segments = document.querySelectorAll('.rpm-segment');
        const progress = data.rpm;
        const numPairs = Math.floor(progress * 7.5);
        
        let colorClass = 'active-green';
        if (progress >= 0.9) colorClass = 'active-red';
        else if (progress >= 0.75) colorClass = 'active-yellow';

        segments.forEach((seg) => {
            const id = parseInt(seg.getAttribute('data-id'));
            const distanceFromCenter = Math.abs(id - 8);
            const isActive = distanceFromCenter <= numPairs;
            seg.className = 'rpm-segment' + (isActive ? ' ' + colorClass : '');
        });
    }

    const beltIcon = document.getElementById('belt-icon');
    const isBelted = !!data.belted;
    if (isBelted) {
        beltIcon.classList.add('belted');
        beltIcon.classList.remove('blink');
    } else {
        beltIcon.classList.remove('belted');
        beltIcon.classList.add('blink');
    }
}

fetch(`https://${GetParentResourceName()}/nui_ready`, {
    method: 'POST',
    body: JSON.stringify({})
}).catch(e => {});

function openSettings() {}
function closeSettings() {}
function setMapType(type) {}
