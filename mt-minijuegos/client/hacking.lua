-- =====================================================
-- HACKING MINIGAME - CLIENT
-- =====================================================

local isHacking = false
local hackingCallback = nil

-- =====================================================
-- FUNCIÓN PRINCIPAL - INICIAR HACKING
-- =====================================================

---@param difficulty string Dificultad: 'easy', 'medium', 'hard', 'extreme'
---@param callback function Función que se ejecuta al terminar (success: bool)
---@return boolean success Si se pudo iniciar el minijuego
function StartHacking(difficulty, callback)
    
    
    if isHacking then
        isHacking = false
        hackingCallback = nil
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closeHacking' })
    end
    
    difficulty = difficulty or 'medium'
    
    -- Verificar si existe la dificultad
    if not Config.Hacking or not Config.Hacking.Difficulty[difficulty] then
        
        return false
    end
    
    isHacking = true
    hackingCallback = callback
    
    
    -- Iniciar animación
    startHackingAnimation()
    
    -- Obtener configuración de dificultad
    local config = Config.Hacking.Difficulty[difficulty]
    
    
    -- Enviar datos al NUI
    SendNUIMessage({
        action = 'startHacking',
        config = {
            levels = config.levels,
            timePerLevel = config.timePerLevel,
            sequenceLength = config.sequenceLength
        }
    })
    
    
    -- Abrir NUI
    SetNuiFocus(true, true)
    
    
    
    return true
end

-- =====================================================
-- ANIMACIÓN DE HACKING
-- =====================================================

function startHackingAnimation()
    local ped = PlayerPedId()
    
    -- Cargar animación (usando laptop/tablet)
    RequestAnimDict('anim@heists@prison_heiststation@cop_reactions')
    while not HasAnimDictLoaded('anim@heists@prison_heiststation@cop_reactions') do
        Wait(10)
    end
    
    -- Reproducir animación
    TaskPlayAnim(
        ped,
        'anim@heists@prison_heiststation@cop_reactions',
        'cop_b_idle',
        8.0, -8.0, -1,
        49,
        0, false, false, false
    )
end

function stopHackingAnimation()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
end

-- =====================================================
-- CALLBACKS DEL NUI
-- =====================================================

-- Resultado del hacking
RegisterNUICallback('hackingResult', function(data, cb)
    
    
    local success = data.success
    
    
    SetNuiFocus(false, false)
    
    
    
    cb('ok')
    
    
    
    -- Procesar resultado
    isHacking = false
    stopHackingAnimation()
    
    
    
    if hackingCallback then
        hackingCallback(success)
        hackingCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'hacking', success)
end)

RegisterNUICallback('closeHacking', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isHacking = false
    stopHackingAnimation()

    if hackingCallback then
        hackingCallback(false)
        hackingCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'hacking', false)
end)

-- =====================================================
-- EXPORT
-- =====================================================

exports('StartHacking', StartHacking)

-- =====================================================
-- COMANDO DE PRUEBA
-- =====================================================

RegisterCommand('testhacking', function(source, args)
    local difficulty = args[1] or 'medium'
    
    
    
    StartHacking(difficulty, function(success)
        if success then
            
            -- Aquí podrías dar recompensas, abrir puertas, etc.
        else
            
        end
    end)
end, false)



