local isPanelOpen = false

RegisterNetEvent('mt-vip:client:openPanel', function(data)
    if isPanelOpen then return end
    
    isPanelOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        data = data
    })
end)

RegisterNUICallback('close', function(_, cb)
    isPanelOpen = false
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Admin Panel Callbacks
RegisterNUICallback('saveRank', function(data, cb)
    TriggerServerEvent('mt-vip:server:admin:saveRank', data)
    cb('ok')
end)

RegisterNUICallback('deleteRank', function(data, cb)
    TriggerServerEvent('mt-vip:server:admin:deleteRank', data.id)
    cb('ok')
end)

RegisterNUICallback('saveCode', function(data, cb)
    TriggerServerEvent('mt-vip:server:admin:saveCode', data)
    cb('ok')
end)

RegisterNUICallback('deleteCode', function(data, cb)
    TriggerServerEvent('mt-vip:server:admin:deleteCode', data.id)
    cb('ok')
end)

RegisterNUICallback('updateUserCoins', function(data, cb)
    TriggerServerEvent('mt-vip:server:admin:updateUserCoins', data)
    cb('ok')
end)

RegisterNUICallback('updateUserRank', function(data, cb)
    TriggerServerEvent('mt-vip:server:admin:updateUserRank', data)
    cb('ok')
end)

RegisterNUICallback('getDashboardData', function(_, cb)
    lib.callback('mt-vip:server:getDashboardData', false, function(data)
        cb(data)
    end)
end)
