Citizen.CreateThread(function ()
    while true do
        if  Config.Inventory ~= "qb-inventory" and 
            Config.Inventory ~= "origen_inventory" and 
            Config.Inventory ~= "ls-inventory" and
            Config.Inventory ~= "tgiann-inventory"
        then break end
        Wait(10000)
        local time = os.date("*t")

        if time.hour == 23 then
            MySQL.query('DELETE FROM stashitems WHERE stash LIKE "armas_policiales%"')
            print('SAPD - Armouty inventory deleted')
            break
        end
    end
    if GetResourceState("ox_inventory") ~= "started" then return end

    for mapIndex, _ in pairs(Tables.Markers) do
        exports.ox_inventory:RegisterStash('armas_policiales_'..mapIndex, Config.Translations['Equipment'], 100, 100*1000, true)
    end
    exports.ox_inventory:RegisterStash('OrigenPersonalStash', Config.Translations['Equipment'], 100, 100*1000, true)
end)

function LeaveTakePertenences(station, source)
    local Player = FW_GetPlayer(source)
    if Config.Inventory == "ox_inventory" or Config.Inventory == "qs-inventory" or Config.Inventory == "codem-inventory" or Config.Inventory == "new-qb-inventory" or Config.Inventory == "origen_inventory" then
        if Player.PlayerData.metadata["pertenencesSaved"] and type(Player.PlayerData.metadata["pertenencesSaved"]) == "table" then
            for k, v in pairs(Player.PlayerData.metadata["pertenencesSaved"]) do
                AddItemToPlayer(Player.Functions.AddItem, source, v.name, v.count, k, v.metadata)
            end
            Player.Functions.SetMetaData("pertenencesSaved", 0)
            TriggerClientEvent("origen_police:ShowNotification", source, Config.Translations.PertenencesPickUp)
        else
            if #Player.PlayerData.items == 0 then
                return
            end
            local itemsToSave = {}
            for _, v in pairs(Player.PlayerData.items) do
                if not v then return end
                itemsToSave[v.slot] = {
                    name = v.name,
                    count = Config.Inventory == "ox_inventory" and v.count or v.amount,
                    metadata = Config.Inventory == "ox_inventory" and v.metadata or v.info
                }
            end
            Player.Functions.SetMetaData("pertenencesSaved", itemsToSave)
            if Config.Inventory == "qs-inventory" then
                exports['qs-inventory']:ClearInventory(source)
            elseif Config.Inventory == "tgiann-inventory" then
                exports["tgiann-inventory"]:ClearInventory(source)
            else
                Player.Functions.ClearInventory()
            end
            TriggerClientEvent("origen_police:ShowNotification", source, Config.Translations.LeavePertenences)
        end
        return
    end

    local stashID = (Config.Framework == "esx" and string.match(Player.PlayerData.citizenid, ":(.*)") or Player.PlayerData.citizenid) .. "_police_station_" .. station
    local stash = nil
    if Config.Inventory == "tgiann-inventory" then
        local stashItems = exports["tgiann-inventory"]:GetSecondaryInventoryItems("stash", stashID) or {}
        local itemsArray = {}
        for _, item in pairs(stashItems) do
            item.item = item.item or item.name or item.label
            itemsArray[#itemsArray+1] = item
        end
        stash = itemsArray
    elseif Config.Inventory == "new-qb-inventory" then
        stash = exports["qb-inventory"]:GetStashItems(stashID)
    else
        stash = exports[Config.Inventory]:GetStashItems(stashID)
    end
    local has = #stash > 0

    if has then
        Player.Functions.ClearInventory()
        for _, v in pairs(stash) do
            AddItemToPlayer(Player.Functions.AddItem, source, v.name, v.amount, v.slot, v.info)
        end
        TriggerEvent(Config.Inventory .. ":server:SaveStashItems", stashID, {})
        TriggerClientEvent("origen_police:ShowNotification", source, Config.Translations.PertenencesPickUp)
    else
        local playerItems = Player.PlayerData.items
        TriggerEvent(Config.Inventory .. ":server:SaveStashItems", stashID, playerItems)
        Player.Functions.ClearInventory()
        TriggerClientEvent("origen_police:ShowNotification", source, Config.Translations.LeavePertenences)
    end
end

function GetTrunkItems(plate)
    if Config.Inventory == "qs-inventory" then
        local data = MySQL.awaitQuery("SELECT items FROM inventory_trunk WHERE plate = ? LIMIT 1", {plate})
        if data[1] == nil then return nil end
        return json.decode(data[1].items)
    elseif Config.Inventory == "ox_inventory" then
        return exports['ox_inventory']:GetInventoryItems('trunk'..plate)
    elseif Config.Inventory == "codem-inventory" then
        local data = MySQL.awaitQuery("SELECT trunk FROM codem_new_vehicleandglovebox WHERE plate = ?", {plate})

        if data[1] == nil then return nil end
        return json.decode(data[1].trunk)
    elseif Config.Inventory == "origen_inventory" then
        local trunk = exports["origen_inventory"]:GetInventory(plate, 'trunk')
        return trunk and trunk.inventory or nil
    elseif Config.Inventory == "new-qb-inventory" then
        return exports['qb-inventory']:GetInventory("trunk-"..plate)
    elseif Config.Inventory == "tgiann-inventory" then
        local trunkItems = exports["tgiann-inventory"]:GetSecondaryInventoryItems("trunk", plate) or {}
        local itemsArray = {}
        for _, item in pairs(trunkItems) do
            item.item = item.item or item.name or item.label
            itemsArray[#itemsArray+1] = item
        end
        return itemsArray
    elseif Config.Inventory == "qb-inventory" then
        return exports["qb-inventory"]:GetTrunk(plate)
    end

    print("No supported inventory found for trunk items")
    return {}
end

function GetGloveboxItems(plate)
    if Config.Inventory == "qs-inventory" then
        local data = MySQL.awaitQuery("SELECT items FROM inventory_glovebox WHERE plate = ? LIMIT 1", {plate})
        if data[1] == nil then return nil end
        return json.decode(data[1].items)
    elseif Config.Inventory == "ox_inventory" then
        return exports['ox_inventory']:GetInventoryItems('glove'..plate)
    elseif Config.Inventory == "codem-inventory" then
        local data = MySQL.awaitQuery("SELECT glovebox FROM codem_new_vehicleandglovebox WHERE plate = ?", {plate})
        if data[1] == nil then return nil end
        return json.decode(data[1].glovebox)
    elseif Config.Inventory == "origen_inventory" then
        local glovebox = exports["origen_inventory"]:GetInventory(plate, 'glovebox')
        return glovebox and glovebox.inventory or nil
    elseif Config.Inventory == "new-qb-inventory" then
        return exports['qb-inventory']:GetInventory("glovebox-"..plate)
    elseif Config.Inventory == "tgiann-inventory" then
        local gloveItems = exports["tgiann-inventory"]:GetSecondaryInventoryItems("glovebox", plate) or {}
        local itemsArray = {}
        for _, item in pairs(gloveItems) do
            item.item = item.item or item.name or item.label
            itemsArray[#itemsArray+1] = item
        end
        return itemsArray
    elseif Config.Inventory == "qb-inventory" then
        return exports["qb-inventory"]:GetGlovebox(plate)
    end

    print("No supported inventory found for glovebox items")
    return {}
end

function RemoveItem(xPlayer, name, amount, slot)
    if Config.Inventory == "origen_inventory" then
        return exports.origen_inventory:RemoveItem(xPlayer.source, name, amount)
    elseif Config.Inventory == "ox_inventory" then
        return exports.ox_inventory:RemoveItem(xPlayer.source, name, amount, nil, slot)
    end
    return xPlayer.removeInventoryItem(name, amount, slot)
end

function GetItemFromSlot(xPlayer, slot)
    if Config.Inventory == "origen_inventory" then
        return exports.origen_inventory:GetItemBySlot(xPlayer.source, slot)
    elseif Config.Inventory == "core_inventory" then
        return exports['core_inventory']:getInventory('primary-' .. (Config.Framework == "esx" and xPlayer.citizenid:gsub(':','') or xPlayer.citizenid))[1]
    end
    for _, v in pairs(xPlayer.items) do
        if v.slot == slot then
            return v
        end
    end
end

local ArmouryRegistered = false

FW_CreateCallback("origen_police:server:OpenPoliceArmoury", function(source, cb, data)
    if not CanOpenTablet(source)[2] then -- Don't allow to open the stash if the player don't have a valid job(config/permissions.lua)
        return cb(false)
    end
    local id = "origen_police_armoury"
    if Config.Inventory == "core_inventory" then
        exports['core_inventory']:clearInventory(id)

        for _, v in pairs(Config.Armory.items) do
            exports['core_inventory']:addItem(id, v.name, tonumber(v.amount), nil, 'big_storage')
        end
        exports['core_inventory']:openInventory(source, id, 'big_storage', nil, nil, true, nil)
    elseif Config.Inventory == "ox_inventory" then
        for _, v in pairs(Config.Armory.items) do 
            v.metadata = {}
            v.metadata.serial = v.info.serie
            v.metadata.components = {}
            if v.info and v.info.attachments then
                for z, u in pairs(v.info.attachments) do 
                    v.metadata.components[z] = u.component:lower()
                end
            end
        end
        local allowedPolices = {}
        for _, v in pairs(Config.JobCategory) do
            for _, j in pairs(v) do 
                allowedPolices[j.name] = 0
            end
        end
        exports['ox_inventory']:RegisterShop('OrigenPoliceArmoury', {
            name = "Police Armoury",
            inventory = Config.Armory.items,
            groups = allowedPolices
        })
    elseif Config.Inventory == "tgiann-inventory" then
        exports["tgiann-inventory"]:RegisterShop(id, Config.Armory.items)
        exports["tgiann-inventory"]:OpenShop(source, id)
    elseif Config.Inventory == "new-qb-inventory" then
        if not ArmouryRegistered then
            ArmouryRegistered = true
            exports["qb-inventory"]:CreateShop({
                name = id,
                label = "Origen Police Armoury",
                items = Config.Armory.items
            })
        end
        exports["qb-inventory"]:OpenShop(source, id)
    else
        print("No supported inventory found for armoury")
    end
    cb(true)
end)

FW_CreateCallback("origen_police:server:OpenPoliceStash", function(source, cb, id, label, slots, weight, private)
    if not CanOpenTablet(source)[2] then -- Don't allow to open the stash if the player don't have a valid job(config/permissions.lua)
        return cb(false)
    end
    local coords = GetEntityCoords(GetPlayerPed(source))
    if Config.Inventory == "ox_inventory" then
        if exports.ox_inventory:GetInventory(id) then
            return cb(true)
        end
        exports.ox_inventory:RegisterStash(id, label, slots, weight, private and true or nil)
    elseif Config.Inventory == "origen_inventory" then
        exports.origen_inventory:RegisterStash(id, label, slots, weight)
        exports.origen_inventory:OpenInventory(source, 'stash', id)
    elseif Config.Inventory == "new-qb-inventory" then
        exports['qb-inventory']:OpenInventory(source, id, {
            label = label,
            maxweight = weight,
            slots = slots
        })
    elseif Config.Inventory == "core_inventory" then
        exports['core_inventory']:openInventory(source, id, 'big_storage', nil, nil, true, nil)
    elseif Config.Inventory == "tgiann-inventory" then
        exports["tgiann-inventory"]:RegisterStash(id, label, slots, weight, false, false, coords, {}, {})
        TriggerClientEvent("origen_police:client:tgiann:OpenStash", source, id)
    else
        print("No supported inventory found for stashes")
        return cb(false)
    end
    cb(true)
end)

RegisterNetEvent("origen_police:server:OpenOtherPlayerInv", function(targetId)
    local src = source
    if not CanOpenTablet(source)[2] then -- Don't allow to open the stash if the player don't have a valid job(config/permissions.lua)
        return
    end
    if Config.Inventory == 'new-qb-inventory' then
        exports['qb-inventory']:OpenInventoryById(src, targetId)
    elseif Config.Inventory == 'tgiann-inventory' then
        exports["tgiann-inventory"]:ForceOpenInventory(src, "otherplayer", targetId)
    else
        print("No supported inventory found for open other player inventory")
    end
end)

function AddItemToPlayer(origAddItem, source, name, amount, slot, info)
    if Config.Inventory == "qs-inventory" then
        if not exports['qs-inventory']:CanCarryItem(source, name, amount) then
            return false
        end
        exports['qs-inventory']:AddItem(source, name, amount, slot, info)
        return true
    end

    -- This don't need the first arg source because is a method of the player object
    return origAddItem(name, amount, slot, info)
end

-- OTHER INTEGRATIONS

if Config.Inventory == 'codem-inventory' then
    RegisterServerEvent('origen_police:server:SetInventoryRobStatus')
    AddEventHandler('origen_police:server:SetInventoryRobStatus', function(playerId, val)
        TriggerClientEvent('codem-inventory:client:robstatus', playerId, val)
    end)
end
