--[[
    Resource: mt-rpchat
    File: sv_globalcoms.lua
    Description: Server-side logic for global chat commands (Twitter, PD, EMS, etc.)
]]

local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--- Handle local OOC chat messages
-- @param source number
-- @param name string
-- @param message string
AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, string.len('/')) ~= '/' then
        CancelEvent()
        TriggerClientEvent('qb-rpchat:sendLocalOOC', -1, source, GetPlayerName(source), message, "color-chat");
    end
end)

--- Clear client chat
-- @param xPlayer table
-- @param args table
-- @param showError function
ESX.RegisterCommand('clear', 'user', function(xPlayer, args, showError)
    TriggerClientEvent('chat:clear', xPlayer.source)
end, false, { help = 'Clear Chat' })

--- Clear chat for all players
-- @param xPlayer table
-- @param args table
-- @param showError function
ESX.RegisterCommand('clearall', 'admin', function(xPlayer, args, showError)
    TriggerClientEvent('chat:clear', -1)
end, false, { help = 'Clear All Chat(Admin Only)' })

--- Twitter command
-- @param source number
-- @param args table
-- @param rawCommand string
RegisterCommand('twt', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local firstname = xPlayer.get('firstName') or "Nombre"
    local lastname = xPlayer.get('lastName') or "Apellido"
    local firstSurname = lastname:match("^(%S+)") or lastname

    local message = table.concat(args, " ")
    local playerId = source
    local colorClass = "color-twt"

    -- We send the message using the NUI's shared template system
    -- args[0] = handle, args[1] = colorClass, args[2] = message
    TriggerClientEvent('chat:addMessage', -1, {
        template = '{2}',
        args = { firstname:lower() .. firstSurname:lower(), colorClass, message },
        senderId = source
    })
end, false)

--- Anonymous command
-- @param source number
-- @param args table
-- @param rawCommand string
RegisterCommand('anon', function(source, args, rawCommand)
    local message = table.concat(args, " ")
    local colorClass = "color-anon"

    TriggerClientEvent('chat:addMessage', -1, {
        template = '{2}',
        args = { "ANONIMO", "color-anon", message },
        senderId = source
    })
end, false)

--- Police department command
-- @param source number
-- @param args table
-- @param rawCommand string
RegisterCommand('pd', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if xPlayer.job.name ~= "police" then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="color:red;">Solo el personal policial puede usar este comando.</div>',
            args = {}
        })
        return
    end

    local message = table.concat(args, " ")
    local colorClass = "color-pd"

    TriggerClientEvent('chat:addMessage', -1, {
        template = '{2}',
        args = { "POLICE", colorClass, message },
        senderId = source
    })
end, false)

--- EMS command
-- @param source number
-- @param args table
-- @param rawCommand string
RegisterCommand('ems', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if xPlayer.job.name ~= "ambulance" then
        TriggerClientEvent('chat:addMessage', source, {
            template = 'Solo el personal de ambulancia puede usar este comando.',
            args = {}
        })
        return
    end

    local message = table.concat(args, " ")
    local colorClass = "color-ems"

    TriggerClientEvent('chat:addMessage', -1, {
        template = '{2}',
        args = { "EMS", colorClass, message },
        senderId = source
    })
end, false)

--- Mechanic command
-- @param source number
-- @param args table
-- @param rawCommand string
RegisterCommand('mec', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if xPlayer.job.name ~= "mechanic" then
        TriggerClientEvent('chat:addMessage', source, {
             template = 'Solo los mecánicos pueden usar este comando',
             args = {}
        })
        return
    end

    local message = table.concat(args, " ")
    local colorClass = "color-mec"

    TriggerClientEvent('chat:addMessage', -1, {
        template = '{2}',
        args = { "mecanico", colorClass, message },
        senderId = source
    })
end, false)

--- Roll dice command
-- @param source number
-- @param args table
-- @param user table
RegisterCommand('dados', function(source, args, user)
    local name = GetCharacterName(source)
    num = math.random(1, 10)
    TriggerClientEvent("qb-rpchat:sendDados", -1, source, name, num, table.concat(args, " "))
end, false)

