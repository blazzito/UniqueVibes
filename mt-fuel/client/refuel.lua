-- Sistema de repostaje usando polyzones
local refueling = false
local currentStation = nil
local showingTextUI = false

-- Función para obtener la gasolinera actual basada en polyzone
function GetCurrentStation()
    local coords = GetEntityCoords(PlayerPedId())
    local stations = GlobalState.Stations or {}
    
    for id, station in pairs(stations) do
        local inZone = false
        if station.polyzone then
            inZone = exports[GetCurrentResourceName()]:IsPointInZone(coords, station.polyzone)
        end

        if not inZone and station.coords then
            local sCoords = vector3(station.coords.x, station.coords.y, station.coords.z)
            inZone = #(coords - sCoords) < 15.0
        end

        if inZone then
            if station.active then
                return tonumber(id), station
            end
        end
    end
    
    return nil, nil
end

function OpenRefuelMenu(stationId, station, vehicle, currentFuel)
    if not stationId or not station then
        stationId, station = GetCurrentStation()
    end

    refueling = true
    
    SetNuiFocus(true, true)
    
    SendNUIMessage({
        action = 'openFuel',
        data = {
            stationId = stationId,
            currentFuel = currentFuel,
            fuelTypes = Config.Fuels,
            vehicle = vehicle
        }
    })
end

local pendingRefuel = nil

function GetPendingRefuel()
    return pendingRefuel
end

function ClearPendingRefuel()
    pendingRefuel = nil
end

exports('GetPendingRefuel', GetPendingRefuel)
exports('ClearPendingRefuel', ClearPendingRefuel)

function CompleteRefueling(vehicle)
    if not pendingRefuel then return end
    
    local data = pendingRefuel
    local ped = PlayerPedId()

    TaskTurnPedToFaceEntity(ped, vehicle, 1000)
    Wait(500)
    
    if lib.progressCircle({
        duration = data.amount * 500,
        label = "LLenando...",
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        anim = { 
            dict = 'timetable@gardener@filling_can', 
            clip = 'gar_ig_5_filling_can' 
        },
        disable = { move = true, car = true, combat = true },
    }) then
        AddFuel(data.fuelType, data.amount, vehicle)
        lib.notify({
            title = 'Combustible',
            description = 'Carga completada con éxito',
            type = 'success'
        })
        pendingRefuel = nil
        return true
    else
            lib.notify({
                title = 'Combustible',
                description = 'Carga cancelada',
                type = 'error'
            })
            return false
    end
end

exports('CompleteRefueling', CompleteRefueling)

-- Función para obtener el surtidor físico más cercano
local function GetClosestPump()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local pumps = Config.FuelPumps or {}
    
    for _, model in ipairs(pumps) do
        local entity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 5.0, GetHashKey(model), false, false, false)
        if entity ~= 0 then
            return entity
        end
    end
    return nil
end

RegisterNUICallback('payFuel', function(data, cb)
    data.amount = math.ceil(data.amount)
    
    local stationId, station = GetCurrentStation()

    lib.callback('mt-fuel:cb:removeFuel', false, function(response)
        if response.success then
            SendNUIMessage({
                action = 'closeFuel'
            })
            SetNuiFocus(false, false)

            pendingRefuel = {
                fuelType = data.fuelType,
                amount = data.amount,
                stationId = stationId
            }

        else
            lib.notify({
                title = 'Combustible',
                description = response.message,
                type = 'error'
            })
        end
    end, stationId, data.fuelType, data.amount, data.price, data.payType)
    cb({})
end)

RegisterNUICallback('buyJerrycan', function(data, cb)
    local stationId, station = GetCurrentStation()
    lib.callback('mt-fuel:cb:buyJerrycan', false, function(response)
        if response.success then
            lib.notify({
                title = 'Combustible',
                description = response.message,
                type = 'success'
            })
        else
            lib.notify({
                title = 'Combustible',
                description = response.message,
                type = 'error'
            })
        end
    end, stationId, data.price, data.type)
    cb('ok')
end)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    refueling = false
    cb({})
end)
