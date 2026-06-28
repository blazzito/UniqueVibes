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
                if (typeof controlsExpanded !== 'undefined' && controlsExpanded) {
                    toggleControls();
                }
            }
            break;
        case 'updateVehicle':
            updateVehicle(data);
            break;
        case 'updateCarControlsStates':
            updateCarControlsStates(data);
            break;
        case 'toggleCarControls':
            toggleControls(event.data.isDriver);
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
        case 'setRadioVehicleName':
            let titleEl = document.getElementById('headerTitle');
            if(titleEl) titleEl.innerText = data + " Radio";
            break;
        case 'updateRadioState':
            currentRadioState = data;
            updateDashboard(currentRadioState);
            break;
        case 'updatePlaylists':
            savedPlaylists = data;
            renderPlaylists();
            break;
        case 'radioStopped':
            currentRadioState = null;
            resetDashboard();
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

/* -- CAR CONTROLS INTEGRATION -- */
let controlsExpanded = false;

function toggleControls(isDriver = true) {
    controlsExpanded = !controlsExpanded;
    const hud = document.getElementById('car-hud');
    
    if (controlsExpanded) {
        if (isDriver) {
            hud.classList.add('show-controls');
        } else {
            hud.classList.add('show-controls-passenger');
        }
        
        const nonSeatButtons = [
            'btn-lights', 'btn-win-0', 'btn-door-0', 'btn-door-1', 'btn-win-1', 'btn-hood',
            'btn-engine', 'btn-win-2', 'btn-door-2', 'btn-door-3', 'btn-win-3', 'btn-trunk',
            'section-radio'
        ];
        
        nonSeatButtons.forEach(id => {
            const el = document.getElementById(id);
            if (el) {
                if (isDriver === false) {
                    el.style.display = 'none';
                } else {
                    el.style.display = '';
                }
            }
        });

        postToLua('focusOnControls');
    } else {
        hud.classList.remove('show-controls', 'show-controls-passenger');
        postToLua('focusOffControls');
    }
}

