
ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('mt_bossmenu:getInitialData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not Guard.IsBoss(source) then return cb(nil) end

    local jobName = xPlayer.getJob().name
    
    local rawEmployees = EmployeeService.GetEmployees(jobName)
    local formattedEmployees = {}
    for _, row in ipairs(rawEmployees) do
        table.insert(formattedEmployees, {
            identifier = row.identifier,
            firstname = row.firstname or "Desconocido",
            lastname = row.lastname or "",
            jobgrade = SocietyService.GetGradeLabel(jobName, row.job_grade) or "Rango "..tostring(row.job_grade),
            jobgradenr = tonumber(row.job_grade) or 0,
            salary = SocietyService.GetSalary(jobName, row.job_grade) or 0,
            isOnline = (ESX.GetPlayerFromIdentifier(row.identifier) ~= nil)
        })
    end

    local data = {
        stats = {
            employees = #formattedEmployees,
            onduty = #ESX.GetExtendedPlayers('job', jobName),
            balance = SocietyService.GetBalance(jobName),
            billingEnabled = BillingService.GetSettings().enabled,
            isBoss = true,
            jobName = jobName,
            jobLabel = xPlayer.getJob().label
        },
        employees = formattedEmployees,
        salaries = SocietyService.GetGrades(jobName),
        currency = Config.Currency
    }

    cb(data)
end)

