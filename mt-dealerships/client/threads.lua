dealershipsData = {}
vehicleColors = {
    primary = {r = 255, g = 107, b = 0},
    secondary = {r = 255, g = 107, b = 0}
}
local clientUpdateTime = 0
local previewVehicle
local currentPreviewModel = nil
local onDealership = false
local previewCamera = nil
local loadedElements = {
    npcs = {},
    markers = {},
    exhibitors = {},
    zones = {}
}

local createdNPCS = {}
local loadingDealerships = {}

local cameraControls = {
    zoom = 1.0,
    rotation = 0.0,
    baseDistance = 5.0,
    height = 1.5,
    targetZoom = 1.0,
    targetRotation = 0.0,
    targetHeight = 1.5,
    smoothSpeed = 0.1,
    isAnimating = false,
    -- Variables para mantener el estado entre cambios de vehículo
    savedZoom = nil,
    savedRotation = nil,
    savedHeight = nil,
    -- Límites de seguridad
    minZoom = 0.8,
    maxZoom = 3.0,
    minHeight = 0.3,
    maxHeight = 4.0,
    minDistance = 2.0,
    maxDistance = 8.0
}

-- Preview fijo solicitado para mejorar consistencia visual en dealership.
local FIXED_PREVIEW_VEHICLE_COORDS = vec4(1047.18, 4887.14, -31.8, 186.92)
local FIXED_PREVIEW_CAMERA_COORDS = vec4(1047.45, 4881.61, -30.9, 1.08)
local FIXED_PREVIEW_LOOK_AT = vector3(1047.18, 4887.14, -31.35)

local helpShown = {
    marker = false,
    npc = false,
    exhibitor = false
}

local currentInteractionContext = {
    type = nil,
    allowPurchase = true,
    allowTestDrive = true
}

local function HudFadeOut(time)
    local t = tonumber(time) or 350
    if GetResourceState('mt-hud') == 'started' then
        SetNuiZindex(1)
        exports['mt-hud']:DoScreenFadeOut(t)
        Wait(t + 20)
    else
        DoScreenFadeOut(t)
        while not IsScreenFadedOut() do Wait(0) end
    end
end

local function HudFadeIn(time)
    local t = tonumber(time) or 450
    if GetResourceState('mt-hud') == 'started' then
        SetNuiZindex(99999)
        exports['mt-hud']:DoScreenFadeIn(t)
    else
        DoScreenFadeIn(t)
    end
end

function lerp(a, b, t)
    return a + (b - a) * t
end

function table.count(t)
    local count = 0
    for _ in pairs(t) do count = count + 1  end
    return count
end

local function clearAllElements()

    for id, npc in pairs(loadedElements.npcs) do
        if DoesEntityExist(npc.ped) then
            DeleteEntity(npc.ped)
        end
    end
    loadedElements.npcs = {}
    
    for id, exhibitor in pairs(loadedElements.exhibitors) do
        if DoesEntityExist(exhibitor.vehicle) then
            DeleteEntity(exhibitor.vehicle)
        end
    end
    loadedElements.exhibitors = {}
    
    loadedElements.markers = {}

    -- Guardar los blips en lugar de eliminarlos
    local savedBlips = {}
    for id, zone in pairs(loadedElements.zones) do
        if zone.blip and DoesBlipExist(zone.blip) then
            savedBlips[id] = {
                blip = zone.blip,
                coords = zone.coords
            }
        end
    end
    
    -- Restaurar solo los blips
    loadedElements.zones = {}
    for id, data in pairs(savedBlips) do
        loadedElements.zones[id] = {
            blip = data.blip,
            coords = data.coords,
            loaded = false
        }
    end
end

local function getElementCoords(element)
    if not element or type(element) ~= "table" then
        return nil
    end

    local function resolveHeading(data)
        if type(data) ~= "table" then
            return 0.0
        end

        local raw = data.heading
        if raw == nil then raw = data.w end
        if raw == nil and data.coords and type(data.coords) == "table" then
            raw = data.coords.heading
            if raw == nil then raw = data.coords.w end
        end

        local heading = tonumber(raw) or 0.0
        heading = heading % 360.0
        if heading < 0.0 then heading = heading + 360.0 end
        return heading
    end

    
    if element.coords and type(element.coords) == "table" then
        local coords = element.coords
        if coords.x and coords.y and coords.z then
            return {
                x = coords.x,
                y = coords.y,
                z = coords.z,
                w = resolveHeading(coords)
            }
        end
    end
    
    if element.x and element.y and element.z then
        return {
            x = element.x,
            y = element.y,
            z = element.z,
            w = resolveHeading(element)
        }
    end
    
    if type(element) == "table" and element[1] and element[2] and element[3] then
        return {
            x = element[1],
            y = element[2],
            z = element[3],
            w = tonumber(element[4]) or 0.0
        }
    end
    
    return nil
end

