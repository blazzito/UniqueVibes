CurrentFrame = ""

-- Language confirmation callback
RegisterNUICallback("languageConfirmation", function(data, cb)
    cb(true)
    isUiLanguageLoaded = true
end)

-- Hide/close all UI frames
function hideFrame()
    if CurrentFrame == "" then
        CurrentFrame = "setGarageMenuVisible"
    end
    
    SetNuiFocus(false, false)
    SendReactMessage(CurrentFrame, false)
    SendReactMessage("setGarageMenuVisible", false)
    SendReactMessage("setAdminVisible", false)
    SendReactMessage("setImpoundMenuVisible", false)
    
    -- Clean up garage UI specific elements
    if CurrentFrame == "setGarageMenuVisible" then
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 1000, true, true)
        
        -- Delete preview vehicles
        if #CurrentVehicle > 0 then
            for _, vehicle in pairs(CurrentVehicle) do
                SH.fadeOutEntity(vehicle.spawned)
                Fr.DeleteVehicle(vehicle.spawned, true)
            end
        end
        
        BusyspinnerOff()
        inGarageUI = false
        isVehicleLoading = false
        CurrentTemporaryCoords = nil
        CurrentTemporaryHeading = nil
        
        Wait(400)
        
        BusyspinnerOff()
        isVehicleLoading = false
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 1000, true, true)
        
        -- Delete preview vehicles again
        if #CurrentVehicle > 0 then
            for _, vehicle in pairs(CurrentVehicle) do
                SH.fadeOutEntity(vehicle.spawned)
                Fr.DeleteVehicle(vehicle.spawned, true)
            end
        end
        
        CurrentVehicle = {}
        cam = nil
    end
    
    CurrentFrame = ""
    isInOpenGarageHere = false
    openGarageHereCoords = nil
    isInOpenGarageGang = false
    disablePreview = nil
end

-- Hide frame NUI callback
RegisterNUICallback("hideFrame", function(data, cb)
    hideFrame()
    cb({})
end)

-- Select car with debounce
local lastSelectTime = 0
RegisterNUICallback("selectCar", function(data, cb)
    -- Debounce check (500ms)
    if not data.skip then
        local currentTime = GetGameTimer()
        local timeDiff = currentTime - lastSelectTime
        
        if timeDiff < 500 then
            cb({ status = false })
            return
        end
        
        lastSelectTime = currentTime
    end
    
    cb({ status = true })
    selectCar(data.plate)
end)

-- Take out car from garage
RegisterNUICallback("mtgarages:takeOutCar", function(data, cb)
    if Config.Debug then
        print(data)
        print(json.encode(data))
    end
    
    takeOutCar(data.plate)
    cb(true)
end)

-- Transfer vehicle to another garage
RegisterNUICallback("transferVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:transferVehicle", function(success)
        if success == false then
            sendNotify(TranslateIt("no_money_2"), "error", 5000)
        else
            local updatedVehiclesList = {}
            local currentGarage = garages[tostring(currentGarageIndex)]
            
            if not currentGarage then
                currentGarage = {
                    Index = 0,
                    Label = "Garage",
                    Type = "car",
                    CenterOfZone = vec4(0.0, 0.0, 0.0, 0.0),
                    AccessPoint = vec4(0.0, 0.0, 0.0, 0.0),
                    Radius = 15,
                    IsPrivate = false,
                    PrivatePlayersList = {},
                    zPoints = { minZ = 0.0, maxZ = 0.0 },
                    blipDisabled = false,
                    onespawn = vec4(0.0, 0.0, 0.0, 0.0),
                    Gang = false,
                    Job = false
                }
            end
            
            -- Update vehicle list with new garage location
            for _, vehicle in pairs(garageVehiclesList) do
                if vehicle.plate == data.plate then
                    vehicle.garage = currentGarage.Label
                    vehicle.garageIndex = currentGarageIndex
                end
                table.insert(updatedVehiclesList, vehicle)
            end
            
            garageVehiclesList = updatedVehiclesList
        end
        
        cb({ status = success })
    end, data.plate, currentGarageIndex)
end)

