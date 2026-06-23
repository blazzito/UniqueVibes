-----------------------------------------------------
---- For more scripts and updates, visit ------------
--------- https://discord.gg/trase ------------------
-----------------------------------------------------

local vehicles, preview = {}, nil
local activeGarage = nil
local activeLocation = nil
local enterRadius, storeEnterRadius = 1.6, 3.0
local markerScale, storeMarkerScale = vec3(0.9,0.9,0.9), vec3(4.0,4.0,0.4)

local previewCam = nil
local camHeading = 0.0
local camRadius = 5.0
local camHeight = 1.5

local function showHelpMessage(msg)
    if not msg or msg == '' then return end
    AddTextEntry("trase:garage:message", msg)
    BeginTextCommandDisplayHelp("trase:garage:message")
    EndTextCommandDisplayHelp(0, false, nil, -1)
end

local function drawMarkerAt(pos, scale)
    DrawMarker(1, pos.x, pos.y, pos.z - 0.98, 0,0,0, 0,0,0, scale.x, scale.y, scale.z, 255,107,0,140, false,false,2,false,nil,nil,false)
end

local function loadModel(name)
    local m = type(name)=='string' and joaat(name) or name
    if not m or not IsModelValid(m) then return end
    if not HasModelLoaded(m) then
        RequestModel(m)
        while not HasModelLoaded(m) do Wait(0) end
    end
    return m
end

local function clearPreview()
    if preview and DoesEntityExist(preview) then
        SetEntityAsMissionEntity(preview,true,true)
        DeleteVehicle(preview)
    end
    preview = nil
end

local function concealSelf(toggle)
    local ped = PlayerPedId()
    NetworkConcealEntity(ped, toggle)
    SetEntityVisible(ped, not toggle, false)
    if toggle then
        SetEntityCollision(ped, false, false)
    else
        SetEntityCollision(ped, true, true)
    end
end

local function setupCameraAt(pos)
    if not pos then return end
    if not previewCam then
        previewCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamActive(previewCam, true)
        RenderScriptCams(true, false, 0, true, true)
    end
    camHeading = (pos.w or 0.0) + 90.0
    local camX = pos.x + camRadius * math.cos(math.rad(camHeading))
    local camY = pos.y + camRadius * math.sin(math.rad(camHeading))
    SetCamCoord(previewCam, camX, camY, pos.z + camHeight)
    PointCamAtCoord(previewCam, pos.x, pos.y, pos.z)
    SetFocusPosAndVel(pos.x, pos.y, pos.z, 0.0, 0.0, 0.0)
end

local function updateCameraPosition()
    if not previewCam then return end
    local coords
    if preview and DoesEntityExist(preview) then
        coords = GetEntityCoords(preview)
    elseif activeLocation then
        coords = vec3(activeLocation.x, activeLocation.y, activeLocation.z)
    else
        return
    end

    local camX = coords.x + camRadius * math.cos(math.rad(camHeading))
    local camY = coords.y + camRadius * math.sin(math.rad(camHeading))
    SetCamCoord(previewCam, camX, camY, coords.z + camHeight)
    
    if preview and DoesEntityExist(preview) then
        PointCamAtEntity(previewCam, preview, 0.0, 0.0, 0.0, true)
    else
        PointCamAtCoord(previewCam, coords.x, coords.y, coords.z)
    end
end

local function setupCamera(pos)
    if not previewCam then
        previewCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamActive(previewCam, true)
        RenderScriptCams(true, true, 500, true, true)
    end
    camHeading = pos.w + 90.0
    updateCameraPosition()
end

local function destroyCamera()
    if previewCam then
        RenderScriptCams(false, false, 0, true, true)
        SetCamActive(previewCam, false)
        DestroyCam(previewCam, true)
        previewCam = nil
    end
    ClearFocus()
end

local function seatLocal(vehicleData, pos, setProps)
    clearPreview()
    local info = vehicleData and json.decode(vehicleData.vehicle or '{}') or {}
    local model = info.model and (type(info.model)=='string' and joaat(info.model) or info.model) or nil
    local m = loadModel(model)
    if not m then return end
    preview = CreateVehicle(m, pos.x, pos.y, pos.z, pos.w, false, false)
    if setProps and next(info) then pcall(function() lib.setVehicleProperties(preview, info) end) end
    if vehicleData and vehicleData.plate then SetVehicleNumberPlateText(preview, vehicleData.plate) end
    SetVehicleDoorsLocked(preview, 4)
    SetVehicleEngineOn(preview, false, true, false)
    SetEntityInvincible(preview, true)
    SetVehicleUndriveable(preview, true)
    FreezeEntityPosition(preview, true)
    SetEntityCollision(preview, false, false)
    SetModelAsNoLongerNeeded(m)
    
    setupCamera(pos)
end

