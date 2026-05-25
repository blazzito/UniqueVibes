-- ===========================
-- TAXI MODULE - CLIENT
-- ===========================

local TaxiJob = Job:new("taxi")
local isOnDuty = false
local taxiAlerts = {}
local currentAlert = 0
local npcAutoSearchEnabled = false
local autoAcceptAlerts = false
local pendingNPCMission = nil
local showingAlerts = false
local currentMission = nil
local missionNpc = nil
local missionBlip = nil
local missionNpcSpawnTime = nil  -- para timeout global de recogida
local workStartTime = nil
local spawnedVehicle = nil
local taxiSettings = {}
local alertBlip = nil
local isMenuOpen = false
local isDispatchVisible = false
local npcSearchActive = false
local npcSearchToken = 0
local npcAutoSearchEnabled = false

-- Forward declarations for local functions called in event handlers
local ClearPendingNPCMission = nil
local CleanMission = nil
local RequestNPCMission = nil
local SaveCurrentVehicle = nil
local ToggleTaxiDispatch = nil


-- Helper: Verifica si el jugador es taxista (por job QBCore O por duty del business)
function IsTaxiPlayer()
    if isOnDuty then return true end
    if not ESX then return false end
    local PlayerData = ESX.GetPlayerData()
    if PlayerData and PlayerData.job and PlayerData.job.name == TaxiConfig.JobName then return true end
    return false
end

-- ===========================
-- INIT
-- ===========================
function TaxiJob:init()
    Job.init(self)
    self:CreateBlip()
end

function TaxiJob:CreateBlip()
    local blip = AddBlipForCoord(TaxiConfig.Blip.Coords.x, TaxiConfig.Blip.Coords.y, TaxiConfig.Blip.Coords.z)
    SetBlipSprite(blip, TaxiConfig.Blip.Sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, TaxiConfig.Blip.Scale)
    SetBlipColour(blip, TaxiConfig.Blip.Color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(TaxiConfig.Blip.Label)
    EndTextCommandSetBlipName(blip)
end

-- ===========================
-- HELPER: Obtener posición de un marker (con override del jefe)
-- ===========================
local function GetMarkerPosition(key)
    if taxiSettings[key] then
        return taxiSettings[key]
    end
    local def = TaxiConfig.DefaultLocations[key]
    if def then
        if type(def) == "vector4" then
            return def
        elseif type(def) == "vector3" then
            return vector4(def.x, def.y, def.z, 0.0)
        end
    end
    return nil
end

-- ===========================
-- NUI CALLBACKS
-- ===========================
RegisterNUICallback("taxiAction", function(data, cb)
    cb("ok")
    local action = data.action

    if action == "toggleDuty" then
        TriggerServerEvent("mt-taxi:server:toggleDuty")
    elseif action == "spawnVehicle" then
        TriggerServerEvent("mt-taxi:server:spawnVehicle", data.model)
    elseif action == "saveVehicle" then
        SaveCurrentVehicle()
    elseif action == "requestMission" then
        RequestNPCMission()
    elseif action == "openWardrobe" then
        TriggerServerEvent("mt-taxi:server:openWardrobe")
    elseif action == "openStash" then
        TriggerServerEvent("mt-taxi:server:openStash")
    elseif action == "saveSetting" then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)
        TriggerServerEvent("mt-taxi:server:saveSetting", data.key, {
            x = coords.x,
            y = coords.y,
            z = coords.z,
            w = heading
        })
    elseif action == "acceptAlert" then
        if data.coords then
            SetNewWaypoint(data.coords.x, data.coords.y)
            if GetResourceState('mt-notify') == 'started' then
                exports['mt-notify']:Notify({ description = 'GPS marcado hacia el pasajero', type = 'success', duration = 3000 })
            end
            -- Marcar la alerta como aceptada por este taxista
            if data.playerID then
                for _, alert in ipairs(taxiAlerts) do
                    if alert.playerID == data.playerID then
                        alert.acceptedByMe = true
                        break
                    end
                end
                TriggerServerEvent("mt-taxi:server:acceptAlert", data.playerID)
            end
        end
    elseif action == "toggleDispatch" then
        ToggleTaxiDispatch()
    elseif action == "toggleConfig" then
        if data.key == "autoAccept" then
            npcAutoSearchEnabled = not npcAutoSearchEnabled
            if npcAutoSearchEnabled and not currentMission and not pendingNPCMission then
                StartNPCCallSearch()
            end
        elseif data.key == "autoAcceptAlerts" then
            autoAcceptAlerts = not autoAcceptAlerts
        elseif data.key == "showDispatch" then
            ToggleTaxiDispatch()
        end
    elseif action == "clearAlerts" then
        taxiAlerts = {}
        currentAlert = 0
        SyncDispatchAlert()
    end
end)

RegisterNUICallback("taxiClose", function(data, cb)
    cb("ok")
    isMenuOpen = false
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
end)

