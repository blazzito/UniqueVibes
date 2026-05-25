local Utils = {}
local events = require "client.events"
local promiseId = nil

--- Used to send NUI events to the UI
--- @param action string
--- @param data any
function Utils.SendNUIEvent(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

RegisterNUICallback(events.Receive.resolveBaseUrl, function(url, cb)
	if not promiseId then return end
	promiseId:resolve(url)
	promiseId = nil
    cb(1)
end)

function Utils.GetMugShot()
	local ped = cache.ped
    local oldMask = GetPedDrawableVariation(ped, 1)
    local hasMask = oldMask ~= 0

    if hasMask then
        SetPedComponentVariation(ped, 1, 0, 0, 2)
    end

    local mugshot = nil
    
    -- Check if MugShotBase64 resource is started and use it
    if GetResourceState('MugShotBase64') == 'started' then
        mugshot = exports["MugShotBase64"]:GetMugShotBase64(ped, true)
    else
        -- Fallback to native method if MugShotBase64 is not available
        if promiseId then return end

        local headShotHandle = RegisterPedheadshotTransparent(ped) or RegisterPedheadshot_3(ped)
        if not lib.waitFor(function()
            if IsPedheadshotReady(headShotHandle) and IsPedheadshotValid(headShotHandle) then return true end
        end, 'couldn\'t load mugshot', 10000) then 
            if hasMask then SetPedComponentVariation(ped, 1, oldMask, GetPedTextureVariation(ped, 1), 2) end
            return 
        end

        local headShotTxd = GetPedheadshotTxdString(headShotHandle)
        Utils.SendNUIEvent(events.Send.requestBaseUrl, headShotTxd)
        UnregisterPedheadshot(headShotHandle)
        
        promiseId = promise.new()
        
        SetTimeout(2000, function()
            if promiseId then
                promiseId:resolve(nil)
                promiseId = nil
            end
        end)

        mugshot = Citizen.Await(promiseId)
    end

    if hasMask then
        SetPedComponentVariation(ped, 1, oldMask, GetPedTextureVariation(ped, 1), 2)
    end

    return mugshot
end

function Utils.GetPlayerLookingAt()
    local config = require "shared.config"
    local playerId, entity = lib.getClosestPlayer(GetEntityCoords(cache.ped), config.range)

	if not playerId or not entity or not IsPedAPlayer(entity) then return end
	return GetPlayerServerId(playerId)
end

return Utils
