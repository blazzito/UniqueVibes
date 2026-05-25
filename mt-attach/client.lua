local ESX = exports['es_extended']:getSharedObject()

-- Optimization: Cache hashes
local trailersAllowedHashes = {}
for i=1, #Config.TrailersAllowedHashes do
  trailersAllowedHashes[Config.TrailersAllowedHashes[i]] = true
end

local previewVeh = nil
local previewCam = nil
local currentShopIdx = nil

local function upperModelName(ent)
  if not DoesEntityExist(ent) then return nil end
  local m = GetEntityModel(ent)
  local name = GetDisplayNameFromVehicleModel(m)
  if name and name ~= "CARNOTFOUND" then return string.upper(name) end
  return nil
end

local previewVeh = nil
local previewCam = nil
local currentShopIndex = nil

local function cleanupPreview()
  if previewVeh and DoesEntityExist(previewVeh) then
    DeleteVehicle(previewVeh)
    previewVeh = nil
  end
  if previewCam then
    RenderScriptCams(false, true, 500, true, true)
    DestroyCam(previewCam, true)
    previewCam = nil
  end
end

local function isTrailerAllowed(ent)
  if not DoesEntityExist(ent) then return false end
  local hash = GetEntityModel(ent)
  if trailersAllowedHashes[hash] then return true end
  
  local name = upperModelName(ent)
  if not name then return false end
  for i=1, #Config.TrailersAllowed do
    if name == Config.TrailersAllowed[i] then return true end
  end
  return false
end

local function isVehicleClassAllowed(veh)
  local c = GetVehicleClass(veh)
  return Config.VehicleClassesAllowed[c] == true
end

local function findNearbyTrailer(radius)
  local pcoords = GetEntityCoords(PlayerPedId())
  local vehicles = GetGamePool('CVehicle')
  local closest, cdist = nil, radius
  
  for i=1, #vehicles do
    local veh = vehicles[i]
    if veh ~= 0 and isTrailerAllowed(veh) then
      local vcoords = GetEntityCoords(veh)
      local dist = #(vcoords - pcoords)
      if dist < cdist then
        closest, cdist = veh, dist
      end
    end
  end
  return closest
end

local function rayHitsTrailerFromVehicle(vehicle, trailer)
  local vc = GetEntityCoords(vehicle)
  local start = vec3(vc.x, vc.y, vc.z + 1.0)
  local fin   = vec3(vc.x, vc.y, vc.z - 2.0)
  local ray = StartShapeTestRay(start.x, start.y, start.z, fin.x, fin.y, fin.z, 10, vehicle, 7)
  local _, _, _, _, hitEnt = GetShapeTestResult(ray)
  return hitEnt ~= 0 and hitEnt == trailer
end

local function isOnTopOfTrailer(playerVeh, trailer)
  if not (DoesEntityExist(playerVeh) and DoesEntityExist(trailer)) then return false end
  local vc = GetEntityCoords(playerVeh)
  local tc = GetEntityCoords(trailer)
  local off = GetOffsetFromEntityGivenWorldCoords(trailer, vc)
  local minD, maxD = GetModelDimensions(GetEntityModel(trailer))
  local halfX = math.max(math.abs(minD.x), math.abs(maxD.x)) + 0.10
  local halfY = math.max(math.abs(minD.y), math.abs(maxD.y)) + 0.10
  
  local withinX = math.abs(off.x) <= math.max(halfX, Config.MaxHorizontalOffset)
  local withinY = math.abs(off.y) <= math.max(halfY, Config.MaxLongitudinalGap)
  local above   = (vc.z - tc.z) >= Config.MinHeightDelta
  
  if (withinX and withinY and above) then return true end
  return rayHitsTrailerFromVehicle(playerVeh, trailer)
end

local function attachVehicleToTrailer(playerVeh, trailer)
  local vc = GetEntityCoords(playerVeh)
  local off = GetOffsetFromEntityGivenWorldCoords(trailer, vc)
  local zNudge = 0.06
  AttachEntityToEntity(
    playerVeh, trailer, GetEntityBoneIndexByName(trailer, 'chassis'),
    off.x, off.y, off.z + zNudge, 0.0, 0.0, 0.0,
    false, false, true, false, 20, true
  )
  FreezeEntityPosition(playerVeh, false)
end

local function detachVehicle(playerVeh)
  if IsEntityAttached(playerVeh) then
    DetachEntity(playerVeh, true, true)
  end
end

