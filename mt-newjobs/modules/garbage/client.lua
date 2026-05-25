local GarbageJob = Job:new(GarbageConfig.JobName)
local currentVehicle = nil
local collectedGarbage = 0
local npcPed = nil
local carryingBag = false
local carriedProp = nil
local collectedProps = {}
local workStartTime = nil
local isJobActive = false
local returnBlip = nil

-- Stats del jugador (se cargan desde el servidor)
local playerStats = {
    lastSession = 0,
    totalBags = 0,
    totalTime = 0,
    level = 1,
    shiftsCompleted = 0,
    totalEarned = 0,
    avgPerShift = 0,
    bestShift = 0
}

function GarbageJob:init()
    self.config = GarbageConfig
    self:CreateBlip()
    self:CreateNPC()
    self:start()
end

function GarbageJob:CreateBlip()
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

function GarbageJob:CreateNPC()
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

function GarbageJob:start()
    Job.start(self)
    
    local startCoords = self.config.Locations.Start
    local job = self
    
    self.startPoint = lib.points.new({
        coords = startCoords,
        distance = 10.0,
    })

    function self.startPoint:onEnter()
        MTDrawText3D('garbage_start', 'Abrir panel de trabajo', startCoords, 'E')
    end

    function self.startPoint:onExit()
        MTHideText3D('garbage_start')
    end

    function self.startPoint:nearby()
        if self.currentDistance < 2.0 then
            if IsControlJustPressed(0, 38) then
                job:OpenMenu()
            end
        end
    end
end

function GarbageJob:OpenMenu()
    -- Verificar en el servidor si el menú está disponible
    lib.callback('mt-garbage:openMenu', false, function(canOpen)
        if not canOpen then
            lib.notify({
                title = 'Basurero',
                description = 'Otro trabajador está usando el panel. Espera un momento.',
                type = 'error'
            })
            return
        end
        
        -- Cargar estadísticas desde el servidor
        lib.callback('mt-garbage:getStats', false, function(stats)
            if stats then
                playerStats = stats
            end
            
            -- Mostrar el menú NUI
            SetNuiFocus(true, true)
            playerStats.hasActiveShift = isJobActive
            SendNUIMessage({
                action = 'showMenu',
                jobType = 'garbage',
                stats = playerStats
            })
        end)
    end)
end

function GarbageJob:RequestStart()
    -- Verificar si el jugador tiene un trabajo de emergencia
    local playerData = ESX.GetPlayerData()
    local restrictedJobs = {'ambulance', 'police', 'sheriff', 'sapd'}
    
    if playerData and playerData.job then
        for _, job in ipairs(restrictedJobs) do
            if playerData.job.name == job then
                lib.notify({
                    title = 'Basurero',
                    description = 'No puedes realizar este trabajo siendo personal de emergencias',
                    type = 'error'
                })
                return
            end
        end
    end
    
    if currentVehicle and DoesEntityExist(currentVehicle) then
        lib.notify({
            title = 'Basurero',
            description = 'Ya tienes un vehículo activo',
            type = 'error'
        })
        return
    end
    
    -- Verificar si el spawn está libre antes de iniciar (server-side)
    lib.callback('mt-garbage:checkSpawnFree', false, function(isFree)
        if not isFree then
            lib.notify({
                title = 'Basurero',
                description = 'Hay un vehículo en el punto de spawn. Espera a que se libere.',
                type = 'error',
                duration = 5000
            })
            return
        end
        
        -- Si el spawn está libre, intentar iniciar el trabajo
        local success = lib.callback.await('mt-garbage:startJob', false)
        if success then
            self:SpawnVehicle()
        end
    end)
end

