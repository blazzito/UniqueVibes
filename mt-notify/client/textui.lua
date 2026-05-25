-- [[ MT TEXTUI - PREMIUM INTERACTION SYSTEM ]]

local activeTextUI = nil
local validPositions = {
    "top-left", "top-right", "bottom-left", "bottom-right",
    "top-center", "bottom-center", "center", "center-left", "center-right"
}

-- Proximity & Rendering State
local nearbyAreas = {}
local nearbyPlayers = {}
local temporarilyHidden = {}
local globalSuppression = false
local lastNUIUpdate = 0

-- [[ UTILS ]]
local ESX = nil
if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()
end

local currentJob = "all"

local function UpdateJob()
    if not ESX then return end
    local xPlayer = ESX.GetPlayerData()
    currentJob = xPlayer and xPlayer.job and xPlayer.job.name or "all"
end

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    currentJob = xPlayer.job.name
end)

RegisterNetEvent('esx:setJob', function(job)
    currentJob = job.name
end)

CreateThread(function()
    if ESX then
        while not ESX.IsPlayerLoaded() do Wait(100) end
        UpdateJob()
    end
end)

local function GetKeyNum(key)
    if type(key) == "number" then return key end
    if not key then return 38 end
    return Config.Keys and Config.Keys[key:upper()] or 38
end

-- [[ 2D TEXT UI (PINNED) ]]
function ShowTextUI(text, key, align)
    local textData = { text = text, key = key or "E" }
    activeTextUI = textData
    
    local finalAlign = "top-left"
    if align then
        for _, pos in ipairs(validPositions) do
            if pos == align then finalAlign = align break end
        end
    end
    
    SendNUIMessage({
        action = "textUI",
        show = true,
        key = textData.key,
        text = text,
        align = finalAlign
    })
end

function HideTextUI()
    SendNUIMessage({ action = "textUI", show = false })
    activeTextUI = nil
end

function ChangeText(text, key)
    SendNUIMessage({
        action = "textUIUpdate",
        key = key or (activeTextUI and activeTextUI.key) or "E",
        text = text
    })
end

-- [[ 3D TEXT UI - WORLD ]]
function Create3DTextUI(id, data, ...)
    -- Handle single-table argument case (e.g. mt-attach)
    if type(id) == "table" and data == nil then
        data = id
        id = data.id or "default_id"
    end

    if Config.Areas[id] then return end
    local resource = GetInvokingResource() or "mt-notify"
    
    if type(data) ~= "table" then
        local args = {...}
        data = {
            coords = data,
            displayDist = args[7] or 15.0,
            interactDist = args[8] or 3.0,
            key = "E",
            text = (args[6] and args[6][1] and args[6][1].text) or "Interaction",
            options = args[6],
            triggerData = {
                triggerName = (args[6] and args[6][1] and args[6][1].triggerName),
                args = (args[6] and args[6][1] and args[6][1].args)
            },
            enableKeyClick = true,
            keyNum = 38,
            canInteract = function() return true end
        }
    end

    Config.Areas[id] = {
        data = {
            id = id,
            type = data.type or "3dtext",
            coords = vec3((data.coords or data.position).x, (data.coords or data.position).y, (data.coords or data.position).z),
            displayDist = data.displayDist or 15.0,
            interactDist = data.interactDist or 3.0,
            enableKeyClick = data.enableKeyClick ~= false,
            keyNum = data.keyNum or GetKeyNum(data.key),
            key = (data.key or "E"):upper(),
            text = data.text or data.message,
            job = data.job or "all",
            options = data.options,
            invokingResource = resource,
            canInteract = data.canInteract or function() return true end
        },
        onKeyClick = function()
            if data.triggerData then
                local args = data.triggerData.args
                if type(args) ~= "table" then args = {args} end
                if data.triggerData.isServer then
                    TriggerServerEvent(data.triggerData.triggerName, table.unpack(args))
                else
                    TriggerEvent(data.triggerData.triggerName, table.unpack(args))
                end
            elseif data.event then
                local args = data.args or {}
                if type(args) ~= "table" then args = {args} end
                TriggerEvent(data.event, table.unpack(args))
            end
        end
    }
end

function Delete3DTextUI(id)
    if Config.Areas[id] then
        Config.Areas[id] = nil
        SendNUIMessage({ action = "hide3DText", id = id })
    end
end

-- [[ RENDERER THREADS ]]
CreateThread(function()
    while true do
        if not globalSuppression then
            local pCoords = GetEntityCoords(PlayerPedId())
            local currentNearbyAreas = {}
            for id, area in pairs(Config.Areas) do
                local dist = #(area.data.coords - pCoords)
                if dist <= (area.data.displayDist or 15.0) + 5.0 then
                    currentNearbyAreas[id] = { area = area, dist = dist }
                end
            end
            nearbyAreas = currentNearbyAreas
        end
        Wait(500)
    end
end)

