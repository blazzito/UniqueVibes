local function SaveGyms()
    SaveResourceFile(GetCurrentResourceName(), "gyms.json", json.encode(Config.Gyms, {indent = true}), -1)
end

local function LoadGyms()
    local file = LoadResourceFile(GetCurrentResourceName(), "gyms.json")
    if file then
        Config.Gyms = json.decode(file)
    else
        SaveGyms() -- Create initial file from config.lua
    end
end

MySQL.ready(function()
    LoadGyms()
end)

RESCB("mt-gym:server:getItem",function(source,cb,item, remove)
	local xPlayer = GETPFI(source)
    if GetItemCount(xPlayer, item) > 0 then
        if remove then
            RemoveItem(xPlayer, item)
        end
        cb(true)
    else
        cb(false)
    end
end)

RESCB('mt-gym:server:getGyms', function(source, cb)
    cb(Config.Gyms)
end)

RegisterNetEvent('mt-gym:server:saveGymData', function(newGymData)
    local src = source
    local xPlayer = GETPFI(src)
    
    if xPlayer and (xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin') then
        Config.Gyms = newGymData
        SaveGyms()
        TriggerClientEvent('mt-gym:client:updateGymConfigs', -1, Config.Gyms)
    end
end)

if Config.Core:upper() == 'ESX' then
    Core.RegisterCommand('gymadmin', {'admin', 'superadmin'}, function(xPlayer, args, showError)
        TriggerClientEvent('mt-gym:client:openAdminMenu', xPlayer.source)
    end, false, {help = 'Abrir el panel administrativo del Gimnasio'})
elseif Config.Core:upper() == 'QBCORE' then
    Core.Commands.Add('gymadmin', 'Abrir el panel administrativo del Gimnasio', {}, false, function(source, args)
        TriggerClientEvent('mt-gym:client:openAdminMenu', source)
    end, 'admin')
end