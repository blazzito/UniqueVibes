-- =====================================================
-- MINESWEEPER MINIGAME - CLIENT
-- =====================================================

local isMinesweeper = false
local minesweeperCallback = nil

-- =====================================================
-- FUNCIÓN PRINCIPAL - INICIAR MINESWEEPER
-- =====================================================

---@param difficulty string Dificultad: 'easy', 'medium', 'hard', 'extreme'
---@param callback function Función que se ejecuta al terminar (success: bool)
---@return boolean success Si se pudo iniciar el minijuego
function StartMinesweeper(difficulty, callback)
    
    
    if isMinesweeper then
        isMinesweeper = false
        minesweeperCallback = nil
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closeMinesweeper' })
    end
    
    difficulty = difficulty or 'medium'
    
    -- Verificar si existe la dificultad
    if not Config.Minesweeper or not Config.Minesweeper.Difficulty[difficulty] then
        
        return false
    end
    
    isMinesweeper = true
    minesweeperCallback = callback
    
    
    -- Iniciar animación
    startMinesweeperAnimation()
    
    -- Obtener configuración de dificultad
    local config = Config.Minesweeper.Difficulty[difficulty]
    
    
    -- Enviar datos al NUI
    SendNUIMessage({
        action = 'startMinesweeper',
        config = {
            gridSize = config.gridSize,
            mines = config.mines,
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

function startMinesweeperAnimation()
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

function stopMinesweeperAnimation()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
end

-- =====================================================
-- CALLBACKS DEL NUI
-- =====================================================

-- Resultado
RegisterNUICallback('minesweeperResult', function(data, cb)
    
    
    local success = data.success
    
    SetNuiFocus(false, false)
    
    cb('ok')
    
    -- Procesar resultado
    isMinesweeper = false
    stopMinesweeperAnimation()
    
    -- Ejecutar callback
    if minesweeperCallback then
        minesweeperCallback(success)
        minesweeperCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'minesweeper', success)
end)

RegisterNUICallback('closeMinesweeper', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isMinesweeper = false
    stopMinesweeperAnimation()

    if minesweeperCallback then
        minesweeperCallback(false)
        minesweeperCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'minesweeper', false)
end)

-- =====================================================
-- EXPORT
-- =====================================================

exports('StartMinesweeper', StartMinesweeper)

-- =====================================================
-- COMANDO DE PRUEBA
-- =====================================================

RegisterCommand('testminesweeper', function(source, args)
    local difficulty = args[1] or 'medium'
    
    
    
    StartMinesweeper(difficulty, function(success)
        if success then
            
        else
            
        end
    end)
end, false)



