-- =====================================================
-- MINIJUEGOS - SERVER SIDE
-- =====================================================

local ESX = nil
if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()
end

-- =====================================================
-- EVENTOS PARA INICIAR MINIJUEGOS DESDE EL SERVIDOR
-- =====================================================

--- Inicia un minijuego para un jugador específico
--- @param target number ID del jugador
--- @param gameName string Nombre del juego (lockpick, hacking, etc)
--- @param difficulty string Dificultad (easy, medium, hard, extreme)
RegisterNetEvent('mt-minijuegos:server:startGame', function(target, gameName, difficulty)
    TriggerClientEvent('mt-minijuegos:startGame', target, gameName, difficulty)
end)

-- =====================================================
-- CALLBACKS PARA OBTENER RESULTADOS EN EL SERVIDOR
-- =====================================================
-- Si usas ox_lib, puedes usar estos callbacks

if GetResourceState('ox_lib') == 'started' and lib then
    lib.callback.register('mt-minijuegos:server:requestGame', function(source, gameName, difficulty)
        local result = nil
        
        -- Iniciamos el minijuego en el cliente y esperamos el resultado
        -- Nota: Esto requiere que el cliente tenga un lib.callback.register para responder
        -- Como no queremos modificar todos los archivos del cliente, usaremos una promesa simple
        
        -- TODO: Implementar si se requiere una respuesta síncrona en el servidor
        return true
    end)
end

-- =====================================================
-- MANEJO DE ITEMS (OPCIONAL - ESX)
-- =====================================================

if ESX then
    -- Ejemplo de cómo podrías registrar un item para usar un minijuego
    ESX.RegisterUsableItem('lockpick', function(source)
        TriggerClientEvent('mt-minijuegos:startGame', source, 'lockpick', 'medium')
    end)
    
    ESX.RegisterUsableItem('hacking_device', function(source)
        TriggerClientEvent('mt-minijuegos:startGame', source, 'hacking', 'medium')
    end)
end

-- =====================================================
-- LOG DE RESULTADOS (PARA DEBUG O ANCHO DE BANDA)
-- =====================================================

RegisterNetEvent('mt-minijuegos:server:gameResult', function(gameName, success)
    local _source = source
    if success then
        print(string.format("^2[Minijuegos]^7 Jugador %s ha GANADO en %s", _source, gameName))
    else
        print(string.format("^1[Minijuegos]^7 Jugador %s ha PERDIDO en %s", _source, gameName))
    end
end)

