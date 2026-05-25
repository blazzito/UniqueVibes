createdGarages = {}
isInGarageZone = false
currentGarageIndex = 0
garageVehiclesList = {}

-- Vehicle type mappings
vehTypes = {
    automobile = "car",
    bike = "car",
    boat = "sea",
    heli = "air",
    plane = "air",
    submarine = "sea",
    trailer = "car",
    train = "car"
}

-- Export: Check if player is in garage zone
function isInGarageZone()
    return isInGarageZone
end
exports("isInGarageZone", isInGarageZone)

-- Export: Open garage if player is in zone
function openGarageIfInZone()
    if isInGarageZone and currentGarageIndex then
        openGarage(currentGarageIndex, true)
    else
        print("Unable to open garage.")
        print("currentGarageIndex", currentGarageIndex)
        print("isInGarageZone", isInGarageZone)
    end
end
exports("openGarageIfInZone", openGarageIfInZone)

-- Thread to show text UI for non-car garages when in zone
Citizen.CreateThread(function()
    -- Wait for Framework initialization
    while Framework == nil do
        Wait(5)
    end

    if Config.Misc.Target == "none" then
        while true do
            local sleep = 5000
            
            if isInGarageZone then
                local garage = garages[tostring(currentGarageIndex)]
                
                if garage and garage.Type ~= "car" then
                    sleep = 1500
                    local playerPed = PlayerPedId()
                    
                    -- Show text UI when in vehicle to park it
                    if IsPedInAnyVehicle(playerPed) then
                        showTextUI(
                            TranslateIt("header_type_" .. garage.Type),
                            garage.CenterOfZone,
                            "mt-garages-park",
                            "2d"
                        )
                    end
                end
            else
                hideTextUI("mt-garages-park")
            end
            
            Wait(sleep)
        end
    end
end)

-- Register new garage location
RegisterNetEvent("mt-garages:registerNewLocation", function(garageData)
    garages[tostring(garageData.Index)] = garageData
    reloadGarages()
end)

-- Edit existing garage location
RegisterNetEvent("mt-garages:editLocation", function(garageData)
    garages[tostring(garageData.Index)] = garageData
    reloadGarages()
end)

-- Delete garage location
RegisterNetEvent("mt-garages:deleteLocation", function(garageIndex)
    garages[tostring(garageIndex)] = nil
    reloadGarages()
end)

-- Reload all garages
function reloadGarages()
    isInGarageZone = false
    currentGarageIndex = 0
    hideTextUI()
    
    -- Clean up existing garages
    for index, createdGarage in pairs(createdGarages) do
        -- Remove blip if it exists
        if createdGarage.Blip and DoesBlipExist(createdGarage.Blip) then
            RemoveBlip(createdGarage.Blip)
            createdGarage.Blip = nil
        end
        
        -- Remove target marker if using target system
        if Config.Misc.Target ~= "none" then
            if createdGarage.Target then
                SH.RemoveMarkedCoords(createdGarage.Target)
                createdGarage.Target = nil
            end
        end
        
        -- Remove access point marker
        if createdGarage.AccessPoint then
            SH.RemoveMarkedCoords(createdGarage.AccessPoint)
            createdGarage.AccessPoint = nil
        end
        
        -- Clean up mt-textui nodes for this garage
        hideTextUI("mt-garages-marker-" .. index)
        hideTextUI("mt-garages-zone")
        hideTextUI("mt-garages-park")
        
        -- Destroy zone if it exists
        if createdGarage.Zone then
            -- Store zone name for cleanup
            local zoneName = createdGarage.Zone.name
            
            -- Destroy the zone
            pcall(function()
                createdGarage.Zone:destroy()
            end)
            
            -- Try to remove from global PolyZone registry
            if PolyZone then
                if PolyZone.RemoveZone then
                    pcall(function()
                        PolyZone.RemoveZone(zoneName)
                    end)
                end
                
                -- Also try removing from Zones table if it exists
                if PolyZone.Zones and PolyZone.Zones[zoneName] then
                    PolyZone.Zones[zoneName] = nil
                end
            end
            
            createdGarage.Zone = nil
        end
    end
    
    -- Clear the createdGarages table
    createdGarages = {}
    
    -- Small delay to ensure cleanup completes
    Wait(100)
    
    loadGarages()
end