function GarbageJob:SpawnVehicle()
    local spawnCoords = self.config.Locations.VehicleSpawn
    
    local vehicleInArea = GetClosestVehicle(spawnCoords.x, spawnCoords.y, spawnCoords.z, 8.0, 0, 71)
    if vehicleInArea ~= 0 and DoesEntityExist(vehicleInArea) then
        lib.notify({
            title = 'Basurero',
            description = 'Hay un vehículo obstruyendo la zona de spawn',
            type = 'error'
        })
        TriggerServerEvent('mt-garbage:cancelJob')
        return
    end
    
    lib.requestModel(self.config.Locations.VehicleModel)
    
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
    
    collectedGarbage = 0
    collectedProps = {}
    workStartTime = GetGameTimer()
    isJobActive = true
    if returnBlip then RemoveBlip(returnBlip) returnBlip = nil end
    
    self:StartGarbageDetectionThread()
    self:CreateReturnPoint()
    self:CreateTruckDepositPoint()
    self:ShowHUD()
    
    self:ApplyUniform()
    
    lib.notify({
        title = 'Basurero',
        description = 'Lleva la bolsa al camión (No puedes correr, saltar ni atacar)',
        type = 'info'
    })

    CreateThread(function()
        while carryingBag do
            local playerPed = PlayerPedId()
            DisableControlAction(0, 21, true) -- Sprint
            DisableControlAction(0, 22, true) -- Jump
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 140, true) -- Melee Attack
            DisableControlAction(0, 141, true) -- Melee Attack
            DisableControlAction(0, 142, true) -- Melee Attack
            Wait(0)
        end
    end)
end

-- Mostrar HUD durante el trabajo
function GarbageJob:ShowHUD()
    SendNUIMessage({
        action = 'showHud',
        jobType = 'garbage',
        level = playerStats.level or 1,
        bonusPercent = playerStats.bonusPercent or 0
    })
    
    -- Thread para actualizar el HUD
    CreateThread(function()
        while isJobActive and currentVehicle do
            local earnings = collectedGarbage * GarbageConfig.Payment.PerBag
            local progressPercent = math.min((collectedGarbage / 50) * 100, 100)
            
            SendNUIMessage({
                action = 'updateHud',
                items = collectedGarbage,
                earnings = earnings,
                progress = progressPercent,
                maxItems = 50
            })
            
            Wait(1000)
        end
    end)
end

function GarbageJob:HideHUD()
    SendNUIMessage({
        action = 'hideHud'
    })
end

function GarbageJob:ApplyUniform()
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

function GarbageJob:RestoreUniform()
    MTJobsFadeOut(200)
    
    Wait(200)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    Wait(200)
    
    MTJobsFadeIn(200)
end

function GarbageJob:StartGarbageDetectionThread()
    CreateThread(function()
        while currentVehicle do
            if not carryingBag then
                -- Bloquear recolección si ya tiene 50 basuras
                if collectedGarbage >= 50 then
                    MTHideText3D('garbage_pickup')
                    Wait(500)
                else
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    local closestProp = nil
                    local closestDist = 2.0
                    
                    for _, modelName in ipairs(GarbageConfig.GarbageModels) do
                        local modelHash = type(modelName) == "number" and modelName or GetHashKey(modelName)
                        local prop = GetClosestObjectOfType(
                            playerCoords.x, playerCoords.y, playerCoords.z,
                            closestDist,
                            modelHash,
                            false, false, false
                        )
                        
                        if prop ~= 0 and DoesEntityExist(prop) then
                            local alreadyCollected = false
                            for _, collected in ipairs(collectedProps) do
                                if collected == prop then
                                    alreadyCollected = true
                                    break
                                end
                            end
                            
                            if not alreadyCollected then
                                local propCoords = GetEntityCoords(prop)
                                local dist = #(playerCoords - propCoords)
                                if dist < closestDist then
                                    closestProp = prop
                                    closestDist = dist
                                end
                            end
                        end
                    end
                    
                    if closestProp then
                        MTDrawText3D('garbage_pickup', 'Recoger basura', GetEntityCoords(closestProp) + vector3(0,0,1.0), 'E')
                        
                        if IsControlJustPressed(0, 38) then
                            GarbageJob:PickupGarbage(closestProp)
                        end
                    else
                        MTHideText3D('garbage_pickup')
                    end
                end
            end
            
            Wait(0)
        end
    end)
