local creatingZone = false
local zonePoints = {}
local tempMarkers = {}
local callback = nil

-- --- SISTEMA DE TEXTUI ESTILO ORIGEN ---
local activeTextUI = nil

local function ShowText(text, key, coords)
    if activeTextUI == text then return end
    if activeTextUI then
        exports['mt-notify']:DeleteDrawText3D("zone_creator")
    end
    activeTextUI = text
    
    local pos = coords or GetEntityCoords(PlayerPedId())
    
    exports['mt-notify']:create3DTextUI("zone_creator", {
        coords = pos,
        text = text,
        key = key or "E",
        type = "textui",
        displayDist = 10.0,
        interactDist = 5.0
    })
end

local function HideText()
    if not activeTextUI then return end
    exports['mt-notify']:DeleteDrawText3D("zone_creator")
    activeTextUI = nil
end

local function DrawText3D(coords, text)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local camCoords = GetGameplayCamCoords()
    local dist = #(coords - camCoords)
    
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    
    if onScreen then
        SetTextScale(0.35 * scale, 0.35 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
    end
end

local function DrawLine3D(from, to, r, g, b, a)
    DrawLine(from.x, from.y, from.z, to.x, to.y, to.z, r, g, b, a or 255)
end

local function DrawZonePreview()
    if #zonePoints < 1 then return end
    
    -- Dibujar marcadores en cada punto
    for i, point in ipairs(zonePoints) do
        DrawMarker(
            28, -- Marker tipo cilindro
            point.x, point.y, point.z,
            0.0, 0.0, 0.0,
            0.0, 0.0, 0.0,
            0.5, 0.5, 1.5,
            255, 107, 53, 150, -- Color naranja
            false, true, 2, false, nil, nil, false
        )
        
        -- Texto con número del punto
        DrawText3D(vector3(point.x, point.y, point.z + 1.5), "Punto #" .. i)
    end
    
    -- Dibujar líneas entre puntos
    for i = 1, #zonePoints do
        local nextIndex = (i % #zonePoints) + 1
        DrawLine3D(
            vector3(zonePoints[i].x, zonePoints[i].y, zonePoints[i].z),
            vector3(zonePoints[nextIndex].x, zonePoints[nextIndex].y, zonePoints[nextIndex].z),
            255, 107, 53, 200
        )
    end
end

local function StartZoneCreation(cb)
    if creatingZone then
        return
    end
    
    creatingZone = true
    zonePoints = {}
    callback = cb
    
    lib.notify({
        title = 'Creador de Zonas',
        description = 'Sigue las instrucciones en pantalla',
        type = 'info',
        duration = 5000
    })
    
    CreateThread(function()
        while creatingZone do
            Wait(0)
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)

            -- Dibujar preview de la zona
            DrawZonePreview()
            
            -- Mostrar ayuda con mt-notify
            if #zonePoints < 3 then
                ShowText("Añadir Punto (" .. #zonePoints .. "/3 mín)", "E", coords + vec3(0,0,1.2))
            else
                if IsControlPressed(0, 18) then -- ENTER presionado
                     HideText()
                else
                     ShowText("Añadir Punto | [ENTER] Finalizar", "E", coords + vec3(0,0,1.2))
                end
            end
            
            -- Tecla E para agregar punto
            if IsControlJustPressed(0, 38) then -- E
                table.insert(zonePoints, {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z
                })
                
                lib.notify({
                    title = 'Punto Añadido',
                    description = 'Punto #' .. #zonePoints .. ' registrado',
                    type = 'success'
                })
            end
            
            -- Tecla ENTER para finalizar
            if IsControlJustPressed(0, 18) then -- ENTER
                if #zonePoints < 3 then
                    lib.notify({
                        title = 'Error',
                        description = 'Necesitas al menos 3 puntos',
                        type = 'error'
                    })
                else
                    lib.notify({
                        title = 'Zona Creada',
                        description = 'Zona guardada con ' .. #zonePoints .. ' puntos',
                        type = 'success'
                    })
                    
                    if callback then
                        callback(zonePoints)
                    end
                    
                    creatingZone = false
                    HideText()
                    zonePoints = {}
                    callback = nil
                end
            end
            
            -- Tecla BACKSPACE para cancelar
            if IsControlJustPressed(0, 177) then -- BACKSPACE
                lib.notify({
                    title = 'Cancelado',
                    description = 'Creación de zona cancelada',
                    type = 'error'
                })
                
                creatingZone = false
                HideText()
                zonePoints = {}
                callback = nil
            end
            
            -- Deshabilitar controles
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 47, true) -- Weapon wheel
            DisableControlAction(0, 58, true) -- Next weapon
            DisableControlAction(0, 263, true) -- Melee attack
            DisableControlAction(0, 264, true) -- Melee attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 140, true) -- Melee attack light
            DisableControlAction(0, 141, true) -- Melee attack heavy
            DisableControlAction(0, 142, true) -- Melee attack alternate
            DisableControlAction(0, 143, true) -- Melee block
        end
    end)
end

-- Export para iniciar la creación de zona
exports('StartZoneCreation', StartZoneCreation)

-- Función para verificar si un punto está dentro de un polyzone
local function IsPointInZone(point, zone)
    if not zone or #zone < 3 then return false end
    
    local x, y = point.x, point.y
    local inside = false
    local j = #zone
    
    for i = 1, #zone do
        local xi, yi = zone[i].x, zone[i].y
        local xj, yj = zone[j].x, zone[j].y
        
        if ((yi > y) ~= (yj > y)) and (x < (xj - xi) * (y - yi) / (yj - yi) + xi) then
            inside = not inside
        end
        j = i
    end
    
    return inside
end

exports('IsPointInZone', IsPointInZone)

-- Función para obtener la gasolinera más cercana basada en polyzone
local function GetClosestStationByZone(coords)
    local stations = GlobalState.Stations or {}
    
    for id, station in pairs(stations) do
        if station.polyzone and IsPointInZone(coords, station.polyzone) then
            return id, station
        end
    end
    
    return nil, nil
end

exports('GetClosestStationByZone', GetClosestStationByZone)