-- Load all garages
function loadGarages()
    -- Wait for Framework initialization
    while Framework == nil do
        Wait(5)
    end

    local garagesList = garages
    
    -- Register button for non-target system
    if Config.Misc.Target == "none" then
        SH.RegisterBTN("E", function()
            openGarage(currentGarageIndex, false, false, true)
        end)
    end

    -- Process each garage
    for garageId, garage in pairs(garagesList) do
        local hasAccess = true
        
        -- Check if garage is private
        if garage.IsPrivate then
            local playerData = Fr.GetPlayerData()
            local identifier = trim(playerData[Fr.identificatorTable])
            hasAccess = false
            
            if garage.PrivatePlayersList then
                for _, player in pairs(garage.PrivatePlayersList) do
                    if trim(player.id) == identifier then
                        hasAccess = true
                    end
                end
            end
        end

        if hasAccess then
            createdGarages[garageId] = {}
            
            -- Setup access point for non-car garages
            if garage.Type ~= "car" then
                local targetConfig = {
                    name = "garage_accessPoint_" .. garage.Index,
                    label = TranslateIt("header_type_" .. garage.Type),
                    icon = Config.Misc.Icons[garage.Type],
                    maxDistance = false
                }
                
                local pedModel = false
                if Config.Misc.Peds.Toggle and Config.Misc.Peds[garage.Type] then
                    pedModel = Config.Misc.Peds[garage.Type]
                    pedModel.heading = garage.AccessPoint.w
                end
                
                createdGarages[garageId].AccessPoint = SH.MarkNewCoords(
                    garage.AccessPoint,
                    true,
                    {},
                    pedModel,
                    function() hideTextUI("mt-garages-marker-" .. garage.Index) end,
                    function() openGarage(garage.Index, true) end,
                    targetConfig,
                    function(ped)
                        if not IsPedInAnyVehicle(PlayerPedId(), false) then
                            showTextUI(
                                TranslateIt("header_type_" .. garage.Type),
                                garage.AccessPoint,
                                "mt-garages-marker-" .. garage.Index,
                                "3d",
                                ped
                            )
                        end
                    end
                )
                
                -- Add blip for job garages
                if garage.Job then
                    if jobName and garage.Job.name == jobName then
                        -- For owned type, show blip if job matches (grade check not needed)
                        if garage.Job.type == "owned" then
                            if not garage.blipDisabled then
                                createdGarages[garageId].Blip = SH.addBlip(
                                    garage.AccessPoint.xyz,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(jobName)
                                )
                            end
                        elseif garage.Job.grade and jobGrade and correctGrade(garage.Job.grade, jobGrade) then
                            if not garage.blipDisabled then
                                createdGarages[garageId].Blip = SH.addBlip(
                                    garage.AccessPoint.xyz,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(jobName)
                                )
                            end
                        end
                    end
                -- Add blip for gang garages
                elseif garage.Gang then
                    if gangName and garage.Gang.name == gangName then
                        -- For owned type, show blip if gang matches (grade check not needed)
                        if garage.Gang.type == "owned" then
                            if not garage.blipDisabled then
                                createdGarages[garageId].Blip = SH.addBlip(
                                    garage.AccessPoint.xyz,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(gangName)
                                )
                            end
                        elseif garage.Gang.grade and gangGrade and correctGrade(garage.Gang.grade, gangGrade) then
                            if not garage.blipDisabled then
                                createdGarages[garageId].Blip = SH.addBlip(
                                    garage.AccessPoint.xyz,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(gangName)
                                )
                            end
                        end
                    end
                -- Add blip for public garages
                else
                    local blipLabel = TranslateIt("blip_type_" .. garage.Type)
                    if garage.IsPrivate then
                        blipLabel = TranslateIt("blip_type_private_" .. garage.Type)
                    end
                    
                    if not garage.blipDisabled then
                        createdGarages[garageId].Blip = SH.addBlip(
                            garage.AccessPoint.xyz,
                            Config.Blips[garage.Type].blipId,
                            Config.Blips[garage.Type].blipColor,
                            blipLabel
                        )
                    end
                end
            else
                -- Car garage setup
                local centerCoords = vec3(garage.CenterOfZone.x, garage.CenterOfZone.y, garage.CenterOfZone.z)
                
                -- Add blips for job/gang/public car garages
                if garage.Job then
                    if jobName and garage.Job.name == jobName then
                        -- For owned type, show blip if job matches (grade check not needed)
                        if garage.Job.type == "owned" then
                            if not garage.blipDisabled then
                                createdGarages[garageId].Blip = SH.addBlip(
                                    centerCoords,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(jobName)
                                )
                            end
                        elseif garage.Job.grade and jobGrade and correctGrade(garage.Job.grade, jobGrade) then
                            if not garage.blipDisabled then
                                createdGarages[garageId].Blip = SH.addBlip(
                                    centerCoords,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(jobName)
                                )
                            end
                        end
                    end
                elseif garage.Gang then
                    if gangName and garage.Gang.name == gangName then
                        -- For owned type, show blip if gang matches (grade check not needed)
                        if garage.Gang.type == "owned" then
                            if not garage.blipDisabled then
                                createdGarages[garageId].Blip = SH.addBlip(
                                    centerCoords,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(gangName)
                                )
                            end
                        elseif garage.Gang.grade and gangGrade and correctGrade(garage.Gang.grade, gangGrade) then
                            if not garage.blipDisabled then
                                createdGarages[garageId].Blip = SH.addBlip(
                                    centerCoords,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(gangName)
                                )
                            end
                        end
                    end
                else
                    local blipLabel = TranslateIt("blip_type_" .. garage.Type)
                    if garage.IsPrivate then
                        blipLabel = TranslateIt("blip_type_private_" .. garage.Type)
                    end
                    
                    if not garage.blipDisabled then
                        createdGarages[garageId].Blip = SH.addBlip(
                            centerCoords,
                            Config.Blips[garage.Type].blipId,
                            Config.Blips[garage.Type].blipColor,
                            blipLabel
                        )
                    end
                end
            end

            -- Setup one spawn point if exists
            local hasOneSpawn = true
            if garage.onespawn then
                if tostring(garage.onespawn.x) == "0" or tostring(garage.onespawn.x) == "0.0" then
                    hasOneSpawn = false
                end
            end

            -- Create zone for garage (unless bypassed)
            if not Config.ByPassGarageZones[garage.Index] then
                if hasOneSpawn then
                    local targetConfig = {
                        name = "garage_onespawn_" .. garage.Index,
                        label = TranslateIt("header_type_" .. garage.Type),
                        icon = Config.Misc.Icons[garage.Type],
                        maxDistance = false
                    }
                    
                    local pedModel = false
                    if Config.Misc.Peds.Toggle and Config.Misc.Peds[garage.Type] then
                        pedModel = Config.Misc.Peds[garage.Type]
                        pedModel.heading = garage.onespawn.w
                    end
                    
                    createdGarages[garageId].AccessPoint = SH.MarkNewCoords(
                        garage.onespawn,
                        true,
                        {},
                        pedModel,
                        function() hideTextUI("mt-garages-marker-" .. garage.Index) end,
                        function() openGarage(garage.Index, true) end,
                        targetConfig,
                        function(ped)
                            if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                showTextUI(
                                    TranslateIt("header_type_" .. garage.Type),
                                    garage.onespawn,
                                    "mt-garages-marker-" .. garage.Index,
                                    "3d",
                                    ped
                                )
                            end
                        end
                    )
                end

                -- Create CircleZone or BoxZone based on config
                if not Config.Misc.UseBoxZone then
                    if tonumber(garage.zPoints.minZ) == 0 and tonumber(garage.zPoints.maxZ) then
                        createdGarages[garageId].Zone = CircleZone:Create(
                            vec3(garage.CenterOfZone.x, garage.CenterOfZone.y, garage.CenterOfZone.z),
                            garage.Radius,
                            {
                                name = "garage_" .. garage.Index,
                                debugPoly = Config.Debug
                            }
                        )
                    else
                        createdGarages[garageId].Zone = CircleZone:Create(
                            vec3(garage.CenterOfZone.x, garage.CenterOfZone.y, garage.CenterOfZone.z),
                            garage.Radius,
                            {
                                name = "garage_" .. garage.Index,
                                debugPoly = Config.Debug,
                                minZ = tonumber(garage.zPoints.minZ) == 0 and tonumber(garage.zPoints.minZ) or tonumber(garage.zPoints.minZ),
                                maxZ = tonumber(garage.zPoints.maxZ) == 0 and tonumber(garage.zPoints.maxZ) or tonumber(garage.zPoints.maxZ)
                            }
                        )
                    end
                else
                    if tonumber(garage.zPoints.minZ) == 0 and tonumber(garage.zPoints.maxZ) then
                        createdGarages[garageId].Zone = BoxZone:Create(
                            vec3(garage.CenterOfZone.x, garage.CenterOfZone.y, garage.CenterOfZone.z),
                            garage.Radius,
                            garage.Radius,
                            {
                                name = "garage_" .. garage.Index,
                                debugPoly = Config.Debug,
                                heading = garage.CenterOfZone.w
                            }
                        )
                    else
                        createdGarages[garageId].Zone = BoxZone:Create(
                            vec3(garage.CenterOfZone.x, garage.CenterOfZone.y, garage.CenterOfZone.z),
                            garage.Radius,
                            garage.Radius,
                            {
                                name = "garage_" .. garage.Index,
                                debugPoly = Config.Debug,
                                minZ = tonumber(garage.zPoints.minZ),
                                maxZ = tonumber(garage.zPoints.maxZ),
                                heading = garage.CenterOfZone.w
                            }
                        )
                    end
                end
            else
                createdGarages[garageId].Zone = Config.ByPassGarageZones[garage.Index]()
            end

            -- Setup zone enter/exit callbacks
            createdGarages[garageId].Zone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                -- Check job access
                if garage.Job then
                    if garage.Job.name ~= jobName then
                        return
                    end
                    if garage.Job.grade and jobGrade and not correctGrade(tonumber(garage.Job.grade), tonumber(jobGrade)) then
                        return
                    end
                end

                -- Check gang access
                if garage.Gang then
                    if garage.Gang.name ~= gangName then
                        return
                    end
                    if garage.Gang.grade and gangGrade and not correctGrade(tonumber(garage.Gang.grade), tonumber(gangGrade)) then
                        return
                    end
                end

                if isPointInside then
                    isInGarageZone = true
                    currentGarageIndex = garage.Index

                    if Config.Misc.Target == "none" then
                        if (garage.Type == "car" or hasOneSpawn) and IsPedInAnyVehicle(PlayerPedId(), false) then
                            -- Show text UI for car garages only when in vehicle
                            showTextUI(
                                TranslateIt("header_type_" .. garage.Type),
                                garage.CenterOfZone,
                                "mt-garages-zone",
                                "2d"
                            )
                        end
                    else
                        SH.RemoveMarkedCoords(createdGarages[garageId].Target)
                        
                        local targetLabel = hasOneSpawn and 
                            TranslateIt("garage_target_openOneSpawn_hidevehicle") or 
                            TranslateIt("header_type_" .. garage.Type)
                        
                        local targetConfig = {
                            name = "garage_" .. garage.Index,
                            label = targetLabel,
                            icon = Config.Misc.Icons[garage.Type],
                            maxDistance = true
                        }
                        
                        createdGarages[garageId].Target = SH.MarkNewCoords(
                            garage.CenterOfZone,
                            true,
                            {},
                            false,
                            function() end,
                            function() openGarage(garage.Index) end,
                            targetConfig
                        )
                    end
                else
                    isInGarageZone = false
                    currentGarageIndex = 0

                    if Config.Misc.Target == "none" then
                        hideTextUI("mt-garages-zone")
                    else
                        SH.RemoveMarkedCoords(createdGarages[garageId].Target)
                        createdGarages[garageId].Target = nil
                    end
                end
            end)
        end
    end
