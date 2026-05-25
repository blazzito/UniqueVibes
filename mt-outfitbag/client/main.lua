local ESX = exports["es_extended"]:getSharedObject()

local uiOpen           = false
local currentBagId     = nil
local currentIsOwner   = false
local currentBagLocked = true
local currentUiMode    = 'closed' 
local currentOutfits   = {}      
local BagCache         = {}

local camHandle = nil

local function CamCreateForPed(ped)
    if camHandle and DoesCamExist(camHandle) then return end
    local coords = GetOffsetFromEntityInWorldCoords(ped, -0.5, 4.5, 0.0)
    camHandle = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActive(camHandle, true)
    RenderScriptCams(true, true, 1550, true, false)
    SetCamCoord(camHandle, coords.x, coords.y, coords.z - 0.5)
    SetCamFov(camHandle, 38.0)
    SetCamRot(camHandle, 0.0, 0.0, GetEntityHeading(ped) + 180.0, 2)

    local c = GetCamCoord(camHandle)
    TaskLookAtCoord(ped, c.x, c.y, c.z, -1, 1, 1)

    SetCamUseShallowDofMode(camHandle, true)
    SetCamNearDof(camHandle, 0.5)
    SetCamFarDof(camHandle, 12.0)
    SetCamDofStrength(camHandle, 1.0)
    SetCamDofMaxNearInFocusDistance(camHandle, 1.0)

    CreateThread(function()
        while camHandle and DoesCamExist(camHandle) do
            SetUseHiDof()
            Wait(0)
        end
    end)
end

local function CamDestroy()
    if not camHandle then return end
    RenderScriptCams(false, true, 1250, true, false)
    DestroyCam(camHandle, false)
    camHandle = nil
end

local function playIdleLoop()
    local dict, name = 'amb@world_human_bum_wash@male@low@idle_a', 'idle_a'
    RequestAnimDict(dict); while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, -1, 1, 0.5, false, false, false)
end
local function clearAnims()
    ClearPedTasks(PlayerPedId())
end
local function startScene()
    CamCreateForPed(PlayerPedId())
    playIdleLoop()
end
local function stopScene()
    CamDestroy()
    clearAnims()
end

local function IA_Get(ped)
    local ok, res = pcall(function() return exports['illenium-appearance']:GetPedAppearance(ped) end)
    if ok and res then return res end
    local ok2, res2 = pcall(function() return exports['illenium-appearance']:getPedAppearance(ped) end)
    if ok2 and res2 then return res2 end
    return nil
end
local function IA_Set(ped, appearance)
    local ok = pcall(function() exports['illenium-appearance']:SetPedAppearance(ped, appearance) end)
    if ok then return true end
    local ok2 = pcall(function() return exports['illenium-appearance']:setPedAppearance(ped, appearance) end)
    return ok2
end

local function deepCopy(obj)
    if type(obj) ~= 'table' then return obj end
    local r = {}; for k,v in pairs(obj) do r[k] = deepCopy(v) end; return r
end

local CLOTH_COMPONENTS = {
    [1]=true,[3]=true,[4]=true,[5]=true,[6]=true,[7]=true,[8]=true,[9]=true,[10]=true,[11]=true
}

local PROP_IDS = { [0]=true,[1]=true,[2]=true,[6]=true,[7]=true }

local function compIdOf(c) return c.component_id or c.componentId or c.component or c.id end
local function propIdOf(p) return p.prop_id or p.propId or p.id end

local function componentsToMap(arr)
    local map = {}; if type(arr) ~= 'table' then return map end
    for _, c in ipairs(arr) do local cid = compIdOf(c); if cid ~= nil then map[tonumber(cid)] = c end end
    return map
end
local function propsToMap(arr)
    local map = {}; if type(arr) ~= 'table' then return map end
    for _, p in ipairs(arr) do local pid = propIdOf(p); if pid ~= nil then map[tonumber(pid)] = p end end
    return map
end

