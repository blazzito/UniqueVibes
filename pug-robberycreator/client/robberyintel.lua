local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = {}
L0_1.enabled = false
L0_1.pedModel = "g_m_y_mexgoon_02"
L0_1.interactionLabel = "Ask about robbery intel"
L0_1.coords = nil
L0_1.heading = 0.0
L1_1 = {}
L0_1.visibleRobberies = L1_1
L1_1 = nil
L2_1 = false
L3_1 = false
L4_1 = false
L5_1 = 0
L6_1 = 0
L7_1 = 100.0
L8_1 = 120.0
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "^%s+"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "%s+$"
  L4_2 = ""
  return L1_2(L2_2, L3_2, L4_2)
end
function L10_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = tonumber
  L2_2 = A0_2.x
  if not L2_2 then
    L2_2 = A0_2[1]
  end
  L1_2 = L1_2(L2_2)
  L2_2 = tonumber
  L3_2 = A0_2.y
  if not L3_2 then
    L3_2 = A0_2[2]
  end
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A0_2.z
  if not L4_2 then
    L4_2 = A0_2[3]
  end
  L3_2 = L3_2(L4_2)
  if not (L1_2 and L2_2) or not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = {}
  L4_2.x = L1_2
  L4_2.y = L2_2
  L4_2.z = L3_2
  return L4_2
end
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = {}
  L2_2 = {}
  L3_2 = type
  L4_2 = A0_2.visibleRobberies
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = ipairs
    L4_2 = A0_2.visibleRobberies
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L9_1
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      L11_2 = L9_2
      L10_2 = L9_2.lower
      L10_2 = L10_2(L11_2)
      if "" ~= L9_2 then
        L11_2 = L2_2[L10_2]
        if not L11_2 then
          L2_2[L10_2] = true
          L11_2 = #L1_2
          L11_2 = L11_2 + 1
          L1_2[L11_2] = L9_2
        end
      end
    end
  end
  L3_2 = L9_1
  L4_2 = A0_2.pedModel
  L3_2 = L3_2(L4_2)
  if "" == L3_2 then
    L3_2 = "g_m_y_mexgoon_02"
  end
  L4_2 = L9_1
  L5_2 = A0_2.interactionLabel
  L4_2 = L4_2(L5_2)
  if "" == L4_2 then
    L4_2 = "Ask about robbery intel"
  end
  L5_2 = {}
  L6_2 = A0_2.enabled
  L6_2 = true == L6_2
  L5_2.enabled = L6_2
  L5_2.pedModel = L3_2
  L5_2.interactionLabel = L4_2
  L6_2 = L10_1
  L7_2 = A0_2.coords
  L6_2 = L6_2(L7_2)
  L5_2.coords = L6_2
  L6_2 = tonumber
  L7_2 = A0_2.heading
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 0.0
  end
  L5_2.heading = L6_2
  L5_2.visibleRobberies = L1_2
  return L5_2
end
function L12_1()
  local L0_2, L1_2, L2_2
  L0_2 = L2_1
  if L0_2 then
    L0_2 = false
    L2_1 = L0_2
    L0_2 = SetNuiFocus
    L1_2 = false
    L2_2 = false
    L0_2(L1_2, L2_2)
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.type = "hideRobberyIntelStatusUi"
  L0_2(L1_2)