end

-- Variables for opening garage at custom location
isInOpenGarageHere = false
isInOpenGarageGang = false
openGarageHereCoords = nil
disablePreview = false

-- Export: Open garage at custom location
function OpenGarageHere(coords, disableVehiclePreview)
    openGarageHereCoords = coords
    disablePreview = disableVehiclePreview
    isInOpenGarageGang = false
    openGarage("custom_garage", true, true)
end
exports("OpenGarageHere", OpenGarageHere)

-- Export: Open gang garage at custom location
function OpenGangGarageHere(coords, disableVehiclePreview)
    openGarageHereCoords = coords
    disablePreview = disableVehiclePreview
    isInOpenGarageGang = true
    openGarage("custom_garage", true, true)
end
exports("OpenGangGarageHere", OpenGangGarageHere)

alreadyCalled = false

-- Open garage menu
function openGarage(garageIndex, isFromMarker, isFromCustomLocation, isFromButton)
    local garage = garages[tostring(garageIndex)]

    -- If opening from custom location, create temporary garage data
    if isFromCustomLocation then
        garage = {
            Index = "custom_garage",
            Label = "Garage",
            Type = "car",
            CenterOfZone = openGarageHereCoords or vec4(0.0, 0.0, 0.0, 0.0),
            AccessPoint = vec4(0.0, 0.0, 0.0, 0.0),
            Radius = 15,
            IsPrivate = false,
            PrivatePlayersList = {},
            zPoints = { minZ = 0.0, maxZ = 0.0 },
            blipDisabled = false,
            onespawn = openGarageHereCoords or vec4(0.0, 0.0, 0.0, 0.0),
            Gang = isInOpenGarageGang and { name = gangName, grade = 0, type = "owned" } or false,
            Job = false
        }
        isInOpenGarageHere = true
    end

    currentGarageIndex = garageIndex

    if not garage then
        debugLoging("Garage config not found")
        return
    end

    -- Check if garage has one spawn point
    local hasOneSpawn = true
    if garage.onespawn then
        if tostring(garage.onespawn.x) == "0" or tostring(garage.onespawn.x) == "0.0" then
            hasOneSpawn = false
        end
    end

    local playerPed = PlayerPedId()
    local currentVehicle = GetVehiclePedIsUsing(playerPed)

    -- Check if player needs to be in vehicle for one-spawn garages
    if hasOneSpawn and isFromButton and not isFromMarker then
        if not IsPedInAnyVehicle(playerPed) then
            return
        end
    end

    -- Check job permissions
    if garage.Job then
        if garage.Job.name == jobName then
            if garage.Job.grade and jobGrade and not correctGrade(tonumber(garage.Job.grade), tonumber(jobGrade)) then
                return sendNotify(TranslateIt("notify_noallowed"), "error", 5000)
            end
        else
            return sendNotify(TranslateIt("notify_noallowed"), "error", 5000)
        end
    end

    -- Check gang permissions
    if garage.Gang then
        if garage.Gang.name == gangName then
            if garage.Gang.grade and gangGrade and not correctGrade(tonumber(garage.Gang.grade), tonumber(gangGrade)) then
                return sendNotify(TranslateIt("notify_noallowed"), "error", 5000)
            end
        else
            return sendNotify(TranslateIt("notify_noallowed"), "error", 5000)
        end
    end

    -- Handle vehicle parking or garage opening
    if isInGarageZone or isFromMarker then
        if IsPedInAnyVehicle(playerPed) then
            if GetEntitySpeed(currentVehicle) < 1.0 then
                hideCurrentVehicle()
            else
                sendNotify(TranslateIt("stop_veh"), "error", 5000)
            end
        else
            -- Check if should- [x] Update `mt-garages` UI wrapper.
            -- [-] Connect NPCs to 3D text in `mt-garages`.
            if garage.Type ~= "car" and not isFromMarker then
                if IsPedInAnyVehicle(playerPed) then
                    return
                else
                    return hideCurrentVehicle()
                end
            end

            if hasOneSpawn and not isFromMarker then
                if IsPedInAnyVehicle(playerPed) then
                    return
                else
                    return hideCurrentVehicle()
                end
            end

            -- Handle job spawner garages
            if garage.Job and garage.Job.type == "spawner" then
                CurrentFrame = "setGarageMenuVisible"
                inGarageUI = true
                
                local spawnerVehicles = {}
                for _, jobVehicle in pairs(jobvehicles) do
                    local vehicleType = GetVehicleTypeSimple(jobVehicle.model)
                    
                    if jobVehicle.job == jobName and vehicleType == garage.Type then
                        local hasGradeAccess = false
                        for _, grade in pairs(jobVehicle.gradesAllowed) do
                            if correctGrade(tonumber(grade), tonumber(jobGrade)) then
                                hasGradeAccess = true
                                break
                            end
                        end
                        
                        if hasGradeAccess then
                            local vehicleData = FindVehicleByModel(jobVehicle.model or "")
                            if vehicleData.label ~= "CARNOTFOUND" then
                                table.insert(spawnerVehicles, {
                                    model = jobVehicle.model,
                                    label = vehicleData.label,
                                    plate = jobVehicle.index,
                                    index = jobVehicle.index,
                                    props = jobVehicle.properties,
                                    data = { model = jobVehicle.model }
                                })
                            end
                        end
                    end
                end
                
                local garageData = {
                    currentGarage = garage.Label,
                    garageIndex = garage.Index,
                    garagesList = {},
                    impoundsList = {},
                    transferPrice = 999999999999999,
                    vehicles = {},
                    garageType = garage.Type,
                    isSpawnerMode = true,
                    spawnerJob = garage.Job and garage.Job.name or "",
                    SpawnerVehicles = spawnerVehicles,
                    allowShowRoom = false
                }
                
                garageVehiclesList = spawnerVehicles
                SendReactMessage("setGarageData", garageData)
                SetNuiFocus(true, true)
                SendReactMessage(CurrentFrame, true)
            -- Handle gang spawner garages
            elseif garage.Gang and garage.Gang.type == "spawner" then
                CurrentFrame = "setGarageMenuVisible"
                inGarageUI = true
                
                local spawnerVehicles = {}
                
                -- Only process if gangName is available
                if gangName then
                    for _, gangVehicle in pairs(gangvehicles) do
                        local vehicleType = GetVehicleTypeSimple(gangVehicle.model)
                        
                        if gangVehicle.gang == gangName and vehicleType == garage.Type then
                            local hasGradeAccess = false
                            
                            -- If gangGrade is nil, allow all vehicles (no grade restriction)
                            if gangGrade == nil then
                                hasGradeAccess = true
                            else
                                for _, grade in pairs(gangVehicle.gradesAllowed) do
                                    if correctGrade(tonumber(grade), tonumber(gangGrade)) then
                                        hasGradeAccess = true
                                        break
                                    end
                                end
                            end
                            
                            if hasGradeAccess then
                                local vehicleData = FindVehicleByModel(gangVehicle.model or "")
                                if vehicleData.label ~= "CARNOTFOUND" then
                                    table.insert(spawnerVehicles, {
                                        model = gangVehicle.model,
                                        label = vehicleData.label,
                                        plate = gangVehicle.index,
                                        index = gangVehicle.index,
                                        props = gangVehicle.properties,
                                        data = { model = gangVehicle.model }
                                    })
                                end
                            end
                        end
                    end
                end
                
                local garageData = {
                    currentGarage = garage.Label,
                    garageIndex = garage.Index,
                    garagesList = {},
                    impoundsList = {},
                    transferPrice = 999999999999999,
                    vehicles = {},
                    garageType = garage.Type,
                    isSpawnerMode = true,
                    spawnerJob = garage.Gang and garage.Gang.name or "",
                    SpawnerVehicles = spawnerVehicles,
                    allowShowRoom = false
                }
                
                garageVehiclesList = spawnerVehicles
                SendReactMessage("setGarageData", garageData)
                SetNuiFocus(true, true)
                SendReactMessage(CurrentFrame, true)
            -- Handle regular garages - fetch vehicles from server
            else
                Fr.TriggerServerCallback("mt-garages:getVehicles", function(vehicles)
                    CurrentFrame = "setGarageMenuVisible"
                    inGarageUI = true
                    
                    local vehiclesList = {}
                    for _, vehicle in pairs(vehicles) do
                        local vehicleMods = vehicle[Fr.VehicleEncode]
                        
                        -- Decode vehicle mods if string
                        if type(vehicleMods) ~= "table" then
                            vehicleMods = json.decode(vehicleMods)
                        end
                        
                        -- Create fake mods if missing
                        if not vehicleMods and vehicle.hash and vehicle.plate then
                            print("[INFO] -> Creating fake Mods Column for vehicle with plate:", vehicle.plate)
                            vehicleMods = {
                                plate = vehicle.plate,
                                model = tonumber(vehicle.hash)
                            }
                        end
                        
                        if vehicleMods then
                            local vehicleType = GetVehicleTypeSimple(vehicleMods.model)
                            
                            -- Only show vehicles matching garage type
                            if vehicleType == garage.Type then
                                local vehicleData = FindVehicleByModel(vehicleMods.model or "")
                                local vehicleGarage = garages[tostring(vehicle.vehicleGarage)] or garage
                                
                                if Config.Misc.DisableVehicleTransfer then
                                    vehicleGarage = garage
                                end
                                
                                -- Find matching impound
                                local matchingImpound = false
                                for _, impound in pairs(impounds) do
                                    if impound.Type == garage.Type then
                                        matchingImpound = impound
                                    end
                                end
                                
                                local vehicleImpound = impounds[tostring(vehicle.vehicleImpound)] or matchingImpound
                                
                                -- Check if this is an owned job/gang vehicle (always show these)
                                local isOwnedJobVehicle = (vehicle.job and vehicle.job ~= "" and vehicle.job ~= nil)
                                local isOwnedGangVehicle = (vehicle.gang and vehicle.gang ~= "" and vehicle.gang ~= nil)
                                
                                -- Only show stored or impounded vehicles, OR owned job/gang vehicles
                                if vehicleImpound or vehicle[Fr.StoredTable] == 0 or isOwnedJobVehicle or isOwnedGangVehicle then
                                    if vehicleGarage.Type ~= garage.Type then
                                        vehicleGarage = garage
                                    end
                                    
                                    if vehicleData.label ~= "CARNOTFOUND" then
                                        table.insert(vehiclesList, {
                                            data = vehicleMods,
                                            label = vehicleData.label,
                                            plate = vehicle.plate,
                                            state = vehicle[Fr.StoredTable],
                                            img = "",
                                            garage = vehicleGarage.Label,
                                            garageIndex = vehicleGarage.Index,
                                            fuelLevel = math.floor(vehicleMods.fuelLevel or 100.5),
                                            enigneLevel = math.floor(normalizeHealth(vehicleMods.engineHealth or 1000) + 0.5),
                                            bodyLevel = math.floor(normalizeHealth(vehicleMods.bodyHealth or 1000) + 0.5),
                                            isTowedOut = vehicle.isTowedOut,
                                            towedOutBy = vehicle.towedOutBy,
                                            towedToDate = vehicle.towedToDate,
                                            towedPrice = vehicle.towedPrice,
                                            towedAfterPrice = vehicle.towedAfterPrice,
                                            retrievable = vehicle.retrievable,
                                            reason = vehicle.impoundReason,
                                            towData = {
                                                index = vehicleImpound and vehicleImpound.Index or 0,
                                                label = vehicleImpound and vehicleImpound.Label or "",
                                                impoundType = vehicleImpound and vehicleImpound.Type or ""
                                            }
                                        })
                                    end
                                end
                            end
                        else
                            print("[ERROR] -> Vehicle with plate " .. vehicle.plate .. " doesn't have mods column!")
                        end
                    end
                    
                    -- Check if showroom is allowed
                    local allowShowRoom = Config.Showrooms.Config.Enable
                    if allowShowRoom and Config.Showrooms.Config.AllowOnlyInPrivateGarages then
                        if not garage.IsPrivate then
                            allowShowRoom = false
                        end
                    end
                    if allowShowRoom and not Config.Showrooms[garage.Type] then
                        allowShowRoom = false
                    end
                    
                    local spawnerJob = ""
                    if garage.Job and garage.Job.name then
                        spawnerJob = garage.Job.name
                    elseif garage.Gang and garage.Gang.name then
                        spawnerJob = garage.Gang.name
                    end
                    
                    local garageData = {
                        currentGarage = garage.Label,
                        garageIndex = garage.Index,
                        garagesList = {},
                        impoundsList = {},
                        transferPrice = Config.Misc.TransferPrice,
                        vehicles = vehiclesList,
                        garageType = garage.Type,
                        isSpawnerMode = false,
                        spawnerJob = spawnerJob,
                        SpawnerVehicles = {},
                        allowShowRoom = allowShowRoom
                    }
                    
                    garageVehiclesList = vehiclesList
                    SendReactMessage("setGarageData", garageData)
                    SetNuiFocus(true, true)
                    SendReactMessage(CurrentFrame, true)
                end, tostring(garageIndex), false, isInOpenGarageGang)
            end
        end
    end
