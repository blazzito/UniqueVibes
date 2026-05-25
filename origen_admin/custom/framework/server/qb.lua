if Config.Framework ~= "qbcore" then return end
Framework = exports['qb-core']:GetCoreObject()

function FW_CreateCallback(...)
    Framework.Functions.CreateCallback(...)
end

function FW_CreateCallback(name, callback, mdw, mdwArgs)
    Framework.Functions.CreateCallback(name, function(source, cb1, ...)
        if mdw then
            local args = {...}
            mdw(source, cb1, function()
                callback(source, cb1, table.unpack(args))
            end, table.unpack(mdwArgs))
        else
            callback(source, cb1, ...)
        end
    end)
end

local oldHasPermission = Framework.Functions.HasPermission
Framework.Functions.HasPermission = function(source, permission)
    local aceAllowed = false
    if Config.PermissionSystem then
        oldHasPermission = IsPermissionValidSrc
    else
        aceAllowed = IsPlayerAceAllowed(source, 'command')
    end
    for _, v in pairs(Config.HighPermissions) do
        if oldHasPermission(source, v) or aceAllowed then
            return true, v
        end
    end
    return false, nil
end

function FW_GetPlayer(source)
    return Framework.Functions.GetPlayer(tonumber(source))
end

function FW_GetPlayerFromCitizenid(citizenid)
    return Framework.Functions.GetPlayerByCitizenId(citizenid) or Framework.Functions.GetOfflinePlayerByCitizenId(citizenid)
end

function FW_CreateUseableItem(...)
    Framework.Functions.CreateUseableItem(...)
end

function FW_CommandsAdd(name, help, arguments, argsrequired, callback, permission, ...)
    Framework.Commands.Add(name, help, arguments, argsrequired, callback, permission, ...)
end

exports('FW_CreateCallback', FW_CreateCallback)
exports("FW_GetPlayer", FW_GetPlayer)
exports("FW_GetPlayerFromCitizenid", FW_GetPlayerFromCitizenid)
exports("FW_CreateUseableItem", FW_CreateUseableItem)
exports("FW_CommandsAdd", FW_CommandsAdd)

exports('GetCoreObject', function()
    return Framework
end)

function IsPermissionValid(group)
    for _, v in pairs(Framework.Config.Server.Permissions) do
        if v == group then return true end
    end
    return false
end

for _, group in pairs(Config.PermissionList) do 
    if not IsPermissionValid(group) then 
        print("^3Looks like the group ^4" .. group .. " ^3is not defined in the qb-core config.lua, please add it to the qb-core/config.lua file ^0")
    end
end