-- Vehicle Showroom System

-- Showroom state variables
garageBeforeShowroom = nil
isInShowRoom = false
createdVehiclesInShowroom = {}
playerCoordsBefore = nil
showRoomTarget_car = nil
showRoomTarget_air = nil
showRoomTarget_sea = nil

Citizen.CreateThread(function()
    -- Wait for Framework to initialize
    while Framework == nil do
        Wait(5)
    end
    
    -- Function to add exit marker for showroom
    function addTargetForShowRoom(vehicleType)
        if vehicleType == "car" then
            if Config.Showrooms.car then
                local targetData = {
                    name = "showroom_leave_car",
                    label = TranslateIt("leaveshowroom"),
                    icon = Config.Misc.Icons.showroom,
                    maxDistance = false
                }
                
                showRoomTarget_car = SH.MarkNewCoords(
                    Config.Showrooms.car.EntranceCoords,
                    true,
                    {},
                    false,
                    function() -- onExit
                        hideTextUI()
                    end,
                    function() -- onInteract
                        leaveShowRoom()
                    end,
                    targetData,
                    function() -- onEnter
                        showTextUI(TranslateIt("leaveshowroom"), Config.Showrooms.car.EntranceCoords)
                    end
                )
            end
        elseif vehicleType == "sea" then
            if Config.Showrooms.sea then
                local targetData = {
                    name = "showroom_leave_car",
                    label = TranslateIt("leaveshowroom"),
                    icon = Config.Misc.Icons.showroom,
                    maxDistance = false
                }
                
                showRoomTarget_sea = SH.MarkNewCoords(
                    Config.Showrooms.sea.EntranceCoords,
                    true,
                    {},
                    false,
                    function() -- onExit
                        hideTextUI()
                    end,
                    function() -- onInteract
                        leaveShowRoom()
                    end,
                    targetData,
                    function() -- onEnter
                        showTextUI(TranslateIt("leaveshowroom"), Config.Showrooms.sea.EntranceCoords)
                    end
                )
            end
        elseif vehicleType == "air" then
            if Config.Showrooms.air then
                local targetData = {
                    name = "showroom_leave_car",
                    label = TranslateIt("leaveshowroom"),
                    icon = Config.Misc.Icons.showroom,
                    maxDistance = false
                }
                
                showRoomTarget_air = SH.MarkNewCoords(
                    Config.Showrooms.air.EntranceCoords,
                    true,
                    {},
                    false,
                    function() -- onExit
                        hideTextUI()
                    end,
                    function() -- onInteract
                        leaveShowRoom()
                    end,
                    targetData,
                    function() -- onEnter
                        showTextUI(TranslateIt("leaveshowroom"), Config.Showrooms.air.EntranceCoords)
                    end
                )
            end
        end
    end
    
    -- Function to remove showroom exit marker
    function removeTargetForShowRoom()
        if showRoomTarget_car then
            SH.RemoveMarkedCoords(showRoomTarget_car)
            showRoomTarget_car = nil
        elseif showRoomTarget_sea then
            SH.RemoveMarkedCoords(showRoomTarget_sea)
            showRoomTarget_sea = nil
        elseif showRoomTarget_air then
            SH.RemoveMarkedCoords(showRoomTarget_air)
            showRoomTarget_air = nil
        end
    end
    
    -- Function to open showroom
    function openShowRoom(garageData)
        if garageData then
            garageBeforeShowroom = garageData
            isInShowRoom = true
            
            -- Fade out screen
            DoScreenFadeOut(400)
            Wait(1000)
            
            -- Enter solo session (routing bucket)
            TriggerServerEvent("mt-garages:soloSession")
            
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            playerCoordsBefore = coords
            
            -- Save player position with heading
            playerCoordsBefore = vec4(
                playerCoordsBefore.x,
                playerCoordsBefore.y,
                playerCoordsBefore.z,
                GetEntityHeading(playerPed)
            )
            
            -- Verify showroom config exists
            if not Config.Showrooms[garageData.Type] then
                Wait(500)
                DoScreenFadeIn(400)
                return print("No config found for showroom: " .. garageData.Type)
            end
            
            -- Add exit marker
            addTargetForShowRoom(garageData.Type)
            
            -- Teleport player to showroom entrance
            SetEntityCoords(
                playerPed,
                Config.Showrooms[garageData.Type].EntranceCoords.xyz,
                false, false, false, true
            )
            SetEntityHeading(playerPed, Config.Showrooms[garageData.Type].EntranceCoords.w)
            
            -- Build list of vehicles to display
            carsInShowRoom = {}
            local vehiclesToDisplay = {}
            
            for _, vehicle in pairs(garageVehiclesList) do
                -- Check if vehicle belongs to this garage and is stored
                if tostring(vehicle.garageIndex) == tostring(garageData.Index) then
                    if vehicle.state == 0 then -- Only stored vehicles
                        table.insert(vehiclesToDisplay, vehicle)
                    end
                end
            end
            
            -- Calculate how many vehicles to spawn
            local maxSlots = #Config.Showrooms[garageData.Type].ParkingSlots
            local vehicleCount = math.min(maxSlots, #garageVehiclesList)
            
            Wait(500)
            DoScreenFadeIn(400)
            
            -- Spawn vehicles in parking slots
            for i = 1, vehicleCount do
                if vehiclesToDisplay[i] then
                    spawnVehInShowRoom(
                        vehiclesToDisplay[i],
                        Config.Showrooms[garageData.Type].ParkingSlots[i].Coords
                    )
                end
            end
        end
    end
    
    -- Function to spawn vehicle in showroom
    function spawnVehInShowRoom(vehicleData, coords)
        local data = vehicleData.data
        
        -- Get model hash
        local modelHash
        if type(data.model) == "number" then
            modelHash = data.model
        else
            modelHash = joaat(data.model)
        end
        
        -- Load model
        local attempts = 25
        if not HasModelLoaded(modelHash) then
            if IsModelInCdimage(modelHash) then
                RequestModel(modelHash)
                
                while not HasModelLoaded(modelHash) do
                    if attempts == 0 then
                        return
                    end
                    attempts = attempts - 1
                    Wait(100)
                end
            end
        end
        
        -- Create vehicle
        local vehicle = CreateVehicle(
            modelHash,
            coords.x, coords.y, coords.z, coords.w,
            false, false
        )
        
        -- Make vehicle invisible initially
        SetEntityAlpha(vehicle, 0, false)
        
        -- Apply vehicle properties
        Fr.SetVehicleProperties(vehicle, data)
        
        -- Fade in vehicle
        SH.fadeInEntity(vehicle, false)
        
        -- Track spawned vehicle
        table.insert(createdVehiclesInShowroom, vehicle)
        
        -- Create vehicle info DUI display
        CreateThread(function()
            createVehicleDUI(
                vehicle,
                data.plate,
                vehicleData.label,
                vehicleData.garage,
                vehicleData.fuelLevel,
                vehicleData.enigneLevel,
                vehicleData.bodyLevel
            )
        end)
    end
    
    -- Function to leave showroom
    function leaveShowRoom(plateToTakeOut)
        DoScreenFadeOut(400)
        Wait(1000)
        
        isInShowRoom = false
        
        -- Delete all spawned vehicles
        for _, vehicle in pairs(createdVehiclesInShowroom) do
            Fr.DeleteVehicle(vehicle, true)
        end
        
        -- Leave solo session
        TriggerServerEvent("mt-garages:soloSessionLeave")
        
        -- Remove exit marker
        removeTargetForShowRoom()
        
        -- Verify we have return coordinates
        if not garageBeforeShowroom then
            Wait(1500)
            DoScreenFadeIn(400)
            return print("Unable to find showroom initial coords.")
        end
        
        local garage = garages[tostring(garageBeforeShowroom.Index)]
        local returnCoords = playerCoordsBefore
        local playerPed = PlayerPedId()
        
        -- Handle taking out a vehicle
        if plateToTakeOut then
            -- Determine spawn location based on garage type
            if garage.Type ~= "car" then
                returnCoords = garage.CenterOfZone
                currentGarageIndex = garageBeforeShowroom.Index
                SetEntityCoords(playerPed, returnCoords.xyz, false, false, false, true)
                SetEntityHeading(playerPed, returnCoords.w)
            else
                currentGarageIndex = garageBeforeShowroom.Index
                SetEntityCoords(playerPed, returnCoords.xyz, false, false, false, true)
                SetEntityHeading(playerPed, returnCoords.w)
            end
            
            -- Spawn the selected vehicle
            takeOutCar(plateToTakeOut, true, returnCoords)
        else
            -- Just return player to original position
            SetEntityCoords(playerPed, returnCoords.xyz, false, false, false, true)
            SetEntityHeading(playerPed, returnCoords.w)
        end
        
        Wait(1500)
        DoScreenFadeIn(400)
    end
    
    -- DUI System for vehicle info display
    local duiUrl = string.format("https://cfx-nui-%s/dui/dui.html", GetCurrentResourceName())
    local duiWidth = math.floor(1920)
    local duiHeight = math.floor(1080)
    local activeDuis = {}
    
    -- Function to get vehicle roof coordinates for DUI positioning
    function getVehicleRoofCoords(vehicle)
        local min, max = GetModelDimensions(GetEntityModel(vehicle))
        local coords = GetEntityCoords(vehicle)
        return vector3(coords.x, coords.y, coords.z + max.z)
    end
    
    -- Function to create DUI display above vehicle
    function createVehicleDUI(vehicle, plate, label, location, fuelLevel, engineLevel, bodyLevel)
        -- Create DUI object
        activeDuis[plate] = {}
        activeDuis[plate].duiObject = CreateDui(duiUrl, duiWidth, duiHeight)
        activeDuis[plate].duiHandle = GetDuiHandle(activeDuis[plate].duiObject)
        
        -- Create texture for rendering
        local txd = CreateRuntimeTxd("dui_texture_" .. plate)
        local duiTexture = CreateRuntimeTextureFromDuiHandle(
            txd,
            "dui_render_" .. plate,
            activeDuis[plate].duiHandle
        )
        
        local messageSent = 100
        
        -- Render loop
        while DoesEntityExist(vehicle) do
            local waitTime = 100
            
            -- Calculate DUI position above vehicle
            local roofCoords = getVehicleRoofCoords(vehicle) + vector3(0.0, 0.0, 0.7)
            local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(roofCoords.x, roofCoords.y, roofCoords.z)
            
            local playerPed = PlayerPedId()
            local camCoords = GetGameplayCamCoord()
            local distanceToCam = #(roofCoords - camCoords)
            
            local playerCoords = GetEntityCoords(PlayerPedId())
            local vehicleCoords = GetEntityCoords(vehicle)
            local distanceToPlayer = #(playerCoords - vehicleCoords)
            
            -- Calculate scale based on distance
            local scale = math.max(0.1, 5.0 / distanceToCam)
            
            -- Draw DUI if player is close enough
            if distanceToPlayer < 10.0 then
                waitTime = 0
                DrawSprite(
                    "dui_texture_" .. plate,
                    "dui_render_" .. plate,
                    screenX, screenY,
                    scale, scale,
                    0.0,
                    255, 255, 255, 255
                )
            end
            
            -- Send vehicle info to DUI
            if messageSent > 0 then
                messageSent = messageSent - 1
                SendDuiMessage(activeDuis[plate].duiObject, json.encode({
                    action = "addInfo",
                    isFav = false,
                    label = label,
                    location = location,
                    fuelLevel = fuelLevel,
                    damageLevel = bodyLevel,
                    bodyLevel = engineLevel,
                    plate = plate
                }))
            end
            
            Wait(waitTime)
        end
        
        -- Cleanup
        DestroyDui(activeDuis[plate].duiObject)
        activeDuis[plate].duiObject = nil
        activeDuis[plate].duiHandle = nil
    end
    
    -- Register keybind for taking vehicle
    RegisterKeyMapping("takeveh", "mt-garages", "KEYBOARD", "W")
    
    RegisterCommand("takeveh", function()
        if isInShowRoom then
            local playerPed = PlayerPedId()
            
            if IsPedInAnyVehicle(playerPed) then
                local vehicle = GetVehiclePedIsUsing(playerPed)
                local plate = GetVehicleNumberPlateText(vehicle)
                plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace
                
                leaveShowRoom(plate)
            end
        end
    end)
end)