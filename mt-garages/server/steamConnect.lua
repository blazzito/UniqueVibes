-- Get Steam ID64 from player identifiers
function GetSteamID64(source)
    for _, identifier in ipairs(GetPlayerIdentifiers(source)) do
        -- Check if identifier starts with "steam:"
        if string.sub(identifier, 1, 6) == "steam:" then
            -- Extract the Steam ID (after "steam:") and convert from hex to decimal
            return tonumber(string.sub(identifier, 7), 16)
        end
    end
    
    return nil
end

-- Get player's Steam avatar URL
function GetSteamAvatar(source, callback)
    local steamID64 = GetSteamID64(source)
    local apiKey = ServerConfig.SteamApiKey
    
    -- Build Steam API URL
    local url = string.format(
        "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v2/?key=%s&steamids=%s",
        apiKey,
        steamID64
    )
    
    -- Make HTTP request to Steam API
    PerformHttpRequest(url, function(statusCode, response, headers)
        if statusCode == 200 then
            local data = json.decode(response)
            
            -- Check if response has valid player data
            if data.response and data.response.players and #data.response.players > 0 then
                local avatarUrl = data.response.players[1].avatarfull
                callback(avatarUrl)
            else
                -- Return default avatar if no Steam data found
                callback("https://r2.fivemanage.com/5nOEpfNnpHW9tfpLTFBoV/UNVLogo.png")
            end
        else
            -- Return default avatar on API error
            callback("hhttps://r2.fivemanage.com/5nOEpfNnpHW9tfpLTFBoV/UNVLogo.png")
        end
    end, "GET", "", {})
end