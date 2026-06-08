let canClose = false; // Variable de seguridad para no cerrar por accidente

window.addEventListener('message', function(event) {
    let item = event.data;

    if (item.action === 'open') {
        // 1. Reseteamos el permiso para cerrar
        canClose = false; 
        
        $('#app').fadeIn(200);
        
        // Actualizar datos
        if (item.data) {
            $('#charName').text(item.data.name);
            $('#charJob').text(item.data.job.toUpperCase());
            $('#charCash').text('$' + item.data.cash.toLocaleString());
            $('#charBank').text('$' + item.data.bank.toLocaleString());
            $('#playerId').text(item.data.id);
        }

        // 2. ACTIVAMOS EL PERMISO DESPUÉS DE 500ms
        setTimeout(function() {
            canClose = true;
        }, 500);
        
    } else if (item.action === 'close') {
        $('#app').fadeOut(200);
        canClose = false;
    }
});

// Detectar tecla ESC para cerrar
document.onkeyup = function(data) {
    if (data.which == 27) { // Tecla ESC
        if (canClose) {
            resumeGame();
        }
    }
};

function resumeGame() {
    $.post('https://Blazz_PauseMenu/close', JSON.stringify({}));
}

function openMap() {
    $.post('https://Blazz_PauseMenu/openMap', JSON.stringify({}));
}

function openSettings() {
    $.post('https://Blazz_PauseMenu/openSettings', JSON.stringify({}));
}

function disconnect() {
    $.post('https://Blazz_PauseMenu/quitGame', JSON.stringify({}));
}