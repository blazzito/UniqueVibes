local config = lib.load('config.main')

local activeMarkers = {}
local renderList = {}
local isDrawing = false

local function startDrawing()
    if isDrawing then return end
    isDrawing = true

    CreateThread(function()
        while #activeMarkers > 0 do
            local cam = GetFinalRenderedCamCoord()
            local ped = GetEntityCoords(cache.ped)

            for i = 1, #activeMarkers do
                local marker = activeMarkers[i]
                MarkerManager.draw(marker, cam, ped)
            end

            Wait(0)
        end

        isDrawing = false
    end)
end

local currentMarkerMarker = nil

CreateThread(function()
    while true do
        local newActive = {}
        local newRenderList = {}
        local cam = GetFinalRenderedCamCoord()

        local markers = MarkerManager.getAll()

        for i = 1, #markers do
            local marker = markers[i]

            if MarkerManager.canShow(marker, cam) then
                if not marker.isRendering then
                    MarkerManager.startRender(marker)
                end

                if marker.isRendering then
                    newActive[#newActive + 1] = marker
                    newRenderList[marker.id] = true
                end
            end
        end

        for id in pairs(renderList) do
            if not newRenderList[id] then
                local marker = MarkerManager.find(id)
                if marker then
                    MarkerManager.stopRender(marker)
                end
            end
        end

        activeMarkers = newActive
        renderList = newRenderList

        if #activeMarkers > 0 and not isDrawing then
            startDrawing()
        end

        Wait(config.rendering.updateInterval)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == cache.resource then
        MarkerManager.clearAll()
    end
end)

-- Server Event Handlers
RegisterNetEvent('mt-waypoint:client:loadMarkers', function(serverMarkers)
    MarkerManager.clearAll()
    for id, data in pairs(serverMarkers) do
        MarkerManager.create(data, id)
    end
end)

RegisterNetEvent('mt-waypoint:client:createMarker', function(data)
    MarkerManager.create(data, data.id)
end)

RegisterNetEvent('mt-waypoint:client:removeMarker', function(id)
    MarkerManager.remove(id)
end)

RegisterNetEvent('mt-waypoint:client:clearAll', function()
    MarkerManager.clearAll()
end)

-- Initialization
CreateThread(function()
    Wait(1000) -- Small wait to ensure everything is loaded
    TriggerServerEvent('mt-waypoint:server:requestMarkers')
end)

exports('Create', MarkerManager.create)
exports('Update', MarkerManager.update)
exports('Remove', MarkerManager.remove)
exports('ClearAll', MarkerManager.clearAll)
exports('Get', MarkerManager.find)

-- Global Sync Exports (Optional, but useful)
exports('CreateGlobal', function(data)
    TriggerServerEvent('mt-waypoint:server:createMarker', data)
end)

exports('RemoveGlobal', function(id)
    TriggerServerEvent('mt-waypoint:server:removeMarker', id)
end)

exports('ClearAllGlobal', function()
    TriggerServerEvent('mt-waypoint:server:clearAll')
end)

-- Control del marcador automático en el Waypoint del mapa
local waypointMarkerId = nil

CreateThread(function()
    while true do
        local waypointBlip = GetFirstBlipInfoId(8) -- 8 es el ID del waypoint

        if DoesBlipExist(waypointBlip) then
            local coords = GetBlipInfoIdCoord(waypointBlip)
            
            if not waypointMarkerId then
                -- Intentar obtener la altura del suelo
                local foundGround, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, 1000.0, 0)
                if foundGround then
                    coords = vector3(coords.x, coords.y, groundZ)
                else
                    coords = vector3(coords.x, coords.y, 20.0) 
                end

                print("^2[MT Waypoints] ^7Waypoint detectado. Creando marcador...")
                
                -- Usar el export para que sea idéntico al test del usuario
                waypointMarkerId = exports['mt-waypoints']:Create({
                    coords = coords,
                    type = 'checkpoint',
                    label = 'Destino',
                    size = 1.0,
                    drawDistance = 1000.0,
                })
                
                if waypointMarkerId then
                    print("^2[MT Waypoints] ^7Marcador creado con ID: " .. tostring(waypointMarkerId))
                end
            else
                -- Actualizar posición si el waypoint se mueve
                local marker = MarkerManager.find(waypointMarkerId)
                if marker then
                    if #(marker.data.coords - coords) > 5.0 then
                        local _, gZ = GetGroundZFor_3dCoord(coords.x, coords.y, 1000.0, 0)
                        coords = vector3(coords.x, coords.y, gZ or coords.z)
                        exports['mt-waypoints']:Update(waypointMarkerId, { coords = coords })
                    end
                end
            end
        else
            if waypointMarkerId then
                print("^1[MT Waypoints] ^7Eliminando marcador de waypoint.")
                exports['mt-waypoints']:Remove(waypointMarkerId)
                waypointMarkerId = nil
            end
        end

        Wait(1000)
    end
end)

--[[ 
    -- Ejemplo de uso de los exports (Recuerda usar ['mt-waypoints']):

    local markerId = exports['mt-waypoints']:Create({
        coords = vector3(0.0, 0.0, 0.0),
        type = 'checkpoint',
        label = 'MATA 1', 
        size = 1.0,
        drawDistance = 600.0,
        removeDistance = 50.0,
    })

    exports['mt-waypoints']:Update(markerId, {
        coords = vector3(0.0, 0.0, 0.0),
        label = 'MATA 2'
    })

    exports['mt-waypoints']:Remove(markerId)

    exports['mt-waypoints']:ClearAll() 
]]