CreateThread(function()
    while true do
        local sleep = 500
        if not globalSuppression then
            local pPed = PlayerPedId()
            local pCoords = GetEntityCoords(pPed)
            local isFaded = IsScreenFadedOut() or IsPauseMenuActive()
            local nuiNodes = {}
            local nodesCount = 0

            for id, data in pairs(nearbyAreas) do
                local area = data.area
                if not isFaded then
                    local distance = #(area.data.coords - pCoords)
                    local displayDist = area.data.displayDist or 15.0
                    local shouldShow = (distance <= displayDist) and (area.data.job == "all" or area.data.job == currentJob)
                    
                    if (area.data.type == "3dtext" or area.data.type == "textui") and shouldShow and not temporarilyHidden[id] then
                        local canInteract = true
                        if area.data.canInteract then
                            if type(area.data.canInteract) == "function" then canInteract = area.data.canInteract()
                            elseif type(area.data.canInteract) == "boolean" then canInteract = area.data.canInteract end
                        end

                        if canInteract then
                            sleep = 0
                            local x, y, onScreen
                            local currentType = area.data.type or "3dtext"
                            local isNear = (distance <= (area.data.interactDist or 3.0))

                            if currentType == "textui" then
                                onScreen = true
                                local cursorX, cursorY = GetNuiCursorPosition()
                                local resX, resY = GetActiveScreenResolution()
                                local safeResX = (resX and resX > 0) and resX or 1920
                                local safeResY = (resY and resY > 0) and resY or 1080
                                local safeCursorX = cursorX or (safeResX / 2)
                                local safeCursorY = cursorY or (safeResY / 2)
                                
                                local relX, relY = safeCursorX / safeResX, safeCursorY / safeResY
                                x, y = 0.52 + ((relX - 0.5) * 0.03), 0.45 + ((relY - 0.5) * 0.03)
                                isNear = true
                            else
                                onScreen, x, y = GetScreenCoordFromWorldCoord(area.data.coords.x, area.data.coords.y, area.data.coords.z + 0.1)
                            end

                            if onScreen and x and y and x > 0.01 and x < 0.99 and y > 0.01 and y < 0.99 then
                                if isNear then
                                    if area.data.enableKeyClick and IsControlJustReleased(0, area.data.keyNum) then
                                        local options = area.data.options
                                        if options and #options > 0 then
                                            local sel = options[area.data.selectedIndex or 1]
                                            local args = sel.value or sel.args
                                            if type(args) == "table" and #args > 0 then
                                                TriggerEvent(sel.event, table.unpack(args)) 
                                            else
                                                TriggerEvent(sel.event, args) 
                                            end
                                        else 
                                            area.onKeyClick() 
                                        end
                                    end

                                    local options = area.data.options
                                    if options and #options > 0 then
                                        if not area.data.selectedIndex then area.data.selectedIndex = 1 end
                                        if IsControlJustReleased(0, 172) then -- Arrow Up
                                            area.data.selectedIndex = area.data.selectedIndex - 1
                                            if area.data.selectedIndex < 1 then area.data.selectedIndex = #options end
                                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                                        elseif IsControlJustReleased(0, 173) then -- Arrow Down
                                            area.data.selectedIndex = (area.data.selectedIndex % #options) + 1
                                            PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                                        end
                                    end
                                end

                                nodesCount = nodesCount + 1
                                nuiNodes[nodesCount] = { 
                                    id = id, 
                                    type = currentType, 
                                    isNear = isNear, 
                                    screenX = x, 
                                    screenY = y, 
                                    key = area.data.key, 
                                    message = area.data.text, 
                                    options = area.data.options, 
                                    selectedIndex = area.data.selectedIndex or 1, 
                                    distance = distance 
                                }
                            end
                        end
                    end
                end
            end

            -- Send NUI updates at screen refresh rate for max fluidity
            if nodesCount > 0 or lastNUIUpdate ~= 0 then
                SendNUIMessage({ action = "updateNodes", nodes = nuiNodes })
                if nodesCount == 0 then 
                    lastNUIUpdate = 0 
                else
                    lastNUIUpdate = 1
                end
            end
        end
        Wait(sleep)
    end
end)

-- [[ MISSING 3D FUNCTIONS ]]
function Update3DTextUI(id, newText)
    if Config.Areas[id] then
        Config.Areas[id].data.text = newText
        SendNUIMessage({ action = "update3DText", id = id, text = newText, key = Config.Areas[id].data.key })
    end
end

function HideDrawText3D(id)
    if not id then return end
    temporarilyHidden[tostring(id)] = true
end

function ShowDrawText3D(id)
    if not id then return end
    temporarilyHidden[tostring(id)] = nil
end

function SetGlobalSuppression(val)
    globalSuppression = val
    if val == true then
        SendNUIMessage({ action = "updateNodes", nodes = {} })
        lastNUIUpdate = 0
    end
end

function Update3DTextCoords(id, newCoords)
    if Config.Areas[id] then
        Config.Areas[id].data.coords = vec3(newCoords.x, newCoords.y, newCoords.z)
    end
end

-- [[ EXPORTS ]]
exports('displayTextUI', ShowTextUI)
exports('changeText', ChangeText)
exports('hideTextUI', HideTextUI)
exports('create3DTextUI', Create3DTextUI)
exports('DeleteDrawText3D', Delete3DTextUI)

-- Compatibility with mt-textui & mt-notify DrawText
exports('ShowText', ShowTextUI)
exports('HideText', HideTextUI)
exports('DrawText', function(key, text) ShowTextUI(text, key) end)
exports('HideText', function() HideTextUI() end)

exports('DeleteText3D', Delete3DTextUI)
exports('update3DTextUI', Update3DTextUI)
exports('HideDrawText3D', HideDrawText3D)
exports('ShowDrawText3D', ShowDrawText3D)
exports('SetGlobalSuppression', SetGlobalSuppression)
exports('ResetSuppression', ShowDrawText3D)
exports('Update3DTextCoords', Update3DTextCoords)

-- [[ COMPATIBILITY EVENTS ]]
RegisterNetEvent('mt-textui:ShowText', function(text, key, align)
    ShowTextUI(text, key, align)
end)

RegisterNetEvent('mt-textui:HideText', function()
    HideTextUI()
end)

RegisterNetEvent('mt-notify:client:DrawText', function(key, text)
    ShowTextUI(text, key)
end)

RegisterNetEvent('mt-notify:client:HideText', function()
    HideTextUI()
end)
