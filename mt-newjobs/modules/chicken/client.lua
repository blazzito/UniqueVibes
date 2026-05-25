local ChickenJob = Job:new(ChickenConfig.JobName)
local currentVehicle = nil
local collectedChickens = 0
local totalChickensCaught = 0
local processedChickens = 0
local npcPed = nil
local deliveryNpcs = {}
local carryingChicken = false
local carriedProp = nil
local currentDeliveryPoint = nil
local processingPoints = {}
local processingProps = {}
local deliveryBlip = nil
local processingBlip = nil
local chickenRouteBlip = nil
local workStartTime = nil
local isJobActive = false
local totalDeliveredChickens = 0 -- Total de pollos entregados durante el turno

-- Pollos vivos (sincronizados desde el servidor)
local spawnedChickens = {}  -- { id = id, netId = netId, zoneIndex = i, alive = true }
local chickenZoneBlips = {}
local catchingChicken = false -- flag para evitar cazar dos a la vez

-- Stats del jugador (se cargan desde el servidor)
local playerStats = {
    lastSession = 0,
    totalItems = 0,
    totalTime = 0,
    level = 1,
    shiftsCompleted = 0,
    totalEarned = 0,
    avgPerShift = 0,
    bestShift = 0
}

function ChickenJob:init()
    self.config = ChickenConfig
    self:CreateBlip()
    self:CreateNPC()
    self:start()
end

function ChickenJob:CreateBlip()
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

function ChickenJob:CreateNPC()
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

function ChickenJob:start()
    Job.start(self)
    
    local interactionCoords = vec3(self.config.NPC.Coords.x, self.config.NPC.Coords.y, self.config.NPC.Coords.z)
    
    self.startPoint = lib.points.new({
        coords = interactionCoords,
        distance = 10.0,
    })

    function self.startPoint:onEnter()
        MTDrawText3D('chicken_start', 'Abrir panel de trabajo', interactionCoords, 'E')
    end

    function self.startPoint:onExit()
        MTHideText3D('chicken_start')
    end

    function self.startPoint:nearby()
        if self.currentDistance < 2.0 then
            if IsControlJustPressed(0, 38) then
                ChickenJob:OpenMenu()
            end
        end
    end
end

function ChickenJob:OpenMenu()
    -- Verificar en el servidor si el menú está disponible
    lib.callback('mt-chicken:openMenu', false, function(canOpen)
        if not canOpen then
            lib.notify({
                title = 'Granja Avícola',
                description = 'Otro trabajador está usando el panel. Espera un momento.',
                type = 'error'
            })
            return
        end
        
        -- Cargar estadísticas desde el servidor
        lib.callback('mt-chicken:getStats', false, function(stats)
            if stats then
                playerStats = stats
            end
            
            -- Mostrar el menú NUI
            SetNuiFocus(true, true)
            playerStats.hasActiveShift = isJobActive
            SendNUIMessage({
                action = 'showMenu',
                jobType = 'chicken',
                stats = playerStats
            })
        end)
    end)
end

function ChickenJob:RequestStart()
    -- Verificar si el jugador tiene un trabajo de emergencia
    local playerData = ESX.GetPlayerData()
    local restrictedJobs = {'ambulance', 'police', 'sheriff', 'sapd'}
    
    if playerData and playerData.job then
        for _, job in ipairs(restrictedJobs) do
            if playerData.job.name == job then
                lib.notify({
                    title = 'Granja Avícola',
                    description = 'No puedes realizar este trabajo siendo personal de emergencias',
                    type = 'error'
                })
                return
            end
        end
    end
    
    if currentVehicle and DoesEntityExist(currentVehicle) then
        lib.notify({
            title = 'Granja Avícola',
            description = 'Ya tienes un vehículo activo',
            type = 'error'
        })
        return
    end
    
    -- Verificar si el spawn está libre antes de iniciar (server-side)
    lib.callback('mt-chicken:checkSpawnFree', false, function(isFree)
        if not isFree then
            lib.notify({
                title = 'Granja Avícola',
                description = 'Hay un vehículo en el punto de spawn. Espera a que se libere.',
                type = 'error',
                duration = 5000
            })
            return
        end
        
        -- Si el spawn está libre, intentar iniciar el trabajo
        local success = lib.callback.await('mt-chicken:startJob', false)
        if success then
            self:SpawnVehicle()
        end
    end)
