Database.Stores = {}

function Database.Stores.GetAll()
    local success, result = pcall(MySQL.query.await, "SELECT * FROM appearance_stores")
    if not success then
        print("[illenium-appearance] [SERVER] [ERROR] Failed to fetch stores from database: " .. tostring(result))
        return {}
    end
    for i = 1, #result do
        if result[i].coords then result[i].coords = json.decode(result[i].coords) end
        if result[i].size then result[i].size = json.decode(result[i].size) end
        if result[i].points then result[i].points = json.decode(result[i].points) end
    end
    return result
end

function Database.Stores.Add(storeData)
    local points = storeData.points and json.encode(storeData.points) or nil
    local coords = json.encode(storeData.coords)
    local size = json.encode(storeData.size)
    
    return MySQL.insert.await("INSERT INTO appearance_stores (type, coords, size, rotation, usePoly, points, job, gang, avatar, showBlip, cost) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", {
        storeData.type,
        coords,
        size,
        storeData.rotation,
        storeData.usePoly,
        points,
        storeData.job,
        storeData.gang,
        storeData.avatar,
        storeData.showBlip,
        storeData.cost
    })
end

function Database.Stores.Update(id, storeData)
    local points = storeData.points and json.encode(storeData.points) or nil
    local coords = json.encode(storeData.coords)
    local size = json.encode(storeData.size)
    
    return MySQL.update.await("UPDATE appearance_stores SET type = ?, coords = ?, size = ?, rotation = ?, usePoly = ?, points = ?, job = ?, gang = ?, avatar = ?, showBlip = ?, cost = ? WHERE id = ?", {
        storeData.type,
        coords,
        size,
        storeData.rotation,
        storeData.usePoly,
        points,
        storeData.job,
        storeData.gang,
        storeData.avatar,
        storeData.showBlip,
        storeData.cost,
        id
    })
end

function Database.Stores.DeleteByID(id)
    return MySQL.query.await("DELETE FROM appearance_stores WHERE id = ?", {id})
end
