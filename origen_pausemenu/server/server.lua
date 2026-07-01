local ESX = exports['es_extended']:getSharedObject()
local playerStreaks = {}

RegisterNetEvent("pausemenu:server")
AddEventHandler("pausemenu:server", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if not xPlayer then return end

    local jobLabel = xPlayer.job.label or xPlayer.job.name
    local jobGrade = xPlayer.job.grade_label or ""
    local jobDisplay = jobLabel .. " - " .. jobGrade

    local money = xPlayer.getMoney()
    local bank = xPlayer.getAccount('bank').money
    local name = xPlayer.getName()
    local players = #GetPlayers()
    local maxPlayers = GetConvarInt('sv_maxclients', 32)
    
    local policeCount = 0
    local emsCount = 0
    local adminCount = 0

    for _, pid in ipairs(GetPlayers()) do
        local p = ESX.GetPlayerFromId(pid)
        if p then
            if p.job.name == 'police' then
                policeCount = policeCount + 1
            elseif p.job.name == 'ambulance' then
                emsCount = emsCount + 1
            end
            
            local group = p.getGroup()
            if group == 'admin' or group == 'superadmin' or group == 'mod' then
                adminCount = adminCount + 1
            end
        end
    end

    local streak = playerStreaks[xPlayer.identifier] or 0

    TriggerClientEvent("pausemenu:client", src, {name=name, job=jobDisplay, cash=money, bank=bank, players=players, max=maxPlayers, police=policeCount, ems=emsCount, admins=adminCount, streak=streak})
end)

RegisterServerEvent('salir')
AddEventHandler('salir', function()
    DropPlayer(source, "¡Te fuiste del servidor!")
end) 

local openBusinesses = {}

local function UpdateBusinesses()
    local players = ESX.GetPlayers()
    local jobCounts = {}
    
    for _, playerId in ipairs(players) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer and xPlayer.job then
            local jobName = xPlayer.job.name
            jobCounts[jobName] = (jobCounts[jobName] or 0) + 1
        end
    end
    
    for i, negocio in ipairs(Config.Negocios) do
        local isOpen = (jobCounts[negocio.job] or 0) > 0
        
        if openBusinesses[negocio.job] ~= isOpen then
            openBusinesses[negocio.job] = isOpen
            TriggerClientEvent("origen_notify:business", -1, {job = negocio.job, value = isOpen})
        end
    end
end

local function LoadPlayerStreak(xPlayer)
    if not xPlayer or not xPlayer.identifier then return end

    MySQL.Async.fetchAll('SELECT login_streak, last_login_date FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result)
        local streak = 0
        local lastDate = nil
        if result[1] then
            streak = result[1].login_streak or 0
            lastDate = result[1].last_login_date
        end

        local currentDate = os.date("%Y-%m-%d")

        if lastDate == currentDate then
            playerStreaks[xPlayer.identifier] = streak
        else
            local y, m, d = currentDate:match("(%d+)-(%d+)-(%d+)")
            local todayTime = os.time({year=y, month=m, day=d})

            local isYesterday = false
            if lastDate and lastDate ~= "" then
                local ly, lm, ld = lastDate:match("(%d+)-(%d+)-(%d+)")
                if ly and lm and ld then
                    local lastTime = os.time({year=ly, month=lm, day=ld})
                    if lastTime and (todayTime - lastTime <= 86400 * 1.5) and (todayTime - lastTime >= 86400 * 0.5) then
                        isYesterday = true
                    end
                end
            end

            if isYesterday then
                streak = streak + 1
                if streak > Config.MaxStreak then streak = 1 end
            else
                streak = 1
            end
            
            playerStreaks[xPlayer.identifier] = streak
            
            -- Give reward if exists
            local reward = Config.DailyRewards[streak]
            if reward then
                if reward.type == "money" then
                    xPlayer.addAccountMoney('bank', reward.amount)
                    TriggerClientEvent('esx:showNotification', xPlayer.source, "Recompensa Diaria: Has recibido " .. reward.label .. " en el banco.")
                elseif reward.type == "item" then
                    xPlayer.addInventoryItem(reward.item, reward.amount)
                    TriggerClientEvent('esx:showNotification', xPlayer.source, "Recompensa Diaria: Has recibido " .. reward.amount .. "x " .. reward.label .. ".")
                end
            else
                TriggerClientEvent('esx:showNotification', xPlayer.source, "Recompensa Diaria: ¡Racha de " .. streak .. " días! Mantén la racha.")
            end

            MySQL.Async.execute('UPDATE users SET login_streak = @streak, last_login_date = @date WHERE identifier = @identifier', {
                ['@streak'] = streak,
                ['@date'] = currentDate,
                ['@identifier'] = xPlayer.identifier
            })
        end
    end)
end

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(playerId, xPlayer)
    for i, negocio in ipairs(Config.Negocios) do
        if openBusinesses[negocio.job] ~= nil then
            TriggerClientEvent("origen_notify:business", playerId, {job = negocio.job, value = openBusinesses[negocio.job]})
        end
    end
    UpdateBusinesses()

    -- Login Rewards Logic
    LoadPlayerStreak(xPlayer)
end)

RegisterNetEvent("esx:playerDropped")
AddEventHandler("esx:playerDropped", function(playerId)
    SetTimeout(1000, function()
        UpdateBusinesses()
    end)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(playerId, job, lastJob)
    UpdateBusinesses()
end)

CreateThread(function()
    Wait(2000)
    UpdateBusinesses()
    
    local players = ESX.GetPlayers()
    for _, playerId in ipairs(players) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            LoadPlayerStreak(xPlayer)
        end
    end
end)