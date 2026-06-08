ESX = exports["es_extended"]:getSharedObject()

isSelecting = false
selectionCam = nil
local nuidone = false
local currentHeading = 0.0

local isArrivalConfirmed = false

RegisterNetEvent('esx_multicharacter:arrivalConfirmed', function()
    isArrivalConfirmed = true
end)

-- SYNC SYSTEM
RegisterNetEvent('esx_multicharacter:SyncConfig', function(data)
    if data.packs then 
        Config.WelcomePacks = data.packs 
        SendNUIMessage({ type = 'SET_PACKS', data = data.packs })
    end
    if data.global then
        for k, v in pairs(data.global) do
            if k == "claimPoint" then
                Config.WelcomeVehicle.claimPoint = vec3(v[1], v[2], v[3])
            elseif k == "spawnPoint" then
                Config.WelcomeVehicle.spawnPoint = vec4(v[1], v[2], v[3], v[4])
            elseif type(v) == "table" and Config.WelcomeVehicle[k] then
                for subK, subV in pairs(v) do
                    Config.WelcomeVehicle[k][subK] = subV
                end
            else
                Config.WelcomeVehicle[k] = v
            end
        end
        -- Actualizar instrucciones en NUI si es necesario
        if data.global.instructions then
            SendNUIMessage({ 
                type = 'SHOW_CLAIM_INSTRUCTIONS', 
                state = false -- Ocultar y volver a mostrar para refrescar si se desea, o simplemente actualizar texto
            })
        end
    end
end)

function ToggleGameHUD(state)
    if not Config.HideHUD then return end
    
    if GetResourceState('esx_hud') == 'started' then
        exports.esx_hud:SetHUDVisible(state)
    end
end

RegisterNUICallback('nuidone', function(_, cb)
    nuidone = true
    cb('ok')
end)

function RestartMulticharacter(force)
    if isSelecting and not force then return end
    isSelecting = true

    while not NetworkIsSessionStarted() do Wait(100) end
    
    local timer = GetGameTimer()
    while not nuidone and GetGameTimer() - timer < 5000 do Wait(100) end
    
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    DoScreenFadeOut(0)
    Wait(500)
    
    local cfg = Config.NewCharacterSpawn.startcoords
    local ped = PlayerPedId()
    SetEntityCoords(ped, cfg.x, cfg.y, cfg.z - 1.0, false, false, false, false)
    SetEntityVisible(ped, false)
    FreezeEntityPosition(ped, true)
    
    TriggerServerEvent('Update:RoutingBucket')
    
    local cOff, rOff = Config.CameraOffsets.coords, Config.CameraOffsets.rot
    local headingRad = math.rad(cfg.w)
    local cosH, sinH = math.cos(headingRad), math.sin(headingRad)

    local camPosX = cfg.x + (cOff.x * cosH - cOff.y * sinH)
    local camPosY = cfg.y + (cOff.x * sinH + cOff.y * cosH)
    local camPosZ = cfg.z + cOff.z
    local targetPosX = cfg.x + (rOff.x * cosH - rOff.y * sinH)
    local targetPosY = cfg.y + (rOff.x * sinH + rOff.y * cosH)
    local targetPosZ = cfg.z + rOff.z
    
    currentHeading = cfg.w

    if selectionCam then DestroyCam(selectionCam, true) end
    selectionCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(selectionCam, camPosX, camPosY, camPosZ)
    PointCamAtCoord(selectionCam, targetPosX, targetPosY, targetPosZ)
    SetCamFov(selectionCam, Config.CameraFOV)
    SetCamActive(selectionCam, true)
    RenderScriptCams(true, false, 0, true, true)

    SetFocusPosAndVel(cfg.x, cfg.y, cfg.z, 0.0, 0.0, 0.0)
    NewLoadSceneStart(cfg.x, cfg.y, cfg.z, cfg.x, cfg.y, cfg.z, 50.0, 0)
    
    SetNuiFocus(true, true)
    
    SendNUIMessage({ 
        type = 'WELCOME_SCREEN', 
        state = true
    })
    SendNUIMessage({ 
        type = 'SET_DELETE_BUTTON', 
        state = Config.DeleteCharacter
    })
    ToggleGameHUD(false)
    DoScreenFadeIn(1000)
end

RegisterNetEvent('esx_multicharacter:relog', function()
    RestartMulticharacter(true)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    Wait(500)
    TriggerServerEvent('esx_multicharacter:relog')
    RestartMulticharacter(true)
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(100) end
    
    Wait(1000)
    if not ESX.PlayerLoaded then
        RestartMulticharacter()
    end
end)

