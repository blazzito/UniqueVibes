

Guard = {}

---@param source number Player source
---@param jobName string? Optional job name to check against
---@return boolean
function Guard.IsBoss(source, jobName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    local playerJob = xPlayer.getJob()
    local jobToCheck = jobName or playerJob.name
    
    if playerJob.name ~= jobToCheck then return false end

    -- Dynamic boss check: allows common boss grades or names
    return playerJob.grade >= 3 or playerJob.grade_name:lower() == 'boss'
end

---@param source number Executor source
---@param targetIdentifier string Target identifier
---@return boolean, string?
function Guard.CanTarget(source, targetIdentifier)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false, "invalid_executor" end

    if xPlayer.getIdentifier() == targetIdentifier then
        return false, Constants.ErrorCodes.SELF_ACTION
    end

    local targetData = MySQL.single.await('SELECT job FROM users WHERE identifier = ?', { targetIdentifier })
    if not targetData or targetData.job ~= xPlayer.getJob().name then
        return false, "not_same_job"
    end

    return true
end

---@param amount any
---@return boolean, number?
function Guard.ValidateAmount(amount)
    local numericAmount = tonumber(amount)
    if not numericAmount or numericAmount <= 0 then
        return false
    end
    return true, numericAmount
end
