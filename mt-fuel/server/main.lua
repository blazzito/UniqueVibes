local stations = {}

---@diagnostic disable-next-line: undefined-global
local Config = Config

-- Inicialización de la Base de Datos
CreateThread(function()
    -- Esperar a que oxmysql esté listo y la variable MySQL exista
    while GetResourceState('oxmysql') ~= 'started' do Wait(100) end
    while not MySQL do Wait(100) end
    Wait(500) -- Medio segundo extra por seguridad
    
    -- Crear tabla si no existe
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `mt_fuel_stations` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `name` VARCHAR(100) DEFAULT 'Gasolinera',
            `coords` LONGTEXT NOT NULL,
            `polyzone` LONGTEXT DEFAULT NULL,
            `stock` LONGTEXT NOT NULL,
            `prices` LONGTEXT NOT NULL,
            `active` TINYINT(1) DEFAULT 1
        )
    ]], {}, function()
        -- Cargar estaciones
        MySQL.query('SELECT * FROM mt_fuel_stations', {}, function(result)
            if result and #result > 0 then
                stations = {}
                for _, v in ipairs(result) do
                    local id = tonumber(v.id)
                    stations[id] = {
                        id = id,
                        name = v.name,
                        coords = json.decode(v.coords),
                        polyzone = v.polyzone and json.decode(v.polyzone) or nil,
                        stock = json.decode(v.stock),
                        prices = json.decode(v.prices),
                        active = (v.active ~= 0) -- Si no es 0, está activa por defecto
                    }
                end
                GlobalState.Stations = json.decode(json.encode(stations))
            else
                -- Importar desde Config si está vacía
                for id, data in pairs(Config.Stations) do
                    local coords = json.encode(data.coords)
                    local stock = json.encode(data.stock or {a=3000, b=3000, c=3000})
                    local prices = json.encode(data.prices or {a=1.0, b=2.0, c=3.0})
                    
                    MySQL.insert('INSERT INTO mt_fuel_stations (name, coords, stock, prices, active) VALUES (?, ?, ?, ?, ?)',
                    {data.name or "Gasolinera", coords, stock, prices, 1}, function(newId)
                        stations[newId] = {
                            id = newId,
                            name = data.name or "Gasolinera",
                            coords = data.coords,
                            stock = data.stock or {a=3000, b=3000, c=3000},
                            prices = data.prices or {a=1.0, b=2.0, c=3.0},
                            active = true
                        }
                    end)
                end
            end
            GlobalState.Stations = stations
        end)
    end)
end)

local function saveStationDB(id)
    local s = stations[id]
    if not s then return end
    
    local activeInt = (s.active == true or s.active == 1) and 1 or 0
    local polyzoneData = s.polyzone and json.encode(s.polyzone) or nil


    MySQL.update('UPDATE mt_fuel_stations SET name = ?, coords = ?, polyzone = ?, stock = ?, prices = ?, active = ? WHERE id = ?',
    {
        s.name, 
        json.encode(s.coords), 
        polyzoneData, 
        json.encode(s.stock), 
        json.encode(s.prices), 
        activeInt, 
        id
    }, function(affectedRows)
        if affectedRows > 0 then
            GlobalState.Stations = json.decode(json.encode(stations)) -- Forzar actualización de estado
            TriggerClientEvent('mt-fuel:client:refreshBlips', -1)
        else
        end
    end)
end

