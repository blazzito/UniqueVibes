-- Inicializado en 0 para evitar nil en el primer ciclo antes del callback del servidor
currentMoney = 0

--[[
    Returns the current player cash money
]]
function getCurrentMoney()
    return currentMoney or 0
end

--[[
    Guarda los datos del vehículo en el servidor (propiedades de mods).
    Se llama después de aplicar cualquier modificación.
]]
function saveVehicleData(vehicle)
    if not vehicle or not DoesEntityExist(vehicle) then return end
    local vehicleProps = GetVehicleData(vehicle)
    if vehicleProps then
        TriggerServerEvent('lls-mechanic:saveVehicleData', vehicleProps)
    end
end

RegisterNetEvent('lls_mechanic:client:OpenUI1', function(source)
    isOpenByAdmin = true
    openUI()
end)

-- ─────────────────────────────────────────────
-- MODO LIBRE — mantiene el foco NUI activo pero
-- pasa el input del mouse al juego para rotar la
-- cámara. El toggle se gestiona 100% desde JS.
-- ─────────────────────────────────────────────
modoLibreActivo = false

RegisterNUICallback('freecam', function(_, cb)
    cb('ok')
    if modoLibreActivo then return end
    modoLibreActivo = true
    RenderScriptCams(false, true, 200, true, true)
    SetNuiFocus(true, false)
    SetNuiFocusKeepInput(true)
end)

RegisterNUICallback('freecamOff', function(_, cb)
    cb('ok')
    modoLibreActivo = false
    SetNuiFocusKeepInput(false)
    -- Solo restaurar si el menú sigue abierto (customVehicle != nil).
    -- Si el menú ya se cerró (backspace → closeUI destruyó las cams y puso
    -- customVehicle = nil), hideHud dispara este callback como efecto secundario
    -- pero las cams ya no existen; llamar RenderScriptCams aquí causaría freeze.
    if customVehicle ~= nil then
        RenderScriptCams(true, false, 0, true, true)
        SetNuiFocus(true, true)
    end
end)
