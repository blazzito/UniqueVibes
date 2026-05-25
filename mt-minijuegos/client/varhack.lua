-- =====================================================
-- VAR HACK MINIGAME - CLIENT
-- =====================================================

local isVarHack = false
local varHackCallback = nil

function StartVarHack(difficulty, callback)
    
    
    if isVarHack then
        isVarHack = false
        varHackCallback = nil
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closeVarHack' })
    end
    
    difficulty = difficulty or 'medium'
    
    if not Config.VarHack or not Config.VarHack.Difficulty[difficulty] then
        
        return false
    end
    
    isVarHack = true
    varHackCallback = callback
    
    local ped = PlayerPedId()
    RequestAnimDict('anim@heists@prison_heiststation@cop_reactions')
    while not HasAnimDictLoaded('anim@heists@prison_heiststation@cop_reactions') do
        Wait(10)
    end
    TaskPlayAnim(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 8.0, -8.0, -1, 49, 0, false, false, false)
    
    local config = Config.VarHack.Difficulty[difficulty]
    
    SendNUIMessage({
        action = 'startVarHack',
        config = {
            lines = config.lines,
            symbols = config.symbols,
            timeLimit = config.timeLimit
        }
    })
    
    SetNuiFocus(true, true)
    
    return true
end

RegisterNUICallback('varHackResult', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isVarHack = false
    ClearPedTasks(PlayerPedId())

    if varHackCallback then
        varHackCallback(data.success)
        varHackCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'varhack', data.success)
end)

RegisterNUICallback('closeVarHack', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isVarHack = false
    ClearPedTasks(PlayerPedId())

    if varHackCallback then
        varHackCallback(false)
        varHackCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'varhack', false)
end)

exports('StartVarHack', StartVarHack)

RegisterCommand('testvarhack', function(source, args)
    local difficulty = args[1] or 'medium'
    StartVarHack(difficulty, function(success)
        
    end)
end, false)



