local DB = exports['mt-vip']:GetDB()
local VIPCache = {} -- Cache for online players VIP data

local function ParseMySQLDate(date)
    if not date then return nil end
    if type(date) == 'number' then return date / 1000 end
    if type(date) == 'string' then
        local y, m, d, h, min, s = date:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
        if y then
            return os.time({year=y, month=m, day=d, hour=h, min=min, sec=s})
        end
    end
    return nil
end

-- Initialize & Auto DB Setup
MySQL.ready(function()
    print('^2[mt-vip] Checking database tables...^0')

    -- Create Tables if not exist
    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `uv_vip_ranks` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `name` VARCHAR(50) NOT NULL,
            `label` VARCHAR(50) NOT NULL,
            `money_passive` INT DEFAULT 0,
            `coins_passive` INT DEFAULT 0,
            `interval` INT DEFAULT 30,
            `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])

    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `uv_vip_users` (
            `identifier` VARCHAR(60) PRIMARY KEY,
            `rank_id` INT DEFAULT NULL,
            `expiration` DATETIME DEFAULT NULL,
            `last_paycheck` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (`rank_id`) REFERENCES `uv_vip_ranks`(`id`) ON DELETE SET NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])

    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `uv_coins` (
            `identifier` VARCHAR(60) PRIMARY KEY,
            `coins` INT DEFAULT 0
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])

    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `uv_coins_logs` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `identifier` VARCHAR(60) NOT NULL,
            `amount` INT NOT NULL,
            `action` VARCHAR(100) NOT NULL,
            `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])

    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `uv_vip_codes` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `code` VARCHAR(20) UNIQUE NOT NULL,
            `type` ENUM('vip', 'coins', 'item', 'vehicle', 'bundle') NOT NULL,
            `value` TEXT NOT NULL,
            `max_uses` INT DEFAULT 1,
            `current_uses` INT DEFAULT 0,
            `expiration` DATETIME DEFAULT NULL,
            `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])

    -- Update ENUM if it already exists without 'bundle'
    MySQL.query.await("ALTER TABLE `uv_vip_codes` MODIFY COLUMN `type` ENUM('vip', 'coins', 'item', 'vehicle', 'bundle') NOT NULL")

    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `uv_vip_codes_used` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `code_id` INT NOT NULL,
            `identifier` VARCHAR(60) NOT NULL,
            `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (`code_id`) REFERENCES `uv_vip_codes`(`id`) ON DELETE CASCADE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    ]])

    -- Seed default ranks if empty
    local rankCount = MySQL.scalar.await("SELECT COUNT(*) FROM uv_vip_ranks")
    if rankCount == 0 then
        MySQL.query.await([[
            INSERT INTO `uv_vip_ranks` (`name`, `label`, `money_passive`, `coins_passive`, `interval`) VALUES
            ('bronce', 'Bronce', 200, 5, 30),
            ('plata', 'Plata', 400, 10, 30),
            ('oro', 'Oro', 600, 15, 30),
            ('platino', 'Platino', 1000, 25, 20),
            ('diamante', 'Diamante', 1500, 40, 15),
            ('manhattan', 'Manhattan', 3000, 75, 10);
        ]])
        print('^2[mt-vip] Default VIP ranks seeded successfully.^0')
    end

    print('^2[mt-vip] Server initialized successfully.^0')
end)

-- Cache Management Functions
local function RefreshPlayerCache(identifier)
    local data = DB.GetUserVIP(identifier)
    if data and data.rank_id then
        VIPCache[identifier] = data
    else
        VIPCache[identifier] = nil
    end
end

exports('RefreshPlayerCache', RefreshPlayerCache)

RegisterNetEvent('esx:playerLoaded', function(source, xPlayer)
    RefreshPlayerCache(xPlayer.getIdentifier())
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if xPlayer then
        VIPCache[xPlayer.getIdentifier()] = nil
    end
end)

-- Sync data for the UI
local function GetUIGlobalData()
    local items = {}
    local inventoryItems = exports.ox_inventory:Items()
    for name, data in pairs(inventoryItems) do
        items[#items + 1] = {
            name = name,
            label = data.label
        }
    end
    table.sort(items, function(a, b) return a.label < b.label end)

    -- Calculate total coins from all users (ESX accounts)
    local totalCoins = 0
    local allUsers = MySQL.query.await('SELECT accounts FROM users')
    for _, u in ipairs(allUsers) do
        if u.accounts then
            local accounts = json.decode(u.accounts)
            totalCoins = totalCoins + (accounts.uv_coins or 0)
        end
    end

    return {
        ranks = DB.GetRanks(),
        codes = DB.GetCodes(),
        ranking = DB.GetRanking(),
        users = DB.GetAllUsers(),
        items = items,
        totalCoins = totalCoins
    }
end

-- Command to open the panel
RegisterCommand(Config.PanelCommand, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    if Config.AdminGroups[xPlayer.getGroup()] or Config.AdminLicenses[xPlayer.getIdentifier()] then
        TriggerClientEvent('mt-vip:client:openPanel', source, GetUIGlobalData())
    else
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = Config.Locales['no_permission']
        })
    end
end, true)

