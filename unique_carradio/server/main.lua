local activeRadios = {}

-- Función para obtener los metadatos de YouTube de forma asíncrona usando noembed
local function FetchYouTubeMetadata(url, cb)
    if string.find(url, "youtube.com") or string.find(url, "youtu.be") then
        local apiUrl = "https://noembed.com/embed?url=" .. url
        PerformHttpRequest(apiUrl, function(err, text, headers)
            if err == 200 and text ~= nil then
                local data = json.decode(text)
                if data and data.title then
                    cb(data.title, data.thumbnail_url or "https://img.youtube.com/vi/default/hqdefault.jpg")
                else
                    cb("Video Desconocido", "")
                end
            else
                cb("Video Desconocido", "")
            end
        end, "GET", "", {["Content-Type"] = "application/json"})
    else
        -- Si es un MP3 directo u otra cosa
        cb("Archivo de Audio", "https://cdn-icons-png.flaticon.com/512/16/16492.png")
    end
end

-- Obtener identificador del jugador (preferiblemente license)
local function GetPlayerIdentifierFast(src)
    local first = nil
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if not first then first = id end
        if string.sub(id, 1, string.len("license:")) == "license:" then
            return id
        end
    end
    return first or tostring(src)
end

local lastPlayTime = {}

-- Cuando un cliente quiere reproducir/añadir una cancion a la cola
RegisterNetEvent('unique_carradio:server:playMusic', function(vehNetId, url, title, thumbnail, volume)
    if lastPlayTime[vehNetId] and (GetGameTimer() - lastPlayTime[vehNetId]) < 1000 then
        return
    end
    lastPlayTime[vehNetId] = GetGameTimer()

    local src = source
    if not activeRadios[vehNetId] then
        activeRadios[vehNetId] = { queue = {}, isPlaying = false, volume = volume, loop = false, currentIndex = 1, owner = src }
    end
    
    local track = { url = url, title = title or "Desconocido", thumbnail = thumbnail or "https://img.youtube.com/vi/default/hqdefault.jpg" }
    table.insert(activeRadios[vehNetId].queue, track)
    
    if not activeRadios[vehNetId].isPlaying then
        activeRadios[vehNetId].isPlaying = true
        TriggerClientEvent('unique_carradio:client:playMusic', -1, vehNetId, track, volume)
    end
    TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
end)

-- Cuando un cliente pide saltar a la siguiente cancion
RegisterNetEvent('unique_carradio:server:nextMusic', function(vehNetId)
    if activeRadios[vehNetId] then
        local radio = activeRadios[vehNetId]
        if radio.currentIndex < #radio.queue then
            radio.currentIndex = radio.currentIndex + 1
            local nextTrack = radio.queue[radio.currentIndex]
            radio.paused = false
            TriggerClientEvent('unique_carradio:client:playMusic', -1, vehNetId, nextTrack, radio.volume)
            TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
        else
            if radio.loop and #radio.queue > 0 then
                -- Reiniciar la playlist
                radio.currentIndex = 1
                local nextTrack = radio.queue[1]
                radio.paused = false
                TriggerClientEvent('unique_carradio:client:playMusic', -1, vehNetId, nextTrack, radio.volume)
                TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
            else
                -- Se acabo la cola
                activeRadios[vehNetId] = nil
                TriggerClientEvent('unique_carradio:client:stopMusic', -1, vehNetId)
            end
        end
    end
end)

-- Cuando un cliente pide saltar a la cancion anterior
RegisterNetEvent('unique_carradio:server:prevMusic', function(vehNetId)
    if activeRadios[vehNetId] then
        local radio = activeRadios[vehNetId]
        if radio.currentIndex > 1 then
            radio.currentIndex = radio.currentIndex - 1
            local prevTrack = radio.queue[radio.currentIndex]
            radio.paused = false
            TriggerClientEvent('unique_carradio:client:playMusic', -1, vehNetId, prevTrack, radio.volume)
            TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
        end
    end
end)

-- Eliminar cancion de la cola
RegisterNetEvent('unique_carradio:server:removeFromQueue', function(vehNetId, index)
    if activeRadios[vehNetId] and activeRadios[vehNetId].queue[index] then
        table.remove(activeRadios[vehNetId].queue, index)
        
        local radio = activeRadios[vehNetId]
        
        -- Si eliminamos la que esta sonando actualmente
        if index == radio.currentIndex then
            -- Borramos la actual, pasar a la siguiente si la hay
            if #radio.queue == 0 then
                activeRadios[vehNetId] = nil
                TriggerClientEvent('unique_carradio:client:stopMusic', -1, vehNetId)
            else
                if radio.currentIndex > #radio.queue then
                    radio.currentIndex = #radio.queue
                end
                local track = radio.queue[radio.currentIndex]
                radio.paused = false
                TriggerClientEvent('unique_carradio:client:playMusic', -1, vehNetId, track, radio.volume)
            end
        elseif index < radio.currentIndex then
            radio.currentIndex = radio.currentIndex - 1
        end
        
        if activeRadios[vehNetId] then
            TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
        end
    end
end)

RegisterNetEvent('unique_carradio:server:skipTo', function(vehNetId, index)
    local radio = activeRadios[vehNetId]
    if radio and radio.queue[index] then
        radio.currentIndex = index
        radio.paused = false
        local track = radio.queue[radio.currentIndex]
        TriggerClientEvent('unique_carradio:client:playMusic', -1, vehNetId, track, radio.volume)
        TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, radio)
    end
