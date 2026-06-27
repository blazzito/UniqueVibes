local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = nil
L1_1 = nil
L2_1 = {}
LaserTable = L2_1
L2_1 = PlayerData
if not L2_1 then
  L2_1 = {}
end
PlayerData = L2_1
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = PugIsRobberyCreatorPoliceJob
  if L0_2 then
    L0_2 = PugIsRobberyCreatorPoliceJob
    L1_2 = {}
    L2_2 = "ambulance"
    L1_2[1] = L2_2
    L0_2 = L0_2(L1_2)
    if L0_2 then
      goto lbl_13
    end
  end
  L0_2 = false
  ::lbl_13::
  L1_1 = L0_2
  L0_2 = L1_1
  return L0_2
end
IsPoliceCheck = L2_1
L2_1 = RegisterNetEvent
L3_1 = "QBCore:Client:OnJobUpdate"
function L4_1(A0_2)
  local L1_2
  L1_2 = Framework
  if "QBCore" ~= L1_2 then
    return
  end
  L1_2 = PlayerData
  L1_2.job = A0_2
  L1_2 = IsPoliceCheck
  L1_2()
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNetEvent
L3_1 = "esx:setJob"
function L4_1(A0_2)
  local L1_2
  L1_2 = Framework
  if "ESX" ~= L1_2 then
    return
  end
  L1_2 = PlayerData
  L1_2.job = A0_2
  L1_2 = IsPoliceCheck
  L1_2()
end
L2_1(L3_1, L4_1)
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = 0
  if "S" == A0_2 then
    L1_2 = 0
  elseif "SSE" == A0_2 then
    L1_2 = 22.5
  elseif "ESE" == A0_2 then
    L1_2 = 45
  elseif "E" == A0_2 then
    L1_2 = 67.5
  elseif "ENE" == A0_2 then
    L1_2 = 90
  elseif "NE" == A0_2 then
    L1_2 = 112.5
  elseif "SE" == A0_2 then
    L1_2 = 40.0
  elseif "NNE" == A0_2 then
    L1_2 = 157.5
  elseif "N" == A0_2 then
    L1_2 = 180
  elseif "NNW" == A0_2 then
    L1_2 = 202.5
  elseif "NW" == A0_2 then
    L1_2 = 225
  elseif "WNW" == A0_2 then
    L1_2 = 247.5
  elseif "W" == A0_2 then
    L1_2 = 270
  elseif "WSW" == A0_2 then
    L1_2 = 292.5
  elseif "SW" == A0_2 then
    L1_2 = 315
  elseif "SSW" == A0_2 then
    L1_2 = 337.5
  elseif "up" == A0_2 then
    L2_2 = vector3
    L3_2 = 0
    L4_2 = 0
    L5_2 = 1
    return L2_2(L3_2, L4_2, L5_2)
  elseif "down" == A0_2 then
    L2_2 = vector3
    L3_2 = 0
    L4_2 = 0
    L5_2 = -1
    return L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = math
  L2_2 = L2_2.rad
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = vector3
  L4_2 = math
  L4_2 = L4_2.sin
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = math
  L5_2 = L5_2.cos
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L5_2 = -L5_2
  L6_2 = 0
  return L3_2(L4_2, L5_2, L6_2)
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2.movement
  L2_2 = A0_2.directionState
  L3_2 = A0_2.speed
  L2_2 = L2_2 * L3_2
  L3_2 = L2_1
  L4_2 = A0_2.movement
  L4_2 = L4_2.direction
  L3_2 = L3_2(L4_2)
  L4_2 = A0_2.start
  L5_2 = L3_2 * L2_2
  L4_2 = L4_2 + L5_2
  A0_2.start = L4_2
  L4_2 = A0_2.endPos
  L5_2 = L3_2 * L2_2
  L4_2 = L4_2 + L5_2
  A0_2.endPos = L4_2
  L4_2 = A0_2.start
  L5_2 = A0_2.initialStart
  L4_2 = L4_2 - L5_2
  L4_2 = #L4_2
  L5_2 = A0_2.movement
  L5_2 = L5_2.amount
  if L4_2 >= L5_2 then
    L5_2 = A0_2.directionState
    L5_2 = -L5_2
    A0_2.directionState = L5_2
  else
    L5_2 = A0_2.directionState
    if -1 == L5_2 then
      L5_2 = 0.01
      if L4_2 < L5_2 then
        L5_2 = A0_2.initialStart
        A0_2.start = L5_2
        L5_2 = A0_2.initialEnd
        A0_2.endPos = L5_2
        A0_2.directionState = 1
      end
    end
  end
