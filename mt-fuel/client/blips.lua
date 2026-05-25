local blips = {}

local function createBlips()
    -- Eliminar blips existentes
    for _, blip in pairs(blips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    blips = {}

    local stations = GlobalState.Stations or {}
    
    for id, station in pairs(stations) do
        if station.coords and (station.active == true or station.active == 1) then
            -- Asegurar que las coordenadas sean números
            local x = tonumber(station.coords.x)
            local y = tonumber(station.coords.y)
            local z = tonumber(station.coords.z)

            if x and y and z then
                local blip = AddBlipForCoord(x, y, z)
                SetBlipSprite(blip, 361)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.6)
                SetBlipColour(blip, 1) -- Rojo
                SetBlipAsShortRange(blip, true)
                
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(station.name or "Gasolinera")
                EndTextCommandSetBlipName(blip)
                
                table.insert(blips, blip)
            else
            end
        end
    end
end

-- Actualizar cuando cambie GlobalState.Stations
AddStateBagChangeHandler('Stations', 'global', function(bagName, key, value, _unused, replicated)
    createBlips()
end)

RegisterNetEvent('mt-fuel:client:refreshBlips', function()
    createBlips()
end)

-- Crear blips al iniciar el recurso
CreateThread(function()
    Wait(2000)
    createBlips()
end)
