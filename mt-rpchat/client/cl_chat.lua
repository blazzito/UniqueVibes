local chatInputActive = false
local chatInputActivating = false
local chatHidden = true
local chatLoaded = false
s = 100
_s = 2000
RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:addSuggestions')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:clear')

-- internal events
RegisterNetEvent('__cfx_internal:serverPrint')

RegisterNetEvent('_chat:messageEntered')

--deprecated, use chat:addMessage
AddEventHandler('chatMessage', function(author, color, text)
  local args = { text }
  if author ~= "" then
    table.insert(args, 1, author)
  end
  SendNUIMessage({
    type = 'ON_MESSAGE',
    message = {
      color = color,
      multiline = true,
      args = args
    }
  })
end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
  print(msg)

  SendNUIMessage({
    type = 'ON_MESSAGE',
    message = {
      templateId = 'print',
      multiline = true,
      args = { msg }
    }
  })
end)

AddEventHandler('chat:addMessage', function(message)
  SendNUIMessage({
    type = 'ON_MESSAGE',
    message = message
  })
end)

AddEventHandler('chat:addSuggestion', function(name, help, params)
  SendNUIMessage({
    type = 'ON_SUGGESTION_ADD',
    suggestion = {
      name = name,
      help = help,
      params = params or nil
    }
  })
end)

AddEventHandler('chat:addSuggestions', function(suggestions)
  for _, suggestion in ipairs(suggestions) do
    SendNUIMessage({
      type = 'ON_SUGGESTION_ADD',
      suggestion = suggestion
    })
  end
end)

AddEventHandler('chat:removeSuggestion', function(name)
  SendNUIMessage({
    type = 'ON_SUGGESTION_REMOVE',
    name = name
  })
end)

AddEventHandler('chat:addTemplate', function(id, html)
  SendNUIMessage({
    type = 'ON_TEMPLATE_ADD',
    template = {
      id = id,
      html = html
    }
  })
end)

AddEventHandler('chat:clear', function(name)
  SendNUIMessage({
    type = 'ON_CLEAR'
  })
end)

RegisterNUICallback('chatResult', function(data, cb)
  chatInputActive = false
  SetNuiFocus(false)

  if not data.canceled then
      local id = PlayerId()
      local message = data.message

      --deprecated
      local r, g, b = 0, 0x99, 255

      if message:sub(1, 1) == '/' then
          local command = message:sub(2)
          TriggerServerEvent('logChatCommand', GetPlayerName(id), '/' .. command) -- Enviar comando al servidor
          ExecuteCommand(command)
      else
          TriggerServerEvent('_chat:messageEntered', GetPlayerName(id), { r, g, b }, message)
      end
  end

  cb('ok')
end)


local function refreshCommands()
  if GetRegisteredCommands then
    local registeredCommands = GetRegisteredCommands()

    local suggestions = {}

    for _, command in ipairs(registeredCommands) do
        if IsAceAllowed(('command.%s'):format(command.name)) then
            table.insert(suggestions, {
                name = '/' .. command.name,
                help = ''
            })
        end
    end

    TriggerEvent('chat:addSuggestions', suggestions)
  end
end

local function refreshThemes()
  local themes = {}

  for resIdx = 0, GetNumResources() - 1 do
    local resource = GetResourceByFindIndex(resIdx)

    if GetResourceState(resource) == 'started' then
      local numThemes = GetNumResourceMetadata(resource, 'chat_theme')

      if numThemes > 0 then
        local themeName = GetResourceMetadata(resource, 'chat_theme')
        local themeData = json.decode(GetResourceMetadata(resource, 'chat_theme_extra') or 'null')

        if themeName and themeData then
          themeData.baseUrl = 'nui://' .. resource .. '/'
          themes[themeName] = themeData
        end
      end
    end
  end

  SendNUIMessage({
    type = 'ON_UPDATE_THEMES',
    themes = themes
  })
end

AddEventHandler('onClientResourceStart', function(resName)
  Wait(_s)

  refreshCommands()
  refreshThemes()
end)

AddEventHandler('onClientResourceStop', function(resName)
  Wait(_s)

  refreshCommands()
  refreshThemes()
end)

