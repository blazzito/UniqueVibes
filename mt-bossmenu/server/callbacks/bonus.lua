
ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('mt_bossmenu:giveBonusToSelectedEmployees', function(source, cb, data)
    if not Guard.IsBoss(source) then return cb(false, Constants.ErrorCodes.NOT_ALLOWED) end

    local isValid, amount = Guard.ValidateAmount(data.amount)
    if not isValid then return cb(false, Constants.ErrorCodes.INVALID_DATA) end

    local success, err = BonusService.GiveBonusToSelected(source, data.employees, amount, data.reason)
    cb(success, err)
end)

ESX.RegisterServerCallback('mt_bossmenu:giveBonusToAllEmployees', function(source, cb, data)
    if not Guard.IsBoss(source) then return cb(false, Constants.ErrorCodes.NOT_ALLOWED) end

    local isValid, amount = Guard.ValidateAmount(data.amount)
    if not isValid then return cb(false, Constants.ErrorCodes.INVALID_DATA) end

    local success, err = BonusService.GiveBonusToAll(source, amount, data.reason)
    cb(success, err)
end)

ESX.RegisterServerCallback('mt_bossmenu:giveBonusToRanks', function(source, cb, data)
    cb(false, "feature_refactored_use_specific")
end)

ESX.RegisterServerCallback('mt_bossmenu:giveBonusToOnlineEmployees', function(source, cb, data)
    if not Guard.IsBoss(source) then return cb(false, Constants.ErrorCodes.NOT_ALLOWED) end
    local isValid, amount = Guard.ValidateAmount(data.amount)
    if not isValid then return cb(false, Constants.ErrorCodes.INVALID_DATA) end

    local xPlayer = ESX.GetPlayerFromId(source)
    local jobName = xPlayer.getJob().name
    local xPlayers = ESX.GetExtendedPlayers('job', jobName)
    
    local totalCost = amount * #xPlayers
    local balance = SocietyService.GetBalance(jobName)
    
    if balance < totalCost then return cb(false, Constants.ErrorCodes.NOT_ENOUGH_MONEY) end

    for _, xTarget in ipairs(xPlayers) do
        SocietyService.RemoveMoney(jobName, amount)
        xTarget.addMoney(amount)
        TriggerClientEvent('mt_bossmenu:notify', xTarget.source, TranslateCap('receive_bonus', Utils.FormatCurrency(amount)), 'info')
    end
    
    LogBonusOnlineEmployees(source, jobName, amount, #xPlayers, balance - totalCost, data.reason)
    cb(true, 'bonus_given')
end)