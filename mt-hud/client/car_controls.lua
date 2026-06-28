-- 
---- Local Variables
--

local windowLeftFrontState   = true  -- 0 -> LF
local windowRightFrontState  = true  -- 1 -> RF
local windowLeftRearState    = true  -- 2 -> LR
local windowRightRearState   = true  -- 3 -> RR

--
---- Commands
--

RegisterCommand('+opencarcontrols', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= 0 then
        local isDriver = (GetPedInVehicleSeat(veh, -1) == ped)
        SendNUIMessage({ 
            action = 'toggleCarControls',
            isDriver = isDriver
        })
    end
end)

RegisterKeyMapping('+opencarcontrols', 'Abrir Controles de Vehiculo', 'keyboard', 'I')

--
---- Callbacks
--

RegisterNUICallback('toggleEngine', function(data, cb)
    toggleEngine()
    cb({})
end)

RegisterNUICallback('toggleFrontHood', function(data, cb)
    toggleFrontHood()
    cb({})
end)

RegisterNUICallback('toggleTrunk', function(data, cb)
    toggleTrunk()
    cb({})
end)

RegisterNUICallback('toggleHeadlights', function(data, cb)
    toggleHeadlights()
    cb({})
end)

RegisterNUICallback('openDoor', function(data, cb)
    openDoor(data.doorIndex)
    cb({})
end)

RegisterNUICallback('openWindow', function(data, cb)
    openWindow(data.windowIndex)
    cb({})
end)

RegisterNUICallback('sitAtSeat', function(data, cb)
    sitAtSeat(data.seatIndex)
    cb({})
end)

RegisterNUICallback('focusOnControls', function(data, cb)
    SetNuiFocus(true, true)
    
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped, false)
        local netId = VehToNet(veh)
        currentRadioVehNetId = netId
        
        local hash = GetEntityModel(veh)
        local display = GetDisplayNameFromVehicleModel(hash)
        local name = GetLabelText(display)
        if name == "NULL" or name == nil or name == "" then name = display end
        
        SendNUIMessage({
            action = "setRadioVehicleName",
            data = name
        })
        
        TriggerServerEvent('unique_carradio:server:requestVehicleState', netId)
        TriggerServerEvent('unique_carradio:server:getPlaylists')
    end
    
    cb({})
end)

RegisterNUICallback('focusOffControls', function(data, cb)
    SetNuiFocus(false, false)
    cb({})
end)

--
---- Car Functions
--

toggleEngine = function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end

toggleFrontHood = function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 then
        if (GetVehicleDoorAngleRatio(vehicle, 4) > 0) then
            SetVehicleDoorShut(vehicle, 4, false)
        else
            SetVehicleDoorOpen(vehicle, 4, false, false)
        end
    end
end

toggleTrunk = function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 then
        if (GetVehicleDoorAngleRatio(vehicle, 5) > 0) then
            SetVehicleDoorShut(vehicle, 5, false)
        else
            SetVehicleDoorOpen(vehicle, 5, false, false)
        end
    end
end

toggleHeadlights = function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 then
        local _, lightsOn, highbeamsOn = GetVehicleLightsState(vehicle)
        
        local isLightsOn = (lightsOn == 1 or lightsOn == true)
        local isHighbeamsOn = (highbeamsOn == 1 or highbeamsOn == true)
        
        if isLightsOn and not isHighbeamsOn then
            -- Low beams are on, turn on high beams
            SetVehicleFullbeam(vehicle, true)
        elseif isHighbeamsOn then
            -- High beams are on, turn everything off
            SetVehicleLights(vehicle, 1) -- Force off
            SetVehicleFullbeam(vehicle, false)
        else
            -- Off, turn on low beams
            SetVehicleLights(vehicle, 2) -- Force on
            SetVehicleFullbeam(vehicle, false)
        end
    end
end

openDoor = function(index)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= nil and vehicle ~= 0 then
        if (GetVehicleDoorAngleRatio(vehicle, index) > 0) then
            SetVehicleDoorShut(vehicle, index, false)
        else
            SetVehicleDoorOpen(vehicle, index, false, false)
        end
    end
end

openWindow = function(index)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= nil and vehicle ~= 0 then
        if (index == 0) then
            if (windowLeftFrontState) then
                RollDownWindow(vehicle, 0)
                windowLeftFrontState = not windowLeftFrontState
            else
                RollUpWindow(vehicle, 0)
                windowLeftFrontState = not windowLeftFrontState
            end
        elseif (index == 1) then
            if (windowRightFrontState) then
                RollDownWindow(vehicle, 1)
                windowRightFrontState = not windowRightFrontState
            else
                RollUpWindow(vehicle, 1)
                windowRightFrontState = not windowRightFrontState
            end
        elseif (index == 2) then
            if (windowLeftRearState) then
                RollDownWindow(vehicle, 2)
                windowLeftRearState = not windowLeftRearState
            else
                RollUpWindow(vehicle, 2)
                windowLeftRearState = not windowLeftRearState
            end
        elseif (index == 3) then
            if (windowRightRearState) then
                RollDownWindow(vehicle, 3)
                windowRightRearState = not windowRightRearState
            else
                RollUpWindow(vehicle, 3)
                windowRightRearState = not windowRightRearState
            end
        end
    end
