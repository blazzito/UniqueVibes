
EmployeeService = {}

function EmployeeService.GetEmployees(jobName)
    return MySQL.query.await('SELECT identifier, firstname, lastname, job_grade FROM users WHERE job = ?', { jobName })
end

function EmployeeService.AddEmployee(source, targetSource)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetSource)
    
    if not xTarget then return false end
    
    local jobName = xPlayer.getJob().name
    xTarget.setJob(jobName, 0)
    
    local affectedRows = MySQL.update.await('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {
        jobName, 0, xTarget.getIdentifier()
    })

    if affectedRows > 0 then
        -- Log action
        AddAction(source, {
            action = Constants.Actions.HIRE,
            data = { target = xTarget.getName() }
        })
        
        local gradeLabel = SocietyService.GetGradeLabel(jobName, 0)
        local salary = SocietyService.GetSalary(jobName, 0)
        LogHire(source, { name = xTarget.getName(), identifier = xTarget.getIdentifier() }, jobName, 0, gradeLabel, salary)
        
        return true
    end
    return false
end

function EmployeeService.FireEmployee(source, targetIdentifier)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromIdentifier(targetIdentifier)
    local jobName = xPlayer.getJob().name

    if xTarget then
        xTarget.setJob(Config.UnemployedJobName, 0)
    end

    local affectedRows = MySQL.update.await('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {
        Config.UnemployedJobName, 0, targetIdentifier
    })

    if affectedRows > 0 then
        AddAction(source, {
            action = Constants.Actions.FIRE,
            data = { target = targetIdentifier } -- Ideally we fetch the name first
        })
        LogFire(source, { identifier = targetIdentifier, name = "Employee" }, jobName)
        return true
    end
    return false
end

function EmployeeService.SetGrade(source, targetIdentifier, newGrade, isPromotion)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromIdentifier(targetIdentifier)
    local jobName = xPlayer.getJob().name

    if xTarget then
        xTarget.setJob(jobName, newGrade)
    end

    local affectedRows = MySQL.update.await('UPDATE users SET job_grade = ? WHERE identifier = ?', {
        newGrade, targetIdentifier
    })

    if affectedRows > 0 then
        local gradeLabel = SocietyService.GetGradeLabel(jobName, newGrade)
        AddAction(source, {
            action = isPromotion and Constants.Actions.PROMOTE or Constants.Actions.DEMOTE,
            data = { target = targetIdentifier, new_grade = gradeLabel }
        })
        return true
    end
    return false
end
