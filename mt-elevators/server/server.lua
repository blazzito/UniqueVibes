local config = require 'config'
local elevatorsData = {}

-- Load data from JSON
local function LoadData()
    local content = LoadResourceFile(GetCurrentResourceName(), 'data/elevators.json')
    if content then
        elevatorsData = json.decode(content) or {}
    else
        elevatorsData = config.elevators or {}
        SaveResourceFile(GetCurrentResourceName(), 'data/elevators.json', json.encode(elevatorsData), -1)
    end
end

-- Save data to JSON
local function SaveData()
    SaveResourceFile(GetCurrentResourceName(), 'data/elevators.json', json.encode(elevatorsData, {indent = true}), -1)
    TriggerClientEvent('mt-elevators:client:updateElevators', -1, elevatorsData)
end

-- Sync on player load
RegisterNetEvent('mt-elevators:server:getElevators', function()
    local src = source
    TriggerClientEvent('mt-elevators:client:updateElevators', src, elevatorsData)
end)


-- Admin command
lib.addCommand('eadmin', {
    help = 'Abrir panel de administración de elevadores',
    restricted = { 'group.admin', 'group.superadmin', 'group.founder', 'group.ceo', 'group.director', 'group.subdirector' }
}, function(source, args, raw)
    TriggerClientEvent('mt-elevators:client:openAdmin', source)
end)

-- CRUD Events
RegisterNetEvent('mt-elevators:server:saveElevator', function(groupName, floors)
    local src = source
    local allowed = false
    local groups = { 'admin', 'superadmin', 'founder', 'ceo', 'director', 'subdirector' }
    for _, group in ipairs(groups) do
        if IsPlayerAceAllowed(src, 'group.' .. group) or IsPlayerAceAllowed(src, 'command.eadmin') then
            allowed = true
            break
        end
    end

    if not allowed then 
        TriggerClientEvent('mt-notify:SendNotification', src, { title = 'ADMIN', description = 'No tienes permisos suficientes', type = 'error' })
        return 
    end

    elevatorsData[groupName] = floors
    SaveData()
    TriggerClientEvent('mt-notify:SendNotification', src, { title = 'ADMIN', description = 'Elevador guardado/actualizado', type = 'success' })
end)

RegisterNetEvent('mt-elevators:server:deleteElevator', function(groupName)
    local src = source
    local allowed = false
    local groups = { 'admin', 'superadmin', 'founder', 'ceo', 'director', 'subdirector' }
    for _, group in ipairs(groups) do
        if IsPlayerAceAllowed(src, 'group.' .. group) or IsPlayerAceAllowed(src, 'command.eadmin') then
            allowed = true
            break
        end
    end

    if not allowed then 
        TriggerClientEvent('mt-notify:SendNotification', src, { title = 'ADMIN', description = 'No tienes permisos suficientes', type = 'error' })
        return 
    end

    elevatorsData[groupName] = nil
    SaveData()
    TriggerClientEvent('mt-notify:SendNotification', src, { title = 'ADMIN', description = 'Elevador eliminado', type = 'error' })
end)

-- Initialize
CreateThread(function()
    LoadData()
end)