-- Start impound process
RegisterNUICallback("startImpound", function(data, cb)
    local vehicleData = nil
    
    -- Find vehicle in impound list
    for _, vehicle in pairs(impoundVehiclesList) do
        if vehicle.plate == data.plate then
            vehicleData = vehicle
        end
    end
    
    if vehicleData then
        Fr.TriggerServerCallback("mt-garages:startImpound", function(networkId)
            if networkId == "no founds" then
                sendNotify(TranslateIt("no_money"), "error", 5000)
                cb({ status = false })
            else
                towingNowVehiclesList[data.plate] = true
                local vehicle = NetworkGetEntityFromNetworkId(tonumber(networkId))
                
                sendNotify(TranslateIt("checking_veh"), "info", 5000)
                Wait(Config.Misc.TowingTime * 1000)
                
                -- Check if vehicle is empty
                local canImpound = true
                if vehicle ~= 0 and GetVehicleNumberOfPassengers(vehicle) > 0 then
                    canImpound = false
                end
                
                if canImpound then
                    TriggerServerEvent("mt-garages:updateState", data.plate, tonumber(networkId))
                    sendNotify(TranslateIt("veh_impounded", data.plate), "success", 5000)
                    cb({ status = true })
                else
                    cb({ status = false })
                    sendNotify(TranslateIt("cant_impound"), "error", 5000)
                end
                
                towingNowVehiclesList[data.plate] = nil
            end
        end, vehicleData)
    else
        print("No vehicle data found in list")
    end
end)

-- Try to delete networked vehicle
function TryDeleteNetVehicle(networkId, timeout)
    timeout = timeout or 1500
    
    if not networkId then
        return false
    end
    
    local entity = NetworkGetEntityFromNetworkId(networkId)
    
    if entity == 0 then
        return false
    end
    
    NetworkRequestControlOfEntity(entity)
    local startTime = GetGameTimer()
    
    while not NetworkHasControlOfEntity(entity) do
        if GetGameTimer() - startTime > timeout then
            break
        end
        NetworkRequestControlOfEntity(entity)
        Wait(50)
    end
    
    if not NetworkHasControlOfEntity(entity) then
        return false
    end
    
    SetEntityAsMissionEntity(entity, true, true)
    
    if IsEntityAVehicle(entity) then
        Fr.DeleteVehicle(entity)
        if DoesEntityExist(entity) then
            SetVehicleAsNoLongerNeeded(entity)
            DeleteEntity(entity)
        end
    else
        DeleteEntity(entity)
    end
    
    return not DoesEntityExist(entity)
end

-- Confirm vehicle impound
RegisterNUICallback("confirmVehicleImpound", function(data, cb)
    cb(true)
    
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local vehicleCoords = GetEntityCoords(ivMenuVehicle)
    local distance = #(vehicleCoords - playerCoords)
    local currentVehicle = GetVehiclePedIsUsing(playerPed)
    
    -- Check distance
    if distance > 7.0 then
        return sendNotify(TranslateIt("notify_distancetohigh"), "error", 5000)
    end
    
    -- Check if vehicle is empty
    if GetVehicleNumberOfPassengers(ivMenuVehicle) > 0 and not currentVehicle then
        return sendNotify(TranslateIt("notify_vehicleMustBeEmpty"), "error", 5000)
    end
    
    data.data.netId = NetworkGetNetworkIdFromEntity(ivMenuVehicle)

    Fr.TriggerServerCallback("mt-garages:ivVehicle", function(success)
        if success == true then
            -- Exit vehicle if player is inside
            if ivMenuVehicle == currentVehicle then
                TaskLeaveVehicle(playerPed, currentVehicle, 1)
                while not IsVehicleSeatFree(currentVehicle, -1) do
                    Wait(100)
                end
            end
            
            SH.fadeOutEntity(ivMenuVehicle, false)
            ivMenuVehicle = nil
            sendNotify(TranslateIt("notify_towedSuccess"), "success", 5000)
        end
    end, data.data)
end)

-- Return vehicle to player
RegisterNUICallback("vehicleReturnToPlayer", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:returnToPlayer", function(success)
        cb({ status = success })
        
        if success == true then
            sendNotify(TranslateIt("notify_vehicleReturn_success"), "success", 5000)
        else
            sendNotify(TranslateIt("notify_vehicleReturn_error"), "error", 5000)
        end
    end, data.plate)
end)

-- Get current coordinates for marker
RegisterNUICallback("openCoordSelectionMarker", function(data, cb)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    
    if Config.Misc.Target == "none" then
        cb({
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z - 1.0,
                w = heading
            }
        })
    else
        cb({
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z,
                w = heading
            }
        })
    end
end)

-- Search players list
RegisterNUICallback("getSearchPlayersList", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:searchResult", function(result)
        cb(result)
    end, data.words)
end)

-- Create new garage location
RegisterNUICallback("createNewGarageLocation", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:CreateNewGarage", function(result)
        cb(result)
    end, data.data)
end)

-- Edit garage location
RegisterNUICallback("editGarageLocation", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:editGarageLocation", function(result)
        cb(result)
    end, data.data)
end)

