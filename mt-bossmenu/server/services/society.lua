
SocietyService = {}
local gradeCache = {}

function SocietyService.GetSocietyAccount(jobName)
    -- Simply return 'society_' .. jobName, as we now handle this dynamically
    -- and assuming addon_account_data follows this pattern or is checked on startup in mysql.lua
    return 'society_' .. jobName
end

function SocietyService.GetBalance(jobName)
    local account = SocietyService.GetSocietyAccount(jobName)
    local result = MySQL.single.await('SELECT money FROM addon_account_data WHERE account_name = ?', { account })
    
    if not result then
        -- Auto-create if not exists
        AddSociety(account)
        return 0
    end
    
    return result.money or 0
end

function SocietyService.AddMoney(jobName, amount)
    local account = SocietyService.GetSocietyAccount(jobName)
    if Config.JobCreator == 'jaksam' then
        exports["jobs_creator"]:addSocietyMoney(jobName, amount)
    else
        TriggerEvent('esx_addonaccount:getSharedAccount', account, function(acc)
            if acc then acc.addMoney(amount) end
        end)
    end
end

function SocietyService.RemoveMoney(jobName, amount)
    local account = SocietyService.GetSocietyAccount(jobName)
    if Config.JobCreator == 'jaksam' then
        exports["jobs_creator"]:removeSocietyMoney(jobName, amount)
    else
        TriggerEvent('esx_addonaccount:getSharedAccount', account, function(acc)
            if acc then acc.removeMoney(amount) end
        end)
    end
end

function SocietyService.GetGrades(jobName)
    if gradeCache[jobName] then return gradeCache[jobName] end
    
    local results = MySQL.query.await('SELECT label, grade, salary FROM job_grades WHERE job_name = ?', { jobName })
    gradeCache[jobName] = results
    return results
end

function SocietyService.GetGradeLabel(jobName, grade)
    local grades = SocietyService.GetGrades(jobName)
    for _, v in ipairs(grades) do
        if v.grade == grade then return v.label end
    end
    return "Unknown"
end

function SocietyService.GetSalary(jobName, grade)
    local grades = SocietyService.GetGrades(jobName)
    for _, v in ipairs(grades) do
        if v.grade == grade then return v.salary end
    end
    return 0
end

function SocietyService.ClearCache(jobName)
    if jobName then gradeCache[jobName] = nil else gradeCache = {} end
end