end

function ChickenJob:SpawnVehicle()
    local spawnCoords = self.config.Locations.VehicleSpawn
    
    local vehicleInArea = GetClosestVehicle(spawnCoords.x, spawnCoords.y, spawnCoords.z, 8.0, 0, 71)
    if vehicleInArea ~= 0 and DoesEntityExist(vehicleInArea) then
        lib.notify({
            title = 'Granja Avícola',
            description = 'Hay un vehículo obstruyendo la zona de spawn',
            type = 'error'
        })
        TriggerServerEvent('mt-chicken:cancelJob')
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
    
    collectedChickens = 0
    totalChickensCaught = 0
    processedChickens = 0
    spawnedChickens = {}
    workStartTime = GetGameTimer()
    isJobActive = true
    
    -- Mostrar HUD inmediatamente
    self:ShowHUD()
    
    self:SpawnChickenZones()
    self:StartChickenDetectionThread()
    self:CreateReturnPoint()
    self:CreateTruckDepositPoint()
    self:CreateProcessingPoint()
    
    self:ApplyUniform()
    
    -- Crear blip con ruta al corral
    local firstZone = self.config.ChickenZones[1]
    if firstZone then
        if chickenRouteBlip then RemoveBlip(chickenRouteBlip) end
        chickenRouteBlip = AddBlipForCoord(firstZone.center.x, firstZone.center.y, firstZone.center.z)
        SetBlipSprite(chickenRouteBlip, 1)
        SetBlipColour(chickenRouteBlip, 2)
        SetBlipRoute(chickenRouteBlip, true)
        SetBlipRouteColour(chickenRouteBlip, 2)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Corral de Pollos")
        EndTextCommandSetBlipName(chickenRouteBlip)
    end
    
    lib.notify({
        title = 'Granja Avícola',
        description = 'Sigue la ruta GPS hacia el corral de pollos',
        type = 'success'
    })
end

-- Mostrar HUD durante el trabajo
function ChickenJob:ShowHUD()
    SendNUIMessage({
        action = 'showHud',
        jobType = 'chicken',
        level = playerStats.level or 1,
        bonusPercent = playerStats.bonusPercent or 0
    })
    
    -- Actualización inmediata
    local earnings = processedChickens * (ChickenConfig.Payment or 5)
    local maxChickens = ChickenConfig.MaxChickensPerRound or 50
    local progressPercent = math.min((totalChickensCaught / maxChickens) * 100, 100)
    
    SendNUIMessage({
        action = 'updateHud',
        items = totalChickensCaught,
        itemLabel = 'Capturados',
        items2 = processedChickens,
        itemLabel2 = 'Procesados',
        earnings = earnings,
        progress = progressPercent,
        maxItems = maxChickens,
        itemLabelPlural = 'gallinas'
    })
    
    -- Thread para actualizar el HUD periódicamente
    CreateThread(function()
        while isJobActive do
            local currentEarnings = processedChickens * (ChickenConfig.Payment or 5)
            local currentProgress = math.min((totalChickensCaught / maxChickens) * 100, 100)
            
            SendNUIMessage({
                action = 'updateHud',
                items = totalChickensCaught,
                itemLabel = 'Capturados',
                items2 = processedChickens,
                itemLabel2 = 'Procesados',
                earnings = currentEarnings,
                progress = currentProgress,
                maxItems = maxChickens,
                itemLabelPlural = 'gallinas'
            })
            
            Wait(1000)
        end
    end)
end

function ChickenJob:HideHUD()
    SendNUIMessage({
        action = 'hideHud'
    })
end

function ChickenJob:ApplyUniform()
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

function ChickenJob:RestoreUniform()
    MTJobsFadeOut(200)
    
    Wait(100)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    Wait(100)
    
    MTJobsFadeIn(100)
end

