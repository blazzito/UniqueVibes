local openedFromHub = false

exports('IsOpenedFromHub', function() return openedFromHub end)
exports('ResetHubFlag', function() openedFromHub = false end)

-- Función para abrir el panel administrativo
exports('openManagement', function()
    openedFromHub = true
    CreateThread(function()
        -- 1. Verificar Permisos
        local isAdmin = lib.callback.await('mt-fuel:cb:isAdmin', false)
        if not isAdmin then
            lib.notify({ title = 'Combustible', description = 'No tienes permisos administrativos', type = 'error' })
            return
        end

        -- 2. Obtener Estaciones
        local response = lib.callback.await('mt-fuel:cb:getStations', false)
        if not response or not response.success then
            lib.notify({ title = 'Combustible', description = 'Error al cargar datos de las estaciones', type = 'error' })
            return
        end

        -- 3. FORMATEO EXTREMO (Para evitar errores de 'a' o 'A' undefined)
        local fuelsForUI = {}
        for k, v in pairs(Config.Fuels) do
            local keyUpper = string.upper(k)
            local keyLower = string.lower(k)
            fuelsForUI[keyUpper] = v
            fuelsForUI[keyLower] = v
        end

        local stationsForUI = {}
        for _, station in pairs(response.stations) do
            local s = json.decode(json.encode(station))
            s.stock = s.stock or {}
            s.prices = s.prices or {}
            
            -- Inyectamos todas las variantes posibles de claves
            for k, _ in pairs(Config.Fuels) do
                local up = string.upper(k)
                local low = string.lower(k)
                s.stock[up] = tonumber(s.stock[up] or s.stock[low]) or 0
                s.stock[low] = s.stock[up]
                s.prices[up] = tonumber(s.prices[up] or s.prices[low]) or 1.0
                s.prices[low] = s.prices[up]
            end
            
            -- Asegurar coords
            if s.coords and s.coords.x then
                s.coords = { x = s.coords.x, y = s.coords.y, z = s.coords.z }
            end
            
            table.insert(stationsForUI, s)
        end

        -- 4. Enviar a NUI
        SendNUIMessage({
            action = 'openAdminFuel',
            data = {
                stations = stationsForUI,
                fuelTypes = fuelsForUI
            }
        })
        
        SetNuiFocus(true, true)
    end)
end)

-- Callbacks de la Interfaz
RegisterNUICallback('closeAdminFuel', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
    if openedFromHub then
        openedFromHub = false
        if GetResourceState('mt-panel') == 'started' then
            exports['mt-panel']:ReturnToHub('Fuel System')
        end
    end
end)

-- Redirección de acciones a callbacks del servidor
RegisterNUICallback('toggleStationActive', function(data, cb)
    lib.callback('mt-fuel:cb:toggleStationActive', false, function(res)
        cb(res)
    end, data.stationId, data.active)
end)

RegisterNUICallback('refillAllStations', function(data, cb)
    lib.callback('mt-fuel:cb:refillAllStations', false, function(res)
        cb(res)
    end)
end)

RegisterNUICallback('updateStation', function(data, cb)
    TriggerServerEvent('mt-fuel:server:updateStation', data.stationId, data.data)
    cb('ok')
end)

RegisterNUICallback('setStationPrice', function(data, cb)
    lib.callback('mt-fuel:cb:setStationPrice', false, function(res)
        cb(res)
    end, data.stationId, data.fuelType, data.price)
end)

RegisterNUICallback('deleteStation', function(data, cb)
    lib.callback('mt-fuel:cb:deleteStation', false, function(res)
        cb(res)
    end, data.stationId)
end)

RegisterNUICallback('refreshStations', function(data, cb)
    lib.callback('mt-fuel:cb:getStations', false, function(response)
        cb(response)
    end)
end)

RegisterNUICallback('createStation', function(data, cb)
    TriggerServerEvent('mt-fuel:server:createStation', data)
    cb('ok')
end)

RegisterNUICallback('getCurrentCoords', function(data, cb)
    local coords = GetEntityCoords(PlayerPedId())
    cb({ x = coords.x, y = coords.y, z = coords.z })
end)

RegisterNUICallback('getConfig', function(data, cb)
    local fuelsForUI = {}
    for k, v in pairs(Config.Fuels) do
        fuelsForUI[string.upper(k)] = v
        fuelsForUI[string.lower(k)] = v
    end
    cb({ fuelTypes = fuelsForUI })
end)

RegisterNUICallback('startZoneCreation', function(data, cb)
    cb({ success = true })
    SendNUIMessage({ action = 'hideAllTemporarily' })
    SetNuiFocus(false, false)
    
    exports[GetCurrentResourceName()]:StartZoneCreation(function(points)
        SetNuiFocus(true, true)
        SendNUIMessage({ 
            action = 'zoneCreated', 
            data = { points = points } 
        })
    end)
end)
