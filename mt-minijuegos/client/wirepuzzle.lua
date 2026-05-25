-- =====================================================
-- WIRE PUZZLE MINIGAME - CLIENT
-- =====================================================

local isWirePuzzle = false
local wirePuzzleCallback = nil

-- =====================================================
-- FUNCIÓN PRINCIPAL - INICIAR WIRE PUZZLE
-- =====================================================

---@param difficulty string Dificultad: 'easy', 'medium', 'hard', 'extreme'
---@param callback function Función que se ejecuta al terminar (success: bool)
---@return boolean success Si se pudo iniciar el minijuego
function StartWirePuzzle(difficulty, callback)
    
    
    if isWirePuzzle then
        isWirePuzzle = false
        wirePuzzleCallback = nil
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closeWirePuzzle' })
    end
    
    difficulty = difficulty or 'medium'
    
    -- Verificar si existe la dificultad
    if not Config.WirePuzzle or not Config.WirePuzzle.Difficulty[difficulty] then
        
        return false
    end
    
    isWirePuzzle = true
    wirePuzzleCallback = callback
    
    
    -- Iniciar animación
    startWirePuzzleAnimation()
    
    -- Obtener configuración de dificultad
    local config = Config.WirePuzzle.Difficulty[difficulty]
    
    
    -- Enviar datos al NUI
    SendNUIMessage({
        action = 'startWirePuzzle',
        config = {
            wireCount = config.wireCount,
            timeLimit = config.timeLimit,
            mistakes = config.mistakes
        }
    })
    
    
    -- Abrir NUI
    SetNuiFocus(true, true)
    
    
    
    return true
end

-- =====================================================
-- ANIMACIÓN
-- =====================================================

function startWirePuzzleAnimation()
    local ped = PlayerPedId()
    
    -- Cargar animación
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

function stopWirePuzzleAnimation()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
end

-- =====================================================
-- CALLBACKS DEL NUI
-- =====================================================

-- Resultado
RegisterNUICallback('wirePuzzleResult', function(data, cb)
    
    
    local success = data.success
    
    SetNuiFocus(false, false)
    
    cb('ok')
    
    -- Procesar resultado
    isWirePuzzle = false
    stopWirePuzzleAnimation()
    
    -- Ejecutar callback
    if wirePuzzleCallback then
        wirePuzzleCallback(success)
        wirePuzzleCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'wirepuzzle', success)
end)

RegisterNUICallback('closeWirePuzzle', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isWirePuzzle = false
    stopWirePuzzleAnimation()

    if wirePuzzleCallback then
        wirePuzzleCallback(false)
        wirePuzzleCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'wirepuzzle', false)
end)

-- =====================================================
-- EXPORT
-- =====================================================

exports('StartWirePuzzle', StartWirePuzzle)

-- =====================================================
-- COMANDO DE PRUEBA
-- =====================================================

RegisterCommand('testwirepuzzle', function(source, args)
    local difficulty = args[1] or 'medium'
    
    
    
    StartWirePuzzle(difficulty, function(success)
        if success then
            
        else
            
        end
    end)
end, false)



