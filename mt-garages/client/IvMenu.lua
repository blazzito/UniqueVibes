-- Impounding Vehicle Menu System

ivMenuVehicle = nil

Citizen.CreateThread(function()
    -- Wait for Framework to initialize
    while Framework == nil do
        Wait(5)
    end
    
    -- Register the impounding command
    RegisterCommand(Config.IV.commandName, function()
        TriggerEvent("mt-garages:openImpoundingMenu")
    end)
    
    -- Event: Open impounding menu
    RegisterNetEvent("mt-garages:openImpoundingMenu", function()
        -- Check if player's job is authorized
        if Config.IV.jobsList[jobName] then
            -- Check if player's grade meets minimum requirement
            if Config.IV.jobsList[jobName] <= jobGrade then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                
                -- Find closest vehicle within 5 units
                local closestVehicle = GetClosestVehicle(
                    playerCoords.x, 
                    playerCoords.y, 
                    playerCoords.z, 
                    5.0, 
                    0, 
                    70
                )
                
                -- If no vehicle nearby, check if player is in a vehicle
                if not DoesEntityExist(closestVehicle) then
                    closestVehicle = GetVehiclePedIsUsing(playerPed)
                end
                
                -- Verify vehicle exists
                if DoesEntityExist(closestVehicle) then
                    ivMenuVehicle = closestVehicle
                    
                    -- Get and trim vehicle plate
                    local plate = GetVehicleNumberPlateText(closestVehicle)
                    plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace
                    
                    -- Get vehicle type
                    local vehicleType = GetVehicleType(closestVehicle)
                    local vehicleTypeSimple = vehTypes[vehicleType]
                    
                    -- Build list of available impound locations for this vehicle type
                    local availableImpounds = {}
                    
                    for _, impoundData in pairs(impounds) do
                        -- Check if impound accepts this vehicle type
                        if impoundData.Type == vehicleTypeSimple then
                            local isJobAllowed = false
                            
                            -- Check if player's job is allowed at this impound
                            if impoundData.AllowedJobs then
                                for _, allowedJob in pairs(impoundData.AllowedJobs) do
                                    if allowedJob == jobName then
                                        isJobAllowed = true
                                    end
                                end
                            end
                            
                            -- Add to list if job is allowed
                            if isJobAllowed then
                                table.insert(availableImpounds, {
                                    label = impoundData.Label,
                                    value = impoundData.Index
                                })
                            end
                        end
                    end
                    
                    -- Check if any impound locations available
                    if #availableImpounds < 1 then
                        return sendNotify(
                            TranslateIt("notify_noimpoundlocations"), 
                            "error", 
                            5000
                        )
                    end
                    
                    -- Prepare UI data
                    CurrentFrame = "setIvMenuVisible"
                    
                    local menuData = {
                        nearbyVehiclePlate = plate,
                        playerJob = jobName,
                        availableImpSpots = availableImpounds,
                        type = vehicleTypeSimple,
                        timeOptions = Config.IV.timeOptions,
                        allowPriceAfter = Config.IV.allowPriceAfterImpoundDate,
                        allowPriceBefore = Config.IV.allowPriceBeforeImpoundDate,
                        priceAfterMax = Config.IV.maxPriceAfterImpoundDate,
                        priceBeforeMax = Config.IV.maxPriceBeforeImpoundDate
                    }
                    
                    -- Open UI
                    SendReactMessage("setIvData", menuData)
                    SetNuiFocus(true, true)
                    SendReactMessage(CurrentFrame, true)
                else
                    -- No vehicle nearby
                    sendNotify(
                        TranslateIt("notify_nocarnearby"), 
                        "error", 
                        5000
                    )
                end
            end
        else
            -- Player's job not authorized
            print("Not allowed")
        end
    end)
end)