end)

-- Evento para detener
RegisterNetEvent('unique_carradio:server:stopMusic', function(vehNetId)
    if activeRadios[vehNetId] then
        activeRadios[vehNetId] = nil
        TriggerClientEvent('unique_carradio:client:stopMusic', -1, vehNetId)
    end
end)

-- Pausar musica
RegisterNetEvent('unique_carradio:server:pauseMusic', function(vehNetId)
    if activeRadios[vehNetId] then
        activeRadios[vehNetId].paused = true
        TriggerClientEvent('unique_carradio:client:pauseMusic', -1, vehNetId)
        TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
    end
end)



RegisterNetEvent('unique_carradio:server:playPlaylist', function(vehNetId, queue, volume)
    if not activeRadios[vehNetId] then
        activeRadios[vehNetId] = { queue = {}, isPlaying = false, volume = volume, loop = false, currentIndex = 1 }
    end
    
    activeRadios[vehNetId].queue = queue
    activeRadios[vehNetId].currentIndex = 1
    activeRadios[vehNetId].isPlaying = true
    activeRadios[vehNetId].paused = false
    
    local track = queue[1]
    if track then
        TriggerClientEvent('unique_carradio:client:playMusic', -1, vehNetId, track, volume)
    end
    
    TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
end)

-- Reanudar musica
RegisterNetEvent('unique_carradio:server:resumeMusic', function(vehNetId)
    if activeRadios[vehNetId] then
        activeRadios[vehNetId].paused = false
        TriggerClientEvent('unique_carradio:client:resumeMusic', -1, vehNetId)
        TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
    end
end)

-- Limpiar Cola
RegisterNetEvent('unique_carradio:server:clearQueue', function(vehNetId)
    if activeRadios[vehNetId] then
        -- Si esta reproduciendo algo, lo dejamos, solo borramos la cola, o borramos todo?
        -- El usuario pidio "limpie la cola y ahi si agregue las canciones"
        -- Si borra la cola, la reproduccion actual no deberia cortarse hasta que se haga play de la siguiente. 
        -- Pero si borra la cola y le da playPlaylist, PlayPlaylist hace un $.post('play') por cada track.
        -- Lo mejor es detener y vaciar.
        activeRadios[vehNetId].queue = {}
        activeRadios[vehNetId].currentIndex = 0
        TriggerClientEvent('unique_carradio:client:stopMusic', -1, vehNetId)
    end
end)

-- Cambiar volumen
RegisterNetEvent('unique_carradio:server:changeVolume', function(vehNetId, volume)
    if activeRadios[vehNetId] then
        activeRadios[vehNetId].volume = volume
        TriggerClientEvent('unique_carradio:client:changeVolume', -1, vehNetId, volume)
        TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
    end
end)

-- Activar/Desactivar Loop
RegisterNetEvent('unique_carradio:server:toggleLoop', function(vehNetId)
    if activeRadios[vehNetId] then
        activeRadios[vehNetId].loop = not activeRadios[vehNetId].loop
        TriggerClientEvent('unique_carradio:client:updateState', -1, vehNetId, activeRadios[vehNetId])
    end
end)

-- Solicitar informacion de un vehiculo para la UI
RegisterNetEvent('unique_carradio:server:requestVehicleState', function(vehNetId)
    local src = source
    if activeRadios[vehNetId] then
        TriggerClientEvent('unique_carradio:client:updateState', src, vehNetId, activeRadios[vehNetId])
    end
end)

-- Sincronizacion inicial al entrar
RegisterNetEvent('unique_carradio:server:requestSync', function()
    local src = source
    TriggerClientEvent('unique_carradio:client:syncRadios', src, activeRadios)
end)

-----------------------------------------------------------
-- SISTEMA KVP PARA GUARDAR PLAYLISTS PERMANENTES
-----------------------------------------------------------

RegisterNetEvent('unique_carradio:server:savePlaylist', function(name, queue)
    local src = source
    local identifier = GetPlayerIdentifierFast(src)
    local key = "carradio_playlists_" .. identifier
    
    local savedData = GetResourceKvpString(key)
    local playlists = {}
    if savedData then
        playlists = json.decode(savedData) or {}
    end
    
    playlists[name] = queue
    SetResourceKvp(key, json.encode(playlists))
    TriggerClientEvent('unique_carradio:client:updatePlaylists', src, playlists)
end)

RegisterNetEvent('unique_carradio:server:deletePlaylist', function(name)
    local src = source
    local identifier = GetPlayerIdentifierFast(src)
    local key = "carradio_playlists_" .. identifier
    
    local savedData = GetResourceKvpString(key)
    local playlists = {}
    if savedData then
        playlists = json.decode(savedData) or {}
    end
    
    playlists[name] = nil
    SetResourceKvp(key, json.encode(playlists))
    TriggerClientEvent('unique_carradio:client:updatePlaylists', src, playlists)
end)

RegisterNetEvent('unique_carradio:server:getPlaylists', function()
    local src = source
    local identifier = GetPlayerIdentifierFast(src)
    local key = "carradio_playlists_" .. identifier
    
    local savedData = GetResourceKvpString(key)
    local playlists = {}
    if savedData then
        playlists = json.decode(savedData) or {}
    end
    
    TriggerClientEvent('unique_carradio:client:updatePlaylists', src, playlists)
end)
