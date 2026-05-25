-- Impound system variables
createdImpounds = {}
isInImpoundZone = false
isInImpoundUI = false
currentImpoundIndex = 0
impoundVehiclesList = {}
towingNowVehiclesList = {}

-- Event: Register a new impound location
RegisterNetEvent("mt-garages:registerNewLocationImpound", function(impoundData)
    impounds[tostring(impoundData.Index)] = impoundData
    reloadImpounds()
end)

-- Event: Edit an existing impound location
RegisterNetEvent("mt-garages:editLocationImpound", function(impoundData)
    impounds[tostring(impoundData.Index)] = impoundData
    reloadImpounds()
end)

-- Event: Delete an impound location
RegisterNetEvent("mt-garages:deleteLocationImpound", function(impoundIndex)
    impounds[tostring(impoundIndex)] = nil
    reloadImpounds()
end)

-- Function to reload all impounds (removes old ones and loads new ones)
function reloadImpounds()
    hideTextUI()
    
    -- Remove all existing impound blips and markers
    for _, impound in pairs(createdImpounds) do
        -- Remove blip if it exists
        if impound.Blip and DoesBlipExist(impound.Blip) then
            RemoveBlip(impound.Blip)
        end
        
        -- Remove marker if it exists
        if impound.Created then
            SH.RemoveMarkedCoords(impound.Created)
        end
    end
    
    -- Clear the createdImpounds table
    createdImpounds = {}
    
    loadImpounds()
end

-- Function to load all impound locations
function loadImpounds()
    -- Wait for Framework to initialize
    while Framework == nil do
        Wait(5)
    end
    
    -- Iterate through all impounds
    for _, impoundData in pairs(impounds) do
        local impoundIndexStr = tostring(impoundData.Index)
        createdImpounds[impoundIndexStr] = {}
        
        local coords = vec3(impoundData.Coords.x, impoundData.Coords.y, impoundData.Coords.z)
        
        -- Create blip if not disabled
        if not impoundData.blipDisabled then
            createdImpounds[impoundIndexStr].Blip = SH.addBlip(
                coords,
                Config.Blips.impound.blipId,
                Config.Blips.impound.blipColor,
                TranslateIt("blip_impound", impoundData.Label)
            )
        end
        
        -- Setup target data
        local targetData = {
            name = "impound_" .. impoundData.Index,
            label = TranslateIt("additionalTargetData_impound", impoundData.Label),
            icon = Config.Misc.Icons.impound
        }
        
        -- Setup ped if enabled
        local ped = false
        if Config.Misc.Peds.Toggle and Config.Misc.Peds.impound then
            ped = Config.Misc.Peds.impound
            if ped then
                ped.heading = impoundData.Coords.w
            end
        end
        
        -- Create interaction marker
        createdImpounds[impoundIndexStr].Created = SH.MarkNewCoords(
            coords,
            true,
            {},
            ped,
            function() -- onExit
                hideTextUI("mt-garages-impound-" .. impoundData.Index)
            end,
            function() -- onInteract
                currentImpoundIndex = impoundData.Index
                isInImpoundZone = true
                openImpound(impoundData.Index)
            end,
            targetData,
            function(ped) -- onEnter
                showTextUI(TranslateIt("header_type_impound"), coords, "mt-garages-impound-" .. impoundData.Index, "3d", ped)
                isInImpoundZone = false
            end
        )
    end
end

-- Function to fix/validate numeric values
function FixValue(value, defaultValue)
    value = tonumber(value)
    
    -- Check if value is nil or NaN
    if not value or value ~= value then
        return defaultValue
    end
    
    return value
end

-- Function to get simplified vehicle type based on class
function GetVehicleTypeSimple(vehicleModel)
    -- Convert string to hash if needed
    local modelHash = vehicleModel
    if type(vehicleModel) == "string" then
        modelHash = GetHashKey(vehicleModel) or vehicleModel
    end
    
    local vehicleClass = GetVehicleClassFromName(modelHash)
    
    -- Define vehicle class mappings
    local carClasses = {
        [0] = true,  -- Compacts
        [1] = true,  -- Sedans
        [2] = true,  -- SUVs
        [3] = true,  -- Coupes
        [4] = true,  -- Muscle
        [5] = true,  -- Sports Classics
        [6] = true,  -- Sports
        [9] = true,  -- Off-road
        [10] = true, -- Industrial
        [11] = true, -- Utility
        [12] = true, -- Vans
        [17] = true, -- Service
        [18] = true, -- Emergency
        [19] = true, -- Military
        [20] = true  -- Commercial
    }
    
    local airClasses = {
        [15] = true, -- Helicopters
        [16] = true  -- Planes
    }
    
    local seaClasses = {
        [14] = true  -- Boats
    }
    
    -- Return vehicle type
    if carClasses[vehicleClass] then
        return "car"
    elseif airClasses[vehicleClass] then
        return "air"
    elseif seaClasses[vehicleClass] then
        return "sea"
    else
        return "car" -- Default to car
    end
