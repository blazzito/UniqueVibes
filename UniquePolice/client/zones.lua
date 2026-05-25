local ESX = exports['es_extended']:getSharedObject()
local activePoints = {}
local currentUiPoint = nil -- 🔒 Candado lógico para evitar que las alertas parpadeen
local isEncarcelado = false

-- =========================================
-- FUNCIÓN PRINCIPAL: RECARGAR MARCADORES
-- =========================================
function RefreshStationPoints()
    -- Limpiamos puntos viejos en memoria
    for i = 1, #activePoints do
        activePoints[i]:remove()
    end
    activePoints = {}
    
    -- Si cambiamos de zona o reiniciamos, borramos la UI por seguridad
    if currentUiPoint then
        lib.hideTextUI()
        currentUiPoint = nil
    end

    -- Recorremos todas las comisarías sincronizadas
    for stationId, stationData in pairs(Stations) do
        for pointType, coords in pairs(stationData.points) do
            
            -- Ocultamos las cárceles (Esos puntos no deben tener flecha ni interacción directa)
            if pointType ~= 'jail_cell' and pointType ~= 'jail_release' then
                
                -- Jalamos la configuración visual desde el config.lua
                local settings = Config.PointSettings[pointType]
                
                if settings then
                    local point = lib.points.new({
                        coords = vec3(coords.x, coords.y, coords.z),
                        distance = Config.MarkerDrawDistance,
                        stationId = stationId,
                        pointType = pointType,
                        settings = settings 
                    })

                    -- Se ejecuta mientras estemos en el rango de visión (15 metros)
                    function point:nearby()
                        local hasJob = false
                        local playerJob = ESX.GetPlayerData().job

                        -- El lector de huellas lo puede usar cualquiera, el resto solo policías
                        if self.pointType == 'identity' then
                            hasJob = true
                        else
                            if playerJob then
                                for i = 1, #Config.PoliceJobs do
                                    if playerJob.name == Config.PoliceJobs[i] then
                                        hasJob = true
                                        break
                                    end
                                end
                            end
                        end

                        if hasJob then
                            local s = self.settings 
                            local size = Config.MarkerSize
                            
                            -- Dibujamos la flecha de color unificada (ID: 20)
                            DrawMarker(s.markerId, self.coords.x, self.coords.y, self.coords.z + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, size.x, size.y, size.z, s.color.r, s.color.g, s.color.b, s.color.a, true, true, 2, false, nil, nil, false)

                            -- Lógica para interactuar (Rango de 2 metros)
                            if self.currentDistance < Config.InteractDistance then
                                -- Evitamos conflictos: Solo abrimos la UI si este punto fue el que la reclamó
                                if currentUiPoint ~= self.id then
                                    -- Creamos el texto dinámico usando el emoji nativo del config
                                    local dynamicText = Config.Text.InteractPrefix .. s.emoji .. " " .. s.label
                                    
                                    -- Mostramos la notificación limpia anclada en el centro-izquierda
                                    lib.showTextUI(dynamicText, { position = "left-center" })
                                    currentUiPoint = self.id
                                end

                                -- Capturamos la tecla E
                                if IsControlJustReleased(0, 38) then
                                    TriggerPointInteraction(self.stationId, self.pointType)
                                end
                            else
                                -- Si nos alejamos del rango de interacción, apagamos la UI de forma segura
                                if currentUiPoint == self.id then
                                    lib.hideTextUI()
                                    currentUiPoint = nil
                                end
                            end
                        end
                    end

                    -- Si salimos por completo del rango de renderizado (15 metros)
                    function point:onExit()
                        if currentUiPoint == self.id then
                            lib.hideTextUI()
                            currentUiPoint = nil
                        end
                    end

                    table.insert(activePoints, point)
                end
            end
        end
    end
end

-- =========================================
-- DISPARADORES DE INTERACCIÓN
-- =========================================
function TriggerPointInteraction(stationId, pointType)
    if pointType == 'armory' then
        -- Abre la tienda física conectada con ox_inventory
        exports.ox_inventory:openInventory('shop', { type = 'uniquepolice_armory_' .. stationId, id = 1 })
        
    elseif pointType == 'garage' then
        local ped = PlayerPedId()
        
        -- Si está montado en un coche, lo guarda
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteVehicle(vehicle)
                lib.notify({ title = 'Garaje', description = 'Vehículo oficial guardado correctamente.', type = 'success' })
            else
                lib.notify({ title = 'Error', description = 'Debes estar en el asiento del conductor para guardar.', type = 'error' })
            end
        else
            -- Si está a pie, abre el menú para sacar coche
            OpenPoliceGarageMenu(stationId)
        end
        
    elseif pointType == 'stash_personal' then
        -- Abre el casillero ligado a la licencia única del jugador
        local stashId = lib.callback.await('uniquepolice:server:openPersonalStash', false)
        if stashId then exports.ox_inventory:openInventory('stash', stashId) end
        
    elseif pointType == 'stash_shared' then
        -- Abre el baúl compartido de esta comisaría específica
        exports.ox_inventory:openInventory('stash', 'policeshared_' .. stationId)
        
    elseif pointType == 'identity' then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        
        lib.notify({ title = 'Lector Biométrico', description = 'Colocando dedo pulgar en el escáner...', type = 'inform' })
        
        -- Animación de interactuar
        TaskStartScenarioInPlace(ped, "PROP_HUMAN_ATM", 0, true)
        Citizen.Wait(3500)
        ClearPedTasks(ped)
        
        -- Pide los datos limpios al servidor (Nombre y Cédula)
        local firstName, lastName, citizenId = lib.callback.await('uniquepolice:server:getCharacterName', false)
        
        local meTexto = " -> El individuo coloca su dedo pulgar sobre el lector óptico de huellas."
        local doTexto = " -> [SISTEMA]: Huella dactilar procesada con éxito. Ciudadano: " .. firstName .. " " .. lastName .. " | CC/ID: " .. citizenId
        
        -- Envía el entorno al chat de los jugadores en un rango de 10 metros
        TriggerServerEvent('uniquepolice:server:sendIdentityProximityMsg', coords, meTexto, doTexto)
    end
