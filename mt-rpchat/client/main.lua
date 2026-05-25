local ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(5000)
        PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('qb-rpchat:sendMe', function(playerId, title, message, color)
    local target = GetPlayerFromServerId(playerId)
    if target ~= -1 then
        local sourcePed = PlayerPedId()
        local targetPed = GetPlayerPed(target)
        if targetPed == sourcePed or #(GetEntityCoords(sourcePed) - GetEntityCoords(targetPed)) < 20 then
            TriggerEvent('chat:addMessage', {
                template = '{2}', 
                args = { "ME", "color-me", message },
                senderId = playerId
            })
        end
    end
end)

RegisterNetEvent('qb-rpchat:sendDo', function(playerId, title, message, color)
    local target = GetPlayerFromServerId(playerId)
    if target ~= -1 then
        local sourcePed = PlayerPedId()
        local targetPed = GetPlayerPed(target)
        if targetPed == sourcePed or #(GetEntityCoords(sourcePed) - GetEntityCoords(targetPed)) < 20 then
            TriggerEvent('chat:addMessage', {
                template = '{2}',  
                args = { "DO", "color-do", message },
                senderId = playerId
            })
        end
    end
end)

RegisterNetEvent('qb-rpchat:sendLocalOOC', function(playerId, title, message, color)
    if not color then color = "color-ooc" end
    TriggerEvent('chat:addMessage', {
        template = '{2}',  
        args = { title:lower(), color, message },
        senderId = playerId
    })
end)

RegisterNetEvent('qb-rpchat:sendDados', function(playerId, title, message, color)
    local target = GetPlayerFromServerId(playerId)
    if target ~= -1 then
        local sourcePed = PlayerPedId()
        local targetPed = GetPlayerPed(target)
        if targetPed == sourcePed or #(GetEntityCoords(sourcePed) - GetEntityCoords(targetPed)) < 20 then
            TriggerEvent('chat:addMessage', {
                template = '{2}',  
                args = { "DAD🎲S", "color-dados", "Has sacado un: " .. message },
                senderId = playerId
            })
        end
    end
end)

