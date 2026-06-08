ESX = nil
local isPaused = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- FUNCIÓN: ABRIR MENÚ
function OpenPauseMenu()
    if isPaused then return end
    isPaused = true
    
    -- Pedimos datos y abrimos NUI
    ESX.TriggerServerCallback('blazz_pause:getData', function(data)
        if data then
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = 'open',
                data = data
            })
        else
            -- Si falla la carga de datos, cerramos para no bugear
            ClosePauseMenu()
        end
    end)
end

-- FUNCIÓN: CERRAR MENÚ
function ClosePauseMenu()
    isPaused = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
end

-- BUCLE PRINCIPAL MEJORADO (Apertura al instante)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        -- Si el menú nativo NO está activo (no estamos viendo el mapa)
        if not IsPauseMenuActive() then
            -- Forzamos que el menú nativo no se abra
            SetPauseMenuActive(false) 
            
            -- Detectamos ESC (200) o P (199) con un simple toque
            if not isPaused and (IsControlJustPressed(0, 200) or IsControlJustPressed(0, 199)) then
                OpenPauseMenu()
            end
        end

        -- Si nuestro menú custom está abierto, bloqueamos controles
        if isPaused then
            DisableAllControlActions(0) -- Bloquea TODO
            
            -- Habilitamos solo lo necesario si quisieras mover el mouse o hablar
            EnableControlAction(0, 249, true) -- Push to talk (N)
            EnableControlAction(0, 245, true) -- Chat (T)
        end
    end
end)

-- CALLBACKS DESDE JS
RegisterNUICallback('close', function(data, cb)
    ClosePauseMenu()
    cb('ok')
end)

RegisterNUICallback('openMap', function(data, cb)
    ClosePauseMenu()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), false, -1)
    cb('ok')
end)

RegisterNUICallback('openSettings', function(data, cb)
    ClosePauseMenu()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'), false, -1)
    cb('ok')
end)

RegisterNUICallback('quitGame', function(data, cb)
    TriggerServerEvent('blazz_pause:quit') 
    ClosePauseMenu()
    cb('ok')
end)