-- Delete garage
RegisterNUICallback("deleteGarage", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:deleteGarage", function(result)
        cb(result)
    end, data.data)
end)

-- Create impound
RegisterNUICallback("createImpound", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:createImpound", function(result)
        cb(result)
    end, data.data)
end)

-- Edit impound
RegisterNUICallback("editImpound", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:editImpound", function(result)
        cb(result)
    end, data.data)
end)

-- Delete impound
RegisterNUICallback("deleteImpound", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:deleteImpound", function(result)
        cb(result)
    end, data.data)
end)

-- Create vehicle
RegisterNUICallback("createVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:createVehicle", function(result)
        cb(result)
    end, data.data)
end)

-- Edit vehicle
RegisterNUICallback("editVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:editVehicle", function(result)
        cb(result)
    end, data.data)
end)

-- Delete vehicle
RegisterNUICallback("deleteVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:deleteVehicle", function(result)
        cb(result)
    end, data.data)
end)

-- Create job vehicle
RegisterNUICallback("createJobVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:createJobVehicle", function(result)
        cb(result)
    end, data.data)
end)

-- Edit job vehicle
RegisterNUICallback("editJobVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:editJobVehicle", function(result)
        cb(result)
    end, data.data)
end)

-- Delete job vehicle
RegisterNUICallback("deleteJobVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:deleteJobVehicle", function(result)
        cb(result)
    end, data.data)
end)

-- Get vehicle properties from current vehicle
RegisterNUICallback("getVehicleProperties", function(data, cb)
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(playerPed)
    
    if DoesEntityExist(vehicle) then
        local properties = Fr.GetVehicleProperties(vehicle)
        properties.plate = nil
        properties.model = nil
        
        cb({
            status = true,
            properties = properties
        })
    else
        cb({ status = false })
    end
end)

-- Change vehicle plate
RegisterNUICallback("changePlate", function(data, cb)
    local playerPed = PlayerPedId()
    
    if plateChangeVehicle then
        Fr.TriggerServerCallback("mt-garages:plateChanger", function(success)
            if success == true then
                SetVehicleNumberPlateText(plateChangeVehicle, data.newPlate)
                sendNotify(TranslateIt("notify_SuccessPlateChanged"), "success", 5000)
            else
                sendNotify(TranslateIt("notify_ErrorPlateChanged"), "error", 5000)
            end
        end, data.newPlate, data.oldPlate, plateChangeVehicle)
    end
end)

-- Change vehicle keys event
RegisterNetEvent("mt-garages:changeKeys")
AddEventHandler("mt-garages:changeKeys", function(newPlate, oldPlate, vehicle, model)
    removeKeys(vehicle, model, oldPlate)
    giveKeys(vehicle, model, newPlate)
end)

-- Remove sub owner
RegisterNUICallback("removeSubOwner", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:removeSubOwner", function(result)
        cb(result)
    end, data.plate)
end)

-- Set new sub owner
RegisterNUICallback("setNewSubOwner", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:setNewSubOwner", function(result)
        cb(result)
        
        if result.status == false then
            sendNotify(TranslateIt("cantAfford_notify"), "error", 5000)
        end
    end, data.plate, data.id, data.value)
end)

-- Enter showroom
RegisterNUICallback("entershowroom", function(data, cb)
    if Config.Showrooms.Config.Enable then
        local garage = garages[tostring(currentGarageIndex)]
        
        if garage then
            -- Check if only private garages allowed
            if Config.Showrooms.Config.AllowOnlyInPrivateGarages then
                if not garage.IsPrivate then
                    return
                end
            end
            
            -- Get vehicles in this garage that are stored
            local showroomVehicles = {}
            for _, vehicle in pairs(garageVehiclesList) do
                if tostring(vehicle.garageIndex) == tostring(garage.Index) then
                    if vehicle.state == 0 then
                        table.insert(showroomVehicles, vehicle)
                    end
                end
            end
            
            if #showroomVehicles > 0 then
                cb({ status = true })
                openShowRoom(garage)
            else
                sendNotify(TranslateIt("noVehiclesTodisplay"), "error", 5000)
                cb({ status = false })
            end
        end
    end
end)

-- Create gang vehicle
RegisterNUICallback("createGangVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:createGangVehicle", function(result)
        cb(result)
    end, data.data)
end)

-- Edit gang vehicle
RegisterNUICallback("editGangVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:editGangVehicle", function(result)
        cb(result)
    end, data.data)
end)

-- Delete gang vehicle
RegisterNUICallback("deleteGangVehicle", function(data, cb)
    Fr.TriggerServerCallback("mt-garages:deleteGangVehicle", function(result)
        cb(result)
    end, data.data)
end)