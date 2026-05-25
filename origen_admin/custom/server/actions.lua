RegisterNetEventHookOrg("origen_admin:server:reviveAll", function()
    TriggerClientEvent("hospital:client:Revive", -1)
end, "AdminMenu:ReviveAll")

RegisterNetEventHookOrg("origen_admin:server:kill", function(targetId)
    if Config.AmbulanceSystem == "qb-ambulancejob" then 
        TriggerClientEvent('hospital:client:KillPlayer', targetId)
    elseif Config.AmbulanceSystem == "esx_ambulancejob" then 
        TriggerClientEvent('esx:killPlayer', targetId)
    elseif Config.AmbulanceSystem == "wasabi_ambulance" then 
        TriggerClientEvent('wasabi_ambulance:killPlayer', targetId)
    elseif Config.AmbulanceSystem == "default" then 
        ExecuteCommand("kill "..targetId)
    end
end, "AdminMenu:Kill")

RegisterNetEventHookOrg("origen_admin:server:reviveTarget", function(targetId)
    if Config.AmbulanceSystem == "qb-ambulancejob" then 
        TriggerClientEvent("hospital:client:Revive", targetId)
    elseif Config.AmbulanceSystem == "esx_ambulancejob" then 
        TriggerClientEvent("esx_ambulancejob:revive", targetId)
    elseif Config.AmbulanceSystem == "default" then 
        ExecuteCommand("revive "..targetId)
    elseif Config.AmbulanceSystem == "wasabi_ambulance" then 
        exports.wasabi_ambulance:RevivePlayer(targetId)
    end
end, "AdminMenu:Revive")

function SetGang(source, citizenid, gang, grade)
    if GetResourceState("origen_ilegal") == "started" then
        exports["origen_ilegal"]:setGang(source, gang, grade)
    end
end

function BanPlayerHandler(license, targetId, time, staffName, reason)
    -- This is only be executed if the custom ban system is enabled in the config/_framework.lua
end

function UnbanPlayerHandler(license)
    -- This is only be executed if the custom ban system is enabled in the config/_framework.lua
end

function IsbannedHandler(license)
    -- This is only be executed if the custom ban system is enabled in the config/_framework.lua
    -- Excepted return value: boolean(false) or table({banTime, expireTime, reason, staff})
end