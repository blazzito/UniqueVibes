local function GetJobRadioCommand()
    local PlayerData = FW_GetPlayerData(false)
    if PlayerData.job.name == 'sheriff' then
        return 'rnorte'
    elseif PlayerData.job.name == 'police' then
        return 'rsur'
    else
        return 'rpol'
    end
end

function Calls(id)
    local cmd = GetJobRadioCommand()
    if id == "10.8" then
        UseCommand(cmd, Config.Translations["10.8"])
    elseif id == "10.10" then
        UseCommand(cmd, Config.Translations["10.10"])
    elseif id == "Cod 7" then
        local text = Config.Translations["Cod 7"]:format(GetStreetName(GetEntityCoords(PlayerPedId())))
        ExecuteCommand(cmd .. ' ' .. text)
    elseif id == "Parada Técnica" then
        local text = Config.Translations["Cod 7"]:format(GetStreetName(GetEntityCoords(PlayerPedId())))
        ExecuteCommand(cmd .. ' ' .. text)
    elseif id == "Cambio Jurisdiccion" then
        local PlayerData = FW_GetPlayerData(false)
        if PlayerData.job.name == 'police' then
            ExecuteCommand('rpol ' .. Config.Translations['CambioJurisdiccionNorth'])
        elseif PlayerData.job.name == 'sheriff' then
            ExecuteCommand('rpol ' .. Config.Translations['CambioJurisdiccionSouth'])
        else
            ExecuteCommand('rpol ' .. Config.Translations['CambioJurisdiccionText'])
        end
    elseif id == "254-V" then
        local fplate, fmodel, targetCoords
        if HelicamLockedVehicle and DoesEntityExist(HelicamLockedVehicle) then
            fplate = GetVehiclePlate(HelicamLockedVehicle)
            fmodel = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(HelicamLockedVehicle)))
            if fmodel == "NULL" then fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(HelicamLockedVehicle)) end
            targetCoords = GetEntityCoords(HelicamLockedVehicle)
        else
            fplate, fmodel = GetRadarVehicle()
            targetCoords = GetEntityCoords(PlayerPedId())
        end

        if fplate then
            local text = Config.Translations["254-V"]:format(fmodel, fplate, GetStreetName(targetCoords))
            ExecuteCommand('rpol ' .. text)
        end
    elseif id == "487-V" then
        local fplate, fmodel = GetRadarVehicle()

        if fplate then
            local text = Config.Translations["487-V"]:format(fmodel, fplate)
            ExecuteCommand('rpol ' .. text)
        end
    elseif id == "Cod 2" then
        UseCommand(cmd, Config.Translations["Cod 2"])
    elseif id == "10.22" then
        UseCommand(cmd, Config.Translations["10.22"])
    elseif id == "6-Adam" then
        UseCommand(cmd, Config.Translations["6-Adam"])
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle == 0 or (GetPedInVehicleSeat(vehicle, -1) ~= ped and GetPedInVehicleSeat(vehicle, 0) ~= ped) then
            TriggerServerEvent("origen_police:server:updateref", {
                color = 50
            })
        else
            local players = {}
            for i = -1, 0 do
                local p = GetPedInVehicleSeat(vehicle, i)
                if p ~= 0 then
                    table.insert(players, GetPlayerServerId(NetworkGetPlayerIndexFromPed(p)))
                end
            end
            TriggerServerEvent("origen_police:server:updateref", {
                color = 50
            }, players)
        end
        SendNUIMessage({
            action = "SyncQuick",
            color = 50
        })
    elseif id == "10.98" then
        UseCommand(cmd, Config.Translations["10.98"])
    elseif id == "Veh 488" then
        local fplate, fmodel = GetRadarVehicle()

        if fplate then
            local text = Config.Translations["Veh 488"]:format(GetStreetName(GetEntityCoords(PlayerPedId())), fmodel, fplate)
            ExecuteCommand('rpol ' .. text)
        end
    elseif id == "Veh 487" then
        local fplate, fmodel = GetRadarVehicle()

        if fplate then
            local text = Config.Translations["Veh 487"]:format(GetStreetName(GetEntityCoords(PlayerPedId())), fmodel, fplate)
            ExecuteCommand('rpol ' .. text)
        end
    elseif id == "Veh Alt" then
        local fplate, fmodel = GetRadarVehicle()

        if fplate then
            local text = Config.Translations["Veh Alt"]:format(fmodel, fplate, GetStreetName(GetEntityCoords(PlayerPedId())))
            ExecuteCommand('rpol ' .. text)
        end
    elseif id == "10.6" then
        local fplate, fmodel = GetRadarVehicle()

        if fplate then
            local text = Config.Translations["10.6"]:format(fmodel, fplate, GetStreetName(GetEntityCoords(PlayerPedId())))
            ExecuteCommand(cmd .. ' ' .. text)
        end
    elseif id == "Ubicacion" then
        local PlayerData = FW_GetPlayerData(true)
        UseCommand('me', Config.Translations["10-20ME"])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "10-20",
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            job = {"ambulance", "police"},
            ignoreCooldown = true
        })
    elseif id == "10-20" then
        local PlayerData = FW_GetPlayerData(true)
        UseCommand('me', Config.Translations["10-20ME"])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "10-20",
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
    elseif id == "QRR" then
        local PlayerData = FW_GetPlayerData(true)
        UseCommand('me', Config.Translations["QRRME"])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "QRR",
            message = Config.Translations["Agentatrisk"],
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
        TriggerServerEvent("origen_police:server:updateref", {
            color = 1
        })
    elseif id == "QRR-B" then
        local PlayerData = FW_GetPlayerData(true)
        UseCommand('me', Config.Translations["QRR-BME"])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "QRR-B (No prioritario)",
            message = Config.Translations["QRR-B"],
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
        TriggerServerEvent("origen_police:server:updateref", {
            color = 1
        })
    elseif id == "QRR-C" then
        local PlayerData = FW_GetPlayerData(true)
        UseCommand('me', Config.Translations["QRR-CME"])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "QRR-C (Robo)",
            message = Config.Translations["QRR-C"],
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
        TriggerServerEvent("origen_police:server:updateref", {
            color = 1
        })
    elseif id == "Emergency" then
        local PlayerData = FW_GetPlayerData(true)
        UseCommand('me', Config.Translations["QRRME"])
        TriggerServerEvent("SendAlert:police", {
            coords = GetEntityCoords(PlayerPedId()),
            title = "Emergencia",
            message = Config.Translations["EMSRisk"],
            metadata = {
                name = PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")",
            },
            ignoreCooldown = true
        })
        TriggerServerEvent("origen_police:server:updateref", {
            color = 1
        })
    elseif Config.Translations[id] then
        local PlayerData = FW_GetPlayerData(false)
        local jobType = GetJobCategory(PlayerData.job.name)
        if jobType == "ambulance" then
            ExecuteCommand('rpol ' .. Config.Translations[id])
        end
    end
