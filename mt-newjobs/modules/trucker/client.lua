local TruckerJob = Job:new(TruckerConfig.JobName)
local currentVehicle = nil
local currentTrailer = nil
local isJobActive = false
local currentRoute = nil
local deliveryBlip = nil
local workStartTime = nil
local playerStats = {}
local currentTruckModel = nil
local hasDelivered = false -- Bandera para saber si se entregó la carga
local lastTrailerNotify = 0
local trailerBlip = nil
local currentTrailerModel = nil

function TruckerJob:init()
    self.config = TruckerConfig
    self:CreateBlip()
    self:CreateNPC()
    self:start()
end

function TruckerJob:CreateBlip()
    local blipCfg = self.config.Blip
    local blip = AddBlipForCoord(blipCfg.Coords)
    SetBlipSprite(blip, blipCfg.Sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, blipCfg.Scale)
    SetBlipColour(blip, blipCfg.Color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipCfg.Label)
    EndTextCommandSetBlipName(blip)
end

function TruckerJob:CreateNPC()
    local npcCfg = self.config.NPC
    lib.requestModel(npcCfg.Model)
    local npcPed = CreatePed(4, GetHashKey(npcCfg.Model), npcCfg.Coords.x, npcCfg.Coords.y, npcCfg.Coords.z - 1.0, npcCfg.Coords.w, false, true)
    FreezeEntityPosition(npcPed, true)
    SetEntityInvincible(npcPed, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
end

function TruckerJob:start()
    Job.start(self)
    local interactionCoords = vec3(self.config.NPC.Coords.x, self.config.NPC.Coords.y, self.config.NPC.Coords.z)
    
    self.startPoint = lib.points.new({
        coords = interactionCoords,
        distance = 10.0,
    })

    function self.startPoint:nearby()
        if self.currentDistance < 2.0 then
            if not isJobActive then
                MTDrawText3D('trucker_start', 'Central de Camioneros', interactionCoords, 'E')
                if IsControlJustPressed(0, 38) then
                    TruckerJob:OpenMenu()
                end
            else
                MTHideText3D('trucker_start')
            end
        end
    end

    function self.startPoint:onExit()
        MTHideText3D('trucker_start')
    end
end

function TruckerJob:OpenMenu()
    lib.callback('mt-trucker:getStats', false, function(stats)
        if stats then
            playerStats = stats
        end
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'showMenu',
            jobType = 'trucker',
            stats = playerStats
        })
    end)
end

function TruckerJob:RequestStart(data)
    local spawnIndex = lib.callback.await('mt-trucker:startJob', false)
    if spawnIndex then
        self:StartShift(data, spawnIndex)
    end
end

