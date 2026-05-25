RegisterNetEvent("origen_police:client:domyfinguer", function()
    local PlayerData = FW_GetPlayerData(false)
    local text = Config.Translations['domyfinguer']:format(PlayerData.citizenid)
    UseCommand('me', "Pone el dedo en el lector de huellas.")
    Wait(1500)
    UseCommand('do', text)
end)

RegisterNetEvent("origen_police:client:LeaveBelongingsMe", function()
    UseCommand('me', Config.Translations['LeaveBelongingsMe'])
end)

RegisterNetEvent("origen_police:client:TakeBelongingsMe", function()
    UseCommand('me', Config.Translations['TakeBelongingsMe'])
end)

RegisterNetEvent("origen_police:client:useFingerprintScanner", function()
    local playerPed = PlayerPedId()
    local targetPlayer, distance = FW_GetClosestPlayer()
    
    if targetPlayer ~= -1 and distance <= 2.5 then
        local targetPed = GetPlayerPed(targetPlayer)
        local targetServerId = GetPlayerServerId(targetPlayer)
        
        ExecuteCommand("e tablet2")
        ShowNotification("Escaneando huella dactilar...", "info", 3000)
        Wait(3000)

        TriggerServerEvent("origen_police:server:scannedFingerprint", targetServerId)
        ClearPedTasks(playerPed)
    else
        ShowNotification(Config.Translations["NoPersonNear"] or "No hay nadie cerca.", "error", 3000)
    end
end)

function LeavePoliceEquipment(p)
    local PlayerData = FW_GetPlayerData(false)
    local invID = "armas_policiales_" .. (p.station or 0).."_"..PlayerData.citizenid
    local stashData = Config.Stashes.PoliceEquipment
    OpenStash(invID, stashData.label, stashData.slots, stashData.weight, PlayerData.citizenid, true)
end

function PoliceInventory(p)
    local PlayerData = FW_GetPlayerData(false)
    local invID = "inventario_policial_" .. (p.station or 0)
    local stashData = Config.Stashes.PoliceInventory
    OpenStash(invID, stashData.label, stashData.slots, stashData.weight, PlayerData.citizenid, false)
end

function PersonalLocker(p)
    local PlayerData = FW_GetPlayerData(false)
    local invID = "taquilla_personal_" .. (p.station or 0) .. "_" .. PlayerData.citizenid
    local stashData = Config.Stashes.PersonalLocker or {label = "Taquilla Personal", slots = 50, weight = 100000}
    OpenStash(invID, stashData.label, stashData.slots, stashData.weight, PlayerData.citizenid, true)
end

function OpenEvidenceInventory(p)
    print("^5[Evidence Debug]^0 Opening Dialog Menu...")
    OpenMenu('dialog', GetCurrentResourceName(), 'evidenceInventory', {
        title = "Nombre del Cajon",
    }, function(data, menu)
        print("^5[Evidence Debug]^0 Dialog callback triggered")
        if type(data) ~= "table" then
            print("^5[Evidence Debug]^0 Data is not a table, fixing...")
            data = {value = data}
        end
        print("^5[Evidence Debug]^0 Data received:", json.encode(data))
        if data and data.value then
            local text = tostring(data.value)
            print("^5[Evidence Debug]^0 ID entered:", text)
            if text and text:gsub("%s+", "") ~= "" then
                local stashData = Config.Stashes.Evidence
                print("^5[Evidence Debug]^0 Calling OpenStash with ID:", "org_police_evidence_"..text)
                Debuger("Opening Evidence Stash:", text)
                OpenStash("org_police_evidence_"..text, stashData.label.." "..text, stashData.slots, stashData.weight, nil, false)
            else
                print("^5[Evidence Debug]^0 ID is empty after gsub")
            end

            menu.close()
        else
            print("^5[Evidence Debug]^0 No data.value found")
            ShowNotification(Config.Translations.MustEnterNumber)
        end
    end, function(data, menu)
        print("^5[Evidence Debug]^0 Dialog cancelled/closed")
        menu.close()
    end)
end

function CanOpenQuickAccessMenu()
    -- Check if player can open quick access menu
    local PlayerData = FW_GetPlayerData(false)
    if PlayerData == nil or PlayerData.job == nil or PlayerData.job.name == nil then return false end
    return (CanOpenTablet(PlayerData.job.name)[1] and PlayerData.job.onduty)
end

function CanHandCuff(targetPed, distance) -- This is a function to check if the player can handcuff another player
    if IsEntityDead(PlayerPedId()) then -- Block if self player is dead
        return false
    end

    return true
end

-- Should return the coords of the player, is mostly used for dispatch alerts(i.e. gungshots, etc)
-- By default it retrieves the coords of the local player entity, but sometimes you might want to get it from a different source(like a house enter point, etc)
function GetLocalPlayerPosition()
    return GetEntityCoords(PlayerPedId())
end

local isMegaphoneEquipped = false