end
function L13_1()
  local L0_2, L1_2, L2_2
  L0_2 = L5_1
  L0_2 = L0_2 + 1
  L5_1 = L0_2
  L0_2 = L3_1
  if L0_2 then
    L0_2 = HideTextOption
    L0_2()
    L0_2 = false
    L3_1 = L0_2
  end
  L0_2 = L1_1
  if L0_2 then
    L0_2 = DoesEntityExist
    L1_2 = L1_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = L4_1
      if L0_2 then
        L0_2 = GetResourceState
        L1_2 = "RevoInteract"
        L0_2 = L0_2(L1_2)
        if "started" ~= L0_2 then
          L0_2 = Config
          L0_2 = L0_2.Target
          if L0_2 then
            L0_2 = Config
            L0_2 = L0_2.DrawTextInsteadOfTarget
            if not L0_2 then
              L0_2 = Config
              L0_2 = L0_2.Target
              if "ox_target" == L0_2 then
                L0_2 = exports
                L0_2 = L0_2.ox_target
                L1_2 = L0_2
                L0_2 = L0_2.removeLocalEntity
                L2_2 = L1_1
                L0_2(L1_2, L2_2)
              else
                L0_2 = exports
                L1_2 = Config
                L1_2 = L1_2.Target
                L0_2 = L0_2[L1_2]
                L1_2 = L0_2
                L0_2 = L0_2.RemoveTargetEntity
                L2_2 = L1_1
                L0_2(L1_2, L2_2)
              end
            end
          end
        end
      end
    end
  end
  L0_2 = false
  L4_1 = L0_2
end
function L14_1()
  local L0_2, L1_2
  L0_2 = L13_1
  L0_2()
  L0_2 = L12_1
  L0_2()
  L0_2 = L1_1
  if L0_2 then
    L0_2 = DoesEntityExist
    L1_2 = L1_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = DeleteEntity
      L1_2 = L1_1
      L0_2(L1_2)
    end
  end
  L0_2 = nil
  L1_1 = L0_2
end
function L15_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.FrameworkFunctions
  L0_2 = L0_2.TriggerCallback
  L1_2 = "Pug:server:GetRobberyIntelStatus"
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = type
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if "table" ~= L1_3 or not A0_3 then
      L1_3 = {}
      L1_3.success = false
      L2_3 = {}
      L1_3.robberies = L2_3
      A0_3 = L1_3
    end
    L1_3 = true
    L2_1 = L1_3
    L1_3 = SetNuiFocus
    L2_3 = true
    L3_3 = true
    L1_3(L2_3, L3_3)
    L1_3 = SendNUIMessage
    L2_3 = {}
    L2_3.type = "showRobberyIntelStatusUi"
    L2_3.data = A0_3
    L1_3(L2_3)
  end
  L0_2(L1_2, L2_2)
end
function L16_1()
  local L0_2, L1_2, L2_2
  L0_2 = L5_1
  L0_2 = L0_2 + 1
  L5_1 = L0_2
  L0_2 = L5_1
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    while true do
      L0_3 = L0_2
      L1_3 = L5_1
      if L0_3 ~= L1_3 then
        break
      end
      L0_3 = L1_1
      if not L0_3 then
        break
      end
      L0_3 = DoesEntityExist
      L1_3 = L1_1
      L0_3 = L0_3(L1_3)
      if not L0_3 then
        break
      end
      L0_3 = 1000
      L1_3 = L2_1
      if not L1_3 then
        L1_3 = IsPauseMenuActive
        L1_3 = L1_3()
        if not L1_3 then
          L1_3 = GetEntityCoords
          L2_3 = L1_1
          L1_3 = L1_3(L2_3)
          L2_3 = GetEntityCoords
          L3_3 = PlayerPedId
          L3_3, L4_3, L5_3, L6_3, L7_3 = L3_3()
          L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)
          L3_3 = L2_3 - L1_3
          L3_3 = #L3_3
          if L3_3 <= 2.0 then
            L0_3 = 0
            L4_3 = L3_1
            if not L4_3 then
              L4_3 = DrawTextOption
              L5_3 = "[E] %s"
              L6_3 = L5_3
              L5_3 = L5_3.format
              L7_3 = L0_1.interactionLabel
              if not L7_3 then
                L7_3 = "Ask about robbery intel"
              end
              L5_3, L6_3, L7_3 = L5_3(L6_3, L7_3)
              L4_3(L5_3, L6_3, L7_3)
              L4_3 = true
              L3_1 = L4_3
            end
            L4_3 = IsControlJustPressed
            L5_3 = 0
            L6_3 = 38
            L4_3 = L4_3(L5_3, L6_3)
            if L4_3 then
              L4_3 = HideTextOption
              L4_3()
              L4_3 = false
              L3_1 = L4_3
              L4_3 = L15_1
              L4_3()
              L4_3 = Wait
              L5_3 = 250
              L4_3(L5_3)
            end
          else
            L4_3 = L3_1
            if L4_3 then
              L4_3 = HideTextOption
              L4_3()
              L4_3 = false
              L3_1 = L4_3
            end
          end
      end
      else
        L1_3 = L3_1
        if L1_3 then
          L1_3 = HideTextOption
          L1_3()
          L1_3 = false
          L3_1 = L1_3
        end
      end
      L1_3 = Wait
      L2_3 = L0_3
      L1_3(L2_3)
    end
    L0_3 = L3_1
    if L0_3 then
      L0_3 = HideTextOption
      L0_3()
      L0_3 = false
      L3_1 = L0_3
    end
  end
  L1_2(L2_2)
