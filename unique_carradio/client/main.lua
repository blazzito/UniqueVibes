-- Pedir sincronizacion de todas las radios al entrar
Citizen.CreateThread(function()
    TriggerServerEvent('unique_carradio:server:requestSync')
    TriggerServerEvent('unique_carradio:server:getPlaylists')
end)

-- Sincronización desde el Servidor
local playingRadios = {}

local function getSoundName(vehNetId)
    return "radio_" .. tostring(vehNetId)
end


RegisterNetEvent('unique_carradio:client:playMusic', function(vehNetId, track, volume)
    local soundName = getSoundName(vehNetId)
    playingRadios[vehNetId] = true
    
    local pos = vector3(0.0, 0.0, 0.0)
    if NetworkDoesNetworkIdExist(vehNetId) then
        local veh = NetToVeh(vehNetId)
        if DoesEntityExist(veh) then
            pos = GetEntityCoords(veh)
        end
    end
    
    exports.xsound:PlayUrlPos(soundName, track.url, volume, pos)
    exports.xsound:Distance(soundName, 20)
    
    -- Auto Play Next: El jugador que tenga control de la red del coche avisa al servidor
    exports.xsound:onPlayEnd(soundName, function()
        if NetworkDoesNetworkIdExist(vehNetId) then
            local veh = NetToVeh(vehNetId)
            if DoesEntityExist(veh) and NetworkHasControlOfEntity(veh) then
                TriggerServerEvent('unique_carradio:server:nextMusic', vehNetId)
            end
        end
    end)
end)

RegisterNetEvent('unique_carradio:client:updateState', function(vehNetId, radioData)
end)

RegisterNetEvent('unique_carradio:client:receivePlaylists', function(playlists)
end)

RegisterNetEvent('unique_carradio:client:stopMusic', function(vehNetId)
    local soundName = getSoundName(vehNetId)
    playingRadios[vehNetId] = nil
    exports.xsound:Destroy(soundName)
end)

RegisterNetEvent('unique_carradio:client:pauseMusic', function(vehNetId)
    local soundName = getSoundName(vehNetId)
    exports.xsound:Pause(soundName)
end)

RegisterNetEvent('unique_carradio:client:resumeMusic', function(vehNetId)
    local soundName = getSoundName(vehNetId)
    exports.xsound:Resume(soundName)
end)

RegisterNetEvent('unique_carradio:client:changeVolume', function(vehNetId, volume)
    local soundName = getSoundName(vehNetId)
    exports.xsound:setVolume(soundName, volume)
end)

RegisterNetEvent('unique_carradio:client:syncRadios', function(radiosList)
    for vehNetId, data in pairs(radiosList) do
        local soundName = getSoundName(vehNetId)
        playingRadios[vehNetId] = true
        
        local pos = vector3(0.0, 0.0, 0.0)
        if NetworkDoesNetworkIdExist(vehNetId) then
            local veh = NetToVeh(vehNetId)
            if DoesEntityExist(veh) then
                pos = GetEntityCoords(veh)
            end
        end
        
        local track = data.queue[data.currentIndex]
        if track then
            exports.xsound:PlayUrlPos(soundName, track.url, data.volume, pos)
            exports.xsound:Distance(soundName, 20)
            
            if data.paused then
                exports.xsound:Pause(soundName)
            end
            
            exports.xsound:onPlayEnd(soundName, function()
                if NetworkDoesNetworkIdExist(vehNetId) then
                    local veh = NetToVeh(vehNetId)
                    if DoesEntityExist(veh) and NetworkHasControlOfEntity(veh) then
                        TriggerServerEvent('unique_carradio:server:nextMusic', vehNetId)
                    end
                end
            end)
        end
    end
end)

-- Bucle principal: Actualizar posicion de los sonidos
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        
        for vehNetId, isPlaying in pairs(playingRadios) do
            if isPlaying then
                local soundName = getSoundName(vehNetId)
                if NetworkDoesNetworkIdExist(vehNetId) then
                    local veh = NetToVeh(vehNetId)
                    if DoesEntityExist(veh) then
                        local pos = GetEntityCoords(veh)
                        exports.xsound:Position(soundName, pos)
                        -- Ajustar distancia segun velocidad
                        local speed = GetEntitySpeed(veh) * 3.6 -- km/h
                        if speed > 150.0 then
                            exports.xsound:Distance(soundName, 45)
                        elseif speed > 100.0 then
                            exports.xsound:Distance(soundName, 35)
                        elseif speed > 50.0 then
                            exports.xsound:Distance(soundName, 25)
                        else
                            exports.xsound:Distance(soundName, 20)
                        end
                    end
                end
            end
        end
    end
end)