-- ===========================
-- SINCRONIZACIÓN DE POLLOS DESDE EL SERVIDOR
-- ===========================
function ChickenJob:SpawnChickenZones()
    -- Solo crear blips de zonas, los pollos se sincronizan desde el servidor
    for _, blip in ipairs(chickenZoneBlips) do
        if blip then RemoveBlip(blip) end
    end
    chickenZoneBlips = {}

    for zIndex, zone in ipairs(self.config.ChickenZones) do
        -- Crear blip de zona
        local blip = AddBlipForCoord(zone.center.x, zone.center.y, zone.center.z)
        SetBlipSprite(blip, 1)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 2) -- Verde
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(zone.label)
        EndTextCommandSetBlipName(blip)
        table.insert(chickenZoneBlips, blip)

        -- Thread para quitar el blip de ruta al llegar al corral
        local zoneCenter = zone.center
        local zoneRadius = zone.radius
        CreateThread(function()
            while isJobActive and chickenRouteBlip do
                local playerCoords = GetEntityCoords(PlayerPedId())
                if #(playerCoords - zoneCenter) < zoneRadius + 10.0 then
                    if chickenRouteBlip then
                        RemoveBlip(chickenRouteBlip)
                        chickenRouteBlip = nil
                    end
                    break
                end
                Wait(1000)
            end
        end)
    end
end

-- ===========================
-- DETECCIÓN DE POLLOS - BUSCA POR MODELO EN EL MUNDO (GetGamePool)
-- ===========================
function ChickenJob:StartChickenDetectionThread()
    local chickenModelHash = GetHashKey(self.config.ChickenModel or 'A_C_Hen')
    
    CreateThread(function()
        while isJobActive do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local isInVehicle = IsPedInAnyVehicle(playerPed, false)
            local catchDist = self.config.CatchDistance or 1.5
            local closestChicken = nil
            local closestDist = catchDist + 1.0

            if not isInVehicle and not carryingChicken and not catchingChicken then
                -- Buscar pollos directamente en el mundo por modelo
                local allPeds = GetGamePool('CPed')
                for _, ped in ipairs(allPeds) do
                    if GetEntityModel(ped) == chickenModelHash and not IsPedDeadOrDying(ped, true) then
                        -- Verificar que no sea el pollo que llevamos en la mano
                        if ped ~= carriedProp then
                            local chickenCoords = GetEntityCoords(ped)
                            local dist = #(playerCoords - chickenCoords)
                            if dist < closestDist then
                                closestDist = dist
                                closestChicken = ped
                            end
                        end
                    end
                end

                if closestChicken and closestDist <= catchDist then
                    if totalChickensCaught < (ChickenConfig.MaxChickensPerRound or 40) then
                        MTDrawText3D('chicken_catch', 'Atrapar pollo', GetEntityCoords(closestChicken) + vector3(0,0,1.0), 'E')
                        if IsControlJustPressed(0, 38) then
                            self:CatchChicken(closestChicken)
                        end
                    end
                else
                    MTHideText3D('chicken_catch')
                end
            end
            
            Wait(0)
        end
    end)
end


function ChickenJob:CatchChicken(chickenEntity)
    if not DoesEntityExist(chickenEntity) then 
        return 
    end
    
    catchingChicken = true
    MTHideText3D('chicken_catch')
    
    local playerPed = PlayerPedId()
    local chickenCoords = GetEntityCoords(chickenEntity)
    
    -- Buscar el chickenId ANTES de eliminar
    local chickenId = nil
    if NetworkGetEntityIsNetworked(chickenEntity) then
        local netId = NetworkGetNetworkIdFromEntity(chickenEntity)
        for _, chickenData in ipairs(spawnedChickens) do
            if chickenData.netId == netId and chickenData.alive then
                chickenId = chickenData.id
                chickenData.alive = false
                break
            end
        end
    end
    
    -- Si no encontramos el chickenId, puede que ya fue capturado por otro jugador
    if not chickenId then
        catchingChicken = false
        lib.notify({
            title = 'Granja Avícola',
            description = 'Esa gallina ya fue capturada por otro jugador.',
            type = 'error'
        })
        return
    end
    
    -- Notificar al servidor INMEDIATAMENTE para que otros jugadores no puedan capturarla
    TriggerServerEvent('mt-chicken:catchChicken', chickenId)
    
    -- Eliminar la entidad del pollo inmediatamente (despawnear)
    if NetworkHasControlOfEntity(chickenEntity) then
        DeleteEntity(chickenEntity)
    else
        NetworkRequestControlOfEntity(chickenEntity)
        local controlAttempts = 0
        while not NetworkHasControlOfEntity(chickenEntity) and controlAttempts < 15 do
            Wait(50)
            controlAttempts = controlAttempts + 1
        end
        if DoesEntityExist(chickenEntity) then
            DeleteEntity(chickenEntity)
        end
    end
    
    -- Girar hacia donde estaba la gallina
    TaskTurnPedToFaceCoord(playerPed, chickenCoords.x, chickenCoords.y, chickenCoords.z, 500)
    Wait(500)
    
    -- Animación de agacharse y capturar
    local success = lib.progressBar({
        duration = 3000,
        label = 'Capturando gallina...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = 'random@domestic',
            clip = 'pickup_low',
        },
    })
    
    ClearPedTasks(playerPed)
    
    if not success then
        -- Si cancela, la gallina ya fue eliminada - el servidor la respawneará automáticamente
        catchingChicken = false
        return 
    end
    
    totalChickensCaught = totalChickensCaught + 1
    catchingChicken = false
    
    if totalChickensCaught >= (ChickenConfig.MaxChickensPerRound or 40) then
        lib.notify({
            title = 'Granja Avícola',
            description = 'Has alcanzado el límite. Procesa y entrega el pedido.',
            type = 'warning',
            duration = 5000
        })
    end

    self:StartCarryingChicken()