end

-- Vehicle preview variables
CurrentVehicle = {}
cam = nil
CurrentTemporaryCoords = nil
CurrentTemporaryHeading = nil
isVehicleLoading = false
inGarageUI = false
attempts = 50
currentLoadingPlate = nil

-- Select vehicle for preview
function selectCar(plate)
    -- Don't preview if disabled
    if disablePreview and isInOpenGarageHere then
        return
    end
    
    if Config.Misc.DisableVehicleSpawnInGarage then
        return
    end
    
    if not inGarageUI then
        return
    end
    
    -- Check if already loading a different vehicle
    if isVehicleLoading then
        if currentLoadingPlate ~= plate then
            isVehicleLoading = false
        end
    end
    
    if not isVehicleLoading then
        BusyspinnerOff()
        isVehicleLoading = false
        
        local vehicleFound = false
        
        -- Delete existing preview vehicle
        if #CurrentVehicle > 0 then
            for index, vehicle in pairs(CurrentVehicle) do
                if vehicle.plate == plate then
                    return
                end
                Fr.DeleteVehicle(vehicle.spawned, true)
                CurrentVehicle[index] = nil
            end
        end
        
        -- Find vehicle in list
        for _, vehicle in pairs(garageVehiclesList) do
            if vehicle.plate == plate then
                vehicleFound = true
                table.insert(CurrentVehicle, vehicle)
            end
        end
        
        if not vehicleFound then
            print("not found")
            return
        end
        
        if vehicleFound then
            BeginTextCommandBusyspinnerOn("STRING")
            AddTextComponentSubstringPlayerName("Loading vehicle..")
            EndTextCommandBusyspinnerOn(4)
            
            isVehicleLoading = true
            currentLoadingPlate = plate
            
            local playerPed = PlayerPedId()
            local garage = garages[tostring(currentGarageIndex)]
            
            -- Create temporary garage if opening from custom location
            if isInOpenGarageHere then
                garage = {
                    Index = "custom_garage",
                    Label = "Garage",
                    Type = "car",
                    CenterOfZone = openGarageHereCoords or vec4(0.0, 0.0, 0.0, 0.0),
                    AccessPoint = vec4(0.0, 0.0, 0.0, 0.0),
                    Radius = 15,
                    IsPrivate = false,
                    PrivatePlayersList = {},
                    zPoints = { minZ = 0.0, maxZ = 0.0 },
                    blipDisabled = false,
                    onespawn = openGarageHereCoords or vec4(0.0, 0.0, 0.0, 0.0),
                    Gang = isInOpenGarageGang and { name = gangName, grade = 0, type = "owned" } or false,
                    Job = false
                }
            end
            
            if not garage then
                hideFrame()
                print("Not garage found. closing ui")
                return
            end
            
            -- Check if garage has one spawn point
            local hasOneSpawn = true
            if garage.onespawn then
                if tostring(garage.onespawn.x) == "0" or tostring(garage.onespawn.x) == "0.0" then
                    hasOneSpawn = false
                end
            end
            
            -- Calculate spawn coordinates
            if not CurrentTemporaryCoords then
                if garage.Type == "car" then
                    local baseCoords = hasOneSpawn and garage.CenterOfZone or GetEntityCoords(playerPed)
                    local baseHeading = (hasOneSpawn and garage.CenterOfZone.w or GetEntityHeading(playerPed)) + 40.0
                    
                    local angleOffset = 360.0
                    local distance = hasOneSpawn and 0.0 or 2.0
                    local angle = math.rad(baseHeading + angleOffset)
                    
                    CurrentTemporaryCoords = vector3(
                        baseCoords.x + distance * math.cos(angle),
                        baseCoords.y + distance * math.sin(angle),
                        baseCoords.z - 1
                    )
                    CurrentTemporaryHeading = baseHeading
                else
                    CurrentTemporaryCoords = vec3(garage.CenterOfZone.x, garage.CenterOfZone.y, garage.CenterOfZone.z)
                    CurrentTemporaryHeading = garage.CenterOfZone.w
                end
            end
            
            -- Get vehicle model hash
            local modelHash = type(CurrentVehicle[1].data.model) == "number" and 
                CurrentVehicle[1].data.model or 
                joaat(CurrentVehicle[1].data.model)
            
            -- Load vehicle model
            local maxAttempts = 50
            if not HasModelLoaded(modelHash) then
                if IsModelInCdimage(modelHash) then
                    RequestModel(modelHash)
                    while not HasModelLoaded(modelHash) do
                        if currentLoadingPlate ~= plate then
                            return
                        end
                        if not inGarageUI then
                            return
                        end
                        Wait(100)
                    end
                end
            end
            
            if not CurrentTemporaryCoords then
                return
            end
            
            if CurrentVehicle[1].plate ~= plate then
                return
            end
            
            -- Spawn preview vehicle
            local vehicle = CreateVehicle(
                modelHash,
                CurrentTemporaryCoords.x,
                CurrentTemporaryCoords.y,
                CurrentTemporaryCoords.z,
                CurrentTemporaryHeading,
                false,
                false
            )
            
            if not DoesEntityExist(vehicle) then
                BusyspinnerOff()
                isVehicleLoading = false
                currentLoadingPlate = nil
                return
            end
            
            -- Setup vehicle properties
            if garage.Type == "sea" then
                SetBoatAnchor(vehicle, true)
            end
            
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            SetVehicleNeedsToBeHotwired(vehicle, false)
            SetVehRadioStation(vehicle, "OFF")
            
            BusyspinnerOff()
            isVehicleLoading = false
            currentLoadingPlate = nil
            
            if not inGarageUI then
                Fr.DeleteVehicle(vehicle, true)
                return
            end
            
            SetEntityAlpha(vehicle, 0, false)
            SetEntityHeading(vehicle, CurrentTemporaryHeading)
            
            -- Apply vehicle properties
            local vehicleProps = false
            if garage.Job and garage.Job.type == "spawner" then
                vehicleProps = CurrentVehicle[1].props or false
            else
                vehicleProps = CurrentVehicle[1].data
            end
            
            if vehicleProps then
                Fr.SetVehicleProperties(vehicle, vehicleProps)
                if garage.Job and garage.Job.type == "spawner" then
                    SetVehicleNumberPlateText(vehicle, "00000000")
                end
            end
            
            CurrentVehicle[1].spawned = vehicle
            
            -- Setup camera if not already created
            if cam == nil then
                cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
                
                local camOffset
                if garage.Type ~= "car" then
                    camOffset = GetOffsetFromEntityInWorldCoords(vehicle, 19.0, 19.0, 0.4)
                else
                    camOffset = GetOffsetFromEntityInWorldCoords(vehicle, 9.0, 9.0, 0.4)
                end
                
                local wheelBone = GetEntityBoneIndexByName(vehicle, "wheel_rr")
                local targetCoords = CurrentTemporaryCoords
                if wheelBone ~= -1 then
                    targetCoords = GetWorldPositionOfEntityBone(vehicle, wheelBone)
                end
                
                local distance = 1.5
                local heading = GetEntityHeading(vehicle)
                local headingRad = math.rad(heading)
                
                local targetX = targetCoords.x + distance * math.cos(headingRad + math.pi / 2)
                local targetY = targetCoords.y + distance * math.sin(headingRad + math.pi / 2)
                local targetZ = targetCoords.z
                
                SetCamActive(cam, true)
                
                if garage.Type ~= "car" then
                    SetCamCoord(cam, camOffset.x, camOffset.y, camOffset.z + 3.0)
                else
                    SetCamCoord(cam, camOffset.x, camOffset.y, camOffset.z + 2.0)
                end
                
                PointCamAtCoord(cam, targetX, targetY, targetZ + 1.0)
                RenderScriptCams(true, true, 1000, true, true)
                SetCamFov(cam, 20.0)
            end
            
            -- Fade in vehicle
            if garage.Job and garage.Job.type == "spawner" then
                SH.fadeInEntity(vehicle, false)
            else
                if CurrentVehicle[1].state == 0 then
                    SH.fadeInEntity(vehicle, false)
                else
                    SH.fadeInEntity(vehicle, true)
                end
            end
        end
    end
