-- ============================================================
-- ORIGEN POLICE — ADMIN PANEL CLIENT
-- ============================================================

local adminOpen = false

-- ─── Abrir panel ─────────────────────────────────────────────
local function OpenAdminPanel()
    if adminOpen then return end

    FW_TriggerCallback("origen_police:admin:getGrades", function(data)
        if not data then
            ShowNotification(Config.Translations["NoPermission"] or "Sin permisos para el panel admin.")
            return
        end

        adminOpen = true
        SetNuiFocus(true, true)

        SendNUIMessage({
            action = "openAdminPanel",
            data   = {
                jobs  = data.jobs  or {},
                radio = data.radio or {},
            }
        })
    end)
end

exports("openManagement", OpenAdminPanel)

RegisterNUICallback("op_admin_openPanel", function(_, cb)
    OpenAdminPanel()
    cb("ok")
end)

-- ─── Cerrar panel ─────────────────────────────────────────────
RegisterNUICallback("op_admin_close", function(_, cb)
    adminOpen = false
    SetNuiFocus(false, false)
    cb("ok")

    if GetResourceState("origen_hub") == "started" then
        exports.origen_hub:ReturnToHub("origen_police")
    end
end)

-- ─── Rangos ───────────────────────────────────────────────────
RegisterNUICallback("op_admin_addGrade", function(data, cb)
    TriggerServerEvent("origen_police:admin:addGrade", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_updateGrade", function(data, cb)
    TriggerServerEvent("origen_police:admin:updateGrade", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_removeGrade", function(data, cb)
    TriggerServerEvent("origen_police:admin:removeGrade", data)
    cb("ok")
end)

-- ─── Categorías de departamento ───────────────────────────────
RegisterNUICallback("op_admin_addCategory", function(data, cb)
    TriggerServerEvent("origen_police:admin:addCategory", data)
    cb("ok")
end)

RegisterNUICallback("op_admin_removeCategory", function(data, cb)
    TriggerServerEvent("origen_police:admin:removeCategory", data)
    cb("ok")
end)

CreateThread(function()
    Wait(2000) -- Wait for escrowed scripts to load and register their broken NUI callbacks, then we overwrite them
    
    -- ─── Radio: categorías ────────────────────────────────────────
    RegisterNUICallback("op_admin_addRadioCategory", function(data, cb)
        print("^3[CLIENT DEBUG] NUI called op_admin_addRadioCategory with data:^0 " .. json.encode(data))
        TriggerServerEvent("origen_police:admin:addRadioCategory", data)
        cb('"ok"')
    end)

    RegisterNUICallback("op_admin_removeRadioCategory", function(data, cb)
        print("^3[CLIENT DEBUG] NUI called op_admin_removeRadioCategory with data:^0 " .. json.encode(data))
        TriggerServerEvent("origen_police:admin:removeRadioCategory", data)
        cb('"ok"')
    end)

    -- ─── Radio: canales ───────────────────────────────────────────
    RegisterNUICallback("op_admin_addRadioChannel", function(data, cb)
        print("^3[CLIENT DEBUG] NUI called op_admin_addRadioChannel with data:^0 " .. json.encode(data))
        TriggerServerEvent("origen_police:admin:addRadioChannel", data)
        cb('"ok"')
    end)

    RegisterNUICallback("op_admin_removeRadioChannel", function(data, cb)
        print("^3[CLIENT DEBUG] NUI called op_admin_removeRadioChannel with data:^0 " .. json.encode(data))
        TriggerServerEvent("origen_police:admin:removeRadioChannel", data)
        cb('"ok"')
    end)

    -- ─── Radio: reordenar ─────────────────────────────────────────
    RegisterNUICallback("op_admin_reorderRadioCats", function(data, cb)
        print("^3[CLIENT DEBUG] NUI called op_admin_reorderRadioCats with data:^0 " .. json.encode(data))
        TriggerServerEvent("origen_police:admin:reorderRadioCategories", data)
        cb('"ok"')
    end)

    RegisterNUICallback("op_admin_reorderRadioChannels", function(data, cb)
        print("^3[CLIENT DEBUG] NUI called op_admin_reorderRadioChannels with data:^0 " .. json.encode(data))
        TriggerServerEvent("origen_police:admin:reorderRadioChannels", data)
        cb('"ok"')
    end)
end)

-- ─── Sync: rangos ─────────────────────────────────────────────
RegisterNetEvent("origen_police:admin:gradesUpdated")
AddEventHandler("origen_police:admin:gradesUpdated", function(jobName, grades)
    if not adminOpen then return end
    SendNUIMessage({ action = "adminGradesUpdated", job = jobName, grades = grades })
end)

RegisterNetEvent("origen_police:admin:jobAdded")
AddEventHandler("origen_police:admin:jobAdded", function(job)
    if not adminOpen then return end
    SendNUIMessage({ action = "adminJobAdded", job = job })
end)

RegisterNetEvent("origen_police:admin:jobRemoved")
AddEventHandler("origen_police:admin:jobRemoved", function(jobName)
    if not adminOpen then return end
    SendNUIMessage({ action = "adminJobRemoved", jobName = jobName })
end)

-- ─── Sync: radio (recibido por TODOS los clientes) ────────────
-- Actualiza Config.MultifrecOrdered y Config.Multifrec localmente.
-- Si el panel admin está abierto, también actualiza la UI.
RegisterNetEvent("origen_police:admin:radioUpdated")
AddEventHandler("origen_police:admin:radioUpdated", function(radioData)
    -- Actualizar el config local para que el radio use los nuevos canales
    Config.MultifrecOrdered = radioData or {}
    Config.Multifrec = {}
    for _, v in ipairs(Config.MultifrecOrdered) do
        Config.Multifrec[v.category] = v.freqs
    end

    -- Si el panel admin está abierto, refrescar la pestaña Radio
    if adminOpen then
        SendNUIMessage({ action = "adminRadioUpdated", radio = Config.MultifrecOrdered })
    end
end)

-- Thread to force the UI to show the settings button if they are admin
CreateThread(function()
    TriggerServerEvent("origen_police:admin:requestRadioSync")
    while true do
        Wait(5000)
        FW_TriggerCallback("origen_police:admin:checkAdminStatus", function(isAdmin)
            if isAdmin then
                SendNUIMessage({
                    action = "UpdateAdminStatus",
                    isAdmin = true
                })
            end
        end)
    end
end)

RegisterNUICallback("CreateStation", function(data, cb)
    TriggerServerEvent("origen_police:admin:CreateStation", data)
    cb({ok = true})
end)

RegisterNUICallback("GotoAdminMarker", function(data, cb)
    if data.x and data.y and data.z then
        SetEntityCoords(PlayerPedId(), tonumber(data.x), tonumber(data.y), tonumber(data.z))
    end
    cb({ok = true})
end)

RegisterNUICallback("CreateAdminMarker", function(data, cb)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    data.coords = { x = coords.x, y = coords.y, z = coords.z, h = heading }
    TriggerServerEvent("origen_police:admin:CreateMarker", data)
    FW_Notify("Marcador guardado. Reinicia el script (ensure origen_police) para aplicar los cambios.")
    cb({ok = true})
end)

RegisterNUICallback("SetAdminMarkerPos", function(data, cb)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    data.coords = { x = coords.x, y = coords.y, z = coords.z, h = heading }
    TriggerServerEvent("origen_police:admin:SetMarkerPos", data)
    FW_Notify("Posición actualizada. Reinicia el script (ensure origen_police) para aplicar los cambios.")
    cb({ok = true})
end)

local AdminPanelMarkers = {}
RegisterNUICallback("UpdateAdminMarkers", function(data, cb)
    AdminPanelMarkers = data or {}
    cb("ok")
end)

local function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 150)
    end
end

Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        if Tables and Tables.Markers then
            for stationName, markersList in pairs(Tables.Markers) do
                for _, marker in ipairs(markersList) do
                    if marker.coords then
                        local mPos
                        local c = marker.coords
                        if type(c) == "vector4" or type(c) == "vector3" then
                            mPos = vector3(c.x, c.y, c.z)
                        elseif type(c) == "table" then
                            local x = c.x or c[1]
                            local y = c.y or c[2]
                            local z = c.z or c[3]
                            if x and y and z then
                                mPos = vector3(tonumber(x), tonumber(y), tonumber(z))
                            end
                        end
                        
                        if mPos then
                            local dist = #(pos - mPos)
                            if dist < 20.0 then
                                wait = 0
                                DrawMarker(1, mPos.x, mPos.y, mPos.z - 0.98, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 255, 255, 255, 150, false, false, 2, false, nil, nil, false)
                                
                                if dist < 1.5 then
                                    DrawText3D(mPos.x, mPos.y, mPos.z, "~g~[E]~w~ - " .. (marker.text or marker.type or "Accion"))
                                    if IsControlJustPressed(0, 38) then
                                        if marker.event then
                                            local eventData = {}
                                            for k,v in pairs(marker) do eventData[k] = v end
                                            
                                            if eventData.spawn and (type(eventData.spawn) == "vector4" or type(eventData.spawn) == "vector3") then
                                                eventData.spawn = {x = eventData.spawn.x, y = eventData.spawn.y, z = eventData.spawn.z, w = eventData.spawn.w or 0.0}
                                            end
                                            
                                            eventData.zone = "garage_zone_" .. tostring(stationName)
                                            eventData.entity = 0
                                            eventData.station = stationName
                                            eventData.id = stationName
                                            
                                            print("^3[DEBUG] Triggering " .. tostring(marker.event) .. " with station=" .. tostring(eventData.station) .. ", type of station=" .. type(eventData.station) .. "^0")
                                            TriggerEvent(marker.event, eventData)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

RegisterCommand("vehiclePolice", function()
    local stationName = "colonyislandstation"
    local idx = 1
    
    -- Auto-detect index in case it's not 1
    if Config and Config.Maps then
        for k, v in pairs(Config.Maps) do
            if v == stationName then
                idx = k
                break
            end
        end
    end

    local spawnCoords = vector4(5647.450684, -3169.833008, 8.706177, 90.708656)

    local eventData = {
        station = idx,
        stationName = stationName,
        spawn = spawnCoords,
        coords = spawnCoords,
        zone = "garage_zone_" .. idx,
        entity = 0,
        id = idx,
        event = "origen_police:client:buyveh"
    }

    print("^3[DEBUG] Bypass: Triggering buyveh for " .. stationName .. " at index " .. tostring(idx) .. "^0")
    TriggerEvent("origen_police:client:buyveh", eventData)
end, false)

RegisterCommand("inventoryPolice", function()
    local stationName = "colonyislandstation"
    local idx = 1
    
    if Config and Config.Maps then
        for k, v in pairs(Config.Maps) do
            if v == stationName then
                idx = k
                break
            end
        end
    end

    local eventData = {
        station = idx,
        stationName = stationName,
        zone = "inventory_zone_" .. idx,
        entity = 0,
        id = idx,
        event = "origen_police:client:inventory"
    }

    print("^3[DEBUG] Bypass: Triggering inventory for " .. stationName .. " at index " .. tostring(idx) .. "^0")
    TriggerEvent("origen_police:client:inventory", eventData)
end, false)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    Wait(2000)
    LoadAllMarkers()
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(2000)
    LoadAllMarkers()
end)

RegisterCommand("reloadpolice", function()
    LoadAllMarkers()
    FW_Notify("Marcadores recargados manualmente.")
end, false)

