Custom.GiveKeys = function(vehicle, plate)
    if not vehicle and not plate then
        return false
    end
    
    local plateToUse = plate or (DoesEntityExist(vehicle) and GetVehicleNumberPlateText(vehicle) or nil)
    if not plateToUse then
        return false
    end

    -- Integration with mt-carlock
    if GetResourceState('mt-carlock') == 'started' then
        exports['mt-carlock']:GiveKey(plateToUse)
    else
        -- Fallback to default event if mt-carlock is not found
        TriggerEvent('vehiclekeys:client:SetOwner', plateToUse)
    end
    
    return true
end