RegisterNUICallback('loaded', function(data, cb)
  TriggerServerEvent('chat:init');

  refreshCommands()
  refreshThemes()

  chatLoaded = true

  SendNUIMessage({
    type = 'SET_LOCAL_ID',
    id = GetPlayerServerId(PlayerId())
  })

  cb('ok')
end)

-- Removed broken distance check thread that was causing nil errors

Citizen.CreateThread(function()
  SetTextChatEnabled(false)
  SetNuiFocus(false, false) -- Deshabilitar el cursor al inicio

  while true do
    Wait(s)

    if not chatInputActive then
      if IsControlPressed(0, 245) --[[ INPUT_MP_TEXT_CHAT_ALL ]] then
        chatInputActive = true
        chatInputActivating = true

        -- Habilitar el foco y el mouse cuando el chat se abre
        SetNuiFocus(true, true)

        SendNUIMessage({
          type = 'ON_OPEN'
        })
      end
    end

    if chatInputActivating then
      if not IsControlPressed(0, 245) then
        SetNuiFocus(true, true) -- Asegúrate de mantener el foco mientras el chat está activado

        chatInputActivating = false
      end
    end

    if chatLoaded then
      local shouldBeHidden = false

      if IsScreenFadedOut() or IsPauseMenuActive() then
        shouldBeHidden = true
      end

      if (shouldBeHidden and not chatHidden) or (not shouldBeHidden and chatHidden) then
        chatHidden = shouldBeHidden

        SendNUIMessage({
          type = 'ON_SCREEN_STATE_CHANGE',
          shouldHide = shouldBeHidden
        })

        -- Deshabilitar el foco y el cursor cuando el chat se cierra
        if shouldBeHidden then
          SetNuiFocus(false, false)
        end
      end
    end
  end
end)


function AderNotify(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local factor = #text / 370
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    DrawRect(_x,_y + 0.0125, 0.060 + factor, 0.035, 0, 0, 0, 190)
end

-- ME / DO 3D BUBBLES LOGIC
local activeBubbles = {}
local bubbleIdCounter = 0

RegisterNetEvent('mt-rpchat:onMeDo')
AddEventHandler('mt-rpchat:onMeDo', function(sourceId, text, type, name)
    if not sourceId then return end
    
    -- Remove any existing bubble for this source (Only one bubble allowed)
    for i = #activeBubbles, 1, -1 do
        if activeBubbles[i].source == sourceId then
            table.remove(activeBubbles, i)
        end
    end

    bubbleIdCounter = bubbleIdCounter + 1
    
    local bubble = {
        id = bubbleIdCounter,
        source = sourceId,
        text = text,
        type = type,
        name = name,
        time = GetGameTimer() + 7000
    }

    table.insert(activeBubbles, bubble)
end)

Citizen.CreateThread(function()
    while true do
        local wait = 500
        
        if #activeBubbles > 0 then
            wait = 0
            local bubblesToDraw = {}
            local plyPos = GetEntityCoords(PlayerPedId())
            local currentTime = GetGameTimer()

            -- Iterate backwards
            for i = #activeBubbles, 1, -1 do
                local b = activeBubbles[i]
                
                -- Check expiration
                if currentTime > b.time then
                    table.remove(activeBubbles, i)
                else
                    local targetId = GetPlayerFromServerId(b.source)
                    local targetPed = GetPlayerPed(targetId)
                    
                    if DoesEntityExist(targetPed) then
                        local targetPos = GetPedBoneCoords(targetPed, 12844, 0.0, 0.0, 0.0)
                        local dist = #(plyPos - targetPos)

                        if dist < 7.0 then
                            local onScreen, screenX, screenY = World3dToScreen2d(targetPos.x, targetPos.y, targetPos.z + 0.65)
                            
                            if onScreen then
                                table.insert(bubblesToDraw, {
                                    id = b.id,
                                    type = b.type,
                                    text = b.text,
                                    name = b.name,
                                    left = screenX,
                                    top = screenY,
                                    dist = dist
                                })
                            end
                        end
                    end
                end
            end

            -- Send to NUI
            SendNUIMessage({
                type = 'ON_UPDATE_BUBBLES',
                bubbles = bubblesToDraw
            })
        end
        
        Wait(wait)
    end
end)
