
ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('mt_bossmenu:notify')
AddEventHandler('mt_bossmenu:notify', function(message, type)
    SendNUIMessage({
        action = 'notify',
        message = message,
        type = type or 'info'
    })
end)
