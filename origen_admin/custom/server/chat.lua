function SendChatMessage(src, header, color, message)
    TriggerClientEvent('chatMessage', src, header, color, message)
end