RegisterNetEvent('esx:playerLoaded', function(playerData, isNew, skin)
    local ped = PlayerPedId()
    isSelecting = false 
    
    SetNuiFocus(false, false)
    SendNUIMessage({ type = 'INIT', state = false })
    SendNUIMessage({ type = 'WELCOME_SCREEN', state = false })
    ToggleGameHUD(true)

    if selectionCam then
        RenderScriptCams(false, true, 1000, true, true)
        DestroyCam(selectionCam, true)
        selectionCam = nil
    end

    SetEntityVisible(ped, true, false)
    SetEntityAlpha(ped, 255, false)
    SetEntityInvincible(ped, false)
    FreezeEntityPosition(ped, false)
    SetPlayerInvincible(PlayerId(), false)
    RenderScriptCams(false, false, 0, true, true)

    if not isNew then 
        local spawn = playerData.coords
        if spawn then
            NewLoadSceneStart(spawn.x, spawn.y, spawn.z, spawn.x, spawn.y, spawn.z, 50.0, 0)
            SetFocusPosAndVel(spawn.x, spawn.y, spawn.z, 0.0, 0.0, 0.0)
            
            local timer = GetGameTimer()
            while not HasCollisionLoadedAroundEntity(ped) and GetGameTimer() - timer < 10000 do
                Wait(0)
            end
            
            SetEntityCoords(ped, spawn.x, spawn.y, spawn.z, false, false, false, false)
            if spawn.heading then SetEntityHeading(ped, spawn.heading) end
        end
        
        local defaultSkin = playerData.sex == 'm' and Config.DefaultSkin["m"] or Config.DefaultSkin["f"]
        TriggerEvent('skinchanger:loadSkin', skin or defaultSkin)
        
        Wait(1000) 
        ClearFocus()
        NewLoadSceneStop()
        DoScreenFadeIn(1000)
        SetGameplayCamRelativeHeading(0.0)
    end
    
    TriggerServerEvent('esx:onPlayerSpawn')
end)

RegisterNetEvent('esx_multicharacter:newCharacterCreated', function(sex)
    TriggerEvent('esx_multicharacter:cleanupPreviewEntities')
    
    local ped = PlayerPedId()
    local sex = sex or 'm'
    local model = sex == 'm' and `mp_m_freemode_01` or `mp_f_freemode_01`
    
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    
    ped = PlayerPedId() 
    SetEntityVisible(ped, true, false)
    SetEntityAlpha(ped, 255, false)
    FreezeEntityPosition(ped, false)
    
    local spawn = Config.NewCharacterSpawn.startcoords
    NewLoadSceneStart(spawn.x, spawn.y, spawn.z, spawn.x, spawn.y, spawn.z, 50.0, 0)
    SetFocusPosAndVel(spawn.x, spawn.y, spawn.z, 0.0, 0.0, 0.0)
    RequestCollisionAtCoord(spawn.x, spawn.y, spawn.z)
    
    SetEntityCoords(ped, spawn.x, spawn.y, spawn.z, false, false, false, false)
    SetEntityHeading(ped, spawn.w)
    
    local timer = GetGameTimer()
    while not HasCollisionLoadedAroundEntity(ped) and GetGameTimer() - timer < 10000 do
        Wait(0)
    end
    
    ClearFocus()
    NewLoadSceneStop()
    PlaceObjectOnGroundProperly(ped)
    
    RenderScriptCams(false, false, 0, true, true)
    if selectionCam then
        DestroyCam(selectionCam, true)
        selectionCam = nil
    end
    
    local defaultSkin = sex == 'm' and Config.DefaultSkin["m"] or Config.DefaultSkin["f"]
    defaultSkin.sex = sex == 'm' and 0 or 1
    
    TriggerEvent('skinchanger:loadSkin', defaultSkin, function()
        ToggleGameHUD(true)
        DoScreenFadeIn(500)
        Wait(500)
        
        local ped = PlayerPedId()
        FreezeEntityPosition(ped, false)
        SetEntityInvincible(ped, false)

        TriggerEvent('esx_skin:openSaveableMenu', function()
            TriggerServerEvent('esx_multicharacter:GiveItems')
            TriggerEvent('esx_multicharacter:finishCharacterCreation')

            SetGameplayCamRelativeHeading(0.0)
        end, function()
            FreezeEntityPosition(PlayerPedId(), false)
        end)
    end)
end)

RegisterNetEvent('esx_multicharacter:finishCharacterCreation', function()
    local packId = LastSelectedPack or 'starter'
    local pack = nil
    for i=1, #Config.WelcomePacks do
        if Config.WelcomePacks[i].id == packId then
            pack = Config.WelcomePacks[i]
            break
        end
    end

    if not pack then return end

    -- New Flow: Start Claim Quest instead of direct spawn
    TriggerEvent('esx_multicharacter:startClaimVehicleQuest', pack)
end)

