local Framework = nil
local QBCore = nil
local ESX = nil

CreateThread(function()
    Wait(500)
    if Config.Framework == "auto" then
        if GetResourceState('qb-core') == 'started' or GetResourceState('qbx_core') == 'started' then
            Framework = "qbcore"
            if GetResourceState('qb-core') == 'started' then
                QBCore = exports['qb-core']:GetCoreObject()
            else
                QBCore = exports.qbx_core:GetCoreObject()
            end
        elseif GetResourceState('es_extended') == 'started' then
            Framework = "esx"
            ESX = exports['es_extended']:getSharedObject()
        else
            Framework = "standalone"
        end
    else
        Framework = Config.Framework
    end
end)

-- Función para enviar logs a Discord
function SendHubLog(source, title, message)
    if not ConfigSV.Webhooks or not ConfigSV.Webhooks.enabled or ConfigSV.Webhooks.url == "" then return end
    
    local playerName = GetPlayerName(source)
    local identifiers = GetPlayerIdentifiers(source)
    local playerLicense = "No encontrada"
    
    for _, id in pairs(identifiers) do
        if string.find(id, "license:") then playerLicense = id break end
    end

    local embed = {
        {
            ["color"] = ConfigSV.Webhooks.color,
            ["title"] = "**" .. title .. "**",
            ["description"] = message .. "\n\n**Admin:** " .. playerName .. "\n**Licencia:** " .. playerLicense,
            ["footer"] = { ["text"] = ConfigSV.Webhooks.footer },
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    PerformHttpRequest(ConfigSV.Webhooks.url, function(err, text, headers) end, 'POST', json.encode({username = "MT Panel", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function IsPlayerAdmin(source)
    -- Check for Master Admins
    local identifiers = GetPlayerIdentifiers(source)
    for _, id in pairs(identifiers) do
        for _, masterId in pairs(ConfigSV.MasterAdmins) do
            if id == masterId then return true end
        end
    end

    if Framework == "qbcore" and QBCore then
        return QBCore.Functions.HasPermission(source, 'admin') or QBCore.Functions.HasPermission(source, 'god')
    elseif Framework == "esx" and ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then return false end
        local group = xPlayer.getGroup()
        return group == 'admin' or group == 'superadmin' or group == 'founder' or group == 'ceo' or group == 'director'
    end
    return IsPlayerAceAllowed(source, 'command')
end

function GetScriptsStatus(source)
    local scripts = {}
    for _, script in ipairs(Config.Scripts) do
        local isActive = GetResourceState(script.resourceName) == 'started'
        table.insert(scripts, {
            id = script.id,
            name = script.name,
            description = script.description,
            icon = script.icon,
            category = script.category,
            adminRoute = script.adminRoute,
            resourceName = script.resourceName,
            color = script.color,
            isActive = isActive,
            isAcquired = true -- We assume they have it if it's in the config
        })
    end
    
    local serverInfo = {
        name = GetConvar("sv_hostname", "Unique Vibes"),
        players = #GetPlayers(),
        maxPlayers = GetConvarInt("sv_maxclients", 128),
        uptime = "1h 30m", -- Dummy uptime
        activeScripts = #scripts,
        version = "1.0.1"
    }
    
    return {
        scripts = scripts,
        serverInfo = serverInfo
    }
end

-- Framework Callbacks
CreateThread(function()
    while not Framework do Wait(100) end
    
    if Framework == "qbcore" and QBCore then
        QBCore.Functions.CreateCallback('mt-panel:getScriptsStatus', function(source, cb)
            if IsPlayerAdmin(source) then
                SendHubLog(source, "Acceso al Hub", "El administrador ha abierto el panel de MT Panel.")
                cb(GetScriptsStatus(source))
            else
                cb(nil)
            end
        end)
    elseif Framework == "esx" and ESX then
        ESX.RegisterServerCallback('mt-panel:getScriptsStatus', function(source, cb)
            if IsPlayerAdmin(source) then
                SendHubLog(source, "Acceso al Hub", "El administrador ha abierto el panel de MT Panel.")
                cb(GetScriptsStatus(source))
            else
                cb(nil)
            end
        end)
    end
end)

-- Standalone Callback System
RegisterNetEvent('mt-panel:triggerCallback', function(name, requestId, ...)
    local _source = source
    if name == 'mt-panel:getScriptsStatus' then
        if IsPlayerAdmin(_source) then
            SendHubLog(_source, "Acceso al Hub (Standalone)", "El administrador ha abierto el panel de MT Panel.")
            TriggerClientEvent('mt-panel:serverCallback:' .. requestId, _source, GetScriptsStatus(_source))
        else
            TriggerClientEvent('mt-panel:serverCallback:' .. requestId, _source, nil)
        end
    end
end)