local function normalizeAppearanceForPed(ap, ped)
    if type(ap) ~= 'table' then return ap end
    ap = deepCopy(ap)
    ap.model = GetEntityModel(ped)
    return ap
end

local function mergeClothingOnly(base, outfit)
    local merged = deepCopy(base or {})
    local baseComps, outComps = componentsToMap(merged.components), componentsToMap((outfit or {}).components)
    for id,_ in pairs(CLOTH_COMPONENTS) do
        if outComps[id] then baseComps[id] = deepCopy(outComps[id]) end
    end
    merged.components = {}; for _,c in pairs(baseComps) do table.insert(merged.components, c) end

    local baseProps, outProps = propsToMap(merged.props), propsToMap((outfit or {}).props)
    for pid,_ in pairs(PROP_IDS) do
        if outProps[pid] then baseProps[pid] = deepCopy(outProps[pid]) end
    end
    merged.props = {}; for _,p in pairs(baseProps) do table.insert(merged.props, p) end

    return merged
end

local TOP_COMPONENTS    = { [3]=true,[8]=true,[11]=true,[9]=true,[7]=true,[5]=true,[10]=true } 
local BOTTOM_COMPONENTS = { [4]=true,[6]=true } 
local HEAD_PROPS_ONLY   = { [0]=true,[1]=true,[2]=true } 
local function mergePartial(base, outfit, kind)
    local merged = deepCopy(base or {})
    local baseComps, outComps = componentsToMap(merged.components), componentsToMap((outfit or {}).components)
    local function copyComp(id) if outComps[id] then baseComps[id] = deepCopy(outComps[id]) end end

    if kind == 'top' then
        for id,_ in pairs(TOP_COMPONENTS) do copyComp(id) end
    elseif kind == 'bottom' then
        for id,_ in pairs(BOTTOM_COMPONENTS) do copyComp(id) end
    elseif kind == 'head' then
        copyComp(1) 
        local baseProps, outProps = propsToMap(merged.props), propsToMap((outfit or {}).props)
        for pid,_ in pairs(HEAD_PROPS_ONLY) do
            if outProps[pid] then baseProps[pid] = deepCopy(outProps[pid]) end
        end
        merged.props = {}; for _,p in pairs(baseProps) do table.insert(merged.props, p) end
    end

    merged.components = {}; for _,c in pairs(baseComps) do table.insert(merged.components, c) end
    return merged
end



local PlayerPedPreview = nil
local inFMPreview = false

local function FM_SilenceAndFreeze(ped)
    if not ped or not DoesEntityExist(ped) then return end
    FreezeEntityPosition(ped, true)
    SetEntityCollision(ped, false, false)
    SetEntityInvincible(ped, true)
    SetPedCanRagdoll(ped, false)
    SetPedRagdollOnCollision(ped, false)
    DisablePedPainAudio(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStandStill(ped, -1)
    SetEntityVelocity(ped, 0.0, 0.0, 0.0)
end


local function FM_Open(first, initialAppearance)
    ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_EMPTY_NO_BACKGROUND"), false, -1)
    Wait(60)
    SetMouseCursorVisibleInMenus(false)
    AnimpostfxStopAll()

    PlayerPedPreview = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), true, false)
    local px, py, pz = table.unpack(GetEntityCoords(PlayerPedPreview))
    SetEntityCoordsNoOffset(PlayerPedPreview, px, py, pz - 10.0, false, false, false)
    FM_SilenceAndFreeze(PlayerPedPreview)
    NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
    SetEntityVisible(PlayerPedPreview, false, false)
    SetPedAsNoLongerNeeded(PlayerPedPreview)

    if initialAppearance then
        initialAppearance = normalizeAppearanceForPed(initialAppearance, PlayerPedPreview)
        IA_Set(PlayerPedPreview, initialAppearance)
        Wait(0)
    end

    GivePedToPauseMenu(PlayerPedPreview, 2)
    SetPauseMenuPedLighting(true)
    SetPauseMenuPedSleepState(true)
    ReplaceHudColourWithRgba(117, 0, 0, 0, 0)
    inFMPreview = true

    CreateThread(function()
        while inFMPreview do
            if not PlayerPedPreview or not DoesEntityExist(PlayerPedPreview) then
                PlayerPedPreview = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), true, false)
                SetEntityCoordsNoOffset(PlayerPedPreview, px, py, pz - 10.0, false, false, false)
                FM_SilenceAndFreeze(PlayerPedPreview)
                NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
                SetEntityVisible(PlayerPedPreview, false, false)
                SetPedAsNoLongerNeeded(PlayerPedPreview)
                GivePedToPauseMenu(PlayerPedPreview, 2)
            else
                FM_SilenceAndFreeze(PlayerPedPreview)
            end
            SetPauseMenuPedLighting(true)
            SetPauseMenuPedSleepState(true)
            Wait(1000)
        end
    end)
