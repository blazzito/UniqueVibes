let currentRadioState = null;
let savedPlaylists = {};

window.addEventListener('message', function(event) {
    let data = event.data;

    if (data.type === "ui") {
        if (data.status === true) {
            $("#app").fadeIn(300);
            if (data.vehicleName) {
                $("#headerTitle").text(data.vehicleName + " Radio");
            }
        } else {
            $("#app").fadeOut(300);
        }
    }
    
    if (data.type === "updateState") {
        currentRadioState = data.radio;
        updateDashboard(currentRadioState);
    }
    
    if (data.type === "updatePlaylists") {
        savedPlaylists = data.playlists;
        renderPlaylists();
    }

    if (data.type === "stopped") {
        currentRadioState = null;
        resetDashboard();
    }
});

document.onkeyup = function (data) {
    if (data.key == "Escape") {
        closeUI();
    }
};

function closeUI() {
    $.post(`https://${GetParentResourceName()}/closeUI`, JSON.stringify({}));
}

$("#closeBtn").click(closeUI);

function sendPlayCommand(url) {
    let volume = $("#volumeSlider").val() / 100;
    if (url && url.trim() !== "") {
        $.post(`https://${GetParentResourceName()}/play`, JSON.stringify({
            url: url,
            volume: volume
        }));
        $("#urlInput").val("");
    }
}

$("#addBtn").click(function() {
    sendPlayCommand($("#urlInput").val());
});

$("#urlInput").keypress(function(e) {
    if(e.which == 13) {
        sendPlayCommand($("#urlInput").val());
    }
});

$("#playPauseBtn").click(function() {
    if (currentRadioState) {
        if (currentRadioState.paused) {
            $.post(`https://${GetParentResourceName()}/resume`, JSON.stringify({}));
        } else {
            $.post(`https://${GetParentResourceName()}/pause`, JSON.stringify({}));
        }
    }
});

$("#nextBtn").click(function() {
    $.post(`https://${GetParentResourceName()}/next`, JSON.stringify({}));
});

$("#prevBtn").click(function() {
    $.post(`https://${GetParentResourceName()}/prev`, JSON.stringify({}));
});

$("#stopBtn").click(function() {
    $.post(`https://${GetParentResourceName()}/stop`, JSON.stringify({}));
});

$("#loopBtn").click(function() {
    $.post(`https://${GetParentResourceName()}/toggleLoop`, JSON.stringify({}));
});

// Custom Circular Volume Knob Logic
let isDraggingVolume = false;
let startY = 0;
let startX = 0;
let startVolume = 50;

function updateVolumeVisual(vol) {
    if (isNaN(vol)) vol = 50;
    $("#volumeText").text(Math.round(vol) + "%");
    $("#volumeProgress").attr("stroke-dasharray", `${vol}, 100`);
}

$("#volumeKnob").on("mousedown", function(e) {
    isDraggingVolume = true;
    startY = e.clientY;
    startX = e.clientX;
    let parsed = parseInt($("#volumeText").text());
    startVolume = isNaN(parsed) ? 50 : parsed;
});

$(document).on("mousemove", function(e) {
    if (isDraggingVolume) {
        let deltaY = startY - e.clientY; // Up is positive
        let deltaX = e.clientX - startX; // Right is positive
        
        // Usar el movimiento mayor (horizontal o vertical)
        let delta = Math.abs(deltaY) > Math.abs(deltaX) ? deltaY : deltaX;
        
        let newVolume = startVolume + Math.floor(delta / 1.5); // Sensibilidad
        if (newVolume > 100) newVolume = 100;
        if (newVolume < 0) newVolume = 0;
        
        updateVolumeVisual(newVolume);
        
        $.post(`https://${GetParentResourceName()}/volume`, JSON.stringify({
            volume: newVolume / 100
        }));
    }
});

$(document).on("mouseup", function() {
    isDraggingVolume = false;
});

function removeFromQueue(index) {
    $.post(`https://${GetParentResourceName()}/removeFromQueue`, JSON.stringify({
        index: parseInt(index)
    }));
}

// Playlists Logic
let activePlaylist = null;

