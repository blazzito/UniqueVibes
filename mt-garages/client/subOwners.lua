-- Sub-Owner/Co-Owner System for Vehicles

Citizen.CreateThread(function()
    -- Wait for Framework to initialize
    while Framework == nil do
        Wait(5)
    end
    
    -- Check if sub-owner system is enabled
    if Config.SubOwners.Allow then
        -- Register the sub-owner command
        RegisterCommand(Config.SubOwners.Command, function()
            -- Check if player has permission to use this command
            if not canOpenSubOwnerMenu() then
                return sendNotify(
                    TranslateIt("noAuth"),
                    "error",
                    5000
                )
            end
            
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local vehicle = GetVehiclePedIsUsing(playerPed)
            
            -- Check if player is in a vehicle
            if DoesEntityExist(vehicle) then
                -- Get and trim vehicle plate
                local plate = GetVehicleNumberPlateText(vehicle)
                plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace
                
                -- Get vehicle info and verify ownership
                Fr.TriggerServerCallback("mt-garages:getVehicleInfoForSubOwner", function(vehicleInfo)
                    if vehicleInfo then
                        -- Get nearby players
                        local closestPlayers = ScriptFunctions.GetClosestPlayers(10)
                        local closestPlayersList = {}
                        
                        -- Prepare UI data
                        local ownerData = {
                            plate = plate,
                            subOwnerName = vehicleInfo.co_owner_name or "",
                            subOwnerId = vehicleInfo.co_owner or "",
                            closestPlayers = closestPlayersList,
                            price = Config.SubOwners.Price
                        }
                        
                        -- If there are nearby players, fetch their names
                        if #closestPlayers > 0 then
                            Fr.TriggerServerCallback("mt-garages:fetchNearbyPlayersNames", function(playerNames)
                                ownerData.closestPlayers = playerNames
                                
                                -- Open UI
                                CurrentFrame = "setSubOwnerVisible"
                                SendReactMessage("setOwnerData", ownerData)
                                SetNuiFocus(true, true)
                                SendReactMessage(CurrentFrame, true)
                            end, closestPlayers)
                        else
                            -- No nearby players, open UI anyway
                            CurrentFrame = "setSubOwnerVisible"
                            SendReactMessage("setOwnerData", ownerData)
                            SetNuiFocus(true, true)
                            SendReactMessage(CurrentFrame, true)
                        end
                    else
                        -- Player is not the owner of this vehicle
                        sendNotify(
                            TranslateIt("not_owner"),
                            "error",
                            5000
                        )
                    end
                end, plate)
            else
                -- Player is not in a vehicle
                sendNotify(
                    TranslateIt("notInveh"),
                    "error",
                    5000
                )
            end
        end)
    end
end)