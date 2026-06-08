local activeSlot = 1
local cachedCharacters = {}
local previewPed = nil
local previewVeh = nil
local showTag = false
local isSelectionFinal = false
local globalArrivalNetId = nil
LastSelectedPack = 'starter'

local function SendWebMessage(type, data)
    SendNUIMessage({
        type = type,
        data = data
    })
end

RegisterNUICallback('UIReady', function(_, cb)
    local session = lib.callback.await('esx_multicharacter:SetupSession')
    cachedCharacters = session.characters
    
    -- Sync memory with DB data from session
    if session.packs then Config.WelcomePacks = session.packs end
    if session.global then
        for k, v in pairs(session.global) do
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
    end

    SendWebMessage('SET_DEBUG', Config.Debug)
    SendWebMessage('SET_SLOTS', session.slots)
    SendWebMessage('ADD_CHARACTERS', session.characters)
    SendWebMessage('SET_PACKS', Config.WelcomePacks)
    SendWebMessage('SET_INITIAL_STATE', session.hasCharacters)
    SendWebMessage('SET_DISCORD_URL', Config.Discord)
    cb('ok')
end)

RegisterNetEvent('esx_multicharacter:SyncConfig', function(data)
    if data.packs then
        Config.WelcomePacks = data.packs
        SendWebMessage('SET_PACKS', Config.WelcomePacks)
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
        SendWebMessage('SET_GLOBAL_CONFIG', data.global)
    end
end)

RegisterNUICallback('swapEntity', function(data, cb)
    local charId = tonumber(data.key)
    if not charId then cb('ok') return end

    local char = cachedCharacters[charId]
    
    if not char then 
        if previewPed then DeleteEntity(previewPed) previewPed = nil end
        cb('ok')
        return 
    end

    local model = char.sex and `mp_m_freemode_01` or `mp_f_freemode_01`
    if previewPed then DeleteEntity(previewPed) end
    
    RequestModel(model)
    local timer = GetGameTimer()
    while not HasModelLoaded(model) and GetGameTimer() - timer < 3000 do Wait(0) end
    
    if HasModelLoaded(model) then
        local rawPos = char.coords or Config.NewCharacterSpawn.startcoords
        local menuHeading = Config.NewCharacterSpawn.startcoords.w
        local pedHeading = menuHeading

        if previewPed then DeleteEntity(previewPed) end
        previewPed = CreatePed(4, model, rawPos.x, rawPos.y, rawPos.z - 1.0, pedHeading, false, false)
        SetEntityInvincible(previewPed, true)
        FreezeEntityPosition(previewPed, true)
        SetBlockingOfNonTemporaryEvents(previewPed, true)
        SetEntityVisible(previewPed, false, false)
        
        if char.skin and next(char.skin) then
            Wait(200) 
            if Config.IlleniumAppearance then
                exports['illenium-appearance']:setPedAppearance(previewPed, char.skin)
            else
                TriggerEvent('skinchanger:loadPedSkin', previewPed, char.skin)
            end
            Wait(100)
            SetEntityVisible(previewPed, true, false)
        else
            SetEntityVisible(previewPed, true, false)
        end

        if selectionCam then
            local cOff, rOff = Config.CameraOffsets.coords, Config.CameraOffsets.rot
            local headingRad = math.rad(menuHeading)
            local cosH, sinH = math.cos(headingRad), math.sin(headingRad)

            local camPosX = rawPos.x + (cOff.x * cosH - (cOff.y or 5.0) * sinH)
            local camPosY = rawPos.y + (cOff.x * sinH + (cOff.y or 5.0) * cosH)
            local camPosZ = rawPos.z + (cOff.z or 0.0)
            local targetPosX = rawPos.x + (rOff.x * cosH - rOff.y * sinH)
            local targetPosY = rawPos.y + (rOff.x * sinH + rOff.y * cosH)
            local targetPosZ = rawPos.z + (rOff.z or 0.5)

            SetCamCoord(selectionCam, camPosX, camPosY, camPosZ)
            PointCamAtCoord(selectionCam, targetPosX, targetPosY, targetPosZ)

            NewLoadSceneStop()
            SetFocusPosAndVel(rawPos.x, rawPos.y, rawPos.z, 0.0, 0.0, 0.0)
            NewLoadSceneStart(rawPos.x, rawPos.y, rawPos.z, rawPos.x, rawPos.y, rawPos.z, 50.0, 0)
        end
    end
    cb('ok')
end)