function TruckerJob:StartShift(data, spawnIndex)
    local level = playerStats.level or 1

    local allowedTrucks = {}
    for _, t in ipairs(self.config.Trucks) do
        if level >= (t.minLevel or 1) then table.insert(allowedTrucks, t.model) end
    end
    local truckModel = data.truck or (#allowedTrucks > 0 and allowedTrucks[math.random(1, #allowedTrucks)] or 'phantom')

    local allowedTrailers = {}
    for _, t in ipairs(self.config.Trailers) do
        if level >= (t.minLevel or 1) then table.insert(allowedTrailers, t.model) end
    end
    local trailerModel = data.trailer or (#allowedTrailers > 0 and allowedTrailers[math.random(1, #allowedTrailers)] or 'trailers')

    local allowedRoutes = {}
    for idx, r in ipairs(self.config.Routes) do
        if level >= (r.minLevel or 1) then table.insert(allowedRoutes, idx) end
    end
    local routeIndex = (data.route ~= nil) and (data.route + 1) or (#allowedRoutes > 0 and allowedRoutes[math.random(1, #allowedRoutes)] or 1)

    currentTruckModel = truckModel
    currentTrailerModel = trailerModel

    local vehicleSpawns = self.config.Locations.VehicleSpawn
    local trailerSpawns = self.config.Locations.TrailerSpawn
    local vehSpawn = vehicleSpawns[spawnIndex]
    local trlSpawn = trailerSpawns[spawnIndex]

    -- Verificar si los puntos de spawn están libres
    local vehicleInArea = GetClosestVehicle(vehSpawn.x, vehSpawn.y, vehSpawn.z, 3.0, 0, 71)
    if vehicleInArea ~= 0 and DoesEntityExist(vehicleInArea) then
        lib.notify({
            title = 'Camioneros',
            description = 'Hay un vehículo obstruyendo la zona de spawn del camión',
            type = 'error',
            duration = 5000
        })
        TriggerServerEvent('mt-trucker:cancelJob', false)
        return
    end
    
    local trailerInArea = GetClosestVehicle(trlSpawn.x, trlSpawn.y, trlSpawn.z, 3.0, 0, 71)
    if trailerInArea ~= 0 and DoesEntityExist(trailerInArea) then
        lib.notify({
            title = 'Camioneros',
            description = 'Hay un vehículo obstruyendo la zona de spawn del remolque',
            type = 'error',
            duration = 5000
        })
        TriggerServerEvent('mt-trucker:cancelJob', false)
        return
    end

    -- Spawn Truck
    lib.requestModel(truckModel)
    currentVehicle = CreateVehicle(GetHashKey(truckModel), vehSpawn.x, vehSpawn.y, vehSpawn.z, vehSpawn.w, true, false)
    
    -- Spawn Trailer
    lib.requestModel(trailerModel)
    currentTrailer = CreateVehicle(GetHashKey(trailerModel), trlSpawn.x, trlSpawn.y, trlSpawn.z, trlSpawn.w, true, false)

    SetVehicleOnGroundProperly(currentVehicle)
    SetVehicleOnGroundProperly(currentTrailer)

    TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(currentVehicle))
    
    TaskWarpPedIntoVehicle(PlayerPedId(), currentVehicle, -1)
    
    isJobActive = true
    workStartTime = GetGameTimer()
    hasDelivered = false
    
    self:SelectRoute(routeIndex)
    self:ShowHUD()
    
    -- Mark the player's trailer with a blip so they know which one is theirs
    trailerBlip = AddBlipForEntity(currentTrailer)
    SetBlipSprite(trailerBlip, 479)
    SetBlipColour(trailerBlip, 2) -- Green
    SetBlipScale(trailerBlip, 0.8)
    SetBlipDisplay(trailerBlip, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Tu Remolque")
    EndTextCommandSetBlipName(trailerBlip)

    -- Thread to show marker above trailer and remove blip when hooked
    CreateThread(function()
        while currentTrailer and DoesEntityExist(currentTrailer) and trailerBlip do

            -- Check if trailer got hooked to our truck
            if currentVehicle and DoesEntityExist(currentVehicle) then
                local hasTrailer, trailerHandle = GetVehicleTrailerVehicle(currentVehicle)
                if hasTrailer and trailerHandle == currentTrailer then
                    if trailerBlip then RemoveBlip(trailerBlip); trailerBlip = nil end
                    lib.notify({
                        title = 'Camioneros',
                        description = 'Remolque enganchado. Dirígete al destino.',
                        type = 'success'
                    })
                    break
                end
            end
            Wait(0)
        end
    end)

    lib.notify({
        title = 'Camioneros',
        description = 'Engancha el remolque marcado y dirígete al destino',
        type = 'info'
    })
end

function TruckerJob:SelectRoute(routeIndex)
    currentRoute = self.config.Routes[routeIndex]
    if not currentRoute then
        -- Fallback if invalid route
        currentRoute = self.config.Routes[1]
        routeIndex = 1
    end
    currentRoute.index = routeIndex

    if deliveryBlip then RemoveBlip(deliveryBlip) end
    deliveryBlip = AddBlipForCoord(currentRoute.targetCoords)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipColour(deliveryBlip, 4) -- Blanca
    SetBlipRoute(deliveryBlip, true)
    SetBlipRouteColour(deliveryBlip, 4)
    
    self.deliveryPoint = lib.points.new({
        coords = currentRoute.targetCoords,
        distance = 20.0,
    })

    function self.deliveryPoint:nearby()
        DrawMarker(22, currentRoute.targetCoords.x, currentRoute.targetCoords.y, currentRoute.targetCoords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 0, 0, 100, false, true, 2, false, nil, nil, false)
        
        if self.currentDistance < 10.0 then
            local hasTrailer, trailerHandle = GetVehicleTrailerVehicle(currentVehicle)
            if hasTrailer and trailerHandle == currentTrailer then
                MTDrawText3D('trucker_delivery', 'Entregar carga', currentRoute.targetCoords, 'E')
                if IsControlJustPressed(0, 38) then
                    TruckerJob:CompleteRoute()
                end
            else
                MTHideText3D('trucker_delivery')
                local now = GetGameTimer()
                if not hasDelivered and now - lastTrailerNotify > 5000 then
                    lastTrailerNotify = now
                    lib.notify({
                        title = 'Camioneros',
                        description = '¡Necesitas tener el remolque enganchado!',
                        type = 'error'
                    })
                end
            end
        end
    end
    
    function self.deliveryPoint:onExit()
        MTHideText3D('trucker_delivery')
    end
end

function TruckerJob:CompleteRoute()
    MTHideText3D('trucker_delivery')
    local success = lib.progressBar({
        duration = 5000,
        label = 'Descargando remolque...',
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true }
    })

    if success then
        hasDelivered = true
        -- Ya no se envía el evento aquí
        
        -- Borrar remolque
        if currentTrailer and DoesEntityExist(currentTrailer) then
            DeleteEntity(currentTrailer)
            currentTrailer = nil
        end

        -- Limpiar punto de entrega actual
        if deliveryBlip then RemoveBlip(deliveryBlip); deliveryBlip = nil end
        if self.deliveryPoint then self.deliveryPoint:remove(); self.deliveryPoint = nil end

        -- Establecer ruta de regreso
        self:SetReturnRoute()
        
        lib.notify({
            title = 'Camioneros',
            description = 'Carga entregada. Regresa a la central para devolver el camión.',
            type = 'success'
        })
    end
end

function TruckerJob:SetReturnRoute()
    local returnCoords = self.config.Locations.VehicleReturn or vec3(self.config.NPC.Coords.x, self.config.NPC.Coords.y, self.config.NPC.Coords.z)
    
    deliveryBlip = AddBlipForCoord(returnCoords)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipColour(deliveryBlip, 4) -- Blanca
    SetBlipRoute(deliveryBlip, true)
    SetBlipRouteColour(deliveryBlip, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Devolver Camión")
    EndTextCommandSetBlipName(deliveryBlip)

    self.returnPoint = lib.points.new({
        coords = returnCoords,
        distance = 20.0,
    })

    function self.returnPoint:nearby()
        DrawMarker(22, returnCoords.x, returnCoords.y, returnCoords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 0, 0, 100, false, true, 2, false, nil, nil, false)
        
        if self.currentDistance < 8.0 then
            MTDrawText3D('trucker_return', 'Devolver Camión', returnCoords, 'E')
            if IsControlJustPressed(0, 38) then
                TruckerJob:ReturnVehicle()
            end
        else
            MTHideText3D('trucker_return')
        end
    end

    function self.returnPoint:onExit()
        MTHideText3D('trucker_return')
    end
end

function TruckerJob:ReturnVehicle()
    MTHideText3D('trucker_return')
    if self.returnPoint then self.returnPoint:remove(); self.returnPoint = nil end
    if deliveryBlip then RemoveBlip(deliveryBlip); deliveryBlip = nil end
    if currentVehicle and DoesEntityExist(currentVehicle) then
        local ped = PlayerPedId()
        TaskLeaveVehicle(ped, currentVehicle, 0)
        Wait(2000)
        
        if hasDelivered then
            local workTime = math.floor((GetGameTimer() - workStartTime) / 60000)
            TriggerServerEvent('mt-trucker:completeDelivery', currentRoute.index, workTime, currentTruckModel, currentTrailerModel)
        else
            TriggerServerEvent('mt-trucker:cancelJob', true)
        end
    end
    self:FinishJob()
end

function TruckerJob:FinishJob()
    isJobActive = false
    if deliveryBlip then RemoveBlip(deliveryBlip); deliveryBlip = nil end
    if trailerBlip then RemoveBlip(trailerBlip); trailerBlip = nil end
    if self.deliveryPoint then self.deliveryPoint:remove(); self.deliveryPoint = nil end
    if self.returnPoint then self.returnPoint:remove(); self.returnPoint = nil end
    
    if currentVehicle and DoesEntityExist(currentVehicle) then DeleteEntity(currentVehicle); currentVehicle = nil end
    if currentTrailer and DoesEntityExist(currentTrailer) then DeleteEntity(currentTrailer); currentTrailer = nil end

    MTHideText3D('trucker_start')
    MTHideText3D('trucker_delivery')
    MTHideText3D('trucker_return')
    
    currentTruckModel = nil
    hasDelivered = false
    self:HideHUD()
    
    lib.notify({
        title = 'Camioneros',
        description = 'Turno finalizado con éxito',
        type = 'info'
    })
end

function TruckerJob:ShowHUD()
    SendNUIMessage({
        action = 'showHud',
        jobType = 'trucker',
        level = playerStats.level or 1,
        bonusPercent = playerStats.bonusPercent or 0
    })
    
    CreateThread(function()
        while isJobActive do
            SendNUIMessage({
                action = 'updateHud',
                items = 1,
                itemLabel = 'Carga',
                earnings = 0 -- Se calcula al final
            })
            Wait(2000)
        end
    end)
end

function TruckerJob:HideHUD()
    SendNUIMessage({ action = 'hideHud' })
end

-- NUI callbacks centralizados en client/core.lua

RegisterJobModule(TruckerConfig.JobName, TruckerJob)

