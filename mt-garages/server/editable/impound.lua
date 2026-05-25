--- function to check if vehicle can be taken out or not
--- Useful for some custom VIP Scripts etc.
--- Return true if player can take out vehicle, false if not.

function onVehicleTowedByFraction(source, plate, vehicleData)
    -- This function is called when a vehicle is towed and sent to impound by a job (police/mechanic)
    -- source = ID of the player who impounded the vehicle
    -- plate = Plate of the vehicle
    -- vehicleData = All vehicle data from database
    
    -- Example:
    -- print("Vehicle " .. plate .. " was impounded by " .. GetPlayerName(source))
end

function onVehicleImpoundedBack(source, plate, vehicleData)
    -- This function is called when a player pays the fee and retrieves their vehicle from the impound
    -- source = ID of the player who retrieved the vehicle
    -- plate = Plate of the vehicle
    -- vehicleData = All vehicle data from database
    
    -- Example:
    -- print("Vehicle " .. plate .. " was retrieved from impound by " .. GetPlayerName(source))
end

-- Exports
exports('onVehicleTowedByFraction', onVehicleTowedByFraction)
exports('onVehicleImpoundedBack', onVehicleImpoundedBack)