end

-- Limpiar referencias locales a pollos
function ChickenJob:CleanupChickens()
    spawnedChickens = {}
    
    for _, blip in ipairs(chickenZoneBlips) do
        if blip then RemoveBlip(blip) end
    end
    chickenZoneBlips = {}
end

-- ===========================
-- LLEVAR POLLO AL VEHÍCULO
-- ===========================
function ChickenJob:StartCarryingChicken()
    carryingChicken = true
    local playerPed = PlayerPedId()
    local anim = self.config.Anims.Carry
    local chickenModel = self.config.ChickenModel or 'A_C_Hen'
    
    lib.requestModel(chickenModel)
    lib.requestAnimDict(anim.dict)
    
    -- Crear un ped de gallina LOCAL (no networked) y adjuntarlo a las manos
    local playerCoords = GetEntityCoords(playerPed)
    carriedProp = CreatePed(28, GetHashKey(chickenModel), playerCoords.x, playerCoords.y, playerCoords.z, 0.0, false, false)
    
    SetEntityAsMissionEntity(carriedProp, true, true)
    FreezeEntityPosition(carriedProp, true)
    SetEntityInvincible(carriedProp, true)
    SetEntityCanBeDamaged(carriedProp, false)
    SetPedCanBeTargetted(carriedProp, false)
    SetEntityCollision(carriedProp, false, false)
    SetBlockingOfNonTemporaryEvents(carriedProp, true)
    
    AttachEntityToEntity(carriedProp, playerPed, GetPedBoneIndex(playerPed, anim.bone), 
        anim.pos.x, anim.pos.y, anim.pos.z, 
        anim.rot.x, anim.rot.y, anim.rot.z, 
        true, true, false, true, 1, true)
        
    TaskPlayAnim(playerPed, anim.dict, anim.clip, 8.0, -8.0, -1, 49, 0, false, false, false)
    
    -- Thread para deshabilitar acciones y restaurar animación si se bugea
    CreateThread(function()
        local animDict = anim.dict
        local animClip = anim.clip
        while carryingChicken do
            local ped = PlayerPedId()
            DisableControlAction(0, 21, true) -- Sprint
            DisableControlAction(0, 22, true) -- Jump
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 140, true) -- Melee Attack Light
            DisableControlAction(0, 141, true) -- Melee Attack Heavy
            DisableControlAction(0, 142, true) -- Melee Attack Alternate
            DisableControlAction(0, 257, true) -- Attack 2
            
            -- Restaurar animación si se interrumpió (puertas, colisiones, etc.)
            if not IsEntityPlayingAnim(ped, animDict, animClip, 3) then
                lib.requestAnimDict(animDict)
                TaskPlayAnim(ped, animDict, animClip, 8.0, -8.0, -1, 49, 0, false, false, false)
                
                -- Re-adjuntar la gallina por si se despegó
                if carriedProp and DoesEntityExist(carriedProp) then
                    AttachEntityToEntity(carriedProp, ped, GetPedBoneIndex(ped, anim.bone),
                        anim.pos.x, anim.pos.y, anim.pos.z,
                        anim.rot.x, anim.rot.y, anim.rot.z,
                        true, true, false, true, 1, true)
                end
            end
            
            Wait(0)
        end
    end)

    lib.notify({
        title = 'Granja Avícola',
        description = 'Lleva la gallina a tu vehículo',
        type = 'info'
    })
