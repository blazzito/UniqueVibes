local ESX = exports['es_extended']:getSharedObject()

-- Registrar el item como usable en ESX/ox_inventory
ESX.RegisterUsableItem(Config.ItemName, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        -- Enviar evento al cliente para abrir la radio
        TriggerClientEvent('unique_radio:client:openRadio', source, xPlayer.job.name)
    end
end)

-- Callback para validar el trabajo del jugador antes de entrar a un canal restringido
ESX.RegisterServerCallback('unique_radio:server:checkRadioAccess', function(source, cb, channel)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        cb(false)
        return
    end

    local hasAccess = false
    local isRestricted = false

    for _, data in ipairs(Config.RestrictedChannels) do
        if data.channel == channel then
            isRestricted = true
            for _, job in ipairs(data.jobs) do
                if xPlayer.job.name == job then
                    hasAccess = true
                    break
                end
            end
            break
        end
    end

    if isRestricted then
        cb(hasAccess)
    else
        cb(true) -- Si no es un canal restringido (ej. un canal publico > 100) siempre tienen acceso
    end
end)