ESX.RegisterServerCallback('mt_bossmenu:getEmployees', function(source, cb, jobName)
    if not Guard.IsBoss(source, jobName) then return cb(0, 0, 0) end
    
    local employees = EmployeeService.GetEmployees(jobName)
    local xPlayers = ESX.GetExtendedPlayers('job', jobName)
    local factionmoney = SocietyService.GetBalance(jobName)

    cb(#employees, #xPlayers, factionmoney)
end)

ESX.RegisterServerCallback('mt_bossmenu:addEmployee', function(source, cb, data)
    if not Guard.IsBoss(source) then return cb('error') end

    local targetSource = tonumber(data.message)
    if not targetSource then return cb(false) end

    local success = EmployeeService.AddEmployee(source, targetSource)
    cb(success)
end)

ESX.RegisterServerCallback('mt_bossmenu:promoteEmployee', function(source, cb, data)
    if not Guard.IsBoss(source) then return cb('error') end

    local employee = data.employee
    local canTarget, err = Guard.CanTarget(source, employee.identifier)
    if not canTarget then return cb(err) end

    local highestGrade = 0
    local grades = SocietyService.GetGrades(ESX.GetPlayerFromId(source).getJob().name)
    for _, v in ipairs(grades) do if v.grade > highestGrade then highestGrade = v.grade end end

    local currentGrade = tonumber(employee.jobgradenr) or 0
    if currentGrade >= highestGrade then return cb('highest_grade') end

    local success = EmployeeService.SetGrade(source, employee.identifier, currentGrade + 1, true)
    cb(success and 'success' or 'error')
end)

ESX.RegisterServerCallback('mt_bossmenu:demoteEmployee', function(source, cb, data)
    if not Guard.IsBoss(source) then return cb('error') end

    local employee = data.employee
    local canTarget, err = Guard.CanTarget(source, employee.identifier)
    if not canTarget then return cb(err) end

    local currentGrade = tonumber(employee.jobgradenr) or 0
    if currentGrade <= 0 then return cb('lowest_grade') end

    local success = EmployeeService.SetGrade(source, employee.identifier, currentGrade - 1, false)
    cb(success and 'success' or 'error')
end)

ESX.RegisterServerCallback('mt_bossmenu:fireEmployee', function(source, cb, data)
    if not Guard.IsBoss(source) then return cb('error') end

    local employee = data.employee
    local canTarget, err = Guard.CanTarget(source, employee.identifier)
    if not canTarget then return cb(err) end

    local success = EmployeeService.FireEmployee(source, employee.identifier)
    cb(success and 'success' or 'error')
end)

ESX.RegisterServerCallback('mt_bossmenu:changeSalary', function(source, cb, data)
    if not Guard.IsBoss(source) then return cb('error') end

    local grade = tonumber(data.grade)
    local salary = tonumber(data.salary)
    
    local success, err = FinanceService.ChangeSalary(source, grade, salary)
    cb(success and 'success' or err)
end)

ESX.RegisterServerCallback('mt_bossmenu:depositMoney', function(source, cb, data)
    local isValid, amount = Guard.ValidateAmount(data.amount)
    if not isValid then return cb('error') end
    
    if not Guard.IsBoss(source) then return cb('error') end

    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getAccount('money').money < amount then return cb('not_enough_money') end

    xPlayer.removeAccountMoney('money', amount)
    SocietyService.AddMoney(xPlayer.getJob().name, amount)
    
    AddTransaction(source, { action = Constants.Transactions.DEPOSIT, amount = amount })
    LogDeposit(source, xPlayer.getJob().name, amount, SocietyService.GetBalance(xPlayer.getJob().name))
    
    cb('success')
end)

ESX.RegisterServerCallback('mt_bossmenu:withdrawMoney', function(source, cb, data)
    local isValid, amount = Guard.ValidateAmount(data.amount)
    if not isValid then return cb('error') end
    
    if not Guard.IsBoss(source) then return cb('error') end

    local xPlayer = ESX.GetPlayerFromId(source)
    local jobName = xPlayer.getJob().name
    local balance = SocietyService.GetBalance(jobName)

    if balance < amount then return cb('not_enough_money') end

    SocietyService.RemoveMoney(jobName, amount)
    xPlayer.addAccountMoney('money', amount)
    
    AddTransaction(source, { action = Constants.Transactions.WITHDRAW, amount = amount })
    LogWithdraw(source, jobName, amount, balance - amount)
    
    cb('success')
end)

ESX.RegisterServerCallback('mt_bossmenu:getEmployeesList', function(source, cb, jobName)
    local rawEmployees = EmployeeService.GetEmployees(jobName)
    local formatted = {}
    for _, row in ipairs(rawEmployees) do
        table.insert(formatted, {
            identifier = row.identifier,
            firstname = row.firstname or "Desconocido",
            lastname = row.lastname or "",
            jobgrade = SocietyService.GetGradeLabel(jobName, row.job_grade) or "Rango "..tostring(row.job_grade),
            jobgradenr = tonumber(row.job_grade) or 0,
            salary = SocietyService.GetSalary(jobName, row.job_grade) or 0,
            isOnline = (ESX.GetPlayerFromIdentifier(row.identifier) ~= nil)
        })
    end
    cb(formatted)
end)

ESX.RegisterServerCallback('mt_bossmenu:getSalaries', function(source, cb, jobName)
    cb(SocietyService.GetGrades(jobName))
end)

-- Admin Callbacks for Dynamic Points
ESX.RegisterServerCallback('mt_bossmenu:server:createPoint', function(source, cb, data)
    local success = PointService.CreatePoint(data)
    cb(success)
end)

ESX.RegisterServerCallback('mt_bossmenu:server:updatePoint', function(source, cb, data)
    local success = PointService.UpdatePoint(data.id, data)
    cb(success)
end)

ESX.RegisterServerCallback('mt_bossmenu:server:deletePoint', function(source, cb, data)
    local success = PointService.DeletePoint(data.id)
    cb(success)
end)

ESX.RegisterServerCallback('mt_bossmenu:server:toggleBillingSystem', function(source, cb, data)
    local settings = BillingService.GetSettings()
    settings.enabled = data.enabled
    BillingService.SaveSettings(settings)
    cb(true)
end)

ESX.RegisterServerCallback('mt_bossmenu:server:updateBillingPermission', function(source, cb, data)
    local settings = BillingService.GetSettings()
    
    local found = false
    for i, job in ipairs(settings.allowedJobs) do
        if job == data.job then
            if not data.enabled then
                table.remove(settings.allowedJobs, i)
            end
            found = true
            break
        end
    end
    
    if not found and data.enabled then
        table.insert(settings.allowedJobs, data.job)
    end
    
    BillingService.SaveSettings(settings)
    cb(true)
end)