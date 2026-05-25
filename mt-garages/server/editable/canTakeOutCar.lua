---@diagnostic disable: lowercase-global
--- function to check if vehicle can be taken out or not
--- Useful for some custom VIP Scripts etc.
--- Return true if player can take out vehicle, false if not.
function canTakeOutCar(source, plate, vehicleData)
    -- Add your custom logic here
    -- Example:
    -- local player = Fr.getPlayerFromId(source)
    -- if player.getGroup() == 'user' then
    --     return false, "Only VIPs can take out vehicles from this garage!"
    -- end

    return true
end

-- Export the function
exports('canTakeOutCar', canTakeOutCar)
