local moduleType = "stash" -- Module category
local moduleName = "jaksam_inventory" -- THIS module name

-- Don't touch, required to appear in in-game settings
Integrations.modules = Integrations.modules or {}
Integrations.modules[moduleType] = Integrations.modules[moduleType] or {}
Integrations[moduleType] = Integrations[moduleType] or {}
Integrations[moduleType][moduleName] = {}
table.insert(Integrations.modules[moduleType], moduleName)

--[[ You can edit below here ]]
Integrations[moduleType][moduleName].open = function(type, markerId)
    local id = "job_stash_" .. markerId
    exports['jaksam_inventory']:openInventory(id)
end
