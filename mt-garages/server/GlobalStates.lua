Citizen.CreateThread(function()
    -- Wait for Framework to be initialized
    while Framework == nil do
        Wait(5)
    end
    
    -- Load all global states from database
    function loadGlobalStates()
        -- Load Garages
        MySQL.Async.fetchAll("SELECT * FROM `mtgarages_garages`", {}, function(result)
            local garagesData = {}
            
            for _, garage in pairs(result) do
                local coords = json.decode(garage.Coords)
                local onespawnCoords = json.decode(garage.onespawn)
                
                -- Ensure onespawnCoords is valid
                if not onespawnCoords or type(onespawnCoords) ~= "table" then
                    onespawnCoords = {x = 0.0, y = 0.0, z = 0.0, w = 0.0}
                end
                
                local garageData = {
                    Index = garage.Index,
                    Label = garage.Label,
                    Type = garage.Type,
                    CenterOfZone = vec4(
                        tonumber(coords.CenterOfZone.x) or 0.0,
                        tonumber(coords.CenterOfZone.y) or 0.0,
                        tonumber(coords.CenterOfZone.z) or 0.0,
                        tonumber(coords.CenterOfZone.w) or 0.0
                    ),
                    AccessPoint = vec4(
                        tonumber(coords.AccessPoint.x) or 0.0,
                        tonumber(coords.AccessPoint.y) or 0.0,
                        tonumber(coords.AccessPoint.z) or 0.0,
                        tonumber(coords.AccessPoint.w) or 0.0
                    ),
                    Radius = garage.Radius,
                    IsPrivate = garage.isPrivate,
                    PrivatePlayersList = json.decode(garage.privatePlayers),
                    zPoints = json.decode(garage.zpoints),
                    blipDisabled = (garage.blipDisabled == 1 or garage.blipDisabled == true),
                    onespawn = vec4(
                        tonumber(onespawnCoords.x) or 0.0,
                        tonumber(onespawnCoords.y) or 0.0,
                        tonumber(onespawnCoords.z) or 0.0,
                        tonumber(onespawnCoords.w) or 0.0
                    )
                }
                
                -- Add Job data if exists
                if garage.JobName ~= nil and garage.JobName ~= "" then
                    garageData.Job = {
                        name = garage.JobName,
                        grade = garage.JobGrade,
                        type = garage.JobMode
                    }
                end
                
                -- Add Gang data if exists
                if garage.GangName ~= nil and garage.GangName ~= "" then
                    garageData.Gang = {
                        name = garage.GangName,
                        grade = garage.GangGrade,
                        type = garage.GangMode
                    }
                end
                
                garagesData[tostring(garage.Index)] = garageData
            end
            
            garages = garagesData
        end)
        
        -- Load Impounds
        MySQL.Async.fetchAll("SELECT * FROM `mtgarages_impounds`", {}, function(result)
            local impoundsData = {}
            
            for _, impound in pairs(result) do
                local coords = json.decode(impound.Coords)
                
                local impoundData = {
                    Index = impound.Index,
                    Label = impound.Label,
                    Type = impound.Type,
                    Coords = vec4(
                        tonumber(coords.x) or 0.0,
                        tonumber(coords.y) or 0.0,
                        tonumber(coords.z) or 0.0,
                        tonumber(coords.w) or 0.0
                    ),
                    AllowedJobs = json.decode(impound.AllowedJobs),
                    blipDisabled = (impound.blipDisabled == 1 or impound.blipDisabled == true)
                }
                
                impoundsData[tostring(impound.Index)] = impoundData
            end
            
            impounds = impoundsData
        end)
        
        -- Load Vehicle Labels
        MySQL.Async.fetchAll("SELECT * FROM `mtgarages_vehicles`", {}, function(result)
            local vehiclesData = {}
            
            for _, vehicle in pairs(result) do
                local vehicleData = {
                    model = vehicle.model,
                    label = vehicle.label
                }
                
                vehiclesData[tostring(vehicle.model)] = vehicleData
            end
            
            vehicleslabels = vehiclesData
        end)
        
        -- Load Job Vehicles
        MySQL.Async.fetchAll("SELECT * FROM `mtgarages_jobvehicles`", {}, function(result)
            local vehiclesData = {}
            
            for _, vehicle in pairs(result) do
                local vehicleData = {
                    model = vehicle.model,
                    gradesAllowed = json.decode(vehicle.gradesAllowed),
                    job = vehicle.job,
                    properties = json.decode(vehicle.properties),
                    type = vehicle.type,
                    index = vehicle.index
                }
                
                vehiclesData[tostring(vehicle.index)] = vehicleData
            end
            
            vehicles = vehiclesData
        end)
        
        -- Load Gang Vehicles
        MySQL.Async.fetchAll("SELECT * FROM `mtgarages_gangvehicles`", {}, function(result)
            local gangVehiclesData = {}
            
            for _, vehicle in pairs(result) do
                local vehicleData = {
                    model = vehicle.model,
                    gradesAllowed = json.decode(vehicle.gradesAllowed),
                    gang = vehicle.gang,
                    properties = json.decode(vehicle.properties),
                    type = vehicle.type,
                    index = vehicle.index
                }
                
                gangVehiclesData[tostring(vehicle.index)] = vehicleData
            end
            
            gangvehicles = gangVehiclesData
        end)
    end
    
    -- Get all player identifiers
    function GetPlayerIds(source)
        local identifiers = GetPlayerIdentifiers(source)
        local result = {}
        
        for _, identifier in ipairs(identifiers) do
            local prefix, value = string.match(identifier, "([^:]+):(.+)")
            if prefix and value then
                table.insert(result, prefix .. ":" .. value)
            end
        end
        
        return result
    end
    
    -- Check if player is allowed admin access
    function isAllowedAdmin(source)
        local isAdmin = IsPlayerAceAllowed(tostring(source), "mtgarages.admin")
        local playerIdentifier = Fr.GetIndentifier(source)
        local playerIds = GetPlayerIds(source)
        
        -- Check ACE permissions
        if not isAdmin then
            -- Check if any identifier is in admin list
            for _, identifier in pairs(playerIds) do
                if Config.AdminPanelPlayers[identifier] then
                    isAdmin = true
                end
            end
        end
        
        -- Check if player identifier is in admin list
        if not isAdmin then
            if Config.AdminPanelPlayers[playerIdentifier] then
                isAdmin = true
            end
        end
        
        return isAdmin
    end
    
    -- Server callback for setting admin data
    Fr.RegisterServerCallback("mt-garages:setAdminData", function(source, cb)
        -- Return all vehicles to garage if enabled
        if Config.Misc.VehicleBackToGarage then
            local identifier = Fr.GetIndentifier(source)
            
            if identifier then
                MySQL.Sync.execute(
                    "UPDATE `" .. Fr.Table .. "` SET `" .. Fr.StoredTable .. 
                    "` = 0, vehicleid = NULL WHERE `" .. Fr.OwnerTable .. "` = @ident",
                    { ["@ident"] = identifier }
                )
            end
        end
        
        -- Get player avatar and data
        GetSteamAvatar(source, function(avatar)
            local isAceAllowed = IsPlayerAceAllowed(tostring(source), "mtgarages.admin")
            
            local playerData = {
                name = GetPlayerName(source),
                avatar = avatar,
                group = Fr.GetGroup(source),
                aceAllowed = isAceAllowed,
                identifiers = GetPlayerIds(source)
            }
            
            cb(playerData)
        end)
    end)
end)