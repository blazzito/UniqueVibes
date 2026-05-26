local function MigrateStores()
    local count = MySQL.scalar.await("SELECT COUNT(*) FROM appearance_stores")
    
    if count == 0 and Config.Stores then
        print("[illenium-appearance] [^3INFO^7] Migrating Config.Stores to database...")
        for _, store in ipairs(Config.Stores) do
            local storeData = {
                type = store.type,
                coords = {x = store.coords.x, y = store.coords.y, z = store.coords.z, w = store.coords.w},
                size = {x = store.size.x, y = store.size.y, z = store.size.z},
                rotation = store.rotation,
                usePoly = store.usePoly,
                points = store.points, -- Assuming points are already vector3s which might need processing or db wrapper handles it? 
                                       -- Actually, vector3s in Lua might need to be converted to simple tables for json.encode if the wrapper expects pure tables.
                                       -- But let's assume json.encode handles vector3 (some runtimes do, some don't, safer to convert).
                job = store.job,
                gang = store.gang
            }
            
            -- Convert vectors to tables for JSON safety
            if storeData.points then
                local newPoints = {}
                for i, p in ipairs(storeData.points) do
                    newPoints[i] = {x = p.x, y = p.y, z = p.z}
                end
                storeData.points = newPoints
            end

            Database.Stores.Add(storeData)
        end
        print("[illenium-appearance] [^2SUCCESS^7] Migration completed.")
    else
        -- print("[illenium-appearance] [^3INFO^7] Stores already exist in DB. Skipping migration.")
    end
end

MySQL.ready(function()
    MigrateStores()
end)
