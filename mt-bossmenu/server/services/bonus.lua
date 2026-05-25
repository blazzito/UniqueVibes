
BonusService = {}

function BonusService.GiveBonusToSelected(source, employees, amount, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    local jobName = xPlayer.getJob().name
    local totalCost = amount * #employees
    
    local balance = SocietyService.GetBalance(jobName)
    if balance < totalCost then
        return false, Constants.ErrorCodes.NOT_ENOUGH_MONEY
    end
    
    local targetsList = {}
    for _, employee in ipairs(employees) do
        local xTarget = ESX.GetPlayerFromIdentifier(employee.identifier)
        if xTarget then
            SocietyService.RemoveMoney(jobName, amount)
            xTarget.addMoney(amount)
            TriggerClientEvent('mt_bossmenu:notify', xTarget.source, TranslateCap('receive_bonus', Utils.FormatCurrency(amount)), 'info')
        else
            MySQL.insert.await('INSERT INTO mt_bossmenu_bonus_queue (identifier, amount, job) VALUES (?, ?, ?)', {
                employee.identifier, amount, jobName
            })
        end
        table.insert(targetsList, { name = employee.firstname .. ' ' .. employee.lastname, identifier = employee.identifier })
    end
    
    LogBonusSpecificEmployees(source, jobName, amount, targetsList, balance - totalCost, reason)
    return true
end

function BonusService.GiveBonusToAll(source, amount, reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    local jobName = xPlayer.getJob().name
    
    local employees = EmployeeService.GetEmployees(jobName)
    if not employees or #employees == 0 then return false, "no_employees" end
    
    local totalCost = amount * #employees
    local balance = SocietyService.GetBalance(jobName)
    
    if balance < totalCost then
        return false, Constants.ErrorCodes.NOT_ENOUGH_MONEY
    end
    
    for _, employee in ipairs(employees) do
        local xTarget = ESX.GetPlayerFromIdentifier(employee.identifier)
        if xTarget then
            SocietyService.RemoveMoney(jobName, amount)
            xTarget.addMoney(amount)
            TriggerClientEvent('mt_bossmenu:notify', xTarget.source, TranslateCap('receive_bonus', Utils.FormatCurrency(amount)), 'info')
        else
            MySQL.insert.await('INSERT INTO mt_bossmenu_bonus_queue (identifier, amount, job) VALUES (?, ?, ?)', {
                employee.identifier, amount, jobName
            })
        end
    end
    
    LogBonusAllEmployees(source, jobName, amount, #employees, balance - totalCost, reason)
    return true
end
