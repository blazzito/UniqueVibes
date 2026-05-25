ESX = exports['es_extended']:getSharedObject()
local dynamicPoints = {}

function OpenBossMenu(pointId)
    local point = dynamicPoints[pointId]
    if not point then return end

    local xPlayer = ESX.GetPlayerData()
    if xPlayer.job.name ~= point.job then
        return ESX.ShowNotification("No tienes acceso a este menú.")
    end

    -- Call original NUI open logic
    openNUI({
        job = point.job,
        logo = point.logo,
        color = point.color
    })
end

local points = {}

local function RefreshBossNodes()
    -- Clear previous nodes if any
    for id, _ in pairs(dynamicPoints) do
        exports['mt-notify']:DeleteDrawText3D('bossmenu_' .. id)
    end

    local xPlayer = ESX.GetPlayerData()
    if not xPlayer or not xPlayer.job then return end

    for id, data in pairs(dynamicPoints) do
        local hasAccess = false
        if xPlayer.job.name == data.job then
            if not data.grades or #data.grades == 0 then
                hasAccess = true
            else
                local playerGrade = tostring(xPlayer.job.grade)
                for _, grade in ipairs(data.grades) do
                    if tostring(grade) == playerGrade then
                        hasAccess = true
                        break
                    end
                end
            end
        end

        if hasAccess and data.coords then
            -- Sanitize Coords (convert table to vector3 if needed)
            local pos = data.coords
            if type(pos) == 'table' then
                pos = vector3(pos.x + 0.0, pos.y + 0.0, pos.z + 0.0)
            end

            exports['mt-notify']:create3DTextUI('bossmenu_' .. id, {
                coords = vector3(pos.x, pos.y, pos.z + 0.4),
                displayDist = 3.0,
                interactDist = 1.5,
                enableKeyClick = true,
                key = 'E',
                text = data.name,
                job = "all", -- Pre-filtered by mt-bossmenu, don't double filter in textui
                triggerData = {
                    isServer = false,
                    triggerName = 'mt_bossmenu:client:handleInteraction',
                    args = id
                }
            })
        end
    end
end

RegisterNetEvent('mt_bossmenu:client:handleInteraction', function(pointId)
    OpenBossMenu(pointId)
end)

RegisterNetEvent('mt_bossmenu:client:updatePoints', function(newPoints)
    -- Clear current nodes first
    for id, _ in pairs(dynamicPoints) do
        exports['mt-notify']:DeleteDrawText3D('bossmenu_' .. id)
    end
    dynamicPoints = newPoints
    RefreshBossNodes()
end)

RegisterNetEvent('esx:setJob', function(job)
    Wait(500)
    RefreshBossNodes()
end)

-- Initial Load
CreateThread(function()
    while not ESX.IsPlayerLoaded() do Wait(100) end
    TriggerServerEvent('mt_bossmenu:server:requestPoints')
    RefreshBossNodes()
end)

-- Admin Menu Event
RegisterNetEvent('mt_bossmenu:client:openAdminMenu', function(jobs)
    local formattedPoints = {}
    for id, data in pairs(dynamicPoints) do
        table.insert(formattedPoints, {
            id = id,
            name = data.name,
            job = data.job,
            grades = data.grades or {},
            account = data.account,
            coords = string.format("%.1f, %.1f, %.1f", data.coords.x, data.coords.y, data.coords.z)
        })
    end

    SendNUIMessage({
        action = 'openAdminPanel',
        points = formattedPoints,
        availableJobs = jobs
    })
    SetNuiFocus(true, true)
end)