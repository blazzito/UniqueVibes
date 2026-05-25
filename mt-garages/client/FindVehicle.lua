-- Function to find vehicle information by model hash
function FindVehicleByModel(modelHash)
    local modelString = tostring(modelHash)
    local displayName = GetDisplayNameFromVehicleModel(modelHash)
    
    -- Try to find vehicle data in multiple ways
    local vehicleData = vehicleslabels[modelString] or 
                        vehicleslabels[displayName] or 
                        vehicleslabels[string.lower(displayName)]
    
    -- Build result object
    local result = {}
    
    -- Set label (use vehicle data label or fallback to display name)
    if vehicleData and vehicleData.label then
        result.label = vehicleData.label
    else
        result.label = displayName
    end
    
    -- Set image (use vehicle data image or empty string)
    if vehicleData and vehicleData.image then
        result.img = vehicleData.image
    else
        result.img = ""
    end
    
    return result
end

-- Function to normalize vehicle health to a percentage (0-100)
function normalizeHealth(health)
    health = tonumber(health)
    
    -- Clamp health between -4000 and 1000
    local clampedHealth = math.max(-4000, math.min(health, 1000))
    
    -- Normalize to 0-100 percentage
    -- Formula: ((health + 4000) / 5000) * 100
    local normalizedHealth = ((clampedHealth + 4000) / 5000) * 100
    
    return normalizedHealth
end