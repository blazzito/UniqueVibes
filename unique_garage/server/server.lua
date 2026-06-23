-----------------------------------------------------
---- For more scripts and updates, visit ------------
--------- https://discord.gg/trase ------------------
-----------------------------------------------------

local Garages = {}

local function LoadGarages()
    local data = LoadResourceFile(GetCurrentResourceName(), "data/garages.json")
    if data then
        Garages = json.decode(data) or {}
    else
        Garages = Config.Garages or {}
        SaveResourceFile(GetCurrentResourceName(), "data/garages.json", json.encode(Garages, {indent=true}), -1)
    end
end

CreateThread(function()
    LoadGarages()
end)

lib.callback.register('unique_garage:getGaragesConfig', function(source)
    return Garages
end)

lib.callback.register('unique_garage:isAdmin', function(source)
    local xPlayer = GetPlayer(source)
    if xPlayer and (xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin') then
        return true
    end
    return false
end)

RegisterNetEvent('unique_garage:saveGarage', function(key, data)
    local xPlayer = GetPlayer(source)
    if not xPlayer or (xPlayer.getGroup() ~= 'admin' and xPlayer.getGroup() ~= 'superadmin') then return end

    Garages[key] = data
    SaveResourceFile(GetCurrentResourceName(), "data/garages.json", json.encode(Garages, {indent=true}), -1)
    TriggerClientEvent('unique_garage:syncGarages', -1, Garages)
end)

RegisterNetEvent('unique_garage:deleteGarage', function(key)
    local xPlayer = GetPlayer(source)
    if not xPlayer or (xPlayer.getGroup() ~= 'admin' and xPlayer.getGroup() ~= 'superadmin') then return end

    Garages[key] = nil
    SaveResourceFile(GetCurrentResourceName(), "data/garages.json", json.encode(Garages, {indent=true}), -1)
    TriggerClientEvent('unique_garage:syncGarages', -1, Garages)
end)

lib.callback.register('unique_garage:getVehicles', function(source, garage)
    local vehicles = GetOwnedVehicles(source, garage)
    if not vehicles then vehicles = {} end
    return vehicles
end)

lib.callback.register('unique_garage:storeVehicle', function(source, garage, props)
    local vehicleStored = StoreVehicle(source, garage, props)
    return vehicleStored
end)

lib.callback.register('unique_garage:pullOutVehicle', function(source, plate)
    local result = PullOutVehicle(source, plate)
    return result
end)

lib.callback.register('unique_garage:transferVehicle', function(source, plate, targetGarage)
    local result = TransferVehicle(source, plate, targetGarage)
    return result
end)

lib.callback.register('unique_garage:recoverVehicle', function(source, plate, garage)
    local result = RecoverVehicle(source, plate, garage)
    return result
end)