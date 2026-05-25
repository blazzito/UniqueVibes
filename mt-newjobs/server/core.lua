ESX = exports['es_extended']:getSharedObject()

-- SQL initialization
CreateThread(function()
    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `mt_newjobs_stats` (
            `identifier` VARCHAR(60) NOT NULL,
            `job` VARCHAR(50) NOT NULL,
            `xp` INT(11) DEFAULT 0,
            `total_earned` INT(11) DEFAULT 0,
            `total_actions` INT(11) DEFAULT 0,
            `total_time` INT(11) DEFAULT 0, -- Time in minutes
            `shifts_completed` INT(11) DEFAULT 0,
            `best_shift` INT(11) DEFAULT 0,
            PRIMARY KEY (`identifier`, `job`)
        );
    ]])

    -- Check for missing columns in stats
    local statsColumns = MySQL.query.await("SHOW COLUMNS FROM `mt_newjobs_stats`")
    local hasTotalTime = false
    for _, col in ipairs(statsColumns) do
        if col.Field == 'total_time' then hasTotalTime = true break end
    end
    if not hasTotalTime then
        MySQL.query.await("ALTER TABLE `mt_newjobs_stats` ADD COLUMN `total_time` INT(11) DEFAULT 0 AFTER `total_actions`")
    end

    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `mt_newjobs_offers` (
            `id` INT(11) NOT NULL AUTO_INCREMENT,
            `business_name` VARCHAR(100) NOT NULL,
            `position` VARCHAR(100) NOT NULL,
            `salary` VARCHAR(50) DEFAULT NULL,
            `benefits` TEXT DEFAULT NULL,
            `description` TEXT DEFAULT NULL,
            `logo` VARCHAR(50) DEFAULT 'briefcase',
            `author_identifier` VARCHAR(60) DEFAULT NULL,
            `author_name` VARCHAR(100) DEFAULT NULL,
            PRIMARY KEY (`id`)
        );
    ]])

    -- Check for missing columns in offers
    local offersColumns = MySQL.query.await("SHOW COLUMNS FROM `mt_newjobs_offers`")
    local hasAuthorId = false
    local hasAuthorName = false
    for _, col in ipairs(offersColumns) do
        if col.Field == 'author_identifier' then hasAuthorId = true end
        if col.Field == 'author_name' then hasAuthorName = true end
    end
    if not hasAuthorId then
        MySQL.query.await("ALTER TABLE `mt_newjobs_offers` ADD COLUMN `author_identifier` VARCHAR(60) DEFAULT NULL")
    end
    if not hasAuthorName then
        MySQL.query.await("ALTER TABLE `mt_newjobs_offers` ADD COLUMN `author_name` VARCHAR(100) DEFAULT NULL")
    end
end)

-- Command to create a job offer (Admin only) - DESACTIVADO (Usar Boss Menu)
-- ESX.RegisterCommand('crearoferta', 'admin', function(xPlayer, args, showError)
--     TriggerClientEvent('mt-newjobs:client:openOfferCreator', xPlayer.source)
-- end, false, {help = 'Crear una oferta de empleo para el centro de trabajo'})

-- Menu Locking System
local ActiveMenus = {}

function CanOpenMenu(source, menuId)
    if ActiveMenus[menuId] and ActiveMenus[menuId] ~= source then
        return false
    end
    ActiveMenus[menuId] = source
    return true
end

function ReleaseMenu(source, menuId)
    if ActiveMenus[menuId] == source then
        ActiveMenus[menuId] = nil
    end
end

-- Global Functions for Modules
function GetPlayerStats(identifier, job)
    local result = MySQL.single.await('SELECT * FROM `mt_newjobs_stats` WHERE identifier = ? AND job = ?', {identifier, job})
    if not result then
        MySQL.insert.await('INSERT INTO `mt_newjobs_stats` (identifier, job) VALUES (?, ?)', {identifier, job})
        return {
            identifier = identifier,
            job = job,
            xp = 0,
            total_earned = 0,
            total_actions = 0,
            total_time = 0,
            shifts_completed = 0,
            best_shift = 0
        }
    else
        result.total_actions = result.total_actions or result.total_passengers or 0
    end
    return result
end

function SavePlayerStats(identifier, job, data)
    MySQL.update.await([[
        UPDATE `mt_newjobs_stats` 
        SET xp = ?, total_earned = ?, total_actions = ?, total_time = ?, shifts_completed = ?, best_shift = ? 
        WHERE identifier = ? AND job = ?
    ]], {
        data.xp or 0,
        data.total_earned or 0,
        data.total_actions or 0,
        data.total_time or 0,
        data.shifts_completed or 0,
        data.best_shift or 0,
        identifier,
        job
    })
end

function FinishJob(source, jobName, actions, basePay, timeWorked)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    local stats = GetPlayerStats(xPlayer.identifier, jobName)
    local currentLevel = LevelSystem:GetLevelFromXP(stats.xp)
    local finalPay = LevelSystem:CalculatePay(basePay, currentLevel)
    
    xPlayer.addAccountMoney('money', finalPay)
    
    local xpGained = actions * (LevelSystem.Config.XPPerAction[jobName] or 5)
    stats.xp = stats.xp + xpGained
    stats.total_actions = stats.total_actions + actions
    stats.total_earned = stats.total_earned + finalPay
    stats.total_time = stats.total_time + (timeWorked or 0)
    stats.shifts_completed = stats.shifts_completed + 1
    if finalPay > (stats.best_shift or 0) then
        stats.best_shift = finalPay
    end
    
    SavePlayerStats(xPlayer.identifier, jobName, stats)
    
    local newLevel = LevelSystem:GetLevelFromXP(stats.xp)
    if newLevel > currentLevel then
        TriggerClientEvent('ox_lib:notify', source, {
            title = '¡Subida de Nivel!',
            description = 'Has alcanzado el nivel ' .. newLevel .. ' en ' .. jobName .. '.',
            type = 'success'
        })
    end
    
    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Turno Finalizado',
        description = 'Has ganado $' .. finalPay .. '.',
        type = 'success'
    })
end

-- Vehicle Spawn Check
function IsSpawnPointFree(coords, radius)
    local vehicles = GetAllVehicles()
    local r = radius or 5.0
    for i=1, #vehicles do
        if #(GetEntityCoords(vehicles[i]) - coords) < r then
            return false
        end
    end
    return true
end

-- Core Callbacks
lib.callback.register('mt-newjobs:getStats', function(source, jobName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end
    local stats = GetPlayerStats(xPlayer.identifier, jobName)
    local levelInfo = LevelSystem:GetCurrentLevelProgress(stats.xp)
    return {
        level = levelInfo.level,
        xp = stats.xp,
        totalActions = stats.total_actions,
        shiftsCompleted = stats.shifts_completed,
        totalEarned = stats.total_earned,
        totalTime = stats.total_time,
        bestShift = stats.best_shift,
        bonusPercent = LevelSystem:GetPayBonus(levelInfo.level)
    }
end)

RegisterNetEvent('mt-newjobs:server:saveConfig', function(jobName, config)
    -- Logic to save config if needed
end)

RegisterNetEvent('mt-newjobs:server:toggleJob', function(jobName)
    local source = source
    -- Generic toggle logic
    TriggerClientEvent('mt-newjobs:client:toggleJob', -1, jobName, true)
end)


