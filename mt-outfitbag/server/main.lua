local ESX = exports["es_extended"]:getSharedObject()

local function SQL(query, params, cb)
    exports.oxmysql:execute(query, params or {}, function(res)
        if cb then cb(res) end
    end)
end

local function SQLScalar(query, params, cb)
    exports.oxmysql:scalar(query, params or {}, function(res)
        if cb then cb(res) end
    end)
end

local BagCache = {}

local function getCitizenId(src)
    local Player = ESX.GetPlayerFromId(src)
    return Player and Player.identifier or nil
end

local function addItem(src, name, amount)
    local Player = ESX.GetPlayerFromId(src)
    if not Player then return false end

    if GetResourceState('ox_inventory') == 'started' then
        return exports.ox_inventory:AddItem(src, name, amount or 1)
    else
        Player.addInventoryItem(name, amount or 1)
        return true
    end
end

local function removeItem(src, name, amount)
    local Player = ESX.GetPlayerFromId(src)
    if not Player then return false end

    if GetResourceState('ox_inventory') == 'started' then
        return exports.ox_inventory:RemoveItem(src, name, amount or 1)
    else
        Player.removeInventoryItem(name, amount or 1)
        return true
    end
end

local function findBagConfigByType(bagType)
    for _, b in ipairs(Config.BagData or {}) do
        if (b.bagType or 'default') == (bagType or 'default') then return b end
    end
    return nil
end

CreateThread(function()
    for _, bag in ipairs(Config.BagData or {}) do
        local itemName = bag and bag.itemName
        if type(itemName) == 'string' and itemName ~= '' then
            local lowerName = string.lower(itemName)
            ESX.RegisterUsableItem(lowerName, function(source)
                local ok = removeItem(source, lowerName, 1)
                if not ok then
                    TriggerClientEvent('esx:showNotification', source, 'No se pudo usar el ítem.', 'error')
                    return
                end
                TriggerClientEvent('mt-outfitbag:client:placeBag', source, bag.bagType or 'default')
            end)
        end
    end
end)

RegisterNetEvent('mt-outfitbag:server:registerBag', function(netId, bagType)
    local src = source
    if type(netId) ~= 'number' then return end
    local ownerCid = getCitizenId(src); if not ownerCid then return end

    local cfg = findBagConfigByType(bagType) or findBagConfigByType('default')
    if not cfg then return end

    local bagId = tostring(netId)
    BagCache[bagId] = {
        bagId = bagId,
        ownerCitizenId = ownerCid,
        bagType = cfg.bagType or 'default',
        netId = netId,
        locked = true,
    }

    TriggerClientEvent('mt-outfitbag:client:addTarget', -1, BagCache[bagId])
end)

ESX.RegisterServerCallback('mt-outfitbag:getState', function(source, cb, bagId)
    local b = BagCache[bagId]
    if not b then cb(nil) return end
    cb({ locked = b.locked, ownerCitizenId = b.ownerCitizenId })
end)

RegisterNetEvent('mt-outfitbag:server:toggleLock', function(bagId)
    local src = source
    local b = BagCache[bagId]; if not b then return end
    local cid = getCitizenId(src); if not cid or cid ~= b.ownerCitizenId then return end

    b.locked = not b.locked
    TriggerClientEvent('mt-outfitbag:client:updateLock', -1, bagId, b.locked)
end)

RegisterNetEvent('mt-outfitbag:server:pickup', function(bagId)
    local src = source
    local b = BagCache[bagId]; if not b then return end
    local cid = getCitizenId(src); if not cid or cid ~= b.ownerCitizenId then return end

    local cfg = findBagConfigByType(b.bagType)
    if cfg and cfg.itemName then
        local added = addItem(src, cfg.itemName, 1)
        if not added then
            TriggerClientEvent('esx:showNotification', src, 'No tienes espacio suficiente en el inventario.', 'error')
            return
        end
    end

    BagCache[bagId] = nil
    TriggerClientEvent('mt-outfitbag:client:removeBag', -1, bagId, b.netId)
end)

