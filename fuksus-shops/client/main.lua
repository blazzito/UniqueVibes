-- ============================================================
--  fuksus-shops — client/main.lua
--  Spawns shop peds/blips/markers from server-authoritative data
--  and drives the NUI. No prices or sensitive Config live here —
--  everything visual is built from fuksus-shops:getPublicData.
-- ============================================================

local shopsData   = nil        -- publicShopData from server
local imageBase   = '../images/'
local uiOpen      = false
local currentShop = nil        -- shopKey of the shop the player is near/in

local spawnedPeds = {}         -- shopKey -> { handle, ... }
local pedsSpawned  = false     -- guards against duplicate spawn calls

local textUIVisible = false
local lastTextUIShop = nil

local drawCartActive = false   -- controla el hilo de dibujo independiente (evita parpadeo)
local drawLoc = nil            -- ubicación de la tienda más cercana, leída por ese hilo

-- ============================================================
--  CUSTOM MARKER ICON (cart) — runtime texture dict
--  Loads ui/images/fuksus_cart_icon.png as a texture we can
--  DrawSprite() in world space, replacing the native DrawMarker.
-- ============================================================
local CART_TXD  = 'fuksus_cart_icon_txd'
local CART_TXN  = 'fuksus_cart_icon'
local cartTxdReady = false
local screenAspect = 1.0   -- cached once, refreshed only on resize event

local function loadCartIcon()
    local txd = CreateRuntimeTxd(CART_TXD)
    CreateRuntimeTextureFromImage(txd, CART_TXN, 'ui/images/fuksus_cart_icon.png')

    CreateThread(function()
        local attempts = 0
        while not HasStreamedTextureDictLoaded(CART_TXD) and attempts < 200 do
            Wait(10)
            attempts = attempts + 1
        end

        if HasStreamedTextureDictLoaded(CART_TXD) then
            cartTxdReady = true
        else
            print('[^1fuksus-shops^7] La textura del carrito no cargó a tiempo.')
        end
    end)
end

local function refreshAspect()
    local resX, resY = GetActiveScreenResolution()
    screenAspect = resY / resX
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    refreshAspect()
end)

-- ============================================================
--  FETCH PUBLIC DATA FROM SERVER
-- ============================================================
local function fetchShopData()
    local data = lib.callback.await('fuksus-shops:getPublicData', false)
    if not data then
        print('[^1fuksus-shops^7] No se pudo obtener la configuración pública del servidor.')
        return
    end
    shopsData = data
    imageBase = data.image_location or '../images/'
end

-- ============================================================
--  PEDS & BLIPS
-- ============================================================
local spawnedBlips = {}        -- shopKey -> blip handle, tracked for cleanup

local function despawnShopPeds()
    for _, peds in pairs(spawnedPeds) do
        for _, ped in ipairs(peds) do
            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
    end
    spawnedPeds = {}

    for _, blip in pairs(spawnedBlips) do
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    spawnedBlips = {}
end

