Framework = {}

if GetResourceState('qbx_core') == 'started' then
    Framework.Type = 'qbx'
    Framework.Core = exports.qbx_core
elseif GetResourceState('qb-core') == 'started' then
    Framework.Type = 'qb'
    Framework.Core = exports['qb-core']:GetCoreObject()
elseif GetResourceState('es_extended') == 'started' then
    Framework.Type = 'esx'
    Framework.Core = exports['es_extended']:getSharedObject()
end

function Framework.GetPlayer(source)
    if Framework.Type == 'qbx' then
        return Framework.Core:GetPlayer(source)
    elseif Framework.Type == 'qb' then
        return Framework.Core.Functions.GetPlayer(source)
    elseif Framework.Type == 'esx' then
        return Framework.Core.GetPlayerFromId(source)
    end
end

function Framework.RemoveMoney(source, type, amount, reason)
    local player = Framework.GetPlayer(source)
    if not player then return false end

    if Framework.Type == 'qbx' then
        return player.Functions.RemoveMoney(type, amount, reason)
    elseif Framework.Type == 'qb' then
        return player.Functions.RemoveMoney(type, amount, reason)
    elseif Framework.Type == 'esx' then
        local account = type == 'cash' and 'money' or 'bank'
        if player.getAccount(account).money >= amount then
            player.removeAccountMoney(account, amount)
            return true
        end
    end
    return false
end

function Framework.HasPermission(source, permission)
    if Framework.Type == 'qbx' then
        return Framework.Core:HasPermission(source, permission) or Framework.Core:HasPermission(source, 'god')
    elseif Framework.Type == 'qb' then
        return Framework.Core.Functions.HasPermission(source, permission) or Framework.Core.Functions.HasPermission(source, 'god')
    elseif Framework.Type == 'esx' then
        local player = Framework.GetPlayer(source)
        return player and (player.getGroup() == permission or player.getGroup() == 'founder' or player.getGroup() == 'ceo' or player.getGroup() == 'director')
    end
    return false
end

function Framework.GetPlayerMoney(source, type)
    local player = Framework.GetPlayer(source)
    if not player then return 0 end

    if Framework.Type == 'qbx' or Framework.Type == 'qb' then
        return player.PlayerData.money[type] or 0
    elseif Framework.Type == 'esx' then
        local account = type == 'cash' and 'money' or 'bank'
        return player.getAccount(account).money
    end
    return 0
end