local function getRandomCarFromStock(stocks, allowedVehicles)
    local availableCars = {}
    local allCars = {}
    
    for categoryId, categoryData in pairs(stocks) do
        if type(categoryData) == "table" and categoryData.categoryStock then
            for _, carData in pairs(categoryData.categoryStock) do
                if type(carData) == "table" and carData.model then
                    local model = carData.model
                    
                    -- Si hay autos permitidos configurados, solo usar esos
                    if allowedVehicles and #allowedVehicles > 0 then
                        local isAllowed = false
                        for _, allowedModel in ipairs(allowedVehicles) do
                            if allowedModel == model then
                                isAllowed = true
                                break
                            end
                        end
                        if not isAllowed then
                            goto continue
                        end
                    end
                    
                    table.insert(allCars, model)
                    
                    if carData.stock and carData.stock > 0 then
                        table.insert(availableCars, model)
                    end
                    
                    ::continue::
                end
            end
        end
    end
    
    local carsToUse = #availableCars > 0 and availableCars or allCars
    
    if #carsToUse > 0 then
        local selected = carsToUse[math.random(1, #carsToUse)]
        return selected
    end
    
    return nil
end

local function createNPC(npcData, dealershipId)
    local coords = getElementCoords(npcData)
    if not coords then
        return nil
    end
    
    local model = npcData.model or npcData.hash or "a_m_y_business_01"
    local modelHash = GetHashKey(model)
    
    RequestModel(modelHash)
    local timeout = 0
    while not HasModelLoaded(modelHash) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end
    
    if not HasModelLoaded(modelHash) then
        return nil
    end
    
    local ped = CreatePed(4, modelHash, coords.x, coords.y, coords.z, coords.w + 1.0 or 0.0, false, true)

    table.insert(createdNPCS, ped)
    
    if not DoesEntityExist(ped) then
        SetModelAsNoLongerNeeded(modelHash)
        return nil
    end
    
    SetEntityAsMissionEntity(ped, true, true)
    SetPedRandomComponentVariation(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    
    local npcId = string.format("%s_npc_%s", dealershipId, math.floor(coords.x) .. math.floor(coords.y))
    
    loadedElements.npcs[npcId] = {
        ped = ped,
        coords = coords,
        dealership = dealershipId,
        data = npcData
    }
    
    SetModelAsNoLongerNeeded(modelHash)
    return npcId
end

local function createExhibitor(exhibitorData, dealershipId, vehicleModel, exhibitorIndex)
    if not vehicleModel then
        return nil
    end
    
    local coords = getElementCoords(exhibitorData)
    if not coords then
        return nil
    end
    
    
    local modelHash = GetHashKey(vehicleModel)
    
    RequestModel(modelHash)
    local timeout = 0
    while not HasModelLoaded(modelHash) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end
    
    if not HasModelLoaded(modelHash) then
        return nil
    end
    local spawnHeading = tonumber(coords.w) or 0.0
    spawnHeading = spawnHeading % 360.0
    if spawnHeading < 0.0 then spawnHeading = spawnHeading + 360.0 end
    local roundedX = math.floor((coords.x or 0.0) * 100.0 + 0.5) / 100.0
    local roundedY = math.floor((coords.y or 0.0) * 100.0 + 0.5) / 100.0
    local roundedZ = math.floor((coords.z or 0.0) * 100.0 + 0.5) / 100.0
    local exhibitorId = string.format("%s_exhibitor_%s_%s_%s", dealershipId, tostring(roundedX), tostring(roundedY), tostring(roundedZ))

    local existing = loadedElements.exhibitors[exhibitorId]
    if existing and existing.vehicle and DoesEntityExist(existing.vehicle) then
        DeleteEntity(existing.vehicle)
    end

    -- Seguridad: si cambian índices/orden al guardar, elimina cualquier exhibidor del mismo concesionario
    -- que esté en el mismo punto para evitar duplicados y superposiciones.
    for id, exhibitor in pairs(loadedElements.exhibitors) do
        if id ~= exhibitorId and exhibitor and exhibitor.dealership == dealershipId and exhibitor.coords then
            local dx = math.abs((exhibitor.coords.x or 0.0) - (coords.x or 0.0))
            local dy = math.abs((exhibitor.coords.y or 0.0) - (coords.y or 0.0))
            local dz = math.abs((exhibitor.coords.z or 0.0) - (coords.z or 0.0))
            if dx <= 0.15 and dy <= 0.15 and dz <= 0.25 then
                if exhibitor.vehicle and DoesEntityExist(exhibitor.vehicle) then
                    DeleteEntity(exhibitor.vehicle)
                end
                loadedElements.exhibitors[id] = nil
            end
        end
    end

    local vehicle = CreateVehicle(modelHash, coords.x, coords.y, coords.z, spawnHeading, false, false)
    
    if not DoesEntityExist(vehicle) then
        SetModelAsNoLongerNeeded(modelHash)
        return nil
    end
    
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleOnGroundProperly(vehicle)
    SetEntityHeading(vehicle, spawnHeading)
    -- Reaplicar heading tras un frame para evitar inversiones puntuales de orientación.
    Wait(0)
    SetEntityHeading(vehicle, spawnHeading)
    SetEntityInvincible(vehicle, true)
    FreezeEntityPosition(vehicle, true)
    SetVehicleDoorsLocked(vehicle, 2)
    SetVehicleUndriveable(vehicle, true)
    SetVehicleDirtLevel(vehicle, 0.0)
    -- Configuración estética
    SetVehicleModKit(vehicle, 0)
    SetVehicleWindowTint(vehicle, 1)
    
    loadedElements.exhibitors[exhibitorId] = {
        vehicle = vehicle,
        coords = coords,
        dealership = dealershipId,
        model = vehicleModel,
        data = exhibitorData,
        baseHeading = spawnHeading,
        rotationHeading = spawnHeading
    }
    
    SetModelAsNoLongerNeeded(modelHash)
    return exhibitorId
end

local function findCenterCoords(dealershipData)
    if not dealershipData then return nil end
    
    if dealershipData.center and type(dealershipData.center) == "table" then
        local coords = getElementCoords(dealershipData.center)
        if coords then return coords end
    end
    
    local elementTypes = {'npcs', 'cars_exhibitor', 'markers', 'car_testdrive', 'car_delivery', 'car_preview'}
    for _, eType in ipairs(elementTypes) do
        local elements = dealershipData[eType]
        if not elements and dealershipData.markers then
            elements = dealershipData.markers[eType]
        end
        if type(elements) == "table" and next(elements) then
            for i, element in pairs(elements) do
                local coords = getElementCoords(element)
                if coords then return coords end
            end
        end
    end
    
    return nil
end

local function createMarkers(markersData, dealershipId)
    local markerIds = {}
    if markersData.markers then
        for i, marker in pairs(markersData.markers) do
            
            local coords = getElementCoords(marker)
            if coords then
                local markerId = string.format("%s_marker_%s", dealershipId, i)
                loadedElements.markers[markerId] = {
                    coords = coords,
                    dealership = dealershipId,
                    data = marker,
                    markerType = 'general'
                }
                table.insert(markerIds, markerId)
            end
        end
    end
    
    return markerIds
end

local function clearDealershipVisualElements(dealershipId)
    for npcId, npc in pairs(loadedElements.npcs) do
        if npc and npc.dealership == dealershipId then
            if npc.ped and DoesEntityExist(npc.ped) then
                DeleteEntity(npc.ped)
            end
            loadedElements.npcs[npcId] = nil
        end
    end

    for exhibitorId, exhibitor in pairs(loadedElements.exhibitors) do
        if exhibitor and exhibitor.dealership == dealershipId then
            if exhibitor.vehicle and DoesEntityExist(exhibitor.vehicle) then
                DeleteEntity(exhibitor.vehicle)
            end
            loadedElements.exhibitors[exhibitorId] = nil
        end
    end

    for markerId, marker in pairs(loadedElements.markers) do
        if marker and marker.dealership == dealershipId then
            loadedElements.markers[markerId] = nil
        end
    end
end

local function loadDealership(dealershipId, dealershipData)
    if loadingDealerships[dealershipId] then
        return
    end
    loadingDealerships[dealershipId] = true

    local function finish()
        loadingDealerships[dealershipId] = nil
    end

    -- Si ya existe una entrada para este concesionario, verificar si solo tiene blip o está completamente cargado
    local existingZone = loadedElements.zones[dealershipId]
    local hasBlipOnly = existingZone and not existingZone.loaded
    
    -- Si ya está completamente cargado, no hacer nada
    if existingZone and existingZone.loaded then
        finish()
        return
    end
    
    local markersData = dealershipData.markers or {}
    local stocks = dealershipData.stocks or dealershipData.stock or {}

    -- Limpieza previa para evitar duplicados cuando llegan recargas simultáneas.
    clearDealershipVisualElements(dealershipId)
    
    -- Cargar NPCs desde el nivel raíz o desde markers
    local npcsToLoad = dealershipData.npcs or markersData.npcs or {}
    if next(npcsToLoad) then
        for i, npc in pairs(npcsToLoad) do
            local npcId = createNPC(npc, dealershipId)
            if npcId then
                local npcElement = loadedElements.npcs[npcId]
                if npcElement and Custom and Custom.HandleInteraction then
                    local interactionData = {
                        type = 'npc',
                        dealership = {
                            id = dealershipId,
                            name = dealershipData.name or "Concesionario",
                            data = dealershipData
                        },
                        entity = npcElement.ped,
                        coords = vector3(npcElement.coords.x, npcElement.coords.y, npcElement.coords.z),
                        distance = 0,
                        onInteract = function()
                            handlePress('npc', {
                                entity = npcElement.ped,
                                coords = vector3(npcElement.coords.x, npcElement.coords.y, npcElement.coords.z)
                            })
                        end
                    }
                    local customHandled = Custom.HandleInteraction(interactionData)
                    if not customHandled then
                        npcElement.useDefaultInteraction = true
                    end
                end
            end
        end
    end
    
    -- Cargar Exhibidores desde el nivel raíz o desde markers
    local exhibitorsToLoad = dealershipData.cars_exhibitor or markersData.cars_exhibitor or {}
    if next(exhibitorsToLoad) then
        for i, exhibitor in pairs(exhibitorsToLoad) do
            local fixedModel = exhibitor.fixedVehicleModel
            local selectedModel = nil
            if fixedModel and fixedModel ~= "" then
                selectedModel = fixedModel
            else
                local allowedVehicles = exhibitor.allowedVehicles or {}
                if #allowedVehicles > 0 then
                    selectedModel = allowedVehicles[1]
                else
                    selectedModel = getRandomCarFromStock(stocks, allowedVehicles)
                end
            end
            if selectedModel then
                createExhibitor(exhibitor, dealershipId, selectedModel, i)
            end
        end
    end
    
    local markerIds = createMarkers(dealershipData, dealershipId)
    
    -- Si ya tiene un blip, mantenerlo y solo actualizar el estado a cargado
    if hasBlipOnly then
        loadedElements.zones[dealershipId].loaded = true
        finish()
        return
    end
    
    local centerCoords = findCenterCoords(dealershipData)
    
    if centerCoords then
        local blipConfig = dealershipData.blipConfig or {}
        local sprite = tonumber(blipConfig.sprite) or 326
        local color = tonumber(blipConfig.color) or 3
        local scale = tonumber(blipConfig.scale) or 0.8

        local blip = AddBlipForCoord(centerCoords.x, centerCoords.y, centerCoords.z)
        SetBlipSprite(blip, sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, scale)
        SetBlipColour(blip, color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(dealershipData.name or locale('ui.admin_panel.title'))
        EndTextCommandSetBlipName(blip)
        
        loadedElements.zones[dealershipId] = {
            blip = blip,
            coords = centerCoords,
            loaded = true
        }
    else
        loadedElements.zones[dealershipId] = {
            blip = nil,
            coords = nil,
            loaded = true
        }
    end

    finish()
end

local function unloadDealership(dealershipId)
    if not loadedElements.zones[dealershipId] then
        return
    end
    
    -- Guardar referencia al blip y coordenadas antes de descargar
    local zone = loadedElements.zones[dealershipId]
    local blip = zone.blip
    local coords = zone.coords
    
    for npcId, npc in pairs(loadedElements.npcs) do
        if npc.dealership == dealershipId then
            if DoesEntityExist(npc.ped) then
                DeleteEntity(npc.ped)
            end
            loadedElements.npcs[npcId] = nil
        end
    end
    
    for exhibitorId, exhibitor in pairs(loadedElements.exhibitors) do
        if exhibitor.dealership == dealershipId then
            if DoesEntityExist(exhibitor.vehicle) then
                DeleteEntity(exhibitor.vehicle)
            end
            loadedElements.exhibitors[exhibitorId] = nil
        end
    end
    
    for markerId, marker in pairs(loadedElements.markers) do
        if marker.dealership == dealershipId then
            loadedElements.markers[markerId] = nil
        end
    end
    
    -- Mantener el blip pero marcar el concesionario como no cargado
    if blip and DoesBlipExist(blip) then
        loadedElements.zones[dealershipId] = {
            blip = blip,
            coords = coords,
            loaded = false -- Marcar como no cargado pero mantener el blip
        }
    else
        loadedElements.zones[dealershipId] = nil
    end
end

local function createGlobalBlips()
    for dealershipId, dealershipData in pairs(dealershipsData) do
        if not loadedElements.zones[dealershipId] or not loadedElements.zones[dealershipId].blip then
            local centerCoords = findCenterCoords(dealershipData)
            
            if centerCoords then
                local blipConfig = dealershipData.blipConfig or {}
                local sprite = tonumber(blipConfig.sprite) or 326
                local color = tonumber(blipConfig.color) or 3
                local scale = tonumber(blipConfig.scale) or 0.8

                local blip = AddBlipForCoord(centerCoords.x, centerCoords.y, centerCoords.z)
                SetBlipSprite(blip, sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, scale)
                SetBlipColour(blip, color)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(dealershipData.name or locale('ui.admin_panel.title'))
                EndTextCommandSetBlipName(blip)
                
                loadedElements.zones[dealershipId] = {
                    blip = blip,
                    coords = centerCoords,
                    loaded = false
                }
            end
        end
    end
end

CreateThread(function()
    -- Esperar a que los datos de los concesionarios estén disponibles
    while not next(dealershipsData) do
        Wait(500)
    end
    
    -- Luego continuar con la carga dinámica de elementos
    while true do
        local playerPed = cache.ped
        local playerCoords = GetEntityCoords(playerPed)
        
        -- Crear blips para nuevos concesionarios en tiempo real
        createGlobalBlips()

        for dealershipId, dealershipData in pairs(dealershipsData) do
            local shouldLoad = false
            local minDistance = math.huge
            
            -- Verificar distancia contra TODOS los tipos de elementos
            local elementTypes = {
                'markers', 'npcs', 'cars_exhibitor', 'car_testdrive', 
                'car_delivery', 'car_preview'
            }

            for _, eType in ipairs(elementTypes) do
                local elements = dealershipData[eType]
                if not elements and dealershipData.markers then
                    elements = dealershipData.markers[eType]
                end

                if type(elements) == "table" then
                    for _, element in pairs(elements) do
                        local coords = getElementCoords(element)
                        if coords then
                            local distance = #(playerCoords - vector3(coords.x, coords.y, coords.z))
                            if distance < minDistance then
                                minDistance = distance
                            end
                        end
                    end
                end
            end
            
            shouldLoad = minDistance <= Config.LoadDistance
            local isLoaded = loadedElements.zones[dealershipId] and loadedElements.zones[dealershipId].loaded
            
            if shouldLoad and not isLoaded then
                loadDealership(dealershipId, dealershipData)
            elseif not shouldLoad and isLoaded and minDistance > Config.UnloadDistance then
                unloadDealership(dealershipId)
            end
        end
        
        Wait(Config.UpdateInterval)
    end
end)

CreateThread(function()
    while true do
        for _, exhibitor in pairs(loadedElements.exhibitors or {}) do
            if exhibitor and exhibitor.vehicle and DoesEntityExist(exhibitor.vehicle) then
                local rotateEnabled = exhibitor.data and exhibitor.data.rotateEnabled
                if rotateEnabled == nil then rotateEnabled = false end

                if rotateEnabled then
                    local speed = (exhibitor.data and tonumber(exhibitor.data.rotateSpeed)) or 12.0
                    exhibitor.rotationHeading = (exhibitor.rotationHeading or exhibitor.baseHeading or 0.0) - (speed * 0.05)
                    if exhibitor.rotationHeading >= 360.0 then
                        exhibitor.rotationHeading = exhibitor.rotationHeading - 360.0
                    elseif exhibitor.rotationHeading < 0.0 then
                        exhibitor.rotationHeading = exhibitor.rotationHeading + 360.0
                    end
                    SetEntityHeading(exhibitor.vehicle, exhibitor.rotationHeading)
                else
                    local fixedHeading = exhibitor.baseHeading or 0.0
                    SetEntityHeading(exhibitor.vehicle, fixedHeading)
                    exhibitor.rotationHeading = fixedHeading
                end
            end
        end
        Wait(50)
    end
end)

CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(cache.ped)
        local shouldDraw = false
        local markerInRange = 0
        local npcInRange = 0
        local exhibitorInRange = 0
        
        for elementId, element in pairs(loadedElements.markers or {}) do
            local distance = #(playerCoords - vector3(element.coords.x, element.coords.y, element.coords.z))
            
            if distance <= 50.0 then
                shouldDraw = true
                DrawMarker(2, element.coords.x, element.coords.y, element.coords.z + 0.5, 
                          0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 
                          255, 120, 0, 180, true, true, 2, false, nil, nil, false)

                if distance <= 2.0 then
                    markerInRange = markerInRange + 1
                    if IsControlJustReleased(0, 38) then
                        handlePress('marker', {
                            entity = nil,
                            coords = vector3(element.coords.x, element.coords.y, element.coords.z)
                        })
                    end
                end
            end
        end
        
        for npcId, npc in pairs(loadedElements.npcs or {}) do
            if npc.useDefaultInteraction then
                local distance = #(playerCoords - vector3(npc.coords.x, npc.coords.y, npc.coords.z))
                if distance <= Config.NPCInteractDistance then
                    npcInRange = npcInRange + 1
                    if IsControlJustReleased(0, 38) then
                        handlePress('npc', {
                            entity = npc.ped,
                            coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z)
                        })
                    end
                end
            end
        end

        local promptText = nil
        for exhibitorId, exhibitor in pairs(loadedElements.exhibitors or {}) do
            if exhibitor and exhibitor.vehicle and DoesEntityExist(exhibitor.vehicle) then
                local interactable = exhibitor.data and exhibitor.data.interactable
                if interactable == nil then interactable = true end
                if interactable then
                    local distance = #(playerCoords - vector3(exhibitor.coords.x, exhibitor.coords.y, exhibitor.coords.z))
                    if distance <= 3.6 then
                        exhibitorInRange = exhibitorInRange + 1
                        
                        promptText = "Revisar coche"
                        if IsControlJustReleased(0, 38) then
                            local allowPurchase = true
                            local allowTestDrive = true
                            local allowedVehicles = {}
                            if exhibitor.data then
                                if exhibitor.data.allowPurchase ~= nil then
                                    allowPurchase = exhibitor.data.allowPurchase
                                end
                                if exhibitor.data.allowTestDrive ~= nil then
                                    allowTestDrive = exhibitor.data.allowTestDrive
                                end
                                if exhibitor.data.allowedVehicles then
                                    allowedVehicles = exhibitor.data.allowedVehicles
                                end
                            end
                            handlePress('exhibitor', {
                                model = exhibitor.model,
                                dealershipId = exhibitor.dealership,
                                coords = vector3(exhibitor.coords.x, exhibitor.coords.y, exhibitor.coords.z),
                                allowPurchase = allowPurchase,
                                allowTestDrive = allowTestDrive,
                                allowedVehicles = allowedVehicles,
                                exhibitorId = exhibitorId
                            })
                        end
                    end
                end
            end
        end
        
        if not promptText then
            if markerInRange > 0 or npcInRange > 0 then
                promptText = locale('ui.help.interact')
            end
        end

        if promptText then
            Custom.DrawText(promptText, 'E')
            helpShown.marker = markerInRange > 0
            helpShown.npc = npcInRange > 0
            helpShown.exhibitor = exhibitorInRange > 0
        else
            if helpShown.marker or helpShown.npc or helpShown.exhibitor then
                Custom.HideText()
                helpShown.marker = false
                helpShown.npc = false
                helpShown.exhibitor = false
            end
        end
        
        Wait(0)
    end
end)

local function getNearestDealership()
    local playerCoords = GetEntityCoords(cache.ped)
    local nearestDealership = nil
    local minDistance = math.huge
    
    for dealershipId, dealershipData in pairs(dealershipsData) do
        local elementTypes = {
            'markers', 'npcs', 'cars_exhibitor', 'car_testdrive', 
            'car_delivery', 'car_preview'
        }

        for _, eType in ipairs(elementTypes) do
            local elements = dealershipData[eType]
            if not elements and dealershipData.markers then
                elements = dealershipData.markers[eType]
            end

            if type(elements) == "table" then
                for _, element in pairs(elements) do
                    local coords = getElementCoords(element)
                    if coords then
                        local distance = #(playerCoords - vector3(coords.x, coords.y, coords.z))
                        if distance < minDistance then
                            minDistance = distance
                            nearestDealership = {
                                id = dealershipId,
                                data = dealershipData,
                                distance = distance
                            }
                        end
                    end
                end
            end
        end
        
        ::continue::
    end
    
    return nearestDealership
end

local function formatVehicleStock(stocks)
    local formattedStock = {}
    
    if not stocks or type(stocks) ~= "table" then
        return formattedStock
    end
    
    for categoryId, categoryData in pairs(stocks) do
        if type(categoryData) == "table" and categoryData.categoryStock then
            -- Filtrar por trabajo si la categoría tiene restricción
            if categoryData.job and categoryData.job ~= "" then
                local playerJob = Custom.GetPlayerJob()
                if not playerJob or string.lower(playerJob) ~= string.lower(categoryData.job) then
                    goto next_category
                end
            end

            local categoryStock = {}

            
            if type(categoryData.categoryStock) == "table" then
                for i = 1, #categoryData.categoryStock do
                    local carData = categoryData.categoryStock[i]
                    if type(carData) == "table" and carData.model then
                        local vehicleInfo = {
                            stock = carData.stock or 0,
                            stockEnabled = carData.stockEnabled or false,
                            class = carData.class or "A",
                            xp = carData.xp or 0,
                            img = carData.img or carData.image or "",
                            model = carData.model,
                            label = carData.label or carData.name or carData.model,
                            price = carData.price or 0,
                            financing = carData.financing or false,
                            paymentMethods = carData.paymentMethods or { cash = true, bank = true, xp = (carData.xp or 0) > 0, company = false },
                            prices = carData.prices or { cash = carData.price or 0, bank = carData.price or 0, xp = carData.xp or 0, company = 0 }
                        }
                        
                        table.insert(categoryStock, vehicleInfo)
                    end
                end
            end
            
            if #categoryStock > 0 then
                formattedStock[categoryId] = {
                    label = categoryData.label or categoryData.name or categoryId,
                    categoryStock = categoryStock
                }
            end
        end
        ::next_category::
    end

    
    return formattedStock
end

local function formatVehicleStockForModels(stocks, targetModels)
    local formattedStock = formatVehicleStock(stocks)
    if not targetModels or type(targetModels) ~= "table" or #targetModels == 0 then
        return formattedStock
    end

    local modelsMap = {}
    for _, m in ipairs(targetModels) do modelsMap[m] = true end

    local filteredStock = {}
    for categoryId, categoryData in pairs(formattedStock) do
        if categoryData.categoryStock then
            local newCategoryStock = {}
            for _, vehicleInfo in ipairs(categoryData.categoryStock) do
                if modelsMap[vehicleInfo.model] then
                    table.insert(newCategoryStock, vehicleInfo)
                end
            end
            if #newCategoryStock > 0 then
                filteredStock[categoryId] = {
                    label = categoryData.label,
                    categoryStock = newCategoryStock
                }
            end
        end
    end

    return filteredStock
end

local function getVehicleStatsByModel(model)
    local modelHash = type(model) == 'number' and model or GetHashKey(model)
    if not modelHash or modelHash == 0 then
        return {
            power = 0.0,
            high_speed = 0.0,
            acceleration = 0.0,
            braking = 0.0
        }
    end

    local power = GetVehicleModelEstimatedMaxSpeed(modelHash) or 0.0
    local highSpeed = GetVehicleModelEstimatedMaxSpeed(modelHash) or 0.0
    local acceleration = GetVehicleModelAcceleration(modelHash) or 0.0
    local braking = GetVehicleModelMaxBraking(modelHash) or 0.0

    return {
        power = power,
        high_speed = highSpeed,
        acceleration = acceleration,
        braking = braking
    }
end

CreateThread(function()
    while true do
        if previewCamera and cameraControls.isAnimating then
            local zoomChanged = math.abs(cameraControls.zoom - cameraControls.targetZoom) > 0.01
            local rotationChanged = math.abs(cameraControls.rotation - cameraControls.targetRotation) > 0.01
            local heightChanged = math.abs(cameraControls.height - cameraControls.targetHeight) > 0.01
            
            if zoomChanged or rotationChanged or heightChanged then
                cameraControls.zoom = lerp(cameraControls.zoom, cameraControls.targetZoom, cameraControls.smoothSpeed)
                cameraControls.rotation = lerp(cameraControls.rotation, cameraControls.targetRotation, cameraControls.smoothSpeed)
                cameraControls.height = lerp(cameraControls.height, cameraControls.targetHeight, cameraControls.smoothSpeed)
                
                local carCoords = getCurrentPreviewCoords()
                if carCoords then
                    updateCameraPosition(carCoords)
                end
            else
                cameraControls.isAnimating = false
                cameraControls.zoom = cameraControls.targetZoom
                cameraControls.rotation = cameraControls.targetRotation
                cameraControls.height = cameraControls.targetHeight
            end
        end
        Wait(16)
    end
end)

function smoothTransition(newZoom, newRotation, newHeight, speed)
    -- Aplicar límites de seguridad
    if newZoom then
        newZoom = math.max(cameraControls.minZoom, math.min(cameraControls.maxZoom, newZoom))
    end
    if newHeight then
        newHeight = math.max(cameraControls.minHeight, math.min(cameraControls.maxHeight, newHeight))
    end
    
    cameraControls.targetZoom = newZoom or cameraControls.targetZoom
    cameraControls.targetRotation = newRotation or cameraControls.targetRotation
    cameraControls.targetHeight = newHeight or cameraControls.targetHeight
    cameraControls.smoothSpeed = speed or cameraControls.smoothSpeed
    cameraControls.isAnimating = true
end

local function getFixedPreviewCoords()
    return vec4(
        FIXED_PREVIEW_VEHICLE_COORDS.x,
        FIXED_PREVIEW_VEHICLE_COORDS.y,
        FIXED_PREVIEW_VEHICLE_COORDS.z,
        FIXED_PREVIEW_VEHICLE_COORDS.w
    )
end

local function applyFixedPreviewView()
    if not previewCamera then return end

    SetCamCoord(previewCamera, FIXED_PREVIEW_CAMERA_COORDS.x, FIXED_PREVIEW_CAMERA_COORDS.y, FIXED_PREVIEW_CAMERA_COORDS.z)

    if previewVehicle and DoesEntityExist(previewVehicle) then
        SetFocusEntity(previewVehicle)
        SetFocusPosAndVel(FIXED_PREVIEW_VEHICLE_COORDS.x, FIXED_PREVIEW_VEHICLE_COORDS.y, FIXED_PREVIEW_VEHICLE_COORDS.z, 0.0, 0.0, 0.0)
        -- Mantener el coche absolutamente anclado para que rote sobre su eje sin desplazarse.
        SetEntityCoordsNoOffset(previewVehicle, FIXED_PREVIEW_VEHICLE_COORDS.x, FIXED_PREVIEW_VEHICLE_COORDS.y, FIXED_PREVIEW_VEHICLE_COORDS.z, false, false, false)
        FreezeEntityPosition(previewVehicle, true)
        SetVehicleHandbrake(previewVehicle, true)
        SetEntityVelocity(previewVehicle, 0.0, 0.0, 0.0)
        local targetHeading = (FIXED_PREVIEW_VEHICLE_COORDS.w + (cameraControls.rotation or 0.0)) % 360.0
        SetEntityHeading(previewVehicle, targetHeading)

        local zoom = cameraControls.zoom or 1.0
        local camFov = math.max(24.0, math.min(70.0, 68.0 - ((zoom - 1.0) * 18.0)))
        SetCamFov(previewCamera, camFov)

        PointCamAtCoord(previewCamera, FIXED_PREVIEW_LOOK_AT.x, FIXED_PREVIEW_LOOK_AT.y, FIXED_PREVIEW_LOOK_AT.z)
    else
        SetCamRot(previewCamera, 0.0, 0.0, FIXED_PREVIEW_CAMERA_COORDS.w, 2)
    end
end

function setupCameras(dm, previewModel)
    if dm and dm.data and dm.data.car_preview and dm.data.car_preview[1] then
        local p = dm.data.car_preview[1]
        local coords = getElementCoords(p)
        if coords then
            local vehW = tonumber(p.heading) or 0.0
            FIXED_PREVIEW_VEHICLE_COORDS = vec4(coords.x, coords.y, coords.z + 0.5, vehW)
            
            -- Calculate a camera position roughly 5 units diagonally in front of the vehicle
            local rad = math.rad(vehW + 45.0)
            local dist = 5.5
            local camX = coords.x + (math.sin(rad) * dist)
            local camY = coords.y - (math.cos(rad) * dist)
            
            FIXED_PREVIEW_CAMERA_COORDS = vec4(camX, camY, coords.z + 1.5, 0.0)
            FIXED_PREVIEW_LOOK_AT = vector3(coords.x, coords.y, coords.z + 1.0)
        end
    end
    
    local carCoords = getFixedPreviewCoords()

    local routingBucket = lib.callback.await('mt-dealerships:routingBucketHandler', false, true)

    if routingBucket then
        if previewVehicle and onDealership == false and DoesEntityExist(previewVehicle) then 
            DeleteEntity(previewVehicle) 
            previewVehicle = false
            Wait(100) 
        end
        
        local initialModel = previewModel or Config.DealershipMenu.defaultVehicleModel
        local modelHash = GetHashKey(initialModel)
        RequestModel(modelHash)
        local timeout = 0
        while not HasModelLoaded(modelHash) and timeout < 50 do
            Wait(100)
            timeout = timeout + 1
        end
        
        if not HasModelLoaded(modelHash) then
            return nil
        end
        
        previewVehicle = CreateVehicle(modelHash, carCoords.x, carCoords.y, carCoords.z, carCoords.w, false, false)
        SetModelAsNoLongerNeeded(modelHash)
        SetVehicleDirtLevel(previewVehicle, 0.0)
        SetEntityHeading(previewVehicle, carCoords.w)
        SetEntityCoordsNoOffset(previewVehicle, carCoords.x, carCoords.y, carCoords.z, false, false, false)
        FreezeEntityPosition(previewVehicle, true)
        SetVehicleHandbrake(previewVehicle, true)
        SetEntityVelocity(previewVehicle, 0.0, 0.0, 0.0)
        SetVehicleEngineOn(previewVehicle, false, true, true)
        onDealership = true
        Wait(500)
        setupPreviewCamera(carCoords)
    end
end

-- Variable para suavizar la posición de la cámara cuando hay colisión
local smoothedCamPos = nil

function setupPreviewCamera(vehicleCoords)
    if previewCamera then
        DestroyCam(previewCamera, false)
    end

    previewCamera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    smoothedCamPos = nil -- Resetear posición suavizada
    
    local initialRotation = cameraControls.savedRotation or 0.0
    local initialZoom = cameraControls.savedZoom or 1.0
    local initialHeight = cameraControls.savedHeight or 1.5
    
    cameraControls.zoom = initialZoom
    cameraControls.rotation = initialRotation
    cameraControls.height = initialHeight
    cameraControls.targetZoom = initialZoom
    cameraControls.targetRotation = initialRotation
    cameraControls.targetHeight = initialHeight
    cameraControls.isAnimating = false
    
    -- Esperar un frame para asegurar que el vehículo esté completamente cargado
    Wait(50)
    
    applyFixedPreviewView()
    SetCamActive(previewCamera, true)
    RenderScriptCams(true, false, 0, true, true)
end

function setupDepthOfField()
    if not previewCamera or not DoesEntityExist(previewVehicle) then return end

    SetCamUseShallowDofMode(previewCamera, true)

    local camCoords = GetCamCoord(previewCamera)
    local vehCoords = GetEntityCoords(previewVehicle)
    local distance = #(camCoords - vehCoords)

    local buffer = 0.3
    SetCamNearDof(previewCamera, distance - buffer)
    SetCamFarDof(previewCamera, distance + buffer)
    SetCamDofStrength(previewCamera, 1.0)

    CreateThread(function()
        while DoesCamExist(previewCamera) do
            SetUseHiDof()
            Wait(0)
        end
    end)
end

function checkCameraCollisions(vehicleCoords, desiredCamPos, maxDistance)
    -- Punto de origen del raycast: centro del vehículo, ligeramente elevado
    local origin = vector3(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5)
    
    -- Raycast desde el centro del vehículo hacia la posición deseada de la cámara
    -- Flags: 1 (world/map) + 16 (objetos) = 17
    local rayHandle = StartShapeTestLosProbe(
        origin.x, origin.y, origin.z,
        desiredCamPos.x, desiredCamPos.y, desiredCamPos.z,
        17,
        previewVehicle,
        4
    )
    
    local _, hit, hitCoords, surfaceNormal, hitEntity = GetShapeTestResult(rayHandle)
    
    if hit == 1 and hitCoords then
        -- Hay colisión — calcular posición segura antes del impacto
        local collisionDistance = #(hitCoords - origin)
        local safeDistance = math.max(collisionDistance - 0.5, 1.5)
        
        local direction = desiredCamPos - origin
        local dirLength = #direction
        if dirLength > 0.01 then
            direction = direction / dirLength
        end
        
        return origin + (direction * safeDistance)
    end
    
    return desiredCamPos
end

function updateCameraPosition(vehicleCoords)
    applyFixedPreviewView()
end

function updateDepthOfField(distance)
    -- if not previewCamera or not DoesEntityExist(previewVehicle) then return end

    -- -- Si se proporciona distancia, usarla; sino calcularla
    -- if not distance then
    --     local camCoords = GetCamCoord(previewCamera)
    --     local vehCoords = GetEntityCoords(previewVehicle)
    --     distance = #(camCoords - vehCoords)
    -- end

    -- if distance > 10.0 then
    --     SetCamUseShallowDofMode(previewCamera, false)
    --     return
    -- end

    -- SetCamUseShallowDofMode(previewCamera, true)

    -- local nearDof, farDof, strength

    -- if distance > 5.0 then
    --     nearDof = distance - 1.0
    --     farDof = distance + 1.0
    --     strength = 0.5
    -- elseif distance > 2.0 then
    --     nearDof = distance - 5.7
    --     farDof = distance + 5.7
    --     strength = 0.7
    -- else
    --     nearDof = distance - 5.3
    --     farDof = distance + 5.3
    --     strength = 0.4
    -- end
    
    -- SetCamNearDof(previewCamera, nearDof)
    -- SetCamFarDof(previewCamera, farDof)
    -- SetCamDofStrength(previewCamera, strength)

    -- CreateThread(function()
    --     while DoesCamExist(previewCamera) do
    --         SetUseHiDof()
    --         Wait(0)
    --     end
    -- end)
end

RegisterNUICallback('mt-dealerships:ui:changeVehiclePreview', function(data, cb)
    local model = GetHashKey(data.model)
    currentPreviewModel = data.model -- Guardar el modelo que se está solicitando actualmente

    if currentInteractionContext.type == 'exhibitor' and currentInteractionContext.exhibitorId then
        local exhibitor = loadedElements.exhibitors[currentInteractionContext.exhibitorId]
        if exhibitor then
            CreateThread(function()
                local rHeading = exhibitor.rotationHeading
                local newId = createExhibitor(exhibitor.data, exhibitor.dealership, data.model, 0)
                if newId and loadedElements.exhibitors[newId] then
                    loadedElements.exhibitors[newId].rotationHeading = rHeading
                    -- Ensure we update the model explicitly
                    loadedElements.exhibitors[newId].model = data.model
                end
            end)
            
            local vehicleStats = getVehicleStatsByModel(data.model)
            cb({
                power = vehicleStats.power,
                high_speed = vehicleStats.high_speed,
                acceleration = vehicleStats.acceleration,
                braking = vehicleStats.braking
            })
            return
        end
    end

    -- Seguridad extra: asegurar instancia individual para que no se solapen previews.
    local routingBucket = lib.callback.await('mt-dealerships:routingBucketHandler', false, true)
    if not routingBucket then
        cb({
            power = 0.0,
            high_speed = 0.0,
            acceleration = 0.0,
            braking = 0.0
        })
        return
    end

    local carCoords = getFixedPreviewCoords()
    
    -- Guardar el estado actual antes de cambiar el vehículo
    cameraControls.savedZoom = cameraControls.zoom
    cameraControls.savedRotation = cameraControls.rotation
    cameraControls.savedHeight = cameraControls.height
    
    if previewVehicle and DoesEntityExist(previewVehicle) then
        DeleteEntity(previewVehicle)
        Wait(50)
    end
    
    RequestModel(model)
    while not HasModelLoaded(model) do
        -- Si mientras cargamos, el usuario ya pidió OTRO modelo, abortamos este proceso
        if currentPreviewModel ~= data.model then 
            SetModelAsNoLongerNeeded(model)
            return 
        end
        Wait(1)
    end
    
    -- Volver a verificar antes de crear el vehículo
    if currentPreviewModel ~= data.model then 
        SetModelAsNoLongerNeeded(model)
        return 
    end

    previewVehicle = CreateVehicle(model, carCoords.x, carCoords.y, carCoords.z, carCoords.w, false, false)
    SetModelAsNoLongerNeeded(model)
    SetVehicleDirtLevel(previewVehicle, 0.0)
    
    -- Esperar a que el vehículo esté completamente inicializado antes de leer los stats
    Wait(150)
    
    -- Verificar una última vez por si cambió mientras esperábamos la inicialización
    if currentPreviewModel ~= data.model then
        if DoesEntityExist(previewVehicle) then DeleteEntity(previewVehicle) end
        return
    end

    SetEntityHeading(previewVehicle, carCoords.w)
    SetEntityCoordsNoOffset(previewVehicle, carCoords.x, carCoords.y, carCoords.z, false, false, false)
    FreezeEntityPosition(previewVehicle, true)
    SetVehicleHandbrake(previewVehicle, true)
    SetEntityVelocity(previewVehicle, 0.0, 0.0, 0.0)
    SetVehicleEngineOn(previewVehicle, false, true, true)
    
    -- Usar los valores guardados para mantener el estado
    local newZoom = cameraControls.savedZoom or 1.0
    local newRotation = cameraControls.savedRotation or 0.0
    local newHeight = cameraControls.savedHeight or 1.0
    smoothTransition(newZoom, newRotation, newHeight, 0.15)

    local vehicleStats = {}
    vehicleStats.power = GetVehicleModelEstimatedMaxSpeed(GetEntityModel(previewVehicle)) or 0
    vehicleStats.high_speed = GetVehicleModelEstimatedMaxSpeed(GetEntityModel(previewVehicle)) or 0
    vehicleStats.acceleration = GetVehicleAcceleration(previewVehicle) or 0
    vehicleStats.braking = GetVehicleMaxBraking(previewVehicle) or 0
    
    local r, g, b = GetVehicleCustomPrimaryColour(previewVehicle)
    local r2, g2, b2 = GetVehicleCustomSecondaryColour(previewVehicle)
    
    -- Actualizar el estado global de colores con los del vehículo recién spawneado
    vehicleColors.primary = {r = r, g = g, b = b}
    vehicleColors.secondary = {r = r2, g = g2, b = b2}

    cb({
        power = vehicleStats.power,
        high_speed = vehicleStats.high_speed,
        acceleration = vehicleStats.acceleration,
        braking = vehicleStats.braking,
        colors = {
            primary = {r = r, g = g, b = b},
            secondary = {r = r2, g = g2, b = b2}
        }
    })
end)

RegisterNUICallback('mt-dealerships:ui:updateCameraControls', function(data, cb)
    local speed = data.speed or 0.1
    
    -- Aplicar límites de seguridad a los valores recibidos
    if data.zoom then
        data.zoom = math.max(cameraControls.minZoom, math.min(cameraControls.maxZoom, data.zoom))
        cameraControls.savedZoom = data.zoom
    end
    if data.height then
        data.height = math.max(cameraControls.minHeight, math.min(cameraControls.maxHeight, data.height))
        cameraControls.savedHeight = data.height
    end
    if data.rotation then
        cameraControls.savedRotation = data.rotation
    end
    
    -- Si la velocidad es alta (arrastre), aplicar directamente sin animación
    if speed > 0.1 then
        cameraControls.zoom = data.zoom or cameraControls.zoom
        cameraControls.rotation = data.rotation or cameraControls.rotation
        cameraControls.height = data.height or cameraControls.height
        cameraControls.targetZoom = cameraControls.zoom
        cameraControls.targetRotation = cameraControls.rotation
        cameraControls.targetHeight = cameraControls.height
        cameraControls.isAnimating = false
        
        -- Aplicar inmediatamente sobre vehículo + cámara fija
        applyFixedPreviewView()
    else
        -- Para zoom/rotación, usar animación suave
        smoothTransition(data.zoom, data.rotation, data.height, speed)
    end
    
    cb('ok')
end)

function getCurrentPreviewCoords()
    if previewVehicle then
        local coords = GetEntityCoords(previewVehicle)
        local heading = GetEntityHeading(previewVehicle)
        return vec4(coords.x, coords.y, coords.z, heading)
    end
    return nil
end

function cleanupPreviewCamera()
    cameraControls.isAnimating = false
    smoothedCamPos = nil
    
    -- Resetear los valores guardados para que la próxima vez se calcule desde cero
    cameraControls.savedZoom = nil
    cameraControls.savedRotation = nil
    cameraControls.savedHeight = nil
    
    if previewCamera then
        SetCamActive(previewCamera, false)
        RenderScriptCams(false, false, 0, true, true)
        DestroyCam(previewCamera, false)
        previewCamera = nil
    end
    
    if previewVehicle and DoesEntityExist(previewVehicle) then
        DeleteEntity(previewVehicle)
        previewVehicle = nil
    end
    
    ClearFocus()
    
    onDealership = false
    currentInteractionContext = {
        type = nil,
        allowPurchase = true,
        allowTestDrive = true
    }
end


function handlePress(type, entityData)
    local nearestDealership = getNearestDealership()
    if type == 'exhibitor' and entityData and entityData.dealershipId and dealershipsData[entityData.dealershipId] then
        nearestDealership = {
            id = entityData.dealershipId,
            data = dealershipsData[entityData.dealershipId]
        }
    end

    print('Interacted with type:', type)

    print('Entity data:', entityData)
    
    if not nearestDealership then
        if Custom and Custom.Notify then
            Custom.Notify(locale('notifications.no_nearby_dealership'), "error")
        end
        return
    end
    
    if type == 'npc' or type == 'marker' or type == 'exhibitor' then
        local allowCatalog = true
        if nearestDealership.data.settings and nearestDealership.data.settings.allowCatalog ~= nil then
            allowCatalog = nearestDealership.data.settings.allowCatalog
        end
        local exhibitorAllowPurchase = true
        local exhibitorAllowTestDrive = true
        if type == 'exhibitor' and entityData then
            if entityData.allowPurchase ~= nil then
                exhibitorAllowPurchase = entityData.allowPurchase
            end
            if entityData.allowTestDrive ~= nil then
                exhibitorAllowTestDrive = entityData.allowTestDrive
            end
        end

        local targetModel = entityData and entityData.model or nil
        local allowedVehicles = (type == 'exhibitor' and entityData and entityData.allowedVehicles) or {}
        
        local dealershipStock = nil
        local rawStock = nearestDealership.data.stocks or nearestDealership.data.stock or {}
        
        if type == 'exhibitor' then
            if #allowedVehicles > 0 then
                dealershipStock = formatVehicleStockForModels(rawStock, allowedVehicles)
            elseif targetModel then
                dealershipStock = formatVehicleStockForModels(rawStock, {targetModel})
            else
                dealershipStock = formatVehicleStock(rawStock)
            end
        else
            dealershipStock = formatVehicleStock(rawStock)
        end

        if (type == 'npc' or type == 'marker') and not allowCatalog then
            if Custom and Custom.Notify then
                Custom.Notify("Este concesionario vende solo coches expuestos.", "error")
            end
            return
        end

        if not dealershipStock or not next(dealershipStock) then
            Custom.Notify(locale('notifications.no_vehicles_available'), "error")
            return
        end

        if type == 'exhibitor' and targetModel then
            local selectedVehicle = nil
            local selectedCategory = nil
            for categoryId, categoryData in pairs(dealershipStock) do
                if categoryData and categoryData.categoryStock then
                    for _, vehicleInfo in ipairs(categoryData.categoryStock) do
                        if vehicleInfo.model == targetModel then
                            selectedVehicle = vehicleInfo
                            selectedCategory = categoryId
                            break
                        end
                    end
                end
                if selectedVehicle then break end
            end

            if not selectedVehicle then
                Custom.Notify(locale('notifications.no_vehicles_available'), "error")
                return
            end

            local stats = getVehicleStatsByModel(targetModel)
            currentInteractionContext = {
                type = type,
                allowPurchase = exhibitorAllowPurchase,
                allowTestDrive = exhibitorAllowTestDrive,
                exhibitorId = (type == 'exhibitor' and entityData.exhibitorId) or nil
            }

            SendNUIMessage({
                action = "openDealership",
                dealershipMenu = {
                    visible = true,
                    dealershipStock = dealershipStock,
                    dealershipInfo = {
                        id = nearestDealership.id,
                        name = nearestDealership.data.name or "Concesionario",
                        type = nearestDealership.data.type or "dealership",
                        interactionType = type,
                        liveInspect = true,
                        allowCatalog = (#allowedVehicles > 1),
                        focusVehicleModel = targetModel,
                        selectedCategory = selectedCategory,
                        selectedVehicle = selectedVehicle,
                        currentVehicleStats = {
                            { label = 'Potencia', value = stats.power },
                            { label = 'Velocidad punta', value = stats.high_speed },
                            { label = 'Aceleración', value = stats.acceleration * 100 },
                            { label = 'Frenado', value = stats.braking * 100 }
                        },
                        exhibitorAccess = {
                            allowPurchase = exhibitorAllowPurchase,
                            allowTestDrive = exhibitorAllowTestDrive
                        },
                        updateTime = clientUpdateTime,
                        settings = nearestDealership.data.settings or {
                            allowTestDrive = true,
                            testDriveTime = 5,
                            allowCatalog = false
                        }
                    }
                }
            })

            SetNuiFocus(true, true)
            return
        end

        HudFadeOut(350)
        setupCameras(nearestDealership, targetModel)
        currentInteractionContext = {
            type = type,
            allowPurchase = exhibitorAllowPurchase,
            allowTestDrive = exhibitorAllowTestDrive,
            exhibitorId = (type == 'exhibitor' and entityData.exhibitorId) or nil
        }
        
        local totalCategories = 0
        local totalVehicles = 0
        for categoryId, categoryData in pairs(dealershipStock) do
            totalCategories = totalCategories + 1
            totalVehicles = totalVehicles + #categoryData.categoryStock
        end

        SendNUIMessage({
            action = "openDealership",
            dealershipMenu = {
                visible = true,
                dealershipStock = dealershipStock,
                dealershipInfo = {
                    id = nearestDealership.id,
                    name = nearestDealership.data.name or "Concesionario",
                    type = nearestDealership.data.type or "dealership",
                    interactionType = type,
                    allowCatalog = allowCatalog,
                    focusVehicleModel = targetModel,
                    exhibitorAccess = {
                        allowPurchase = exhibitorAllowPurchase,
                        allowTestDrive = exhibitorAllowTestDrive
                    },
                    updateTime = clientUpdateTime,
                    settings = nearestDealership.data.settings or {
                        allowTestDrive = true,
                        testDriveTime = 5,
                        allowCatalog = true
                    }
                }
            }
        })
        
        SetNuiFocus(true, true)
    end
end

RegisterNUICallback('mt-dealerships:ui:previewReady', function(_, cb)
    if onDealership then
        HudFadeIn(420)
    end
    cb('ok')
end)

RegisterNUICallback('mt-dealerships:ui:changePrimary', function(data, cb)
    local r, g, b = data.r, data.g, data.b
    local veh = previewVehicle
    
    if not veh or not DoesEntityExist(veh) then
        if currentInteractionContext and currentInteractionContext.type == 'exhibitor' and currentInteractionContext.exhibitorId then
            local exhibitor = loadedElements.exhibitors[currentInteractionContext.exhibitorId]
            if exhibitor and exhibitor.vehicle and DoesEntityExist(exhibitor.vehicle) then
                veh = exhibitor.vehicle
            end
        end
    end
    
    if veh and DoesEntityExist(veh) then
        vehicleColors.primary = {r = r, g = g, b = b}
        SetVehicleCustomPrimaryColour(veh, r, g, b)
        cb('ok')
    else
        cb('error')
    end
end)

RegisterNUICallback('mt-dealerships:ui:changeSecondary', function(data, cb)
    local r, g, b = data.r, data.g, data.b
    local veh = previewVehicle
    
    if not veh or not DoesEntityExist(veh) then
        if currentInteractionContext and currentInteractionContext.type == 'exhibitor' and currentInteractionContext.exhibitorId then
            local exhibitor = loadedElements.exhibitors[currentInteractionContext.exhibitorId]
            if exhibitor and exhibitor.vehicle and DoesEntityExist(exhibitor.vehicle) then
                veh = exhibitor.vehicle
            end
        end
    end
    
    if veh and DoesEntityExist(veh) then
        vehicleColors.secondary = {r = r, g = g, b = b}
        SetVehicleCustomSecondaryColour(veh, r, g, b)
        cb('ok')
    else
        cb('error')
    end
end)

RegisterNetEvent('mt-dealerships:updateAll', function(newDealershipsData, updateTime)
    clearAllElements()
    dealershipsData = newDealershipsData
    clientUpdateTime = updateTime
    
end)

-- Función para forzar recarga de todos los elementos visuales
local function forceReloadAllElements()
    -- Obtener lista de concesionarios cargados actualmente
    local loadedDealerships = {}
    for dealershipId, _ in pairs(loadedElements.zones) do
        loadedDealerships[dealershipId] = true
    end
    
    -- Descargar todos los elementos actuales
    clearAllElements()
    
    -- Recargar concesionarios que estaban cargados
    for dealershipId, _ in pairs(loadedDealerships) do
        local dealershipData = dealershipsData[dealershipId]
        if dealershipData then
            loadDealership(dealershipId, dealershipData)
        end
    end
end

RegisterNetEvent('mt-dealerships:receiveData', function(dealerships, updateTime)
    local oldData = dealershipsData
    dealershipsData = dealerships
    clientUpdateTime = updateTime
    
    if next(oldData) then
        forceReloadAllElements()
    end
end)

RegisterNetEvent('mt-dealerships:updateBlips', function()
    for dealershipId, dealershipData in pairs(dealershipsData) do
        local zone = loadedElements.zones[dealershipId]
        if zone and zone.blip and DoesBlipExist(zone.blip) then
            local blipConfig = dealershipData.blipConfig or {}
            local sprite = tonumber(blipConfig.sprite) or 326
            local color = tonumber(blipConfig.color) or 3
            local scale = tonumber(blipConfig.scale) or 0.8
            
            SetBlipSprite(zone.blip, sprite)
            SetBlipColour(zone.blip, color)
            SetBlipScale(zone.blip, scale)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(dealershipData.name or locale('ui.admin_panel.title'))
            EndTextCommandSetBlipName(zone.blip)
        end
    end
end)

local testDriveVehicle = false
RegisterNUICallback('mt-dealerships:ui:testDriveVehicle', function(data,cb)
    if currentInteractionContext.type == 'exhibitor' and currentInteractionContext.allowTestDrive == false then
        cb({
            success = false,
            message = 'La prueba de manejo esta desactivada para este exhibidor'
        })
        return
    end

    local coords = GetEntityCoords(cache.ped)
    local dealership = nil
    if data and data.dealershipId and dealershipsData[data.dealershipId] then
        dealership = {
            id = data.dealershipId,
            data = dealershipsData[data.dealershipId]
        }
    else
        dealership = getNearestDealership()
    end
    if not dealership then
        cb(false)
        return
    end
    local testDriveCoords = nil
    local testDriveData = dealership.data.car_testdrive or (dealership.data.markers and dealership.data.markers.car_testdrive)
    if testDriveData then
        for _, coords in ipairs(testDriveData) do
            local vehicleInArea = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
            if vehicleInArea == 0 or not DoesEntityExist(vehicleInArea) then
                testDriveCoords = coords
                break
            end
        end
    end

    if not testDriveCoords then
        Custom.Notify('No hay puntos de prueba de manejo libres. Espera a que se libere alguno.', 'error')
        cb({
            success = false,
            message = 'Todos los puntos de prueba están ocupados'
        })
        return
    end

    local routingBucket = lib.callback.await('mt-dealerships:routingBucketHandler', false, true)
    if not routingBucket then
        cb(false)
        return
    end

    if testDriveVehicle and DoesEntityExist(testDriveVehicle) then
        SetEntityAsMissionEntity(testDriveVehicle, true, true)
        DeleteEntity(testDriveVehicle)
        testDriveVehicle = false
    end

    local model = GetHashKey(data.model)

    RequestModel(model)

    local timeout = 0

    while not HasModelLoaded(model) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end

    if not HasModelLoaded(model) then
        cb(false)
        return
    end

    -- El punto de test drive ya fue verificado al inicio

    testDriveVehicle = CreateVehicle(model, testDriveCoords.x, testDriveCoords.y, testDriveCoords.z, testDriveCoords.heading, false, false)
    DoScreenFadeOut(500)

    if not DoesEntityExist(testDriveVehicle) then
        SetModelAsNoLongerNeeded(model)
        DoScreenFadeIn(2000)
        cb(false)
        return
    end
    if not vehicleColors.primary or not vehicleColors.secondary then
        vehicleColors.primary = {r = 255, g = 255, b = 255}
        vehicleColors.secondary = {r = 255, g = 255, b = 255}
    end
    local r, g, b = vehicleColors.primary.r, vehicleColors.primary.g, vehicleColors.primary.b
    local r2, g2, b2 = vehicleColors.secondary.r, vehicleColors.secondary.g, vehicleColors.secondary.b
    SetModelAsNoLongerNeeded(model)
    SetEntityAsMissionEntity(testDriveVehicle, true, true)
    SetVehicleOnGroundProperly(testDriveVehicle)
    SetVehicleNumberPlateText(testDriveVehicle, Config.TestDrive.plate)
    TaskWarpPedIntoVehicle(cache.ped, testDriveVehicle, -1)
    SetVehicleEngineOn(testDriveVehicle, true, true, false)
    SetVehicleUndriveable(testDriveVehicle, false)
    SetVehicleCustomPrimaryColour(testDriveVehicle, r, g, b)
    SetVehicleCustomSecondaryColour(testDriveVehicle, r2, g2, b2)
    SetVehicleDirtLevel(testDriveVehicle,0.0)
    DoScreenFadeIn(100)

    TriggerServerEvent('mt-dealerships:sv:testDriveStarted', {
        dealershipId = dealership.data.id,
        dealershipName = dealership.data.name,
        vehicleModel = data.model,
        vehicleLabel = data.label,
        duration = dealership.data.settings and dealership.data.settings.testDriveTime or 5
    })

    CreateThread(function()
        while testDriveVehicle and DoesEntityExist(testDriveVehicle) do
            Wait(500)
            if not IsPedInVehicle(cache.ped, testDriveVehicle, false) then
                SetEntityAsMissionEntity(testDriveVehicle, true, true)
                DeleteEntity(testDriveVehicle)
                testDriveVehicle = false
                DoScreenFadeOut(500)
                
                SendNUIMessage({
                action = "closeTestDrive",
                })
                
                Wait(500)
                SetEntityCoords(cache.ped, coords.x, coords.y, coords.z)
                Wait(1000)
                DoScreenFadeIn(1000)
                if Custom and Custom.Notify then
                    Custom.Notify(locale('notifications.test_drive_cancelled'), "error")
                end
                
                TriggerServerEvent('mt-dealerships:sv:testDriveEnded', {
                    dealershipId = dealership.data.id,
                    dealershipName = dealership.data.name,
                    vehicleModel = data.model,
                    vehicleLabel = data.label,
                    status = 'cancelled'
                })
                
                lib.callback.await('mt-dealerships:routingBucketHandler', false)
                break
            end
        end
    end)

    local testDriveTime = (dealership.data.settings and dealership.data.settings.testDriveTime or 5) * 60 * 1000
    SetTimeout(testDriveTime,function()
        if DoesEntityExist(testDriveVehicle) then
            DoScreenFadeOut(0)
            Wait(500)
            SetEntityAsMissionEntity(testDriveVehicle, true, true)
            DeleteEntity(testDriveVehicle)
            testDriveVehicle = false
            SetEntityCoords(cache.ped, coords.x, coords.y, coords.z)
            Wait(2000)
            DoScreenFadeIn(2000)
            if Custom and Custom.Notify then
                Custom.Notify(locale('notifications.test_drive_finished'), "success")
            end
            SendNUIMessage({
                action = "closeTestDrive",
            })
            
            TriggerServerEvent('mt-dealerships:sv:testDriveEnded', {
                dealershipId = dealership.data.id,
                dealershipName = dealership.data.name,
                vehicleModel = data.model,
                vehicleLabel = data.label,
                status = 'completed'
            })
            
            lib.callback.await('mt-dealerships:routingBucketHandler', false)
        end
        
    end)
    cb({
        success = true,
        timer = testDriveTime
    })
end)

RegisterNUICallback('mt-dealerships:ui:purchaseVehicle', function(data, cb)
    if currentInteractionContext.type == 'exhibitor' and currentInteractionContext.allowPurchase == false then
        return cb({
            success = false,
            message = 'La compra esta desactivada para este exhibidor'
        })
    end
    
    local dealership = nil
    if data and data.dealershipId and dealershipsData[data.dealershipId] then
        dealership = {
            id = data.dealershipId,
            data = dealershipsData[data.dealershipId]
        }
    else
        dealership = getNearestDealership()
    end
    
    if not dealership then
        cb(false)
        return
    end
    local purchaseCoords = nil
    local deliveryData = dealership.data.car_delivery or (dealership.data.markers and dealership.data.markers.car_delivery)
    if deliveryData then
        for _, coords in ipairs(deliveryData) do
            local vehicleInArea = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
            if vehicleInArea == 0 or not DoesEntityExist(vehicleInArea) then
                purchaseCoords = coords
                break
            end
        end
    end
    local dataResult = lib.callback.await('mt-dealerships:sv:purchaseVehicle', false, data)


    if dataResult and dataResult.success then
        if not dataResult.plate then
            SetNuiFocus(false, false)
            local errorMsg = dataResult.error or "Error desconocido"
            Custom.Notify(locale('notifications.error_purchasing_vehicle') .. ': ' .. errorMsg, 'error')
            return cb(
                {
                    success = false,
                    message = 'Error al comprar el vehículo: ' .. errorMsg
                }
            )
        end

        SetNuiFocus(false, false)

        DoScreenFadeOut(500)
        Wait(500)
        Custom.Notify(locale('notifications.vehicle_purchased'), 'success')
        local hash = GetHashKey(data.vehicleModel)
        RequestModel(hash)
        local timeout = 0
        while not HasModelLoaded(hash) and timeout < 50 do
            Wait(100)
            timeout = timeout + 1
        end
        if not HasModelLoaded(hash) then
            Custom.Notify(locale('notifications.error_loading_vehicle'), 'error')
            return cb(
                {
                    success = false,
                    message = 'Error al cargar el vehículo'
                }
            )
        end
        local plate = dataResult.plate

        local purchasedVehicle = nil
        if Config.VehiclePurchase.spawnVehicle then
            if not purchaseCoords then
                Custom.Notify('No hay puntos de entrega libres. Espera a que se libere alguno.', 'error')
                DoScreenFadeIn(2000)
                cleanupPreviewCamera()
                lib.callback.await('mt-dealerships:routingBucketHandler', false)
                return cb({
                    success = false,
                    message = 'Todos los puntos de entrega están ocupados'
                })
            end
            -- Spawner el vehículo si está configurado para hacerlo
            purchasedVehicle = CreateVehicle(hash, purchaseCoords.x, purchaseCoords.y, purchaseCoords.z, purchaseCoords.heading, true, false)
            if not DoesEntityExist(purchasedVehicle) then
                Custom.Notify(locale('notifications.error_creating_vehicle'), 'error')
                return cb(
                    {
                        success = false,
                        message = 'Error al crear el vehículo'
                    }
                )
            end

            SetModelAsNoLongerNeeded(hash)
            SetVehicleOnGroundProperly(purchasedVehicle)
            SetVehicleNumberPlateText(purchasedVehicle, plate)
            SetEntityAsMissionEntity(purchasedVehicle, true, true)
            TaskWarpPedIntoVehicle(cache.ped, purchasedVehicle, -1)
            SetVehicleEngineOn(purchasedVehicle, true, true, false)
            SetVehicleUndriveable(purchasedVehicle, false)
            SetVehicleDirtLevel(purchasedVehicle, 0.0)

            if data.primaryColor then
                SetVehicleCustomPrimaryColour(purchasedVehicle, data.primaryColor.r, data.primaryColor.g, data.primaryColor.b)
            end
            if data.secondaryColor then
                SetVehicleCustomSecondaryColour(purchasedVehicle, data.secondaryColor.r, data.secondaryColor.g, data.secondaryColor.b)
            end

            
            -- Esperar un momento para que el vehículo se inicialice completamente
            Wait(500)

            
            -- Obtener propiedades del vehículo para guardar en la base de datos
            local props = Custom.GetVehicleProps(purchasedVehicle)
            
            -- Forzar los colores seleccionados en las propiedades
            if data.primaryColor then 
                props.color1 = {data.primaryColor.r, data.primaryColor.g, data.primaryColor.b} 
            end
            if data.secondaryColor then 
                props.color2 = {data.secondaryColor.r, data.secondaryColor.g, data.secondaryColor.b} 
            end


            TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(purchasedVehicle))
            
            -- Agregar el vehículo a la base de datos en el servidor
            local dbResult = lib.callback.await('mt-dealerships:sv:addVehicleToDatabase', false, {
                vehicleModel = data.vehicleModel,
                plate = plate,
                props = props
            })
            
            if Config.Debug then
                print('^2[MT DEALERSHIPS] ^7Resultado DB:', json.encode(dbResult))
            end
            
            -- Dar llaves si está configurado
            if Config.VehiclePurchase.giveKeysOnPurchase then
                Custom.GiveKeys(purchasedVehicle, plate)
            end

            -- Eliminar camara 
            cleanupPreviewCamera()
        else
            -- Solo guardar en la base de datos sin spawnear
            SetModelAsNoLongerNeeded(hash)
            
            -- Crear propiedades básicas para la base de datos
            local props = {
                model = GetHashKey(data.vehicleModel),
                plate = plate,
                bodyHealth = 1000.0,
                engineHealth = 1000.0,
                fuelLevel = 100.0,
                dirtLevel = 0.0,
                color1 = data.primaryColor and {data.primaryColor.r, data.primaryColor.g, data.primaryColor.b} or {255, 255, 255},
                color2 = data.secondaryColor and {data.secondaryColor.r, data.secondaryColor.g, data.secondaryColor.b} or {255, 255, 255}
            }
            
            -- Agregar el vehículo a la base de datos en el servidor
            local dbResult = lib.callback.await('mt-dealerships:sv:addVehicleToDatabase', false, {
                vehicleModel = data.vehicleModel,
                plate = plate,
                props = props
            })

            -- Dar llaves si está configurado
            if Config.VehiclePurchase.giveKeysOnPurchase then
                Custom.GiveKeys(nil, plate)
            end

            -- Eliminar camara 
            cleanupPreviewCamera()
        end
        
        if Config.Debug then
            print('^2[MT DEALERSHIPS] ^7Resultado DB:', json.encode(dbResult))
        end
    


        DoScreenFadeIn(2000)

        return cb(
            {
                success = true,
                message = 'Vehículo comprado con éxito'
            }
        )
    else
        local errorMsg = dataResult and dataResult.error or locale('errors.general')
        Custom.Notify(locale('notifications.error_purchasing_vehicle') .. ': ' .. errorMsg, 'error')
        
        -- Asegurar que el preview se mantenga activo después de un fallo
        if not previewVehicle or not DoesEntityExist(previewVehicle) then
            local nearestDealership = getNearestDealership()
            if nearestDealership then
                setupCameras(nearestDealership)
            end
        end
        
        return cb(
            {
                success = false,
                message = errorMsg
            }
        )
    end
end)

-- Hilo para verificar actualizaciones periódicas del servidor
CreateThread(function()
    while true do
        if next(dealershipsData) then
            -- Verificar si hay actualizaciones disponibles cada 30 segundos
            local success, response = pcall(function()
                return lib.callback.await('mt-dealerships:getDealershipsData', false, clientUpdateTime)
            end)
            
            if success and response and response.fullUpdate and response.dealerships then
                -- Hay actualizaciones disponibles
                local oldData = dealershipsData
                dealershipsData = response.dealerships
                clientUpdateTime = response.updateTime
                
                -- Forzar recarga si había datos previos cargados
                if next(oldData) then
                    forceReloadAllElements()
                end
            end
        end
        
        -- Esperar 30 segundos antes de la próxima verificación
        Wait(30000)
    end
end)

CreateThread(function()
    while not cache.ped or cache.ped == 0 do
        Wait(100)
    end
    
    Wait(1000)
    
    local success, response = pcall(function()
        return lib.callback.await('mt-dealerships:getDealershipsData', false, 0)
    end)
    
    if success and response and response.dealerships then
        dealershipsData = response.dealerships
        clientUpdateTime = response.updateTime or GetGameTimer()
    else
        Wait(1000)
        TriggerServerEvent('mt-dealerships:requestInitialData')
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        -- eliminar NPCs creados
        for _, ped in ipairs(createdNPCS) do
            if DoesEntityExist(ped) then
                DeletePed(ped)
            end
        end

        for _, exhibitor in pairs(loadedElements.exhibitors or {}) do
            if exhibitor and exhibitor.vehicle and DoesEntityExist(exhibitor.vehicle) then
                DeleteEntity(exhibitor.vehicle)
            end
        end

        if previewVehicle and DoesEntityExist(previewVehicle) then
            DeleteEntity(previewVehicle)
        end

        if testDriveVehicle and DoesEntityExist(testDriveVehicle) then
            DeleteEntity(testDriveVehicle)
        end
    end
end)