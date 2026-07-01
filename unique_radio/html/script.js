let currentJob = "";
let currentInput = "";
let currentVolume = 50;
let isRadioOn = false;
let activeChannel = 0;
let currentAnim = 1;

window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === "openUI") {
        document.getElementById('app').classList.remove('hidden');
        currentJob = data.job;
        isRadioOn = data.isOn;
        activeChannel = data.currentChannel;
        currentVolume = data.volume;
        currentAnim = data.currentAnim || 1;
        
        updateVolumeUI();
        updateScreenUI();
        renderRestrictedChannels(data.channels);
        
        // Update Anim UI
        document.querySelectorAll('.anim-btn').forEach(b => b.classList.remove('active'));
        const activeBtn = document.querySelector(`.anim-btn[data-anim="${currentAnim}"]`);
        if (activeBtn) activeBtn.classList.add('active');
        
    } else if (data.action === "closeUI") {
        closeUI();
    } else if (data.action === "forceDisconnect") {
        isRadioOn = false;
        activeChannel = 0;
        currentInput = "";
        updateScreenUI();
    }
});

function closeUI() {
    document.getElementById('app').classList.add('hidden');
    postToLua('closeUI');
}

document.addEventListener('keydown', function(event) {
    if (event.key === "Escape") {
        closeUI();
    } else if (event.key >= "0" && event.key <= "9") {
        handleDigit(event.key);
    } else if (event.key === "Enter") {
        connectChannel();
    } else if (event.key === "Backspace") {
        clearInput();
    }
});

/* Input Logic */
const keys = document.querySelectorAll('.key[data-val]');
keys.forEach(btn => {
    btn.addEventListener('click', () => handleDigit(btn.getAttribute('data-val')));
});

document.getElementById('btn-clear').addEventListener('click', clearInput);
document.getElementById('btn-connect').addEventListener('click', connectChannel);
document.getElementById('btn-disconnect').addEventListener('click', disconnectChannel);

document.querySelectorAll('.anim-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const animId = parseInt(btn.getAttribute('data-anim'));
        currentAnim = animId;
        
        document.querySelectorAll('.anim-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        
        postToLua('changeAnim', { animIndex: animId });
    });
});

function handleDigit(digit) {
    if (currentInput.length < 3) {
        currentInput += digit;
        document.getElementById('channel-display').innerText = currentInput;
    }
}

function clearInput() {
    currentInput = currentInput.slice(0, -1);
    document.getElementById('channel-display').innerText = currentInput || (isRadioOn ? activeChannel : "OFF");
}

function updateScreenUI() {
    const screen = document.getElementById('screen');
    const display = document.getElementById('channel-display');
    const status = document.getElementById('status-text');

    if (isRadioOn) {
        screen.classList.add('active');
        display.innerText = activeChannel;
        status.innerText = "Conectado";
    } else {
        screen.classList.remove('active');
        display.innerText = "OFF";
        status.innerText = "Desconectado";
    }
    
    // Reset input since we updated state
    currentInput = "";
}

/* API Calls */
function connectChannel() {
    // Si escribió algo, intentar conectar a eso
    let target = currentInput.trim() !== "" ? parseInt(currentInput) : null;
    
    if (!target) return;
    
    // Validar formato (solo números de 1 a 999)
    if (target < 1 || target > 999) return;

    postToLua('connectChannel', { channel: target }, function(resp) {
        if (resp && resp.success) {
            isRadioOn = true;
            activeChannel = resp.channel;
            updateScreenUI();
            
            // Re-render to update active highlight in list
            const channelItems = document.querySelectorAll('.channel-item');
            channelItems.forEach(item => {
                if(parseInt(item.getAttribute('data-chan')) === activeChannel) {
                    item.classList.add('active');
                } else {
                    item.classList.remove('active');
                }
            });
        } else {
            // Error al conectar (probablemente sin permisos)
            currentInput = "ERR";
            document.getElementById('channel-display').innerText = currentInput;
            setTimeout(() => {
                updateScreenUI();
            }, 1000);
        }
    });
}

function connectToSpecificChannel(channelStr) {
    currentInput = channelStr.toString();
    connectChannel();
}

function disconnectChannel() {
    postToLua('disconnectChannel', {}, function(resp) {
        isRadioOn = false;
        activeChannel = 0;
        updateScreenUI();
        
        const channelItems = document.querySelectorAll('.channel-item');
        channelItems.forEach(item => item.classList.remove('active'));
    });
}

/* Volume Control */
document.getElementById('vol-down').addEventListener('click', () => changeVolume(-10));
document.getElementById('vol-up').addEventListener('click', () => changeVolume(10));

function changeVolume(amount) {
    currentVolume += amount;
    if (currentVolume < 10) currentVolume = 10;
    if (currentVolume > 100) currentVolume = 100;
    
    updateVolumeUI();
    postToLua('changeVolume', { volume: currentVolume });
}

function updateVolumeUI() {
    document.getElementById('vol-text').innerText = currentVolume;
    
    // Rotate knob (-45deg to 45deg)
    const percentage = (currentVolume - 10) / 90; // 0 to 1
    const rotation = -45 + (percentage * 90);
    document.getElementById('knob-marker').style.transform = `translateX(-50%) rotate(${rotation}deg)`;
}

/* Sidebar Render */
function renderRestrictedChannels(channels) {
    const list = document.getElementById('channel-list');
    list.innerHTML = "";

    channels.forEach(ch => {
        let hasJob = false;
        if (ch.jobs && ch.jobs.includes(currentJob)) {
            hasJob = true;
        }

        const div = document.createElement('div');
        div.className = `channel-item ${hasJob ? '' : 'locked'} ${activeChannel === ch.channel ? 'active' : ''}`;
        div.setAttribute('data-chan', ch.channel);
        
        div.innerHTML = `
            <div class="channel-info">
                <span class="channel-name">${ch.name}</span>
                <span class="channel-freq">Frecuencia: ${ch.channel}</span>
            </div>
            ${hasJob ? '' : '<i class="fas fa-lock lock-icon"></i>'}
        `;

        if (hasJob) {
            div.addEventListener('click', () => connectToSpecificChannel(ch.channel));
        }

        list.appendChild(div);
    });
}

function postToLua(endpoint, data = {}, cb) {
    fetch(`https://${GetParentResourceName()}/${endpoint}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    }).then(resp => resp.json()).then(resp => {
        if(cb) cb(resp);
    }).catch(e => {
        if(cb) cb(null);
    });
}
