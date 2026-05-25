
PointService = {}
local points = {}

function PointService.LoadPoints()
    local results = MySQL.query.await('SELECT * FROM mt_bossmenu_points')
    points = {}
    for _, v in ipairs(results) do
        v.coords = json.decode(v.coords)
        v.grades = v.grades and json.decode(v.grades) or {}
        points[v.id] = v
    end
    TriggerClientEvent('mt_bossmenu:client:updatePoints', -1, points)
end

function PointService.GetPoints()
    return points
end

local function ParseCoords(coords)
    if type(coords) == 'table' then return coords end
    if type(coords) == 'string' then
        local x, y, z = string.match(coords, "([^,]+),([^,]+),([^,]+)")
        if x and y and z then
            return { x = tonumber(x), y = tonumber(y), z = tonumber(z) }
        end
    end
    return { x = 0, y = 0, z = 0 }
end

function PointService.CreatePoint(data)
    local coordsTable = ParseCoords(data.coords)
    local id = MySQL.insert.await('INSERT INTO mt_bossmenu_points (name, job, coords, logo, color, grades) VALUES (?, ?, ?, ?, ?, ?)', {
        data.name, data.job, json.encode(coordsTable), data.logo, data.color, json.encode(data.grades or {})
    })
    
    if id then
        PointService.LoadPoints()
        return true
    end
    return false
end

function PointService.UpdatePoint(id, data)
    local coordsTable = ParseCoords(data.coords)
    local affectedRows = MySQL.update.await('UPDATE mt_bossmenu_points SET name = ?, job = ?, coords = ?, logo = ?, color = ?, grades = ? WHERE id = ?', {
        data.name, data.job, json.encode(coordsTable), data.logo, data.color, json.encode(data.grades or {}), id
    })
    
    if affectedRows > 0 then
        PointService.LoadPoints()
        return true
    end
    return false
end

function PointService.DeletePoint(id)
    local affectedRows = MySQL.update.await('DELETE FROM mt_bossmenu_points WHERE id = ?', { id })
    if affectedRows > 0 then
        PointService.LoadPoints()
        return true
    end
    return false
end

-- Initialize points on startup
CreateThread(function()
    Wait(2000)
    PointService.LoadPoints()
end)
