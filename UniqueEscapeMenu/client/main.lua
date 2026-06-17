local ESX = exports["es_extended"]:getSharedObject()
local isMenuOpen = false
local mugshotHandle = nil
local mugshotTxd = nil
local blockPauseInterceptor = false

function CreateMugshot()
    local ped = PlayerPedId()
    
    -- Try transparent first, if fails try normal HD
    local handle = RegisterPedheadshotTransparent(ped)
    if not handle or handle == 0 then
        handle = RegisterPedheadshot_3(ped)
    end
    
    if not handle or handle == 0 then return nil end
    
    local timer = GetGameTimer() + 5000
    while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
        Wait(10)
        if GetGameTimer() > timer then
            UnregisterPedheadshot(handle)
            return nil
        end
    end
    
    mugshotHandle = handle
    mugshotTxd = GetPedheadshotTxdString(handle)
    return mugshotTxd
end

function DestroyMugshot()
    if mugshotHandle then
        UnregisterPedheadshot(mugshotHandle)
        mugshotHandle = nil
        mugshotTxd = nil
    end
end

function OpenEscapeMenu()
    if isMenuOpen then return end
    isMenuOpen = true
    
    local PlayerData = ESX.GetPlayerData()
    local name = (PlayerData.firstName and PlayerData.lastName) and (PlayerData.firstName .. " " .. PlayerData.lastName) or GetPlayerName(PlayerId())
    
    local jobName = PlayerData.job and PlayerData.job.name or "unemployed"
    local jobLabel = PlayerData.job and PlayerData.job.label or "Desempleado"
    local jobGrade = PlayerData.job and PlayerData.job.grade_label or ""
    
    local jobDisplay = "Desempleado"
    if jobName ~= "unemployed" then
        jobDisplay = jobLabel .. " - " .. jobGrade
    end

    local money = 0
    local bank = 0
    if PlayerData.accounts then
        for i=1, #(PlayerData.accounts) do
            if PlayerData.accounts[i].name == "money" then money = PlayerData.accounts[i].money end
            if PlayerData.accounts[i].name == "bank" then bank = PlayerData.accounts[i].money end
        end
    end

    local txd = CreateMugshot()
    local playerId = GetPlayerServerId(PlayerId())

    SetNuiFocus(true, true)
    TriggerScreenblurFadeIn(1000)
    
    SendNUIMessage({
        action = "open",
        data = {
            id = playerId,
            name = name,
            job = jobDisplay,
            money = money,
            bank = bank,
            mugshotTxd = txd
        }
    })

    -- Fetch premium stats asynchronously
    ESX.TriggerServerCallback('unique_escape_menu:getStats', function(stats)
        if isMenuOpen then
            SendNUIMessage({
                action = "updateStats",
                data = stats
            })
        end
    end)
end


function CloseEscapeMenu()
    if not isMenuOpen then return end
    isMenuOpen = false
    SetNuiFocus(false, false)
    TriggerScreenblurFadeOut(1000)
    SendNUIMessage({ action = "close" })
    DisplayHud(true)
    DisplayRadar(true)
    DestroyMugshot()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if isMenuOpen then
            -- Si nuestro menú custom está abierto, ocultamos HUD, bloqueamos controles y mantenemos cerrado el nativo
            SetPauseMenuActive(false) 
            DisplayHud(false)
            DisplayRadar(false)
            DisableAllControlActions(0) 
            EnableControlAction(0, 249, true) -- N (Radio)
            EnableControlAction(0, 245, true) -- T (Chat)
        else
            -- Si el juego decide abrir el menú nativo y no lo hemos bloqueado temporalmente
            if IsPauseMenuActive() and not blockPauseInterceptor then
                -- Cerramos el menú nativo instantáneamente y abrimos el nuestro
                SetPauseMenuActive(false)
                OpenEscapeMenu()
            end
        end
    end
end)

RegisterCommand('unique_escape_menu', function()
    -- Si el juego tiene el menú de pausa nativo activo, ignoramos
    if IsPauseMenuActive() then return end
    
    -- ¡CRÍTICO! Protegemos el comando por si el usuario tiene la tecla guardada en su cliente (KeyMapping residual).
    -- Si hay un NUI enfocado (como el inventario ox_inventory), NO debemos abrir el menú de pausa.
    if IsNuiFocused() then return end
    
    if UpdateOnscreenKeyboard() ~= 0 then
        if not isMenuOpen then
            OpenEscapeMenu()
        else
            CloseEscapeMenu()
        end
    end
end, false)

-- Función para abrir menús nativos desde nuestro menú sin que se intercepte
function OpenNativeMenu(menuHash)
    CloseEscapeMenu()
    blockPauseInterceptor = true
    ActivateFrontendMenu(menuHash, 0, -1)
    
    Citizen.CreateThread(function()
        -- Darle tiempo al menú nativo para que se registre como abierto
        Citizen.Wait(100)
        
        -- Esperar mientras el menú nativo esté abierto
        while IsPauseMenuActive() do
            Citizen.Wait(0)
        end
        
        -- Una vez cerrado el menú nativo, esperamos unos ms extra y volvemos a permitir interceptar ESC
        Citizen.Wait(100)
        blockPauseInterceptor = false
    end)
end

RegisterNUICallback("playSound", function(data, cb)
    if data.name == "hover" then
        PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    elseif data.name == "click" then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end
    cb("ok")
end)

RegisterNUICallback("close", function(data, cb)
    CloseEscapeMenu()
    cb("ok")
end)

RegisterNUICallback("map", function(data, cb)
    OpenNativeMenu(GetHashKey("FE_MENU_VERSION_MP_PAUSE"))
    cb("ok")
end)

RegisterNUICallback("settings", function(data, cb)
    OpenNativeMenu(-1031775802)
    cb("ok")
end)

RegisterNUICallback("logout", function(data, cb)
    CloseEscapeMenu()
    TriggerEvent("esx:playerLogout")
    TriggerServerEvent("esx_multicharacter:relog")
    cb("ok")
end)

RegisterNUICallback("quit", function(data, cb)
    CloseEscapeMenu()
    ExecuteCommand("quit")
    cb("ok")
end)
