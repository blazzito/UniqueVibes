-- =====================================================
-- LOCKPICK MINIGAME - CLIENT
-- =====================================================

local isLockpicking = false
local lockpickCallback = nil

-- =====================================================
-- FUNCIÓN PRINCIPAL - INICIAR LOCKPICK
-- =====================================================

---@param difficulty string Dificultad: 'easy', 'medium', 'hard', 'extreme'
---@param callback function Función que se ejecuta al terminar (success: bool)
---@return boolean success Si se pudo iniciar el minijuego
function StartLockpick(difficulty, callback)
    if isLockpicking then
        isLockpicking = false
        lockpickCallback = nil
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'closeLockpick' })
    end
    
    difficulty = difficulty or 'medium'
    
    -- Verificar si existe la dificultad
    if not Config.Lockpick.Difficulty[difficulty] then
        
        return false
    end
    
    isLockpicking = true
    lockpickCallback = callback
    
    
    -- Iniciar animación
    startLockpickAnimation()
    
    -- Obtener configuración de dificultad
    local config = Config.Lockpick.Difficulty[difficulty]
    
    
    -- Enviar datos al NUI
    SendNUIMessage({
        action = 'startLockpick',
        config = {
            pins = config.pins,
            timePerPin = config.timePerPin,
            sweetSpotSize = config.sweetSpotSize,
            moveSpeed = config.moveSpeed
        }
    })
    
    
    -- Abrir NUI
    SetNuiFocus(true, true)
    
    
    
    return true
end

-- =====================================================
-- ANIMACIÓN DE LOCKPICK
-- =====================================================

function startLockpickAnimation()
    local ped = PlayerPedId()
    
    -- Cargar animación
    RequestAnimDict(Config.Lockpick.Animation.dict)
    while not HasAnimDictLoaded(Config.Lockpick.Animation.dict) do
        Wait(10)
    end
    
    -- Reproducir animación
    TaskPlayAnim(
        ped,
        Config.Lockpick.Animation.dict,
        Config.Lockpick.Animation.anim,
        8.0, -8.0, -1,
        Config.Lockpick.Animation.flag,
        0, false, false, false
    )
end

function stopLockpickAnimation()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
end

-- =====================================================
-- CALLBACKS DEL NUI
-- =====================================================

-- Resultado del lockpick
RegisterNUICallback('lockpickResult', function(data, cb)
    
    
    local success = data.success
    
    
    -- IMPORTANTE: Liberar NUI focus ANTES de responder el callback
    SetNuiFocus(false, false)
    
    
    
    -- Responder al NUI
    cb('ok')
    
    
    
    -- Procesar resultado
    isLockpicking = false
    stopLockpickAnimation()
    
    
    
    -- Ejecutar callback (si fue registrado localmente)
    if lockpickCallback then
        lockpickCallback(success)
        lockpickCallback = nil
    end

    -- Evento para recursos externos que esperen el resultado
    TriggerEvent('mt-minijuegos:result', 'lockpick', success)

end)

-- Cerrar NUI (ESC)
RegisterNUICallback('closeLockpick', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')

    isLockpicking = false
    stopLockpickAnimation()

    if lockpickCallback then
        lockpickCallback(false)
        lockpickCallback = nil
    end

    TriggerEvent('mt-minijuegos:result', 'lockpick', false)
end)

-- =====================================================
-- EXPORT
-- =====================================================

exports('StartLockpick', StartLockpick)

-- =====================================================
-- COMANDO DE PRUEBA
-- =====================================================

RegisterCommand('testlockpick', function(source, args)
    local difficulty = args[1] or 'medium'
    
    
    
    StartLockpick(difficulty, function(success)
        if success then
            
            
            -- Ejemplo: Desbloquear vehículo cercano
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
            
            if vehicle and vehicle ~= 0 then
                SetVehicleDoorsLocked(vehicle, 1)
                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                
            end
        else
            
        end
    end)
end, false)