end

function ChickenJob:CreateTruckDepositPoint()
    CreateThread(function()
        while currentVehicle do
            if carryingChicken then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local vehCoords = GetEntityCoords(currentVehicle)
                local distance = #(playerCoords - vehCoords)
                
                if distance < 5.0 then
                    MTDrawText3D('chicken_deposit', 'Guardar gallina', vehCoords + vector3(0,0,1.0), 'E')
                    
                    if IsControlJustPressed(0, 38) then
                        ChickenJob:DepositChicken()
                    end
                else
                    MTHideText3D('chicken_deposit')
                end
            end
            Wait(0)
        end
    end)
end

function ChickenJob:DepositChicken()
    local playerPed = PlayerPedId()
    
    MTHideText3D('chicken_deposit')
    
    carryingChicken = false
    ClearPedTasksImmediately(playerPed)
    
    if carriedProp then
        if DoesEntityExist(carriedProp) then
            DeleteEntity(carriedProp)
        end
        carriedProp = nil
    end
    
    collectedChickens = collectedChickens + 1
    
    -- Actualizar HUD
    local earnings = processedChickens * (ChickenConfig.Payment or 8)
    SendNUIMessage({
        action = 'updateHud',
        items = totalChickensCaught,
        itemLabel = 'Capturados',
        items2 = processedChickens,
        itemLabel2 = 'Procesados',
        earnings = earnings
    })
    
    lib.notify({
        title = 'Granja Avícola',
        description = 'Pollos: ' .. collectedChickens .. '. Ve a procesarlos cuando termines.',
        type = 'success'
    })

    local firstProcessing = self.config.Locations.ProcessingPoints[1]
    if processingBlip then RemoveBlip(processingBlip) end
    processingBlip = AddBlipForCoord(firstProcessing.coords)
    SetBlipSprite(processingBlip, 1)
    SetBlipColour(processingBlip, 4)
    SetBlipRoute(processingBlip, true)
    SetBlipRouteColour(processingBlip, 4)
end

-- ===========================
-- PROCESAMIENTO
-- ===========================
function ChickenJob:CreateProcessingPoint()
    -- Limpiar puntos y props existentes
    for _, point in ipairs(processingPoints) do point:remove() end
    for _, prop in ipairs(processingProps) do DeleteEntity(prop) end
    processingPoints = {}
    processingProps = {}

    for i, data in ipairs(self.config.Locations.ProcessingPoints) do
        local processingCoords = data.coords
        
        local point = lib.points.new({
            coords = processingCoords,
            distance = 5.0,
        })

        function point:onExit()
            MTHideText3D('chicken_process')
        end

        function point:nearby()
            -- Marker negro tipo cilindro
            DrawMarker(22, processingCoords.x, processingCoords.y, processingCoords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 0, 0, 200, false, true, 2, false, nil, nil, false)
            
            if self.currentDistance < 2.0 and (collectedChickens or 0) > 0 then
                local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                if isInVehicle then
                    MTDrawText3D('chicken_process', 'Debes bajarte del vehículo para procesar', processingCoords + vector3(0,0,1.0), '')
                else
                    MTDrawText3D('chicken_process', 'Procesar pollos', processingCoords + vector3(0,0,1.0), 'E')
                    if IsControlJustPressed(0, 38) then
                        ChickenJob:ProcessChickens()
                    end
                end
            else
                MTHideText3D('chicken_process')
            end
        end

        table.insert(processingPoints, point)
    end
end