end

-- Check if vehicle plate matches expected plate
function CheckPlate(vehicle, expectedPlate)
    local promise = promise.new()
    
    CreateThread(function()
        local maxAttempts = 20  -- Maximum 10 seconds (20 * 500ms)
        local attempts = 0
        
        while attempts < maxAttempts do
            Wait(500)
            attempts = attempts + 1
            
            -- Check if vehicle still exists
            if not DoesEntityExist(vehicle) then
                promise:resolve(false)
                return
            end
            
            local currentPlate = GetVehicleNumberPlateText(vehicle)
            if currentPlate == expectedPlate then
                promise:resolve(true)
                return
            else
                -- Only set plate if vehicle exists
                if DoesEntityExist(vehicle) then
                    SetVehicleNumberPlateText(vehicle, expectedPlate)
                end
            end
        end
        
        -- Resolve anyway after max attempts to prevent infinite loop
        promise:resolve(false)
    end)
    
    return promise
end

-- Set entity coords with verification
function SetEntityCoordsWithCheck(entity, coords, skipZCheck)
    local promise = promise.new()
    
    CreateThread(function()
        local maxAttempts = 20  -- Maximum 10 seconds (20 * 500ms)
        local attempts = 0
        
        while attempts < maxAttempts do
            Wait(500)
            attempts = attempts + 1
            
            local currentCoords = GetEntityCoords(entity)
            local targetCoords = vec3(coords.x, coords.y, coords.z)
            
            -- For boats/sea vehicles, only check X and Y coordinates
            local distance
            if skipZCheck then
                local current2D = vec2(currentCoords.x, currentCoords.y)
                local target2D = vec2(targetCoords.x, targetCoords.y)
                distance = #(current2D - target2D)
            else
                distance = #(currentCoords - targetCoords)
            end
            
            if distance < 2.1 then
                promise:resolve(true)
                return
            else
                -- For boats, don't force Z coordinate as it will float naturally
                if skipZCheck then
                    SetEntityCoords(entity, coords.x, coords.y, currentCoords.z, false, false, false, false)
                else
                    SetEntityCoords(entity, coords.x, coords.y, coords.z, false, false, false, false)
                end
            end
        end
        
        -- Resolve anyway after max attempts to prevent infinite loop
        promise:resolve(true)
    end)
    
    return promise