-- Code Redemption
RegisterCommand(Config.RedeemCommand, function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer or not args[1] then return end

    local codeStr = args[1]
    local identifier = xPlayer.getIdentifier()
    local code = DB.GetCode(codeStr)

    if not code then
        return TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = Config.Locales['invalid_code'] })
    end

    -- Validations
    local expiration = ParseMySQLDate(code.expiration)
    if expiration and os.time() > expiration then
        return TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = Config.Locales['code_expired'] })
    end

    if code.current_uses >= code.max_uses then
        return TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = Config.Locales['max_uses_reached'] })
    end

    if DB.HasUserUsedCode(code.id, identifier) then
        return TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = Config.Locales['already_redeemed'] })
    end

    -- Process Rewards (Bundle)
    local rewards = json.decode(code.value)
    local successCount = 0

    for _, reward in ipairs(rewards) do
        if reward.type == 'vip' then
            local expiration = nil
            if reward.days then
                expiration = os.date('%Y-%m-%d %H:%M:%S', os.time() + (reward.days * 86400))
            end
            DB.AssignRank(identifier, reward.rank_id, expiration)
            TriggerClientEvent('ox_lib:notify', source, { type = 'success', description = string.format(Config.Locales['rank_assigned'], reward.rank_name) })
            successCount = successCount + 1
        elseif reward.type == 'coins' then
            DB.AddCoins(identifier, reward.amount, 'Redeemed code: ' .. codeStr)
            TriggerClientEvent('ox_lib:notify', source, { type = 'success', description = string.format(Config.Locales['coins_received'], reward.amount) })
            successCount = successCount + 1
        elseif reward.type == 'item' then
            if exports.ox_inventory:CanCarryItem(source, reward.item_name, reward.amount) then
                exports.ox_inventory:AddItem(source, reward.item_name, reward.amount)
                TriggerClientEvent('ox_lib:notify', source, { type = 'success', description = string.format(Config.Locales['item_received'], reward.amount, reward.item_label or reward.item_name) })
                successCount = successCount + 1
            else
                TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'No puedes cargar estos items.' })
            end
        elseif reward.type == 'vehicle' then
            local plate = string.upper(ESX.GetRandomString(8))
            MySQL.insert.await('INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored) VALUES (?, ?, ?, ?, ?)', {
                identifier, plate, json.encode({model = reward.model, plate = plate}), 'car', 1
            })
            TriggerClientEvent('ox_lib:notify', source, { type = 'success', description = string.format(Config.Locales['vehicle_received'], reward.model) })
            successCount = successCount + 1
        end
    end

    if successCount > 0 then
        DB.MarkCodeUsed(code.id, identifier)
    end
end, false)

-- NUI Callbacks for Admin Panel
lib.callback.register('mt-vip:server:getDashboardData', function(source)
    return GetUIGlobalData()
end)

RegisterNetEvent('mt-vip:server:admin:saveRank', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not Config.AdminGroups[xPlayer.getGroup()] then return end

    if data.id then
        DB.UpdateRank(data.id, data)
        -- Refresh cache for everyone in case rank rewards changed
        for identifier, _ in pairs(VIPCache) do
            RefreshPlayerCache(identifier)
        end
    else
        DB.CreateRank(data)
    end
end)

RegisterNetEvent('mt-vip:server:admin:deleteRank', function(id)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not Config.AdminGroups[xPlayer.getGroup()] then return end
    DB.DeleteRank(id)
end)

RegisterNetEvent('mt-vip:server:admin:saveCode', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not Config.AdminGroups[xPlayer.getGroup()] then return end
    
    -- Check if code already exists
    local existing = DB.GetCode(data.code)
    if existing then
        return TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'Este código ya existe.' })
    end

    DB.CreateCode(data)
    TriggerClientEvent('ox_lib:notify', src, { type = 'success', description = 'Código creado correctamente.' })
end)

RegisterNetEvent('mt-vip:server:admin:deleteCode', function(id)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not Config.AdminGroups[xPlayer.getGroup()] then return end
    DB.DeleteCode(id)
end)

RegisterNetEvent('mt-vip:server:admin:updateUserCoins', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not Config.AdminGroups[xPlayer.getGroup()] then return end
    
    if data.amount > 0 then
        DB.AddCoins(data.identifier, data.amount, 'Admin adjustment: Add')
    else
        DB.RemoveCoins(data.identifier, math.abs(data.amount), 'Admin adjustment: Remove')
    end
    
    TriggerClientEvent('ox_lib:notify', src, { type = 'success', description = 'Balance actualizado.' })
end)

RegisterNetEvent('mt-vip:server:admin:updateUserRank', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not Config.AdminGroups[xPlayer.getGroup()] then return end
    
    if data.rank_id == 0 or not data.rank_id then
        DB.RemoveRank(data.identifier)
        TriggerClientEvent('ox_lib:notify', src, { type = 'info', description = 'Rango VIP removido.' })
    else
        local expiration = nil
        if data.days and data.days > 0 then
            expiration = os.date('%Y-%m-%d %H:%M:%S', os.time() + (data.days * 86400))
        end
        DB.AssignRank(data.identifier, data.rank_id, expiration)
        TriggerClientEvent('ox_lib:notify', src, { type = 'success', description = 'Rango asignado correctamente.' })
    end
    
    -- Refresh cache for the user
    RefreshPlayerCache(data.identifier)
end)

exports('GetVIPCache', function() return VIPCache end)