end
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = L0_1.enabled
  if L0_2 then
    L0_2 = L0_1.coords
    if L0_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L0_2 = L1_1
  if L0_2 then
    L0_2 = DoesEntityExist
    L1_2 = L1_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
      return
    end
  end
  L0_2 = GetHashKey
  L1_2 = L0_1.pedModel
  L0_2 = L0_2(L1_2)
  L1_2 = LoadModel
  L2_2 = L0_1.pedModel
  L1_2(L2_2)
  L1_2 = L0_1.coords
  L2_2 = tonumber
  L3_2 = L0_1.heading
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0.0
  end
  L3_2 = CreatePed
  L4_2 = 4
  L5_2 = L0_2
  L6_2 = L1_2.x
  L7_2 = L1_2.y
  L8_2 = L1_2.z
  L9_2 = L2_2 + 0.0
  L10_2 = false
  L11_2 = true
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L1_1 = L3_2
  L3_2 = DoesEntityExist
  L4_2 = L1_1
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = nil
    L1_1 = L3_2
    return
  end
  L3_2 = SetEntityAsMissionEntity
  L4_2 = L1_1
  L5_2 = true
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetEntityInvincible
  L4_2 = L1_1
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetBlockingOfNonTemporaryEvents
  L4_2 = L1_1
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetPedCanRagdoll
  L4_2 = L1_1
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = SetPedFleeAttributes
  L4_2 = L1_1
  L5_2 = 0
  L6_2 = false
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetEntityHeading
  L4_2 = L1_1
  L5_2 = L2_2 + 0.0
  L3_2(L4_2, L5_2)
  L3_2 = FreezeEntityPosition
  L4_2 = L1_1
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = GetResourceState
  L4_2 = "RevoInteract"
  L3_2 = L3_2(L4_2)
  if "started" ~= L3_2 then
    L3_2 = Config
    L3_2 = L3_2.Target
    if L3_2 then
      L3_2 = Config
      L3_2 = L3_2.DrawTextInsteadOfTarget
      if not L3_2 then
        L3_2 = Config
        L3_2 = L3_2.Target
        if "ox_target" == L3_2 then
          L3_2 = exports
          L3_2 = L3_2.ox_target
          L4_2 = L3_2
          L3_2 = L3_2.addLocalEntity
          L5_2 = L1_1
          L6_2 = {}
          L7_2 = {}
          L7_2.name = "PugRobberyIntelNpc"
          L7_2.icon = "fa-solid fa-user-secret"
          L8_2 = L0_1.interactionLabel
          if not L8_2 then
            L8_2 = "Ask about robbery intel"
          end
          L7_2.label = L8_2
          L7_2.distance = 2.0
          function L8_2()
            local L0_3, L1_3
            L0_3 = L15_1
            L0_3()
          end
          L7_2.onSelect = L8_2
          L6_2[1] = L7_2
          L3_2(L4_2, L5_2, L6_2)
        else
          L3_2 = exports
          L4_2 = Config
          L4_2 = L4_2.Target
          L3_2 = L3_2[L4_2]
          L4_2 = L3_2
          L3_2 = L3_2.AddTargetEntity
          L5_2 = L1_1
          L6_2 = {}
          L7_2 = {}
          L8_2 = {}
          L8_2.icon = "fa-solid fa-user-secret"
          L9_2 = L0_1.interactionLabel
          if not L9_2 then
            L9_2 = "Ask about robbery intel"
          end
          L8_2.label = L9_2
          function L9_2()
            local L0_3, L1_3
            L0_3 = L15_1
            L0_3()
          end
          L8_2.action = L9_2
          L7_2[1] = L8_2
          L6_2.options = L7_2
          L6_2.distance = 2.0
          L3_2(L4_2, L5_2, L6_2)
        end
        L3_2 = true
        L4_1 = L3_2
    end
  end
  else
    L3_2 = L16_1
    L3_2()
  end