RegisterNetEvent("origen_police:client:toggleMegaphoneItem", function()
    isMegaphoneEquipped = not isMegaphoneEquipped
    if isMegaphoneEquipped then
        ExecuteCommand("e megaphone")
        ShowNotification("Has equipado el megáfono.", "success")
        LocalPlayer.state:set("submix", "radio", true)
        
        CreateThread(function()
            SendNUIMessage({ action = "ShowCarMegaphone" })
            local myId     = GetPlayerServerId(PlayerId())
            local megaDist = Config.MegaphoneItemVoiceDist or 45.0
            
            exports["pma-voice"]:overrideProximityRange(megaDist, true)
            
            local function refreshTargets()
                local myCoords = GetEntityCoords(PlayerPedId())
                local nearbyTargets = {}

                for _, playerId in ipairs(GetActivePlayers()) do
                    local serverId = GetPlayerServerId(playerId)
                    if serverId ~= myId then
                        if #(myCoords - GetEntityCoords(GetPlayerPed(playerId))) <= megaDist then
                            nearbyTargets[serverId] = true
                        end
                    end
                end

                local radioOk, radio = pcall(function() return exports["origen_radio"]:GetRadio() end)
                if radioOk and radio and radio.MultiFrec ~= "none" and radio.MultiFrecTargets and radio.MultiFrecTargets[radio.MultiFrec] then
                    for serverId, target in pairs(radio.MultiFrecTargets[radio.MultiFrec]) do
                        if not (target and target.muted) then
                            nearbyTargets[tonumber(serverId)] = true
                        end
                    end
                end

                MumbleClearVoiceTargetPlayers(1)
                if next(nearbyTargets) then
                    PlayerTargets(nearbyTargets)
                end
            end
            
            local radioTargets = {}
            local radioOk, radio = pcall(function() return exports["origen_radio"]:GetRadio() end)
            if radioOk and radio and radio.MultiFrec ~= "none" and radio.MultiFrecTargets and radio.MultiFrecTargets[radio.MultiFrec] then
                for serverId, target in pairs(radio.MultiFrecTargets[radio.MultiFrec]) do
                    if not (target and target.muted) then
                        radioTargets[tonumber(serverId)] = true
                    end
                end
            end
            
            refreshTargets()
            TriggerServerEvent("origen_police:megaphone:start", megaDist, radioTargets)
            
            local lastRefresh = GetGameTimer()
            while isMegaphoneEquipped do
                Wait(0)
                
                if GetGameTimer() - lastRefresh >= 500 then
                    refreshTargets()
                    lastRefresh = GetGameTimer()
                end
            end
            
            TriggerServerEvent("origen_police:megaphone:stop")
            MumbleClearVoiceTargetPlayers(1)
            exports["pma-voice"]:clearProximityOverride()
            SendNUIMessage({ action = "HideCarMegaphone" })
        end)
    else
        ExecuteCommand("e c")
        ShowNotification("Has guardado el megáfono.", "error")
        LocalPlayer.state:set("submix", nil, true)
    end
end)

-- ============================================================
-- ÍTEM: binoculars
-- ============================================================
local binoculars = false
local fov_max = 70.0
local fov_min = 5.0
local zoomspeed = 10.0
local speed_lr = 8.0
local speed_ud = 8.0
local camera = false

RegisterNetEvent('origen_police:client:ToggleBinoculars', function()
    local ped = PlayerPedId()
    if not binoculars then
        binoculars = true
        if not IsPedSittingInAnyVehicle(ped) then
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_BINOCULARS", 0, true)
        end
        camera = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
        AttachCamToEntity(camera, ped, 0.0, 0.0, 1.0, true)
        SetCamRot(camera, 0.0, 0.0, GetEntityHeading(ped))
        SetCamFov(camera, fov_max)
        RenderScriptCams(true, false, 0, 1, 0)
        
        CreateThread(function()
            local scaleform = RequestScaleformMovie("BINOCULARS")
            while not HasScaleformMovieLoaded(scaleform) do Wait(10) end
            local fov = fov_max
            while binoculars do
                Wait(0)
                DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                
                local rightAxisX = GetDisabledControlNormal(0, 220)
                local rightAxisY = GetDisabledControlNormal(0, 221)
                local rotation = GetCamRot(camera, 2)
                
                if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
                    local new_z = rotation.z + rightAxisX * -1.0 * (speed_lr) * (fov / fov_max)
                    local new_x = math.max(math.min(20.0, rotation.x + rightAxisY * -1.0 * (speed_ud) * (fov / fov_max)), -89.5)
                    SetCamRot(camera, new_x, 0.0, new_z, 2)
                end
                
                if IsControlJustPressed(0, 241) then
                    fov = math.max(fov - zoomspeed, fov_min)
                end
                
                if IsControlJustPressed(0, 242) then
                    fov = math.min(fov + zoomspeed, fov_max)
                end
                
                local current_fov = GetCamFov(camera)
                if math.abs(fov - current_fov) > 0.1 then
                    SetCamFov(camera, current_fov + (fov - current_fov) * 0.1)
                end
                
                if IsControlJustPressed(0, 177) or IsControlJustPressed(0, 200) then
                    binoculars = false
                end
            end
            ClearPedTasks(ped)
            RenderScriptCams(false, false, 0, 1, 0)
            DestroyCam(camera, false)
            SetScaleformMovieAsNoLongerNeeded(scaleform)
        end)
    else
        binoculars = false
    end
end)