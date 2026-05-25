local nozzleGrabTime = 0
local NOZZLE_COOLDOWN = 15000 -- 15 seconds in ms

-- --- SISTEMA DE TEXTUI ESTILO ORIGEN ---
local activeTextUI = nil

local function ShowText(text, key, coords)
    if activeTextUI == text then return end
    if activeTextUI then
        exports['mt-notify']:DeleteDrawText3D("fuel_interact")
    end
    activeTextUI = text
    
    local pos = coords or GetEntityCoords(PlayerPedId())
    
    exports['mt-notify']:create3DTextUI("fuel_interact", {
        coords = pos,
        text = text,
        key = key or "E",
        type = "textui",
        displayDist = 10.0,
        interactDist = 3.0
    })
end

local function HideText()
    if not activeTextUI then return end
    exports['mt-notify']:DeleteDrawText3D("fuel_interact")
    activeTextUI = nil
end

-- Función para llenar con bidón
local function RefuelFromJerrycan(vehicle)
    local ped = PlayerPedId()
    
    -- Verificar si el bidón tiene gasolina (munición en GTA)
    local ammo = GetAmmoInPedWeapon(ped, `WEAPON_PETROLCAN`)
    if ammo <= 0 then
        lib.notify({ title = 'Combustible', description = 'El bidón está vacío', type = 'error' })
        return
    end

    TaskTurnPedToFaceEntity(ped, vehicle, 1000)
    Wait(500)

    if lib.progressCircle({
        duration = 5000,
        label = "Vaciando bidón...",
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        anim = { 
            dict = 'timetable@gardener@filling_can', 
            clip = 'gar_ig_5_filling_can' 
        },
        disable = { move = true, car = true, combat = true },
    }) then
        -- Añadir gasolina al vehículo (Bidón ahora da 50L)
        exports[GetCurrentResourceName()]:AddFuel('b', 50, vehicle)
        
        -- Eliminar el bidón del inventario (un solo uso)
        TriggerServerEvent('mt-fuel:server:removeJerrycan')
        
        lib.notify({ title = 'Combustible', description = 'Vehículo repostado y bidón desechado', type = 'success' })
    else
        lib.notify({ title = 'Combustible', description = 'Llenado cancelado', type = 'inform' })
    end
end