end

sitAtSeat = function(index)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= nil and vehicle ~= 0 then
        if (IsVehicleSeatFree(vehicle, index)) then
            SetPedIntoVehicle(ped, vehicle, index)
        end
    end
end

--
---- State Loop
--
CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        if vehicle ~= 0 then
            local engineOn = GetIsVehicleEngineRunning(vehicle)
            local _, lightsOn, highbeamsOn = GetVehicleLightsState(vehicle)
            
            local doorStates = {}
            for i = 0, 5 do
                doorStates[i] = GetVehicleDoorAngleRatio(vehicle, i) > 0
            end
            
            local windowStates = {
                [0] = not windowLeftFrontState,
                [1] = not windowRightFrontState,
                [2] = not windowLeftRearState,
                [3] = not windowRightRearState
            }

            SendNUIMessage({
                action = 'updateCarControlsStates',
                data = {
                    engine = engineOn,
                    lights = (lightsOn == 1 or lightsOn == true),
                    highbeams = (highbeamsOn == 1 or highbeamsOn == true),
                    doors = doorStates,
                    windows = windowStates
                }
            })
        else
            Wait(1000)
        end
    end
end)

-- RADIO INTEGRATION NUI CALLBACKS & EVENTS
local currentRadioVehNetId = nil

RegisterNUICallback("play", function(data, cb)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 then
        local netId = VehToNet(veh)
        currentRadioVehNetId = netId
        TriggerServerEvent("unique_carradio:server:playMusic", netId, data.url, data.title, data.thumbnail, data.volume)
    end
    cb("ok")
end)

RegisterNUICallback("playPlaylist", function(data, cb)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 then
        local netId = VehToNet(veh)
        currentRadioVehNetId = netId
        TriggerServerEvent("unique_carradio:server:playPlaylist", netId, data.queue, data.volume)
    end
    cb("ok")
end)

RegisterNUICallback("pause", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:pauseMusic", currentRadioVehNetId) end
    cb("ok")
end)

RegisterNUICallback("resume", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:resumeMusic", currentRadioVehNetId) end
    cb("ok")
end)

RegisterNUICallback("stop", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:stopMusic", currentRadioVehNetId) end
    cb("ok")
end)

RegisterNUICallback("prev", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:prevMusic", currentRadioVehNetId) end
    cb("ok")
end)

RegisterNUICallback("next", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:nextMusic", currentRadioVehNetId) end
    cb("ok")
end)

RegisterNUICallback("toggleLoop", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:toggleLoop", currentRadioVehNetId) end
    cb("ok")
end)

RegisterNUICallback("volume", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:changeVolume", currentRadioVehNetId, data.volume) end
    cb("ok")
end)

RegisterNUICallback("removeFromQueue", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:removeFromQueue", currentRadioVehNetId, data.index) end
    cb("ok")
end)

RegisterNUICallback("skipTo", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:skipTo", currentRadioVehNetId, data.index) end
    cb("ok")
end)

RegisterNUICallback("savePlaylist", function(data, cb)
    TriggerServerEvent("unique_carradio:server:savePlaylist", data.name, data.queue)
    cb("ok")
end)

RegisterNUICallback("deletePlaylist", function(data, cb)
    TriggerServerEvent("unique_carradio:server:deletePlaylist", data.name)
    cb("ok")
end)

RegisterNUICallback("clearQueue", function(data, cb)
    if currentRadioVehNetId then TriggerServerEvent("unique_carradio:server:clearQueue", currentRadioVehNetId) end
    cb("ok")
end)

RegisterNetEvent("unique_carradio:client:updateState", function(vehNetId, radioData)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 and VehToNet(veh) == vehNetId then
        currentRadioVehNetId = vehNetId
        SendNUIMessage({
            action = "updateRadioState",
            data = radioData
        })
    end
end)

RegisterNetEvent("unique_carradio:client:updatePlaylists", function(playlists)
    SendNUIMessage({
        action = "updatePlaylists",
        data = playlists
    })
end)

RegisterNetEvent("unique_carradio:client:stopMusic", function(vehNetId)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 and VehToNet(veh) == vehNetId then
        SendNUIMessage({
            action = "radioStopped"
        })
    end
end)