-- ===========================
-- MENU: Abrir/Cerrar
-- ===========================
local function OpenTaxiMenu(context)
    if not IsTaxiPlayer() then return end
    context = context or 'f6'
    local PlayerData = ESX.GetPlayerData()

    local dutyCount = lib.callback.await("mt-taxi:server:getDutyCount", false) or 0

    -- Preparar alertas para NUI (convertir coords a tabla)
    local nuiAlerts = {}
    for _, alert in ipairs(taxiAlerts) do
        local a = {}
        for k, v in pairs(alert) do
            a[k] = v
        end
        if type(alert.coords) == "vector3" then
            a.coords = { x = alert.coords.x, y = alert.coords.y, z = alert.coords.z }
        end
        table.insert(nuiAlerts, a)
    end

    -- Preparar vehículos
    local vehicles = {}
    for _, veh in ipairs(TaxiConfig.Vehicles) do
        table.insert(vehicles, { model = veh.model, label = veh.label })
    end

    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
    isMenuOpen = true

    -- Thread: desactivar solo el mouse look para que no mueva la cámara
    CreateThread(function()
        while isMenuOpen do
            DisableControlAction(0, 1, true)   -- Mouse Look LR
            DisableControlAction(0, 2, true)   -- Mouse Look UD
            DisableControlAction(0, 24, true)  -- Attack
            DisableControlAction(0, 25, true)  -- Aim
            DisableControlAction(0, 106, true) -- Vehicle Mouse Look LR
            DisableControlAction(0, 107, true) -- Vehicle Mouse Look UD
            Wait(0)
        end
    end)

    SendNUIMessage({
        action = "openTaxiMenu",
        context = context,
        isOnDuty = isOnDuty,
        isBoss = PlayerData and PlayerData.job and PlayerData.job.name == TaxiConfig.JobName and PlayerData.job.grade >= TaxiConfig.BossGrade,
        dutyCount = dutyCount,
        alerts = nuiAlerts,
        vehicles = vehicles,
    })
end

function CloseTaxiMenu()
    isMenuOpen = false
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    SendNUIMessage({ action = "closeTaxiMenu" })
end

-- ===========================
-- DUTY SYSTEM
-- ===========================
RegisterNetEvent("mt-taxi:client:dutyChanged", function(duty)
    isOnDuty = duty
    
    -- Sync NUI
    SendNUIMessage({
        action = "taxiDutyChanged",
        duty = duty,
    })

    if duty then
        -- Cargar settings del servidor
        taxiSettings = lib.callback.await("mt-taxi:server:getSettings", false)
    else
        -- Limpiar alertas al salir de servicio
        taxiAlerts = {}
        currentAlert = 0
        showingAlerts = false
        npcAutoSearchEnabled = false
        npcSearchActive = false
        npcSearchToken = npcSearchToken + 1
        ClearPendingNPCMission(false)
        CleanMission()
    end
end)

-- Al cargar el jugador, verificar si ya est servicio
RegisterNetEvent('esx:playerLoaded', function()
    local PlayerData = ESX.GetPlayerData()
    if PlayerData and PlayerData.job and PlayerData.job.name == TaxiConfig.JobName then
        if PlayerData.job.onduty then
            isOnDuty = true
            taxiSettings = lib.callback.await("mt-taxi:server:getSettings", false)
        end
    end
    -- También verificar si ya está registrado via business
    if not isOnDuty then
        local dutyViaServer = lib.callback.await("mt-taxi:server:isDuty", false)
        if dutyViaServer then
            isOnDuty = true
            taxiSettings = lib.callback.await("mt-taxi:server:getSettings", false)
        end
    end
end)

RegisterNetEvent('esx:setJob', function(job)
    if job.name ~= TaxiConfig.JobName then
        isOnDuty = false
        npcAutoSearchEnabled = false
        npcSearchActive = false
        npcSearchToken = npcSearchToken + 1
        ClearPendingNPCMission(false)
        taxiAlerts = {}
        currentAlert = 0
        showingAlerts = false
        CleanMission()
    end
end)

-- ===========================
-- SETTINGS SYNC
-- ===========================
RegisterNetEvent("mt-taxi:client:settingUpdated", function(key, coords)
    taxiSettings[key] = coords
end)

