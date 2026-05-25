--[[
    Entry point for mt-bossmenu (Server)
    Standardizes global helpers and initializes components.
]]

ESX = exports['es_extended']:getSharedObject()

---Global helper to add an action log to the database.
function AddAction(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    if not Guard.IsBoss(source) then return false end
    
    MySQL.insert.await('INSERT INTO mt_bossmenu_actions (action, employee, data, time, job) VALUES (?, ?, ?, ?, ?)', {
        data.action, xPlayer.getName(), json.encode(data.data), os.time(), xPlayer.getJob().name
    })
end

---Global helper to add a transaction log to the database.
function AddTransaction(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    if not Guard.IsBoss(source) then return false end

    MySQL.insert.await('INSERT INTO mt_bossmenu_transactions (action, employee, amount, time, job) VALUES (?, ?, ?, ?, ?)', {
        data.action, xPlayer.getName(), data.amount, os.time(), xPlayer.getJob().name,
    })
end

---Global helper to remove money from a society account.
function RemoveMoney(source, jobName, amount)
    if Config.JobCreator == 'jaksam' then
        exports["jobs_creator"]:removeSocietyMoney(jobName, amount)
        return
    end

    local account = SocietyService.GetSocietyAccount(jobName)
    MySQL.update.await('UPDATE addon_account_data SET money = money - ? WHERE account_name = ?', {
        amount, account
    })
end

-- Admin Command to open Boss Menu for Setup
ESX.RegisterCommand(Config.AdminCommand, 'admin', function(xPlayer, args, showError)
    local isAllowed = false
    for _, group in ipairs(Config.AdminGroups) do
        if xPlayer.getGroup() == group then
            isAllowed = true
            break
        end
    end

    if isAllowed then
        local jobs = {}
        local allJobs = ESX.GetJobs()
        for name, job in pairs(allJobs) do
            local grades = {}
            for grade, gradeData in pairs(job.grades) do
                table.insert(grades, { value = tonumber(grade), label = gradeData.label })
            end
            table.insert(jobs, { value = name, label = job.label, grades = grades })
        end
        TriggerClientEvent('mt_bossmenu:client:openAdminMenu', xPlayer.source, jobs)
    else
        xPlayer.showNotification("~r~No tienes permisos suficientes.")
    end
end, false, { help = "Abrir menú de administración de Boss Menu" })

-- Point Request Event
RegisterNetEvent('mt_bossmenu:server:requestPoints', function()
    TriggerClientEvent('mt_bossmenu:client:updatePoints', source, PointService.GetPoints())
end)

-- Billing Request Event
RegisterNetEvent('mt_bossmenu:server:requestBillingSettings', function()
    TriggerClientEvent('mt_bossmenu:client:updateBillingSettings', source, BillingService.GetSettings())
end)

-- Billing System Events
RegisterNetEvent('mt_bossmenu:server:sendBill', function(targetId, amount)
    BillingService.SendBill(source, targetId, amount)
end)

RegisterNetEvent('mt_bossmenu:server:processBill', function(senderId, amount, accepted)
    BillingService.ProcessBill(source, senderId, amount, accepted)
end)

-- Auto-Pay Loop (Server Time Based)
CreateThread(function()
    while true do
        local currentTime = os.date("%H:%M")
        -- Pago automático basado en BD pendiente de implementar en BillingService
        Wait(60000)
    end
end)