if not Config.Debug then return end

-- This command is to check if the player has permissions
RegisterCommand("testpermission", function(source, args, rawCommand)
    local hasPerms, group = Framework.Functions.HasPermission(source)
    print("Player ID: " .. source .. ", Has Permission: " .. tostring(hasPerms) .. ", Group: " .. (group or "None"))
end)