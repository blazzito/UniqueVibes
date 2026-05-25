local config = require 'config'
local elevators = {}

-- mt-textui interaction nodes
local activeElevatorNodes = {}

local function RefreshElevatorNodes()
    -- Delete all current nodes
    for id, _ in pairs(activeElevatorNodes) do
        exports['mt-notify']:DeleteDrawText3D(id)
    end
    activeElevatorNodes = {}

    -- Register one simple node per floor point
    for groupName, floors in pairs(elevators) do
        for i, floor in ipairs(floors) do
            local nodeId = 'elevator_' .. groupName .. '_' .. i
            local pos = floor.pos
            exports['mt-notify']:create3DTextUI(nodeId, {
                type = '3dtext',
                coords  = vector3(pos.x, pos.y, pos.z + 0.4),
                displayDist = 5.0,
                interactDist = 1.5,
                enableKeyClick = true,
                key     = 'E',
                text    = 'Elevador',
                job     = "all",
                triggerData = {
                    isServer = false,
                    triggerName = 'mt-elevators:client:openFloor',
                    args = { floorNumber = floor.number, groupName = groupName }
                }
            })
            activeElevatorNodes[nodeId] = true
        end
    end
end

-- Request elevators on start
CreateThread(function()
    Wait(1000)
    TriggerServerEvent('mt-elevators:server:getElevators')
end)

RegisterNetEvent('mt-elevators:client:updateElevators', function(data)
    -- Sanitize data: convert tables to vector3 for distance checks
    for groupName, floors in pairs(data) do
        for i, floor in ipairs(floors) do
            if type(floor.pos) == 'table' then
                floor.pos = vector3(floor.pos.x + 0.0, floor.pos.y + 0.0, floor.pos.z + 0.0)
            end
        end
    end
    elevators = data
    -- Register 3D text nodes as soon as elevator data arrives
    Wait(200)
    RefreshElevatorNodes()
end)

-- Function to open the custom NUI
local function OpenUI(current, floors)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action  = 'SHOW_UI',
        current = current,
        floors  = floors
    })
end

-- Helper to find spawn pos and heading from config using UI position
local function resolveSpawnFromConfig(uiPos)
    if not uiPos then return nil end
    local ux, uy, uz = uiPos.x + 0.0, uiPos.y + 0.0, uiPos.z + 0.0
    for _, group in pairs(elevators or {}) do
        for _, floor in pairs(group) do
            local p = floor.pos
            if p then
                local dx, dy, dz = (p.x - ux), (p.y - uy), (p.z - uz)
                if (dx*dx + dy*dy + dz*dz) <= 0.05 then
                    return floor.pos, floor.heading
                end
            end
        end
    end
    return nil, nil
end

-- Teleport function with ox_lib fade and notification
local function TeleportExact(pos, heading)
    local ped = cache.ped or PlayerPedId()
    local ent = IsPedInAnyVehicle(ped, false) and GetVehiclePedIsIn(ped, false) or ped

    -- lib.screenFadeOut already handled in USE_ELEVATOR, but just in case:
    if not IsScreenFadedOut() then 
        DoScreenFadeOut(120) 
        while not IsScreenFadedOut() do Wait(0) end
    end

    NetworkFadeOutEntity(ent, true, false)
    FreezeEntityPosition(ent, true)
    SetEntityInvincible(ent, true)
    SetEntityCollision(ent, false, false)

    RequestCollisionAtCoord(pos.x, pos.y, pos.z)
    SetFocusArea(pos.x, pos.y, pos.z, 0.0, 0.0, 0.0)
    SetEntityCoordsNoOffset(ent, pos.x, pos.y, pos.z, false, false, false)
    if heading then
        SetEntityHeading(ent, heading + 0.0)
        SetGameplayCamRelativeHeading(0.0)
    end

    local untilTs = GetGameTimer() + 800
    while GetGameTimer() < untilTs do
        RequestCollisionAtCoord(pos.x, pos.y, pos.z)
        Wait(0)
    end

    ClearFocus()
    SetEntityCollision(ent, true, true)
    FreezeEntityPosition(ent, false)
    SetEntityInvincible(ent, false)
    NetworkFadeInEntity(ent, true)
    DoScreenFadeIn(140)

    exports['mt-notify']:Notify({
        title = 'ELEVADOR',
        description = '¡Has llegado a tu destino!',
        type = 'success',
        duration = 5000
    })
end

-- NUI Callbacks
RegisterNUICallback('CLOSE_UI', function(_, cb)
    SetNuiFocus(false, false)
    if cb then cb('ok') end
end)

RegisterNUICallback('TELEPORT', function(data, cb)
    local uiPos = vector3(data.pos.x, data.pos.y, data.pos.z)
    local resolvedPos, heading = resolveSpawnFromConfig(uiPos)
    TeleportExact(resolvedPos or uiPos, heading)
    if cb then cb('ok') end
end)

RegisterNUICallback('USE_ELEVATOR', function(_, cb)
    DoScreenFadeOut(120)
    while not IsScreenFadedOut() do Wait(0) end
    if cb then cb('ok') end
end)

-- Admin Callbacks
RegisterNetEvent('mt-elevators:client:openAdmin', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'OPEN_ADMIN',
        elevators = elevators
    })
end)

RegisterNUICallback('SAVE_ELEVATOR', function(data, cb)
    TriggerServerEvent('mt-elevators:server:saveElevator', data.groupName, data.floors)
    if cb then cb('ok') end
end)

RegisterNUICallback('DELETE_ELEVATOR', function(data, cb)
    TriggerServerEvent('mt-elevators:server:deleteElevator', data.groupName)
    if cb then cb('ok') end
end)

RegisterNUICallback('GET_COORDS', function(_, cb)
    local ped = cache.ped or PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    cb({
        pos = {x = coords.x, y = coords.y, z = coords.z},
        heading = heading
    })
end)

RegisterNUICallback('TP_TO_ELEVATOR', function(data, cb)
    TeleportExact(data.pos, data.heading)
    if cb then cb('ok') end
end)

-- openFloor is fired locally by mt-textui via TriggerEvent
AddEventHandler('mt-elevators:client:openFloor', function(data)
    local groupName = data.groupName
    local floorNumber = data.floorNumber
    local floors = elevators[groupName]
    if floors then
        OpenUI(floorNumber, floors)
    end
end)

-- Safeguard to close UI
CreateThread(function()
    while true do
        if IsPauseMenuActive() or IsControlJustReleased(0, 177) then
            SetNuiFocus(false, false)
        end
        Wait(200)
    end
end)