local function spawnNetwork(info, plate, pos)
    local model = info and (type(info.model)=='string' and joaat(info.model) or info.model)
    local m = loadModel(model); if not m then return end
    local v = CreateVehicle(m, pos.x, pos.y, pos.z, pos.w, true, false)
    if plate then SetVehicleNumberPlateText(v, plate) end
    if info and next(info) then pcall(function() lib.setVehicleProperties(v, info) end) end
    SetVehicleOnGroundProperly(v)
    TaskWarpPedIntoVehicle(PlayerPedId(), v, -1)
    SetVehicleDoorsLocked(v, 1)
    SetVehicleUndriveable(v, false)
    SetEntityInvincible(v, false)
    SetVehicleEngineOn(v, true, true, false)
    SetModelAsNoLongerNeeded(m)
end

local function toVec3(v)
    if not v then return nil end
    if type(v) == 'vector3' then return v end
    if v.x and v.y and v.z then return vec3(v.x, v.y, v.z) end
    if type(v) == 'table' and v[1] and v[2] and v[3] then return vec3(v[1], v[2], v[3]) end
    return nil
end

local function toVec4(v)
    if not v then return nil end
    if type(v) == 'vector4' then return v end
    if v.w then return vec4(v.x, v.y, v.z, v.w) end
    if v.x and v.y and v.z then return vec4(v.x, v.y, v.z, 0.0) end
    if type(v) == 'table' and v[4] then return vec4(v[1], v[2], v[3], v[4]) end
    if type(v) == 'table' and v[1] and v[2] and v[3] then return vec4(v[1], v[2], v[3], 0.0) end
    return nil
end

local function openUI(key, g)
    lib.callback('unique_garage:getVehicles', false, function(list)
        vehicles = list or {}
        activeGarage = key
        activeLocation = toVec4(g.Browse) or toVec4(g.Enter)
        
        FreezeEntityPosition(PlayerPedId(), true)
        concealSelf(true)

        -- Initial camera setup pointing to the spawn spot immediately
        setupCameraAt(activeLocation)

        for i, v in ipairs(vehicles) do
            local props = json.decode(v.vehicle or '{}')
            if props.model then
                local displayName = GetDisplayNameFromVehicleModel(props.model)
                local label = GetLabelText(displayName)
                if label == "NULL" then label = displayName end
                v.name = label:sub(1,1):upper() .. label:sub(2):lower()
            else
                v.name = "Vehículo " .. i
            end
        end

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "open",
            garage = key,
            garageName = Config.Blips.Garages.Name .. " " .. key,
            vehicles = vehicles,
            garages = Garages,
            transferFee = Config.TransferFee or 500,
            recoveryFee = Config.RecoveryFee or 1000
        })
    end, key)
end

local function CloseUIAndCleanUp()
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "close" })
    clearPreview()
    destroyCamera()
    concealSelf(false)
    FreezeEntityPosition(PlayerPedId(), false)
    activeGarage = nil
    activeLocation = nil
end

-- NUI CALLBACKS
RegisterNUICallback('closeUI', function(data, cb)
    CloseUIAndCleanUp()
    cb('ok')
end)

RegisterNUICallback('previewVehicle', function(data, cb)
    local v = vehicles[data.index + 1]
    if v and activeLocation then
        seatLocal(v, activeLocation, true)
    end
    cb('ok')
end)

RegisterNUICallback('rotateCamera', function(data, cb)
    if previewCam then
        camHeading = camHeading - (data.movementX * 0.5)
        updateCameraPosition()
    end
    cb('ok')
end)

RegisterNUICallback('spawnVehicle', function(data, cb)
    local plate = data.plate
    local v = nil
    for _, veh in ipairs(vehicles) do
        if veh.plate == plate then v = veh break end
    end
    
    if v then
        local ok = lib.callback.await('unique_garage:pullOutVehicle', false, plate)
        if ok == true then
            local spawnLoc = activeLocation
            CloseUIAndCleanUp()
            spawnNetwork(json.decode(v.vehicle or '{}'), v.plate, spawnLoc)
            lib.notify({ title='Garage', description='Vehículo sacado', type='success' })
        else
            lib.notify({ title='Garage', description='No se pudo sacar el vehículo', type='error' })
        end
    end
    cb('ok')
end)

RegisterNUICallback('transferToCurrent', function(data, cb)
    local plate = data.plate
    local ok = lib.callback.await('unique_garage:transferVehicle', false, plate, activeGarage)
    if ok == true then
        lib.notify({ title='Garage', description='Vehículo traído a este garaje', type='success' })
        CloseUIAndCleanUp()
    elseif ok == 'insufficient_funds' then
        lib.notify({ title='Garage', description='Dinero insuficiente', type='error' })
    else
        lib.notify({ title='Garage', description='Fallo al traspasar', type='error' })
    end
    cb('ok')
end)