$("#savePlaylistBtn").click(function() {
    let name = $("#playlistName").val().trim();
    if (name !== "" && currentRadioState && currentRadioState.queue.length > 0) {
        $.post(`https://${GetParentResourceName()}/savePlaylist`, JSON.stringify({
            name: name,
            queue: currentRadioState.queue
        }));
        activePlaylist = name;
        $("#playlistName").val("");
    }
});

function playSavedPlaylist(name) {
    let queue = savedPlaylists[name];
    if (queue && queue.length > 0) {
        activePlaylist = name;
        queue.forEach(track => {
            sendPlayCommand(track.url);
        });
        renderPlaylists();
    }
}

function updateActivePlaylist(name) {
    if (currentRadioState && currentRadioState.queue.length > 0) {
        $.post(`https://${GetParentResourceName()}/savePlaylist`, JSON.stringify({
            name: name,
            queue: currentRadioState.queue
        }));
    }
}

function deletePlaylist(name) {
    if (activePlaylist === name) activePlaylist = null;
    $.post(`https://${GetParentResourceName()}/deletePlaylist`, JSON.stringify({
        name: name
    }));
}

function updateDashboard(radio) {
    if (!radio || !radio.queue || radio.queue.length === 0) {
        resetDashboard();
        return;
    }

    let track = radio.queue[radio.currentIndex - 1];
    
    // Thumbnail and Title
    if (track) {
        $("#thumbnailImg").attr("src", track.thumbnail);
        $("#trackTitle").text(track.title);
        
        if ($("#trackTitle").width() > $(".track-title-container").width()) {
            $("#trackTitle").addClass("scrolling");
        } else {
            $("#trackTitle").removeClass("scrolling");
        }
    }

    // Controls and Visualizer
    if (radio.paused) {
        $("#playPauseIcon").removeClass("fa-pause").addClass("fa-play");
        $("#visualizer").removeClass("active");
    } else {
        $("#playPauseIcon").removeClass("fa-play").addClass("fa-pause");
        $("#visualizer").addClass("active");
    }
    
    // Loop State
    if (radio.loop) {
        $("#loopBtn").addClass("active-loop");
    } else {
        $("#loopBtn").removeClass("active-loop");
    }

    // Volume Slider
    if (!isDraggingVolume) {
        updateVolumeVisual(radio.volume * 100);
    }

    // Queue Rendering
    let queueHtml = "";
    radio.queue.forEach((item, index) => {
        let activeClass = (index === radio.currentIndex - 1) ? "active" : "";
        queueHtml += `
            <div class="queue-item ${activeClass}">
                <img src="${item.thumbnail}" alt="thumb">
                <div class="queue-item-title">${item.title}</div>
                <i class="fas fa-times queue-item-delete" onclick="removeFromQueue(${index + 1})"></i>
            </div>
        `;
    });
    $("#queueList").html(queueHtml);
}

function renderPlaylists() {
    let html = "";
    for (let name in savedPlaylists) {
        let isActivo = (activePlaylist === name);
        let activeClass = isActivo ? "color: var(--color-petrol);" : "";
        let updateBtn = isActivo ? `<i class="fas fa-sync-alt" onclick="updateActivePlaylist('${name}')" title="Actualizar Playlist" style="color: var(--color-orange);"></i>` : "";
        
        html += `
            <div class="playlist-item">
                <span style="${activeClass}">${name} (${savedPlaylists[name].length})</span>
                <div class="playlist-actions">
                    ${updateBtn}
                    <i class="fas fa-plus" onclick="playSavedPlaylist('${name}')" title="Añadir a la cola"></i>
                    <i class="fas fa-trash" onclick="deletePlaylist('${name}')" title="Eliminar"></i>
                </div>
            </div>
        `;
    }
    $("#playlistsList").html(html);
}

function resetDashboard() {
    $("#thumbnailImg").attr("src", "https://img.youtube.com/vi/default/hqdefault.jpg");
    $("#trackTitle").text("No hay música reproduciéndose");
    $("#trackTitle").removeClass("scrolling");
    $("#playPauseIcon").removeClass("fa-pause").addClass("fa-play");
    $("#visualizer").removeClass("active");
    $("#loopBtn").removeClass("active-loop");
    $("#queueList").html("");
    activePlaylist = null;
    renderPlaylists();
}