-- Función para formatear estaciones para la UI
local function formatStationsForUI()
    local formatted = {}
    local keys = {}
    for k in pairs(stations) do table.insert(keys, k) end
    table.sort(keys)

    for _, id in ipairs(keys) do
        local station = stations[id]
        if station then
            local s = {}
            s.id = tonumber(id)
            s.name = station.name or "Gasolinera"
            s.active = (station.active ~= false)
            
            s.coords = {
                x = tonumber(station.coords.x) or 0.0,
                y = tonumber(station.coords.y) or 0.0,
                z = tonumber(station.coords.z) or 0.0
            }

            s.stock = {
                ['a'] = tonumber(station.stock and (station.stock['a'] or station.stock['A'])) or 0,
                ['b'] = tonumber(station.stock and (station.stock['b'] or station.stock['B'])) or 0,
                ['c'] = tonumber(station.stock and (station.stock['c'] or station.stock['C'])) or 0,
                ['A'] = tonumber(station.stock and (station.stock['a'] or station.stock['A'])) or 0,
                ['B'] = tonumber(station.stock and (station.stock['b'] or station.stock['B'])) or 0,
                ['C'] = tonumber(station.stock and (station.stock['c'] or station.stock['C'])) or 0
            }
            
            s.prices = {
                ['a'] = tonumber(station.prices and (station.prices['a'] or station.prices['A'])) or 1.0,
                ['b'] = tonumber(station.prices and (station.prices['b'] or station.prices['B'])) or 1.0,
                ['c'] = tonumber(station.prices and (station.prices['c'] or station.prices['C'])) or 1.0,
                ['A'] = tonumber(station.prices and (station.prices['a'] or station.prices['A'])) or 1.0,
                ['B'] = tonumber(station.prices and (station.prices['b'] or station.prices['B'])) or 1.0,
                ['C'] = tonumber(station.prices and (station.prices['c'] or station.prices['C'])) or 1.0
            }

            s.polyzone = station.polyzone or nil
            table.insert(formatted, s)
        end
    end
    return formatted
end

-- Callbacks
lib.callback.register('mt-fuel:cb:isAdmin', function(source)
    return Framework.HasPermission(source, 'admin')
end)

lib.callback.register('mt-fuel:cb:getStations', function(source)
    return {
        success = true,
        stations = formatStationsForUI()
    }
end)

lib.callback.register('mt-fuel:cb:removeFuel', function(source, stationId, fuelType, amount, price, payType)
    local player = Framework.GetPlayer(source)
    if not player then return { success = false, message = "Jugador no encontrado" } end

    local id = tonumber(stationId)
    local station = stations[id]
    if not station or not station.active then return { success = false, message = "Gasolinera no operativa" } end

    local fuel = string.lower(fuelType)
    local currentStock = tonumber(station.stock[fuel] or station.stock[string.upper(fuel)]) or 0
    
    if currentStock < amount then return { success = false, message = "Sin stock" } end

    local totalPrice = math.ceil(price)
    local moneyType = payType == 'cash' and 'cash' or 'bank'
    
    if Framework.GetPlayerMoney(source, moneyType) < totalPrice then
        return { success = false, message = "Dinero insuficiente" }
    end

    if Framework.RemoveMoney(source, moneyType, totalPrice, "Fuel Purchase") then
        if station.stock[fuel] then
            station.stock[fuel] = station.stock[fuel] - amount
        else
            station.stock[string.upper(fuel)] = station.stock[string.upper(fuel)] - amount
        end
        saveStationDB(id)
        return { success = true }
    end
    return { success = false, message = "Error en pago" }
end)

lib.callback.register('mt-fuel:cb:buyJerrycan', function(source, stationId, price, payType)
    local src = source
    local id = tonumber(stationId)
    if not stations[id] then return { success = false, message = "No estás en una gasolinera" } end
    
    local success = Framework.RemoveMoney(src, payType, price)
    if success then
        -- Usar ox_inventory para dar el bidón
        if GetResourceState('ox_inventory') == 'started' then
            -- Intentar dar un bidón lleno
            exports.ox_inventory:AddItem(src, 'WEAPON_PETROLCAN', 1, {ammo = 4500})
            return { success = true, message = "Has comprado un bidón de gasolina" }
        else
            -- Fallback si no hay ox_inventory
            return { success = false, message = "Error: ox_inventory no está iniciado" }
        end
    else
        return { success = false, message = "No tienes suficiente dinero" }
    end
end)

-- Admin Callbacks
lib.callback.register('mt-fuel:cb:addFuelAdmin', function(source, stationId, fuelType, amount)
    local id = tonumber(stationId)
    if not stations[id] then return { success = false } end
    stations[id].stock[fuelType] = (stations[id].stock[fuelType] or 0) + amount
    saveStationDB(id)
    return { success = true }
end)