end

-- Debug logging helper
function debugLoging(message)
    if Config.Debug then
        print("[DEBUG]: " .. message)
    end
end

isTakingOut = false

-- Take vehicle out of garage
function takeOutCar(plate, forceSpawn, spawnCoords)
    local isSpawner = false
    
    if type(plate) ~= "string" then
        isSpawner = true
    end
    
    if isTakingOut then
        debugLoging("Cannot take out vehicle. 01")
        return
    end
    
    isTakingOut = true
    
    if isVehicleLoading then
        BusyspinnerOff()
        isVehicleLoading = false
    end
    
    local garage = garages[tostring(currentGarageIndex)]
    
    -- Create temporary garage if opening from custom location
    if not garage and isInOpenGarageHere then
        garage = {
            Index = "custom_garage",
            Label = "Garage",
            Type = "car",
            CenterOfZone = openGarageHereCoords or vec4(0.0, 0.0, 0.0, 0.0),
            AccessPoint = vec4(0.0, 0.0, 0.0, 0.0),
            Radius = 15,
            IsPrivate = false,
            PrivatePlayersList = {},
            zPoints = { minZ = 0.0, maxZ = 0.0 },
            blipDisabled = false,
            onespawn = openGarageHereCoords or vec4(0.0, 0.0, 0.0, 0.0),
            Gang = isInOpenGarageGang and { name = gangName, grade = 0, type = "owned" } or false,
            Job = false
        }
    end
    
    if not garage then
        isTakingOut = false
        hideFrame()
        debugLoging("Not garage found. closing ui")
        return
    end
    
    local vehicleFound = false
    local previewVehicle = nil
    
    -- Get preview vehicle if exists
    if #CurrentVehicle > 0 then
        FreezeEntityPosition(CurrentVehicle[1].spawned, true)
        SetEntityCompletelyDisableCollision(CurrentVehicle[1].spawned, false)
        previewVehicle = CurrentVehicle[1]
        debugLoging("Taking out vehicle step 02")
    end
    
    -- Find vehicle in list
    for _, vehicle in pairs(garageVehiclesList) do
        if vehicle.plate == plate then
            vehicleFound = true
            CurrentVehicle[1] = vehicle
            debugLoging("Vehicle Found in garageVehiclesList")
        end
    end
    
    if not vehicleFound then
        isTakingOut = false
        debugLoging("Vehicle not found. Error 03")
        print("not found")
        return
    end
    
    if vehicleFound then
        local spawnLocation = spawnCoords or CurrentTemporaryCoords
        local isSpawnerMode = false
        
        if spawnCoords then
            CurrentTemporaryHeading = spawnCoords.w
        end
        
        -- Check if garage has one spawn point
        local hasOneSpawn = true
        if garage.onespawn then
            if tostring(garage.onespawn.x) == "0" or tostring(garage.onespawn.x) == "0.0" then
                hasOneSpawn = false
            end
        end
        
        if hasOneSpawn then
            spawnLocation = garage.CenterOfZone
            CurrentTemporaryHeading = garage.CenterOfZone.w
        end
        
        local playerPed = PlayerPedId()
        
        if not spawnLocation then
            local playerCoords = GetEntityCoords(playerPed)
            local playerHeading = GetEntityHeading(playerPed)
            spawnLocation = vec3(playerCoords.x, playerCoords.y, playerCoords.z)
            CurrentTemporaryHeading = playerHeading
        end
        
        if Config.Misc.DisableVehicleSpawnInGarage then
            spawnLocation = garage.CenterOfZone
            CurrentTemporaryHeading = garage.CenterOfZone.w
        end
        
        if not CurrentTemporaryHeading then
            CurrentTemporaryHeading = GetEntityHeading(playerPed)
        end
        
        -- Check if spawner mode
        if garage.Job and garage.Job.type == "spawner" then
            isSpawnerMode = true
        end
        
        if garage.Gang and garage.Gang.type == "spawner" then
            isSpawnerMode = true
        end
        
        debugLoging("Spawn coords: " .. json.encode(spawnLocation))
        debugLoging("Spawn heading: " .. CurrentTemporaryHeading)
        debugLoging("isSpawner: " .. json.encode(isSpawnerMode))
        
        local modelHash = type(CurrentVehicle[1].data.model) == "number" and 
            CurrentVehicle[1].data.model or 
            joaat(CurrentVehicle[1].data.model)
        
        debugLoging("Model Hash: " .. modelHash)
        
        -- Request vehicle spawn from server
        Fr.TriggerServerCallback("mt-garages:removeCarFromParking", function(success)
            if success then
                -- Delete preview vehicle immediately before spawning real one to prevent duplication
                if previewVehicle ~= nil then
                    Fr.DeleteVehicle(previewVehicle.spawned, true)
                    previewVehicle = nil
                end

                local spawnCoords3D = vec3(spawnLocation.x, spawnLocation.y, spawnLocation.z)
                debugLoging("Spawn under map animation.")
                
                Fr.SpawnVehicle(modelHash, spawnCoords3D.xyz, CurrentTemporaryHeading, true, function(spawnedVehicle)
                    if not DoesEntityExist(spawnedVehicle) then
                        print("Failed to spawn vehicle for plate:", plate)
                        return
                    end
                    
                    local networkId = NetworkGetNetworkIdFromEntity(spawnedVehicle)
                    local generatedPlate = nil
                    
                    if not isSpawnerMode then
                        TriggerServerEvent("mt-garages:updateNet", plate, networkId)
                    end
                    
                    SetNetworkIdCanMigrate(networkId, true)
                    SetEntityAsMissionEntity(spawnedVehicle, true, true)
                    SetVehicleHasBeenOwnedByPlayer(spawnedVehicle, true)
                    SetVehicleNeedsToBeHotwired(spawnedVehicle, false)
                    SetModelAsNoLongerNeeded(CurrentVehicle[1].data.model)
                    SetVehRadioStation(spawnedVehicle, "OFF")
                    SetVehicleDoorsLocked(spawnedVehicle, 0)
                    SetNuiFocus(false, false)
                    SendReactMessage("setGarageMenuVisible", false)
                    
                    -- Apply vehicle properties
                    local vehicleProps = false
                    if garage.Job and garage.Job.type == "spawner" then
                        vehicleProps = CurrentVehicle[1].props or false
                    else
                        vehicleProps = CurrentVehicle[1].data
                    end
                    
                    if vehicleProps then
                        Fr.SetVehicleProperties(spawnedVehicle, vehicleProps)
                        
                        if garage.Job and garage.Job.type == "spawner" then
                            Citizen.CreateThread(function()
                                CheckPlate(spawnedVehicle, generatedPlate)
                            end)
                        else
                            Citizen.CreateThread(function()
                                CheckPlate(spawnedVehicle, vehicleProps.plate)
                            end)
                        end
                    end
                    
                    -- Give vehicle keys
                    if not isSpawnerMode then
                        debugLoging("Vehicle keys gaven 03")
                        giveKeys(spawnedVehicle, CurrentVehicle[1].data.model, CurrentVehicle[1].plate, networkId)
                    else
                        debugLoging("Vehicle keys gaven 04")
                        generatedPlate = generatePlate()
                        giveKeys(spawnedVehicle, CurrentVehicle[1].data.model, generatedPlate, networkId)
                    end
                    
                    -- Preview vehicle was already deleted before spawning
                    
                    -- Setup boat anchor for sea garages
                    if garage.Type == "sea" then
                        SetBoatAnchor(spawnedVehicle, true)
                        Wait(100)  -- Give time for anchor to set
                        
                        -- Get water height for proper boat positioning
                        local waterHeight = 0.0
                        local foundWater, waterZ = GetWaterHeight(spawnLocation.x, spawnLocation.y, spawnLocation.z)
                        if foundWater then
                            waterHeight = waterZ
                        else
                            -- Fallback: use spawn location Z or slightly above
                            waterHeight = spawnLocation.z + 1.0
                        end
                        
                        -- Spawn boat at water surface level
                        SetEntityCoords(spawnedVehicle, spawnLocation.x, spawnLocation.y, waterHeight, false, false, false, true)
                    else
                        SetEntityCoords(spawnedVehicle, spawnLocation, false, false, false, true)
                    end
                    
                    SetEntityHeading(spawnedVehicle, CurrentTemporaryHeading)
                    
                    debugLoging("Checking coords..")
                    
                    -- Always warp player to driver's seat (-1) to prevent passenger placement
                    if Config.Misc.WarpPedToVehicle then
                        TaskWarpPedIntoVehicle(playerPed, spawnedVehicle, -1)
                    end
                    
                    SetVehicleUndriveable(spawnedVehicle, false)
                    SetVehicleEngineOn(spawnedVehicle, true, true, false)
                    SetEntityProofs(spawnedVehicle, false, false, false, false, false, false, false, false)
                    SetEntityInvincible(spawnedVehicle, false)
                    
                    -- For sea garages, skip Z coordinate check as boats float naturally
                    local skipZCheck = (garage.Type == "sea")
                    Citizen.Await(SetEntityCoordsWithCheck(spawnedVehicle, spawnLocation, skipZCheck))
                    debugLoging("Coords checked successfully.")
                    
                    local ped = PlayerPedId()
                    local hasOneSpawnPoint = true
                    if garage.onespawn then
                        if tostring(garage.onespawn.x) == "0" or tostring(garage.onespawn.x) == "0.0" then
                            hasOneSpawnPoint = false
                        end
                    end
                    
                    debugLoging("Is one spawn: " .. json.encode(hasOneSpawnPoint))
                    
                    -- Camera animation
                    if cam ~= nil then
                        if not Config.Misc.DisableVehicleHideAnimation and not hasOneSpawnPoint then
                            debugLoging("Animation hide")
                            
                            local startCamPos = GetCamCoord(cam)
                            local endCamPos = vector3(startCamPos.x + 1.0, startCamPos.y + 1.0, startCamPos.z + 0.5)
                            local totalFrames = 355
                            local frameDelay = 1
                            
                            for frame = 1, totalFrames, 1 do
                                local progress = frame / totalFrames
                                local x = startCamPos.x + (endCamPos.x - startCamPos.x) * progress
                                local y = startCamPos.y + (endCamPos.y - startCamPos.y) * progress
                                local z = startCamPos.z + (endCamPos.z - startCamPos.z) * progress
                                SetCamCoord(cam, x, y, z)
                                Wait(frameDelay)
                            end
                            
                            debugLoging("Animation hide ended.")
                        else
                            debugLoging("Skipping animation hide")
                        end
                    end
                    
                    -- Wait for player to enter vehicle
                    local maxWaitAttempts = 15
                    local waitAttempts = 0
                    while IsVehicleSeatFree(spawnedVehicle, -1) do
                        Wait(100)
                        debugLoging("Vehicle seat free...")
                        waitAttempts = waitAttempts + 1
                        if waitAttempts >= maxWaitAttempts then
                            break
                        end
                    end
                    
                    debugLoging("Vehicle seat not free.")
                    
                    -- Release boat anchor after player enters
                    if garage.Type == "sea" then
                        Wait(500)  -- Give a moment for player to be fully in vehicle
                        SetBoatAnchor(spawnedVehicle, false)
                        debugLoging("Boat anchor released.")
                    end
                    
                    setFuel(spawnedVehicle, CurrentVehicle[1].data.fuelLevel)
                    SetCamActive(cam, false)
                    RenderScriptCams(false, true, 1000, true, true)
                    cam = nil
                    
                    CurrentVehicle = {}
                    CurrentFrame = ""
                    CurrentTemporaryCoords = nil
                    CurrentTemporaryHeading = nil
                    BusyspinnerOff()
                    isVehicleLoading = false
                    isTakingOut = false
                    debugLoging("Vehicle successfully taken out of garage.")
                end)
            else
                isTakingOut = false
                print("Vehicle not found in server-side request. 07")
            end
        end, plate, modelHash, spawnLocation, CurrentTemporaryHeading, isSpawnerMode)
    end
