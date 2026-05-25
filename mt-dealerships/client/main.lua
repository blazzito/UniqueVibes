vehicleList = {}  -- Make global for admin.lua
function generateVehicleList()  -- Make global for admin.lua

    if next(vehicleList) then
        return vehicleList
    end

    local vehicles = GetAllVehicleModels()

    for _, vehicle in pairs(vehicles) do
        local model = vehicle
        local label = GetDisplayNameFromVehicleModel(model)
        table.insert(vehicleList, {
            model = model,
            label = label
        })
    end

    return vehicleList
end

RegisterCommand('dealer', function(src,args,raw)
    lib.callback('mt-dealerships:ui:getDealerships', false, function(result)
        if result == false then
            Custom.Notify(locale('notifications.no_admin_permissions'), 'error')
            return
        end
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openAdmin',
            dealerships = result,
            vehicles = generateVehicleList()
        })
    end)
  
end)

RegisterNUICallback('close', function(data, cb)

    local function HudFadeOut(time)
        local t = tonumber(time) or 320
        if GetResourceState('mt-hud') == 'started' then
            SetNuiZindex(1)
            exports['mt-hud']:DoScreenFadeOut(t)
            Wait(t + 20)
        else
            DoScreenFadeOut(t)
            while not IsScreenFadedOut() do Wait(0) end
        end
    end

    local function HudFadeIn(time)
        local t = tonumber(time) or 360
        if GetResourceState('mt-hud') == 'started' then
            SetNuiZindex(99999)
            exports['mt-hud']:DoScreenFadeIn(t)
        else
            DoScreenFadeIn(t)
        end
    end

    local silent = data and data.silent
    if not silent then
        HudFadeOut(320)
    end

    SetNuiFocus(false, false)
    cleanupPreviewCamera()
    local routingBucket = lib.callback.await('mt-dealerships:routingBucketHandler', false)

    if not silent then
        Wait(80)
        HudFadeIn(380)
    end

    cb(true)
    
    -- Check if opened from hub using global variable
    if _G.DealershipHubIntegration and _G.DealershipHubIntegration.openedFromHub then
        _G.DealershipHubIntegration.openedFromHub = false
        
        if GetResourceState('mt-panel') == 'started' then
            exports['mt-panel']:ReturnToHub('Dealership System')
        end
    end
end)

RegisterNUICallback('getConfig', function(data, cb)
    cb({
        FinancingConfig = Config.FinancingConfig,
    })
end)

RegisterNUICallback('mt-dealerships:ui:teleport', function(data, cb)
    DoScreenFadeOut(1000)
    while not IsScreenFadedOut() do
        Wait(0)
    end
    SetEntityCoords(cache.ped, data.coords.x, data.coords.y, data.coords.z, false, false, false, true)
    DoScreenFadeIn(2000)
    cb(true)
end)

RegisterNUICallback('mt-dealerships:ui:spawnVehicle', function(data, cb)
    local vehicle = data.vehicle
    local model = GetHashKey(vehicle.model)
    
    if not IsModelValid(model) then
        cb(false)
        return
    end

    RequestModel(model)
    DoScreenFadeOut(1000)

    if IsPedInAnyVehicle(cache.ped, false) then
        local vehicleIn = GetVehiclePedIsIn(cache.ped, false)
        if vehicleIn then
            SetEntityAsMissionEntity(vehicleIn, true, true)
            DeleteEntity(vehicleIn)
        end
    end

    while not IsModelInCdimage(model) do
        Wait(0)
    end

    while not HasModelLoaded(model) do
        Wait(0)
    end

    while not IsScreenFadedOut() do
        Wait(0)
    end

    DoScreenFadeIn(2000)
    local coords = GetEntityCoords(cache.ped)
    local heading = GetEntityHeading(cache.ped)
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
    SetVehicleOnGroundProperly(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, 'DEALERSHIP')
    -- Custom:GiveKeys(vehicle, PlayerPedId(), true)
    TaskWarpPedIntoVehicle(cache.ped, vehicle, -1)

    cb(true)
end)

RegisterNUICallback('mt-dealerships:ui:deleteDealership', function(data, cb)
    lib.callback('mt-dealerships:ui:deleteDealership', false, function(retval)
        cb(retval)
    end, data)
end)

RegisterNUICallback('mt-dealerships:ui:saveAll', function(data, cb)
    lib.callback('mt-dealerships:ui:saveAll', false, function(retval)
        if retval and retval.success then
            Custom.Notify(locale('notifications.saved_successfully'))
        end
        cb(retval)
    end, data)
end)

RegisterNUICallback('deleteCreatorPoint', function(data, cb)
    if data.type and data.index ~= nil then
        DeleteCreatorPoint(data.type, data.index)
    end
    cb(true)
end)

-- Callback para forzar actualización del cache
RegisterNUICallback('mt-dealerships:ui:forceUpdate', function(data, cb)
    lib.callback('mt-dealerships:ui:forceUpdate', false, function(success)
        if success then
            Custom.Notify(locale('notifications.data_updated'), 'success')
        else
            Custom.Notify(locale('notifications.error_updating_data'), 'error')
        end
        cb(success)
    end)
end)

-- Callback para configuración individual de ubicaciones
RegisterNUICallback('setupIndividualLocation', function(data, cb)
    
    setupIndividualLocation(data.dealershipId, data.locationType, data.currentData, function(result)
        
        if result then
            -- Enviar datos al servidor para guardar
            lib.callback('mt-dealerships:ui:updateIndividualLocation', false, function(success)
                if success then
                    Custom.Notify(locale('notifications.locations_updated'))
                    -- Recargar panel de administración
                    lib.callback('mt-dealerships:ui:getDealerships', false, function(dealerships)
                        SendNUIMessage({
                            action = 'refreshDealerships',
                            dealerships = dealerships
                        })
                    end)
                else
                    Custom.Notify(locale('notifications.error_updating_locations'))
                end
                cb(success)
            end, result)
        else
            cb(false)
        end
    end)
end)

RegisterNUICallback('prepareLocationPlacement', function(_, cb)
    -- Cerrar solo el foco de NUI para poder colocar puntos en mundo
    -- sin pasar por el flujo de cierre global (hub/fades externos).
    SetNuiFocus(false, false)
    cb(true)
end)

RegisterNUICallback('maintainNuiFocus', function(data, cb)
    SetNuiFocus(true, true)
    cb(true)
end)

-- Callback para obtener traducciones desde el frontend
RegisterNUICallback('getTranslations', function(data, cb)
    local timeout = 0
    while not next(Config.Translations) and timeout < 20 do
        Wait(100)
        timeout = timeout + 1
    end
    cb(Config.Translations)
end)