end
L4_1 = CreateThread
function L5_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = false
    L3_2 = pairs
    L4_2 = LaserTable
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = vector3
      L10_2 = L8_2.start
      L10_2 = L10_2.x
      L11_2 = L8_2.start
      L11_2 = L11_2.y
      L12_2 = L8_2.start
      L12_2 = L12_2.z
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L9_2 = L1_2 - L9_2
      L9_2 = #L9_2
      L10_2 = vector3
      L11_2 = L8_2.endPos
      L11_2 = L11_2.x
      L12_2 = L8_2.endPos
      L12_2 = L12_2.y
      L13_2 = L8_2.endPos
      L13_2 = L13_2.z
      L10_2 = L10_2(L11_2, L12_2, L13_2)
      L10_2 = L1_2 - L10_2
      L10_2 = #L10_2
      L11_2 = math
      L11_2 = L11_2.min
      L12_2 = L9_2
      L13_2 = L10_2
      L11_2 = L11_2(L12_2, L13_2)
      if L11_2 > 50 then
      else
        L2_2 = true
        L12_2 = L1_1
        if L12_2 then
          L12_2 = L8_2.color
          L12_2.r = 0
          L12_2 = L8_2.color
          L12_2.g = 150
        else
          L12_2 = L8_2.color
          L12_2.r = 150
          L12_2 = L8_2.color
          L12_2.g = 0
        end
        L12_2 = DrawLine
        L13_2 = L8_2.start
        L13_2 = L13_2.x
        L14_2 = L8_2.start
        L14_2 = L14_2.y
        L15_2 = L8_2.start
        L15_2 = L15_2.z
        L16_2 = L8_2.endPos
        L16_2 = L16_2.x
        L17_2 = L8_2.endPos
        L17_2 = L17_2.y
        L18_2 = L8_2.endPos
        L18_2 = L18_2.z
        L19_2 = L8_2.color
        L19_2 = L19_2.r
        L20_2 = L8_2.color
        L20_2 = L20_2.g
        L21_2 = L8_2.color
        L21_2 = L21_2.b
        L22_2 = L8_2.color
        L22_2 = L22_2.a
        L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L12_2 = L8_2.movement
        L12_2 = L12_2.direction
        if "none" ~= L12_2 then
          L12_2 = L3_1
          L13_2 = L8_2
          L12_2(L13_2)
        end
        L12_2 = ClosestPointOnLine
        L13_2 = L1_2
        L14_2 = L8_2.start
        L15_2 = L8_2.endPos
        L12_2 = L12_2(L13_2, L14_2, L15_2)
        L13_2 = L1_2 - L12_2
        L13_2 = #L13_2
        L14_2 = L8_2.editorPreview
        if true ~= L14_2 then
          L14_2 = L0_1
          if not L14_2 then
            L14_2 = 0.4
            if L13_2 < L14_2 then
              L14_2 = L1_1
              if not L14_2 then
                L14_2 = GetEntityHealth
                L15_2 = L0_2
                L14_2 = L14_2(L15_2)
                L15_2 = SetEntityHealth
                L16_2 = L0_2
                L17_2 = L8_2.damage
                L17_2 = L14_2 - L17_2
                L15_2(L16_2, L17_2)
                L15_2 = Notify
                L16_2 = Config
                L16_2 = L16_2.LangT
                L16_2 = L16_2.HitByLasers
                L17_2 = "error"
                L15_2(L16_2, L17_2)
                L15_2 = StartEntityFire
                L16_2 = PlayerPedId
                L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L16_2()
                L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
                L15_2 = CreateThread
                function L16_2()
                  local L0_3, L1_3
                  L0_3 = Wait
                  L1_3 = 50
                  L0_3(L1_3)
                  L0_3 = StopEntityFire
                  L1_3 = PlayerPedId
                  L1_3 = L1_3()
                  L0_3(L1_3)
                end
                L15_2(L16_2)
                L15_2 = true
                L0_1 = L15_2
                L15_2 = CreateThread
                function L16_2()
                  local L0_3, L1_3
                  L0_3 = Wait
                  L1_3 = 2000
                  L0_3(L1_3)
                  L0_3 = false
                  L0_1 = L0_3
                end
                L15_2(L16_2)
              end
            end
          end
        end
      end
    end
    if L2_2 then
      L3_2 = Wait
      L4_2 = 0
      L3_2(L4_2)
    else
      L3_2 = Wait
      L4_2 = 1000
      L3_2(L4_2)
    end
  end
end
L4_1(L5_1)
function L4_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = A2_2 - A1_2
  L4_2 = A0_2 - A1_2
  L5_2 = #L3_2
  L6_2 = L4_2.x
  L7_2 = L3_2.x
  L6_2 = L6_2 * L7_2
  L7_2 = L4_2.y
  L8_2 = L3_2.y
  L7_2 = L7_2 * L8_2
  L6_2 = L6_2 + L7_2
  L7_2 = L4_2.z
  L8_2 = L3_2.z
  L7_2 = L7_2 * L8_2
  L6_2 = L6_2 + L7_2
  L7_2 = L5_2 * L5_2
  L7_2 = L6_2 / L7_2
  L8_2 = math
  L8_2 = L8_2.max
  L9_2 = 0.0
  L10_2 = math
  L10_2 = L10_2.min
  L11_2 = 1.0
  L12_2 = L7_2
  L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L7_2 = L8_2
  L8_2 = vector3
  L9_2 = A1_2.x
  L10_2 = L3_2.x
  L10_2 = L7_2 * L10_2
  L9_2 = L9_2 + L10_2
  L10_2 = A1_2.y
  L11_2 = L3_2.y
  L11_2 = L7_2 * L11_2
  L10_2 = L10_2 + L11_2
  L11_2 = A1_2.z
  L12_2 = L3_2.z
  L12_2 = L7_2 * L12_2
  L11_2 = L11_2 + L12_2
  return L8_2(L9_2, L10_2, L11_2)
end
ClosestPointOnLine = L4_1