end

-- =========================================
-- MENÚ Y SPAWN DE VEHÍCULOS
-- =========================================
function OpenPoliceGarageMenu(stationId)
    local options = {}
    
    for i = 1, #Config.GarageVehicles do
        local veh = Config.GarageVehicles[i]
        table.insert(options, {
            title = veh.label,
            description = 'Spawnear modelo: ' .. veh.model,
            icon = 'car-side',
            onSelect = function() SpawnPoliceVehicle(veh.model, stationId) end
        })
    end
    
    lib.registerContext({ id = 'up_garage_menu', title = 'Garaje Oficial: ' .. string.upper(stationId), options = options })
    lib.showContext('up_garage_menu')
end

function SpawnPoliceVehicle(modelName, stationId)
    local hash = GetHashKey(modelName)
    if not IsModelInCdimage(hash) or not IsModelAVehicle(hash) then
        lib.notify({ title = 'Error', description = 'El modelo no existe en el servidor.', type = 'error' })
        return
    end
    
    RequestModel(hash)
    while not HasModelLoaded(hash) do Citizen.Wait(10) end
    
    local coords = Stations[stationId].points['garage']
    local vehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, coords.h, true, false)
    
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(vehicle), true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    
    local plate = "LSPD" .. tostring(math.random(100, 999))
    SetVehicleNumberPlateText(vehicle, plate)
    
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    lib.notify({ title = 'Garaje', description = 'Vehículo retirado: ' .. modelName, type = 'success' })
    SetModelAsNoLongerNeeded(hash)
end

-- =========================================
-- EVENTOS DE CÁRCEL PERSISTENTE
-- =========================================
RegisterNetEvent('uniquepolice:client:sendToJail', function(stationId, time)
    local cell = Stations[stationId].points['jail_cell']
    if not cell then return end
    
    local ped = PlayerPedId()
    isEncarcelado = true
    
    SetEntityCoords(ped, cell.x, cell.y, cell.z, false, false, false, true)
    SetEntityHeading(ped, cell.h or 0.0)
    
    lib.notify({ title = 'Arrestado', description = 'Has sido encerrado por un oficial. Tiempo: '..time..' Meses.', type = 'error', duration = 10000 })
    
    -- Hilo de control de escape (Anti noclip / Anti Teletransportación)
    Citizen.CreateThread(function()
        while isEncarcelado do
            Citizen.Wait(1000)
            if not isEncarcelado then break end
            
            local pCoords = GetEntityCoords(PlayerPedId())
            local dist = #(pCoords - vec3(cell.x, cell.y, cell.z))
            
            if dist > 10.0 and isEncarcelado then
                SetEntityCoords(PlayerPedId(), cell.x, cell.y, cell.z, false, false, false, true)
                lib.notify({ title = 'Sistema', description = 'No puedes escapar de la celda.', type = 'error' })
            end
        end
    end)
end)

RegisterNetEvent('uniquepolice:client:releaseFromJail', function(stationId)
    -- Matamos el hilo anti-escape primero para que no nos jale de vuelta
    isEncarcelado = false 
    Citizen.Wait(200) -- Pausa milimétrica para romper el bucle clean
    
    local releasePoint = Stations[stationId].points['jail_release']
    local ped = PlayerPedId()
    
    if releasePoint then
        SetEntityCoords(ped, releasePoint.x, releasePoint.y, releasePoint.z, false, false, false, true)
        SetEntityHeading(ped, releasePoint.h or 0.0)
        lib.notify({ title = 'Libertad', description = 'Has cumplido tu condena. Eres libre de irte.', type = 'success', duration = 7000 })
    else
        lib.notify({ title = 'Libre', description = 'Has cumplido tu condena, pero no hay un punto de salida configurado.', type = 'success' })
    end
end)

-- Sincronización al cambiar de trabajo
RegisterNetEvent('esx:setJob', function(job)
    Citizen.Wait(500)
    RefreshStationPoints()
end)