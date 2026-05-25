local inVehicle = false
local currentVehicle = nil

local function ResetVehicleHUD()
    inVehicle = false
    currentVehicle = nil
    LocalPlayer.state:set('seatbelt', false, true)
    SendNUIMessage({ action = 'setInVehicle', value = false })
end

local function handleVehicleStates(veh)
    local netId = NetworkGetNetworkIdFromEntity(veh)
    local serverId = GetPlayerServerId(PlayerId())

    AddStateBagChangeHandler('fuel', ('entity:%s'):format(netId), function(_, _, value)
        if inVehicle and currentVehicle == veh then
            SendNUIMessage({ action = 'updateVehicle', data = { fuel = math.floor(value) } })
        end
    end)
end

function StartVehicleLoop()
    CreateThread(function()
        while IsPlayerLoaded() do
            local sleep = 1000
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)

            if veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped then
                sleep = 100
                if not inVehicle then
                    inVehicle = true
                    currentVehicle = veh
                    SendNUIMessage({ action = 'setInVehicle', value = true })
                    handleVehicleStates(veh)
                end

                local speed = GetEntitySpeed(veh) * 3.6
                local gear = GetVehicleCurrentGear(veh)
                local rpm = GetVehicleCurrentRpm(veh)
                local fuel = Entity(veh).state.fuel or GetVehicleFuelLevel(veh)
                local engine = GetVehicleEngineHealth(veh)
                local belted = LocalPlayer.state.seatbelt or false
                
                if not currentMileage then currentMileage = math.random(100, 999) end
                currentMileage = currentMileage + (speed / 36000)

                SendNUIMessage({
                    action = 'updateVehicle',
                    data = {
                        speed = math.floor(speed),
                        fuel = math.floor(fuel),
                        engine = engine,
                        mileage = currentMileage,
                        gear = (gear == 0) and 'R' or gear,
                        rpm = rpm,
                        belted = belted
                    }
                })

                if belted then
                    DisableControlAction(0, 75, true)
                end
            else
                if inVehicle then
                    ResetVehicleHUD()
                end
            end
            Wait(sleep)
        end
    end)
end

RegisterCommand('toggleseatbelt', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local newState = not LocalPlayer.state.seatbelt
        LocalPlayer.state:set('seatbelt', newState, true)
        SendNUIMessage({ action = 'playSound', sound = newState and 'buckle' or 'unbuckle' })
    end
end, false)

RegisterKeyMapping('toggleseatbelt', 'Alternar Cinturón', 'keyboard', 'B')

AddEventHandler('esx:exitedVehicle', function()
    ResetVehicleHUD()
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        ResetVehicleHUD()
    end
end)