end

local function FM_Close()
    if PlayerPedPreview and DoesEntityExist(PlayerPedPreview) then
        DeleteEntity(PlayerPedPreview)
    end
    PlayerPedPreview = nil
    SetFrontendActive(false)
    inFMPreview = false
end

local function FM_SetAppearance(appearance)
    if not appearance then return end
    if not inFMPreview or not PlayerPedPreview or not DoesEntityExist(PlayerPedPreview) then
        FM_Open(true, appearance)
        return
    end
    appearance = normalizeAppearanceForPed(appearance, PlayerPedPreview)
    IA_Set(PlayerPedPreview, appearance)
    SetPauseMenuPedLighting(true)
    SetPauseMenuPedSleepState(true)
end


local function setNuiFocus(state)
    SetNuiFocus(state, state)
    if SetNuiFocusKeepInput then SetNuiFocusKeepInput(false) end
end

local function openUIClosed(isOwner, locked)
    uiOpen = true; currentUiMode = 'closed'
    setNuiFocus(true)
    startScene()
    SendNUIMessage({
        event        = 'show',
        state        = true,
        uiMode       = 'closed',
        owned        = isOwner,
        bagLocked    = locked,
        currentModel = GetEntityModel(PlayerPedId()),
        outfits      = {},
        maxAmount    = Config.maxOutfits or 20
    })
end

local function openUIOpen(isOwner, locked, outfits)
    uiOpen = true; currentUiMode = 'open'
    setNuiFocus(true)
    startScene()
    SendNUIMessage({
        event        = 'show',
        state        = true,
        uiMode       = 'open',
        owned        = isOwner,
        bagLocked    = locked,
        currentModel = GetEntityModel(PlayerPedId()),
        outfits      = outfits or {},
        maxAmount    = Config.maxOutfits or 20
    })
end

local function closeUI()
    if not uiOpen then return end
    uiOpen = false; currentUiMode = 'closed'
    SendNUIMessage({ event = 'show', state = false })
    setNuiFocus(false)
    if inFMPreview then FM_Close() end
    stopScene()

    if currentBagId then
        exports['mt-notify']:ShowDrawText3D(('mt_ob_%s'):format(currentBagId))
    end
end


local function ensureModel(model)
    local m = type(model) == 'number' and model or joaat(model)
    if not IsModelInCdimage(m) then return false end
    RequestModel(m)
    local t = GetGameTimer() + 5000
    while not HasModelLoaded(m) and GetGameTimer() < t do Wait(0) end
    return HasModelLoaded(m)
end

