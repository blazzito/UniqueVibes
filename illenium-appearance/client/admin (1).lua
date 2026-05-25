RegisterNetEvent("illenium-appearance:client:openAdminMenu", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "setShowAdmin",
        data = true
    })
end)

RegisterNUICallback("illenium-appearance:client:closeAdmin", function(_, cb)
    SetNuiFocus(false, false)
    cb({ status = "ok" })
end)

RegisterNUICallback("illenium-appearance:client:requestCoords", function(_, cb)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    
    SendNUIMessage({
        action = "updatePolyOrCoords",
        data = {
            coords = {x = coords.x, y = coords.y, z = coords.z},
            rotation = heading,
            usePoly = false
        }
    })
    cb({ status = "ok" })
end)

local isRecordingPoly = false
local points = {}
local previewActive = false
local zDrawOffset = 4.0

local function ToggleNoClip(enabled)
    local ped = PlayerPedId()
    SetEntityCollision(ped, not enabled, not enabled)
    SetEntityVisible(ped, not enabled, 0)
    FreezeEntityPosition(ped, enabled)
    
    if enabled then
        SetEntityAlpha(ped, 51, false)
        SetEntityInvincible(ped, true)
    else
        ResetEntityAlpha(ped)
        SetEntityInvincible(ped, false)
    end
end

local function UpdateHUD()
    if isRecordingPoly then
        SendNUIMessage({
            action = "setZonePointsCount",
            data = #points
        })
    end
end

local function DrawText3D(x, y, z, text)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(4)
    SetTextScale(0.35, 0.35)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

local function RotationToDirection(rotation)
    local adjustedRotation = {
        x = (math.pi / 180) * rotation.x,
        y = (math.pi / 180) * rotation.y,
        z = (math.pi / 180) * rotation.z
    }
    local direction = vector3(
        -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
        math.sin(adjustedRotation.x)
    )
    return direction
end

