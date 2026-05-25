_s = 1000
RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

local webhookURL = "https://discord.com/api/webhooks/1400374483029856257/1O8e8fAyRq-a3Qx6PHJ8lNXMBMmzoBXdjtgIWthaH0KkoyiDA12KXqNPIItvCzhjjKHJ"

function sendCommandToDiscord(name, command)
    local embedData = {
        {
            ["color"] = 16711680, -- Rojo
            ["title"] = "**Comando ejecutado**",
            ["description"] = "**Usuario:** " .. name .. "\n**Comando:** " .. command,
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %H:%M:%S"),
            }
        }
    }

    PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode({username = "Command Logs", embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

-- **Bloquear los anuncios de "Origen Admin"**
AddEventHandler('chatMessage', function(source, name, message)
    if name == "Origen Admin" or string.find(message, "Origen Admin") then
        CancelEvent()
    end
end)

--  **Mantener las sugerencias de comandos para clientes**
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()
        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or #message == 0 then return end
    local source = source
    TriggerClientEvent('qb-rpchat:sendLocalOOC', -1, source, GetPlayerName(source), message, "color-chat")
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(_s)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)
