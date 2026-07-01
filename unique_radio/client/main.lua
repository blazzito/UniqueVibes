local ESX = exports['es_extended']:getSharedObject()
local radioUIOpen = false
local radioOn = false
local currentChannel = 0
local radioVolume = Config.DefaultVolume

-- Función para reproducir la animación de usar la radio
local function playRadioAnimation()
    local ped = PlayerPedId()
    RequestAnimDict(Config.RadioAnim.Dict)
    while not HasAnimDictLoaded(Config.RadioAnim.Dict) do
        Wait(10)
    end
    TaskPlayAnim(ped, Config.RadioAnim.Dict, Config.RadioAnim.Anim, 8.0, -8.0, -1, 50, 0, false, false, false)
end

-- Función para detener la animación
local function stopRadioAnimation()
    local ped = PlayerPedId()
    StopAnimTask(ped, Config.RadioAnim.Dict, Config.RadioAnim.Anim, 1.0)
end

local currentAnimIndex = 1
local activeProp = nil

-- Función para limpiar prop
local function removeRadioProp()
    if activeProp and DoesEntityExist(activeProp) then
        DeleteEntity(activeProp)
    end
    activeProp = nil
end

-- Abrir el panel de la radio
RegisterNetEvent('unique_radio:client:openRadio', function(playerJobName)
    if radioUIOpen then return end
    radioUIOpen = true
    SetNuiFocus(true, true)
    
    playRadioAnimation()

    SendNUIMessage({
        action = "openUI",
        job = playerJobName,
        channels = Config.RestrictedChannels,
        currentChannel = currentChannel,
        isOn = radioOn,
        volume = radioVolume,
        currentAnim = currentAnimIndex
    })
end)

-- Cambiar animacion
RegisterNUICallback('changeAnim', function(data, cb)
    if data.animIndex and Config.TalkAnims[data.animIndex] then
        currentAnimIndex = data.animIndex
    end
    cb('ok')
end)

-- Cerrar el panel
RegisterNUICallback('closeUI', function(data, cb)
    radioUIOpen = false
    SetNuiFocus(false, false)
    stopRadioAnimation()
    cb('ok')
end)

-- Conectarse a un canal
RegisterNUICallback('connectChannel', function(data, cb)
    local channel = tonumber(data.channel)
    if not channel then
        cb({ success = false, message = "Canal inválido" })
        return
    end
    
    ESX.TriggerServerCallback('unique_radio:server:checkRadioAccess', function(hasAccess)
        if hasAccess then
            currentChannel = channel
            radioOn = true
            exports["pma-voice"]:setRadioChannel(channel)
            cb({ success = true, channel = channel })
            
            -- Iniciar loop para comprobar que el usuario sigue teniendo la radio
            CreateThread(function()
                while radioOn do
                    Wait(2000)
                    local count = exports.ox_inventory:Search('count', Config.ItemName)
                    if count == 0 then
                        -- Perdió la radio
                        radioOn = false
                        currentChannel = 0
                        exports["pma-voice"]:setRadioChannel(0)
                        ESX.ShowNotification('Te has desconectado de la radio al no tener el dispositivo.')
                        if radioUIOpen then
                            SendNUIMessage({ action = "forceDisconnect" })
                        end
                        break
                    end
                end
            end)
        else
            cb({ success = false, message = "No tienes permiso para usar esta frecuencia." })
        end
    end, channel)
end)

-- Desconectarse
RegisterNUICallback('disconnectChannel', function(data, cb)
    radioOn = false
    currentChannel = 0
    exports["pma-voice"]:setRadioChannel(0)
    cb('ok')
end)

-- Cambiar volumen
RegisterNUICallback('changeVolume', function(data, cb)
    local vol = tonumber(data.volume)
    if vol and vol >= 1 and vol <= 100 then
        radioVolume = vol
        exports["pma-voice"]:setRadioVolume(radioVolume)
    end
    cb('ok')
end)

-- Cerrar interfaz al morir
AddEventHandler('esx:onPlayerDeath', function(data)
    if radioUIOpen then
        radioUIOpen = false
        SetNuiFocus(false, false)
        stopRadioAnimation()
        SendNUIMessage({ action = "closeUI" })
    end
    removeRadioProp()
end)

-- Animación al hablar por radio
AddEventHandler('pma-voice:radioActive', function(isTalking)
    local ped = PlayerPedId()
    local animData = Config.TalkAnims[currentAnimIndex]
    
    if isTalking then
        RequestAnimDict(animData.Dict)
        while not HasAnimDictLoaded(animData.Dict) do Wait(10) end
        
        TaskPlayAnim(ped, animData.Dict, animData.Anim, 8.0, -8.0, -1, 49, 0, false, false, false)
        
        if animData.Prop then
            local model = GetHashKey(animData.Prop)
            RequestModel(model)
            while not HasModelLoaded(model) do Wait(10) end
            
            local coords = GetEntityCoords(ped)
            activeProp = CreateObject(model, coords.x, coords.y, coords.z + 0.2, true, true, true)
            local bone = GetPedBoneIndex(ped, animData.PropBone)
            local p = animData.PropPlacement
            AttachEntityToEntity(activeProp, ped, bone, p[1], p[2], p[3], p[4], p[5], p[6], true, true, false, true, 1, true)
        end
    else
        StopAnimTask(ped, animData.Dict, animData.Anim, 1.0)
        removeRadioProp()
    end
end)
