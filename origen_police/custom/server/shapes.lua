-- Framework is already initialized in custom/framework/server/ scripts


Citizen.CreateThread(function()
    -- Ensure columns exist in origen_police_shapes
    pcall(function()
        MySQL.awaitQuery("ALTER TABLE `origen_police_shapes` ADD COLUMN `operation_id` INT(11) DEFAULT 0", {})
    end)
    pcall(function()
        MySQL.awaitQuery("ALTER TABLE `origen_police_shapes` ADD COLUMN `divisions` TEXT DEFAULT '[]'", {})
    end)

    -- Ensure origen_police_operations table exists
    MySQL.awaitQuery([[
        CREATE TABLE IF NOT EXISTS `origen_police_operations` (
            `id` INT(11) NOT NULL AUTO_INCREMENT,
            `title` VARCHAR(255) NOT NULL,
            `divisions` TEXT NOT NULL DEFAULT '[]',
            PRIMARY KEY (`id`)
        )
    ]], {})
end)

FW_CreateCallback('origen_police:callback:GetShapes', function(source, cb)
    local shapes = MySQL.awaitQuery("SELECT * FROM origen_police_shapes", {})
    local operations = MySQL.awaitQuery("SELECT * FROM origen_police_operations", {})
    
    local shapesResult = {}
    if shapes then
        for _, v in pairs(shapes) do
            v.data = json.decode(v.data or '{}')
            v.divisions = json.decode(v.divisions or '[]')
            shapesResult[tostring(v.id)] = v
        end
    end

    local operationsResult = {}
    if operations then
        for _, v in pairs(operations) do
            v.divisions = json.decode(v.divisions or '[]')
            operationsResult[tostring(v.id)] = v
        end
    end

    cb({
        shapes = shapesResult,
        operations = operationsResult
    })
end)

FW_CreateCallback('origen_police:callback:UpdateOperations', function(source, cb, data)
    local action = data.action
    if action == 'create' then
        local id = MySQL.awaitInsert("INSERT INTO origen_police_operations (title, divisions) VALUES (?, ?)", {
            data.operation.title,
            json.encode(data.operation.divisions)
        })
        cb(id)
    elseif action == 'delete' then
        MySQL.awaitQuery("DELETE FROM origen_police_operations WHERE id = ?", {data.id})
        MySQL.awaitQuery("DELETE FROM origen_police_shapes WHERE operation_id = ?", {data.id})
        cb(true)
    elseif action == 'update' then
        MySQL.awaitQuery("UPDATE origen_police_operations SET divisions = ? WHERE id = ?", {
            json.encode(data.divisions),
            data.id
        })
        cb(true)
    end
end)

FW_CreateCallback('origen_police:callback:UpdateShapes', function(source, cb, data)
    local action = data.action
    if action == 'create' then
        local shape = data.shape
        local id = MySQL.awaitInsert("INSERT INTO origen_police_shapes (type, title, data, radius, operation_id, divisions) VALUES (?, ?, ?, ?, ?, ?)", {
            shape.type,
            shape.title,
            json.encode(shape.data),
            shape.radius,
            shape.operation_id or 0,
            json.encode(shape.divisions or {})
        })
        cb(id)
    elseif action == 'delete' then
        MySQL.awaitQuery("DELETE FROM origen_police_shapes WHERE id = ?", {data.id})
        cb(true)
    end
end)
