-- Modo Individual de Creación de Ubicaciones para Concesionarios

local tempData = {
    cars_exhibitor = {},
    car_testdrive = {},
    car_delivery = {},
    car_preview = {},
    npcs = {},
    markers = {}
}

local previewVehicle = nil
local previewPed = nil
local currentHeading = 0.0
local currentStage = 'car_exhibitor'
local stageIndex = 1
local stages = {'car_exhibitor', 'car_testdrive', 'car_delivery', 'car_preview', 'npc', 'markers'}

function UpdatePreview()
    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
    if hit then
        if currentStage == 'car_exhibitor' or currentStage == 'car_testdrive' or currentStage == 'car_delivery' or currentStage == 'car_preview' then
            if not previewVehicle or not DoesEntityExist(previewVehicle) then
                local model = GetHashKey(Config.SetupMenu.vehiclePlacing)
                RequestModel(model)
                while not HasModelLoaded(model) do Wait(1) end
                previewVehicle = CreateVehicle(model, coords.x, coords.y, coords.z, currentHeading, false, false)
                SetEntityAlpha(previewVehicle, 150, false)
                SetEntityCollision(previewVehicle, false, false)
                FreezeEntityPosition(previewVehicle, true)
                SetVehicleDoorsLocked(previewVehicle, 2)
                SetModelAsNoLongerNeeded(model)
            else
                SetEntityCoords(previewVehicle, coords.x, coords.y, coords.z, false, false, false, true)
                SetEntityHeading(previewVehicle, currentHeading)
            end
            local camCoords = GetEntityCoords(cache.ped)
            DrawLine(camCoords.x, camCoords.y, camCoords.z, coords.x, coords.y, coords.z + 1.0, 0, 255, 0, 255)
        elseif currentStage == 'npc' then
            if not previewPed or not DoesEntityExist(previewPed) then
                local model = GetHashKey('mp_m_freemode_01')
                RequestModel(model)
                while not HasModelLoaded(model) do Wait(1) end
                previewPed = CreatePed(4, model, coords.x, coords.y, coords.z, currentHeading, false, true)
                SetEntityAlpha(previewPed, 150, false)
                SetEntityCollision(previewPed, false, false)
                FreezeEntityPosition(previewPed, true)
                SetBlockingOfNonTemporaryEvents(previewPed, true)
                SetModelAsNoLongerNeeded(model)
            else
                SetEntityCoords(previewPed, coords.x, coords.y, coords.z, false, false, false, true)
                SetEntityHeading(previewPed, currentHeading)
            end
            local camCoords = GetEntityCoords(cache.ped)
            DrawLine(camCoords.x, camCoords.y, camCoords.z, coords.x, coords.y, coords.z + 1.0, 0, 0, 255, 255)
        elseif currentStage == 'markers' then
            DrawMarker(2, coords.x, coords.y, coords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 120, 0, 180, true, true, 2, false, nil, nil, false)
            local camCoords = GetEntityCoords(cache.ped)
            DrawLine(camCoords.x, camCoords.y, camCoords.z, coords.x, coords.y, coords.z, 255, 120, 0, 255)
        end
    end
end

function HandleRotation()
    local slowStep = 1.0
    local fastStep = 15.0
    local step = fastStep
    if IsControlPressed(0, 21) then -- Shift
        step = slowStep
    end
    if currentStage == 'car_exhibitor' or currentStage == 'car_testdrive' or currentStage == 'car_delivery' or currentStage == 'npc' or currentStage == 'car_preview' then
        if IsControlJustPressed(0, 14) then 
            currentHeading = currentHeading + step
            if currentHeading >= 360.0 then currentHeading = currentHeading - 360.0 end
        elseif IsControlJustPressed(0, 15) then
            currentHeading = currentHeading - step
            if currentHeading < 0.0 then currentHeading = currentHeading + 360.0 end
        end
    end
end

function CleanupPreviews()
    if previewVehicle and DoesEntityExist(previewVehicle) then
        DeleteEntity(previewVehicle)
        previewVehicle = nil
    end
    if previewPed and DoesEntityExist(previewPed) then
        DeletePed(previewPed)
        previewPed = nil
    end
    currentHeading = 0.0
end

