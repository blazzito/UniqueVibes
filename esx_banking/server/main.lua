local spawnedPeds, netIdTable = {}, {}

local bankingSessions = {}  -- [source] = os.time() when UI was opened
local lastDoingType = {}    -- [source] = os.clock() of last accepted doingType call
local SESSION_TIMEOUT = 300 -- seconds before an open session is considered stale

local function get_key(t)
    local key
    for k, _ in pairs(t) do
        key = k
    end
    return key
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    
    BANK.InitDatabase()

    if Config.EnablePeds then BANK.CreatePeds() end
    local twoMonthMs = (os.time() - 5259487) * 1000
    MySQL.query('DELETE FROM banking WHERE time < ? ', {twoMonthMs})
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    if Config.EnablePeds then BANK.DeletePeds() end
end)

if Config.EnablePeds then
    AddEventHandler('esx:playerLoaded', function(playerId)
        TriggerClientEvent('esx_banking:pedHandler', playerId, netIdTable)
    end)
end

RegisterServerEvent('esx_banking:openSession')
AddEventHandler('esx_banking:openSession', function()
    local source = source
    if ESX.Player(source) then
        bankingSessions[source] = os.time()
    end
end)

RegisterServerEvent('esx_banking:closeSession')
AddEventHandler('esx_banking:closeSession', function()
    local source = source
    bankingSessions[source] = nil
    lastDoingType[source] = nil
end)

AddEventHandler('playerDropped', function()
    local source = source
    bankingSessions[source] = nil
    lastDoingType[source] = nil
end)

ESX.RegisterServerCallback('esx_banking:doingType', function(source, cb, typeData)
    if typeData == nil then return cb({success = false}) end

    local xPlayer = ESX.Player(source)
    local identifier = xPlayer.getIdentifier()
    local money = xPlayer.getAccount('money').money
    local bankMoney = xPlayer.getAccount('bank').money
    local amount

    local key = get_key(typeData)
    if typeData.deposit then
        amount = tonumber(typeData.deposit)
    elseif typeData.withdraw then
        amount = tonumber(typeData.withdraw)
    elseif typeData.transfer and typeData.transfer.moneyAmount then
        amount = tonumber(typeData.transfer.moneyAmount)
    elseif typeData.pincode then
        amount = tonumber(typeData.pincode)
    end

    if not tonumber(amount) then
        return cb({success = false, message = TranslateCap('invalid_amount')})
    end
    amount = ESX.Math.Round(amount)

    if amount == nil or (not typeData.pincode and amount <= 0) then
        return cb({success = false, message = TranslateCap('invalid_amount')})
    end

    if typeData.deposit and amount <= money then
        BANK.Deposit(amount, xPlayer)
    elseif typeData.withdraw and bankMoney ~= nil and amount <= bankMoney then
        BANK.Withdraw(amount, xPlayer)
    elseif typeData.pincode then
        BANK.Pincode(amount, identifier)
    elseif typeData.transfer then
        local targetId = tonumber(typeData.transfer.playerId)
        if not targetId or targetId <= 0 then
            return cb({success = false, message = TranslateCap("cant_do_it")})
        end
        if bankMoney < amount then
            return cb({success = false, message = TranslateCap('not_enough_money', amount)})
        end
        local xTarget = ESX.GetPlayerFromId(targetId)
        if not xTarget then
            return cb({success = false, message = "Jugador no encontrado"})
        end
        if not BANK.Transfer(xTarget, xPlayer, amount, key) then
            return cb({success = false, message = TranslateCap("cant_do_it")})
        end
    else
        return cb({success = false, message = TranslateCap('not_enough_money', amount)})
    end

    money = xPlayer.getAccount('money').money
    bankMoney = xPlayer.getAccount('bank').money

    local successMessage
    if typeData.transfer then
        successMessage = TranslateCap(string.format('%s_money', key), amount, typeData.transfer.playerId)
    else
        successMessage = TranslateCap(string.format('%s_money', key), typeData.pincode and (string.format("%04d", amount)) or amount)
    end

    if not typeData.pincode then
        BANK.LogTransaction(source, string.upper(key), string.upper(key), amount, bankMoney)
    end

    cb({success = true, message = successMessage, bankMoney = bankMoney, money = money, key = key})
end)

ESX.RegisterServerCallback("esx_banking:getPlayerData", function(source, cb)
    local xPlayer = ESX.Player(source)
    local identifier = xPlayer.getIdentifier()
    local weekAgo = (os.time() - 604800) * 1000
    
    local result = MySQL.query.await('SELECT ssn, iban FROM users WHERE identifier = ?', {identifier})
    local playerIban = identifier
    if result[1] then
        playerIban = result[1].ssn or result[1].iban or identifier
    end

    local transactionHistory = MySQL.query.await(
        'SELECT ID, amount, time, label FROM banking WHERE identifier = ? AND time > ? ORDER BY time DESC LIMIT 10', {identifier, weekAgo})
    
    local formattedHistory = {}
    for i=1, #transactionHistory do
        table.insert(formattedHistory, {
            id = transactionHistory[i].ID,
            amount = transactionHistory[i].amount,
            date = transactionHistory[i].time,
            user = xPlayer.getName(), 
            iban = playerIban,
            reason = transactionHistory[i].label
        })
    end

    local playerData = {
        playerName = xPlayer.getName(),
        playerIban = playerIban,
        money = xPlayer.getAccount('money').money,
        bankMoney = xPlayer.getAccount('bank').money,
        transactionHistory = formattedHistory
    }

    cb(playerData)
end)

