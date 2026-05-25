Custom = {}
Framework = {}
Config = {}
Config.Locale = 'en'
Config.Debug = false

Internal = {}

local isServer = IsDuplicityVersion()
local resource_name = GetCurrentResourceName()
local version = GetResourceMetadata(resource_name, 'version', 0) or '1.0.0'

local core = require 'config.custom_core'

local resourceCategories = {
    framework = {
        'qbx_core',
        'qb-core',
        'es_extended',
    }
}

local function checkResourceState(resource)
    return GetResourceState(resource) == 'starting' or GetResourceState(resource) == 'started'
end

local function findActiveResource(resourceList)
    for _, resource in ipairs(resourceList) do
        if checkResourceState(resource) then
            return resource
        end
    end
    return nil
end

local activeResources = {}
for category, resources in pairs(resourceCategories) do
    activeResources[category] = findActiveResource(resources)
end

activeResources.framework = activeResources.framework == 'es_extended' and 'esx' or (core.useCustomCore and 'custom' or activeResources.framework or 'standalone')

Config.Framework = activeResources.framework

local frameworkEvents = {
    ['qb-core'] = {
        ['load'] = 'QBCore:Client:OnPlayerLoaded',
        ['unload'] = 'QBCore:Server:OnPlayerUnload',
    },
    ['qbx_core'] = {
        ['load'] = 'QBCore:Client:OnPlayerLoaded',
        ['unload'] = 'QBCore:Server:OnPlayerUnload',
    },
    ['esx'] = {
        ['load'] = 'esx:playerLoaded',
        ['unload'] = 'esx:playerLogout',
    },
    ['custom'] = {
        ['load'] = core.events.load,
        ['unload'] = core.events.unload,
    },
}

local function GetFrameworkObject()
    if Config.Framework == 'esx' then
        return exports['es_extended']:getSharedObject()
    elseif Config.Framework == 'qbx_core' then
        return exports["qb-core"]:GetCoreObject()
    elseif Config.Framework == 'qb-core' then
        return exports["qb-core"]:GetCoreObject()
    elseif Config.Framework == 'custom' then
        return core.GetCustomCoreObject()
    end

    return nil
end

debugger = {}

function debugger.error(message, ...)
    if Config.Debug then print ('[^1DEBUG ERROR^0]', message, ...) end
end

function debugger.warn(message, ...)
    if Config.Debug then print ('[^3DEBUG WARNING^0]', message, ...) end
end

function debugger.info(message, ...)
    if Config.Debug then print ('[^5DEBUG INFO^0]', message, ...) end
end

if isServer then
    Framework = GetFrameworkObject()

    local function PrintBanner()
        print('^3========================================================^0')
        print('^3['..resource_name..']^0')
        print('* Framework: ^3'..activeResources.framework..'^0')
        print('* Language: ^3'..(Config.Locale or 'en')..'^0')
        print('* Debug: ' .. (Config.Debug and '^2Enabled' or '^1Disabled') .. '^0')
        print('* Version: ^3'..version..'^0')
        print('^3========================================================^0')
    end

    local eventName = frameworkEvents[Config.Framework]
    
    local function onPlayerUnload(src)
        TriggerEvent('mt-speaker:server:onPLayerUnload', src)
    end

    if eventName then
        AddEventHandler(eventName['unload'], onPlayerUnload)
    end

    SetTimeout(500, function()
        PrintBanner()
    end)


    Internal.Notify = function(src, text, type, length)
        TriggerClientEvent('mt-speaker:client:notify', src, text, type, length)
    end
else
    Framework = GetFrameworkObject()

    local function onPlayerLoaded()
        TriggerEvent('mt-speaker:client:onPLayerLoad')
    end
    
    local eventName = frameworkEvents[Config.Framework]
    
    if eventName then RegisterNetEvent(eventName['load'], onPlayerLoaded) end

    Internal.Notify = function(text, type, length)
        if Config.CustomNotify or Config.Framework == 'custom' then
            Custom.Notify(text, type, length)
        else
            if Config.Framework == 'qb-core' then
                Framework.Functions.Notify(text, type, length)
            elseif Config.Framework == 'qbx_core' then 
                lib.notify({
                    description = text,
                    type = type,
                    duration = length,
                })
            elseif Config.Framework == 'esx' then
                Framework.ShowNotification(text, type, length)
            end
        end
    end

    RegisterNetEvent('mt-speaker:client:notify', Internal.Notify)

    Internal.DrawText = function(text, key)
        if Config.CustomDrawText or Config.Framework == 'custom' then
            Custom.DrawText(text, key)
        else
            local finalText = ''
            if not key then 
                finalText = text
            else
                finalText = '['..key..'] - '..text
            end
            if Config.Framework == 'qb-core' then
                pcall(function()
                    exports['qb-core']:DrawText(finalText)
                end)
            elseif Config.Framework == 'esx' then
                pcall(function()
                    Framework.TextUI(finalText)
                end)
            end
        end
    end

    Internal.HideText = function()
        if Config.CustomDrawText or Config.Framework == 'custom' then
            Custom.HideText()
        else
            if Config.Framework == 'qb-core' then
                pcall(function()
                    exports['qb-core']:HideText()
                end)
            elseif Config.Framework == 'esx' then
                pcall(function()
                    Framework.HideUI()
                end)
            end
        end
    end
end