local function buildTextUIOptions(bag)
    local myCid = ESX.GetPlayerData().identifier
    local isOwner = (myCid == bag.ownerCitizenId)
    local opts = {
        { label = 'Abrir bolsa', icon = 'fa-solid fa-suitcase', event = 'mt-outfitbag:local:open', value = bag.bagId }
    }
    if isOwner then
        opts[#opts + 1] = { label = 'Levantar', icon = 'fa-solid fa-hand', event = 'mt-outfitbag:local:pickup', value = bag.bagId }
    end
    return opts
end

local function attachTarget(bag)
    local ent = NetworkGetEntityFromNetworkId(bag.netId)
    local coords = DoesEntityExist(ent) and GetEntityCoords(ent) or bag.coords
    if not coords then return end
    exports['mt-notify']:create3DTextUI(('mt_ob_%s'):format(bag.bagId), {
        type = 'textui',
        coords  = coords,
        displayDist = 5.0,
        interactDist = 1.5,
        enableKeyClick = true,
        key     = 'E',
        text    = 'OUTFIT BAG',
        job     = "all",
        options = buildTextUIOptions(bag)
    })
end

local function detachTarget(_, bagId)
    exports['mt-notify']:DeleteDrawText3D(('mt_ob_%s'):format(bagId))
end

AddEventHandler('mt-outfitbag:local:open', function(bagId)
    local bag = BagCache[bagId]; if not bag then return end
    local myCid   = ESX.GetPlayerData().identifier
    local imOwner = (myCid == bag.ownerCitizenId)
    currentBagId     = bagId
    currentIsOwner   = imOwner
    currentBagLocked = bag.locked

    if bag.locked then
        exports['mt-notify']:HideDrawText3D(('mt_ob_%s'):format(bagId))
        openUIClosed(imOwner, true)
        return
    end

    ESX.TriggerServerCallback('mt-outfitbag:getOutfits', function(list)
        currentOutfits = {}
        for _, r in ipairs(list or {}) do
            currentOutfits[tostring(r.id)] = { slot = tonumber(r.slot), id = r.id, name = r.name, model = r.model }
        end
        exports['mt-notify']:HideDrawText3D(('mt_ob_%s'):format(bagId))
        openUIOpen(imOwner, false, list or {})
    end, bagId)
end)

AddEventHandler('mt-outfitbag:local:pickup', function(bagId)
    local ped = PlayerPedId()
    local dict, anim = 'pickup_object', 'pickup_low'
    RequestAnimDict(dict); while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, 900, 50, 0, false, false, false)
    Wait(650)
    ClearPedTasks(ped)
    TriggerServerEvent('mt-outfitbag:server:pickup', bagId)
end)

RegisterNetEvent('mt-outfitbag:client:addTarget', function(bag)
    BagCache[bag.bagId] = bag
    CreateThread(function()
        Wait(200)
        attachTarget(bag)
    end)
end)

RegisterNetEvent('mt-outfitbag:client:updateLock', function(bagId, locked)
    local bag = BagCache[bagId]; if not bag then return end
    bag.locked = locked

    if currentBagId == bagId and uiOpen then
        currentBagLocked = locked
        SendNUIMessage({ event = 'update-lock', bagLocked = locked })

        if locked then
            if inFMPreview then FM_Close() end
            openUIClosed(currentIsOwner, true)
        else
            ESX.TriggerServerCallback('mt-outfitbag:getOutfits', function(list)
                currentOutfits = {}
                for _, r in ipairs(list or {}) do
                    currentOutfits[tostring(r.id)] = { slot = tonumber(r.slot), id = r.id, name = r.name, model = r.model }
                end
                openUIOpen(currentIsOwner, false, list or {})
            end, bagId)
        end
    end

    detachTarget(bag, bagId)
    attachTarget(bag)
end)

RegisterNetEvent('mt-outfitbag:client:removeBag', function(bagId, netId)
    local bag = BagCache[bagId]
    if bag then
        detachTarget(bag, bagId)
        BagCache[bagId] = nil
    end

    local ent = NetworkGetEntityFromNetworkId(netId)
    if ent and DoesEntityExist(ent) then
        SetEntityAsMissionEntity(ent, true, true)
        DeleteEntity(ent)
    end

    if currentBagId == bagId then
        closeUI()
        currentBagId = nil
    end
end)


