Citizen.CreateThread(function()
    -- Wait for Framework initialization
    while Framework == nil do
        Wait(5)
    end

    -- Rate limiting cache for getBasicData callback
    local rateLimitCache = {}

    -- Get basic garage/impound data with rate limiting
    Fr.RegisterServerCallback("mt-garages:getBasicData", function(source, cb)
        local currentTime = os.time()
        
        -- Rate limit: 5 minutes (300 seconds)
        if rateLimitCache[source] then
            local timeDiff = currentTime - rateLimitCache[source]
            if timeDiff < 300 then
                cb({ error = true })
                return
            end
        end
        
        rateLimitCache[source] = currentTime
        
        cb({
            garages = garages,
            impounds = impounds,
            jobvehicles = vehicles,
            gangvehicles = gangvehicles,
            vehicleslabels = vehicleslabels
        })
    end)

    -- Get vehicles for player
    Fr.RegisterServerCallback("mt-garages:getVehicles", function(source, cb, garageIndex, isImpound, isGang)
        local identifier = trim(Fr.GetIndentifier(source))
        local player = Fr.getPlayerFromId(source)
        local playerJob = Fr.GetPlayerJob(player)
        local playerGang = Fr.GetPlayerGang(player)
        local garage = nil

        -- Determine which garage/impound to use
        if not isImpound then
            garage = garages[garageIndex]
            
            if not garage then
                -- Create temporary garage for gang
                garage = {
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
                    Gang = isGang and { name = playerGang.name, grade = playerGang.grade, type = "owned" } or false,
                    Job = false
                }
            end
        else
            garage = impounds[garageIndex]
        end

        -- Check if player's job is allowed in this impound
        local hasJobAccess = false
        if garage.AllowedJobs then
            for _, allowedJob in pairs(garage.AllowedJobs) do
                if allowedJob == playerJob.name then
                    hasJobAccess = true
                end
            end
        end

        local isJobGarage = false
        local isGangGarage = false
        
        if not isImpound then
            isJobGarage = garage.Job
            isGangGarage = garage.Gang
        end

        -- Handle job garages
        if isJobGarage then
            -- Case-insensitive job name comparison
            local playerJobName = playerJob.name and string.lower(tostring(playerJob.name)) or ""
            local garageJobName = isJobGarage.name and string.lower(tostring(isJobGarage.name)) or ""
            
            if playerJobName ~= garageJobName then
                print("[DEBUG] Job name mismatch - Player job: " .. tostring(playerJob.name) .. ", Garage job: " .. tostring(isJobGarage.name))
                cb({})
                return
            end

            if isJobGarage.type == "owned" then
                -- Owned job vehicles - use case-insensitive comparison
                MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE LOWER(`job`) = LOWER(?)", { isJobGarage.name }, function(result)
                    local vehicles = {}
                    
                    -- Debug logging
                    print("[DEBUG] Job garage query - Garage job: " .. tostring(isJobGarage.name) .. ", Player job: " .. tostring(playerJob.name))
                    print("[DEBUG] Found " .. #result .. " vehicles with job field")
                    
                    for _, vehicle in pairs(result) do
                        -- Case-insensitive comparison
                        local vehicleJob = vehicle.job and string.lower(tostring(vehicle.job)) or ""
                        local garageJob = isJobGarage.name and string.lower(tostring(isJobGarage.name)) or ""
                        
                        if vehicleJob == garageJob then
                            if vehicle.jobPrivate ~= nil and vehicle.jobPrivate ~= "" then
                                -- Private job vehicle
                                if vehicle.jobPrivate == identifier then
                                    print("[DEBUG] Adding private vehicle: " .. tostring(vehicle.plate))
                                    table.insert(vehicles, vehicle)
                                end
                            else
                                -- Check grade access - if vehicle has no grade (nil or 0), show to all
                                local vehicleGrade = vehicle.jobGrade
                                
                                -- If vehicle has no grade restriction, show to all job members
                                if vehicleGrade == nil or vehicleGrade == 0 or vehicleGrade == "" then
                                    print("[DEBUG] Adding vehicle (no grade): " .. tostring(vehicle.plate))
                                    table.insert(vehicles, vehicle)
                                else
                                    -- Has grade restriction, check if player grade meets requirement
                                    if playerJob.grade and correctGrade(vehicleGrade, playerJob.grade) then
                                        print("[DEBUG] Adding vehicle (grade check passed): " .. tostring(vehicle.plate) .. " (vehicle grade: " .. tostring(vehicleGrade) .. ", player grade: " .. tostring(playerJob.grade) .. ")")
                                        table.insert(vehicles, vehicle)
                                    else
                                        print("[DEBUG] Skipping vehicle (grade check failed): " .. tostring(vehicle.plate) .. " (vehicle grade: " .. tostring(vehicleGrade) .. ", player grade: " .. tostring(playerJob.grade) .. ")")
                                    end
                                end
                            end
                        else
                            print("[DEBUG] Job name mismatch - Vehicle job: " .. tostring(vehicle.job) .. ", Garage job: " .. tostring(isJobGarage.name))
                        end
                    end
                    
                    print("[DEBUG] Returning " .. #vehicles .. " vehicles to client")
                    cb(vehicles)
                end)
            elseif isJobGarage.type == "personal" then
                -- Personal vehicles locked to job
                MySQL.query(
                    "SELECT * FROM " .. Fr.Table .. " WHERE (" .. Fr.OwnerTable .. " = ? OR co_owner = ?) AND `jobLocked` = ?",
                    { identifier, identifier, isJobGarage.name },
                    function(result)
                        cb(result)
                    end
                )
            end
        -- Handle gang garages
        elseif isGangGarage then
            -- Check if player's gang matches garage gang (case-insensitive)
            if not playerGang or not playerGang.name then
                print("[DEBUG] No player gang found")
                cb({})
                return
            end
            
            local playerGangName = string.lower(tostring(playerGang.name))
            local garageGangName = string.lower(tostring(isGangGarage.name))
            
            if playerGangName ~= garageGangName then
                print("[DEBUG] Gang name mismatch - Player gang: " .. tostring(playerGang.name) .. ", Garage gang: " .. tostring(isGangGarage.name))
                cb({})
                return
            end
            
            if isGangGarage.type == "owned" then
                -- Owned gang vehicles - use case-insensitive comparison
                MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE LOWER(`gang`) = LOWER(?)", { isGangGarage.name }, function(result)
                    local vehicles = {}
                    
                    -- Debug logging
                    print("[DEBUG] Gang garage query - Garage gang: " .. tostring(isGangGarage.name) .. ", Player gang: " .. tostring(playerGang and playerGang.name or "nil"))
                    print("[DEBUG] Found " .. #result .. " vehicles with gang field")
                    
                    for _, vehicle in pairs(result) do
                        -- Case-insensitive comparison
                        local vehicleGang = vehicle.gang and string.lower(tostring(vehicle.gang)) or ""
                        local garageGang = isGangGarage.name and string.lower(tostring(isGangGarage.name)) or ""
                        
                        if vehicleGang == garageGang then
                            if vehicle.gangPrivate ~= nil and vehicle.gangPrivate ~= "" then
                                -- Private gang vehicle
                                if vehicle.gangPrivate == identifier then
                                    print("[DEBUG] Adding private gang vehicle: " .. tostring(vehicle.plate))
                                    table.insert(vehicles, vehicle)
                                end
                            else
                                -- Check grade access - if vehicle has no grade (nil or 0), show to all
                                local vehicleGrade = vehicle.gangGrade
                                
                                -- If vehicle has no grade restriction, show to all gang members
                                if vehicleGrade == nil or vehicleGrade == 0 or vehicleGrade == "" then
                                    print("[DEBUG] Adding gang vehicle (no grade): " .. tostring(vehicle.plate))
                                    table.insert(vehicles, vehicle)
                                else
                                    -- Has grade restriction, check if player grade meets requirement
                                    if playerGang and playerGang.grade and correctGrade(vehicleGrade, playerGang.grade) then
                                        print("[DEBUG] Adding gang vehicle (grade check passed): " .. tostring(vehicle.plate))
                                        table.insert(vehicles, vehicle)
                                    end
                                end
                            end
                        end
                    end
                    
                    print("[DEBUG] Returning " .. #vehicles .. " gang vehicles to client")
                    cb(vehicles)
                end)
            elseif isGangGarage.type == "personal" then
                -- Personal vehicles locked to gang
                MySQL.query(
                    "SELECT * FROM " .. Fr.Table .. " WHERE (" .. Fr.OwnerTable .. " = ? OR co_owner = ?) AND `gangLocked` = ?",
                    { identifier, identifier, isGangGarage.name },
                    function(result)
                        cb(result)
                    end
                )
            end
        -- Handle impound
        elseif isImpound then
            if hasJobAccess then
                -- Staff can see all impounded vehicles at this location, plus their own
                MySQL.query(
                    "SELECT * FROM " .. Fr.Table .. " WHERE ((vehicleImpound = ?) OR (" .. Fr.OwnerTable .. " = ? OR co_owner = ? OR job = ? OR gang = ?))",
                    { garage.Index, identifier, identifier, playerJob.name, playerGang.name },
                    function(result)
                        local vehicles = {}
                        
                        for _, vehicle in pairs(result) do
                            if vehicle[Fr.OwnerTable] ~= identifier then
                                vehicle.ownerName = Fr.GetPlayerName(vehicle[Fr.OwnerTable])
                            end
                            table.insert(vehicles, vehicle)
                        end
                        
                        cb(vehicles)
                    end
                )
            else
                -- Regular players can only see their retrievable vehicles
                MySQL.query(
                    "SELECT * FROM " .. Fr.Table .. " WHERE (" .. Fr.OwnerTable .. " = ? OR co_owner = ? OR job = ? OR gang = ?) AND `retrievable` = 1",
                    { identifier, identifier, playerJob.name, playerGang.name },
                    function(result)
                        cb(result)
                    end
                )
            end
        -- Handle regular garage
        else
            MySQL.query(
                "SELECT * FROM " .. Fr.Table .. " WHERE (" .. Fr.OwnerTable .. " = ? OR co_owner = ?)",
                { identifier, identifier },
                function(result)
                    local vehicles = {}
                    
                    for _, vehicle in pairs(result) do
                        -- Filter by garage if transfer is disabled but unique garages are kept
                        local garageMatch = true
                        if Config.Misc.DisableVehiclesTransferButKeepUniqueGarages then
                            if tostring(vehicle.vehicleGarage) ~= tostring(garageIndex) then
                                garageMatch = false
                            end
                        end

                        -- Filter out job/gang vehicles
                        if garageMatch and (vehicle.job == "" or vehicle.job == nil) and
                           (vehicle.gang == "" or vehicle.gang == nil) and
                           (vehicle.jobLocked == "" or vehicle.jobLocked == nil or vehicle.jobLocked == playerJob.name) and
                           (vehicle.gangLocked == "" or vehicle.gangLocked == nil or vehicle.gangLocked == playerGang.name) then
                            table.insert(vehicles, vehicle)
                        end
                    end
                    
                    cb(vehicles)
                end
            )
        end
    end)

    -- Return impounded vehicle to player
    Fr.RegisterServerCallback("mt-garages:returnToPlayer", function(source, cb, plate)
        local identifier = Fr.GetIndentifier(source)
        local player = Fr.getPlayerFromId(source)
        local playerJob = Fr.GetPlayerJob(player)
        
        MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { plate }, function(result)
            if #result > 0 then
                local vehicleImpound = result[1].vehicleImpound
                local canReturn = true
                
                if canReturn then
                    TriggerEvent("mt-garages:updateState", plate)
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end)
    end)

    -- Update vehicle network ID
    RegisterServerEvent("mt-garages:updateNet")
    AddEventHandler("mt-garages:updateNet", function(plate, networkId)
        MySQL.Async.execute(
            "UPDATE " .. Fr.Table .. " SET `" .. Fr.StoredTable .. "` = 1, `vehicleid` = @networkid WHERE `plate` = @plate",
            {
                ["@plate"] = plate,
                ["@networkid"] = networkId
            }
        )
    end)

    -- Remove car from parking (take out)
    Fr.RegisterServerCallback("mt-garages:removeCarFromParking", function(source, cb, plate, model, coords, heading, isSpawner)
        local identifier = Fr.GetIndentifier(source)
        local vehicleData = nil
        local player = Fr.getPlayerFromId(source)
        local playerJob = Fr.GetPlayerJob(player)
        local playerGang = Fr.GetPlayerGang(player)
        
        -- Spawner mode doesn't need ownership check
        if isSpawner then
            -- Check if player can take out car
            local canReturn, message = canTakeOutCar(source, plate, { model = model })
            if not canReturn then
                TriggerClientEvent("op-uniqueNotif:sendNotify", source, message or "You cannot take out this vehicle!", "error", 5000)
                cb(false)
                return
            end
            cb(true)
            return
        end
        
        MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { plate }, function(result)
            plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace
            
            local vehicleFound = false
            
            for _, vehicle in pairs(result) do
                if vehicle[Fr.OwnerTable] == identifier or 
                   vehicle.co_owner == identifier or 
                   vehicle.job == playerJob.name or 
                   vehicle.gang == playerGang.name then
                    vehicleFound = vehicle
                end
            end
            
            if vehicleFound ~= false then
                -- Check if vehicle is retrievable from impound
                if vehicleFound[Fr.StoredTable] == 1 and vehicleFound.retrievable == 0 then
                    -- If not retrievable, check if player has authorized job (is a staff member)
                    local canRelease = false
                    local impoundData = false
                    
                    -- Get impound data
                    for _, imp in pairs(createdImpounds) do
                        if tostring(imp.Index) == tostring(vehicleFound.vehicleImpound) then
                            impoundData = imp
                            break
                        end
                    end
                    
                    if impoundData and impoundData.AllowedJobs then
                        for _, job in pairs(impoundData.AllowedJobs) do
                            if job == playerJob.name then
                                canRelease = true
                                break
                            end
                        end
                    end
                    
                    if not canRelease then
                        cb({ status = false, message = "This vehicle can only be released by a fraction member!" })
                        return
                    end
                end

                if vehicleFound[Fr.StoredTable] == 0 or vehicleFound[Fr.StoredTable] == 1 then
                    cb(true)
                else
                    cb(false)
                end
            else
                cb(false)
            end
        end)
    end)

    -- Update vehicle state (mark as stored/out)
    RegisterServerEvent("mt-garages:updateState")
    AddEventHandler("mt-garages:updateState", function(plate, netId)
        local source = source
        MySQL.Async.execute(
            "UPDATE `" .. Fr.Table .. "` SET `" .. Fr.StoredTable .. "` = 0, vehicleid = NULL, `retrievable` = 1, `towedPrice` = 0, `towedAfterPrice` = 0, `impoundReason` = NULL, `towedOutBy` = NULL, `isTowedOut` = 0 WHERE plate = @plate",
            { ["@plate"] = plate },
            function(rowsChanged)
                if rowsChanged > 0 then
                    -- Call hook
                    MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { plate }, function(result)
                        if result and result[1] then
                            onVehicleImpoundedBack(source, plate, result[1])
                        end
                    end)
                end
            end
        )
        
        -- Server-side deletion
        if netId then
            local entity = NetworkGetEntityFromNetworkId(netId)
            if DoesEntityExist(entity) then
                DeleteEntity(entity)
            end
        end
    end)

    -- Missing server-side deletion event
    RegisterServerEvent("mt-garages:serverDeleteVehicle")
    AddEventHandler("mt-garages:serverDeleteVehicle", function(netId)
        if netId then
            local entity = NetworkGetEntityFromNetworkId(netId)
            if DoesEntityExist(entity) then
                DeleteEntity(entity)
            end
        end
    end)

    -- Check if vehicle is owned by player
    Fr.RegisterServerCallback("mt-garages:checkIfVehicleIsOwned", function(source, cb, plate, vehicleProps, garageIndex)
        local identifier = Fr.GetIndentifier(source)
        local vehicleData = nil
        local garageData = nil
        local player = Fr.getPlayerFromId(source)
        local playerJob = Fr.GetPlayerJob(player)
        local playerGang = Fr.GetPlayerGang(player)
        
        plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace
        
        MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { plate }, function(result)
            local vehicleFound = false
            
            for _, vehicle in pairs(result) do
                if vehicle[Fr.OwnerTable] == identifier or 
                   vehicle.co_owner == identifier or 
                   vehicle.job == playerJob.name or 
                   vehicle.gang == playerGang.name then
                    vehicleFound = vehicle
                end
            end
            
            if vehicleFound ~= false then
                vehicleFound[Fr.VehProps] = json.decode(vehicleFound[Fr.VehProps])
                
                -- Validate vehicle model
                if ESX then
                    if tonumber(vehicleProps.model) ~= tonumber(vehicleFound[Fr.VehProps].model) then
                        cb(false)
                        return
                    end
                elseif QBCore or QBox then
                    if vehicleFound[Fr.VehProps] then
                        if vehicleFound[Fr.VehProps].model then
                            if tonumber(vehicleProps.model) ~= tonumber(vehicleFound[Fr.VehProps].model) then
                                cb(false)
                                return
                            end
                        end
                    elseif vehicleFound.hash and vehicleFound.plate then
                        if tonumber(vehicleFound.hash) ~= tonumber(vehicleProps.model) then
                            cb(false)
                            return
                        end
                    else
                        cb(false)
                        return
                    end
                end
                
                -- Check if trying to store personal vehicle in owned job/gang garage
                local garage = garages[tostring(garageIndex)]
                if garage then
                    -- For owned type garages, only allow vehicles with job/gang field set
                    if garage.Job and garage.Job.type == "owned" then
                        -- Check if vehicle has job field set (not a personal vehicle)
                        if not vehicleFound.job or vehicleFound.job == "" or vehicleFound.job == nil then
                            cb(false)
                            return
                        end
                        -- Verify vehicle job matches garage job
                        local vehicleJob = vehicleFound.job and string.lower(tostring(vehicleFound.job)) or ""
                        local garageJob = garage.Job.name and string.lower(tostring(garage.Job.name)) or ""
                        if vehicleJob ~= garageJob then
                            cb(false)
                            return
                        end
                    elseif garage.Gang and garage.Gang.type == "owned" then
                        -- Check if vehicle has gang field set (not a personal vehicle)
                        if not vehicleFound.gang or vehicleFound.gang == "" or vehicleFound.gang == nil then
                            cb(false)
                            return
                        end
                        -- Verify vehicle gang matches garage gang
                        local vehicleGang = vehicleFound.gang and string.lower(tostring(vehicleFound.gang)) or ""
                        local garageGang = garage.Gang.name and string.lower(tostring(garage.Gang.name)) or ""
                        if vehicleGang ~= garageGang then
                            cb(false)
                            return
                        end
                    end
                end
                
                -- Determine job/gang lock
                local lockType = false
                local lockName = nil
                
                if garage then
                    if garage.Job and garage.Job.type == "personal" then
                        lockName = garage.Job.name
                        lockType = "job"
                    elseif garage.Gang and garage.Gang.type == "personal" then
                        lockName = garage.Gang.name
                        lockType = "gang"
                    end
                end
                
                -- Update vehicle in database
                MySQL.Async.execute(
                    "UPDATE `" .. Fr.Table .. "` SET `" .. Fr.VehProps .. "` = @vehicle, `vehicleid` = NULL, `" .. Fr.StoredTable .. "` = 0, `vehicleGarage` = @garage, `jobLocked` = @jobLocked, `gangLocked` = @gangLocked WHERE `plate` = @plate",
                    {
                        ["@vehicle"] = json.encode(vehicleProps),
                        ["@plate"] = plate,
                        ["@garage"] = garageIndex,
                        ["@jobLocked"] = (lockType == "job" and lockName) or nil,
                        ["@gangLocked"] = (lockType == "gang" and lockName) or nil
                    }
                )
                
                cb(true)
            else
                cb(false)
            end
        end)
    end)

    -- Transfer vehicle to different garage
    Fr.RegisterServerCallback("mt-garages:transferVehicle", function(source, cb, plate, garageIndex)
        local identifier = Fr.GetIndentifier(source)
        local player = Fr.getPlayerFromId(source)
        local transferPrice = Config.Misc.TransferPrice
        local playerJob = Fr.GetPlayerJob(player)
        local playerGang = Fr.GetPlayerGang(player)
        local bankMoney = Fr.GetMoney(player, "bank")
        local cashMoney = Fr.GetMoney(player, "money")
        local hasMoney = false
        
        -- Check if player can afford transfer
        if transferPrice <= cashMoney then
            Fr.ManageMoney(player, "money", "remove", transferPrice)
            hasMoney = true
        elseif transferPrice <= bankMoney then
            Fr.ManageMoney(player, "bank", "remove", transferPrice)
            hasMoney = true
        end
        
        if hasMoney then
            MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { plate }, function(result)
                local vehicleFound = false
                
                for _, vehicle in pairs(result) do
                    if vehicle[Fr.OwnerTable] == identifier or 
                       vehicle.co_owner == identifier or 
                       vehicle.job == playerJob.name or 
                       vehicle.gang == playerGang.name then
                        vehicleFound = vehicle
                    end
                end
                
                if vehicleFound ~= false then
                    MySQL.Async.execute(
                        "UPDATE `" .. Fr.Table .. "` SET `vehicleGarage` = @garage WHERE `plate` = @plate",
                        {
                            ["@plate"] = plate,
                            ["@garage"] = garageIndex
                        }
                    )
                    cb(true)
                else
                    cb(false)
                end
            end)
        else
            cb(false)
        end
    end)

    -- Start impound process
    Fr.RegisterServerCallback("mt-garages:startImpound", function(source, cb, vehicleData)
        local player = Fr.getPlayerFromId(source)
        local identifier = Fr.GetIndentifier(source)
        local towingPrice = Config.Misc.TowingPrice
        local playerJob = Fr.GetPlayerJob(player)
        local playerGang = Fr.GetPlayerGang(player)
        
        -- Check if vehicle is already impounded
        if vehicleData.isTowedOut and vehicleData.retrievable then
            local towedToTime = vehicleData.towedToDate / 1000
            local currentTime = os.time()
            
            if towedToTime > currentTime then
                towingPrice = vehicleData.towedPrice
            else
                towingPrice = vehicleData.towedAfterPrice
            end
        elseif vehicleData.isTowedOut and not vehicleData.retrievable then
            cb("no retv")
            return
        end
        
        local bankMoney = Fr.GetMoney(player, "bank")
        local cashMoney = Fr.GetMoney(player, "money")
        local hasMoney = false
        
        -- Check if player can afford impound
        if towingPrice <= cashMoney then
            Fr.ManageMoney(player, "money", "remove", towingPrice)
            hasMoney = true
        elseif towingPrice <= bankMoney then
            Fr.ManageMoney(player, "bank", "remove", towingPrice)
            hasMoney = true
        end
        
        if hasMoney then
            MySQL.query(
                "SELECT * FROM " .. Fr.Table .. " WHERE (" .. Fr.OwnerTable .. " = ? OR co_owner = ? OR job = ? OR gang = ?) AND plate = ? LIMIT 1",
                { identifier, identifier, playerJob.name, playerGang.name, vehicleData.plate },
                function(result)
                    if result[1] ~= nil then
                        cb(result[1].vehicleid)
                    else
                        cb(nil)
                    end
                end
            )
        else
            cb("no founds")
        end
    end)

    -- Plate changer
    Fr.RegisterServerCallback("mt-garages:plateChanger", function(source, cb, newPlate, oldPlate, vehicle)
        local identifier = Fr.GetIndentifier(source)
        local vehicleData = nil
        
        -- Check if new plate is already taken
        MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { newPlate }, function(result)
            if #result > 0 then
                cb(false)
                return
            else
                -- Get vehicle with old plate
                MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { oldPlate }, function(vehicleResult)
                    cb(true)
                    
                    if #vehicleResult > 0 then
                        local vehicleProps = json.decode(vehicleResult[1][Fr.VehProps])
                        vehicleProps.plate = newPlate
                        
                        -- Update keys for online player
                        local targetPlayer = Fr.GetPlayerFromIdentifier(vehicleResult[1][Fr.OwnerTable])
                        if targetPlayer then
                            local targetSource = Fr.GetSourceFromPlayerObject(targetPlayer)
                            TriggerClientEvent("mt-garages:changeKeys", targetSource, newPlate, oldPlate, vehicle, vehicleProps.model)
                        end
                        
                        -- Update database
                        MySQL.Async.execute(
                            "UPDATE `" .. Fr.Table .. "` SET `" .. Fr.VehProps .. "` = @vehicle, `plate` = @newplate WHERE `plate` = @plate",
                            {
                                ["@vehicle"] = json.encode(vehicleProps),
                                ["@plate"] = oldPlate,
                                ["@newplate"] = newPlate
                            }
                        )
                    end
                end)
            end
        end)
    end)

    -- Generate random plate
    function generatePlate()
        math.randomseed(GetGameTimer())
        
        local characters = {
            "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
            "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
            "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"
        }
        
        local plate = nil
        
        for i = 1, 8 do
            if plate == nil then
                plate = characters[math.random(#characters)]
            else
                plate = plate .. characters[math.random(#characters)]
            end
        end
        
        if IsPlateTaken(plate) then
            return generatePlate()
        end
        
        return plate
    end

    -- Check if plate is taken
    function IsPlateTaken(plate)
        local p = promise.new()
        
        MySQL.scalar("SELECT plate FROM `" .. Fr.Table .. "` WHERE plate = ?", { plate }, function(result)
            p:resolve(result ~= nil)
        end)
        
        return Citizen.Await(p)
    end

    -- Get vehicle info for sub owner
    Fr.RegisterServerCallback("mt-garages:getVehicleInfoForSubOwner", function(source, cb, plate, identifier, value)
        local identifier = Fr.GetIndentifier(source)
        local vehicleData = nil
        
        plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace
        
        MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { plate }, function(result)
            local vehicleFound = false
            
            for _, vehicle in pairs(result) do
                if vehicle[Fr.OwnerTable] == identifier then
                    vehicleFound = vehicle
                end
            end
            
            if vehicleFound ~= false then
                cb(vehicleFound)
            else
                cb(false)
            end
        end)
    end)

    -- Fetch nearby players
    Fr.RegisterServerCallback("mt-garages:fetchNearbyPlayersNames", function(source, cb, nearbyPlayers)
        local playersList = {}
        
        for _, playerData in pairs(nearbyPlayers) do
            local identifier = Fr.GetIndentifier(playerData.id)
            
            table.insert(playersList, {
                label = Fr.GetPlayerName(playerData.id) or "Unknown",
                value = identifier or "N/A"
            })
        end
        
        cb(playersList)
    end)

    -- Set new sub owner
    Fr.RegisterServerCallback("mt-garages:setNewSubOwner", function(source, cb, plate, newOwnerId, newOwnerName)
        local identifier = Fr.GetIndentifier(source)
        local vehicleData = nil
        
        plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace
        
        MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { plate }, function(result)
            local vehicleFound = false
            
            for _, vehicle in pairs(result) do
                if vehicle[Fr.OwnerTable] == identifier then
                    vehicleFound = vehicle
                end
            end
            
            if vehicleFound ~= false then
                local player = Fr.getPlayerFromId(source)
                local canAfford = payForSubOwner(Config.SubOwners.Price, player)
                
                if canAfford then
                    cb({ status = true })
                    
                    MySQL.Async.execute(
                        "UPDATE " .. Fr.Table .. " SET `co_owner` = @co_owner, `co_owner_name` = @co_owner_name WHERE `plate` = @plate",
                        {
                            ["@plate"] = plate,
                            ["@co_owner"] = newOwnerId,
                            ["@co_owner_name"] = newOwnerName
                        }
                    )
                    
                    -- Notify new co-owner if online
                    local targetPlayer = Fr.GetPlayerFromIdentifier(newOwnerId)
                    if targetPlayer then
                        local targetSource = Fr.GetSourceFromPlayerObject(targetPlayer)
                        TriggerClientEvent("op-uniqueNotif:sendNotify", targetSource, "You got keys to vehicle.", "success", 5000)
                    end
                    
                    -- Webhook log
                    local ownerName = GetPlayerName(source) .. " (" .. Fr.GetIndentifier(source) .. ")"
                    local coOwnerName = newOwnerName .. " (" .. newOwnerId .. ")"
                    local description = string.format(WHData.subOwnerAdded.desc, plate, ownerName, coOwnerName)
                    SendWebHook(WHData.subOwnerAdded.head, 65390, description)
                else
                    cb({ status = false })
                end
            else
                cb({ status = false })
            end
        end)
    end)

    -- Remove sub owner
    Fr.RegisterServerCallback("mt-garages:removeSubOwner", function(source, cb, plate)
        local identifier = Fr.GetIndentifier(source)
        local vehicleData = nil
        
        plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace
        
        MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", { plate }, function(result)
            local vehicleFound = false
            
            for _, vehicle in pairs(result) do
                if vehicle[Fr.OwnerTable] == identifier then
                    vehicleFound = vehicle
                end
            end
            
            if vehicleFound ~= false then
                MySQL.Async.execute(
                    "UPDATE " .. Fr.Table .. " SET `co_owner` = @co_owner, `co_owner_name` = @co_owner_name WHERE `plate` = @plate",
                    {
                        ["@plate"] = plate,
                        ["@co_owner"] = "",
                        ["@co_owner_name"] = ""
                    }
                )
                
                cb({ status = true })
                
                -- Webhook log
                local ownerName = GetPlayerName(source) .. " (" .. Fr.GetIndentifier(source) .. ")"
                local description = string.format(WHData.subOwnerDel.desc, plate, ownerName)
                SendWebHook(WHData.subOwnerDel.head, 65390, description)
            else
                cb({ status = false })
            end
        end)
    end)
end)