function ChickenJob:ProcessChickens()
    MTHideText3D('chicken_process')

    -- Dificultad del minijuego según nivel del jugador
    local level = playerStats.level or 1
    local difficulty = 'easy'
    if level >= 10 then difficulty = 'hard'
    elseif level >= 5 then difficulty = 'medium' end
    if level >= 15 then difficulty = 'extreme' end

    -- Minijuego: Wire Puzzle antes de procesar (conectar maquinaria)
    exports['mt-minijuegos']:StartWirePuzzle(difficulty, function(minigameSuccess)
        if not minigameSuccess then
            lib.notify({
                title = 'Granja Avícola',
                description = 'No has conectado bien la maquinaria. Inténtalo de nuevo.',
                type = 'error'
            })
            return
        end

        local success = lib.progressBar({
            duration = 25000,
            label = 'Procesando pollos...',
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
            },
            anim = {
                dict = 'mini@repair',
                clip = 'fixing_a_ped'
            },
        })

        if not success then return end

        if processingBlip then RemoveBlip(processingBlip); processingBlip = nil end

        processedChickens = processedChickens + (collectedChickens * 2)
        collectedChickens = 0
        totalChickensCaught = 0

        -- Actualizar HUD
        local earnings = processedChickens * (ChickenConfig.Payment or 8)
        SendNUIMessage({
            action = 'updateHud',
            items = 0,
            itemLabel = 'Capturados',
            items2 = processedChickens,
            itemLabel2 = 'Procesados',
            earnings = earnings
        })

        lib.notify({
            title = 'Granja Avícola',
            description = 'Has procesado los pollos. Piezas: ' .. processedChickens,
            type = 'success'
        })

        ChickenJob:StartDelivery()
    end)
end

