local qbWeatherSync = GetResourceState('qb-weathersync') ~= 'missing'

FW_CreateCallback('origen_admin:server:IsTimeFreezed', function(source, cb, data)
    local timeFreeze = false
    if qbWeatherSync then
        timeFreeze = exports['qb-weathersync']:getTimeFreezeState()
    end
    cb(timeFreeze)
end)

FW_CreateCallback('origen_admin:server:IsWeatherFreezed', function(source, cb, data)
    local weatherFreeze = false
    if qbWeatherSync then
        weatherFreeze = exports['qb-weathersync']:getDynamicWeather()
    end
    cb(weatherFreeze)
end)

RegisterNetEventHookOrg("origen_admin:server:SetTimeFreezed", function(value, sync)
    if not sync then 
        TriggerClientEvent("origen_admin:client:SetFreezeTime", source, value)
    end
    if qbWeatherSync then
        return exports['qb-weathersync']:setTimeFreeze(value)
    end
end, "AdminMenu:FreezeTime")

RegisterNetEventHookOrg("origen_admin:server:SetWeatherFreezed", function(value, sync)
    if not sync then 
        TriggerClientEvent("origen_admin:client:SetFreezeWeather", source, value)
    end
    if qbWeatherSync then
        return exports['qb-weathersync']:setDynamicWeather(value)
    end
end, "AdminMenu:FreezeWeather")

RegisterNetEventHookOrg("origen_admin:server:SetWeather", function(weather)
    if qbWeatherSync then
        return exports['qb-weathersync']:setWeather(weather)
    end
end, "AdminMenu:SetWeather")