local isHubOpen = false
local scriptsData = {}

local transitions = Config.Transitions or {}
local openExportDelayMs = tonumber(transitions.OpenExportDelayMs) or 60
local returnToHubDelayMs = tonumber(transitions.ReturnToHubDelayMs) or 60

if openExportDelayMs < 0 then openExportDelayMs = 0 end
if returnToHubDelayMs < 0 then returnToHubDelayMs = 0 end

-- Framework detection
local Framework = nil
local FrameworkReady = false
local QBCore = nil
local ESX = nil

CreateThread(function()
    Wait(500) -- Esperar a que los recursos carguen
    
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
    
    FrameworkReady = true
    
end)

-- Notificación
local function Notify(message, type, duration)
    if Framework == "qbcore" and QBCore then
        QBCore.Functions.Notify(message, type, duration or 5000)
    elseif Framework == "esx" and ESX then
        ESX.ShowNotification(message)
    else
        -- Notificación standalone
        SendNUIMessage({
            action = "notify",
            data = {
                message = message,
                type = type or "info",
                duration = duration or 5000
            }
        })
    end
end

-- Abrir Hub
local function OpenHub()
    
    
    if isHubOpen then 
        
        return 
    end
    
    
    
    -- Pedir al servidor la lista de scripts con su estado
    TriggerServerCallback('mt-panel:getScriptsStatus', function(data)
        
        
        if not data then
            
            Notify(t('no_permission'), 'error')
            return
        end
        
        local scripts = data.scripts or {}
        local serverInfo = data.serverInfo or {}
        
        
        scriptsData = scripts
        isHubOpen = true
        
        
        SetNuiFocus(true, true)
        
        
        SendNUIMessage({
            action = "openHub",
            data = {
                scripts = scripts,
                categories = Config.Categories,
                locale = Config.Locale or "es",
                serverInfo = serverInfo
            }
        })
        
        
        -- Notify(t('notify_opened'), 'success', 3000)
    end)
end

-- Cerrar Hub
local function CloseHub()
    if not isHubOpen then return end
    
    isHubOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "closeHub"
    })
    
    -- Notify(t('notify_closed'), 'info', 3000)
end

-- Comando para abrir el hub
-- Comando para abrir el hub
if Config.Command then
    RegisterCommand(Config.Command, function()
        
        
        
        
        if not FrameworkReady then
            Notify("Sistema cargando, espera un momento...", 'error')
            return
        end
        
        
        OpenHub()
    end, false)
end

-- -- Tecla para abrir (opcional)
-- if Config.OpenKey then
--     RegisterKeyMapping(Config.Command, 'Abrir mt Hub', 'keyboard', Config.OpenKey)
-- end

-- Comando para volver al hub desde paneles externos (con tecla Backspace)
RegisterCommand('+mtPanelBack', function()
    if IsNuiFocused() then return end
    if not isHubOpen and FrameworkReady then
        print("^2[MT Panel]^7 Volviendo al hub desde panel externo...")

        -- Cerrar cualquier NUI abierto
        SetNuiFocus(false, false)

        -- Intentar cerrar el inventario si está abierto
        TriggerEvent('origen_inventory:client:CloseInventory')

        -- Pequeña pausa para asegurar que el NUI anterior se cierre
        Wait(100)

        -- Abrir el hub
        OpenHub()
    end
end, false)

RegisterCommand('-mtPanelBack', function() end, false)

-- Mapear la tecla Backspace al comando (desactivado: conflicto con lls_mechanic)
-- RegisterKeyMapping('+mtPanelBack', 'Volver al MT Panel', 'keyboard', 'BACK')

-- NUI Callbacks
RegisterNUICallback('closeHub', function(data, cb)
    CloseHub()
    cb('ok')
end)

RegisterNUICallback('openScriptAdmin', function(data, cb)
    local scriptId = data.scriptId
    
    
    
    -- Verificar que el script esté disponible
    local scriptInfo = nil
    for _, script in ipairs(scriptsData) do
        if script.id == scriptId then
            scriptInfo = script
            break
        end
    end
    
    if not scriptInfo then
        Notify(t('script_not_running'), 'error')
        cb('error')
        return
    end
    
    if not scriptInfo.isActive then
        Notify(t('script_not_running'), 'error')
        cb('error')
        return
    end
    
    if not scriptInfo.isAcquired then
        Notify(t('script_not_acquired'), 'error')
        cb('error')
        return
    end
    
    -- Si el adminRoute es "export", ejecutar comando directo
    if scriptInfo.adminRoute == "export" then
        
        
        
        
        
        
        -- Cerrar el hub (visual)
        isHubOpen = false
        SendNUIMessage({
            action = "closeHub"
        })
        
        
        -- Quitar el focus del hub INMEDIATAMENTE
        SetNuiFocus(false, false)
        
        -- Pausa mínima configurable para transición fluida
        Wait(openExportDelayMs)
        
        
        -- Llamar al export inmediatamente con transición corta
        local success, err = pcall(function()
            exports[scriptId]:openManagement()
        end)
        
        if not success then
            
            cb('error')
            return
        end
        
        
        
        
        
        cb('ok')
        return
    end
    
    -- El iframe se maneja desde el NUI
    cb('ok')
end)

RegisterNUICallback('getTranslation', function(data, cb)
    local key = data.key
    cb(t(key))
end)

-- Callback helper (compatible con múltiples frameworks)
function TriggerServerCallback(name, cb, ...)
    if Framework == "qbcore" and QBCore then
        QBCore.Functions.TriggerCallback(name, cb, ...)
    elseif Framework == "esx" and ESX then
        ESX.TriggerServerCallback(name, cb, ...)
    else
        -- Sistema de callbacks standalone
        local requestId = math.random(1, 999999)
        
        RegisterNetEvent('mt-panel:serverCallback:' .. requestId, function(...)
            cb(...)
        end)
        
        TriggerServerEvent('mt-panel:triggerCallback', name, requestId, ...)
    end
end

-- Ya no necesitamos el evento scriptReady

-- Función para volver al hub desde un panel con pantalla de carga
local function ReturnToHub(scriptName)
    
    
    CreateThread(function()
        Wait(returnToHubDelayMs)

        -- Abrir hub inmediatamente después de transición corta
        
        OpenHub()
        
        
    end)
end

-- Export para otros scripts
exports('OpenHub', OpenHub)
exports('CloseHub', CloseHub)
exports('IsHubOpen', function() return isHubOpen end)
exports('ReturnToHub', ReturnToHub)