end

function GarbageJob:PickupGarbage(prop)
    if not DoesEntityExist(prop) then return end

    -- Verificar si ya tiene 50 basuras
    if collectedGarbage >= 50 then
        lib.hideTextUI()
        lib.notify({
            title = 'Basurero',
            description = 'Ya has recogido 50 bolsas. Debes volver a la central para entregar el camión.',
            type = 'error',
            duration = 5000
        })
        return
    end

    local playerPed = PlayerPedId()

    MTHideText3D('garbage_pickup')

    table.insert(collectedProps, prop)

    TaskTurnPedToFaceEntity(playerPed, prop, 1000)
    Wait(500)

    local success = lib.progressBar({
        duration = 2000,
        label = 'Recogiendo basura',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_ped'
        }
    })

    if not success then return end

    if DoesEntityExist(prop) then
        carryingBag = true

        local coords = GetEntityCoords(playerPed)

        lib.requestModel('prop_cs_street_binbag_01')

        carriedProp = CreateObject(
            GetHashKey('prop_cs_street_binbag_01'),
            coords.x, coords.y, coords.z,
            true, true, true
        )

        DeleteEntity(prop)

        lib.requestAnimDict('missfbi4prepp1')
        TaskPlayAnim(playerPed, 'missfbi4prepp1', '_idle_garbage_man', 8.0, -8.0, -1, 49, 0, false, false, false)

        AttachEntityToEntity(
            carriedProp,
            playerPed,
            GetPedBoneIndex(playerPed, 28422),
            0.0, 0.04, -0.02,
            0.0, 0.0, 0.0,
            true, true, false, true, 1, true
        )

        -- Thread para deshabilitar acciones mientras lleva la bolsa
        CreateThread(function()
            while carryingBag do
                -- Deshabilitar correr
                DisableControlAction(0, 21, true) -- Sprint
                
                -- Deshabilitar saltar
                DisableControlAction(0, 22, true) -- Jump
                
                -- Deshabilitar atacar/disparar
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 140, true) -- Melee Attack Light
                DisableControlAction(0, 141, true) -- Melee Attack Heavy
                DisableControlAction(0, 142, true) -- Melee Attack Alternate
                DisableControlAction(0, 257, true) -- Attack 2
                
                Wait(0)
            end
        end)

        lib.notify({
            title = 'Basurero',
            description = 'Lleva la basura a la parte trasera del camión',
            type = 'info'
        })
    end
end

function GarbageJob:CreateTruckDepositPoint()
    CreateThread(function()
        while currentVehicle do
            if carryingBag then
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local vehCoords = GetEntityCoords(currentVehicle)
                local backOffset = GetOffsetFromEntityInWorldCoords(currentVehicle, 0.0, -4.0, 0.0)
                local distance = #(playerCoords - backOffset)
                
                if distance < 2.5 then
                    MTDrawText3D('garbage_deposit', 'Meter basura al camión', backOffset, 'E')
                    
                    if IsControlJustPressed(0, 38) then
                        GarbageJob:DepositGarbage()
                    end
                else
                    MTHideText3D('garbage_deposit')
                end
            end
            
            Wait(0)
        end
    end)
end

