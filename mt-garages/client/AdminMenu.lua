plateChangeVehicle = nil

Citizen.CreateThread(function()
    -- Wait for Framework to be initialized
    while Framework == nil do
        Wait(5)
    end

    -- Deep copy function for tables
    local function deepCopy(original)
        local copy = {}
        for key, value in pairs(original) do
            if type(value) == "table" then
                copy[key] = deepCopy(value)
            else
                copy[key] = value
            end
        end
        return copy
    end

    -- Register Add Car Command
    local addCarCommand = {
        help = TranslateIt("command_translation_addcar_header"),
        validate = true,
        arguments = {
            {
                name = "id",
                help = TranslateIt("command_translation_addcar_playerorjob2"),
                type = "player"
            },
            {
                name = "car",
                help = TranslateIt("command_translation_addcar_model"),
                type = "string"
            }
        }
    }

    if addCarCommand then
        if not addCarCommand.arguments then
            addCarCommand.arguments = {}
        end
        if not addCarCommand.help then
            addCarCommand.help = ""
        end
        TriggerEvent("chat:addSuggestion", 
            string.format("/%s", Config.AdminMenu.AddCarCommand),
            addCarCommand.help,
            addCarCommand.arguments
        )
    end

    -- Register Remove Car Command
    local removeCarCommand = {
        help = TranslateIt("command_translation_rmcar_header"),
        validate = true,
        arguments = {
            {
                name = "plate",
                help = TranslateIt("command_translation_rmcar_plate"),
                type = "string"
            }
        }
    }

    if removeCarCommand then
        if not removeCarCommand.arguments then
            removeCarCommand.arguments = {}
        end
        if not removeCarCommand.help then
            removeCarCommand.help = ""
        end
        TriggerEvent("chat:addSuggestion",
            string.format("/%s", Config.AdminMenu.DeleteVehicle),
            removeCarCommand.help,
            removeCarCommand.arguments
        )
    end

    -- Register Add Job Car Command
    local addJobCarCommand = {
        help = TranslateIt("command_translation_addcar_header_job"),
        validate = true,
        arguments = {
            {
                name = "car",
                help = TranslateIt("command_translation_addcar_model"),
                type = "string"
            },
            {
                name = "job",
                help = TranslateIt("command_translation_addcar_job"),
                type = "string"
            },
            {
                name = "jobgrade",
                help = TranslateIt("command_translation_addcar_jobgrade"),
                type = "string"
            },
            {
                name = "jobprivate",
                help = TranslateIt("command_translation_addcar_jobprivate"),
                type = "string"
            }
        }
    }

    if addJobCarCommand then
        if not addJobCarCommand.arguments then
            addJobCarCommand.arguments = {}
        end
        if not addJobCarCommand.help then
            addJobCarCommand.help = ""
        end
        TriggerEvent("chat:addSuggestion",
            string.format("/%s", Config.AdminMenu.AddJobCarCommand),
            addJobCarCommand.help,
            addJobCarCommand.arguments
        )
    end

    -- Register Add Gang Car Command
    local addGangCarCommand = {
        help = TranslateIt("command_translation_addcar_header_gang"),
        validate = true,
        arguments = {
            {
                name = "car",
                help = TranslateIt("command_translation_addcar_model"),
                type = "string"
            },
            {
                name = "gang",
                help = TranslateIt("command_translation_addcar_gang"),
                type = "string"
            },
            {
                name = "ganggrade",
                help = TranslateIt("command_translation_addcar_ganggrade"),
                type = "string"
            },
            {
                name = "gangprivate",
                help = TranslateIt("command_translation_addcar_gangprivate"),
                type = "string"
            }
        }
    }

    if addGangCarCommand then
        if not addGangCarCommand.arguments then
            addGangCarCommand.arguments = {}
        end
        if not addGangCarCommand.help then
            addGangCarCommand.help = ""
        end
        TriggerEvent("chat:addSuggestion",
            string.format("/%s", Config.AdminMenu.AddGangCarCommand),
            addGangCarCommand.help,
            addGangCarCommand.arguments
        )
    end

    -- State bag handlers for garages and impounds
    AddStateBagChangeHandler("garages", "global", function(bagName, key, value)
        reloadGarages(value)
    end)

    AddStateBagChangeHandler("impounds", "global", function(bagName, key, value)
        reloadImpounds(value)
    end)

    -- Plate Changer Command
    RegisterCommand(Config.AdminMenu.PlateChangerCommand, function()
        local playerData = Fr.GetPlayerData()
        local identifier = trim(playerData[Fr.identificatorTable])
        local hasPermission = adminData.aceAllowed

        -- Check permissions via identifiers
        if not hasPermission then
            for _, adminIdentifier in pairs(adminData.identifiers) do
                if Config.AdminPanelPlayers[adminIdentifier] then
                    hasPermission = true
                end
            end
        end

        -- Check permissions via player identifier
        if not hasPermission then
            if not Config.AdminPanelPlayers[identifier] then
                print("No Permissions.")
                return
            end
        end

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        -- Find closest vehicle
        local vehicle = GetClosestVehicle(
            playerCoords.x,
            playerCoords.y,
            playerCoords.z,
            5.0,
            0,
            70
        )

        -- If no vehicle nearby, check if player is in a vehicle
        if not DoesEntityExist(vehicle) then
            vehicle = GetVehiclePedIsUsing(playerPed)
        end

        if DoesEntityExist(vehicle) then
            plateChangeVehicle = vehicle
            local plate = GetVehicleNumberPlateText(vehicle)
            plate = plate:match("^%s*(.-)%s*$") -- Trim whitespace

            CurrentFrame = "setPlateChangerVisible"
            SendReactMessage("setPlateData", {
                plate = plate
            })
            SetNuiFocus(true, true)
            SendReactMessage(CurrentFrame, true)
        else
            sendNotify(
                TranslateIt("notify_nocarnearby"),
                "error",
                5000
            )
        end
    end)

    -- Main Admin Menu Command
    RegisterCommand(Config.AdminMenu.Command, function()
        local playerData = Fr.GetPlayerData()
        local identifier = trim(playerData[Fr.identificatorTable])
        local hasPermission = adminData.aceAllowed

        -- Check permissions via identifiers
        if not hasPermission then
            for _, adminIdentifier in pairs(adminData.identifiers) do
                if Config.AdminPanelPlayers[adminIdentifier] then
                    hasPermission = true
                end
            end
        end

        -- Check permissions via player identifier
        if not hasPermission then
            if not Config.AdminPanelPlayers[identifier] then
                print("No Permissions.")
                return
            end
        end

        -- Prepare garages data
        local garagesData = {}
        for _, garage in pairs(garages) do
            local garageCopy = deepCopy(garage)
            
            garageCopy.IsJob = garageCopy.Job and true or false
            garageCopy.IsGang = garageCopy.Gang and true or false
            garageCopy.oneSpawn = garageCopy.onespawn

            if not garageCopy.Job then
                garageCopy.Job = {
                    name = "",
                    grade = 0,
                    type = "owned"
                }
            end

            if not garageCopy.IsGang then
                garageCopy.Gang = {
                    name = "",
                    grade = 0,
                    type = "owned"
                }
            end

            table.insert(garagesData, garageCopy)
        end

        -- Prepare impounds data
        local impoundsData = {}
        for _, impound in pairs(impounds) do
            local impoundCopy = deepCopy(impound)
            table.insert(impoundsData, impoundCopy)
        end

        -- Prepare registered jobs list
        local registeredJobs = {}
        for jobName, _ in pairs(Config.IV.jobsList) do
            table.insert(registeredJobs, jobName)
        end

        -- Prepare job vehicles data
        local jobVehiclesData = {}
        for _, jobVehicle in pairs(jobvehicles) do
            local vehicleCopy = deepCopy(jobVehicle)
            table.insert(jobVehiclesData, vehicleCopy)
        end

        -- Prepare gang vehicles data
        local gangVehiclesData = {}
        for _, gangVehicle in pairs(gangvehicles) do
            local vehicleCopy = deepCopy(gangVehicle)
            table.insert(gangVehiclesData, vehicleCopy)
        end

        -- Prepare vehicles labels data
        local vehiclesData = {}
        for _, vehicle in pairs(vehicleslabels) do
            local vehicleCopy = deepCopy(vehicle)
            table.insert(vehiclesData, vehicleCopy)
        end

        -- Get player position
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local playerHeading = GetEntityHeading(playerPed)
        local playerPosition = vec4(playerCoords.x, playerCoords.y, playerCoords.z, playerHeading)

        -- Prepare admin menu data
        local adminMenuData = {
            Garages = garagesData,
            Impounds = impoundsData,
            JobVehicles = jobVehiclesData,
            Vehicles = vehiclesData,
            adminRank = adminData.group,
            adminImage = adminData.avatar,
            adminNick = adminData.name,
            RegisteredJobs = registeredJobs,
            GangVehicles = gangVehiclesData,
            playerCoords = playerPosition
        }

        -- Open admin menu UI
        CurrentFrame = "setAdminVisible"
        SendReactMessage("setAdminData", adminMenuData)
        SetNuiFocus(true, true)
        SendReactMessage(CurrentFrame, true)
    end)
end)