local function showProximityHelp(keyName)
  local msg = Config.Txt.PressToToggle:format(keyName or Config.ToggleKeyDefault)
  exports['mt-notify']:create3DTextUI({
    id = "mt_attach_prompt",
    coords = GetEntityCoords(PlayerPedId()),
    key = keyName or Config.ToggleKeyDefault,
    message = "ACOPLAR/DESACOPLAR",
    r = 255, g = 107, b = 0 -- Orange from Elite Essence
  })
end

local function hideProximityHelp()
  exports['mt-notify']:DeleteDrawText3D("mt_attach_prompt")
end

local isTextUIShown = false

RegisterCommand("+trailerToggle", function()
  local ped = PlayerPedId()
  local veh = GetVehiclePedIsIn(ped, false)
  
  if veh == 0 then
    Config.Notify(Config.Txt.NoTrailerFound, 'error'); return
  end
  
  if not isVehicleClassAllowed(veh) then
    Config.Notify(Config.Txt.NotAllowed, 'error'); return
  end
  
  if IsEntityAttached(veh) then
    detachVehicle(veh)
    Config.Notify(Config.Txt.Detached, 'info')
    return
  end
  
  local trailer = findNearbyTrailer(Config.TrailerDetectRadius)
  if not trailer then
    Config.Notify(Config.Txt.NoTrailerFound, 'error'); return
  end
  
  if not isOnTopOfTrailer(veh, trailer) then
    Config.Notify(Config.Txt.MustBeOnTrailer, 'error'); return
  end
  
  attachVehicleToTrailer(veh, trailer)
  Config.Notify(Config.Txt.Attached, 'success')
end, false)

RegisterCommand("-trailerToggle", function() end, false)

CreateThread(function()
  RegisterKeyMapping("+trailerToggle", Config.ToggleKeyDesc, "keyboard", Config.ToggleKeyDefault)
end)

-- Optimized Loop with ox_lib TextUI
CreateThread(function()
  while true do
    local wait = 1000
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    
    if veh ~= 0 then
      wait = 500
      local show = false
      if IsEntityAttached(veh) then
        show = true
      else
        local trailer = findNearbyTrailer(Config.TrailerDetectRadius)
        if trailer and isOnTopOfTrailer(veh, trailer) then
          show = true
        end
      end

      if show then
        if not isTextUIShown then
          showProximityHelp(Config.ToggleKeyDefault)
          isTextUIShown = true
        end
        -- Actualizar posición del texto 3D para que siga al jugador
        exports['mt-notify']:Update3DTextCoords("mt_attach_prompt", GetEntityCoords(PlayerPedId()))
        wait = 0
      else
        if isTextUIShown then
          hideProximityHelp()
          isTextUIShown = false
        end
      end
    else
      if isTextUIShown then
        hideProximityHelp()
        isTextUIShown = false
      end
    end
    Wait(wait)
  end
end)

local spawnedPeds = {}
local currentShopIndex = nil

local function createBlip(shop)
  if not shop.blip then return end
  local blip = AddBlipForCoord(shop.coords.x, shop.coords.y, shop.coords.z)
  SetBlipSprite(blip, shop.blip.sprite or 479)
  SetBlipDisplay(blip, 4)
  SetBlipScale(blip, shop.blip.scale or 0.75)
  SetBlipColour(blip, shop.blip.color or 45)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName('STRING')
  AddTextComponentString(shop.blip.name or 'Alquiler')
  EndTextCommandSetBlipName(blip)
end

local function spawnShopPed(shop)
  local model = joaat(shop.pedModel)
  RequestModel(model)
  local t = GetGameTimer()
  while not HasModelLoaded(model) do
    if GetGameTimer() - t > 5000 then break end
    Wait(10)
  end
  local ped = CreatePed(4, model, shop.coords.x, shop.coords.y, shop.coords.z - 1.0, shop.coords.w, false, true)
  SetEntityInvincible(ped, true)
  FreezeEntityPosition(ped, true)
  SetBlockingOfNonTemporaryEvents(ped, true)
  return ped
end

local function resolveCatalog(shop)
  if type(shop.catalogo) == 'table' then
    return shop.catalogo
  end
  return Config.DefaultCatalog or {}
end

local function openShopUI(shopIndex)
  local shop = Config.Shops[shopIndex]; if not shop then return end
  currentShopIndex = shopIndex
  local catalog = resolveCatalog(shop)
  local items = {}
  for i=1, #catalog do
    local it = catalog[i]
    items[#items+1] = {
      label = it.label,
      model = it.model,
      price = it.price,
      image = it.image,
      capacity = it.capacity,
      size = it.size,
      description = it.desc
    }
  end
  SetNuiFocus(true, true)
  SendNUIMessage({ action = "openShop", items = items })