ESX.RegisterServerCallback("esx_banking:checkPincode", function(source, cb, inputPincode)
    local xPlayer = ESX.Player(source)
    local identifier = xPlayer.getIdentifier()
    local pincode = MySQL.scalar.await('SELECT COUNT(1) FROM users WHERE identifier = ? AND pincode = ?',
        {identifier, inputPincode})
    cb(pincode > 0)
end)

function logTransaction(targetSource,label, key,amount)
    if targetSource == nil then
        return
    end

    if key == nil then
        return
    end
    
    if type(key) ~= "string" or key == '' then
        return
    end

    if amount == nil then
        return
    end

    if label == nil then
        label = "UNKNOW LABEL"
    end

    local xPlayer = ESX.Player(tonumber(targetSource))

    if xPlayer ~= nil then
        local bankCurrentMoney = xPlayer.getAccount('bank').money
        BANK.LogTransaction(targetSource, label, string.upper(key), amount, bankCurrentMoney)  
    end
end
exports("logTransaction", logTransaction)

BANK = {
    CreatePeds = function()
        for i = 1, #Config.Peds do
            local model = Config.Peds[i].Model
            local coords = Config.Peds[i].Position
            spawnedPeds[i] = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, true, true)
            netIdTable[i] = NetworkGetNetworkIdFromEntity(spawnedPeds[i])
            while not DoesEntityExist(spawnedPeds[i]) do Wait(50) end
        end

        Wait(100)
        TriggerClientEvent('esx_banking:pedHandler', -1, netIdTable)
    end,
    DeletePeds = function()
        for i = 1, #spawnedPeds do
            DeleteEntity(spawnedPeds[i])
            spawnedPeds[i] = nil
        end
    end,
    Withdraw = function(amount, xPlayer)
        xPlayer.addAccountMoney('money', amount)
        xPlayer.removeAccountMoney('bank', amount)
    end,
    Deposit = function(amount, xPlayer)
        xPlayer.removeAccountMoney('money', amount)
        xPlayer.addAccountMoney('bank', amount)
    end,
    Transfer = function(xTarget, xPlayer, amount, key)
        if xTarget == nil or xPlayer.source == xTarget.source then
            TriggerClientEvent("esx:showNotification", xPlayer.source, TranslateCap("cant_do_it"), "error")
            return false
        end

        xPlayer.removeAccountMoney('bank', amount)
        xTarget.addAccountMoney('bank', amount)
        local bankMoney = xTarget.getAccount('bank').money
        BANK.LogTransaction(xTarget.source, "TRANSFER_RECEIVE", "TRANSFER_RECEIVE", amount, bankMoney)
        TriggerClientEvent("esx:showNotification", xTarget.source, TranslateCap('receive_transfer', amount, xPlayer.source),
            "success")

        return true
    end,
    Pincode = function(amount, identifier)
        MySQL.update('UPDATE users SET pincode = ? WHERE identifier = ? ', {amount, identifier})
    end,
    LogTransaction = function(playerId, label, logType, amount, bankMoney)
        if playerId == nil then
            return
        end

        if label == nil then
            label = logType
        end

        local xPlayer = ESX.Player(playerId)
        local identifier = xPlayer.getIdentifier()
    
        MySQL.insert('INSERT INTO banking (identifier, label, type, amount, time, balance) VALUES (?, ?, ?, ?, ?, ?)',
            {identifier,label,logType,amount, os.time() * 1000, bankMoney})
    end,

    InitDatabase = function()
        MySQL.query([[
            CREATE TABLE IF NOT EXISTS `banking` (
                `identifier` varchar(46) DEFAULT NULL,
                `type` varchar(50) DEFAULT NULL,
                `amount` int(64) DEFAULT NULL,
                `time` bigint(20) DEFAULT NULL,
                `ID` int(11) NOT NULL AUTO_INCREMENT,
                `balance` int(11) DEFAULT 0,
                `label` varchar(255) DEFAULT NULL,
                PRIMARY KEY (`ID`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        local result = MySQL.query.await("SHOW COLUMNS FROM `users` LIKE 'pincode'")
        if #result == 0 then
            MySQL.query("ALTER TABLE `users` ADD COLUMN `pincode` INT NULL")
            print("^2[esx_banking] Column 'pincode' added to 'users' table automatically.^7")
        end

        local result2 = MySQL.query.await("SHOW COLUMNS FROM `users` LIKE 'iban'")
        if #result2 == 0 then
            MySQL.query("ALTER TABLE `users` ADD COLUMN `iban` VARCHAR(50) NULL")
            print("^2[esx_banking] Column 'iban' added to 'users' table automatically.^7")
        end
    end
}