RegisterCommand("qrr", function()
    local PlayerData = FW_GetPlayerData(true)
    local userData = CanOpenTablet(PlayerData.job.name)
    if userData[1] then
        UseCommand('me', Config.Translations['QRRME'])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "QRR",
            job = userData[2],-- index 2 correspond to the player category
            message = Config.Translations['Agentatrisk'],
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
        TriggerServerEvent("origen_police:server:updateref", {
            color = 1
        })
    end
end)

RegisterCommand("QRR-B", function()
    local PlayerData = FW_GetPlayerData(true)
    local userData = CanOpenTablet(PlayerData.job.name)
    if userData[1] then
        UseCommand('me', Config.Translations['QRR-BME'])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "QRR-B",
            job = userData[2],
            message = Config.Translations['QRR-B'],
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
        TriggerServerEvent("origen_police:server:updateref", {
            color = 1
        })
    end
end)

RegisterCommand("QRR-C", function()
    local PlayerData = FW_GetPlayerData(true)
    local userData = CanOpenTablet(PlayerData.job.name)
    if userData[1] then
        UseCommand('me', Config.Translations['QRR-CME'])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "QRR-C (Emergencia)",
            job = userData[2],
            message = Config.Translations['QRR-C'],
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
        TriggerServerEvent("origen_police:server:updateref", {
            color = 1
        })
    end
end)

RegisterCommand("10-20", function()
    local PlayerData = FW_GetPlayerData(false)
    if CanOpenTablet(PlayerData.job.name)[1] then
        UseCommand('me', Config.Translations['10-20ME'])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "10-20",
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
    end
end)

function UseCommand(type, message)
    if type == 'me' then
        ExecuteCommand("me "..message)
    elseif type == 'do' then
        ExecuteCommand("do "..message)
    elseif type == 'rpol' or type == 'rnorte' or type == 'rsur' then
        ExecuteCommand(type.." "..message)
    else
        print("Invalid command type: " .. type)
    end
end

RegisterNetEvent("origen_police:client:onPlayerCall911", function(message)
    -- This is for the 911 call
end)

RegisterNetEvent("origen_police:client:onPlayerCall911ems", function(message)
    -- This is for the 911ems call
end)

RegisterCommand("pboat", function()
    local PlayerData = FW_GetPlayerData(false)
    local isAllowed = false
    local allowedJobs = {"police", "sheriff", "sapd", "saspa", "ambulance"}
    
    if PlayerData and PlayerData.job then
        for _, job in pairs(allowedJobs) do
            if PlayerData.job.name == job then
                isAllowed = true
                break
            end
        end
    end

    if not isAllowed then
        ShowNotification(Config.Translations['NoPermission'] or "No tienes permiso para usar este comando.")
        return
    end

    local ped = PlayerPedId()
    if not IsEntityInWater(ped) then
        ShowNotification(Config.Translations['NotInWater'] or "Debes estar en el agua para desplegar la embarcación.")
        return
    end

    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    ProgressBar("spawning_boat", "Preparando embarcación...", 30000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "random@arrests",
        anim = "generic_radio_chatter",
        flags = 49,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)
        local modelHash = GetHashKey("predator")
        
        -- Try to get the specific boat model hash for the job from config if exists
        if Config.Vehicles and Config.Vehicles["boat"] and Config.Vehicles["boat"][PlayerData.job.name] then
            for k, _ in pairs(Config.Vehicles["boat"][PlayerData.job.name]) do
                if type(k) == "number" then
                    modelHash = k
                elseif type(k) == "string" then
                    modelHash = GetHashKey(k)
                end
                break
            end
        end

        if not IsModelInCdimage(modelHash) then 
            ShowNotification("El modelo de barco no existe.")
            return 
        end

        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end

        local vehicle = CreateVehicle(modelHash, coords.x, coords.y, coords.z, heading, true, false)
        local timeout = 0
        while not DoesEntityExist(vehicle) and timeout < 100 do
            Wait(10)
            timeout = timeout + 1
        end

        if DoesEntityExist(vehicle) then
            SetPedIntoVehicle(ped, vehicle, -1)
            SetVehicleEngineOn(vehicle, true, true, false)
            SetEntityAsMissionEntity(vehicle, true, true)
            GiveKeys("boat", vehicle)
            SetVehicleFuelLevel(vehicle, 100.0)
            if GetResourceState('LegacyFuel') == 'started' then
                exports['LegacyFuel']:SetFuel(vehicle, 100.0)
            elseif GetResourceState('origen_fuel') == 'started' then
                exports['origen_fuel']:SetFuel(vehicle, { fuel = 100.0 })
            end
            ShowNotification("Embarcación desplegada con éxito.")
        end
    end, function() -- Cancel
        ClearPedTasks(ped)
        ShowNotification("Despliegue cancelado.")
    end)
end)