function GarbageJob:DepositGarbage()
    local playerPed = PlayerPedId()

    MTHideText3D('garbage_deposit')

    -- Calcular la posición trasera del camión (más atrás para estar centrado)
    local backOffset = GetOffsetFromEntityInWorldCoords(currentVehicle, 0.0, -5.0, 0.0)
    local playerCoords = GetEntityCoords(playerPed)
    local distance = #(playerCoords - backOffset)
    
    -- Si el jugador está lejos de la parte trasera, hacerlo caminar hasta allí
    if distance > 1.5 then
        -- Hacer que el ped camine hasta la parte trasera
        TaskGoToCoordAnyMeans(playerPed, backOffset.x, backOffset.y, backOffset.z, 1.0, 0, false, 786603, 0.0)
        
        -- Esperar hasta que llegue a la posición
        local timeout = 0
        while #(GetEntityCoords(playerPed) - backOffset) > 1.5 and timeout < 100 do
            Wait(50)
            timeout = timeout + 1
            
            -- Si el jugador cancela (se mueve), abortar
            if not carryingBag then
                return
            end
        end
        
        -- Detener el movimiento
        ClearPedTasks(playerPed)
        Wait(200)
    end
    
    -- Abrir el maletero del camión
    SetVehicleDoorOpen(currentVehicle, 5, false, false) -- Door 5 = Trunk/Rear door
    Wait(500) -- Esperar a que se abra
    
    -- Girar al jugador en la misma dirección que el camión (para que tire hacia adelante = hacia el camión)
    local truckHeading = GetEntityHeading(currentVehicle)
    SetEntityHeading(playerPed, truckHeading)
    Wait(200)

    -- Detener la animación de llevar la bolsa pero mantener la bolsa attached
    ClearPedTasks(playerPed)
    Wait(100)

    -- Animación de tirar basura (la bolsa sigue pegada)
    lib.requestAnimDict('anim@heists@narcotics@trash')
    TaskPlayAnim(playerPed, 'anim@heists@narcotics@trash', 'throw', 8.0, -8.0, 1000, 48, 0, false, false, false)
    
    Wait(500) -- Esperar al momento del lanzamiento en la animación
    
    -- Eliminar la bolsa en el momento del lanzamiento (sin desprenderla antes)
    if carriedProp and DoesEntityExist(carriedProp) then
        DeleteEntity(carriedProp)
        carriedProp = nil
    end
    
    Wait(500) -- Esperar a que termine la animación
    
    -- Cerrar el maletero del camión
    SetVehicleDoorShut(currentVehicle, 5, false)
    
    carryingBag = false
    ClearPedTasksImmediately(playerPed)

    collectedGarbage = collectedGarbage + 1

    if collectedGarbage >= 50 then
        local returnCoords = self.config.Locations.VehicleReturn
        returnBlip = AddBlipForCoord(returnCoords.x, returnCoords.y, returnCoords.z)
        SetBlipSprite(returnBlip, 1)
        SetBlipColour(returnBlip, 4)
        SetBlipRoute(returnBlip, true)
        SetBlipRouteColour(returnBlip, 4)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Devolver Camión")
        EndTextCommandSetBlipName(returnBlip)

        lib.notify({
            title = 'Trabajo Completado',
            description = 'Has recogido 50 bolsas. Vuelve a la central para entregar el camión.',
            type = 'success'
        })
    end

    -- Actualizar HUD inmediatamente
    local earnings = collectedGarbage * GarbageConfig.Payment.PerBag
    local progressPercent = math.min((collectedGarbage / 50) * 100, 100)
    SendNUIMessage({
        action = 'updateHud',
        items = collectedGarbage,
        earnings = earnings,
        progress = progressPercent,
        maxItems = 50
    })

    lib.notify({
        title = 'Basurero',
        description = 'Basura depositada: ' .. collectedGarbage,
        type = 'success'
    })
end