end

-- Function to open impound UI and display vehicles
function openImpound(impoundIndex)
    local impoundData = impounds[tostring(impoundIndex)]
    
    Fr.TriggerServerCallback("mt-garages:getVehicles", function(vehicles)
        isInImpoundUI = true
        
        local vehicleList = {}
        local playerData = Fr.GetPlayerData()
        local playerId = trim(playerData[Fr.identificatorTable])
        
        -- Process each vehicle
        for _, vehicle in pairs(vehicles) do
            -- Check if vehicle is stored or impounded
            if vehicle[Fr.StoredTable] == 1 or vehicle[Fr.StoredTable] == 2 or vehicle.isTowedOut then
                -- Decode vehicle data
                local vehicleEncodedData = json.decode(vehicle[Fr.VehicleEncode])
                
                -- Handle double-encoded JSON
                if type(vehicleEncodedData) ~= "table" then
                    vehicleEncodedData = json.decode(vehicleEncodedData)
                end
                
                if vehicleEncodedData then
                    -- Fix/validate vehicle stats
                    vehicleEncodedData.engineHealth = FixValue(vehicleEncodedData.engineHealth, 1000)
                    vehicleEncodedData.bodyHealth = FixValue(vehicleEncodedData.bodyHealth, 1000)
                    vehicleEncodedData.fuelLevel = FixValue(vehicleEncodedData.fuelLevel, 100)
                    
                    local vehicleType = GetVehicleTypeSimple(vehicleEncodedData.model)
                    
                    -- Check if vehicle type matches impound type
                    if impoundData.Type == vehicleType then
                        local vehicleInfo = FindVehicleByModel(vehicleEncodedData.model or "")
                        
                        -- Get impound location data
                        local vehicleImpoundLocation = impounds[tostring(vehicle.vehicleImpound)] or impoundData
                        
                        -- Check ownership
                        local notOwned = false
                        local ownerName = ""
                        
                        if playerId ~= vehicle[Fr.OwnerTable] then
                            if vehicle.job ~= jobName or vehicle.job == "" then
                                if vehicle.gang ~= gangName or vehicle.gang == "" then
                                    notOwned = true
                                    ownerName = vehicle.ownerName
                                end
                            end
                        end
                        
                        -- Determine vehicle state
                        local state = vehicle[Fr.StoredTable]
                        if vehicle.isTowedOut then
                            state = 1
                        end
                        
                        -- Build vehicle entry
                        local vehicleEntry = {
                            label = vehicleInfo.label,
                            plate = vehicle.plate,
                            state = state,
                            img = "",
                            fuelLevel = math.floor(vehicleEncodedData.fuelLevel or 100.5),
                            enigneLevel = math.floor(normalizeHealth(vehicleEncodedData.engineHealth or 1000) + 0.5),
                            bodyLevel = math.floor(normalizeHealth(vehicleEncodedData.bodyHealth or 1000) + 0.5),
                            isTowedOut = vehicle.isTowedOut,
                            towedOutBy = vehicle.towedOutBy,
                            towedToDate = vehicle.towedToDate,
                            towedPrice = vehicle.towedPrice,
                            towedAfterPrice = vehicle.towedAfterPrice,
                            retrievable = vehicle.retrievable,
                            isTowingNow = towingNowVehiclesList[vehicle.plate] or false,
                            reason = vehicle.impoundReason,
                            towData = {
                                index = vehicleImpoundLocation.Index,
                                label = vehicleImpoundLocation.Label,
                                impoundType = vehicleImpoundLocation.Type
                            },
                            notOwned = notOwned,
                            ownerName = ownerName
                        }
                        
                        table.insert(vehicleList, vehicleEntry)
                    end
                end
            end
        end
        
        -- Prepare UI data
        local uiData = {
            impoundIndex = impoundIndex,
            impoundName = impoundData.Label,
            impoundType = impoundData.Type,
            impoundPrice = Config.Misc.TowingPrice,
            impoundTime = 0,
            vehicles = vehicleList
        }
        
        impoundVehiclesList = vehicleList
        
        -- Open UI
        SendReactMessage("setImpoundData", uiData)
        SetNuiFocus(true, true)
        CurrentFrame = "setImpoundMenuVisible"
        SendReactMessage(CurrentFrame, true)
        
    end, tostring(impoundIndex), true)
end