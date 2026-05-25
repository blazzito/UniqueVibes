

FinanceService = {}

function FinanceService.ChangeSalary(source, grade, newSalary)
    local xPlayer = ESX.GetPlayerFromId(source)
    local jobName = xPlayer.getJob().name
    
    if Config.Menus.salaries.maximum and newSalary > Config.Menus.salaries.maximum then
        return false, Constants.ErrorCodes.EXCEEDS_MAXIMUM
    end

    if Config.JobCreator == 'lunar' then
        exports['lunar_jobscreator']:setJobGradeSalary(jobName, grade, newSalary)
        SocietyService.ClearCache(jobName)
        return true
    end

    local oldSalary = SocietyService.GetSalary(jobName, grade)
    local affectedRows = MySQL.update.await('UPDATE job_grades SET salary = ? WHERE job_name = ? AND grade = ?', {
        newSalary, jobName, grade
    })

    if affectedRows > 0 then
        SocietyService.ClearCache(jobName)
        local gradeLabel = SocietyService.GetGradeLabel(jobName, grade)
        
        AddAction(source, {
            action = Constants.Actions.SALARY,
            data = { grade = gradeLabel, salary = newSalary }
        })
        
        LogSalaryChange(source, { name = "Grade " .. gradeLabel }, jobName, gradeLabel, oldSalary, newSalary)
        return true
    end
    return false
end
