local notifyQueue = {}
local notificationsDisabled = false

local function sendNotification(data)
    if notificationsDisabled then
        notifyQueue[#notifyQueue + 1] = data
        return
    end
    SendNUIMessage({
        action = 'sendNotification',
        data = data
    })
end

exports('showNotification', sendNotification)
exports('Notify', sendNotification)

RegisterNetEvent('mt-notify:SendNotification', function(data)
    sendNotification(data)
end)

exports("disableNotifications", function(disable, ignoreQueue)
    notificationsDisabled = disable
    if disable then
        return
    end
    if not ignoreQueue then
        for _, notification in ipairs(notifyQueue) do
            sendNotification(notification)
        end
    end
    notifyQueue = {}
end)

RegisterCommand('testnoti', function()
    sendNotification({
        description = 'Notificación de prueba 1',
        duration = 15000,
        type = 'success'
    })
    Wait(1500)
    sendNotification({
        title = "test",
        description = 'Notificación de prueba 2 con texto más largo para rellenar una segunda línea y ver que nada se desborde.',
        duration = 15000,
        type = 'error'
    })
    Wait(1500)
    sendNotification({
        description = 'Notificación de prueba 2 con texto más largo para rellenar una segunda línea y ver que nada se desborde. Texto distinto',
        duration = 15000,
        type = 'info'
    })
end)


-- Intercepting call lol
RegisterNetEvent("mt-notify:ShowNotification")
AddEventHandler("mt-notify:ShowNotification", function(text, title, business, bimg)
    sendNotification({
        title = title,
        description = text,
        type = 'primary',
        duration = 5000
    })
    
end)