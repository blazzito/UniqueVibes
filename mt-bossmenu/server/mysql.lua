

CreateThread(function()
    local queries = {
        [[CREATE TABLE IF NOT EXISTS `mt_bossmenu_actions` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `action` text DEFAULT NULL,
            `employee` text DEFAULT NULL,
            `time` varchar(10) DEFAULT NULL,
            `data` longtext DEFAULT NULL,
            `job` text DEFAULT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;]],
        [[CREATE TABLE IF NOT EXISTS `mt_bossmenu_bonus_queue` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `identifier` varchar(46) NOT NULL,
            `amount` int(11) NOT NULL DEFAULT 0,
            `job` varchar(50) NOT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;]],
        [[CREATE TABLE IF NOT EXISTS `mt_bossmenu_transactions` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `action` text DEFAULT NULL,
            `employee` text DEFAULT NULL,
            `amount` int(11) DEFAULT NULL,
            `time` varchar(10) DEFAULT NULL,
            `job` text DEFAULT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;]],
        [[CREATE TABLE IF NOT EXISTS `mt_bossmenu_points` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `name` varchar(100) NOT NULL,
            `job` varchar(50) NOT NULL,
            `coords` longtext NOT NULL,
            `logo` varchar(100) DEFAULT NULL,
            `color` varchar(50) DEFAULT 'orange',
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;]],
        [[CREATE TABLE IF NOT EXISTS `mt_bossmenu_settings` (
            `name` varchar(50) NOT NULL,
            `value` longtext NOT NULL,
            PRIMARY KEY (`name`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;]]
    }
    for _, query in ipairs(queries) do
        MySQL.insert.await(query)
    end

    -- Check if grades column exists in mt_bossmenu_points
    local columns = MySQL.query.await('SHOW COLUMNS FROM `mt_bossmenu_points` LIKE ?', { 'grades' })
    if #columns == 0 then
        MySQL.query.await('ALTER TABLE `mt_bossmenu_points` ADD COLUMN `grades` LONGTEXT DEFAULT \'[]\'')
        print('[mt_bossmenu] Database column "grades" added to mt_bossmenu_points.')
    end

    Wait(1000)

    -- Insert default billing settings if not present
    local billingExists = MySQL.single.await('SELECT name FROM mt_bossmenu_settings WHERE name = ?', { 'billing' })
    if not billingExists then
        local defaultBilling = {
            enabled = true,
            percentageSociety = 60,
            percentageWorker = 40,
            allowedJobs = { 'police', 'ambulance', 'mechanic' }
        }
        MySQL.insert.await('INSERT INTO mt_bossmenu_settings (name, value) VALUES (?, ?)', {
            'billing', json.encode(defaultBilling)
        })
        print('[mt_bossmenu] Default billing settings inserted.')
    end
end)

RegisterNetEvent('mt_bossmenu:lunar:checkSociety')
AddEventHandler('mt_bossmenu:lunar:checkSociety', function(jobName)
    local _source = source
    CreateThread(function()
        local societyName = 'society_' .. jobName
        local result = MySQL.query.await('SELECT * FROM addon_account_data WHERE account_name = ?', {societyName})
        
        if #result == 0 then
            AddSociety(societyName)
        end
        
        TriggerClientEvent('mt_bossmenu:lunar:societyChecked', _source, true)
    end)
end)

function AddSociety(societyName)
    local success, err = pcall(function()
        MySQL.insert.await('INSERT INTO addon_account_data (account_name, money, owner) VALUES (?, ?, ?)', { societyName, 0, NULL })
    end)
    
    if not success then
        -- Try without owner column if it doesn't exist
        MySQL.insert.await('INSERT INTO addon_account_data (account_name, money) VALUES (?, ?)', { societyName, 0 })
    end
    
    print(('[mt_bossmenu] Society account for %s created.'):format(societyName))
end