RegisterNetEvent('esx_multicharacter:startClaimVehicleQuest', function(pack)
    SendNUIMessage({ type = 'TRIGGER_TRANSITION' })
    Wait(1200)
    
    -- Change Routing Bucket to default (0)
    TriggerServerEvent('Update:RoutingBucket', 0)
    
    -- Show Instructions UI
    SendNUIMessage({
        type = 'SHOW_CLAIM_INSTRUCTIONS',
        state = true,
        title = Config.WelcomeVehicle.instructions.title,
        desc = Config.WelcomeVehicle.instructions.desc
    })

    DoScreenFadeIn(1000)

    local claimPoint = Config.WelcomeVehicle.claimPoint
    local spawnPoint = Config.WelcomeVehicle.spawnPoint
    local claimed = false
    local vehicleOwned = nil

    CreateThread(function()
        while not claimed do
            local sleep = 1000
            local ped = PlayerPedId()
            local pCoords = GetEntityCoords(ped)
            local dist = #(pCoords - claimPoint)

            if dist < 100.0 then
                sleep = 0
                -- Show Tag: "Reclama tu vehículo aquí"
                local onScreen, x, y = GetScreenCoordFromWorldCoord(claimPoint.x, claimPoint.y, claimPoint.z + 1.0)
                if onScreen then
                    SendNUIMessage({
                        type = 'UPDATE_CLAIM_TAG',
                        state = true,
                        text = Config.WelcomeVehicle.labelClaim,
                        subtext = dist < 2.0 and Config.WelcomeVehicle.labelConfirm or nil,
                        x = x * 100,
                        y = y * 100
                    })
                else
                    SendNUIMessage({ type = 'UPDATE_CLAIM_TAG', state = false })
                end

                if dist < 2.0 then
                    if IsControlJustReleased(0, 38) then -- [E]
                        claimed = true
                        SendNUIMessage({ type = 'UPDATE_CLAIM_TAG', state = false })
                        
                        -- Spawn Vehicle
                        local model = GetHashKey(pack.vehicle)
                        RequestModel(model)
                        while not HasModelLoaded(model) do Wait(10) end
                        
                        vehicleOwned = CreateVehicle(model, spawnPoint.x, spawnPoint.y, spawnPoint.z, spawnPoint.w, true, true)
                        SetEntityAsMissionEntity(vehicleOwned, true, true)
                        SetVehicleOnGroundProperly(vehicleOwned)
                        SetModelAsNoLongerNeeded(model)
                        
                        -- Phase 2: Tag above vehicle
                        TriggerEvent('esx_multicharacter:trackOwnedVehicle', vehicleOwned)
                    end
                end
            else
                SendNUIMessage({ type = 'UPDATE_CLAIM_TAG', state = false })
            end
            Wait(sleep)
        end
    end)
end)

RegisterNetEvent('esx_multicharacter:trackOwnedVehicle', function(vehicle)
    CreateThread(function()
        local inVehicle = false
        while not inVehicle do
            Wait(0)
            if DoesEntityExist(vehicle) then
                local min, max = GetModelDimensions(GetEntityModel(vehicle))
                local worldPos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.0, max.z + 1.2)
                
                local onScreen, x, y = GetScreenCoordFromWorldCoord(worldPos.x, worldPos.y, worldPos.z)
                if onScreen then
                    SendNUIMessage({
                        type = 'UPDATE_CLAIM_TAG',
                        state = true,
                        text = Config.WelcomeVehicle.labelOwned,
                        x = x * 100,
                        y = y * 100
                    })
                else
                    SendNUIMessage({ type = 'UPDATE_CLAIM_TAG', state = false })
                end

                local ped = PlayerPedId()
                if IsPedInVehicle(ped, vehicle, false) then
                    inVehicle = true
                    SendNUIMessage({ type = 'UPDATE_CLAIM_TAG', state = false })
                    SendNUIMessage({ type = 'SHOW_CLAIM_INSTRUCTIONS', state = false })
                end
            else
                break
            end
        end
    end)
end)

RegisterNetEvent('esx_multicharacter:setArrivalVehicle', function(netId, localHandle)
    globalArrivalNetId = netId
    
    local vehicle = localHandle or NetToVeh(netId)
    if not vehicle or vehicle == 0 then
        local timer = GetGameTimer()
        while (not vehicle or vehicle == 0) and GetGameTimer() - timer < 5000 do
            Wait(100)
            vehicle = NetToVeh(netId)
        end
    end

    if DoesEntityExist(vehicle) then
        previewVeh = vehicle
        SetEntityAsMissionEntity(vehicle, true, true)
        TriggerEvent('esx_multicharacter:updateFinalVehicle', vehicle, netId)

        CreateThread(function()
            local waiting = true
            local failTimer = GetGameTimer()
            
            while waiting do
                Wait(50)
                local ped = PlayerPedId()
                local currentVeh = GetVehiclePedIsIn(ped, false)
                
                local isDriver = (currentVeh ~= 0 and GetPedInVehicleSeat(currentVeh, -1) == ped)
                local isTimeout = (GetGameTimer() - failTimer > 8000)

                if isDriver or isTimeout then
                    waiting = false
                    
                    TriggerEvent('esx_multicharacter:hideArrivalTag')
                    SendNUIMessage({ type = 'TRIGGER_TRANSITION' })
                    
                    TriggerServerEvent('esx_multicharacter:finishArrival', netId)
                    
                    Wait(200)
                    DoScreenFadeIn(300)
                end
            end
        end)
    end
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    RestartMulticharacter()
end)

RegisterNetEvent('esx_multicharacter:openAdminMenu', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'OPEN_ADMIN' })
end)