RegisterNetEvent('mt-outfitbag:client:placeBag', function(bagType)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local fwd = GetEntityForwardVector(ped)
    local place = vec3(pos.x + fwd.x * 0.9, pos.y + fwd.y * 0.9, pos.z)

    if Config.bagAnimation and Config.bagAnimation.enabled then
        RequestAnimDict(Config.bagAnimation.dict)
        while not HasAnimDictLoaded(Config.bagAnimation.dict) do Wait(0) end
        TaskPlayAnim(ped, Config.bagAnimation.dict, Config.bagAnimation.anim, 1.0, 1.0, 1000, 49, 0, false, false, false)
        Wait(700)
        ClearPedTasks(ped)
    end

    if not ensureModel(Config.bagObject) then
        ESX.ShowNotification('No se pudo cargar el modelo de la bolsa', 'error')
        return
    end

    local obj = CreateObject(joaat(Config.bagObject), place.x, place.y, place.z, true, true, false)
    SetEntityHeading(obj, GetEntityHeading(ped))
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    SetEntityAsMissionEntity(obj, true, true)

    local netId = NetworkGetNetworkIdFromEntity(obj)
    SetNetworkIdExistsOnAllMachines(netId, true)
    NetworkSetNetworkIdDynamic(netId, false)

    TriggerServerEvent('mt-outfitbag:server:registerBag', netId, bagType)
end)


RegisterNUICallback('UILoaded', function(_, cb)
    cb('ok')
end)

RegisterNUICallback('CloseBag', function(_, cb)
    closeUI()
    currentBagId = nil
    cb('ok')
end)

RegisterNUICallback('SaveOutfit', function(data, cb)
    if not uiOpen or not currentBagId then cb('no') return end
    if not currentIsOwner then ESX.ShowNotification('Solo el dueño puede guardar', 'error'); cb('no'); return end
    local ap = IA_Get(PlayerPedId()); if not ap then ESX.ShowNotification('No se pudo leer la apariencia', 'error'); cb('no'); return end
    local name = (data and data.name and tostring(data.name) ~= '' and data.name) or ('Outfit %d'):format(math.random(111,999))
    TriggerServerEvent('mt-outfitbag:server:save', currentBagId, { name = name, model = GetEntityModel(PlayerPedId()), appearance = ap })
    cb('ok')
end)
RegisterNetEvent('mt-outfitbag:client:saved', function()
    if not uiOpen or not currentBagId then return end
    ESX.TriggerServerCallback('mt-outfitbag:getOutfits', function(list)
        currentOutfits = {}
        for _, r in ipairs(list or {}) do
            currentOutfits[tostring(r.id)] = { slot=tonumber(r.slot), id=r.id, name=r.name, model=r.model }
        end
        SendNUIMessage({ event='clear' })
        SendNUIMessage({ event='set', outfits=list or {} })
    end, currentBagId)
end)

RegisterNUICallback('DeleteOutfit', function(data, cb)
    if not uiOpen or not currentBagId then cb('no') return end
    if not currentIsOwner then ESX.ShowNotification('Solo el dueño puede borrar', 'error'); cb('no'); return end
    local id = data and data.id; if not id then cb('no') return end
    local info = currentOutfits[tostring(id)]; if not info then cb('no'); return end
    TriggerServerEvent('mt-outfitbag:server:delete', currentBagId, tonumber(info.slot), tonumber(id))
    cb('ok')
end)

RegisterNetEvent('mt-outfitbag:client:deleted', function()
    if not uiOpen or not currentBagId then return end
    ESX.TriggerServerCallback('mt-outfitbag:getOutfits', function(list)
        currentOutfits = {}
        for _, r in ipairs(list or {}) do
            currentOutfits[tostring(r.id)] = { slot=tonumber(r.slot), id=r.id, name=r.name, model=r.model }
        end
        SendNUIMessage({ event='clear' })
        SendNUIMessage({ event='set', outfits=list or {} })
    end, currentBagId)
end)

