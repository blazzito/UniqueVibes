local function loopConsumption()
    CreateThread(function()
        while cache.seat == -1 do
            if GetIsVehicleEngineRunning(cache.vehicle) then
                local vState = Entity(cache.vehicle).state
                
                if not vState.fuel then
                    TriggerServerEvent('mt-fuel:createStatebag', NetworkGetNetworkIdFromEntity(cache.vehicle), GetVehicleFuelLevel(cache.vehicle))
                    while not vState.fuel do Wait(0) end
                end
                
                local fuel = vState.fuel
                if fuel > 0 then
                    local fuelTank = vState.fuelTank
                    if fuelTank and fuelTank[1] then
                        local fuelType = fuelTank[1].type
                        local fuelConfig = Config.Fuels[fuelType] or Config.Fuels['b']
                        local newFuel = 0
                        local consumption = fuelConfig.consumption

                        -- Consumo base por clase
                        if GetVehicleClass(cache.vehicle) == 15 then -- Helicópteros
                            consumption = consumption * 2.0
                        end

                        -- Aplicar consumo
                        fuelTank[1].amount = math.max(0, fuelTank[1].amount - consumption)

                        -- Si se acaba este tipo de combustible, pasar al siguiente en el tanque
                        if fuelTank[1].amount <= 0 then
                            table.remove(fuelTank, 1)
                        end

                        -- Recalcular total
                        for k, v in pairs(fuelTank) do
                            newFuel = newFuel + v.amount
                        end
                        
                        SetVehicleFuelLevel(cache.vehicle, newFuel + 0.0)

                        -- EFECTOS DE RENDIMIENTO
                        -- 1. Velocidad Punta
                        if GetVehicleTopSpeedModifier(cache.vehicle) ~= fuelConfig.performance then
                            ModifyVehicleTopSpeed(cache.vehicle, fuelConfig.performance)
                        end

                        -- 2. Aceleración (Torque/Power)
                        if fuelConfig.powerMultiplier > 1.0 then
                            SetVehicleCheatPowerIncrease(cache.vehicle, fuelConfig.powerMultiplier)
                        else
                            SetVehicleCheatPowerIncrease(cache.vehicle, 1.0)
                        end

                        vState:set('fuelTank', fuelTank, true)
                        vState:set('fuel', newFuel, true)
                    end
                end
            end

            Wait(1000)
        end
    end)
end

function AddFuel(fType, amount, veh)
    local vehicle = veh or cache.vehicle
    local vState = Entity(vehicle).state
    local currentFuel = vState.fuel or 0
    local fuelTank = vState.fuelTank or {}
    
    local canAdd = 100.0 - currentFuel
    if canAdd <= 0 then 
        lib.notify({ title = 'Combustible', description = 'El tanque ya está lleno', type = 'error' })
        return 
    end
    
    local actualAmount = amount
    if actualAmount > canAdd then
        actualAmount = canAdd
    end

    table.insert(fuelTank, {
        type = fType,
        amount = actualAmount
    })

    local finalFuel = currentFuel + actualAmount
    SetVehicleFuelLevel(vehicle, finalFuel + 0.0)

    vState:set('fuelTank', fuelTank, true)
    vState:set('fuel', finalFuel, true)

    lib.notify({
        title = 'Combustible',
        description = 'Se cargaron: ' .. math.floor(actualAmount) .. 'L de ' .. (Config.Fuels[fType] and Config.Fuels[fType].label or "Combustible"),
        type = 'success'
    })
end

lib.onCache('seat', function(seat)
    if seat == -1 then
        loopConsumption()
    end
end)

function SetFuel(veh, data)
    local vState = Entity(veh).state
    local fuel = math.min(100.0, data.fuel or 0)
    local fuelTank = data.fuelTank or {}
    SetVehicleFuelLevel(veh, fuel + 0.0)
    vState:set('fuelTank', fuelTank, true)
    vState:set('fuel', fuel, true)
end

function CompleteFuel(veh)
    local vState = Entity(veh).state
    local fuel = vState.fuel or 0
    local fuelTank = vState.fuelTank or {}
    local toAdd = 100 - fuel
    if toAdd > 0 then
        table.insert(fuelTank, { type = 'b', amount = toAdd })
        SetVehicleFuelLevel(veh, 100.0)
        vState:set('fuelTank', fuelTank, true)
        vState:set('fuel', 100, true)
    end
end

function GetFuel(veh)
    local vState = Entity(veh).state
    return {
        fuel = vState.fuel or 0,
        fuelTank = vState.fuelTank or {}
    }
end

exports('AddFuel', AddFuel)
exports('GetFuel', GetFuel)
exports('SetFuel', SetFuel)
exports('CompleteFuel', CompleteFuel)