end

local function closeShopUI()
  SetNuiFocus(false, false)
  cleanupPreview()
  currentShopIndex = nil
end

RegisterNUICallback('uiClose', function(_, cb)
  closeShopUI()
  cb({})
end)

RegisterNUICallback('uiPreview', function(data, cb)
  cleanupPreview()
  if not currentShopIndex or not data.model then return cb('ok') end
  
  local shop = Config.Shops[currentShopIndex]
  if not shop.PreviewPos then return cb('ok') end
  
  local model = joaat(data.model)
  RequestModel(model)
  while not HasModelLoaded(model) do Wait(10) end
  
  previewVeh = CreateVehicle(model, shop.PreviewPos.x, shop.PreviewPos.y, shop.PreviewPos.z, shop.PreviewPos.w, false, false)
  SetEntityAlpha(previewVeh, 200, false)
  SetVehicleOnGroundProperly(previewVeh)
  FreezeEntityPosition(previewVeh, true)
  SetVehicleDoorsLocked(previewVeh, 2)
  
  if shop.CamPos then
    previewCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", shop.CamPos.x, shop.CamPos.y, shop.CamPos.z, shop.CamRot.x, shop.CamRot.y, shop.CamRot.z, 50.0, false, 0)
    SetCamActive(previewCam, true)
    RenderScriptCams(true, true, 600, true, true)
  end
  cb('ok')
end)

RegisterNUICallback('uiCancelPreview', function(data, cb)
  cleanupPreview()
  cb('ok')
end)

local function isSpawnFreeAt(pos, radius)
  return not IsAnyVehicleNearPoint(pos.x, pos.y, pos.z, radius or 2.5)
end

local function pickSpawnForShop(shop)
  if not shop or type(shop.spawns) ~= 'table' then return nil end
  for i=1, #shop.spawns do
    if isSpawnFreeAt(shop.spawns[i], 2.5) then
      return shop.spawns[i]
    end
  end
  return shop.spawns[1]
end

local function loadModelByName(name, timeoutMs)
  local hash = joaat(name)
  if not IsModelInCdimage(hash) or not IsModelAVehicle(hash) then
    return false, ('Modelo no encontrado: %s'):format(name)
  end
  RequestModel(hash)
  local t0 = GetGameTimer()
  while not HasModelLoaded(hash) do
    if GetGameTimer() - t0 > (timeoutMs or 7000) then
      return false, ('Timeout cargando modelo: %s'):format(name)
    end
    Wait(10)
  end
  return true, hash
end

local function spawnTrailerAt(hash, spawn)
  local veh = CreateVehicle(hash, spawn.x, spawn.y, spawn.z, spawn.w, true, false)
  if not DoesEntityExist(veh) then return false, 'CreateVehicle falló' end
  SetVehicleOnGroundProperly(veh)
  SetEntityAsMissionEntity(veh, true, true)
  SetVehicleDoorsLocked(veh, 1)
  return true, veh
end

RegisterNUICallback('uiRent', function(data, cb)
  -- Safety: callback should be wrapped or handled with a pcall to never hang NUI
  local success, err = pcall(function()
    local shop = Config.Shops[currentShopIndex or 1]
    if not shop then cb({ ok=false, reason='No hay tienda' }); return end
    local catalog = resolveCatalog(shop)
    local sel
    for i=1, #catalog do
      if string.lower(catalog[i].model) == string.lower(tostring(data.model or '')) then sel = catalog[i] break end
    end
    
    if not sel then
      Config.Notify(Config.Txt.ModelNotFound, 'error')
      cb({ ok=false, reason=Config.Txt.ModelNotFound }); return
    end
    
    local loaded, hashOrReason = loadModelByName(sel.model, 8000)
    if not loaded then
      Config.Notify(hashOrReason or 'No se pudo cargar el modelo.', 'error')
      cb({ ok=false, reason=hashOrReason or 'Model load failed' })
      return
    end
    
    local price = tonumber(data.price) or tonumber(sel.price) or 0
    local pay   = tostring(data.pay or 'cash')
    
    ESX.TriggerServerCallback('az_trailer:buy', function(ok, reason)
        if ok then
            local spawn = sel.spawn or pickSpawnForShop(shop)
            if spawn then
                if not isSpawnFreeAt(spawn, 2.5) then
                    local near = GetClosestVehicle(spawn.x, spawn.y, spawn.z, 2.5, 0, 71)
                    if near ~= 0 then
                        local right = GetOffsetFromEntityInWorldCoords(near, 3.5, 0.0, 0.0)
                        spawn = vec4(right.x, right.y, spawn.z, spawn.w)
                    end
                end
                local okSpawn, res = spawnTrailerAt(hashOrReason, spawn)
                if okSpawn then
                    Config.Notify(Config.Txt.Bought:format(sel.label, price), 'success')
                    cb({ ok=true })
                else
                    cb({ ok=false, reason='Error al crear el vehículo' })
                end
            else
                cb({ ok=false, reason='No spawn' })
            end
        else
            Config.Notify(reason or Config.Txt.NotEnough, 'error')
            cb({ ok=false, reason = reason or 'Fondos insuficientes' })
        end
    end, price, pay)
  end)

  if not success then
    print("[Trailer] Error in uiRent: " .. tostring(err))
    cb({ ok=false, reason = "Internal script error" })
  end
end)

