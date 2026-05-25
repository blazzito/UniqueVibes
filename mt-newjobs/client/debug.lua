local function RotationToDirection(rotation)
    local adjustedRotation = 
    { 
        x = (math.pi / 180) * rotation.x, 
        y = (math.pi / 180) * rotation.y, 
        z = (math.pi / 180) * rotation.z 
    }
    local direction = 
    {
        x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
        y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
        z = math.sin(adjustedRotation.x)
    }
    return direction
end

local function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
    local cameraCoord = GetGameplayCamCoord()
    local direction = RotationToDirection(cameraRotation)
    local destination = 
    { 
        x = cameraCoord.x + direction.x * distance, 
        y = cameraCoord.y + direction.y * distance, 
        z = cameraCoord.z + direction.z * distance 
    }
    local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
    return b, c, e
end

local debugMode = false
RegisterCommand('debugprop', function()
    debugMode = not debugMode
    lib.notify({
        title = 'Debug Prop', 
        description = debugMode and 'Activado. Apunta con la cámara a un prop y presiona [E].' or 'Desactivado.',
        type = debugMode and 'success' or 'error',
        duration = 5000
    })
    
    if debugMode then
        CreateThread(function()
            while debugMode do
                local hit, coords, entity = RayCastGamePlayCamera(15.0)
                if hit == 1 and entity ~= 0 and DoesEntityExist(entity) and GetEntityType(entity) == 3 then
                    local model = GetEntityModel(entity)
                    -- Dibujar marcador rojo donde choca el láser
                    DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.1, 255, 0, 0, 150, false, false, 2, false, nil, nil, false)
                    
                    -- Texto en pantalla
                    lib.showTextUI('[E] - Copiar Hash: ' .. model)
                    
                    if IsControlJustPressed(0, 38) then -- Tecla E
                        print("====================================")
                        print("PROP HASH ENCONTRADO: " .. model)
                        print("====================================")
                        lib.notify({
                            title = 'Hash Copiado a Consola', 
                            description = 'Hash: ' .. model .. '\nAbre la consola (F8) para verlo y copiarlo.',
                            type = 'info',
                            duration = 8000
                        })
                    end
                else
                    lib.hideTextUI()
                end
                Wait(0)
            end
            lib.hideTextUI()
        end)
    end
end)