ESX.RegisterServerCallback('mt-outfitbag:getOutfits', function(source, cb, bagId)
    local b = BagCache[bagId]
    if not b then cb({}) return end
    local ownerCid = b.ownerCitizenId
    SQL([[
        SELECT id, slot, name, model
        FROM mt_outfitbag_outfits
        WHERE owner = ?
        ORDER BY slot ASC
    ]], { ownerCid }, function(rows)
        cb(rows or {})
    end)
end)

ESX.RegisterServerCallback('mt-outfitbag:getOne', function(source, cb, bagId, slot)
    local b = BagCache[bagId]
    if not b then cb(nil) return end
    local ownerCid = b.ownerCitizenId
    SQL([[
        SELECT id, slot, name, model, appearance
        FROM mt_outfitbag_outfits
        WHERE owner = ? AND slot = ?
        LIMIT 1
    ]], { ownerCid, tonumber(slot) or -1 }, function(rows)
        cb(rows and rows[1] or nil)
    end)
end)

RegisterNetEvent('mt-outfitbag:server:save', function(bagId, data)
    local src = source
    local b = BagCache[bagId]; if not b then return end
    local cid = getCitizenId(src); if not cid or cid ~= b.ownerCitizenId then return end

    SQL('SELECT MAX(slot) AS maxslot FROM mt_outfitbag_outfits WHERE owner = ?', { cid }, function(rows)
        local maxslot = 0
        if rows and rows[1] and rows[1].maxslot then maxslot = tonumber(rows[1].maxslot) or 0 end
        local nextSlot = maxslot + 1

        local name = tostring((data and data.name) or ('Outfit %d'):format(math.random(111,999)))
        local model = tonumber((data and data.model) or 0) or 0
        local appearance = (data and data.appearance) and json.encode(data.appearance) or '{}'

        SQL([[
            INSERT INTO mt_outfitbag_outfits (bag_id, owner, slot, name, model, appearance)
            VALUES (?, ?, ?, ?, ?, ?)
        ]], { bagId, cid, nextSlot, name, model, appearance }, function()
            TriggerClientEvent('mt-outfitbag:client:saved', src)
        end)
    end)
end)

RegisterNetEvent('mt-outfitbag:server:delete', function(bagId, slot, id)
    local src = source
    local b = BagCache[bagId]; if not b then return end
    local cid = getCitizenId(src); if not cid or cid ~= b.ownerCitizenId then return end

    local hasId = tonumber(id) ~= nil
    if hasId then
        SQL('DELETE FROM mt_outfitbag_outfits WHERE owner = ? AND id = ?', { cid, tonumber(id) }, function()
            TriggerClientEvent('mt-outfitbag:client:deleted', src)
        end)
    else
        SQL('DELETE FROM mt_outfitbag_outfits WHERE owner = ? AND slot = ?', { cid, tonumber(slot) or -1 }, function()
            TriggerClientEvent('mt-outfitbag:client:deleted', src)
        end)
    end
end)

RegisterNetEvent('mt-outfitbag:server:rename', function(bagId, id, newName)
    local src = source
    local b = BagCache[bagId]; if not b then return end
    local cid = getCitizenId(src); if not cid or cid ~= b.ownerCitizenId then return end

    SQL('UPDATE mt_outfitbag_outfits SET name = ? WHERE id = ? AND owner = ?', { tostring(newName or ''), tonumber(id) or -1, cid }, function()
        TriggerClientEvent('mt-outfitbag:client:renamed', src)
    end)
end)

RegisterNetEvent('esx:playerLoaded', function(playerId, xPlayer)
    local src = playerId
    for _, bag in pairs(BagCache) do
        TriggerClientEvent('mt-outfitbag:client:addTarget', src, bag)
    end
end)

CreateThread(function()
    SQL([[
        CREATE TABLE IF NOT EXISTS `mt_outfitbag_outfits` (
            `id` INT NOT NULL AUTO_INCREMENT,
            `bag_id` VARCHAR(64) NOT NULL,
            `owner` VARCHAR(64) NOT NULL,
            `slot` INT NOT NULL,
            `name` VARCHAR(64) NOT NULL,
            `model` INT NOT NULL,
            `appearance` LONGTEXT NOT NULL,
            PRIMARY KEY (`id`),
            INDEX `owner_slot_idx` (`owner`,`slot`),
            INDEX `bag_owner_idx` (`bag_id`,`owner`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    BagCache = {}
end)