RegisterNUICallback('selectedCharacter', function(data, cb)
    local charId = tonumber(data.id)
    if not charId then cb('ok') return end

    if selectionCam then
        RenderScriptCams(false, false, 0, true, true)
        DestroyCam(selectionCam, true)
        selectionCam = nil
    end

    if previewPed then DeleteEntity(previewPed) previewPed = nil end

    if previewVeh then
        DeleteEntity(previewVeh)
        previewVeh = nil
        showTag, isSelectionFinal = false, false
        SendNUIMessage({ type = 'VEHICLE_TAG', state = false })
    end

    SetNuiFocus(false, false)
    TriggerServerEvent('esx_multicharacter:CharacterChosen', { id = charId })
    cb('ok')
end)

local function UpdatePreviewPed(sex)
    local model = sex == 'm' and `mp_m_freemode_01` or `mp_f_freemode_01`
    
    if previewPed then
        if GetEntityModel(previewPed) == model then return end
        DeleteEntity(previewPed)
        previewPed = nil
    end

    RequestModel(model)
    local timer = GetGameTimer()
    while not HasModelLoaded(model) and GetGameTimer() - timer < 3000 do Wait(0) end

    if HasModelLoaded(model) then
        local cfg = Config.NewCharacterSpawn.startcoords
        local baseHeading = cfg.w or 0.0
        local pedHeading = baseHeading + 180.0

        previewPed = CreatePed(4, model, cfg.x, cfg.y, cfg.z - 1.0, pedHeading, false, false)
        SetEntityInvincible(previewPed, true)
        FreezeEntityPosition(previewPed, true)
        SetBlockingOfNonTemporaryEvents(previewPed, true)
        SetEntityVisible(previewPed, true, false)

        if selectionCam then
            local cOff, rOff = Config.CameraOffsets.coords, Config.CameraOffsets.rot
            local headingRad = math.rad(-baseHeading)
            local cosH, sinH = math.cos(headingRad), math.sin(headingRad)

            local camPosX = cfg.x + (cOff.x * cosH - (cOff.y or 5.0) * sinH)
            local camPosY = cfg.y + (cOff.x * sinH + (cOff.y or 5.0) * cosH)
            local camPosZ = cfg.z + (cOff.z or 0.0)
            local targetPosX = cfg.x + (rOff.x * cosH - rOff.y * sinH)
            local targetPosY = cfg.y + (rOff.x * sinH + rOff.y * cosH)
            local targetPosZ = cfg.z + (rOff.z or 0.5)

            SetCamCoord(selectionCam, camPosX, camPosY, camPosZ)
            PointCamAtCoord(selectionCam, targetPosX, targetPosY, targetPosZ)
        end
    end
end

RegisterNUICallback('updateCharacterGender', function(data, cb)
    local sex = data.gender == 'male' and 'm' or 'f'
    UpdatePreviewPed(sex)
    cb('ok')
end)

RegisterNUICallback('createNewCharacter', function(data, cb)
    if previewPed then DeleteEntity(previewPed) previewPed = nil end
    activeSlot = tonumber(data.id) or 1
    cb('ok')
end)

RegisterNUICallback('removeCharacter', function(data, cb)
    SendNUIMessage({ type = 'SET_SLIDER_EFFECT' })
    Wait(1200)

    local success = lib.callback.await('esx_multicharacter:DeleteCharacters', false, { id = data.id })
    
    if success then
        SendNUIMessage({ type = 'INIT', state = false })
        SendNUIMessage({ type = 'WELCOME_SCREEN', state = false }) 
        
        cachedCharacters = {}
        if previewPed then DeleteEntity(previewPed) previewPed = nil end
        
        ToggleGameHUD(true)
        Wait(200)
        
        isSelecting = false
        RestartMulticharacter(true)
        cb(true)
    else
        cb(false)
    end
end)

