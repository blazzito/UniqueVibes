local moduleType = "search_player" -- Module category
local moduleName = "jaksam_inventory" -- THIS module name

-- Don't touch, required to appear in in-game settings
Integrations.modules = Integrations.modules or {}
Integrations.modules[moduleType] = Integrations.modules[moduleType] or {}
Integrations[moduleType] = Integrations[moduleType] or {}
Integrations[moduleType][moduleName] = {}
table.insert(Integrations.modules[moduleType], moduleName)

--[[
    You can edit below here
]] 
local function canOpenTarget(ped)
    local isPedDead = IsPedDeadOrDying(ped, false)
    local isDeadAnim = IsEntityPlayingAnim(ped, 'dead', 'dead_a', 3)
    local configFlag120 = GetPedConfigFlag(ped, 120, true)
    local isArrestingIdle = IsEntityPlayingAnim(ped, 'mp_arresting', 'idle', 3)
    local isHandsupBase = IsEntityPlayingAnim(ped, 'missminuteman_1ig_2', 'handsup_base', 3)
    local isHandsupEnter = IsEntityPlayingAnim(ped, 'missminuteman_1ig_2', 'handsup_enter', 3)
    local isMuggingHandsup = IsEntityPlayingAnim(ped, 'random@mugging3', 'handsup_standing_base', 3)

    return isPedDead
    or isDeadAnim
    or configFlag120
    or isArrestingIdle
    or isHandsupBase
    or isHandsupEnter
    or isMuggingHandsup
end

Integrations[moduleType][moduleName].search = function(targetServerId)
    local targetPly = GetPlayerFromServerId(targetServerId)
    local targetPed = GetPlayerPed(targetPly)
    if(not canOpenTarget(targetPed)) then
        notifyClient(getLocalizedText("actions:the_player_must_be_handcuffed"))
        return
    end

    local scriptName = "jaksam_inventory"
    exports[scriptName]:openInventory(targetServerId)
end