function postToLua(endpoint, data = {}) {
    fetch(`https://${GetParentResourceName()}/${endpoint}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    }).catch(e => {});
}

window.addEventListener('keydown', function(event) {
    // Ignore input fields
    const tagName = document.activeElement ? document.activeElement.tagName.toLowerCase() : '';
    if (tagName === 'input' || tagName === 'textarea') return;

    if (controlsExpanded && (event.key === "Escape" || event.key === "i" || event.key === "I")) {
        toggleControls();
    }
});

function updateCarControlsStates(states) {
    if (!controlsExpanded) return; // Only process if UI is visible
    
    // Engine
    const btnEngine = document.getElementById('btn-engine');
    if (btnEngine) {
        btnEngine.classList.remove('state-engine-on', 'state-engine-off');
        btnEngine.classList.add(states.engine ? 'state-engine-on' : 'state-engine-off');
    }
    
    // Lights
    const btnLights = document.getElementById('btn-lights');
    if (btnLights) {
        btnLights.classList.remove('state-lights-low', 'state-lights-high');
        if (states.highbeams) {
            btnLights.classList.add('state-lights-high');
        } else if (states.lights) {
            btnLights.classList.add('state-lights-low');
        }
    }
    
    // Doors
    const doorMapping = {
        0: 'btn-door-0',
        1: 'btn-door-1',
        2: 'btn-door-2',
        3: 'btn-door-3',
        4: 'btn-hood',
        5: 'btn-trunk'
    };
    
    if (states.doors) {
        for (const [index, isOpen] of Object.entries(states.doors)) {
            const btn = document.getElementById(doorMapping[index]);
            if (btn) {
                if (isOpen) btn.classList.add('state-active');
                else btn.classList.remove('state-active');
            }
        }
    }
    
    // Windows
    if (states.windows) {
        for (let i = 0; i <= 3; i++) {
            const btn = document.getElementById('btn-win-' + i);
            if (btn) {
                if (states.windows[i]) btn.classList.add('state-active');
                else btn.classList.remove('state-active');
            }
        }
    }
}

/* --- RADIO INTEGRATION --- */
let currentRadioState = null;
let savedPlaylists = {};

let isProcessingPlayCommand = false;

async function sendPlayCommand(url) {
    if (!url || url.trim() === "") return;
    if (isProcessingPlayCommand) return;
    
    isProcessingPlayCommand = true;
    document.getElementById("urlInput").value = "";
    
    let volume = (document.getElementById("volumeText").innerText) ? 
        parseInt((document.getElementById("volumeText").innerText)) / 100 : 0.5;
        
    let title = "Buscando información...";
    let thumbnail = "https://img.youtube.com/vi/default/hqdefault.jpg";
    
    try {
        let response = await fetch('https://noembed.com/embed?url=' + encodeURIComponent(url));
        if (response.ok) {
            let data = await response.json();
            if (data.title) title = data.title;
            if (data.thumbnail_url) thumbnail = data.thumbnail_url;
        }
    } catch(e) {
        console.log("Error fetching metadata:", e);
    }

    postToLua('play', { url: url, title: title, thumbnail: thumbnail, volume: isNaN(volume) ? 0.5 : volume });
    
    setTimeout(() => {
        isProcessingPlayCommand = false;
    }, 1000);
}

document.getElementById("addBtn").addEventListener("click", function() { sendPlayCommand(document.getElementById("urlInput").value); });
document.getElementById("urlInput").addEventListener("keypress", function(e) { if(e.which == 13) sendPlayCommand(document.getElementById("urlInput").value); });

window.addEventListener("keyup", function(e) {
    if (e.target.tagName === "INPUT" || e.target.tagName === "TEXTAREA") return;
    
    if (e.key === "Escape" || e.key === "i" || e.key === "I") {
        document.getElementById("carControlsWrap").classList.remove("open");
        postToLua("focusOffControls", {});
    }
});

document.getElementById("playPauseBtn").addEventListener("click", function() {
    if (currentRadioState) {
        if (currentRadioState.paused) {
            postToLua("resume", {});
        } else {
            postToLua("pause", {});
        }
    }
});

document.getElementById("nextBtn").addEventListener("click", function() { postToLua("next", {}); });
document.getElementById("prevBtn").addEventListener("click", function() { postToLua("prev", {}); });
document.getElementById("stopBtn").addEventListener("click", function() { postToLua("stop", {}); });
document.getElementById("loopBtn").addEventListener("click", function() { postToLua("toggleLoop", {}); });

let isDraggingVolume = false;
let startY = 0;
let startX = 0;
let startVolume = 50;

function updateVolumeVisual(vol) {
    document.getElementById("volumeText").innerText = Math.round(vol) + "%";
    document.getElementById("volumeProgress").setAttribute("stroke-dasharray", `${vol}, 100`);
}

document.getElementById("volumeKnob").addEventListener("mousedown", function(e) {
    isDraggingVolume = true;
    startY = e.clientY;
    startX = e.clientX;
    let parsed = parseInt((document.getElementById("volumeText").innerText));
    startVolume = isNaN(parsed) ? 50 : parsed;
});

document.addEventListener("mousemove", function(e) {
    if (isDraggingVolume) {
        let deltaY = startY - e.clientY;
        let deltaX = e.clientX - startX;
        let delta = Math.abs(deltaY) > Math.abs(deltaX) ? deltaY : deltaX;
        
        let newVolume = startVolume + Math.floor(delta / 1.5);
        if (newVolume > 100) newVolume = 100;
        if (newVolume < 0) newVolume = 0;
        
        updateVolumeVisual(newVolume);
        postToLua("volume", { volume: newVolume / 100 });
    }
});

document.addEventListener("mouseup", function() { isDraggingVolume = false; });

function removeFromQueue(index) {
    postToLua("removeFromQueue", { index: parseInt(index) });
}

let activePlaylist = null;

document.getElementById("savePlaylistBtn").addEventListener("click", function() {
    let name = document.getElementById("playlistName").value.trim();
    if (name !== "" && currentRadioState && currentRadioState.queue.length > 0) {
        fetch(`https://${GetParentResourceName()}/savePlaylist`, { method: 'POST', body: JSON.stringify({
            name: name,
            queue: currentRadioState.queue
        }) }).catch(() => {});
        activePlaylist = name;
        document.getElementById("playlistName").value = "";
    }
});

function playSavedPlaylist(name) {
    let queue = savedPlaylists[name];
    if (queue && queue.length > 0) {
        activePlaylist = name;
        postToLua("clearQueue", {});
        setTimeout(() => {
            let volume = parseFloat(document.getElementById("volumeText").innerText) / 100;
            postToLua('playPlaylist', { queue: queue, volume: isNaN(volume) ? 0.5 : volume });
            renderPlaylists();
        }, 150);
    }
}

