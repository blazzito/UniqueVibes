-- =====================================================
-- TAXI MODULE - SERVER SIDE
-- =====================================================

local taxiDuty = {}
local taxiSettings = {}
local taxiAlerts = {}

-- Helpers
local function GetPlayerName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer and xPlayer.getName() or "Conductor"
end

-- Callbacks
lib.callback.register('mt-taxi:server:getDutyCount', function(source)
    local count = 0
    for _, onDuty in pairs(taxiDuty) do
        if onDuty then count = count + 1 end
    end
    return count
end)

lib.callback.register('mt-taxi:server:getSettings', function(source)
    return taxiSettings
end)

lib.callback.register('mt-taxi:server:isDuty', function(source)
    return taxiDuty[source] or false
end)

-- Events
RegisterNetEvent('mt-taxi:server:toggleDuty', function()
    local _source = source
    taxiDuty[_source] = not (taxiDuty[_source] or false)
    TriggerClientEvent('mt-taxi:client:dutyChanged', _source, taxiDuty[_source])
end)

RegisterNetEvent('mt-taxi:server:saveSetting', function(key, value)
    taxiSettings[key] = value
    TriggerClientEvent('mt-taxi:client:settingUpdated', -1, key, value)
end)

RegisterNetEvent('mt-taxi:server:spawnVehicle', function(model)
    local _source = source
    local spawnCoords = taxiSettings["VehicleSpawn"] or TaxiConfig.DefaultLocations["VehicleSpawn"]
    
    if not IsSpawnPointFree(vec3(spawnCoords.x, spawnCoords.y, spawnCoords.z), 5.0) then
        TriggerClientEvent('ox_lib:notify', _source, {
            title = 'Taxi',
            description = 'El punto de spawn está bloqueado',
            type = 'error'
        })
        return
    end

    TriggerClientEvent('mt-taxi:client:spawnVehicle', _source, model, spawnCoords)
end)

RegisterNetEvent('mt-taxi:server:acceptAlert', function(alertPlayerID)
    local _source = source
    local driverName = GetPlayerName(_source)
    TriggerClientEvent('mt-taxi:client:alertAccepted', -1, alertPlayerID, driverName)
end)

RegisterNetEvent('mt-taxi:server:completeMission', function(payment, timeWorked)
    local _source = source
    FinishJob(_source, 'taxi', 1, payment, timeWorked)
end)

-- Dispatch /taxi command
RegisterCommand('taxi', function(source, args, rawCommand)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local message = table.concat(args, " ")
    local coords = GetEntityCoords(GetPlayerPed(_source))

    local alert = {
        playerID = _source,
        name = xPlayer.getName(),
        message = message,
        coords = coords,
        time = os.date("%H:%M")
    }

    taxiAlerts[_source] = alert

    -- Notify all on-duty taxi drivers
    for driverId, onDuty in pairs(taxiDuty) do
        if onDuty then
            TriggerClientEvent('mt-taxi:client:receiveAlert', driverId, alert)
        end
    end

    TriggerClientEvent('ox_lib:notify', _source, {
        title = 'Taxi',
        description = 'Tu solicitud de taxi ha sido enviada.',
        type = 'success'
    })
end, false)