RegisterNUICallback('transferVehicle', function(data, cb)
    local plate = data.plate
    local target = data.target
    local ok = lib.callback.await('unique_garage:transferVehicle', false, plate, target)
    if ok == true then
        lib.notify({ title='Garage', description='Vehículo traspasado a '..target, type='success' })
        CloseUIAndCleanUp()
    elseif ok == 'insufficient_funds' then
        lib.notify({ title='Garage', description='Dinero insuficiente', type='error' })
    else
        lib.notify({ title='Garage', description='Fallo al traspasar', type='error' })
    end
    cb('ok')
end)

RegisterNUICallback('recoverVehicle', function(data, cb)
    local plate = data.plate
    local ok = lib.callback.await('unique_garage:recoverVehicle', false, plate, activeGarage)
    if ok == true then
        lib.notify({ title='Garage', description='Vehículo recuperado', type='success' })
        
        local spawnLoc = activeLocation
        local v = nil
        for _, veh in ipairs(vehicles) do
            if veh.plate == plate then v = veh break end
        end
        
        CloseUIAndCleanUp()
        
        if v then
            spawnNetwork(json.decode(v.vehicle or '{}'), v.plate, spawnLoc)
        end
    elseif ok == 'insufficient_funds' then
        lib.notify({ title='Garage', description='Dinero insuficiente', type='error' })
    else
        lib.notify({ title='Garage', description='Fallo al recuperar', type='error' })
    end
    cb('ok')
end)

local activePoints = {}
local activeBlips = {}
Garages = {} -- Global to client so admin.lua can read it if needed

function CreateGaragePoints()
    for _, p in pairs(activePoints) do p:remove() end
    for _, b in pairs(activeBlips) do RemoveBlip(b) end
    activePoints = {}
    activeBlips = {}

    for key, g in pairs(Garages or {}) do
        local enterPos = toVec3(g.Enter)
        if enterPos then
            local enterPoint = lib.points.new(enterPos, Config.DrawDistance or 25.0, { key = key })
            function enterPoint:nearby()
                drawMarkerAt(enterPos, markerScale)
                if self.currentDistance <= enterRadius and not activeGarage then
                    showHelpMessage("~INPUT_CONTEXT~ Abrir Garaje")
                    if IsControlJustPressed(0, 38) then openUI(self.key, Garages[self.key]) end
                end
            end
            table.insert(activePoints, enterPoint)
        end

        if enterPos and Config.Blips and Config.Blips.Garages and Config.Blips.Garages.Enabled then
            local blip = AddBlipForCoord(enterPos.x, enterPos.y, enterPos.z)
            SetBlipSprite(blip, Config.Blips.Garages.Sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, Config.Blips.Garages.Scale)
            SetBlipColour(blip, Config.Blips.Garages.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName((Config.Blips.Garages.Name or "Garage") .. " " .. key)
            EndTextCommandSetBlipName(blip)
            table.insert(activeBlips, blip)
        end

        local storePos = toVec3(g.Store)
        if storePos then
            local storePoint = lib.points.new(storePos, Config.DrawDistance or 25.0, { key = key })
            function storePoint:nearby()
                drawMarkerAt(storePos, storeMarkerScale)
                if self.currentDistance <= storeEnterRadius and not activeGarage then
                    showHelpMessage("~INPUT_CONTEXT~ Guardar Vehículo")
                    if IsControlJustPressed(0, 38) then
                        local ped = PlayerPedId()
                        if IsPedInAnyVehicle(ped, false) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), -1) == ped then
                            local veh = GetVehiclePedIsIn(ped, false)
                            local ok = lib.callback.await('unique_garage:storeVehicle', false, self.key, lib.getVehicleProperties(veh))
                            if ok == true then
                                SetEntityAsMissionEntity(veh, true, true)
                                DeleteVehicle(veh)
                                lib.notify({ title='Garage', description='Vehículo guardado', type='success' })
                            elseif ok == 'already_stored' then
                                -- Fix for desynced vehicles: forcibly delete it anyway, since it's already in the DB.
                                SetEntityAsMissionEntity(veh, true, true)
                                DeleteVehicle(veh)
                                lib.notify({ title='Garage', description='Vehículo guardado', type='success' })
                            else
                                lib.notify({ title='Garage', description='No se pudo guardar el vehículo', type='error' })
                            end
                        else
                            lib.notify({ title='Garage', description='Debes ser el conductor', type='error' })
                        end
                    end
                end
            end
            table.insert(activePoints, storePoint)
        end
    end
end

CreateThread(function()
    Garages = lib.callback.await('unique_garage:getGaragesConfig', false)
    CreateGaragePoints()
end)

RegisterNetEvent('unique_garage:syncGarages', function(newGarages)
    Garages = newGarages
    CreateGaragePoints()
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    clearPreview()
    destroyCamera()
    concealSelf(false)
    lib.hideTextUI()
end)

lib.locale()