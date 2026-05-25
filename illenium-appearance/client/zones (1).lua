if Config.UseTarget then return end

local currentZone = nil

local Zones = {
    Store = {},
    ClothingRoom = {},
    PlayerOutfitRoom = {}
}

local Blips = {}

local function GetClosestPointOnSegment(p, a, b)
    if type(a) ~= 'vector3' then a = vector3(a.x, a.y, a.z) end
    if type(b) ~= 'vector3' then b = vector3(b.x, b.y, b.z) end
    local ab = b - a
    local ap = p - a
    local t = (ap.x * ab.x + ap.y * ab.y + ap.z * ab.z) / (ab.x * ab.x + ab.y * ab.y + ab.z * ab.z)
    t = math.max(0, math.min(1, t))
    return a + t * ab
end

local function GetClosestPointOnPolygon(playerCoords, points)
    local closestPoint = nil
    local minDist = 999999.0
    
    for i = 1, #points do
        local a = points[i]
        local b = points[i + 1] or points[1]
        local cp = GetClosestPointOnSegment(playerCoords, a, b)
        local dist = #(playerCoords - cp)
        if dist < minDist then
            minDist = dist
            closestPoint = cp
        end
    end
    return closestPoint
end

local function IsPointInPolygon(point, points)
    local x, y = point.x, point.y
    local inside = false
    local j = #points
    for i = 1, #points do
        local xi, yi = points[i].x, points[i].y
        local xj, yj = points[j].x, points[j].y
        local intersect = ((yi > y) ~= (yj > y)) and (x < (xj - xi) * (y - yi) / (yj - yi) + xi)
        if intersect then inside = not inside end
        j = i
    end
    return inside
end