end
function L18_1()
  local L0_2, L1_2, L2_2
  L0_2 = L6_1
  L0_2 = L0_2 + 1
  L6_1 = L0_2
  L0_2 = L6_1
  L1_2 = L14_1
  L1_2()
  L1_2 = L0_1.enabled
  if L1_2 then
    L1_2 = L0_1.coords
    if L1_2 then
      goto lbl_15
    end
  end
  do return end
  ::lbl_15::
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    while true do
      L0_3 = L0_2
      L1_3 = L6_1
      if L0_3 ~= L1_3 then
        break
      end
      L0_3 = L0_1.enabled
      if not L0_3 then
        break
      end
      L0_3 = L0_1.coords
      if not L0_3 then
        break
      end
      L0_3 = GetEntityCoords
      L1_3 = PlayerPedId
      L1_3, L2_3, L3_3, L4_3, L5_3 = L1_3()
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)
      L1_3 = L0_1.coords
      L2_3 = vector3
      L3_3 = L1_3.x
      L4_3 = L1_3.y
      L5_3 = L1_3.z
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L2_3 = L0_3 - L2_3
      L2_3 = #L2_3
      L3_3 = L7_1
      if L2_3 <= L3_3 then
        L3_3 = L17_1
        L3_3()
      else
        L3_3 = L1_1
        if L3_3 then
          L3_3 = DoesEntityExist
          L4_3 = L1_1
          L3_3 = L3_3(L4_3)
          if L3_3 then
            L3_3 = L8_1
            if L2_3 >= L3_3 then
              L3_3 = L14_1
              L3_3()
            end
          end
        end
      end
      L3_3 = Wait
      L4_3 = 1000
      L3_3(L4_3)
    end
  end
  L1_2(L2_2)
end
function L19_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L11_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L0_1 = L1_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "updateRobberyIntelData"
  L3_2 = L0_1
  L2_2.RobberyIntelData = L3_2
  L1_2(L2_2)
  L1_2 = L18_1
  L1_2()
end
function L20_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Config
  L1_2 = L1_2.FrameworkFunctions
  L1_2 = L1_2.TriggerCallback
  L2_2 = "Pug:server:GetRobberyIntelConfig"
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L11_1
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = A0_2
    if L2_3 then
      L2_3 = A0_2
      L3_3 = L1_3
      L2_3(L3_3)
      return
    end
    L2_3 = L19_1
    L3_3 = L1_3
    L2_3(L3_3)
  end
  L1_2(L2_2, L3_2)
end
L21_1 = RegisterNUICallback
L22_1 = "CloseRobberyIntelUi"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L12_1
  L2_2()
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "SaveRobberyIntelConfig"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:server:SaveRobberyIntelConfig"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNUICallback
L22_1 = "RequestRobberyIntelConfig"
function L23_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L20_1
  function L3_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = {}
    end
    L1_3(L2_3)
  end
  L2_2(L3_2)
end
L21_1(L22_1, L23_1)
L21_1 = RegisterNetEvent
L22_1 = "Pug:client:UpdateRobberyIntelData"
function L23_1(A0_2)
  local L1_2, L2_2
  L1_2 = L19_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L21_1(L22_1, L23_1)
L21_1 = AddEventHandler
L22_1 = "onResourceStop"
function L23_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = L14_1
  L1_2()
end
L21_1(L22_1, L23_1)
L21_1 = CreateThread
function L22_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 1500
  L0_2(L1_2)
  L0_2 = L20_1
  L0_2()
end
L21_1(L22_1)