function GarbageJob:CreateReturnPoint()
    local returnCoords = self.config.Locations.VehicleReturn
    
    self.returnPoint = lib.points.new({
        coords = returnCoords,
        distance = 25.0,
    })
    
    function self.returnPoint:onExit()
        MTHideText3D('garbage_return')
    end
    
    function self.returnPoint:nearby()
        DrawMarker(22, returnCoords.x, returnCoords.y, returnCoords.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 255, 165, 0, 100, false, true, 2, false, nil, nil, false)
        
        local dist = #(GetEntityCoords(PlayerPedId()) - returnCoords)
        
        if currentVehicle and IsPedInVehicle(PlayerPedId(), currentVehicle, false) and dist < 4.0 then
            -- Solo permitir si es el conductor (seat -1)
            if GetPedInVehicleSeat(currentVehicle, -1) == PlayerPedId() then
                MTDrawText3D('garbage_return', 'Entregar camión', returnCoords + vector3(0,0,1.0), 'E')
                if IsControlJustPressed(0, 38) then
                    GarbageJob:ReturnVehicle()
                end
            end
        else
            MTHideText3D('garbage_return')
        end
    end
end

function GarbageJob:ReturnVehicle()
    MTHideText3D('garbage_return')
    
    -- Verificar que sea el conductor
    local playerPed = PlayerPedId()
    if currentVehicle and GetPedInVehicleSeat(currentVehicle, -1) ~= playerPed then
        lib.notify({
            title = 'Basurero',
            description = 'Debes estar en el asiento del conductor para entregar el camión',
            type = 'error'
        })
        return
    end
    
    if carryingBag then
        lib.notify({
            title = 'Basurero',
            description = 'No puedes entregar el camión mientras llevas basura',
            type = 'error'
        })
        return
    end
    
    -- Calcular tiempo trabajado
    local workTime = 0
    if workStartTime then
        workTime = math.floor((GetGameTimer() - workStartTime) / 60000) -- minutos
    end
    
    -- Hacer que el jugador salga del vehículo primero
    local playerPed = PlayerPedId()
    if currentVehicle and DoesEntityExist(currentVehicle) and IsPedInVehicle(playerPed, currentVehicle, false) then
        TaskLeaveVehicle(playerPed, currentVehicle, 0)
        Wait(1500) -- Esperar a que salga del vehículo
    end
    
    -- Eliminar el vehículo
    if currentVehicle and DoesEntityExist(currentVehicle) then
        DeleteEntity(currentVehicle)
        currentVehicle = nil
    end
    
    isJobActive = false
    self:HideHUD()
    self:RestoreUniform()
    
    TriggerServerEvent('mt-garbage:returnVehicle', collectedGarbage, workTime)
    
    if returnBlip then
        RemoveBlip(returnBlip)
        returnBlip = nil
    end

    if self.returnPoint then
        self.returnPoint:remove()
        self.returnPoint = nil
    end
    
    collectedGarbage = 0
    collectedProps = {}
    workStartTime = nil
end

function GarbageJob:stop()
    Job.stop(self)
    
    TriggerServerEvent('mt-garbage:cancelJob')
    
    isJobActive = false
    self:HideHUD()
    self:RestoreUniform()
    
    if returnBlip then
        RemoveBlip(returnBlip)
        returnBlip = nil
    end

    if self.returnPoint then
        self.returnPoint:remove()
        self.returnPoint = nil
    end
    if currentVehicle and DoesEntityExist(currentVehicle) then
        DeleteEntity(currentVehicle)
        currentVehicle = nil
    end
    if carriedProp and DoesEntityExist(carriedProp) then
        DeleteEntity(carriedProp)
        carriedProp = nil
    end
    
    collectedProps = {}
    carryingBag = false
    collectedGarbage = 0
    workStartTime = nil
    
    -- Cancelar progressbar activa y limpiar estado del jugador
    if lib.progressActive and lib.progressActive() then lib.cancelProgress() end
    MTHideText3D('garbage_pickup')
    MTHideText3D('garbage_deposit')
    MTHideText3D('garbage_start')
    MTHideText3D('garbage_return')
    local playerPed = PlayerPedId()
    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(playerPed, false)
    
    self:start()
end

-- NUI callbacks centralizados en client/core.lua

RegisterNUICallback('menuOpened', function(data, cb)
    cb('ok')
end)

RegisterJobModule(GarbageConfig.JobName, GarbageJob)

