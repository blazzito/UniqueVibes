local moduleType = "banking" -- Module category
local moduleName = "okokbanking" -- THIS module name

-- Don't touch, required to appear in in-game settings
Integrations.modules = Integrations.modules or {}
Integrations.modules[moduleType] = Integrations.modules[moduleType] or {}
Integrations[moduleType] = Integrations[moduleType] or {}
Integrations[moduleType][moduleName] = {}
table.insert(Integrations.modules[moduleType], moduleName)

Integrations[moduleType][moduleName].getSocietyMoney = function(societyName)
    local money = exports['okokBanking']:GetAccount(societyName)
    return money
end

Integrations[moduleType][moduleName].giveMoneyToSociety = function(societyName, amount)
    local success = exports['okokBanking']:AddMoney(societyName, amount)
    return success -- Return true if success, false if not
end

Integrations[moduleType][moduleName].removeMoneyFromSociety = function(societyName, amount)
    local success = exports['okokBanking']:RemoveMoney(societyName, amount)
    return success -- Return true if success, false if not
end
