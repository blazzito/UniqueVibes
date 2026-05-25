local function Notify(source, data)
    if source == -1 then
        TriggerClientEvent('mt-notify:SendNotification', -1, data)
    else
        TriggerClientEvent('mt-notify:SendNotification', source, data)
    end
end

exports('Notify', Notify)
exports('showNotification', Notify)

exports('DrawText', function(source, key, text)
    TriggerClientEvent('mt-notify:client:DrawText', source, key, text)
end)

exports('HideText', function(source)
    TriggerClientEvent('mt-notify:client:HideText', source)
end)

--- Evento para enviar notificaciones desde otros scripts (Servidor)
RegisterNetEvent('mt-notify:server:SendNotification', function(target, data)
    Notify(target, data)
end)

--- Evento compatible con el formato mt-notify (Servidor)
RegisterNetEvent('mt-notify:server:ShowNotification', function(target, text, title, business, bimg)
    TriggerClientEvent('mt-notify:ShowNotification', target, text, title, business, bimg)
end)

--- Eventos compatibles con mt-textui (Servidor)
RegisterNetEvent('mt-textui:server:ShowText', function(target, text, key, align)
    TriggerClientEvent('mt-textui:ShowText', target, text, key, align)
end)

RegisterNetEvent('mt-textui:server:HideText', function(target)
    TriggerClientEvent('mt-textui:HideText', target)
end)

-- =================================================================
-- COMPATIBILIDAD CON FRAMEWORKS (Opcional)
-- =================================================================

-- ESX Compatibility
AddEventHandler('esx:showNotification', function(source, text, type, length)
    Notify(source, {
        description = text,
        type = type or 'primary',
        duration = length or 5000
    })
end)

-- QB-Core Compatibility
AddEventHandler('QBCore:Notify', function(source, text, type, length)
    Notify(source, {
        description = text,
        type = type or 'primary',
        duration = length or 5000
    })
end)

-- =================================================================
-- COMANDOS DE PRUEBA
-- =================================================================

-- Prueba individual: /testnotis [tipo] [mensaje]
--[[RegisterCommand('testnotis', function(source, args)
    local type = args[1] or "success"
    local msg = args[2] or "Esta es una notificación de prueba desde el servidor."
    
    Notify(source, {
        title = "Servidor: " .. type:gsub("^%l", string.upper),
        description = msg,
        type = type,
        duration = 5000
    })
end, false)

-- Prueba para todos: /testnotiall [mensaje]
RegisterCommand('testnotiall', function(source, args)
    local msg = table.concat(args, " ")
    if msg == "" then msg = "Notificación global de prueba para todos los ciudadanos." end
    
    Notify(-1, {
        title = "Anuncio Global",
        description = msg,
        type = "primary",
        duration = 10000
    })
end, true)]]--

print("^2[mt-notify] ^7Lógica de servidor cargada correctamente.^7")