function PlaceCurrentStageElement()
    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
    if hit then
        local placedHeading = currentHeading
        if (currentStage == 'car_exhibitor' or currentStage == 'car_testdrive' or currentStage == 'car_delivery' or currentStage == 'car_preview')
            and previewVehicle and DoesEntityExist(previewVehicle) then
            placedHeading = GetEntityHeading(previewVehicle)
        elseif currentStage == 'npc' and previewPed and DoesEntityExist(previewPed) then
            placedHeading = GetEntityHeading(previewPed)
        end
        placedHeading = tonumber(placedHeading) or 0.0
        placedHeading = placedHeading % 360.0
        if placedHeading < 0.0 then placedHeading = placedHeading + 360.0 end

        if currentStage == 'car_exhibitor' then
            table.insert(tempData.cars_exhibitor, {
                x = coords.x, y = coords.y, z = coords.z, heading = placedHeading, type = 'exhibitor',
                allowedVehicles = {} -- Campo para configurar autos específicos
            })
        elseif currentStage == 'car_testdrive' then
            table.insert(tempData.car_testdrive, {
                x = coords.x, y = coords.y, z = coords.z, heading = placedHeading, type = 'testdrive'
            })
        elseif currentStage == 'car_delivery' then
            table.insert(tempData.car_delivery, {
                x = coords.x, y = coords.y, z = coords.z, heading = placedHeading, type = 'delivery'
            })
        elseif currentStage == 'car_preview' then
            if #tempData.car_preview >= 1 then PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", false) return end
            table.insert(tempData.car_preview, {
                x = coords.x, y = coords.y, z = coords.z, heading = placedHeading, type = 'preview'
            })
        elseif currentStage == 'npc' then
            if #tempData.npcs >= 1 then PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", false) return end
            table.insert(tempData.npcs, {
                x = coords.x, y = coords.y, z = coords.z, heading = placedHeading
            })
        elseif currentStage == 'markers' then
            table.insert(tempData.markers, {
                x = coords.x, y = coords.y, z = coords.z
            })
        end
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
        Custom.Notify(locale('ui.admin_panel.place_point') .. ' OK', 'success')
        SendNUIMessage({ action = "updatePoints", data = tempData })
    else
        PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
    end
end


function DeleteCreatorPoint(pointType, index)
    if tempData[pointType] and tempData[pointType][index + 1] then
        table.remove(tempData[pointType], index + 1)
        PlaySoundFrontend(-1, "DELETE", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
        SendNUIMessage({ action = "updatePoints", data = tempData })
    end
end

function setupIndividualLocation(dealershipId, locationType, currentData, cb)
    local CREATING = true
    local originalData = currentData or {}
    local stageMap = {
        cars_exhibitor = 'car_exhibitor', car_testdrive = 'car_testdrive', car_delivery = 'car_delivery',
        car_preview = 'car_preview', npcs = 'npc', markers = 'markers'
    }
    currentStage = stageMap[locationType] or 'car_exhibitor'
    currentHeading = GetEntityHeading(cache.ped) or 0.0
    tempData = {
        cars_exhibitor = originalData.cars_exhibitor or {},
        car_testdrive = originalData.car_testdrive or {},
        car_delivery = originalData.car_delivery or {},
        car_preview = originalData.car_preview or {},
        npcs = originalData.npcs or {},
        markers = originalData.markers or {}
    }
    for i, stage in ipairs(stages) do
        if stage == currentStage then stageIndex = i break end
    end
    SendNUIMessage({ action = "individualLocationMode", locationType = locationType, currentStage = currentStage, data = tempData })
    
    CreateThread(function()
        while CREATING do
            local wait = 0
            HandleRotation()
            UpdatePreview()
            if IsControlJustPressed(0, 38) then -- E - Colocar elemento
                PlaceCurrentStageElement()
                wait = 200
            elseif IsControlJustPressed(0, 191) then -- ENTER - Finalizar y guardar
                if not tempData[locationType] or #tempData[locationType] == 0 then
                    PlaySoundFrontend(-1, "ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                else
                    local result = {
                        dealershipId = dealershipId,
                        locationType = locationType,
                        locations = tempData[locationType]
                    }
                    cb(result)
                    CleanupPreviews()
                    CREATING = false
                    tempData = {
                        cars_exhibitor = {}, car_testdrive = {}, car_delivery = {}, car_preview = {}, npcs = {}, markers = {}
                    }
                    SetNuiFocus(true, true)
                    SendNUIMessage({ action = "individualLocationFinished" })
                    PlaySoundFrontend(-1, "MEDAL_UP", "HUD_MINI_GAME_SOUNDSET", false)
                    break
                end
            elseif IsControlJustPressed(0, 177) then -- BACKSPACE - Cancelar
                CleanupPreviews()
                CREATING = false
                tempData = {
                    cars_exhibitor = {}, car_testdrive = {}, car_delivery = {}, car_preview = {}, npcs = {}, markers = {}
                }
                SetNuiFocus(true, true)
                SendNUIMessage({ action = "individualLocationCancelled" })
                cb(false)
                break
            end
            Wait(wait)
        end
    end)
end
 
RegisterNUICallback('changeCreatorTab', function(data, cb)
    if data.tab then
        local stageMap = {
            cars_exhibitor = 'car_exhibitor', car_testdrive = 'car_testdrive', car_delivery = 'car_delivery',
            car_preview = 'car_preview', npcs = 'npc', markers = 'markers'
        }
        currentStage = stageMap[data.tab] or data.tab
        CleanupPreviews()
    end
    cb(true)
end)