end

RegisterCommand("rpol", function(source, args, raw) -- If you don't know what you're doing, don't touch anything.
    local PlayerData = FW_GetPlayerData(true)
    if CanOpenTablet(PlayerData.job.name)[1] and PlayerData.job.onduty then
        local message = table.concat(args, " ")

        local header = "^4"

        local unit = exports["origen_police"]:GetMultiFrec()
        if unit ~= "none" then
            header = header .. "[" .. unit:upper() .. "] "
        end

        header = header ..  PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")"
        TriggerServerEvent("origen_police:server:rpol", PlayerData.job.name, header .. "  ^0" .. message)
    end
end)

RegisterCommand("rsur", function(source, args, raw)
    local PlayerData = FW_GetPlayerData(true)
    if CanOpenTablet(PlayerData.job.name)[1] and PlayerData.job.onduty and PlayerData.job.name == "police" then
        local message = table.concat(args, " ")
        local header = "^4[LSPD] "

        local unit = exports["origen_police"]:GetMultiFrec()
        if unit ~= "none" then
            header = header .. "[" .. unit:upper() .. "] "
        end

        header = header ..  PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")"
        TriggerServerEvent("origen_police:server:rpol", PlayerData.job.name, header .. "  ^0" .. message, "police")
    end
end)

RegisterCommand("rnorte", function(source, args, raw)
    local PlayerData = FW_GetPlayerData(true)
    if CanOpenTablet(PlayerData.job.name)[1] and PlayerData.job.onduty and PlayerData.job.name == "sheriff" then
        local message = table.concat(args, " ")
        local header = "^3[BCSD] "

        local unit = exports["origen_police"]:GetMultiFrec()
        if unit ~= "none" then
            header = header .. "[" .. unit:upper() .. "] "
        end

        header = header ..  PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")"
        TriggerServerEvent("origen_police:server:rpol", PlayerData.job.name, header .. "  ^0" .. message, "sheriff")
    end
end)

RegisterCommand("rpolems", function(source, args, raw)
    local PlayerData = FW_GetPlayerData(true)
    if CanOpenTablet(PlayerData.job.name)[1] and PlayerData.job.onduty then
        local message = table.concat(args, " ")
        local header = "^3[EMS-SAPD] "
        header = header ..  PlayerData.job.grade.name .. " " .. PlayerData.charinfo.lastname .. " (" .. (PlayerData.metadata.police_badge or "0000") .. ")"
        TriggerServerEvent("origen_police:server:rpolems", PlayerData.job.name, header .. "  ^0" .. message)
    end
end)
RegisterCommand("254-V", function(source, args, raw)
    local fplate, fmodel, targetCoords
    if HelicamLockedVehicle and DoesEntityExist(HelicamLockedVehicle) then
        fplate = GetVehiclePlate(HelicamLockedVehicle)
        fmodel = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(HelicamLockedVehicle)))
        if fmodel == "NULL" then fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(HelicamLockedVehicle)) end
        targetCoords = GetEntityCoords(HelicamLockedVehicle)
    else
        fplate, fmodel = GetRadarVehicle()
        targetCoords = GetEntityCoords(PlayerPedId())
    end

    if fplate then
        local text = Config.Translations["254-V"]:format(fmodel, fplate, GetStreetName(targetCoords))
        ExecuteCommand('rpol ' .. text)
    end
end)

RegisterCommand("cambiojurisdiccion", function(source, args, raw)
    local PlayerData = FW_GetPlayerData(false)
    if CanOpenTablet(PlayerData.job.name)[1] and PlayerData.job.onduty then
        if PlayerData.job.name == 'police' then
            ExecuteCommand('rpol ' .. Config.Translations['CambioJurisdiccionNorth'])
        elseif PlayerData.job.name == 'sheriff' then
            ExecuteCommand('rpol ' .. Config.Translations['CambioJurisdiccionSouth'])
        else
            ExecuteCommand('rpol ' .. Config.Translations['CambioJurisdiccionText'])
        end
    end
end)