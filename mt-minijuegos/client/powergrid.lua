-- =====================================================
-- POWER GRID MINIGAME - CLIENT
-- =====================================================

local isPowerGrid = false
local powerGridCallback = nil

function StartPowerGrid(difficulty, callback)
    
    
    if isPowerGrid then
        isPowerGrid = false
        powerGridCallback = nil
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closePowerGrid' })
    end
    
    difficulty = difficulty or 'medium'
    
    if not Config.PowerGrid or not Config.PowerGrid.Difficulty[difficulty] then
        
        return false
    end
    
    isPowerGrid = true
    powerGridCallback = callback
    
    local ped = PlayerPedId()
    RequestAnimDict('anim@heists@prison_heiststation@cop_reactions')
    while not HasAnimDictLoaded('anim@heists@prison_heiststation@cop_reactions') do
        Wait(10)
    end
    TaskPlayAnim(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 8.0, -8.0, -1, 49, 0, false, false, false)
    
    local config = Config.PowerGrid.Difficulty[difficulty]
    
    SendNUIMessage({
        action = 'startPowerGrid',
        config = {
            gridSize = config.gridSize,
            pathLength = config.pathLength,
            timeLimit = config.timeLimit
        }
    })
    
    SetNuiFocus(true, true)
    
    return true
end

RegisterNUICallback('powerGridResult', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isPowerGrid = false
    ClearPedTasks(PlayerPedId())

    if powerGridCallback then
        powerGridCallback(data.success)
        powerGridCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'powergrid', data.success)
end)

RegisterNUICallback('closePowerGrid', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isPowerGrid = false
    ClearPedTasks(PlayerPedId())

    if powerGridCallback then
        powerGridCallback(false)
        powerGridCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'powergrid', false)
end)

exports('StartPowerGrid', StartPowerGrid)

RegisterCommand('testpowergrid', function(source, args)
    local difficulty = args[1] or 'medium'
    StartPowerGrid(difficulty, function(success)
        
    end)
end, false)