CreateThread(function()
    local gasPumpModels = {
        `prop_gas_pump_1a`,
        `prop_gas_pump_1b`,
        `prop_gas_pump_1c`,
        `prop_gas_pump_1d`,
        `prop_gas_pump_old2`,
        `prop_gas_pump_old3`,
        `prop_vintage_pump`
    }

    local uiState = nil

    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        
        -- 1. Buscar estación actual (por Polyzone o distancia)
        local stationId, station = GetCurrentStation()
        
        -- 2. Buscar surtidor cercano (opcional)
        local closestPump = nil
        local closestDist = 3.0
        for _, model in ipairs(gasPumpModels) do
            local pump = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, model, false, false, false)
            if pump ~= 0 then
                local pumpCoords = GetEntityCoords(pump)
                local dist = #(coords - pumpCoords)
                if dist < closestDist then
                    closestDist = dist
                    closestPump = pump
                end
            end
        end

        -- 3. Verificar si tiene un bidón en la mano
        local currentWeapon = GetSelectedPedWeapon(ped)
        local hasJerrycan = (currentWeapon == `WEAPON_PETROLCAN`)

        local hasNozzle = exports[GetCurrentResourceName()]:HasNozzle()
        local pendingRefuel = exports[GetCurrentResourceName()]:GetPendingRefuel()

        -- PRIORIDAD 0: Si tiene un BIDÓN en la mano + vehículo cerca
        if hasJerrycan and not hasNozzle then
            local vehicle = lib.getClosestVehicle(coords, 3.0, false)
            if vehicle then
                sleep = 0
                if uiState ~= 'jerrycan' then
                    ShowText('Llenar con Bidón', 'E', GetEntityCoords(vehicle) + vec3(0,0,1.0))
                    uiState = 'jerrycan'
                end

                if IsControlJustPressed(0, 38) then -- E
                    RefuelFromJerrycan(vehicle)
                end
            else
                if uiState == 'jerrycan' then
                    HideText()
                    uiState = nil
                end
            end

        -- PRIORIDAD 1: Si tiene manguera + vehículo cerca + repostaje pendiente → Repostar
        elseif hasNozzle and pendingRefuel then
            sleep = 0
            local vehicle = lib.getClosestVehicle(coords, 4.0, false)

            if vehicle then
                if uiState ~= 'refuel' then
                    ShowText('Iniciar Carga', 'E', GetEntityCoords(vehicle) + vec3(0,0,1.0))
                    uiState = 'refuel'
                end

                if IsControlJustPressed(0, 38) then -- E
                    local success = exports[GetCurrentResourceName()]:CompleteRefueling(vehicle)
                    HideText()
                    uiState = nil
                end
            else
                if uiState == 'refuel' then
                    HideText()
                    uiState = nil
                end
            end

        -- PRIORIDAD 2: Devolver manguera (si hay surtidor o simplemente si la tiene)
        elseif hasNozzle then
            sleep = 0
            local canReturn = (closestPump ~= nil) or (stationId ~= nil)
            
            if canReturn then
                if uiState ~= 'return' then
                    local targetPos = closestPump and GetEntityCoords(closestPump) or coords
                    ShowText('Devolver Manguera', 'E', targetPos + vec3(0,0,1.2))
                    uiState = 'return'
                end

                if IsControlJustPressed(0, 38) then -- E
                    exports[GetCurrentResourceName()]:ReturnNozzle()
                    nozzleGrabTime = 0
                    uiState = nil
                    HideText()
                end
            end

        -- PRIORIDAD 3: Dentro de Estación (Polyzone o cercanía) → Abrir Menú o Coger Manguera
        elseif stationId and not hasNozzle then
            sleep = 0
            if not pendingRefuel then
                if uiState ~= 'config' then
                    local targetPos = closestPump and GetEntityCoords(closestPump) or coords
                    ShowText('Configurar Llenado', 'E', targetPos + vec3(0,0,1.2))
                    uiState = 'config'
                end

                if IsControlJustPressed(0, 38) then -- E
                    local vehicle = lib.getClosestVehicle(coords, 10.0, false)
                    local currentFuel = 0
                    if vehicle then 
                        currentFuel = Entity(vehicle).state.fuel or GetVehicleFuelLevel(vehicle)
                    end
                    
                    if currentFuel >= 99.5 then
                        lib.notify({
                            title = 'Combustible',
                            description = 'El vehículo ya tiene el tanque lleno',
                            type = 'inform'
                        })
                        return
                    end

                    OpenRefuelMenu(stationId, station, vehicle, currentFuel)
                end
            else
                if uiState ~= 'grab' then
                    local targetPos = closestPump and GetEntityCoords(closestPump) or coords
                    if not IsPedInAnyVehicle(ped, false) then
                        ShowText('Tomar Manguera (PAGADA)', 'E', targetPos + vec3(0,0,1.2))
                    else
                        ShowText('Bájate para repostar', '!', targetPos + vec3(0,0,1.2))
                    end
                    uiState = 'grab'
                end

                if IsControlJustPressed(0, 38) and not IsPedInAnyVehicle(ped, false) then -- E
                    exports[GetCurrentResourceName()]:GrabNozzle(closestPump or 0)
                    nozzleGrabTime = GetGameTimer()
                    uiState = nil
                    HideText()
                end
            end

        -- Nada relevante
        else
            if uiState then
                HideText()
                uiState = nil
            end
            sleep = 1000
        end

        Wait(sleep)
    end
end)