-- ===========================
-- ENTREGA
-- ===========================
function ChickenJob:StartDelivery()
    local deliveryIdx = math.random(1, #self.config.DeliveryPoints)
    local deliveryData = self.config.DeliveryPoints[deliveryIdx]
    
    if deliveryBlip then RemoveBlip(deliveryBlip) end
    deliveryBlip = AddBlipForCoord(deliveryData.coords)
    SetBlipSprite(deliveryBlip, 1)
    SetBlipColour(deliveryBlip, 4)
    SetBlipRoute(deliveryBlip, true)
    SetBlipRouteColour(deliveryBlip, 4)
    
    lib.notify({
        title = 'Granja Avícola',
        description = 'Entrega las piezas en ' .. deliveryData.label,
        type = 'info'
    })
    
    self.currentDeliveryPoint = lib.points.new({
        coords = deliveryData.coords,
        distance = 5.0,
    })
    
    function self.currentDeliveryPoint:onExit()
        MTHideText3D('chicken_delivery')
    end
    
    function self.currentDeliveryPoint:nearby()
        DrawMarker(22, deliveryData.coords.x, deliveryData.coords.y, deliveryData.coords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 0, 0, 200, false, true, 2, false, nil, nil, false)
        
        if self.currentDistance < 3.0 then
            MTDrawText3D('chicken_delivery', 'Entregar pedido', deliveryData.coords + vector3(0,0,1.0), 'E')
            if IsControlJustPressed(0, 38) then
                ChickenJob:CompleteDelivery()
            end
        else
            MTHideText3D('chicken_delivery')
        end
    end
end

function ChickenJob:CompleteDelivery()
    MTHideText3D('chicken_delivery')

    local success = lib.progressBar({
        duration = 3000,
        label = 'Entregando piezas de pollo...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
    })

    if not success then return end

    -- Calcular tiempo trabajado
    local workTime = 0
    if workStartTime then
        workTime = math.floor((GetGameTimer() - workStartTime) / 60000) -- minutos
    end

    -- Acumular items entregados
    totalDeliveredChickens = totalDeliveredChickens + processedChickens
    TriggerServerEvent('mt-chicken:deliverChicken', processedChickens, workTime)

    processedChickens = 0
    totalChickensCaught = 0
    workStartTime = GetGameTimer()

    if deliveryBlip then
        RemoveBlip(deliveryBlip); deliveryBlip = nil
    end
    if self.currentDeliveryPoint then
        self.currentDeliveryPoint:remove(); self.currentDeliveryPoint = nil
    end

    SendNUIMessage({
        action = 'updateHud',
        items = 0,
        itemLabel = 'Capturados',
        items2 = 0,
        itemLabel2 = 'Procesados',
        earnings = 0,
        progress = 0
    })

    lib.notify({
        title = 'Granja Avícola',
        description = 'Pollos depositados (' .. totalDeliveredChickens .. ' en total). Puedes ir por más o devolver el vehículo para cobrar.',
        type = 'success'
    })
end

-- ===========================
-- RETORNO DE VEHÍCULO
-- ===========================
function ChickenJob:CreateReturnPoint()
    local returnCoords = self.config.Locations.VehicleReturn or self.config.Locations.VehicleSpawn
    
    self.returnPoint = lib.points.new({
        coords = returnCoords,
        distance = 10.0,
    })
    
    function self.returnPoint:onEnter()
        if currentVehicle and IsPedInVehicle(PlayerPedId(), currentVehicle, false) then
            if GetPedInVehicleSeat(currentVehicle, -1) == PlayerPedId() then
                MTDrawText3D('chicken_return', 'Finalizar y Devolver Vehículo', returnCoords + vector3(0,0,1.0), 'E')
            end
        end
    end
    
    function self.returnPoint:onExit()
        MTHideText3D('chicken_return')
    end
    
    function self.returnPoint:nearby()
        DrawMarker(22, returnCoords.x, returnCoords.y, returnCoords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 0, 0, 0, 150, false, true, 2, false, nil, nil, false)
        if currentVehicle and IsPedInVehicle(PlayerPedId(), currentVehicle, false) then
            if GetPedInVehicleSeat(currentVehicle, -1) == PlayerPedId() then
                if IsControlJustPressed(0, 38) then
                    ChickenJob:FinishJob()
                end
            end
        else
            MTHideText3D('chicken_return')
        end
    end
end

function ChickenJob:FinishJob()
    if processedChickens > 0 or collectedChickens > 0 then
        lib.notify({
            title = 'Granja Avícola',
            description = 'Tienes pollos sin entregar/procesar. Termina tu trabajo primero.',
            type = 'error'
        })
        return
    end

    MTHideText3D('chicken_return')
    
    local playerPed = PlayerPedId()
    if currentVehicle and DoesEntityExist(currentVehicle) and IsPedInVehicle(playerPed, currentVehicle, false) then
        TaskLeaveVehicle(playerPed, currentVehicle, 0)
        Wait(1500)
    end
    
    if currentVehicle and DoesEntityExist(currentVehicle) then
        DeleteEntity(currentVehicle)
        currentVehicle = nil
    end
    
    -- Trigger el pago al devolver el vehículo
    TriggerServerEvent('mt-chicken:returnVehicle')
    totalDeliveredChickens = 0
    
    self:HideHUD()
    self:RestoreUniform()
    self:stop()
end

function ChickenJob:stop()
    Job.stop(self)
    
    TriggerServerEvent('mt-chicken:cancelJob')
    
    isJobActive = false
    self:HideHUD()
    self:RestoreUniform()
    
    -- Cancelar progressbar activa y limpiar estado del jugador
    if lib.progressActive and lib.progressActive() then lib.cancelProgress() end
    MTHideText3D('chicken_start')
    MTHideText3D('chicken_catch')
    MTHideText3D('chicken_deposit')
    MTHideText3D('chicken_process')
    MTHideText3D('chicken_delivery')
    MTHideText3D('chicken_return')
    local playerPed = PlayerPedId()
    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(playerPed, false)
    
    if self.returnPoint then self.returnPoint:remove() end
    for _, point in ipairs(processingPoints) do point:remove() end
    processingPoints = {}
    for _, prop in ipairs(processingProps) do DeleteEntity(prop) end
    processingProps = {}
    if deliveryBlip then RemoveBlip(deliveryBlip); deliveryBlip = nil end
    if processingBlip then RemoveBlip(processingBlip); processingBlip = nil end
    if chickenRouteBlip then RemoveBlip(chickenRouteBlip); chickenRouteBlip = nil end
    
    if currentVehicle then DeleteEntity(currentVehicle); currentVehicle = nil end
    if carriedProp then DeleteEntity(carriedProp); carriedProp = nil end
    
    self:CleanupChickens()
    
    carryingChicken = false
    catchingChicken = false
    collectedChickens = 0
    totalChickensCaught = 0
    processedChickens = 0
    totalDeliveredChickens = 0
    workStartTime = nil
    
    self:start()
end

-- NUI callbacks centralizados en garbage/client.lua

-- ===========================
-- EVENTOS DE SINCRONIZACIÓN CON EL SERVIDOR
-- ===========================

-- Recibir lista de pollos del servidor (para registro interno)
RegisterNetEvent('mt-chicken:syncChickens', function(chickensData)
    spawnedChickens = {}
    
    for _, data in ipairs(chickensData) do
        table.insert(spawnedChickens, {
            id = data.id,
            netId = data.netId,
            zoneIndex = data.zoneIndex,
            alive = data.alive
        })
    end
    
    -- Configurar pollos que ya existen en el mundo
    CreateThread(function()
        Wait(2000) -- Esperar a que las entidades se sincronicen completamente
        
        local chickenModelHash = GetHashKey(ChickenConfig.ChickenModel or 'A_C_Hen')
        local allPeds = GetGamePool('CPed')
        local configuredCount = 0
        
        for _, ped in ipairs(allPeds) do
            if GetEntityModel(ped) == chickenModelHash then
                -- Solicitar control para poder dar tareas
                if not NetworkHasControlOfEntity(ped) then
                    NetworkRequestControlOfEntity(ped)
                    Wait(200)
                end
                
                if NetworkHasControlOfEntity(ped) then
                    -- No congelar, permitir movimiento
                    FreezeEntityPosition(ped, false)
                    SetEntityInvincible(ped, true)
                    SetBlockingOfNonTemporaryEvents(ped, false)
                    SetPedFleeAttributes(ped, 0, true)
                    SetPedCombatAttributes(ped, 17, true)
                    
                    -- Hacer que deambule
                    local closestZone = ChickenConfig.ChickenZones[1]
                    if closestZone then
                        TaskWanderInArea(ped, closestZone.center.x, closestZone.center.y, closestZone.center.z, closestZone.radius, 1.0, 1.0)
                    end
                    configuredCount = configuredCount + 1
                end
            end
        end
    end)
end)

-- Notificación de que un pollo fue capturado (por cualquier jugador)
RegisterNetEvent('mt-chicken:chickenCaught', function(chickenId)
    for _, chickenData in ipairs(spawnedChickens) do
        if chickenData.id == chickenId then
            chickenData.alive = false
            break
        end
    end
end)

-- Notificación de respawn de un pollo
RegisterNetEvent('mt-chicken:chickenRespawned', function(chickenId, newNetId)
    for _, chickenData in ipairs(spawnedChickens) do
        if chickenData.id == chickenId then
            chickenData.netId = newNetId
            chickenData.alive = true
            
            CreateThread(function()
                Wait(2000)
                local chickenEntity = NetworkGetEntityFromNetworkId(newNetId)
                if DoesEntityExist(chickenEntity) then
                    if not NetworkHasControlOfEntity(chickenEntity) then
                        NetworkRequestControlOfEntity(chickenEntity)
                        Wait(500)
                    end
                    
                    if NetworkHasControlOfEntity(chickenEntity) then
                        FreezeEntityPosition(chickenEntity, false)
                        SetEntityInvincible(chickenEntity, true)
                        SetBlockingOfNonTemporaryEvents(chickenEntity, false)
                        SetPedFleeAttributes(chickenEntity, 0, true)
                        SetPedCombatAttributes(chickenEntity, 17, true)
                        
                        local zone = ChickenConfig.ChickenZones[chickenData.zoneIndex]
                        if zone then
                            TaskWanderInArea(chickenEntity, zone.center.x, zone.center.y, zone.center.z, zone.radius, 1.0, 1.0)
                        end
                    end
                end
            end)
            
            break
        end
    end
end)

-- Comando de debug
RegisterCommand('debugchickens', function()
    local chickenModelHash = GetHashKey(ChickenConfig.ChickenModel or 'A_C_Hen')
    local allPeds = GetGamePool('CPed')
    local playerCoords = GetEntityCoords(PlayerPedId())
    local found = 0
    
    for _, ped in ipairs(allPeds) do
        if GetEntityModel(ped) == chickenModelHash then
            found = found + 1
        end
    end
end, false)

RegisterJobModule(ChickenConfig.JobName, ChickenJob)