lib.callback.register('mt-fuel:cb:removeFuelAdmin', function(source, stationId, fuelType, amount)
    local id = tonumber(stationId)
    if not stations[id] then return { success = false } end
    stations[id].stock[fuelType] = math.max(0, (stations[id].stock[fuelType] or 0) - amount)
    saveStationDB(id)
    return { success = true }
end)

RegisterNetEvent('mt-fuel:server:createStation', function(data)
    local src = source
    local coords = data.coords
    local stock = data.data and data.data.stock or {a=15000, b=15000, c=15000}
    local prices = data.data and data.data.prices or {a=1.0, b=1.0, c=1.0}
    local polyzone = data.data and data.data.polyzone or nil


    MySQL.insert('INSERT INTO mt_fuel_stations (name, coords, stock, prices, active, polyzone) VALUES (?, ?, ?, ?, ?, ?)',
    {
        data.name or "Gasolinera", 
        json.encode(coords), 
        json.encode(stock), 
        json.encode(prices), 
        1,
        polyzone and json.encode(polyzone) or nil
    }, function(newId)
        if newId then
            stations[newId] = {
                id = newId,
                name = data.name or "Gasolinera",
                coords = coords,
                stock = stock,
                prices = prices,
                active = true,
                polyzone = polyzone
            }
            GlobalState.Stations = json.decode(json.encode(stations))
            TriggerClientEvent('mt-fuel:client:refreshBlips', -1)
        end
    end)
end)

RegisterNetEvent('mt-fuel:server:updateStation', function(stationId, data)
    local src = source
    local id = tonumber(stationId)
    if not stations[id] then 
        return 
    end
    
    
    if data.name then stations[id].name = data.name end
    if data.prices then stations[id].prices = data.prices end
    if data.stock then stations[id].stock = data.stock end
    if data.polyzone ~= nil then stations[id].polyzone = data.polyzone end
    if data.active ~= nil then 
        stations[id].active = (data.active == true or data.active == 1) 
    end
    
    saveStationDB(id)
end)

lib.callback.register('mt-fuel:cb:deleteStation', function(source, stationId)
    local id = tonumber(stationId)
    MySQL.update('DELETE FROM mt_fuel_stations WHERE id = ?', {id})
    stations[id] = nil
    GlobalState.Stations = json.decode(json.encode(stations))
    return { success = true }
end)

lib.callback.register('mt-fuel:cb:getStations', function(source)
    return { success = true, stations = formatStationsForUI() }
end)

lib.callback.register('mt-fuel:cb:setStationPrice', function(source, stationId, fuelType, price)
    local id = tonumber(stationId)
    if not stations[id] then return { success = false } end
    stations[id].prices[fuelType] = price
    saveStationDB(id)
    return { success = true }
end)

lib.callback.register('mt-fuel:cb:toggleStationActive', function(source, stationId, active)
    local id = tonumber(stationId)
    if not stations[id] then return { success = false } end
    stations[id].active = (active == true or active == 1)
    saveStationDB(id)
    return { success = true, stations = formatStationsForUI() }
end)

lib.callback.register('mt-fuel:cb:refillAllStations', function(source)
    for id, station in pairs(stations) do
        station.stock['a'] = 15000
        station.stock['b'] = 15000
        station.stock['c'] = 15000
        station.stock['A'] = 15000
        station.stock['B'] = 15000
        station.stock['C'] = 15000
        saveStationDB(id)
    end
    GlobalState.Stations = stations -- Sincronización forzada
    return { success = true, stations = formatStationsForUI() }
end)

RegisterNetEvent('mt-fuel:createStatebag', function(netId, fuel)
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if not vehicle or vehicle == 0 then return end
    local state = Entity(vehicle).state
    if state.fuel then return end
    state:set('fuel', fuel, true)
    state:set('fuelTank', {{type = 'b', amount = fuel}}, true)
end)

RegisterNetEvent('mt-fuel:server:removeJerrycan', function()
    local src = source
    if GetResourceState('ox_inventory') == 'started' then
        exports.ox_inventory:RemoveItem(src, 'WEAPON_PETROLCAN', 1)
    end
end)
