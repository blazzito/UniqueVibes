-- Helper to broadcast store updates
local function BroadcastStoreUpdate(action, storeData)
    TriggerClientEvent("illenium-appearance:client:storeUpdate", -1, action, storeData)
end

lib.callback.register("illenium-appearance:server:getStores", function(source)
    return Database.Stores.GetAll()
end)

lib.callback.register("illenium-appearance:server:isAdmin", function(source)
    return Framework.CheckPlayerHasPermission(source, "admin")
end)

RegisterNetEvent("illenium-appearance:server:addStore", function(storeData)
    local src = source
    if not Framework.CheckPlayerHasPermission(src, "admin") then return end

    local id = Database.Stores.Add(storeData)
    if id then
        storeData.id = id
        BroadcastStoreUpdate("add", storeData)
        lib.notify(src, {title = "Store Added", type = "success"})
    end
end)

RegisterNetEvent("illenium-appearance:server:updateStore", function(id, storeData)
    local src = source
    if not Framework.CheckPlayerHasPermission(src, "admin") then return end

    Database.Stores.Update(id, storeData)
    storeData.id = id
    BroadcastStoreUpdate("update", storeData)
    lib.notify(src, {title = "Store Updated", type = "success"})
end)

RegisterNetEvent("illenium-appearance:server:deleteStore", function(id)
    local src = source
    if not Framework.CheckPlayerHasPermission(src, "admin") then return end

    Database.Stores.DeleteByID(id)
    BroadcastStoreUpdate("delete", {id = id})
    lib.notify(src, {title = "Store Deleted", type = "success"})
end)
