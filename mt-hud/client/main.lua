local isPlayerLoaded = false

function IsPlayerLoaded()
    return isPlayerLoaded
end

RegisterNetEvent('esx:playerLoaded', function()
    isPlayerLoaded = true
    Wait(1000)
    InitializeHUD()
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    isPlayerLoaded = false
    SendNUIMessage({ action = 'setVisible', value = false })
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    if exports['es_extended']:getSharedObject().PlayerLoaded then
        isPlayerLoaded = true
        InitializeHUD()
    end
end)

function InitializeHUD()
    if not isPlayerLoaded then return end
    SendNUIMessage({ action = 'setVisible', value = true })
    SendNUIMessage({ action = 'updateVitals', data = { health = 100, hunger = 100, thirst = 100, armor = 0, stamina = 100, stress = 0 } })
    StartStatusLoop()
    StartVehicleLoop()
end

RegisterNUICallback("nui_ready", function(data, cb)
    InitializeHUD()
    cb("ok")
end)

--[[RegisterCommand("testui", function()
    SendNUIMessage({ action = "setVisible", value = true })
    SendNUIMessage({ action = "updateVitals", data = { health = 50, hunger = 20, thirst = 20, armor = 10, stamina = 40 } })
end)
]]--