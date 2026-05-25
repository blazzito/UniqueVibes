
BillingService = {}
local settings = {
    enabled = true,
    percentageSociety = 60,
    percentageWorker = 40,
    allowedJobs = {}
}

function BillingService.GetSettings()
    return settings
end

function BillingService.LoadSettings()
    local result = MySQL.single.await('SELECT value FROM mt_bossmenu_settings WHERE name = ?', { 'billing' })
    if result then
        settings = json.decode(result.value)
    end
end

function BillingService.SaveSettings(data)
    settings = data
    MySQL.update.await('INSERT INTO mt_bossmenu_settings (name, value) VALUES (?, ?) ON DUPLICATE KEY UPDATE value = ?', {
        'billing', json.encode(settings), json.encode(settings)
    })
    TriggerClientEvent('mt_bossmenu:client:updateBillingSettings', -1, settings)
end

function BillingService.SendBill(source, targetId, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then return end
    
    -- Check if job is allowed to send bills (dynamic check)
    local isAllowed = false
    for _, job in ipairs(settings.allowedJobs or {}) do
        if xPlayer.job.name == job then isAllowed = true break end
    end
    
    if not isAllowed then return end

    TriggerClientEvent('mt_bossmenu:client:receiveBill', targetId, source, amount, xPlayer.getJob().label)
end

function BillingService.ProcessBill(source, senderId, amount, accepted)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xSender = ESX.GetPlayerFromId(senderId)
    
    if not accepted then
        if xSender then xSender.showNotification("La factura fue rechazada.") end
        return
    end

    if xPlayer.getAccount('bank').money >= amount then
        xPlayer.removeAccountMoney('bank', amount)
        
        local societyAmount = math.floor(amount * (settings.percentageSociety / 100))
        local workerAmount = math.floor(amount * (settings.percentageWorker / 100))
        
        SocietyService.AddMoney(xSender.getJob().name, societyAmount)
        xSender.addAccountMoney('bank', workerAmount)
        
        xSender.showNotification("Factura pagada con éxito.")
        xPlayer.showNotification("Has pagado la factura.")
        
        LogTransaction(senderId, { action = 'Bill Payment', amount = amount })
    else
        xPlayer.showNotification("No tienes suficiente dinero en el banco.")
        if xSender then xSender.showNotification("El cliente no tiene suficiente dinero.") end
    end
end

-- Initialize settings
CreateThread(function()
    Wait(1000)
    BillingService.LoadSettings()
end)