RegisterNUICallback("illenium-appearance:client:requestPoly", function(_, cb)
    SendNUIMessage({ action = "setShowAdmin", data = false })
    
    isRecordingPoly = true
    points = {}
    previewActive = false
    local ped = PlayerPedId()
    
    -- Enable Freecam
    ToggleNoClip(true)
    SendNUIMessage({ action = "setShowZoneHUD", data = true })
    UpdateHUD()
    SetNuiFocus(false, false)

    CreateThread(function()
        local speed = 0.5
        
        while isRecordingPoly do
            Wait(0)
            DisableAllControlActions(0)
            EnableControlAction(0, 1, true) -- Mouse Move
            EnableControlAction(0, 2, true) -- Mouse Look
            
            local camRot = GetGameplayCamRot(2)
            SetEntityHeading(ped, camRot.z)
            
            local forward = RotationToDirection(camRot)
            local right = RotationToDirection(vector3(camRot.x, camRot.y, camRot.z - 90.0))
            
            local currentPos = GetEntityCoords(ped)
            local currentSpeed = speed
            
            if IsDisabledControlPressed(0, 21) then currentSpeed = currentSpeed * 3.0 end -- Shift
            if IsDisabledControlPressed(0, 36) then currentSpeed = currentSpeed * 0.25 end -- Ctrl

            if IsDisabledControlPressed(0, 32) then currentPos = currentPos + (forward * currentSpeed) end -- W
            if IsDisabledControlPressed(0, 31) then currentPos = currentPos - (forward * currentSpeed) end -- S
            if IsDisabledControlPressed(0, 30) then currentPos = currentPos + (right * currentSpeed) end -- A (Fix: was inverted)
            if IsDisabledControlPressed(0, 34) then currentPos = currentPos - (right * currentSpeed) end -- D (Fix: was inverted)
            
            if IsDisabledControlPressed(0, 22) then currentPos = currentPos + vector3(0, 0, currentSpeed) end -- Space
            -- Ctrl is already used for slow, so we use Q/E for alt height if needed, but we keep Space for up.
            
            SetEntityCoordsNoOffset(ped, currentPos.x, currentPos.y, currentPos.z, true, true, true)
            SetEntityRotation(ped, camRot.x, camRot.y, camRot.z, 2, true)

            -- Action: Scroll Wheel or Up/Down Arrows -> Height / Thickness
            if IsDisabledControlJustPressed(0, 14) or IsDisabledControlJustPressed(0, 241) or IsDisabledControlPressed(0, 172) then 
                zDrawOffset = math.min(zDrawOffset + 0.5, 30.0)
            end
            if IsDisabledControlJustPressed(0, 15) or IsDisabledControlJustPressed(0, 242) or IsDisabledControlPressed(0, 173) then
                zDrawOffset = math.max(zDrawOffset - 0.5, 1.0)
            end

            -- Raycast for aim
            local dest = currentPos + (forward * 300.0)
            local ray = StartShapeTestRay(currentPos.x, currentPos.y, currentPos.z, dest.x, dest.y, dest.z, -1, ped, 0)
            local _, hit, coords, _, _ = GetShapeTestResult(ray)
            
            -- Draw Crosshair on target
            if hit then
                local s = 0.3
                local h = coords.z + 0.1
                DrawLine(coords.x - s, coords.y, h, coords.x + s, coords.y, h, 255, 107, 0, 255)
                DrawLine(coords.x, coords.y - s, h, coords.x, coords.y + s, h, 255, 107, 0, 255)
            end

            -- ACTION: F (49) or Left Click (24) -> Add Point
            if IsDisabledControlJustPressed(0, 49) or IsDisabledControlJustPressed(0, 24) then 
                if hit then
                    points[#points+1] = coords
                    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    UpdateHUD()
                else
                    lib.notify({description = "Invalid surface", type = 'error'})
                end
            end

            -- ACTION: X (73) or Backspace (177) -> Undo Point
            if IsDisabledControlJustPressed(0, 73) or IsDisabledControlJustPressed(0, 177) then 
                if #points > 0 then
                    points[#points] = nil
                    PlaySoundFrontend(-1, "CANCEL", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    UpdateHUD()
                end
            end
            
            -- ACTION: G (47) -> Toggle Preview
            if IsDisabledControlJustPressed(0, 47) then
                previewActive = not previewActive
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end

            -- ACTION: ENTER (18 / 201) -> Finish
            if IsDisabledControlJustPressed(0, 18) or IsDisabledControlJustPressed(0, 201) then 
                if #points >= 4 then
                    isRecordingPoly = false
                else
                    lib.notify({description = "Mínimo 4 puntos requeridos para formar cuadro/polígono", type = 'error'})
                end
            end

            -- (Height logic moved to scroll/arrow logic above to be unified)

            -- DRAWING POINTS AND WALLS
            for i = 1, #points do
                local p1 = points[i]
                local p2 = points[i+1] or (previewActive and hit and coords) or (not previewActive and points[1]) or p1
                
                if not previewActive and i == #points and #points >= 2 then
                    p2 = points[1]
                end

                local r, g, b = 0, 255, 0
                if previewActive and i == #points then
                    r, g, b = 255, 165, 0 -- Orange for currently previewed line
                end

                DrawLine(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z, r, g, b, 255)
                DrawLine(p1.x, p1.y, p1.z + zDrawOffset, p2.x, p2.y, p2.z + zDrawOffset, r, g, b, 255)
                DrawLine(p1.x, p1.y, p1.z, p1.x, p1.y, p1.z + zDrawOffset, r, g, b, 150)
                
                -- Diagonal fills
                DrawLine(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z + zDrawOffset, r, g, b, 50)
                DrawLine(p1.x, p1.y, p1.z + zDrawOffset, p2.x, p2.y, p2.z, r, g, b, 50)

                DrawMarker(28, p1.x, p1.y, p1.z, 0, 0, 0, 0, 0, 0, 0.15, 0.15, 0.15, r, g, b, 255, false, false, 2, false, nil, nil, false)
                DrawText3D(p1.x, p1.y, p1.z + 0.3, tostring(i))
            end
        end

        -- Finish Logic
        ToggleNoClip(false)
        
        -- Place ped correctly on ground
        local pos = GetEntityCoords(ped)
        local found, ground_z = GetGroundZFor_3dCoord(pos.x, pos.y, pos.z + 10.0, 0)
        if found then
            SetEntityCoordsNoOffset(ped, pos.x, pos.y, ground_z, false, false, false)
        end
        
        SendNUIMessage({ action = "setShowZoneHUD", data = false })
        SetNuiFocus(true, true)
        SendNUIMessage({ action = "setShowAdmin", data = true })
        
        local center = vector3(0,0,0)
        if #points > 0 then
            for _, p in ipairs(points) do center = center + p end
            center = center / #points
        end

        SendNUIMessage({
            action = "updatePolyOrCoords",
            data = { 
                usePoly = true, 
                points = points,
                coords = { x = center.x, y = center.y, z = center.z },
                size = { x = 4, y = 4, z = zDrawOffset },
                rotation = 0
            }
        })
    end)
    
    cb({ status = "ok" })
end)

TriggerEvent("chat:addSuggestion", "/admintiendas", "Abrir Administrador de Tiendas de Ropa", {})
RegisterCommand("admintiendas", function()
    lib.callback("illenium-appearance:server:isAdmin", false, function(isAdmin)
        if isAdmin then
            TriggerEvent("illenium-appearance:client:openAdminMenu")
        else
            lib.notify({type='error', description='No permission'})
        end
    end)
end)

-- NUI PROXIES
RegisterNUICallback("illenium-appearance:server:getStores", function(_, cb)
    lib.callback("illenium-appearance:server:getStores", false, function(stores)
        cb(stores or {})
    end)
end)

RegisterNUICallback("illenium-appearance:server:addStore", function(data, cb)
    TriggerServerEvent("illenium-appearance:server:addStore", data)
    cb({ status = "ok" })
end)

RegisterNUICallback("illenium-appearance:server:updateStore", function(data, cb)
    TriggerServerEvent("illenium-appearance:server:updateStore", data.id, data)
    cb({ status = "ok" })
end)

RegisterNUICallback("illenium-appearance:server:deleteStore", function(id, cb)
    TriggerServerEvent("illenium-appearance:server:deleteStore", id)
    cb({ status = "ok" })
end)

RegisterNUICallback("illenium-appearance:client:teleportToStore", function(coords, cb)
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, true)
    cb({ status = "ok" })
end)
