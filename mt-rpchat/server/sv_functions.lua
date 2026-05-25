
local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetCharacterName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        return xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName')
    end
    return GetPlayerName(source)
end

function GetPlayerName2(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        return xPlayer.get('firstName')
    end
    return GetPlayerName(source)
end
function GetPlayerNameSteam(source)
	return GetPlayerName(source)
end
function GetLastName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        return xPlayer.get('lastName')
    end
    return ""
end

function GetJobName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        return xPlayer.job.label
    end
    return "Desconocido"
end

function GetPlayersInArea(source, radius)
    local players = {}
    local coords = GetEntityCoords(GetPlayerPed(source))

    for _, playerId in ipairs(GetPlayers()) do
        local targetCoords = GetEntityCoords(GetPlayerPed(playerId))
        local dist = #(coords - targetCoords)

        if dist <= radius then
            table.insert(players, playerId)
        end
    end

    return players
end