end

-- Get closest vehicle
function GetClosestAnyVehicle(coords, maxDistance)
    local vehicles = GetGamePool("CVehicle")
    local closestDistance = maxDistance
    local closestVehicle = nil
    
    for _, vehicle in pairs(vehicles) do
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = #(coords - vehicleCoords)
        if distance < closestDistance then
            closestDistance = distance
            closestVehicle = vehicle
        end
    end
    
    return closestVehicle
end

local isHidingVehicle = false

-- Hide/park current vehicle
function hideCurrentVehicle()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsUsing(playerPed)
    
    if isHidingVehicle then
        debugLoging("Already hiding vehicle!")
        return
    end
    
    isHidingVehicle = true
    
    -- Timeout for hiding flag
    Citizen.CreateThread(function()
        Wait(5000)
        isHidingVehicle = false
    end)
    
    -- Get closest vehicle if player not in one
    if vehicle == 0 or not DoesEntityExist(vehicle) then
        local playerCoords = GetEntityCoords(playerPed)
        vehicle = GetClosestAnyVehicle(playerCoords, 12.0)
    end
    
    if vehicle == 0 or not DoesEntityExist(vehicle) then
        return
    end
    
    local vehicleProps = Fr.GetVehicleProperties(vehicle)
    local plate = vehicleProps.plate
    local vehicleType = GetVehicleType(vehicle)
    vehicleProps.fuelLevel = getFuel(vehicle)
    
    local garage = garages[tostring(currentGarageIndex)]
    
    -- Create temporary garage if opening from custom location
    if isInOpenGarageHere then
        garage = {
            Index = "custom_garage",
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
            Gang = isInOpenGarageGang and { name = gangName, grade = 0, type = "owned" } or false,
            Job = false
        }
    end
    
    -- Check if vehicle type matches garage type
    if vehTypes[vehicleType] ~= garage.Type then
        return
    end
    
    -- Check vehicle ownership
    Fr.TriggerServerCallback("mt-garages:checkIfVehicleIsOwned", function(isOwned)
        if isOwned == true or garage.Job or garage.Gang then
            -- Handle boat/sea vehicles differently
            if garage.Type == "sea" then
                local exitCoords = nil
                
                if Config.Misc.Peds.Toggle then
                    local accessPoint = createdGarages[tostring(garage.Index)].AccessPoint
                    exitCoords = SH.GetForwardVector(accessPoint)
                else
                    exitCoords = garage.AccessPoint.xyz
                end
                
                DoScreenFadeOut(400)
                Wait(1000)
                SetEntityCoords(playerPed, exitCoords, false, false, false, true)
                SetEntityHeading(playerPed, garage.AccessPoint.w)
                DoScreenFadeIn(400)
                
                removeKeys(vehicle, vehicleProps.model, plate)
                SH.fadeOutEntity(vehicle, false)
                local netId = NetworkGetNetworkIdFromEntity(vehicle)
                TriggerServerEvent("mt-garages:serverDeleteVehicle", netId)
                
                if Config.Misc.Target == "none" then
                    Wait(100)
                    showTextUI(TranslateIt("header_type_" .. garage.Type), garage.AccessPoint)
                end
            else
                -- Exit vehicle and delete it
                TaskLeaveVehicle(playerPed, vehicle, 1)
                
                while not IsVehicleSeatFree(vehicle, -1) do
                    Wait(100)
                end
                
                removeKeys(vehicle, vehicleProps.model, plate)
                SH.fadeOutEntity(vehicle, false)
                local netId = NetworkGetNetworkIdFromEntity(vehicle)
                TriggerServerEvent("mt-garages:serverDeleteVehicle", netId)
                
                -- Hide zone TextUI immediately after storing vehicle
                if Config.Misc.Target == "none" then
                    hideTextUI("mt-garages-zone")
                end
            end
        else
            sendNotify(TranslateIt("not_owner"), "error", 5000)
        end
    end, vehicleProps.plate, vehicleProps, garage.Index)
end