-- ===========================
-- DISPATCH: Recibir alertas de /taxi
-- ===========================
RegisterNetEvent("mt-taxi:client:receiveAlert", function(alert)
    if not isOnDuty then return end
    PlaySoundFrontend(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", false)

    if type(alert.coords) == "table" then
        alert.coords = vector3(alert.coords.x, alert.coords.y, alert.coords.z)
    end

    -- Calcular distancia
    local myCoords = GetEntityCoords(PlayerPedId())
    alert.distance = #(myCoords - alert.coords)
    if alert.distance < 1000 then
        alert.distanceText = string.format("%.0f m", alert.distance)
    else
        alert.distanceText = string.format("%.1f Km", alert.distance / 1000)
    end

    -- Obtener nombre de calle
    alert.street = GetStreetNameFromHashKey(GetStreetNameAtCoord(alert.coords.x, alert.coords.y, alert.coords.z))

    table.insert(taxiAlerts, alert)
    currentAlert = #taxiAlerts

    -- Sync NUI y mostrar dispatch
    SyncDispatchAlert()
    ToggleTaxiDispatch(true)

    -- Notificar
    if GetResourceState('mt-notify') == 'started' then
        exports['mt-notify']:Notify({ description = '📞 Nueva solicitud de taxi: ' .. (alert.message or ''), type = 'info', duration = 5000 })
    end
end)

-- Evento: alerta aceptada por otro taxista
RegisterNetEvent("mt-taxi:client:alertAccepted", function(alertPlayerID, driverName)
    for i, alert in ipairs(taxiAlerts) do
        if alert.playerID == alertPlayerID and not alert.acceptedBy then
            alert.acceptedBy = driverName
            break
        end
    end
    SyncDispatchAlert()
end)

RegisterNetEvent("mt-taxi:client:alertCancelled", function(alertPlayerID)
    for i, alert in ipairs(taxiAlerts) do
        if alert.playerID == alertPlayerID then
            alert.acceptedBy = nil
            break
        end
    end
    SyncDispatchAlert()
end)

RegisterNetEvent("mt-taxi:client:alertResolved", function(alertPlayerID)
    -- Eliminar la alerta definitivamente de la lista local (para todos los taxistas)
    for i, alert in ipairs(taxiAlerts) do
        if alert.playerID == alertPlayerID then
            table.remove(taxiAlerts, i)
            if currentAlert > #taxiAlerts then
                currentAlert = math.max(1, #taxiAlerts)
            end
            if #taxiAlerts == 0 then
                currentAlert = 0
            end
            break
        end
    end
    SyncDispatchAlert()
end)

-- ===========================
-- VEHICLE: Spawn y guardar
-- ===========================
RegisterNetEvent("mt-taxi:client:spawnVehicle", function(model, spawnCoords)
    print("^2[TAXI]^7 Intentando spawnear vehículo: " .. tostring(model) .. " en " .. tostring(spawnCoords.x) .. ", " .. tostring(spawnCoords.y))
    -- Borrar vehículo anterior si existe
    if spawnedVehicle and DoesEntityExist(spawnedVehicle) then
        DeleteVehicle(spawnedVehicle)
    end

    local hash = GetHashKey(model)
    RequestModel(hash)
    local timeout = 0
    while not HasModelLoaded(hash) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end

    if not HasModelLoaded(hash) then
        exports['ox_lib']:notify({ title = 'Taxi', description = 'Error: No se pudo cargar el modelo ' .. model, type = 'error' })
        return
    end

    -- Si no hay w (heading), usar 0.0
    local heading = spawnCoords.w or spawnCoords.heading or 0.0

    MTJobsFadeOut(500)

    local veh = CreateVehicle(hash, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false)
    SetModelAsNoLongerNeeded(hash)
    SetVehicleNumberPlateText(veh, "TAXI" .. math.random(100, 999))
    SetEntityAsMissionEntity(veh, true, true)
    SetVehicleEngineOn(veh, true, true, false)
    SetVehicleDoorsLocked(veh, 1) -- Unlocked
    
    -- Meter al jugador en el vehículo
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    
    spawnedVehicle = veh

    MTJobsFadeIn(500)

    if GetResourceState('mt-notify') == 'started' then
        exports['mt-notify']:Notify({ description = 'Vehículo de taxi listo', type = 'success', duration = 3000 })
    end
end)

function SaveCurrentVehicle()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    
    if veh == 0 then
        -- Buscar vehículo cercano
        local saveCoords = GetMarkerPosition("VehicleSave")
        if saveCoords then
            veh = GetClosestVehicle(saveCoords.x, saveCoords.y, saveCoords.z, 5.0, 0, 70)
        end
    end

    if veh == 0 then
        if GetResourceState('mt-notify') == 'started' then
            exports['mt-notify']:Notify({ description = 'No hay vehículo para guardar', type = 'error', duration = 3000 })
        end
        return
    end

    -- Sacar al conductor si está dentro
    if GetPedInVehicleSeat(veh, -1) == ped then
        TaskLeaveVehicle(ped, veh, 0)
        Wait(1500)
    end

    local netId = NetworkGetNetworkIdFromEntity(veh)
    TriggerServerEvent("mt-taxi:server:saveVehicle", netId)
    
    if veh == spawnedVehicle then
        spawnedVehicle = nil
    end
end

-- ===========================
-- WARDROBE: Vestuario
-- ===========================
RegisterNetEvent("mt-taxi:client:applyUniform", function(uniform)
    if not uniform or not uniform.drawables then return end

    local ped = PlayerPedId()
    for componentStr, data in pairs(uniform.drawables) do
        local component = tonumber(componentStr)
        if component then
            SetPedComponentVariation(ped, component, data.index, data.texture, 0)
        end
    end

    if GetResourceState('mt-notify') == 'started' then
        exports['mt-notify']:Notify({ description = 'Uniforme de taxista aplicado', type = 'success', duration = 3000 })
    end
end)

-- ===========================
-- STASH: Abrir taquilla
-- ===========================
RegisterNetEvent("mt-taxi:client:openStash", function(stashId)
    if GetResourceState('ox_inventory') == 'started' then
        exports.ox_inventory:openInventory('stash', stashId)
    end
end)

-- ===========================
-- NPC MISSIONS
-- ===========================
local pendingNPCMission    = nil  -- datos pendientes de aceptar/rechazar
local RunNPCMissionThread          -- forward declaration

ClearPendingNPCMission = function(showNotify)
    if not pendingNPCMission then return end
    pendingNPCMission = nil
    SendNUIMessage({ action = 'taxiNPCMissionCleared' })
    if showNotify and GetResourceState('mt-notify') == 'started' then
        exports['mt-notify']:Notify({ description = 'Carrera NPC rechazada', type = 'error', duration = 3000 })
    end
end

local function GetRandomNPCDelaySeconds()
    local buckets = { 5, 10, 15, 20, 25, 30, 35, 40, 45 }
    return buckets[math.random(1, #buckets)] or 15
end

local function StartNPCCallSearch()
    if npcSearchActive then return end
    if not npcAutoSearchEnabled then return end
    if not isOnDuty then return end
    npcSearchActive = true
    npcSearchToken = npcSearchToken + 1
    local myToken = npcSearchToken

    CreateThread(function()
        while npcAutoSearchEnabled and npcSearchActive and myToken == npcSearchToken and not currentMission and not pendingNPCMission do
            local waitSeconds = GetRandomNPCDelaySeconds()
            local waited = 0
            while waited < waitSeconds and npcAutoSearchEnabled and npcSearchActive and myToken == npcSearchToken and not currentMission and not pendingNPCMission do
                Wait(1000)
                waited = waited + 1
            end

            if not npcAutoSearchEnabled or not npcSearchActive or myToken ~= npcSearchToken or currentMission or pendingNPCMission then
                break
            end

            local locations = TaxiConfig.NPCMissions.Locations
            if not locations or #locations < 2 then
                break
            end

            local pickupIndex = math.random(1, #locations)
            local dropoffIndex = pickupIndex
            while dropoffIndex == pickupIndex do
                dropoffIndex = math.random(1, #locations)
            end

            local pickup  = locations[pickupIndex]
            local dropoff = locations[dropoffIndex]
            local distance = #(pickup.coords - dropoff.coords)
            local payment  = math.floor(distance * TaxiConfig.NPCMissions.PaymentPerKm / 1000)
            payment = math.max(TaxiConfig.NPCMissions.MinPayment, math.min(payment, TaxiConfig.NPCMissions.MaxPayment))

            pendingNPCMission = { pickup = pickup, dropoff = dropoff, payment = payment }

            -- Sonido estilo dispatch al entrar un aviso
            PlaySoundFrontend(-1, "Event_Message_Purple", "GTAO_FM_Events_Soundset", false)

            SendNUIMessage({
                action       = 'taxiNPCMissionPending',
                pickupLabel  = pickup.label  or 'Zona desconocida',
                dropoffLabel = dropoff.label or 'Zona desconocida',
                payment      = payment,
                timeout      = 45,
            })
            ToggleTaxiDispatch(true)
            npcSearchActive = false
            break
        end
        npcSearchActive = false
    end)
end

local function StartNPCMissionFromPending()
    if not pendingNPCMission then return end
    local pickup  = pendingNPCMission.pickup
    local dropoff = pendingNPCMission.dropoff
    local payment = pendingNPCMission.payment
    pendingNPCMission = nil
    npcSearchActive = false
    SendNUIMessage({ action = 'taxiNPCMissionCleared' })

    currentMission = {
        pickup  = pickup,
        dropoff = dropoff,
        payment = payment,
        state   = "pickup",
    }
    workStartTime = GetGameTimer()

    SendNUIMessage({
        action = 'taxiNPCMissionActive',
        active = true,
        stage = 'pickup',
        pickupLabel = pickup.label or 'Zona desconocida',
        dropoffLabel = dropoff.label or 'Zona desconocida',
        payment = payment
    })

    -- Blip de recogida
    if missionBlip then RemoveBlip(missionBlip) end
    missionBlip = AddBlipForCoord(pickup.coords.x, pickup.coords.y, pickup.coords.z)
    SetBlipSprite(missionBlip, 280)
    SetBlipColour(missionBlip, 5)
    SetBlipScale(missionBlip, 0.9)
    SetBlipRoute(missionBlip, true)
    SetBlipRouteColour(missionBlip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Recogida de pasajero")
    EndTextCommandSetBlipName(missionBlip)

    if GetResourceState('mt-notify') == 'started' then
        exports['mt-notify']:Notify({ description = 'Carrera aceptada — dirígete a ' .. tostring(pickup.label or 'la recogida'), type = 'success', duration = 5000 })
    end

    RunNPCMissionThread()
end

-- NUI: aceptar carrera NPC
RegisterNUICallback('taxiNPCAccept', function(_, cb)
    if pendingNPCMission then
        StartNPCMissionFromPending()
    end
    cb({})
end)

-- NUI: rechazar / timeout carrera NPC
RegisterNUICallback('taxiNPCReject', function(_, cb)
    ClearPendingNPCMission(true)
    if npcAutoSearchEnabled and isOnDuty and not currentMission then
        StartNPCCallSearch()
    end
    cb({})
end)

function RequestNPCMission()
    npcAutoSearchEnabled = true

    if currentMission then
        if GetResourceState('mt-notify') == 'started' then
            exports['mt-notify']:Notify({ description = 'Ya tienes una carrera en curso. Al terminar se buscará otra automáticamente.', type = 'inform', duration = 3500 })
        end
        return
    end

    if pendingNPCMission or npcSearchActive then
        if GetResourceState('mt-notify') == 'started' then
            exports['mt-notify']:Notify({ description = 'Ya estás buscando o tienes una carrera pendiente', type = 'error', duration = 3000 })
        end
        return
    end

    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        if GetResourceState('mt-notify') == 'started' then
            exports['mt-notify']:Notify({ description = 'Debes estar en un vehículo para buscar carreras', type = 'error', duration = 3000 })
        end
        return
    end

    StartNPCCallSearch()
    if GetResourceState('mt-notify') == 'started' then
        exports['mt-notify']:Notify({ description = 'Buscando carrera NPC...', type = 'inform', duration = 2500 })
    end
end

RunNPCMissionThread = function()
    CreateThread(function()
        while currentMission do
            Wait(500)

            if currentMission.state == "pickup" then
                local myPos = GetEntityCoords(PlayerPedId())
                local dist = #(myPos - currentMission.pickup.coords)

                if dist < TaxiConfig.NPCMissions.PickupRadius and not missionNpc then
                    SpawnMissionNPC(currentMission.pickup.coords)
                end

                -- Timeout global de recogida: si el NPC lleva > 45s spawneado sin subirse, reiniciar
                if missionNpc and missionNpcSpawnTime and (GetGameTimer() - missionNpcSpawnTime) > 45000 then
                    if GetResourceState('mt-notify') == 'started' then
                        exports['mt-notify']:Notify({ description = 'El pasajero no pudo subirse. Buscando nueva carrera...', type = 'inform', duration = 4000 })
                    end
                    CleanMission()
                    if npcAutoSearchEnabled and isOnDuty then
                        Wait(2000)
                        StartNPCCallSearch()
                    end
                    break
                end

                if missionNpc and dist < TaxiConfig.NPCMissions.PickupRadius then
                    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                    if veh ~= 0 and not IsPedInVehicle(missionNpc, veh, true) then
                        local npcPos = GetEntityCoords(missionNpc)
                        local vehPos = GetEntityCoords(veh)
                        local npcVehicleDist = #(npcPos - vehPos)

                        if npcVehicleDist > 14.0 then
                            goto continue_pickup
                        end

                        local seats = GetVehicleMaxNumberOfPassengers(veh)
                        local targetSeat = -1
                        for seat = 0, seats - 1 do
                            if IsVehicleSeatFree(veh, seat) then
                                targetSeat = seat
                                break
                            end
                        end

                        if targetSeat >= 0 then
                            ClearPedTasksImmediately(missionNpc)
                            TaskGoToEntity(missionNpc, veh, 3000, 3.0, 2.0, 1073741824, 0)
                            Wait(1200)
                            TaskEnterVehicle(missionNpc, veh, 12000, targetSeat, 1.0, 1, 0)

                            -- Esperar hasta 15 s a que entre (incluye animación de entrada)
                            local entered = false
                            local tries = 0
                            while tries < 120 do
                                if IsPedInVehicle(missionNpc, veh, true) then
                                    entered = true
                                    break
                                end
                                Wait(125)
                                tries = tries + 1
                            end

                            -- Fallback: si la API no lo detecta, teleportarlo al asiento
                            if not entered then
                                ClearPedTasksImmediately(missionNpc)
                                SetPedIntoVehicle(missionNpc, veh, targetSeat)
                                Wait(400)
                                entered = IsPedInVehicle(missionNpc, veh, true)
                            end

                            if entered then
                                -- Confirmar que está completamente sentado antes de avanzar
                                local seated = false
                                for _ = 1, 20 do
                                    if IsPedInVehicle(missionNpc, veh, false) then
                                        seated = true
                                        break
                                    end
                                    Wait(150)
                                end
                                if not seated then seated = true end  -- aceptar si al menos entró

                                currentMission.state = "dropoff"

                                if missionBlip then RemoveBlip(missionBlip) end
                                missionBlip = AddBlipForCoord(currentMission.dropoff.coords.x, currentMission.dropoff.coords.y, currentMission.dropoff.coords.z)
                                SetBlipSprite(missionBlip, 280)
                                SetBlipColour(missionBlip, 2)
                                SetBlipScale(missionBlip, 0.9)
                                SetBlipRoute(missionBlip, true)
                                SetBlipRouteColour(missionBlip, 2)
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentSubstringPlayerName("Destino del pasajero")
                                EndTextCommandSetBlipName(missionBlip)

                                SendNUIMessage({
                                    action = 'taxiNPCMissionActive',
                                    active = true,
                                    stage = 'dropoff',
                                    pickupLabel = currentMission.pickup.label or 'Zona desconocida',
                                    dropoffLabel = currentMission.dropoff.label or 'Zona desconocida',
                                    payment = currentMission.payment
                                })

                                if GetResourceState('mt-notify') == 'started' then
                                    exports['mt-notify']:Notify({ description = 'Pasajero recogido. Llévalo a: ' .. tostring(currentMission.dropoff.label or 'el destino'), type = 'success', duration = 5000 })
                                end
                            end
                        end
                    end
                end
                ::continue_pickup::

            elseif currentMission.state == "dropoff" then
                local myPos = GetEntityCoords(PlayerPedId())
                local dist = #(myPos - currentMission.dropoff.coords)
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                local dropoffRadius = math.max(tonumber(TaxiConfig.NPCMissions.DropoffRadius) or 5.0, 20.0)
                local npcOnBoard = missionNpc and DoesEntityExist(missionNpc) and veh ~= 0 and IsPedInVehicle(missionNpc, veh, false)

                if dist < dropoffRadius then
                    local payment = tonumber(currentMission.payment) or 0
                    currentMission.state = "done"

                    if missionNpc and DoesEntityExist(missionNpc) then
                        local npcVehicle = GetVehiclePedIsIn(missionNpc, false)
                        if npcOnBoard and npcVehicle ~= 0 then
                            TaskLeaveVehicle(missionNpc, npcVehicle, 0)
                            Wait(3000)
                        else
                            ClearPedTasksImmediately(missionNpc)
                        end
                    end

                    local workTime = 0
                    if workStartTime then
                        workTime = math.floor((GetGameTimer() - workStartTime) / 60000)
                    end
                    TriggerServerEvent("mt-taxi:server:completeMission", payment, workTime)

                    CleanMission()

                    if npcAutoSearchEnabled and isOnDuty then
                        StartNPCCallSearch()
                    end
                end
            end
        end
    end)
end

function SpawnMissionNPC(coords)
    if missionNpc and DoesEntityExist(missionNpc) then return end

    -- Buscar el Z real del suelo para no spawnear dentro de edificios/mapas custom
    local spawnX, spawnY, spawnZ = coords.x, coords.y, coords.z
    local groundFound = false
    for _, zOffset in ipairs({ 2.0, 10.0, 25.0, 50.0 }) do
        local found, gz = GetGroundZFor_3dCoord(spawnX, spawnY, spawnZ + zOffset, false)
        if found and gz > 0.0 then
            spawnZ = gz
            groundFound = true
            break
        end
    end

    -- Si no se encontró suelo válido, abortar y reiniciar búsqueda
    if not groundFound then
        CleanMission()
        if npcAutoSearchEnabled and isOnDuty then
            if GetResourceState('mt-notify') == 'started' then
                exports['mt-notify']:Notify({ description = 'Zona no accesible, buscando nueva carrera...', type = 'inform', duration = 3500 })
            end
            Wait(2000)
            StartNPCCallSearch()
        end
        return
    end

    local models = {
        "a_m_y_downtown_01", "a_f_y_tourist_01", "a_m_y_business_03",
        "a_f_y_business_04", "a_m_m_socenlat_01", "a_f_m_fatwhite_01",
        "a_m_y_hipster_01", "a_f_y_hipster_02"
    }
    local model = GetHashKey(models[math.random(1, #models)])
    RequestModel(model)
    local timeout = 0
    while not HasModelLoaded(model) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end
    if not HasModelLoaded(model) then return end

    missionNpc = CreatePed(4, model, spawnX, spawnY, spawnZ, math.random(0, 360), true, true)
    SetEntityAsMissionEntity(missionNpc, true, true)
    SetBlockingOfNonTemporaryEvents(missionNpc, true)
    SetPedFleeAttributes(missionNpc, 0, false)
    SetPedCombatAttributes(missionNpc, 17, true)
    FreezeEntityPosition(missionNpc, false)
    SetModelAsNoLongerNeeded(model)

    -- Registrar tiempo de spawn para el timeout global de recogida
    missionNpcSpawnTime = GetGameTimer()

    -- Animación de espera
    TaskStartScenarioInPlace(missionNpc, "WORLD_HUMAN_STAND_MOBILE", 0, true)
end

function CleanMission()
    if missionNpc and DoesEntityExist(missionNpc) then
        DeleteEntity(missionNpc)
    end
    missionNpc = nil
    missionNpcSpawnTime = nil

    if missionBlip then
        RemoveBlip(missionBlip)
        missionBlip = nil
    end

    currentMission = nil
    SendNUIMessage({ action = 'taxiNPCMissionActive', active = false })
end

-- ===========================
-- MARKERS: Dibuja markers en servicio
-- ===========================
CreateThread(function()
    while ESX == nil do Wait(100) end
    while true do
        local w = 500
        local PlayerData = ESX.GetPlayerData()
        
        if IsTaxiPlayer() then
            local ped = PlayerPedId()
            local myCoords = GetEntityCoords(ped)
            local markers = {
                { key = "Duty", label = isOnDuty and "[E] Salir de Servicio" or "[E] Entrar en Servicio", event = "duty" },
                { key = "Wardrobe", label = "[E] Vestuario", event = "wardrobe" },
                { key = "Stash", label = "[E] Taquilla", event = "stash" },
                { key = "VehicleSpawn", label = "[E] Sacar Vehículo", event = "vehicle_spawn", onlyOnDuty = true },
                { key = "VehicleSave", label = "[E] Guardar Vehículo", event = "vehicle_save", onlyOnDuty = true },
            }

            for _, marker in ipairs(markers) do
                if marker.onlyOnDuty and not isOnDuty then goto continue end

                local pos = GetMarkerPosition(marker.key)
                if not pos then goto continue end

                local dist = #(myCoords - vector3(pos.x, pos.y, pos.z))

                if dist < TaxiConfig.DrawDistance then
                    w = 0
                    DrawMarker(
                        TaxiConfig.MarkerType,
                        pos.x, pos.y, pos.z + 0.05,
                        0.0, 0.0, 0.0,
                        0.0, 0.0, 0.0,
                        TaxiConfig.MarkerSize.x, TaxiConfig.MarkerSize.y, TaxiConfig.MarkerSize.z,
                        TaxiConfig.MarkerColor.r, TaxiConfig.MarkerColor.g, TaxiConfig.MarkerColor.b, TaxiConfig.MarkerColor.a,
                        false, false, 0, true, nil, nil, false
                    )

                    if dist < TaxiConfig.InteractDistance then
                        -- Mostrar texto de interacción
                        MTDrawText3D('taxi_' .. marker.key, marker.label, vector3(pos.x, pos.y, pos.z), 'E')

                        if IsControlJustPressed(0, 38) then -- E
                            MTHideText3D('taxi_' .. marker.key)
                            if marker.event == "duty" or marker.event == "wardrobe" or marker.event == "stash" then
                                OpenTaxiMenu('duty')
                            elseif marker.event == "vehicle_spawn" then
                                OpenTaxiMenu('garage')
                            elseif marker.event == "vehicle_save" then
                                SaveCurrentVehicle()
                            end
                        end
                    else
                        MTHideText3D('taxi_' .. marker.key)
                    end
                else
                    MTHideText3D('taxi_' .. marker.key)
                end

                ::continue::
            end
        end

        Wait(w)
    end
end)

-- taxijob: F7 ahora pertenece al menú de negocios (negocios_f7 en mt-businesses)
-- El comando sigue existiendo por compatibilidad pero no hace nada relevante
RegisterCommand("taxijob", function()
end, false)

-- ===========================
-- DISPATCH: Overlay visual + keymappings nativos
-- Solo se oculta con F6. Arrastrable cuando F7 está abierto.
-- ===========================

function ToggleTaxiDispatch(value)
    if value == nil then
        value = not isDispatchVisible
    end
    if isDispatchVisible ~= value then
        isDispatchVisible = value
        if value then
            SendNUIMessage({ action = "showDispatchFocus" })
        else
            SendNUIMessage({ action = "hideDispatchFocus" })
        end
    end
end

RegisterCommand("taxidispatch", function()
    local PlayerData = ESX.GetPlayerData()
    if not IsTaxiPlayer() then return end
    if not isOnDuty then return end
    ToggleTaxiDispatch()
end, false)
RegisterKeyMapping("taxidispatch", "Mostrar/Ocultar Dispatch de Taxi", "keyboard", "F6")

local function DispatchPrevAlert()
    if not isOnDuty or not isDispatchVisible then return end
    if currentAlert > 1 then
        currentAlert = currentAlert - 1
        SyncDispatchAlert()
    end
end

local function DispatchNextAlert()
    if not isOnDuty or not isDispatchVisible then return end
    if currentAlert < #taxiAlerts then
        currentAlert = currentAlert + 1
        SyncDispatchAlert()
    end
end

local function DispatchAccept()
    if not isOnDuty or not isDispatchVisible then return end

    if pendingNPCMission then
        StartNPCMissionFromPending()
        return
    end

    local alert = taxiAlerts[currentAlert]
    if alert and alert.coords then
        if IsWaypointActive() then
            -- Modo cancelar: solo avisar al servidor si YO acepté este viaje
            DeleteWaypoint()
            if alert.playerID and alert.acceptedByMe then
                TriggerServerEvent("mt-taxi:server:cancelAlert", alert.playerID)
            end
        else
            -- Modo aceptar
            local coords = alert.coords
            if type(coords) == "table" then
                SetNewWaypoint(tonumber(coords.x), tonumber(coords.y))
            else
                SetNewWaypoint(coords.x, coords.y)
            end
            if GetResourceState('mt-notify') == 'started' then
                exports['mt-notify']:Notify({ description = 'GPS marcado hacia el pasajero', type = 'success', duration = 3000 })
            end
            if alert.playerID then
                alert.acceptedByMe = true
                TriggerServerEvent("mt-taxi:server:acceptAlert", alert.playerID)
            end
        end
    end
end

local function DispatchDeny()
    if not isOnDuty or not isDispatchVisible then return end

    if pendingNPCMission then
        ClearPendingNPCMission(true)
        if npcAutoSearchEnabled and isOnDuty and not currentMission then
            StartNPCCallSearch()
        end
        return
    end

    if #taxiAlerts > 0 and currentAlert > 0 then
        local alert = taxiAlerts[currentAlert]

        if alert and alert.playerID then
            if alert.acceptedByMe then
                -- Este taxista aceptó el viaje: notificar a todos para que lo eliminen definitivamente
                TriggerServerEvent("mt-taxi:server:resolveAlert", alert.playerID)
                return  -- el handler alertResolved limpiará la lista para todos
            end
            -- Otro taxista aceptó (o nadie): solo borrar de la vista local, sin broadcast
        end

        table.remove(taxiAlerts, currentAlert)
        if currentAlert > #taxiAlerts then
            currentAlert = math.max(1, #taxiAlerts)
        end
        if #taxiAlerts == 0 then
            currentAlert = 0
        end
        SyncDispatchAlert()
    end
end

-- Navegar alertas: Anterior (←)
RegisterCommand("taxidispatch_prev", function()
    DispatchPrevAlert()
end, false)
RegisterKeyMapping("taxidispatch_prev", "Dispatch Taxi: Alerta Anterior", "keyboard", "LEFT")

-- Navegar alertas: Siguiente (→)
RegisterCommand("taxidispatch_next", function()
    DispatchNextAlert()
end, false)
RegisterKeyMapping("taxidispatch_next", "Dispatch Taxi: Alerta Siguiente", "keyboard", "RIGHT")

-- Aceptar alerta: FLECHA ARRIBA (↑)
RegisterCommand("taxidispatch_accept", function()
    DispatchAccept()
end, false)
RegisterKeyMapping("taxidispatch_accept", "Dispatch Taxi: Aceptar Alerta", "keyboard", "UP")

-- Denegar alerta: FLECHA ABAJO (↓)
RegisterCommand("taxidispatch_delete", function()
    DispatchDeny()
end, false)
RegisterKeyMapping("taxidispatch_delete", "Dispatch Taxi: Denegar Alerta", "keyboard", "DOWN")

-- Fallback robusto: lectura directa de flechas (evita problemas de keymapping cacheado)
CreateThread(function()
    local lastPress = 0
    while true do
        if isOnDuty and isDispatchVisible and not IsPauseMenuActive() then
            local now = GetGameTimer()
            if now - lastPress >= 120 then
                if IsControlJustPressed(0, 174) then -- LEFT
                    DispatchPrevAlert()
                    lastPress = now
                elseif IsControlJustPressed(0, 175) then -- RIGHT
                    DispatchNextAlert()
                    lastPress = now
                elseif IsControlJustPressed(0, 172) then -- UP
                    DispatchAccept()
                    lastPress = now
                elseif IsControlJustPressed(0, 173) then -- DOWN
                    DispatchDeny()
                    lastPress = now
                end
            end
            Wait(0)
        else
            Wait(250)
        end
    end
end)

-- Sync: enviar estado actual al NUI
function SyncDispatchAlert()
    if #taxiAlerts == 0 then
        SendNUIMessage({
            action = "taxiAlertsSync",
            alerts = {},
        })
        return
    end

    -- Preparar alertas para NUI
    local nuiAlerts = {}
    for _, alert in ipairs(taxiAlerts) do
        local a = {}
        for k, v in pairs(alert) do
            a[k] = v
        end
        if type(alert.coords) == "vector3" then
            a.coords = { x = alert.coords.x, y = alert.coords.y, z = alert.coords.z }
        end
        table.insert(nuiAlerts, a)
    end

    if autoAcceptAlerts and not currentMission and not pendingNPCMission then
        if alert.isNPC then
            DispatchAcceptNPC()
        else
            DispatchAccept()
        end
    end

    SendNUIMessage({
        action = "taxiAlertsSync",
        alerts = nuiAlerts,
        currentIndex = currentAlert - 1, -- JS es 0-indexed
    })
end

-- Callback: closeDispatch (no hace nada, el dispatch solo se cierra con F6)
RegisterNUICallback("closeDispatch", function(_, cb)
    cb("ok")
end)

-- ===========================
-- CLEANUP
-- ===========================
AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        CleanMission()
        if spawnedVehicle and DoesEntityExist(spawnedVehicle) then
            DeleteVehicle(spawnedVehicle)
        end
        if isMenuOpen then
            CloseTaxiMenu()
        end
    end
end)

-- ===========================
-- EXPORTS: usados por el menú F7 de mt-businesses
-- ===========================
exports('isTaxiOnDuty', function()
    return isOnDuty == true
end)

exports('isTaxiDispatchOpen', function()
    return isDispatchVisible == true
end)

exports('toggleTaxiDispatch', function(value)
    if not isOnDuty then return end
    ToggleTaxiDispatch(value)
end)

exports('isNPCMissionActive', function()
    return npcAutoSearchEnabled == true or currentMission ~= nil or pendingNPCMission ~= nil or npcSearchActive == true
end)

exports('requestNPCMission', function()
    if not isOnDuty then return end
    RequestNPCMission()
end)

exports('cancelNPCMission', function()
    npcAutoSearchEnabled = false
    npcSearchActive = false
    npcSearchToken = npcSearchToken + 1
    ClearPendingNPCMission(false)
    CleanMission()
end)

-- Register the module
RegisterJobModule("taxi", TaxiJob)

-- ===========================
-- MENU TOGGLE (F6)
-- ===========================
local function ToggleTaxiMenu()
    if isMenuOpen then
        CloseTaxiMenu()
    else
        OpenTaxiMenu()
    end
end

RegisterCommand('taxi_menu', function()
    if IsTaxiPlayer() then
        OpenTaxiMenu('f6')
    end
end, false)

RegisterKeyMapping('taxi_menu', 'Menu de Taxi', 'keyboard', 'F6')

