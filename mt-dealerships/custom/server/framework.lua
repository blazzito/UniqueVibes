local isServer = IsDuplicityVersion()
if not isServer then return end

Framework = {}

function Framework.GetPlayer(source)
    if Config.Framework == 'esx' then
        return exports['es_extended']:getSharedObject().GetPlayerFromId(source)
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        return exports['qb-core']:GetCoreObject().Functions.GetPlayer(source)
    end
end

function Framework.GetPlayerIdentifier(source)
    local player = Framework.GetPlayer(source)
    if not player then return nil end
    
    if Config.Framework == 'esx' then
        return player.identifier
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        return player.PlayerData.citizenid
    end
end

function Framework.GetPlayerName(source)
    local player = Framework.GetPlayer(source)
    if not player then return GetPlayerName(source) end
    
    if Config.Framework == 'esx' then
        return player.getName()
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        return player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
    end
end

function Framework.GetPlayerMoney(source, type)
    local player = Framework.GetPlayer(source)
    if not player then return 0 end
    
    type = type or 'money'
    if Config.Framework == 'esx' then
        if type == 'cash' then type = 'money' end
        if type == 'xp' then type = 'uv_coins' end
        local account = player.getAccount(type)
        return account and account.money or 0
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        if type == 'money' then type = 'cash' end
        return player.PlayerData.money[type] or 0
    end
end

function Framework.RemovePlayerMoney(source, amount, type)
    local player = Framework.GetPlayer(source)
    if not player then return false end
    
    type = type or 'money'
    if Config.Framework == 'esx' then
        if type == 'cash' then type = 'money' end
        if type == 'xp' then type = 'uv_coins' end
        local account = player.getAccount(type)
        if not account then return false end
        player.removeAccountMoney(type, amount)
        return true
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        if type == 'money' then type = 'cash' end
        return player.Functions.RemoveMoney(type, amount)
    end
end


function Framework.AddPlayerMoney(source, amount, type)
    local player = Framework.GetPlayer(source)
    if not player then return false end
    
    type = type or 'money'
    if Config.Framework == 'esx' then
        if type == 'cash' then type = 'money' end
        if type == 'xp' then type = 'uv_coins' end
        player.addAccountMoney(type, amount)
        return true
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        if type == 'money' then type = 'cash' end
        return player.Functions.AddMoney(type, amount)
    end
end

function Framework.IsAdmin(source)
    local player = Framework.GetPlayer(source)
    if not player then return false end
    
    local group = ''
    if Config.Framework == 'esx' then
        group = player.getGroup()
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        group = exports['qb-core']:GetCoreObject().Functions.GetPermission(source)
        if type(group) == 'table' then
            -- Handle QBCore multiple permissions if necessary, but usually it's a string
            -- Or check against Config.AdminGroups
        end
    end
    
    local adminGroups = Config.AdminGroups[Config.Framework] or {}
    for _, g in ipairs(adminGroups) do
        if group == g then
            return true
        end
    end
    
    -- Special case for QBCore permissions
    if Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        if exports['qb-core']:GetCoreObject().Functions.HasPermission(source, 'admin') or 
           exports['qb-core']:GetCoreObject().Functions.HasPermission(source, 'god') then
            return true
        end
    end

    return false
end

function Framework.GetVehicleTable()
    if Config.Framework == 'esx' then
        return 'owned_vehicles'
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        return 'player_vehicles'
    end
end

function Framework.GetVehicleOwnerColumn()
    if Config.Framework == 'esx' then
        return 'owner'
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        return 'citizenid'
    end
end

function Framework.GetPlayerSourceByIdentifier(identifier)
    if Config.Framework == 'esx' then
        local player = exports['es_extended']:getSharedObject().GetPlayerFromIdentifier(identifier)
        return player and player.source or nil
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx' then
        local player = exports['qb-core']:GetCoreObject().Functions.GetPlayerByCitizenId(identifier)
        return player and player.PlayerData.source or nil
    end
    return nil
end
