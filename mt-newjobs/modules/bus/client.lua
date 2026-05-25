local BusJob = Job:new(BusConfig.JobName)
local currentVehicle = nil
local totalPassengers = 0
local currentPassengers = 0
local npcPed = nil
local activeStops = {}
local currentStopIndex = 1
local routeBlip = nil

local pedsInBus = {}
local pedsWaitingAtStop = {}
local workStartTime = nil
local stopsCount = 0
local returnBlip = nil
local visitedStops = {}

-- Stats del jugador (se cargan desde el servidor)
local playerStats = {
    lastSession = 0,
    totalPassengers = 0,
    totalTime = 0,
    level = 1,
    shiftsCompleted = 0,
    totalEarned = 0,
    avgPerShift = 0,
    bestShift = 0
}

function BusJob:init()
    self.config = BusConfig
    self:CreateBlip()
    self:CreateNPC()
    self:start()
end

function BusJob:CreateBlip()
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

function BusJob:CreateNPC()
    local npcCfg = self.config.NPC
    
    lib.requestModel(npcCfg.Model)
    
    npcPed = CreatePed(4, GetHashKey(npcCfg.Model), npcCfg.Coords.x, npcCfg.Coords.y, npcCfg.Coords.z - 1.0, npcCfg.Coords.w, false, true)
    
    FreezeEntityPosition(npcPed, true)
    SetEntityInvincible(npcPed, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    SetPedDiesWhenInjured(npcPed, false)
    SetPedCanPlayAmbientAnims(npcPed, true)
    SetPedCanRagdollFromPlayerImpact(npcPed, false)
    SetEntityCanBeDamaged(npcPed, false)
end

function BusJob:OpenMenu()
    -- Verificar en el servidor si el menú está disponible
    lib.callback('mt-bus:openMenu', false, function(canOpen)
        if not canOpen then
            lib.notify({
                title = 'Conductor de Bus',
                description = 'Otro trabajador está usando el panel. Espera un momento.',
                type = 'error'
            })
            return
        end
        
        -- Cargar estadísticas desde el servidor
        lib.callback('mt-bus:getStats', false, function(stats)
            if stats then
                playerStats = stats
            end
            
            -- Mostrar el menú NUI
            SetNuiFocus(true, true)
            playerStats.hasActiveShift = (currentVehicle ~= nil)
            SendNUIMessage({
                action = 'showMenu',
                jobType = 'bus',
                stats = playerStats
            })
        end)
    end)
end

function BusJob:start()
    Job.start(self)
    
    local interactionCoords = vec3(self.config.NPC.Coords.x, self.config.NPC.Coords.y, self.config.NPC.Coords.z)
    
    self.startPoint = lib.points.new({
        coords = interactionCoords,
        distance = 10.0,
    })

    function self.startPoint:onEnter()
        MTDrawText3D('bus_start', 'Conductor de Bus', interactionCoords, 'E')
    end

    function self.startPoint:onExit()
        MTHideText3D('bus_start')
    end

    function self.startPoint:nearby()
        if self.currentDistance < 2.0 then
            if IsControlJustPressed(0, 38) then
                BusJob:OpenMenu()
            end
        end
    end
end

function BusJob:RequestStart()
    -- Verificar si el jugador tiene un trabajo de emergencia
    local playerData = ESX.GetPlayerData()
    local restrictedJobs = {'ambulance', 'police', 'sheriff', 'sapd'}
    
    if playerData and playerData.job then
        for _, job in ipairs(restrictedJobs) do
            if playerData.job.name == job then
                lib.notify({
                    title = 'Conductor de Bus',
                    description = 'No puedes realizar este trabajo siendo personal de emergencias',
                    type = 'error'
                })
                return
            end
        end
    end
    
    if currentVehicle and DoesEntityExist(currentVehicle) then
        lib.notify({
            title = 'Conductor de Bus',
            description = 'Ya tienes un vehículo activo',
            type = 'error'
        })
        return
    end
    
    -- Verificar si el spawn está libre antes de iniciar (server-side)
    lib.callback('mt-bus:checkSpawnFree', false, function(isFree)
        if not isFree then
            lib.notify({
                title = 'Conductor de Bus',
                description = 'Hay un vehículo en el punto de spawn. Espera a que se libere.',
                type = 'error',
                duration = 5000
            })
            return
        end
        
        -- Si el spawn está libre, intentar iniciar el trabajo
        local success = lib.callback.await('mt-bus:startJob', false)
        if success then
            self:SpawnVehicle()
        end
    end)
end

function BusJob:SpawnVehicle()
    local spawnCoords = self.config.Locations.VehicleSpawn
    
    local vehicleInArea = GetClosestVehicle(spawnCoords.x, spawnCoords.y, spawnCoords.z, 8.0, 0, 71)
    if vehicleInArea ~= 0 and DoesEntityExist(vehicleInArea) then
        lib.notify({
            title = 'Conductor de Bus',
            description = 'Hay un vehículo obstruyendo la zona de spawn',
            type = 'error'
        })
        TriggerServerEvent('mt-bus:cancelJob')
        return
    end
    
    lib.requestModel(self.config.Locations.VehicleModel)
    
    if currentVehicle then DeleteEntity(currentVehicle) end

    currentVehicle = CreateVehicle(
        GetHashKey(self.config.Locations.VehicleModel),
        spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w,
        true, false
    )
    
    SetVehicleEngineOn(currentVehicle, true, true, false)
    SetVehicleOnGroundProperly(currentVehicle)
    TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(currentVehicle))
    
    MTJobsFadeOut(800)
    
    TaskWarpPedIntoVehicle(PlayerPedId(), currentVehicle, -1)
    
    Wait(500)
    MTJobsFadeIn(800)
    
    totalPassengers = 0
    currentPassengers = 0
    stopsCount = 0
    visitedStops = {}
    if returnBlip then RemoveBlip(returnBlip) returnBlip = nil end
    repeat
        currentStopIndex = math.random(1, #self.config.RouteStops)
    until currentStopIndex ~= 7 and currentStopIndex ~= 8
    visitedStops[currentStopIndex] = true
    workStartTime = GetGameTimer()
    
    self:CreateNextStop()
    self:CreateReturnPoint()
    self:ShowHUD()
    
    self:ApplyUniform()
    
    lib.notify({
        title = 'Conductor de Bus',
        description = 'Dirígete a la primera parada marcada en el GPS',
        type = 'success'
    })
end

-- Mostrar HUD durante el trabajo
function BusJob:ShowHUD()
    SendNUIMessage({
        action = 'showHud',
        jobType = 'bus',
        level = playerStats.level or 1,
        bonusPercent = playerStats.bonusPercent or 0
    })
    
    -- Thread para actualizar el HUD
    CreateThread(function()
        while currentVehicle and DoesEntityExist(currentVehicle) do
            local earnings = totalPassengers * (BusConfig.Payment.PerPassenger or 35)
            
            SendNUIMessage({
                action = 'updateHud',
                items = totalPassengers,
                earnings = earnings,
                progress = 0
            })
            
            Wait(1000)
        end
    end)
end

function BusJob:HideHUD()
    SendNUIMessage({
        action = 'hideHud'
    })
end

function BusJob:ApplyUniform()
    local playerPed = PlayerPedId()
    local gender = GetEntityModel(playerPed) == `mp_m_freemode_01` and 'male' or 'female'
    local uniform = self.config.Uniform[gender]
    
    if not uniform then return end

    if uniform.drawables then
        for k, v in pairs(uniform.drawables) do
            SetPedComponentVariation(playerPed, tonumber(k), v.index, v.texture, 0)
        end
    end
    
    if uniform.props then
        for k, v in pairs(uniform.props) do
            SetPedPropIndex(playerPed, tonumber(k), v.index, v.texture, true)
        end
    end
end

function BusJob:RestoreUniform()
    MTJobsFadeOut(200)
    
    Wait(100)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    Wait(100)
    
    MTJobsFadeIn(100)
end

function BusJob:CreateNextStop()
    if routeBlip then
        RemoveBlip(routeBlip)
        routeBlip = nil
    end
    
    if activeStops.point then
        activeStops.point:remove()
        activeStops = {}
    end
    
    if currentStopIndex > #self.config.RouteStops then
        currentStopIndex = 1
    end
    
    local stopData = self.config.RouteStops[currentStopIndex]
    
    self:SpawnPedsAtStop(stopData)
    
    routeBlip = AddBlipForCoord(stopData.coords.x, stopData.coords.y, stopData.coords.z)
    SetBlipSprite(routeBlip, 1)
    SetBlipScale(routeBlip, 0.8)
    SetBlipColour(routeBlip, 4)
    SetBlipRoute(routeBlip, true)
    SetBlipRouteColour(routeBlip, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(stopData.label)
    EndTextCommandSetBlipName(routeBlip)
    
    -- Establecer waypoint del jugador para garantizar que salga la ruta en el mapa
    SetNewWaypoint(stopData.coords.x, stopData.coords.y)
    
    local point = lib.points.new({
        coords = stopData.coords,
        distance = 15.0,
    })

    function point:onEnter()
        MTDrawText3D('bus_stop', 'Parada de pasajeros', stopData.coords, 'E')
    end

    function point:onExit()
        MTHideText3D('bus_stop')
    end

    function point:nearby()
        -- DrawMarker(1, stopData.coords.x, stopData.coords.y, stopData.coords.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 255, 0, 100, false, true, 2, false, nil, nil, false)
        
        if IsControlJustPressed(0, 38) then
            BusJob:HandleStop()
        end
    end
    
    activeStops = { point = point }
end

function BusJob:HandleStop()
    MTHideText3D('bus_stop')

    local passengersLeaving = 0
    if currentPassengers > 0 then
        passengersLeaving = math.random(1, math.min(currentPassengers, 3))
    end

    if passengersLeaving > 0 then
        self:RemovePedsFromBus(passengersLeaving)
        currentPassengers = currentPassengers - passengersLeaving
    end

    local passengersBoarding = #pedsWaitingAtStop
    if passengersBoarding > 0 then
        self:BoardPedsIntoBus()
        currentPassengers = currentPassengers + passengersBoarding
        totalPassengers = totalPassengers + passengersBoarding
    end

    local success = lib.progressBar({
        duration = 3000,
        label = 'Abriendo puertas y esperando pasajeros...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
    })

    if not success then return end

    local message = ''
    if passengersLeaving > 0 and passengersBoarding > 0 then
        message = passengersLeaving .. ' pasajero(s) bajaron. ' .. passengersBoarding .. ' pasajero(s) subieron.'
    elseif passengersLeaving > 0 then
        message = passengersLeaving .. ' pasajero(s) bajaron.'
    elseif passengersBoarding > 0 then
        message = passengersBoarding .. ' pasajero(s) subieron al bus.'
    else
        message = 'No hubo movimiento de pasajeros.'
    end

    lib.notify({
        title = 'Parada',
        description = message .. '\nPasajeros a bordo: ' .. currentPassengers,
        type = 'info'
    })

    stopsCount = stopsCount + 1

    if stopsCount >= 10 then
        if routeBlip then
            RemoveBlip(routeBlip)
            routeBlip = nil
        end
        if activeStops.point then
            activeStops.point:remove()
            activeStops = {}
        end

        local returnCoords = self.config.Locations.VehicleReturn
        returnBlip = AddBlipForCoord(returnCoords.x, returnCoords.y, returnCoords.z)
        SetBlipSprite(returnBlip, 1)
        SetBlipColour(returnBlip, 4)
        SetBlipRoute(returnBlip, true)
        SetBlipRouteColour(returnBlip, 4)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Devolver Autobús")
        EndTextCommandSetBlipName(returnBlip)

        lib.notify({
            title = 'Ruta Finalizada',
            description = 'Has completado las 10 paradas. Vuelve a la central para finalizar el turno.',
            type = 'success'
        })
        return
    end

    local nextStop
    if currentStopIndex == 6 then
        nextStop = 7
    elseif currentStopIndex == 7 then
        nextStop = 8
    else
        -- Filtramos las paradas disponibles (que no hayamos visitado y que no sean 7 u 8)
        local availableStops = {}
        for i = 1, #self.config.RouteStops do
            if not visitedStops[i] and i ~= 7 and i ~= 8 then
                table.insert(availableStops, i)
            end
        end

        if #availableStops > 0 then
            nextStop = availableStops[math.random(#availableStops)]
        else
            -- Si por algún motivo no quedan paradas válidas (no debería pasar), fallamos a algo seguro
            nextStop = math.random(1, #self.config.RouteStops)
        end
    end
    currentStopIndex = nextStop
    visitedStops[currentStopIndex] = true
    self:CreateNextStop()
end

function BusJob:SpawnPedsAtStop(stopData)
    for _, ped in pairs(pedsWaitingAtStop) do
        if DoesEntityExist(ped) then
            DeleteEntity(ped)
        end
    end
    pedsWaitingAtStop = {}
    
    if not stopData.pedSpawns then return end
    
    local pedModels = self.config.PedModels
    local passengersToSpawn = math.random(self.config.PassengerRange.Min, self.config.PassengerRange.Max)
    
    for i = 1, math.min(passengersToSpawn, #stopData.pedSpawns) do
        local spawnPos = stopData.pedSpawns[i]
        local randomModel = pedModels[math.random(#pedModels)]
        lib.requestModel(randomModel)
        
        local ped = CreatePed(4, GetHashKey(randomModel), 
            spawnPos.x, 
            spawnPos.y, 
            spawnPos.z, 
            spawnPos.w, 
            false, true)
        
        SetEntityAsMissionEntity(ped, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_MOBILE", 0, true)
        
        table.insert(pedsWaitingAtStop, ped)
    end
end

function BusJob:BoardPedsIntoBus()
    if not currentVehicle or not DoesEntityExist(currentVehicle) then return end
    
    local maxSeats = GetVehicleMaxNumberOfPassengers(currentVehicle)
    local availableSeats = {}
    
    for i = 0, maxSeats - 1 do
        if IsVehicleSeatFree(currentVehicle, i) then
            table.insert(availableSeats, i)
        end
    end
    
    for i, ped in ipairs(pedsWaitingAtStop) do
        if DoesEntityExist(ped) and availableSeats[i] then
            CreateThread(function()
                Wait((i - 1) * 300)
                
                if DoesEntityExist(ped) and DoesEntityExist(currentVehicle) then
                    ClearPedTasksImmediately(ped)
                    SetBlockingOfNonTemporaryEvents(ped, true)
                    TaskEnterVehicle(ped, currentVehicle, -1, availableSeats[i], 1.0, 1, 0)
                end
            end)
            table.insert(pedsInBus, ped)
        else
            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
    end
    
    pedsWaitingAtStop = {}
end

function BusJob:RemovePedsFromBus(count)
    if count <= 0 or #pedsInBus == 0 then return end
    
    local toRemove = math.min(count, #pedsInBus)
    
    for i = 1, toRemove do
        local randomIndex = math.random(#pedsInBus)
        local ped = table.remove(pedsInBus, randomIndex)
        
        if DoesEntityExist(ped) then
            TaskLeaveVehicle(ped, currentVehicle, 0)
            
            CreateThread(function()
                Wait(3000)
                if DoesEntityExist(ped) then
                    DeleteEntity(ped)
                end
            end)
        end
    end
end

function BusJob:CreateReturnPoint()
    if self.returnPoint then
        self.returnPoint:remove()
    end
    
    local returnCoords = self.config.Locations.VehicleReturn
    
    self.returnPoint = lib.points.new({
        coords = returnCoords,
        distance = 20.0,
    })

    function self.returnPoint:onEnter()
        MTDrawText3D('bus_return', 'Finalizar turno', returnCoords, 'E')
    end

    function self.returnPoint:onExit()
        MTHideText3D('bus_return')
    end

    function self.returnPoint:nearby()
        DrawMarker(22, returnCoords.x, returnCoords.y, returnCoords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 0, 0, 100, false, true, 2, false, nil, nil, false)
        
        if IsControlJustPressed(0, 38) then
            BusJob:ReturnVehicle()
        end
    end
end

function BusJob:ReturnVehicle()
    MTHideText3D('bus_return')
    
    if currentVehicle and DoesEntityExist(currentVehicle) then
        local playerPed = PlayerPedId()
        local vehicleCoords = GetEntityCoords(currentVehicle)
        local returnCoords = self.config.Locations.VehicleReturn
        local distance = #(vehicleCoords - returnCoords)
        
        if distance > 15.0 then
            lib.notify({
                title = 'Error',
                description = 'Debes estar cerca del punto de devolución con el vehículo',
                type = 'error'
            })
            return
        end
        
        TaskLeaveVehicle(playerPed, currentVehicle, 0)
        Wait(2000)
        
        -- Calcular tiempo trabajado en minutos
        local timeWorked = 0
        if workStartTime then
            timeWorked = math.floor((GetGameTimer() - workStartTime) / 60000)
        end
        
        TriggerServerEvent('mt-bus:finishJob', totalPassengers, timeWorked)
        
        -- Eliminar el vehículo antes de restaurar la ropa
        if currentVehicle and DoesEntityExist(currentVehicle) then
            DeleteEntity(currentVehicle)
            currentVehicle = nil
        end
        
        self:HideHUD()
        self:RestoreUniform()
        
        for _, ped in pairs(pedsInBus) do
            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
        pedsInBus = {}
        
        for _, ped in pairs(pedsWaitingAtStop) do
            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
        pedsWaitingAtStop = {}
        
        if routeBlip then
            RemoveBlip(routeBlip)
            routeBlip = nil
        end
        
        if returnBlip then
            RemoveBlip(returnBlip)
            returnBlip = nil
        end
        
        if activeStops.point then
            activeStops.point:remove()
            activeStops = {}
        end
        
        totalPassengers = 0
        currentPassengers = 0
        currentStopIndex = 1
        stopsCount = 0
    end
end

function BusJob:stop()
    Job.stop(self)
    
    TriggerServerEvent('mt-bus:cancelJob')
    
    self:HideHUD()
    self:RestoreUniform()
    
    if currentVehicle and DoesEntityExist(currentVehicle) then
        DeleteEntity(currentVehicle)
        currentVehicle = nil
    end
    
    for _, ped in pairs(pedsInBus) do
        if DoesEntityExist(ped) then
            DeleteEntity(ped)
        end
    end
    pedsInBus = {}
    
    for _, ped in pairs(pedsWaitingAtStop) do
        if DoesEntityExist(ped) then
            DeleteEntity(ped)
        end
    end
    pedsWaitingAtStop = {}
    
    if routeBlip then
        RemoveBlip(routeBlip)
        routeBlip = nil
    end

    if returnBlip then
        RemoveBlip(returnBlip)
        returnBlip = nil
    end
    
    if activeStops.point then
        activeStops.point:remove()
        activeStops = {}
    end
    
    if self.returnPoint then
        self.returnPoint:remove()
        self.returnPoint = nil
    end
    
    totalPassengers = 0
    currentPassengers = 0
    
    -- Cancelar progressbar activa y limpiar estado del jugador
    if lib.progressActive and lib.progressActive() then lib.cancelProgress() end
    MTHideText3D('bus_start')
    MTHideText3D('bus_stop')
    MTHideText3D('bus_return')
    local playerPed = PlayerPedId()
    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(playerPed, false)
end

-- NUI callbacks centralizados en client/core.lua

RegisterJobModule(BusConfig.JobName, BusJob)

