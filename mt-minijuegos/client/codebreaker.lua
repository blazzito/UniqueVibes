-- =====================================================
-- CODE BREAKER MINIGAME - CLIENT
-- =====================================================

local isCodeBreaking = false
local codeBreakerCallback = nil

-- =====================================================
-- FUNCIÓN PRINCIPAL - INICIAR CODE BREAKER
-- =====================================================

---@param difficulty string Dificultad: 'easy', 'medium', 'hard', 'extreme'
---@param callback function Función que se ejecuta al terminar (success: bool)
---@return boolean success Si se pudo iniciar el minijuego
function StartCodeBreaker(difficulty, callback)
    
    
    if isCodeBreaking then
        isCodeBreaking = false
        codeBreakerCallback = nil
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closeCodeBreaker' })
    end
    
    difficulty = difficulty or 'medium'
    
    -- Verificar si existe la dificultad
    if not Config.CodeBreaker or not Config.CodeBreaker.Difficulty[difficulty] then
        
        return false
    end
    
    isCodeBreaking = true
    codeBreakerCallback = callback
    
    
    -- Iniciar animación
    startCodeBreakerAnimation()
    
    -- Obtener configuración de dificultad
    local config = Config.CodeBreaker.Difficulty[difficulty]
    
    
    -- Enviar datos al NUI
    SendNUIMessage({
        action = 'startCodeBreaker',
        config = {
            gridSize = config.gridSize,
            sequenceLength = config.sequenceLength,
            sequences = config.sequences,
            timeLimit = config.timeLimit
        }
    })
    
    
    -- Abrir NUI
    SetNuiFocus(true, true)
    
    
    
    return true
end

-- =====================================================
-- ANIMACIÓN
-- =====================================================

function startCodeBreakerAnimation()
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

function stopCodeBreakerAnimation()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
end

-- =====================================================
-- CALLBACKS DEL NUI
-- =====================================================

-- Resultado
RegisterNUICallback('codeBreakerResult', function(data, cb)
    
    
    local success = data.success
    
    SetNuiFocus(false, false)
    
    cb('ok')
    
    -- Procesar resultado
    isCodeBreaking = false
    stopCodeBreakerAnimation()
    
    -- Ejecutar callback
    if codeBreakerCallback then
        codeBreakerCallback(success)
        codeBreakerCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'codebreaker', success)
end)

RegisterNUICallback('closeCodeBreaker', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isCodeBreaking = false
    stopCodeBreakerAnimation()

    if codeBreakerCallback then
        codeBreakerCallback(false)
        codeBreakerCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'codebreaker', false)
end)

-- =====================================================
-- EXPORT
-- =====================================================

exports('StartCodeBreaker', StartCodeBreaker)

-- =====================================================
-- COMANDO DE PRUEBA
-- =====================================================

RegisterCommand('testcodebreaker', function(source, args)
    local difficulty = args[1] or 'medium'
    
    
    
    StartCodeBreaker(difficulty, function(success)
        if success then
            
        else
            
        end
    end)
end, false)