local function GetPolygonCenter(points)
    local x, y, z = 0, 0, 0
    for i=1, #points do
        x = x + points[i].x
        y = y + points[i].y
        z = z + points[i].z
    end
    return vector3(x / #points, y / #points, z / #points)
end

local function RemoveBlips()
    for i = 1, #Blips do
        RemoveBlip(Blips[i])
    end
    Blips = {}
end

local function RemoveZones()
    RemoveBlips()
    -- Clean up mt-textui nodes for stores
    if CachedStores then
        for i = 1, #CachedStores do
            local store = CachedStores[i]
            if store and store.id then
                exports['mt-textui']:DeleteText3D("store_interaction_" .. store.id)
            end
        end
    end
    -- Standard lib.zone cleanup
    for i = 1, #Zones.Store do
        if Zones.Store[i]["remove"] then
            Zones.Store[i]:remove()
        end
    end
    for i = 1, #Zones.ClothingRoom do
        Zones.ClothingRoom[i]:remove()
    end
    for i = 1, #Zones.PlayerOutfitRoom do
        Zones.PlayerOutfitRoom[i]:remove()
    end
end

local function lookupZoneIndexFromID(zones, id)
    for i = 1, #zones do
        if zones[i].id == id then
            return i
        end
    end
end

-- Store data cache
local CachedStores = {}
local function onStoreEnter(data)
    local index = lookupZoneIndexFromID(Zones.Store, data.id)
    local store = CachedStores[index]
    if not store then return end

    local jobName = (store.job and client.job.name) or (store.gang and client.gang.name)
    if jobName == (store.job or store.gang) or (not store.job and not store.gang) then
        local storeType = store.type
        local storeCost = store.cost or (storeType == "clothing" and Config.ClothingCost or 
                                          storeType == "barber" and Config.BarberCost or 
                                          storeType == "tattoo" and Config.TattooCost or 
                                          storeType == "surgeon" and Config.SurgeonCost or 0)
        
        currentZone = {
            name = storeType,
            index = index,
            storeId = store.id,
            cost = storeCost
        }

        local textCoords = vector3(store.coords.x, store.coords.y, store.coords.z + 0.4)
        if store.usePoly and store.points and #store.points > 0 then
            textCoords = GetPolygonCenter(store.points) + vector3(0, 0, 0.4)
        end

        local message = ""
        if currentZone.name == "clothing" then
            message = string.format(_L("textUI.clothing"), storeCost)
        elseif currentZone.name == "barber" then
            message = string.format(_L("textUI.barber"), storeCost)
        elseif currentZone.name == "tattoo" then
            message = string.format(_L("textUI.tattoo"), storeCost)
        elseif currentZone.name == "surgeon" then
            message = string.format(_L("textUI.surgeon"), storeCost)
        end

        currentZone = {
            name = storeType,
            index = index,
            storeId = store.id,
            cost = storeCost,
            store = store,
            id = "store_interaction_" .. store.id
        }

        Radial.AddOption(currentZone)
    end
end

local lastPos = vector3(0, 0, 0)
local function onZoneInside(self)
    if not currentZone or not currentZone.id then return end
    
    local store = currentZone.store
    if not store then return end
    
    -- We use store.usePoly OR check if it has points to be safe
    local isPoly = store.usePoly or (store.points and #store.points > 0)
    if not isPoly then return end -- BoxZones and flat coords are static

    local playerPed = cache.ped
    local playerCoords = GetEntityCoords(playerPed)
    
    -- Optimize: Only calculate if moved > 0.05m
    if #(playerCoords - lastPos) < 0.05 then return end
    lastPos = playerCoords

    local forward = GetEntityForwardVector(playerPed)
    local targetCoords = playerCoords + forward * 1.2
    local newCoords

    -- PolyZone boundary check: Follow player but clamp to shop walls
    if store.points and #store.points > 0 then
        if IsPointInPolygon(targetCoords, store.points) then
            newCoords = targetCoords
        else
            newCoords = GetClosestPointOnPolygon(playerCoords, store.points)
        end
    else
        -- Fallback for simple radius polyzones if points are missing
        newCoords = targetCoords
    end

    if newCoords then
        exports['mt-textui']:UpdateText3DCoords(currentZone.id, newCoords + vector3(0, 0, 0.4))
    end
end

-- Proximity Tracker for the "Circle Node" (the Dot)
-- Moves the dot to the closest shop border while approaching PolyZones
CreateThread(function()
    while true do
        local sleep = 1000
        if not currentZone then
            local playerPed = cache.ped
            if playerPed then
                local playerCoords = GetEntityCoords(playerPed)
                for i = 1, #CachedStores do
                    local store = CachedStores[i]
                    if store.usePoly or (store.points and #store.points > 0) then
                        local sCoords = vector3(store.coords.x, store.coords.y, store.coords.z)
                        local dist = #(playerCoords - sCoords)
                        if dist < 20.0 then
                            sleep = 100
                            -- Follow player even from outside for PolyZones
                            local forward = GetEntityForwardVector(playerPed)
                            local targetCoords = playerCoords + forward * 1.2
                            local newCoords

                            if store.points and #store.points > 0 then
                                if IsPointInPolygon(targetCoords, store.points) then
                                    newCoords = targetCoords
                                else
                                    newCoords = GetClosestPointOnPolygon(playerCoords, store.points)
                                end
                            else
                                newCoords = targetCoords
                            end

                            if newCoords then
                                exports['mt-textui']:UpdateText3DCoords("store_interaction_" .. store.id, newCoords + vector3(0, 0, 0.4))
                            end
                        end
                    end
                end
            end
        else
            sleep = 1000 -- We are inside, use onZoneInside for high-speed tracking
        end
        Wait(sleep)
    end
end)

local function onClothingRoomEnter(data)
    local index = lookupZoneIndexFromID(Zones.ClothingRoom, data.id)
    local clothingRoom = Config.ClothingRooms[index]

    local jobName = clothingRoom.job and client.job.name or client.gang.name
    if jobName == (clothingRoom.job or clothingRoom.gang) then
        if CheckDuty() or clothingRoom.gang then
            currentZone = {
                name = "clothingRoom",
                index = index,
                store = clothingRoom,
                id = "store_interaction_clothingRoom_" .. index
            }
            exports['mt-textui']:Text3D({
                id = "store_interaction_clothingRoom_" .. index,
                type = 'textui',
                coords = clothingRoom.coords.xyz + vector3(0, 0, 0.4),
                key = "E",
                message = _L("textUI.clothingRoom"),
                event = "illenium-appearance:client:onStoreInteraction",
                value = currentZone,
                r = 255, g = 107, b = 0
            })
            Radial.AddOption(currentZone)
        end
    end
end

local function onPlayerOutfitRoomEnter(data)
    local index = lookupZoneIndexFromID(Zones.PlayerOutfitRoom, data.id)
    local playerOutfitRoom = Config.PlayerOutfitRooms[index]

    local isAllowed = IsPlayerAllowedForOutfitRoom(playerOutfitRoom)
    if isAllowed then
        currentZone = {
            name = "playerOutfitRoom",
            index = index,
            store = playerOutfitRoom,
            id = "store_interaction_playerOutfitRoom_" .. index
        }
        Radial.AddOption(currentZone)
    end
end

local function onZoneExit()
    currentZone = nil
    lastPos = vector3(0, 0, 0) -- Reset tracking position
    Radial.RemoveOption()
    lib.hideTextUI()
end

local function SetupZone(store, onEnter, onExit)
    if Config.RCoreTattoosCompatibility and store.type == "tattoo" then
        return {}
    end

    local points = store.points
    -- Ensure points are vector3 if they are tables
    if points and type(points[1]) == "table" and not points[1].x then
         local vecPoints = {}
         for i, p in ipairs(points) do
            vecPoints[i] = vector3(p.x, p.y, p.z)
         end
         store.points = vecPoints
         points = vecPoints
    elseif points and type(points[1]) == "table" then
         local vecPoints = {}
         for i, p in ipairs(points) do
            vecPoints[i] = vector3(p.x, p.y, p.z)
         end
         store.points = vecPoints
         points = vecPoints
    end

    local coords = vector3(store.coords.x, store.coords.y, store.coords.z)
    local size = store.size and vector3(store.size.x, store.size.y, store.size.z) or vector3(4, 4, 4)

    local textCoords = vector3(store.coords.x, store.coords.y, store.coords.z + 0.4)
    if store.usePoly and store.points and #store.points > 0 then
        textCoords = GetPolygonCenter(store.points) + vector3(0, 0, 0.4)
    end

    local storeType = store.type
    local storeCost = store.cost or (storeType == "clothing" and Config.ClothingCost or 
                                      storeType == "barber" and Config.BarberCost or 
                                      storeType == "tattoo" and Config.TattooCost or 
                                      storeType == "surgeon" and Config.SurgeonCost or 0)
    
    local message = ""
    if storeType == "clothing" then
        message = string.format(_L("textUI.clothing"), storeCost)
    elseif storeType == "barber" then
        message = string.format(_L("textUI.barber"), storeCost)
    elseif storeType == "tattoo" then
        message = string.format(_L("textUI.tattoo"), storeCost)
    elseif storeType == "surgeon" then
        message = string.format(_L("textUI.surgeon"), storeCost)
    elseif store.name == "clothingRoom" then
        message = _L("textUI.clothingRoom")
    elseif store.name == "playerOutfitRoom" then
        message = _L("textUI.playerOutfitRoom")
    end

    exports['mt-textui']:Text3D({
        id = "store_interaction_" .. (store.id or store.name .. "_" .. (store.index or "0")),
        type = 'textui',
        coords = textCoords,
        key = "E",
        message = message,
        event = "illenium-appearance:client:onStoreInteraction",
        value = { name = storeType or store.name, index = store.index, storeId = store.id, cost = storeCost, store = store },
        r = 255, g = 107, b = 0 -- Elite Orange
    })

    if Config.UseRadialMenu or store.usePoly then
        return lib.zones.poly({
            points = points,
            thickness = size.z, 
            debug = Config.Debug,
            onEnter = onEnter,
            onExit = onExit,
            inside = onZoneInside
        })
    end

    return lib.zones.box({
        coords = coords,
        size = size,
        rotation = store.rotation,
        debug = Config.Debug,
        onEnter = onEnter,
        onExit = onExit,
        inside = onZoneInside
    })
end



local function SetupBlips()
    RemoveBlips()
    for i, store in ipairs(CachedStores) do
        if store.showBlip == nil or store.showBlip == true or store.showBlip == 1 then
            local blipType = 73 -- Default Clothing
        local blipColor = 47 -- Orange
        local blipName = "Clothing Store"

        if store.type == "barber" then
            blipType = 71
            blipColor = 0 -- White/Black
            blipName = "Barber Shop"
        elseif store.type == "tattoo" then
            blipType = 75
            blipColor = 4
            blipName = "Tattoo Parlor"
        elseif store.type == "surgeon" then
            blipType = 102
            blipColor = 1
            blipName = "Plastic Surgeon"
        elseif store.type == "clothing" then
            blipName = "Clothing Store"
        end

        local blip = AddBlipForCoord(store.coords.x, store.coords.y, store.coords.z)
        SetBlipSprite(blip, blipType)
        SetBlipColour(blip, blipColor)
        SetBlipScale(blip, 0.7)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipName)
        EndTextCommandSetBlipName(blip)

        Blips[#Blips+1] = blip
        end
    end
end

local function SetupStoreZones()
    -- Clear existing
    if currentZone and currentZone.name ~= "clothingRoom" and currentZone.name ~= "playerOutfitRoom" then
        onZoneExit()
    end

    -- Explicitly remove old mt-textui nodes for ALL stores in Zones.Store before rebuilding
    for i = 1, #Zones.Store do
        local zone = Zones.Store[i]
        -- Attempt to find the ID from CachedStores since we added it to currentZone/SetupZone
        if CachedStores[i] and CachedStores[i].id then
            exports['mt-textui']:DeleteText3D("store_interaction_" .. CachedStores[i].id)
        end
        if zone and zone["remove"] then zone:remove() end
    end
    Zones.Store = {}

    for i, v in ipairs(CachedStores) do
        Zones.Store[i] = SetupZone(v, onStoreEnter, onZoneExit)
        Zones.Store[i].id = i -- Use index as ID for now to match lookupZoneIndexFromID logic
    end
    
    SetupBlips()
end

local function SetupClothingRoomZones()
    for i, v in pairs(Config.ClothingRooms) do
        v.name = "clothingRoom"
        v.index = i
        Zones.ClothingRoom[#Zones.ClothingRoom + 1] = SetupZone(v, onClothingRoomEnter, onZoneExit)
    end
end

local function SetupPlayerOutfitRoomZones()
    for i, v in pairs(Config.PlayerOutfitRooms) do
        v.name = "playerOutfitRoom"
        v.index = i
        Zones.PlayerOutfitRoom[#Zones.PlayerOutfitRoom + 1] = SetupZone(v, onPlayerOutfitRoomEnter, onZoneExit)
    end
end

local function SetupZones()
    SetupStoreZones() -- Uses CachedStores
    SetupClothingRoomZones()
    SetupPlayerOutfitRoomZones()
end

AddEventHandler("illenium-appearance:client:onStoreInteraction", function(data)
    if not data then return end
    if data.name == "clothingRoom" then
        local clothingRoom = Config.ClothingRooms[data.index]
        local outfits = GetPlayerJobOutfits(clothingRoom.job)
        TriggerEvent("illenium-appearance:client:openJobOutfitsMenu", outfits)
    elseif data.name == "playerOutfitRoom" then
        local outfitRoom = Config.PlayerOutfitRooms[data.index]
        OpenOutfitRoom(outfitRoom)
    elseif data.name == "clothing" then
        TriggerEvent("illenium-appearance:client:openClothingShopMenu", nil, data.cost)
    elseif data.name == "barber" then
        OpenBarberShop(data.cost)
    elseif data.name == "tattoo" then
        OpenTattooShop(data.cost)
    elseif data.name == "surgeon" then
        OpenSurgeonShop(data.cost)
    end
end)


CreateThread(function()
    print("[illenium-appearance] [CLIENT] Starting store initialization...")
    local storesLoaded = false
    local retryCount = 0
    local maxRetries = 5
    
    while not storesLoaded and retryCount < maxRetries do
        local p = promise.new()
        lib.callback("illenium-appearance:server:getStores", false, function(stores)
            p:resolve(stores)
        end)
        
        local stores = Citizen.Await(p)
        
        if stores then
            CachedStores = stores
            SetupZones()
            storesLoaded = true
            print("[illenium-appearance] [CLIENT] Stores successfully loaded and zones created.")
        else
            retryCount = retryCount + 1
            print("[illenium-appearance] [CLIENT] Failed to fetch stores. Retry " .. retryCount .. "/" .. maxRetries)
            Wait(2000 * retryCount)
        end
    end

    if not storesLoaded then
        print("[illenium-appearance] [CLIENT] [ERROR] Could not load stores after multiple attempts. Interactions will be unavailable.")
    end

    if not Config.UseRadialMenu then
        -- Logic is now handled by mt-textui events, no loop needed
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        RemoveZones()
    end
end)

RegisterNetEvent("illenium-appearance:client:OpenClothingRoom", function()
    local clothingRoom = Config.ClothingRooms[currentZone.index]
    local outfits = GetPlayerJobOutfits(clothingRoom.job)
    TriggerEvent("illenium-appearance:client:openJobOutfitsMenu", outfits)
end)

RegisterNetEvent("illenium-appearance:client:OpenPlayerOutfitRoom", function()
    local outfitRoom = Config.PlayerOutfitRooms[currentZone.index]
    OpenOutfitRoom(outfitRoom)
end)

RegisterNetEvent("illenium-appearance:client:storeUpdate", function(action, data)
    if action == "add" then
        CachedStores[#CachedStores+1] = data
    elseif action == "update" then
        for i, store in ipairs(CachedStores) do
            if store.id == data.id then
                CachedStores[i] = data
                break
            end
        end
    elseif action == "delete" then
        for i, store in ipairs(CachedStores) do
            if store.id == data.id then
                -- Explicitly remove the TextUI node
                exports['mt-textui']:DeleteText3D("store_interaction_" .. store.id)
                
                -- Check if we are in this zone
                if currentZone and currentZone.storeId == store.id then
                    onZoneExit()
                end
                table.remove(CachedStores, i)
                break
            end
        end
    end
    SetupStoreZones()
end)
