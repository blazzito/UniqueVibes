local ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('unique_escape_menu:getStats', function(source, cb)
    local players = ESX.GetExtendedPlayers()
    local online = #players
    local policeReady = false
    local emsReady = false
    local adminReady = false

    for _, xPlayer in ipairs(players) do
        -- Verificación Policía
        if xPlayer.job.name == 'police' then
            -- Si 'onduty' es nil (ESX estándar), cuenta como true. Si es explicítamente false, no lo cuenta.
            if xPlayer.job.onduty ~= false then
                policeReady = true
            end
        end

        -- Verificación EMS
        if xPlayer.job.name == 'ambulance' then
            if xPlayer.job.onduty ~= false then
                emsReady = true
            end
        end

        -- Verificación Admin
        local group = xPlayer.getGroup()
        if group == 'admin' or group == 'superadmin' or group == 'mod' then
            adminReady = true
        end
    end

    cb({
        online = online,
        police = policeReady,
        ems = emsReady,
        admin = adminReady
    })
end)