local function spawnShopPeds()
    if not shopsData or not shopsData.shops then return end

    -- Resource can receive 'dataReady' more than once (server restart,
    -- reconnect, etc). Wipe whatever we already spawned before redoing it,
    -- otherwise peds/blips/threads stack up and memory/tick cost climbs.
    if pedsSpawned then
        despawnShopPeds()
    end
    pedsSpawned = true

    for shopKey, shop in pairs(shopsData.shops) do
        spawnedPeds[shopKey] = spawnedPeds[shopKey] or {}

        -- Blip (one per shop, placed at the first location)
        if shop.blip and shop.locations and shop.locations[1] then
            local loc  = shop.locations[1]
            local blip = AddBlipForCoord(loc.x, loc.y, loc.z)
            SetBlipSprite(blip, shop.blip.id or 59)
            SetBlipColour(blip, shop.blip.colour or 0)
            SetBlipScale(blip, shop.blip.scale or 0.8)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(shop.name or shopKey)
            EndTextCommandSetBlipName(blip)
            spawnedBlips[shopKey] = blip
        end

        -- Ped (optional — shop may only use a marker)
        if shop.ped and shop.ped.model and shop.ped.coords then
            local hash = type(shop.ped.model) == 'number' and shop.ped.model or joaat(shop.ped.model)

            CreateThread(function()
                RequestModel(hash)
                local attempts = 0
                while not HasModelLoaded(hash) and attempts < 100 do
                    Wait(10)
                    attempts = attempts + 1
                end
                if not HasModelLoaded(hash) then
                    print(('[^1fuksus-shops^7] No se pudo cargar el modelo de ped para la tienda "%s"'):format(shopKey))
                    return
                end

                for _, entry in ipairs(shop.ped.coords) do
                    local coords  = entry.coords or entry
                    local heading = entry.heading or shop.ped.heading or 0.0

                    local ped = CreatePed(4, hash, coords.x, coords.y, coords.z - 1.0, heading, false, true)
                    SetEntityAsMissionEntity(ped, true, true)
                    FreezeEntityPosition(ped, true)
                    SetEntityInvincible(ped, true)
                    SetBlockingOfNonTemporaryEvents(ped, true)
                    SetPedDiesWhenInjured(ped, false)
                    SetPedCanPlayAmbientAnims(ped, true)
                    SetPedCanRagdoll(ped, false)
                    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_STAND_IMPATIENT', 0, true)

                    spawnedPeds[shopKey][#spawnedPeds[shopKey] + 1] = ped
                end

                SetModelAsNoLongerNeeded(hash)
            end)
        end
    end
end

-- ============================================================
--  UI OPEN / CLOSE
-- ============================================================
local function openShopUI(shopKey)
    local shop = shopsData.shops[shopKey]
    if not shop then return end

    currentShop = shopKey
    uiOpen = true

    SetNuiFocus(true, true)

    SendNUIMessage({ type = 'set-locale',  locale   = shopsData.locale })
    SendNUIMessage({ type = 'set-images',  location = imageBase })
    SendNUIMessage({ type = 'main-container', show = true })
    SendNUIMessage({
        type        = 'shop-container',
        shopKey     = shopKey,
        name        = shop.name,
        description = shop.description,
        items       = shop.items,
        filters     = shop.filters,
    })
end

local function closeShopUI()
    uiOpen = false
    currentShop = nil
    SetNuiFocus(false, false)
    SendNUIMessage({ type = 'main-container', show = false })
end

RegisterNUICallback('closeUi', function(_, cb)
    closeShopUI()
    cb({})
end)

RegisterNUICallback('buy', function(data, cb)
    if not currentShop then
        cb(false)
        return
    end

    data.shopKey = currentShop
    local success = lib.callback.await('fuksus-shops:buyItems', false, data)

    if success then
        SendNUIMessage({ type = 'purchase-success' })
    end

    cb(success)
end)

RegisterNUICallback('playSound', function(data, cb)
    PlaySoundFrontend(-1, data.sound, data.dict, true)
    cb(1)
end)

-- ============================================================
--  REACT TO SERVER SIGNAL (handles resource restarts mid-session)
-- ============================================================
RegisterNetEvent('fuksus-shops:dataReady', function()
    fetchShopData()
    if shopsData then
        spawnShopPeds()
    end
end)

-- ============================================================
--  DRAW THREAD (dedicado) — DrawSprite necesita correr cada
--  frame sin saltos, por eso vive separado del loop de proximidad
--  que usa Wait(16/100/1000). Mezclar ambos causaba parpadeo.
-- ============================================================
CreateThread(function()
    local cachedSize, cachedAlpha

    while true do
        if drawCartActive and cartTxdReady and drawLoc then
            if not cachedSize then
                local m = shopsData.marker or {}
                cachedSize  = (m.scale and m.scale.x) or 0.06
                cachedAlpha = (m.color and m.color.a) or 220
            end

            local spriteW = cachedSize
            local spriteH = cachedSize / screenAspect

            local bob = math.sin(GetGameTimer() / 400.0) * 0.12
            local iconZ = drawLoc.z + 0.04 + bob

            SetDrawOrigin(drawLoc.x, drawLoc.y, iconZ, 0)
            DrawSprite(
                CART_TXD, CART_TXN,
                0.0, 0.0,
                spriteW, spriteH,
                0.0,
                255, 255, 255,
                cachedAlpha
            )
            ClearDrawOrigin()
            Wait(0)
        else
            Wait(250)
        end
    end
end)

-- ============================================================
--  PROXIMITY CHECK + MARKER + INTERACTION
-- ============================================================
CreateThread(function()
    loadCartIcon()
    refreshAspect()
    fetchShopData()
    if shopsData then
        spawnShopPeds()
    end

    while true do
        local sleep = 1000
        local ped    = PlayerPedId()
        local coords = GetEntityCoords(ped)

        if shopsData and not uiOpen then
            -- Cheap pass: find the single nearest shop location, if any.
            -- Avoids doing draw/text work for every shop every frame.
            local nearestShopKey, nearestShop, nearestLoc, nearestDist = nil, nil, nil, 15.0

            for shopKey, shop in pairs(shopsData.shops) do
                if shop.locations then
                    for _, loc in ipairs(shop.locations) do
                        local dist = #(coords - loc)
                        if dist < nearestDist then
                            nearestDist   = dist
                            nearestShopKey = shopKey
                            nearestShop    = shop
                            nearestLoc     = loc
                        end
                    end
                end
            end

            if nearestShopKey then
                sleep = (nearestDist < 1.5) and 0 or 100

                if nearestDist < 1.5 then
                    drawCartActive = true
                    drawLoc        = nearestLoc

                    if nearestDist < 1.2 then
                        if not textUIVisible or lastTextUIShop ~= nearestShopKey then
                            lib.showTextUI('[E] - ' .. (nearestShop.name or nearestShopKey), { position = 'top-center' })
                            textUIVisible = true
                            lastTextUIShop = nearestShopKey
                        end

                        if IsControlJustReleased(0, 38) then -- E
                            lib.hideTextUI()
                            textUIVisible = false
                            lastTextUIShop = nil

                            local canOpen = true
                            if nearestShop.hasJobs then
                                canOpen = lib.callback.await('fuksus-shops:canOpen', false, nearestShopKey)
                            end

                            if canOpen then
                                openShopUI(nearestShopKey)
                            else
                                ESX.ShowNotification(Locales[shopsData.locale]['game'].noAccess)
                            end
                        end
                        elseif textUIVisible then
                            lib.hideTextUI()
                            textUIVisible = false
                            lastTextUIShop = nil
                        end
                else
                    drawCartActive = false
                end
            else
                -- nobody nearby — make sure textUI isn't left stuck open
                drawCartActive = false
                if textUIVisible then
                    lib.hideTextUI()
                    textUIVisible = false
                    lastTextUIShop = nil
                end
            end
        end

        Wait(sleep)
    end
end)

-- ============================================================
--  CLEANUP
-- ============================================================
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    despawnShopPeds()
end)