RegisterNUICallback('closeUI', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('disconnectGame', function(_, cb)
    TriggerServerEvent('Exit:Game')
    cb('ok')
end)

RegisterNUICallback('activateFocus', function(_, cb)
    SetNuiFocus(true, true)
    cb('ok')
end)

RegisterNUICallback('music_ready', function(_, cb) cb('ok') end)
RegisterNUICallback('createdUIFrame', function(_, cb) cb('ok') end)
RegisterNUICallback('gatherStorage', function(_, cb) cb('ok') end)
RegisterNUICallback('screenShown', function(_, cb) cb('ok') end)
RegisterNUICallback('goBackFromIdentity', function(_, cb) cb(true) end)
RegisterNUICallback('checkNameAvailability', function(data, cb) cb(true) end)
RegisterNUICallback('userIdentityCreated', function(data, cb) cb('ok') end)

RegisterNetEvent('esx_multicharacter:cleanupPreviewEntities', function()
    if previewPed then
        if DoesEntityExist(previewPed) then DeleteEntity(previewPed) end
        previewPed = nil
    end
    if previewVeh then
        if DoesEntityExist(previewVeh) then DeleteEntity(previewVeh) end
        previewVeh = nil
        showTag = false
        SendNUIMessage({ type = 'VEHICLE_TAG', state = false })
    end
    if selectionCam then
        RenderScriptCams(false, false, 0, true, true)
        DestroyCam(selectionCam, true)
        selectionCam = nil
    end
end)

RegisterNUICallback('previewVehicle', function(data, cb)
    if isSelectionFinal and not data.isFinal then return cb('ok') end
    
    local model = data.model
    local isFinal = data.isFinal 

    if not model then
        if previewVeh and DoesEntityExist(previewVeh) then 
            DeleteEntity(previewVeh)
            previewVeh = nil
            showTag = false
            SendNUIMessage({ type = 'VEHICLE_TAG', state = false })
        end
        cb('ok')
        return
    end

    if isFinal then
        if previewVeh and DoesEntityExist(previewVeh) then
            DeleteEntity(previewVeh)
            previewVeh = nil
            showTag = false
            SendNUIMessage({ type = 'VEHICLE_TAG', state = false })
        end
        cb('ok')
        return
    end

    if previewVeh and DoesEntityExist(previewVeh) then
        DeleteEntity(previewVeh)
    end

    RequestModel(model)
    local timer = GetGameTimer()
    while not HasModelLoaded(model) and GetGameTimer() - timer < 3000 do Wait(0) end

    if HasModelLoaded(model) then
        local cfg = Config.VehiclePreview.coords
        previewVeh = CreateVehicle(model, cfg.x, cfg.y, cfg.z, cfg.w, false, false)
        SetEntityInvincible(previewVeh, true)
        SetVehicleOnGroundProperly(previewVeh)
        FreezeEntityPosition(previewVeh, true)
        SetEntityDrawOutline(previewVeh, true)
        SetEntityDrawOutlineColor(255, 0, 127, 200)
        SendNUIMessage({ type = 'VEHICLE_TAG', state = false })
    end
    cb('ok')
end)

CreateThread(function()
    while true do
        local sleep = 500
        
        if isSelectionFinal and globalArrivalNetId then
            if not previewVeh or not DoesEntityExist(previewVeh) then
                if NetworkDoesEntityExistWithNetworkId(globalArrivalNetId) then
                    previewVeh = NetworkGetEntityFromNetworkId(globalArrivalNetId)
                    if DoesEntityExist(previewVeh) then
                        showTag = true
                        SendNUIMessage({ type = 'VEHICLE_TAG', state = true })
                    end
                end
            end
        end

        if showTag and previewVeh and DoesEntityExist(previewVeh) then
            local pPed = PlayerPedId()
            local pCoords = GetEntityCoords(pPed)
            local vCoords = GetEntityCoords(previewVeh)
            local dist = #(pCoords - vCoords)

            if dist < 30.0 then
                sleep = 0
                if isSelectionFinal then
                    SetEntityDrawOutline(previewVeh, true)
                    SetEntityDrawOutlineColor(255, 10, 150, 180)
                end

                local min, max = GetModelDimensions(GetEntityModel(previewVeh))
                local worldPos = GetOffsetFromEntityInWorldCoords(previewVeh, 0.0, 0.0, max.z + 1.5)
                
                local onScreen, x, y = GetScreenCoordFromWorldCoord(worldPos.x, worldPos.y, worldPos.z)
                if onScreen then
                    SendNUIMessage({
                        type = 'UPDATE_VEHICLE_TAG',
                        state = true,
                        x = x * 100,
                        y = y * 100
                    })
                else
                    SendNUIMessage({ type = 'UPDATE_VEHICLE_TAG', state = false })
                end
            else
                SendNUIMessage({ type = 'UPDATE_VEHICLE_TAG', state = false })
                sleep = 200
            end
        else
            SendNUIMessage({ type = 'UPDATE_VEHICLE_TAG', state = false })
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000
        if isSelectionFinal and previewVeh and DoesEntityExist(previewVeh) then
            local ped = PlayerPedId()
            if IsPedSittingInVehicle(ped) and GetVehiclePedIsIn(ped, false) == previewVeh then
                SetEntityDrawOutline(previewVeh, false)
                showTag, isSelectionFinal = false, false
                SendNUIMessage({ type = 'VEHICLE_TAG', state = false })
            else
                sleep = 200
            end
        end
        Wait(sleep)
    end
end)

RegisterNUICallback('selectedPack', function(data, cb)
    local identity = data.identity
    local packId = data.packId or 'starter'
    
    isSelectionFinal = true
    LastSelectedPack = packId

    TriggerEvent('esx_multicharacter:cleanupPreviewEntities')

    SetNuiFocus(false, false)
    TriggerServerEvent('esx_multicharacter:CreateCharacters', {
        slot = activeSlot,
        firstName = identity.firstname,
        lastName = identity.lastname,
        dob = identity.date,
        gender = identity.gender,
        height = identity.height,
        nationality = identity.nationality,
        pack = packId
    })
    cb('ok')
end)

RegisterNetEvent('esx_multicharacter:hideArrivalTag', function()
    showTag, isSelectionFinal = false, false
    SendNUIMessage({ type = 'VEHICLE_TAG', state = false })
    
    if previewVeh and DoesEntityExist(previewVeh) then
        SetEntityDrawOutline(previewVeh, false)
    end
end)

AddEventHandler('esx_skin:save', function()
    TriggerEvent('esx_multicharacter:finishCharacterCreation')
end)

RegisterNetEvent('esx_multicharacter:updateFinalVehicle', function(entity, netId)
    if previewVeh and DoesEntityExist(previewVeh) and previewVeh ~= entity then 
        DeleteEntity(previewVeh) 
    end
    
    previewVeh = entity
    globalArrivalNetId = netId
    
    local active = (netId ~= nil or (entity and entity ~= 0))
    isSelectionFinal, showTag = active, active

    if previewVeh and DoesEntityExist(previewVeh) then
        SetEntityAsMissionEntity(previewVeh, true, true)
        SetEntityDrawOutline(previewVeh, true)
        SetEntityDrawOutlineColor(255, 10, 150, 180)
        SendNUIMessage({ type = 'VEHICLE_TAG', state = true })
    else
        SendNUIMessage({ type = 'VEHICLE_TAG', state = true })
    end
end)

RegisterNetEvent('esx_multicharacter:clearPreviewVehicle', function()
    if previewVeh and DoesEntityExist(previewVeh) then
        DeleteEntity(previewVeh)
        previewVeh = nil
        showTag, isSelectionFinal = false, false
        SendNUIMessage({ type = 'VEHICLE_TAG', state = false })
    end
end)

CreateThread(function()
    while true do
        Wait(0)
        if isSelecting and previewPed and DoesEntityExist(previewPed) then
            local heading = GetEntityHeading(previewPed)
            if IsDisabledControlPressed(0, 34) or IsControlPressed(0, 174) then 
                SetEntityHeading(previewPed, heading + 2.0)
            elseif IsDisabledControlPressed(0, 35) or IsControlPressed(0, 175) then 
                SetEntityHeading(previewPed, heading - 2.0)
            end
        else
            Wait(500)
        end
    end
end)

RegisterNUICallback('closeAdmin', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('searchUsers', function(data, cb)
    local query = data.query
    local results = lib.callback.await('esx_multicharacter:GetAdminUsers', false, query)
    cb(results)
end)

RegisterNUICallback('updateSlots', function(data, cb)
    TriggerServerEvent('esx_multicharacter:SetSlotsAdmin', data.identifier, data.slots)
    cb('ok')
end)

RegisterNUICallback('deleteCharAdmin', function(data, cb)
    local charId = data.charId
    TriggerServerEvent('esx_multicharacter:DeleteCharacterAdmin', charId)
    cb('ok')
end)

RegisterNUICallback('getUserCharacters', function(data, cb)
    local results = lib.callback.await('esx_multicharacter:GetAdminUserCharacters', false, data.identifier)
    cb(results or {})
end)

RegisterNUICallback('getCurrentCoords', function(_, cb)
    local coords = lib.callback.await('esx_multicharacter:getCurrentCoords', false)
    cb(coords or {})
end)

-- CONFIG ADMIN NUI
RegisterNUICallback('getAdminConfig', function(_, cb)
    local config = lib.callback.await('esx_multicharacter:GetAdminConfig', false)
    cb(config or {})
end)

RegisterNUICallback('saveAdminPacks', function(data, cb)
    TriggerServerEvent('esx_multicharacter:SaveAdminPacks', data)
    cb('ok')
end)

RegisterNUICallback('saveAdminGlobal', function(data, cb)
    TriggerServerEvent('esx_multicharacter:SaveAdminGlobal', data)
    cb('ok')
end)
