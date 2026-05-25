FW = {}

FW = {}

local path <const> = "bridge/framework/"

-- Directly loading es_extended for strictly ESX compatibility
local dir = (path.."%s/%s"):format(lib.context, "es_extended")
FW = lib.load(dir)