RegisterNUICallback('RenameOutfit', function(data, cb)
    if not uiOpen or not currentBagId then cb('no') return end
    if not currentIsOwner then ESX.ShowNotification('Solo el dueño puede renombrar', 'error'); cb('no') return end
    local id = data and data.id; local newName = data and data.name
    if not id or not newName or newName == '' then cb('no') return end
    TriggerServerEvent('mt-outfitbag:server:rename', currentBagId, tonumber(id), tostring(newName))
    cb('ok')
end)
RegisterNetEvent('mt-outfitbag:client:renamed', function()
    if not uiOpen or not currentBagId then return end
    ESX.TriggerServerCallback('mt-outfitbag:getOutfits', function(list)
        currentOutfits = {}
        for _, r in ipairs(list or {}) do
            currentOutfits[tostring(r.id)] = { slot=tonumber(r.slot), id=r.id, name=r.name, model=r.model }
        end
        SendNUIMessage({ event='clear' })
        SendNUIMessage({ event='set', outfits=list or {} })
    end, currentBagId)
end)


RegisterNUICallback('PreviewOutfit', function(data, cb)
    if not uiOpen or not currentBagId then cb('no') return end
    local id = data and data.id
    if not id then cb('no') return end

    local info = currentOutfits[tostring(id)]
    if not info then cb('no') return end

    ESX.TriggerServerCallback('mt-outfitbag:getOne', function(row)
        if not row then cb('no') return end
        local ownerOutfit = json.decode(row.appearance or '{}') or row.appearance
        if not ownerOutfit then cb('no') return end

        local base = IA_Get(PlayerPedId())
        local clothingOnly = mergeClothingOnly(base, ownerOutfit)
        clothingOnly = normalizeAppearanceForPed(clothingOnly, PlayerPedPreview or PlayerPedId())

        FM_SetAppearance(clothingOnly)
        cb('ok')
    end, currentBagId, tonumber(info.slot))
end)

RegisterNUICallback('ApplyOutfit', function(data, cb)
    if not uiOpen or not currentBagId then cb('no') return end
    local id = data and data.id; local kind = data and data.type or 'full'
    if not id then cb('no') return end
    if currentBagLocked and not currentIsOwner then
        ESX.ShowNotification('La bolsa está cerrada', 'error'); cb('no'); return
    end

    local info = currentOutfits[tostring(id)]
    if not info then cb('no') return end

    ESX.TriggerServerCallback('mt-outfitbag:getOne', function(row)
        if not row then cb('no') return end
        local ownerOutfit = json.decode(row.appearance or '{}') or row.appearance
        local baseAp      = IA_Get(PlayerPedId())
        if not ownerOutfit or not baseAp then cb('no') return end

        local finalAp
        if kind == 'full' then
            finalAp = mergeClothingOnly(baseAp, ownerOutfit)
        elseif kind == 'top' or kind == 'bottom' or kind == 'head' then
            finalAp = mergePartial(baseAp, ownerOutfit, kind)
        else
            finalAp = mergeClothingOnly(baseAp, ownerOutfit)
        end
        IA_Set(PlayerPedId(), finalAp)
        cb('ok')
    end, currentBagId, tonumber(info.slot))
end)

RegisterNUICallback('ToggleLock', function(_, cb)
    if not uiOpen or not currentBagId then cb('no') return end
    if not currentIsOwner then cb('no') return end
    TriggerServerEvent('mt-outfitbag:server:toggleLock', currentBagId)
    cb('ok')
end)


CreateThread(function()
    while true do
        if uiOpen then
            DisableAllControlActions(0)
            EnableControlAction(0, 322, true) 
            if IsDisabledControlJustPressed(0, 322) then
                closeUI(); currentBagId = nil
            end
        end
        Wait(0)
    end
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    if inFMPreview then FM_Close() end
    closeUI()
    for bagId, _ in pairs(BagCache) do
        exports['mt-notify']:DeleteDrawText3D(('mt_ob_%s'):format(bagId))
    end
    BagCache = {}
end)