function updateActivePlaylist(name) {
    if (currentRadioState && currentRadioState.queue.length > 0) {
        fetch(`https://${GetParentResourceName()}/savePlaylist`, { method: 'POST', body: JSON.stringify({
            name: name,
            queue: currentRadioState.queue
        }) }).catch(() => {});
    }
}

function deletePlaylist(name) {
    if (activePlaylist === name) activePlaylist = null;
    postToLua("deletePlaylist", { name: name });
}

function updateDashboard(radio) {
    if (!radio || !radio.queue || radio.queue.length === 0) {
        resetDashboard();
        return;
    }

    let track = radio.queue[radio.currentIndex - 1];
    
    if (track) {
        document.getElementById("thumbnailImg").src = track.thumbnail;
        document.getElementById("trackTitle").innerText = track.title;
        
        if (document.getElementById("trackTitle").offsetWidth > document.querySelector(".track-title-container").offsetWidth) {
            document.getElementById("trackTitle").classList.add("scrolling");
        } else {
            document.getElementById("trackTitle").classList.remove("scrolling");
        }
    }

    if (radio.paused) {
        document.getElementById("playPauseIcon").classList.remove("fa-pause"); document.getElementById("playPauseIcon").classList.add("fa-play");
        document.getElementById("visualizer").classList.remove("active");
    } else {
        document.getElementById("playPauseIcon").classList.remove("fa-play"); document.getElementById("playPauseIcon").classList.add("fa-pause");
        document.getElementById("visualizer").classList.add("active");
    }
    
    if (radio.loop) document.getElementById("loopBtn").classList.add("active-loop");
    else document.getElementById("loopBtn").classList.remove("active-loop");

    if (!isDraggingVolume) updateVolumeVisual(radio.volume * 100);

    let queueHtml = "";
    radio.queue.forEach((item, index) => {
        let activeClass = (index === radio.currentIndex - 1) ? "active" : "";
        queueHtml += `
            <div class="queue-item ${activeClass}">
                <img src="${item.thumbnail}" alt="thumb">
                <div class="queue-item-title">${item.title}</div>
                <div style="display: flex; gap: 0.5vh;">
                    <i class="fas fa-play queue-item-play" onclick="skipToQueueItem(${index + 1})" title="Reproducir esta pista"></i>
                    <i class="fas fa-times queue-item-delete" onclick="removeFromQueue(${index + 1})" title="Eliminar de la cola"></i>
                </div>
            </div>
        `;
    });
    document.getElementById("queueList").innerHTML = queueHtml;
}

function skipToQueueItem(index) {
    postToLua("skipTo", { index: parseInt(index) });
}

function renderPlaylists() {
    let html = "";
    for (let name in savedPlaylists) {
        let isActivo = (activePlaylist === name);
        let activeClass = isActivo ? "color: #00fbff;" : "";
        let updateBtn = `<i class="fas fa-sync-alt" onclick="updateActivePlaylist('${name}')" title="Actualizar Playlist" style="color: #ff6b00;"></i>`;
        
        html += `
            <div class="playlist-item">
                <span style="${activeClass}">${name} (${savedPlaylists[name].length})</span>
                <div class="playlist-actions">
                    ${updateBtn}
                    <i class="fas fa-plus" onclick="playSavedPlaylist(\x27${name}\x27)" title="Reemplazar y Reproducir"></i>
                    <i class="fas fa-trash" onclick="deletePlaylist(\x27${name}\x27)" title="Eliminar"></i>
                </div>
            </div>
        `;
    }
    document.getElementById("playlistsList").innerHTML = html;
}

function resetDashboard() {
    document.getElementById("thumbnailImg").src = "https://img.youtube.com/vi/default/hqdefault.jpg";
    document.getElementById("trackTitle").innerText = "No hay musica reproduciendose";
    document.getElementById("trackTitle").classList.remove("scrolling");
    document.getElementById("playPauseIcon").classList.remove("fa-pause"); document.getElementById("playPauseIcon").classList.add("fa-play");
    document.getElementById("visualizer").classList.remove("active");
    document.getElementById("loopBtn").classList.remove("active-loop");
    document.getElementById("queueList").innerHTML = "";
    activePlaylist = null;
    renderPlaylists();
}


