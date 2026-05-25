local markers = {}

-- Load markers from DB on startup
MySQL.ready(function()
    -- Create table if not exists
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `mt_waypoint` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `type` VARCHAR(50) NOT NULL DEFAULT 'checkpoint',
            `coords` LONGTEXT NOT NULL,
            `label` VARCHAR(255) DEFAULT NULL,
            `size` FLOAT DEFAULT 1.0,
            `drawDistance` FLOAT DEFAULT 500.0
        )
    ]], {}, function()
        -- Load markers
        MySQL.query('SELECT * FROM mt_waypoint', {}, function(result)
            if result then
                for i = 1, #result do
                    local row = result[i]
                    local coords = json.decode(row.coords)
                    row.coords = vector3(coords.x, coords.y, coords.z)
                    markers[row.id] = row
                end
                print('^2[MT Waypoints] ^7Loaded ' .. #result .. ' markers from database.')
            end
        end)
    end)
end)

-- Send active markers to player when they join
RegisterNetEvent('mt-waypoint:server:requestMarkers', function()
    local src = source
    TriggerClientEvent('mt-waypoint:client:loadMarkers', src, markers)
end)

-- Global Create Marker
RegisterNetEvent('mt-waypoint:server:createMarker', function(data)
    local src = source
    -- Logic to save in DB
    local coordsJson = json.encode({x = data.coords.x, y = data.coords.y, z = data.coords.z})
    
    MySQL.insert('INSERT INTO mt_waypoint (type, coords, label, size, drawDistance) VALUES (?, ?, ?, ?, ?)', {
        data.type or 'checkpoint',
        coordsJson,
        data.label or 'Punto de control',
        data.size or 1.0,
        data.drawDistance or 500.0
    }, function(id)
        if id then
            data.id = id
            markers[id] = data
            TriggerClientEvent('mt-waypoint:client:createMarker', -1, data)
        end
    end)
end)

-- Global Remove Marker
RegisterNetEvent('mt-waypoint:server:removeMarker', function(id)
    if markers[id] then
        MySQL.query('DELETE FROM mt_waypoint WHERE id = ?', {id})
        markers[id] = nil
        TriggerClientEvent('mt-waypoint:client:removeMarker', -1, id)
    end
end)

-- Global Clear All (Admin only recommended, but here for functionality)
RegisterNetEvent('mt-waypoint:server:clearAll', function()
    MySQL.query('TRUNCATE TABLE mt_waypoint')
    markers = {}
    TriggerClientEvent('mt-waypoint:client:clearAll', -1)
end)

-- Exports for other server-side scripts
exports('Create', function(data)
    local coordsJson = json.encode({x = data.coords.x, y = data.coords.y, z = data.coords.z})
    local id = MySQL.insert.await('INSERT INTO mt_waypoint (type, coords, label, size, drawDistance) VALUES (?, ?, ?, ?, ?)', {
        data.type or 'checkpoint',
        coordsJson,
        data.label or 'Punto de control',
        data.size or 1.0,
        data.drawDistance or 500.0
    })
    if id then
        data.id = id
        markers[id] = data
        TriggerClientEvent('mt-waypoint:client:createMarker', -1, data)
        return id
    end
end)

exports('Remove', function(id)
    if markers[id] then
        MySQL.query('DELETE FROM mt_waypoint WHERE id = ?', {id})
        markers[id] = nil
        TriggerClientEvent('mt-waypoint:client:removeMarker', -1, id)
        return true
    end
    return false
end)