--- Local OOC command
-- @param source number
-- @param args table
-- @param raw string
RegisterCommand('ooc', function(source, args, raw)
    if source == 0 then
        print('mt-rpchat: you can\'t use this command from rcon!')
        return
    end
    args = table.concat(args, ' ')
    TriggerClientEvent('qb-rpchat:sendLocalOOC', -1, source, GetPlayerName(source), args, "color-ooc")
end)

local actionCooldowns = {}

RegisterCommand('me', function(source, args, rawCommand)
    local currentTime = os.time()
    if actionCooldowns[source] and (currentTime - actionCooldowns[source]) < 5 then
        local timeLeft = 5 - (currentTime - actionCooldowns[source])
        TriggerClientEvent('chat:addMessage', source, {
            template = '{2}',
            color = { 255, 0, 0 },
            multiline = true,
            args = { "SISTEMA", "color-system", "Debes esperar " .. timeLeft .. " segundos antes de usar otro comando de acción." }
        })
        return
    end

    local message = table.concat(args, " ")
    local playerName = GetCharacterName(source)
    local nearbyPlayers = GetPlayersInArea(source, 7.0)

    actionCooldowns[source] = currentTime

    for _, playerId in ipairs(nearbyPlayers) do
        TriggerClientEvent('mt-rpchat:onMeDo', playerId, source, message, 'me', playerName)

        if Config.MeDoChat then
            local colorClass = "color-me"

            TriggerClientEvent('chat:addMessage', playerId, {
                template = '{2}',
                args = { "ME", colorClass, message },
                senderId = source
            })
        end
    end
end, false)

RegisterCommand('do', function(source, args, rawCommand)
    local currentTime = os.time()
    if actionCooldowns[source] and (currentTime - actionCooldowns[source]) < 5 then
        local timeLeft = 5 - (currentTime - actionCooldowns[source])
        TriggerClientEvent('chat:addMessage', source, {
            template = '{2}',
            color = { 255, 0, 0 },
            multiline = true,
            args = { "SISTEMA", "color-system", "Debes esperar " .. timeLeft .. " segundos antes de usar otro comando de acción." }
        })
        return
    end

    local message = table.concat(args, " ")
    local playerName = GetCharacterName(source)
    local nearbyPlayers = GetPlayersInArea(source, 7.0)

    actionCooldowns[source] = currentTime

    for _, playerId in ipairs(nearbyPlayers) do
        TriggerClientEvent('mt-rpchat:onMeDo', playerId, source, message, 'do', playerName)

        if Config.MeDoChat then
            local colorClass = "color-do"

            TriggerClientEvent('chat:addMessage', playerId, {
                template = '{2}',
                args = { "DO", colorClass, message },
                senderId = source
            })
        end
    end
end, false)
-- @param source number
-- @param args table
-- @param rawCommand string
RegisterCommand('anuncio', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local playerId = source
    local jobName = string.upper(xPlayer.job.label or "DESCONOCIDO")
    local message = table.concat(args, " ")
    local colorClass = "color-announcement"

    TriggerClientEvent('chat:addMessage', -1, {
        template = '{2}',
        args = { "ANUNCIO - " .. jobName, colorClass, message },
        senderId = source
    })
end, false)

--- Admin notice command
-- @param source number
-- @param args table
-- @param rawCommand string
RegisterCommand('aviso', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if xPlayer.getGroup() == "user" then
        TriggerClientEvent('esx:showNotification', source, "No tienes permiso para usar este comando.")
        return
    end

    local playerId = source
    local message = table.concat(args, " ")
    local colorClass = "color-admin"

    TriggerClientEvent('chat:addMessage', -1, {
        template = '{2}',
        args = { "administración", colorClass, message },
        senderId = source
    })
end, false)

RegisterCommand('s', function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if xPlayer.getGroup() == "user" then
        TriggerClientEvent('esx:showNotification', source, "No tienes permiso para usar este comando.")
        return
    end

    local message = table.concat(args, " ")
    local players = ESX.GetPlayers()

    for i=1, #players, 1 do
        local targetPlayer = ESX.GetPlayerFromId(players[i])
        if targetPlayer and targetPlayer.getGroup() ~= "user" then
            TriggerClientEvent('chat:addMessage', players[i], {
                template = '{2}',
                args = { GetPlayerName(source), "color-staff", message },
                senderId = source
            })
        end
    end
end, false)