local function returnTrailer()
  local ped = PlayerPedId()
  local pcoords = GetEntityCoords(ped)
  local vehicles = GetGamePool('CVehicle')
  local trailer = nil
  
  for i=1, #vehicles do
    local v = vehicles[i]
    if trailersAllowedHashes[GetEntityModel(v)] then
      local vcoords = GetEntityCoords(v)
      if #(pcoords - vcoords) < 15.0 then
        trailer = v
        break
      end
    end
  end
  
  if trailer and DoesEntityExist(trailer) then
    local plate = GetVehicleNumberPlateText(trailer)
    -- Opcional: Verificar si el trailer fue rentado por el jugador (usando la placa o similar)
    -- Por simplicidad, permitiremos devolver cualquier trailer de la lista cerca del NPC
    DeleteEntity(trailer)
    TriggerServerEvent('az_trailer:return')
  else
    Config.Notify(Config.Txt.NoTrailerToReturn, 'error')
  end
end

CreateThread(function()
  for i=1, #Config.Shops do
    local shop = Config.Shops[i]
    createBlip(shop)
    local ped = spawnShopPed(shop)
    spawnedPeds[#spawnedPeds+1] = ped
    
    if Config.UseOxTarget then
      exports.ox_target:addLocalEntity(ped, {
        {
          icon = 'fas fa-truck-moving',
          label = Config.Txt.RentOpen,
          distance = 2.0,
          onSelect = function() openShopUI(i) end
        },
        {
          icon = 'fas fa-undo',
          label = Config.Txt.ReturnTrailer,
          distance = 2.0,
          onSelect = function() returnTrailer() end
        }
      })
    else
      CreateThread(function()
        Wait(1000) -- Safety for exports
        -- Register the node once, mt-textui handles distance-based animation
        exports['mt-notify']:create3DTextUI({
          id = "mt_attach_shop_" .. i,
          coords = GetEntityCoords(ped) + vec3(0, 0, 1.0),
          message = "MENÚ DE REMOLQUES",
          key = "E",
          r = 255, g = 107, b = 0,
          options = {
            { label = "CATÁLOGO", event = "mt-attach:client:openCatalog", value = {index = i} },
            { label = "DEVOLVER", event = "mt-attach:client:returnTrailer", value = {} }
          }
        })
      end)
    end
  end
end)

-- Eventos para mt-textui multi-opción
AddEventHandler('mt-attach:client:openCatalog', function(data)
  if data and data.index then openShopUI(data.index) end
end)

AddEventHandler('mt-attach:client:returnTrailer', function()
  returnTrailer()
end)

AddEventHandler('onResourceStop', function(res)
  if res ~= GetCurrentResourceName() then return end
  for i=1, #spawnedPeds do
    if DoesEntityExist(spawnedPeds[i]) then DeletePed(spawnedPeds[i]) end
  end
  SetNuiFocus(false, false)
end)

-- Funciones auxiliares para desenganche (ahora siempre disponibles para mt-textui)
do
  local function ensureAnim(dict)
    if not HasAnimDictLoaded(dict) then
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do Wait(10) end
    end
  end

  local function requestControl(ent, timeout)
    if not DoesEntityExist(ent) then return false end
    local limit = GetGameTimer() + (timeout or 1500)
    NetworkRequestControlOfEntity(ent)
    while not NetworkHasControlOfEntity(ent) and GetGameTimer() < limit do
      Wait(10)
      NetworkRequestControlOfEntity(ent)
    end
    return NetworkHasControlOfEntity(ent)
  end

  local function getTractorForTrailer(trailer)
    if not DoesEntityExist(trailer) then return nil end
    local pos = GetEntityCoords(trailer)
    local vehicles = GetGamePool('CVehicle')
    local best, bestD = nil, (Config.DetachScanRadius or 12.0)
    
    for i=1, #vehicles do
      local veh = vehicles[i]
      if veh ~= 0 and veh ~= trailer then
        local has, tr = GetVehicleTrailerVehicle(veh)
        if has and tr == trailer then
          local d = #(GetEntityCoords(veh) - pos)
          if d < bestD then best, bestD = veh, d end
        end
      end
    end
    return best
  end

  local function getHitchWorldPos(trailer)
    for i=1, #Config.HitchBones do
      local idx = GetEntityBoneIndexByName(trailer, Config.HitchBones[i])
      if idx ~= -1 then
        local pos = GetWorldPositionOfEntityBone(trailer, idx)
        if pos then return pos end
      end
    end
    local tpos = GetEntityCoords(trailer)
    local fwd  = GetEntityForwardVector(trailer)
    return vec3(tpos.x + fwd.x * 1.3, tpos.y + fwd.y * 1.3, tpos.z + 0.30)
  end

  local function detachNativeNoMoveSafe(trailer)
    local tractor = getTractorForTrailer(trailer)
    if not tractor then
      Config.Notify("No hay un vehículo enganchado.", "error")
      return
    end
    
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
      Config.Notify("Bájate del vehículo.", "error")
      return
    end

    local hitch = getHitchWorldPos(trailer)
    TaskGoToCoordAnyMeans(ped, hitch.x, hitch.y, hitch.z, 1.0, 0, false, 786603, 0.0)
    
    local t0 = GetGameTimer()
    while #(GetEntityCoords(ped) - hitch) > 1.5 and GetGameTimer() - t0 < 5000 do Wait(10) end
    
    ClearPedTasksImmediately(ped)
    TaskTurnPedToFaceEntity(ped, trailer, 500)
    ensureAnim(Config.DetachAnimDict or 'mini@repair')
    TaskPlayAnim(ped, Config.DetachAnimDict or 'mini@repair', Config.DetachAnimName or 'fixing_a_ped', 8.0, -8.0, 1700, 1, 0.0, false, false, false)
    Wait(1100)

    requestControl(tractor, 2000)
    requestControl(trailer, 2000)
    DetachVehicleFromTrailer(tractor)
    Config.Notify("Remolque desenganchado.", "info")
  end

-- Nuevo hilo para desenganchar remolques con mt-textuu
CreateThread(function()
  local isPromptShown = false
  local nearbyTrailer = nil
  
  while true do
    local wait = 1000
    local ped = PlayerPedId()
    
    if not IsPedInAnyVehicle(ped, false) then
      local pcoords = GetEntityCoords(ped)
      local vehicles = GetGamePool('CVehicle')
      local closestHitch, closestDist, closestTrailer = nil, 2.5, nil
      
      for i=1, #vehicles do
        local v = vehicles[i]
        if v ~= 0 and trailersAllowedHashes[GetEntityModel(v)] then
          if getTractorForTrailer(v) then
            local hitchPos = getHitchWorldPos(v)
            local dist = #(pcoords - hitchPos)
            if dist < closestDist then
              closestDist = dist
              closestHitch = hitchPos
              closestTrailer = v
            end
          end
        end
      end
      
      if closestTrailer then
        wait = 0
        nearbyTrailer = closestTrailer
        if not isPromptShown then
          exports['mt-notify']:create3DTextUI({
            id = "mt_attach_detach",
            coords = closestHitch,
            key = "E",
            message = "DESENGANCHAR",
            r = 255, g = 107, b = 0
          })
          isPromptShown = true
        end
        
        if IsControlJustReleased(0, 38) then
          detachNativeNoMoveSafe(nearbyTrailer)
          exports['mt-notify']:DeleteDrawText3D("mt_attach_detach")
          isPromptShown = false
          Wait(1000)
        end
      else
        if isPromptShown then
          exports['mt-notify']:DeleteDrawText3D("mt_attach_detach")
          isPromptShown = false
          nearbyTrailer = nil
        end
      end
    else
      if isPromptShown then
        exports['mt-notify']:DeleteDrawText3D("mt_attach_detach")
        isPromptShown = false
        nearbyTrailer = nil
      end
    end
    
    Wait(wait)
  end
end)
end
