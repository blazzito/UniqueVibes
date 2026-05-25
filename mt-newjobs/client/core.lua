ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        if ESX == nil then
            pcall(function() ESX = exports['es_extended']:getSharedObject() end)
        end
        Wait(100)
    end
end)
Jobs = {}
local registeredModules = {}

function MTJobsFadeOut(time)
    local t = tonumber(time) or 800
    if GetResourceState('mt-hud') == 'started' then
        exports['mt-hud']:DoScreenFadeOut(t)
        Wait(t + 20)
    else
        DoScreenFadeOut(t)
        while not IsScreenFadedOut() do
            Wait(0)
        end
    end
end

function MTJobsFadeIn(time)
    local t = tonumber(time) or 800
    if GetResourceState('mt-hud') == 'started' then
        exports['mt-hud']:DoScreenFadeIn(t)
    else
        DoScreenFadeIn(t)
    end
end

-- Helper for 3D Text UI
local activeInteractions = {}

function MTDrawText3D(id, text, coords, key)
    if not activeInteractions[id] then
        exports['mt-notify']:create3DTextUI(id, {
            coords = coords,
            text = text,
            key = key or "E",
            type = "textui",
            displayDist = 10.0,
            interactDist = 3.0
        })
        activeInteractions[id] = {text = text, coords = coords}
    else
        local current = activeInteractions[id]
        if #(current.coords - coords) > 0.1 then
            exports['mt-notify']:Update3DTextCoords(id, coords)
            current.coords = coords
        end
        if current.text ~= text then
            exports['mt-notify']:update3DTextUI(id, text)
            current.text = text
        end
    end
end

function MTHideText3D(id)
    if activeInteractions[id] then
        exports['mt-notify']:DeleteDrawText3D(id)
        activeInteractions[id] = nil
    end
end

function RegisterJobModule(name, moduleTable)
    if registeredModules[name] then
        Debug:Error("Module already registered: %s", name)
        return
    end
    registeredModules[name] = moduleTable
    
    if moduleTable.init then
        moduleTable:init()
    end
    Debug:Info("Registered CLIENT module: %s", name)
end

exports('GetJobModule', function(name)
    return registeredModules[name]
end)

RegisterNetEvent('mt-newjobs:client:toggleJob')
AddEventHandler('mt-newjobs:client:toggleJob', function(jobName, state)
    local job = registeredModules[jobName]
    if job then
        if state then
            job:start()
        else
            job:stop()
        end
    end
end)

-- NUI Callbacks
RegisterNUICallback('getJobs', function(data, cb)
    local jobsList = {}
    for name, job in pairs(registeredModules) do
        table.insert(jobsList, {
            name = name,
            active = job:isActive(),
            config = job.config
        })
    end
    cb(jobsList)
end)

RegisterNUICallback('toggleJob', function(data, cb)
    TriggerServerEvent('mt-newjobs:server:toggleJob', data.name) -- We need this server event
    cb('ok')
end)

RegisterNUICallback('saveJobConfig', function(data, cb)
    TriggerServerEvent('mt-newjobs:server:saveConfig', data.name, data.config)
    cb('ok')
end)

RegisterNUICallback('closeAdmin', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Mapa de traducción: el NUI usa nombres en inglés, los módulos se registran con nombres en español
local nuiToModuleName = {
    chicken = 'pollero',
    trucker = 'camionero',
    garbage = 'garbage',
    bus = 'bus',
}

-- Busca un módulo por su nombre NUI o nombre de registro directo
local function GetModuleByNUIType(nuiJobType)
    -- Primero buscar por nombre directo
    if registeredModules[nuiJobType] then
        return registeredModules[nuiJobType]
    end
    -- Luego buscar por alias
    local moduleName = nuiToModuleName[nuiJobType]
    if moduleName and registeredModules[moduleName] then
        return registeredModules[moduleName]
    end
    return nil
end

-- Callback centralizado para iniciar cualquier job desde el NUI
RegisterNUICallback('startJob', function(data, cb)
    SetNuiFocus(false, false)
    local jobType = data.jobType
    
    -- Liberar bloqueo de menú del job
    if jobType == 'chicken' then
        TriggerServerEvent('mt-chicken:closeMenu')
    elseif jobType == 'garbage' then
        TriggerServerEvent('mt-garbage:closeMenu')
    elseif jobType == 'bus' then
        TriggerServerEvent('mt-bus:closeMenu')
    end
    
    if jobType then
        local job = GetModuleByNUIType(jobType)
        if job and job.RequestStart then
            job:RequestStart(data)
        end
    end
    cb('ok')
end)

-- Callback centralizado para cerrar el menú de cualquier job
RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    
    -- Liberar bloqueo de menú de todos los jobs
    TriggerServerEvent('mt-chicken:closeMenu')
    TriggerServerEvent('mt-garbage:closeMenu')
    TriggerServerEvent('mt-bus:closeMenu')
    
    cb('ok')
end)

-- Callback centralizado para finalizar turno activo
RegisterNUICallback('endShift', function(data, cb)
    SetNuiFocus(false, false)
    local jobType = data.jobType
    
    -- Liberar bloqueo de menú del job
    if jobType == 'chicken' then
        TriggerServerEvent('mt-chicken:closeMenu')
    elseif jobType == 'garbage' then
        TriggerServerEvent('mt-garbage:closeMenu')
    elseif jobType == 'bus' then
        TriggerServerEvent('mt-bus:closeMenu')
    end
    
    -- Llamar al ReturnVehicle() o stop() del módulo correspondiente para limpiar todo
    if jobType then
        local job = GetModuleByNUIType(jobType)
        if job then
            if job.ReturnVehicle then
                job:ReturnVehicle()
            elseif job.stop then
                job:stop()
            end
        end
    end
    cb('ok')
end)


-- Admin Command
RegisterCommand('jobadmin', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openAdmin'
    })
end, false)

