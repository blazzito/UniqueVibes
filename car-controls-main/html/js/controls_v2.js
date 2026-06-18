let isExpanded = false;

window.addEventListener('message', function(event) {
    let data = event.data;

    switch (data.type) {
        case 'show_minimized':
            document.getElementById("hud-container").style.display = 'flex';
            if (isExpanded) {
                collapseMenu();
            }
            break;
        case 'hide_completely':
            document.getElementById("hud-container").style.display = 'none';
            if (isExpanded) {
                collapseMenu();
            }
            break;
        case 'toggle_expand':
            if (isExpanded) {
                collapseMenu();
            } else {
                expandMenu();
            }
            break;
    }
});

window.addEventListener('keydown', function(event) {
    if(event.key === "Escape" || event.key === "i" || event.key === "I") {
        collapseMenu();
    }
});

function expandMenu() {
    isExpanded = true;
    document.getElementById("hud-container").classList.add("expanded");
    axios.post(`https://${GetParentResourceName()}/focusOn`, {});
}

function collapseMenu() {
    isExpanded = false;
    document.getElementById("hud-container").classList.remove("expanded");
    axios.post(`https://${GetParentResourceName()}/focusOff`, {});
}

function toggleMenu() {
    if (isExpanded) {
        collapseMenu();
    } else {
        expandMenu();
    }
}

// Car Functions
toggleEngine = function() {
    axios.post(`https://${GetParentResourceName()}/toggleEngine`, { action: 'toggle' });
}
toggleFrontHood = function() {
    axios.post(`https://${GetParentResourceName()}/toggleFrontHood`, { action: 'toggle' });
}
toggleTrunk = function() {
    axios.post(`https://${GetParentResourceName()}/toggleTrunk`, { action: 'toggle' });
}
toggleHeadlights = function() {
    axios.post(`https://${GetParentResourceName()}/toggleHeadlights`, { action: 'toggle' });
}
openDoor = function(index) {
    axios.post(`https://${GetParentResourceName()}/openDoor`, { action: 'open', doorIndex: index });
}
openWindow = function(index) {
    axios.post(`https://${GetParentResourceName()}/openWindow`, { action: 'open', windowIndex: index });
}
sitAtSeat = function(index) {
    axios.post(`https://${GetParentResourceName()}/sitAtSeat`, { action: 'sit', seatIndex: index });
}
