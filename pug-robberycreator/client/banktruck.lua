local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = nil
BankTruckHackProp = false
L4_1 = nil
L5_1 = false
L6_1 = 100.0
L7_1 = 120.0
function L8_1()
  local L0_2, L1_2
  L0_2 = L4_1
  if L0_2 then
    L0_2 = L4_1.entity
    if L0_2 then
      L0_2 = DoesEntityExist
      L1_2 = L4_1.entity
      L0_2 = L0_2(L1_2)
      if L0_2 then
        L0_2 = DeleteEntity
        L1_2 = L4_1.entity
        L0_2(L1_2)
      end
    end
  end
  L0_2 = L4_1
  if L0_2 then
    L0_2 = BankTruckHackProp
    L1_2 = L4_1.entity
    if L0_2 == L1_2 then
      BankTruckHackProp = false
    end
  end
  L0_2 = L4_1
  if L0_2 then
    L4_1.entity = nil
  end
end
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L4_1
  if L0_2 then
    L1_2 = L0_2.model
    if L1_2 then
      L1_2 = L0_2.coords
      if L1_2 then
        goto lbl_11
      end
    end
  end
  do return end
  ::lbl_11::
  L1_2 = L0_2.entity
  if L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = L0_2.entity
    L1_2 = L1_2(L2_2)
    if L1_2 then
      return
    end
  end
  L1_2 = LoadModel
  L2_2 = L0_2.model
  L1_2(L2_2)
  L1_2 = CreateObject
  L2_2 = GetHashKey
  L3_2 = L0_2.model
  L2_2 = L2_2(L3_2)
  L3_2 = L0_2.coords
  L3_2 = L3_2.x
  L4_2 = L0_2.coords
  L4_2 = L4_2.y
  L5_2 = L0_2.coords
  L5_2 = L5_2.z
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L0_2.entity = L1_2
  L1_2 = L0_2.entity
  if L1_2 then
    L1_2 = L0_2.entity
    if 0 ~= L1_2 then
      L1_2 = DoesEntityExist
      L2_2 = L0_2.entity
      L1_2 = L1_2(L2_2)
      if L1_2 then
        goto lbl_48
      end
    end
  end
  L0_2.entity = nil
  do return end
  ::lbl_48::
  L1_2 = L0_2.entity
  BankTruckHackProp = L1_2
  L1_2 = SetEntityHeading
  L2_2 = L0_2.entity
  L3_2 = L0_2.heading
  L3_2 = L3_2 + 0.0
  L1_2(L2_2, L3_2)
  L1_2 = FreezeEntityPosition
  L2_2 = L0_2.entity
  L3_2 = true
  L1_2(L2_2, L3_2)
end
function L10_1()
  local L0_2, L1_2
  L0_2 = L5_1
  if L0_2 then
    return
  end
  L0_2 = true
  L5_1 = L0_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3
    while true do
      L0_3 = L4_1
      if not L0_3 then
        break
      end
      L0_3 = GetEntityCoords
      L1_3 = PlayerPedId
      L1_3, L2_3, L3_3 = L1_3()
      L0_3 = L0_3(L1_3, L2_3, L3_3)
      L1_3 = L4_1.coords
      L1_3 = L0_3 - L1_3
      L1_3 = #L1_3
      L2_3 = L6_1
      if L1_3 <= L2_3 then
        L2_3 = L9_1
        L2_3()
      else
        L2_3 = L4_1.entity
        if L2_3 then
          L2_3 = DoesEntityExist
          L3_3 = L4_1.entity
          L2_3 = L2_3(L3_3)
          if L2_3 then
            L2_3 = L7_1
            if L1_3 >= L2_3 then
              L2_3 = L8_1
              L2_3()
            end
          end
        end
      end
      L2_3 = Wait
      L3_3 = 1000
      L2_3(L3_3)
    end
    L0_3 = false
    L5_1 = L0_3
  end
  L0_2(L1_2)
end
function L11_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L8_1
  L3_2()
  L3_2 = {}
  L3_2.model = A0_2
  L3_2.coords = A1_2
  L4_2 = tonumber
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0.0
  end
  L3_2.heading = L4_2
  L3_2.entity = nil
  L4_1 = L3_2
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  if L3_2 and 0 ~= L3_2 then
    L4_2 = DoesEntityExist
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = GetEntityCoords
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      L4_2 = L4_2 - A1_2
      L4_2 = #L4_2
      L5_2 = L6_1
      if L4_2 <= L5_2 then
        L4_2 = L9_1
        L4_2()
      end
    end
  end
  L4_2 = L10_1
  L4_2()
end
L12_1 = RegisterNUICallback
L13_1 = "SaveBankTruckData"
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:saveBankTruckData"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L12_1(L13_1, L14_1)
function L12_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = GetEntityCoords
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = nil
  L3_2 = L1_2
  L4_2 = GetGamePool
  L5_2 = "CVehicle"
  L4_2 = L4_2(L5_2)
  L5_2 = nil
  L6_2 = 5.0
  L7_2 = pairs
  L8_2 = L4_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = GetEntityCoords
    L14_2 = L12_2
    L13_2 = L13_2(L14_2)
    L14_2 = L3_2 - L13_2
    L14_2 = #L14_2
    if L6_2 > L14_2 then
      L15_2 = GetEntityModel
      L16_2 = L12_2
      L15_2 = L15_2(L16_2)
      L16_2 = GetHashKey
      L17_2 = "stockade"
      L16_2 = L16_2(L17_2)
      if L15_2 == L16_2 then
        L2_2 = L12_2
      end
    end
  end
  return L2_2
end
function L13_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L2_2 = nil
  L3_2 = Config
  L3_2 = L3_2.RobberyAnimations
  L4_2 = A0_2.animation
  L3_2 = L3_2[L4_2]
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.RobberyAnimations
    L4_2 = A0_2.animation
    L2_2 = L3_2[L4_2]
  else
    L3_2 = Config
    L3_2 = L3_2.Animations
    L4_2 = tonumber
    L5_2 = A0_2.animation
    L4_2 = L4_2(L5_2)
    L2_2 = L3_2[L4_2]
  end
  if nil ~= L2_2 then
    L3_2 = L2_2.NetworkedAnimations
    if L3_2 then
      L3_2 = L2_2.NetworkedAnimations
      L3_2 = #L3_2
      if 1 == L3_2 then
        L3_2 = GetJewelryCases
        L4_2 = A0_2.propName
        L3_2 = L3_2(L4_2)
        if L3_2 then
        else
          L3_2 = A0_2.propName
          if "tr_prop_tr_container_01a" == L3_2 then
            L3_2 = Wait
            L4_2 = 4000
            L3_2(L4_2)
          end
        end
        L3_2 = DestroyAllProps
        L3_2()
        L3_2 = Config
        L3_2 = L3_2.RobberyAnimations
        L4_2 = A0_2.animation
        L3_2 = L3_2[L4_2]
        if L3_2 then
          L3_2 = Config
          L3_2 = L3_2.RobberyAnimations
          L4_2 = A0_2.animation
          L3_2 = L3_2[L4_2]
          L3_2 = L3_2.ReplaceProp
          if L3_2 then
            L3_2 = GetJewelryCases
            L4_2 = A0_2.animation
            L3_2 = L3_2(L4_2)
            if L3_2 then
              L3_2 = ClearPedTasks
              L4_2 = PlayerPedId
              L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L4_2()
              L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
            end
            L3_2 = GetJewelryCases
            L4_2 = A0_2.animation
            L3_2 = L3_2(L4_2)
            if not L3_2 then
              L3_2 = TriggerServerEvent
              L4_2 = "Pug:server:CreateSyncedProps"
              L5_2 = A1_2.Coords
              L6_2 = A1_2.Rotation
              L7_2 = L2_2.NetworkedAnimations
              L7_2 = L7_2[1]
              L7_2 = L7_2.AnimDict
              L8_2 = A1_2.RobberyName
              L9_2 = A0_2.propName
              L10_2 = A1_2
              L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
            end
          else
            L3_2 = ClearPedTasks
            L4_2 = PlayerPedId
            L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L4_2()
            L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
          end
        end
        return
      end
      L3_2 = L2_2.NetworkedAnimations
      L4_2 = L2_2.NetworkedAnimations
      L4_2 = #L4_2
      L3_2 = L3_2[L4_2]
      if L3_2 then
        L3_2 = L2_2.NetworkedAnimations
        L3_2 = L3_2[2]
        L3_2 = L3_2.AnimAction
        if "drill_straight_end_idle" == L3_2 then
          L3_2 = L2_2.NetworkedAnimations
          L3_2 = L3_2[2]
          L3_2 = L3_2.AnimationOptions
          L3_2 = L3_2.SecondProp
          if "hei_prop_heist_drill" == L3_2 then
            L3_2 = StopSound
            L4_2 = soundIdGolbal
            L3_2(L4_2)
            L3_2 = ReleaseAmbientAudioBank
            L4_2 = "DLC_HEIST_FLEECA_SOUNDSET"
            L3_2(L4_2)
            L3_2 = ReleaseAmbientAudioBank
            L4_2 = "DLC_MPHEIST\\HEIST_FLEECA_DRILL"
            L3_2(L4_2)
            L3_2 = ReleaseAmbientAudioBank
            L4_2 = "DLC_MPHEIST\\HEIST_FLEECA_DRILL_2"
            L3_2(L4_2)
          end
        end
        L3_2 = DestroyAllProps
        L3_2()
        L3_2 = L2_2.NetworkedAnimations
        L3_2 = #L3_2
        L4_2 = tonumber
        L5_2 = A0_2.animation
        L4_2 = L4_2(L5_2)
        L5_2 = L2_2.NetworkedAnimations
        L5_2 = L5_2[L3_2]
        L5_2 = L5_2.ZOffset
        L6_2 = L2_2.NetworkedAnimations
        L6_2 = L6_2[L3_2]
        L6_2 = L6_2.YOffset
        L7_2 = L2_2.NetworkedAnimations
        L7_2 = L7_2[L3_2]
        L7_2 = L7_2.XOffset
        L8_2 = loadAnimDict
        L9_2 = L2_2.NetworkedAnimations
        L9_2 = L9_2[L3_2]
        L9_2 = L9_2.AnimDict
        L8_2(L9_2)
        L8_2 = GetEntityCoords
        L9_2 = PlayerPedId
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L9_2()
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        L9_2 = GetEntityHeading
        L10_2 = PlayerPedId
        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L10_2()
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        L10_2 = math
        L10_2 = L10_2.rad
        L11_2 = L9_2
        L10_2 = L10_2(L11_2)
        L11_2 = math
        L11_2 = L11_2.cos
        L12_2 = L10_2
        L11_2 = L11_2(L12_2)
        L11_2 = L7_2 * L11_2
        L12_2 = math
        L12_2 = L12_2.sin
        L13_2 = L10_2
        L12_2 = L12_2(L13_2)
        L12_2 = L6_2 * L12_2
        L11_2 = L11_2 - L12_2
        L12_2 = math
        L12_2 = L12_2.sin
        L13_2 = L10_2
        L12_2 = L12_2(L13_2)
        L12_2 = L7_2 * L12_2
        L13_2 = math
        L13_2 = L13_2.cos
        L14_2 = L10_2
        L13_2 = L13_2(L14_2)
        L13_2 = L6_2 * L13_2
        L12_2 = L12_2 + L13_2
        L13_2 = vector3
        L14_2 = L8_2.x
        L14_2 = L14_2 + L11_2
        L15_2 = L8_2.y
        L15_2 = L15_2 + L12_2
        L16_2 = L8_2.z
        L16_2 = L16_2 + L5_2
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        L14_2 = vector3
        L15_2 = 0.0
        L16_2 = 0.0
        L17_2 = L9_2
        L14_2 = L14_2(L15_2, L16_2, L17_2)
        if A1_2 then
          L15_2 = A1_2.Coords
          L14_2 = A1_2.Rotation
          L13_2 = L15_2
          L15_2 = Config
          L15_2 = L15_2.RobberyAnimations
          L16_2 = A0_2.animation
          L15_2 = L15_2[L16_2]
          if L15_2 then
            L15_2 = Config
            L15_2 = L15_2.RobberyAnimations
            L16_2 = A0_2.animation
            L15_2 = L15_2[L16_2]
            L15_2 = L15_2.ReplaceProp
            if L15_2 then
              L15_2 = TriggerServerEvent
              L16_2 = "Pug:server:CreateSyncedProps"
              L17_2 = A1_2.Coords
              L18_2 = A1_2.Rotation
              L19_2 = L2_2.NetworkedAnimations
              L19_2 = L19_2[1]
              L19_2 = L19_2.AnimDict
              L20_2 = A1_2.RobberyName
              L21_2 = A0_2.propName
              L22_2 = A1_2
              L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
            end
          end
        end
        L15_2 = NetworkCreateSynchronisedScene
        L16_2 = L13_2
        L17_2 = L14_2
        L18_2 = 2
        L19_2 = true
        L20_2 = false
        L21_2 = 1065353216
        L22_2 = 0
        L23_2 = 1.3
        L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
        L16_2 = NetworkAddPedToSynchronisedScene
        L17_2 = PlayerPedId
        L17_2 = L17_2()
        L18_2 = L15_2
        L19_2 = L2_2.NetworkedAnimations
        L19_2 = L19_2[L3_2]
        L19_2 = L19_2.AnimDict
        L20_2 = L2_2.NetworkedAnimations
        L20_2 = L20_2[L3_2]
        L20_2 = L20_2.AnimAction
        L21_2 = 1.5
        L22_2 = -4.0
        L23_2 = 1
        L24_2 = 1
        L25_2 = 1148846080
        L26_2 = 0
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
        L16_2 = L2_2.NetworkedAnimations
        L16_2 = L16_2[L3_2]
        L16_2 = L16_2.AnimationOptions
        if L16_2 then
          L16_2 = L2_2.NetworkedAnimations
          L16_2 = L16_2[L3_2]
          L16_2 = L16_2.AnimationOptions
          L16_2 = L16_2.Prop
          L17_2 = nil
          L18_2 = table
          L18_2 = L18_2.unpack
          L19_2 = {}
          L20_2 = 0
          L21_2 = 0
          L22_2 = 0
          L23_2 = 0
          L24_2 = 0
          L19_2[1] = L20_2
          L19_2[2] = L21_2
          L19_2[3] = L22_2
          L19_2[4] = L23_2
          L19_2[5] = L24_2
          L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2(L19_2)
          PropPl6 = L23_2
          PropPl5 = L22_2
          PropPl4 = L21_2
          PropPl3 = L20_2
          PropPl2 = L19_2
          PropPl1 = L18_2
          L18_2 = L2_2.NetworkedAnimations
          L18_2 = L18_2[L3_2]
          L18_2 = L18_2.AnimationOptions
          L18_2 = L18_2.SecondProp
          if L18_2 then
            L18_2 = L2_2.NetworkedAnimations
            L18_2 = L18_2[L3_2]
            L18_2 = L18_2.AnimationOptions
            L18_2 = L18_2.SecondProp
            SecondPropName = L18_2
            L18_2 = table
            L18_2 = L18_2.unpack
            L19_2 = {}
            L20_2 = 0
            L21_2 = 0
            L22_2 = 0
            L23_2 = 0
            L24_2 = 0
            L19_2[1] = L20_2
            L19_2[2] = L21_2
            L19_2[3] = L22_2
            L19_2[4] = L23_2
            L19_2[5] = L24_2
            L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2(L19_2)
            SecondPropPl6 = L23_2
            SecondPropPl5 = L22_2
            SecondPropPl4 = L21_2
            SecondPropPl3 = L20_2
            SecondPropPl2 = L19_2
            SecondPropPl1 = L18_2
            L17_2 = true
          end
          L18_2 = AddPropToPlayer
          L19_2 = L16_2
          L20_2 = PropBone
          L21_2 = PropPl1
          L22_2 = PropPl2
          L23_2 = PropPl3
          L24_2 = PropPl4
          L25_2 = PropPl5
          L26_2 = PropPl6
          L27_2 = PlayerPedId
          L27_2 = L27_2()
          L28_2 = true
          L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
          while true do
            L18_2 = DoesEntityExist
            L19_2 = prop
            L18_2 = L18_2(L19_2)
            if L18_2 then
              break
            end
            L18_2 = Wait
            L19_2 = 100
            L18_2(L19_2)
          end
          L18_2 = NetworkAddEntityToSynchronisedScene
          L19_2 = prop
          L20_2 = L15_2
          L21_2 = L2_2.NetworkedAnimations
          L21_2 = L21_2[L3_2]
          L21_2 = L21_2.AnimationOptions
          L21_2 = L21_2.PropAnimationDict
          L22_2 = L2_2.NetworkedAnimations
          L22_2 = L22_2[L3_2]
          L22_2 = L22_2.AnimationOptions
          L22_2 = L22_2.PropAnimation
          L23_2 = 4.0
          L24_2 = -8.0
          L25_2 = 1
          L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
          if L17_2 then
            L18_2 = AddPropToPlayer
            L19_2 = SecondPropName
            L20_2 = SecondPropBone
            L21_2 = SecondPropPl1
            L22_2 = SecondPropPl2
            L23_2 = SecondPropPl3
            L24_2 = SecondPropPl4
            L25_2 = SecondPropPl5
            L26_2 = SecondPropPl6
            L27_2 = PlayerPedId
            L27_2 = L27_2()
            L28_2 = true
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
            while true do
              L18_2 = DoesEntityExist
              L19_2 = prop
              L18_2 = L18_2(L19_2)
              if L18_2 then
                break
              end
              L18_2 = Wait
              L19_2 = 100
              L18_2(L19_2)
            end
            L18_2 = NetworkAddEntityToSynchronisedScene
            L19_2 = prop
            L20_2 = L15_2
            L21_2 = L2_2.NetworkedAnimations
            L21_2 = L21_2[L3_2]
            L21_2 = L21_2.AnimationOptions
            L21_2 = L21_2.SecondPropAnimationDict
            L22_2 = L2_2.NetworkedAnimations
            L22_2 = L22_2[L3_2]
            L22_2 = L22_2.AnimationOptions
            L22_2 = L22_2.SecondPropAnimation
            L23_2 = 4.0
            L24_2 = -8.0
            L25_2 = 1
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
          end
          L18_2 = L2_2.NetworkedAnimations
          L18_2 = L18_2[L3_2]
          L18_2 = L18_2.AnimationOptions
          L18_2 = L18_2.ThirdProp
          if L18_2 then
            L18_2 = table
            L18_2 = L18_2.unpack
            L19_2 = {}
            L20_2 = 0
            L21_2 = 0
            L22_2 = 0
            L23_2 = 0
            L24_2 = 0
            L19_2[1] = L20_2
            L19_2[2] = L21_2
            L19_2[3] = L22_2
            L19_2[4] = L23_2
            L19_2[5] = L24_2
            L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2(L19_2)
            ThirdPropPl6 = L23_2
            ThirdPropPl5 = L22_2
            ThirdPropPl4 = L21_2
            ThirdPropPl3 = L20_2
            ThirdPropPl2 = L19_2
            ThirdPropPl1 = L18_2
            L18_2 = AddPropToPlayer
            L19_2 = L2_2.NetworkedAnimations
            L19_2 = L19_2[L3_2]
            L19_2 = L19_2.AnimationOptions
            L19_2 = L19_2.ThirdProp
            L20_2 = ThirdPropPl1
            L21_2 = ThirdPropPl2
            L22_2 = ThirdPropPl3
            L23_2 = ThirdPropPl4
            L24_2 = ThirdPropPl5
            L25_2 = ThirdPropPl6
            L26_2 = PlayerPedId
            L26_2 = L26_2()
            L27_2 = true
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
            while true do
              L18_2 = DoesEntityExist
              L19_2 = prop
              L18_2 = L18_2(L19_2)
              if L18_2 then
                break
              end
              L18_2 = Wait
              L19_2 = 100
              L18_2(L19_2)
            end
            L18_2 = NetworkAddEntityToSynchronisedScene
            L19_2 = prop
            L20_2 = L15_2
            L21_2 = L2_2.NetworkedAnimations
            L21_2 = L21_2[L3_2]
            L21_2 = L21_2.AnimationOptions
            L21_2 = L21_2.ThirdPropAnimationDict
            L22_2 = L2_2.NetworkedAnimations
            L22_2 = L22_2[L3_2]
            L22_2 = L22_2.AnimationOptions
            L22_2 = L22_2.ThirdPropAnimation
            L23_2 = 4.0
            L24_2 = -8.0
            L25_2 = 1
            L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
          end
        end
        L16_2 = NetworkStartSynchronisedScene
        L17_2 = L15_2
        L16_2(L17_2)
        L16_2 = Wait
        L17_2 = L2_2.NetworkedAnimations
        L17_2 = L17_2[L3_2]
        L17_2 = L17_2.WaitTime
        L16_2(L17_2)
        L16_2 = DestoryCamera
        L16_2()
        L16_2 = DestroyAllProps
        L16_2()
        L16_2 = ClearPedTasks
        L17_2 = PlayerPedId
        L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2()
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      end
    end
  end
end
function L14_1(A0_2)
  local L1_2, L2_2
  L1_2 = BeginTextCommandScaleformString
  L2_2 = "STRING"
  L1_2(L2_2)
  L1_2 = AddTextComponentScaleform
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = EndTextCommandScaleformString
  L1_2()
end
function L15_1(A0_2)
  local L1_2, L2_2
  L1_2 = N_0xe83a3e3557a56640
  L2_2 = A0_2
  L1_2(L2_2)
end
function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = BuildRobberyCreatorPlacementPrompt
  L2_2 = "Bank Truck Spawn Placement"
  L3_2 = nil
  L4_2 = {}
  L4_2.confirmLabel = "Confirm bank truck position"
  L4_2.description = "Place the truck, rotate it, then fine-tune the position if needed."
  return L1_2(L2_2, L3_2, L4_2)
end
L17_1 = RegisterNUICallback
L18_1 = "RequestTruckSpawnLocation"
function L19_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = Config
  L2_2 = L2_2.Color
  L3_2 = 0.04
  L4_2 = {}
  L5_2 = 0.0
  OriginalMode = true
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3
    L0_3 = L16_1
    L1_3 = "instructional_buttons"
    L0_3 = L0_3(L1_3)
    L1_3 = false
    L2_3 = LoadModel
    L3_3 = "stockade"
    L2_3(L3_3)
    L2_3 = CreateVehicle
    L3_3 = "stockade"
    L4_3 = GetEntityCoords
    L5_3 = PlayerPedId
    L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3 = L5_3()
    L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
    L3_3 = SetEntityCollision
    L4_3 = L2_3
    L5_3 = false
    L6_3 = false
    L3_3(L4_3, L5_3, L6_3)
    L3_3 = SetEntityInvincible
    L4_3 = L2_3
    L5_3 = true
    L3_3(L4_3, L5_3)
    while true do
      L3_3 = RayCastGamePlayCamera
      L4_3 = 20.0
      L3_3, L4_3, L5_3 = L3_3(L4_3)
      L6_3 = DrawRobberyCreatorPrompt
      L7_3 = L0_3
      L6_3(L7_3)
      if L3_3 then
        L6_3 = DisableControlAction
        L7_3 = 0
        L8_3 = 140
        L9_3 = true
        L6_3(L7_3, L8_3, L9_3)
        L6_3 = DisableControlAction
        L7_3 = 0
        L8_3 = 24
        L9_3 = true
        L6_3(L7_3, L8_3, L9_3)
        L6_3 = IsControlJustPressed
        L7_3 = 1
        L8_3 = 177
        L6_3 = L6_3(L7_3, L8_3)
        if L6_3 then
          break
        end
        L6_3 = GetEntityCoords
        L7_3 = PlayerPedId
        L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3 = L7_3()
        L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
        L7_3 = IsControlPressed
        L8_3 = 0
        L9_3 = 174
        L7_3 = L7_3(L8_3, L9_3)
        if L7_3 then
          L7_3 = L5_2
          L7_3 = L7_3 + 1.0
          L5_2 = L7_3
          L7_3 = L5_2
          L8_3 = 360
          if L7_3 > L8_3 then
            L7_3 = 0.0
            L5_2 = L7_3
          end
        else
          L7_3 = IsControlPressed
          L8_3 = 0
          L9_3 = 175
          L7_3 = L7_3(L8_3, L9_3)
          if L7_3 then
            L7_3 = L5_2
            L7_3 = L7_3 - 1.0
            L5_2 = L7_3
            L7_3 = L5_2
            if L7_3 < 0 then
              L7_3 = 360.0
              L5_2 = L7_3
            end
          end
        end
        L7_3 = GetEntityCoords
        L8_3 = L2_3
        L7_3 = L7_3(L8_3)
        L8_3 = GetEntityForwardVector
        L9_3 = L2_3
        L8_3 = L8_3(L9_3)
        L9_3 = table
        L9_3 = L9_3.unpack
        L10_3 = L8_3 * 0.05
        L10_3 = L7_3 - L10_3
        L9_3, L10_3, L11_3 = L9_3(L10_3)
        L12_3 = DrawMarker
        L13_3 = 28
        L14_3 = L9_3
        L15_3 = L10_3
        L16_3 = L11_3
        L17_3 = 0.0
        L18_3 = 0.0
        L19_3 = 0.0
        L20_3 = 0.0
        L21_3 = 0.0
        L22_3 = 0.0
        L23_3 = 0.03
        L24_3 = 0.03
        L25_3 = 0.03
        L26_3 = 0
        L27_3 = 150
        L28_3 = 0
        L29_3 = 100
        L30_3 = false
        L31_3 = false
        L32_3 = 2
        L33_3 = false
        L34_3 = nil
        L35_3 = nil
        L36_3 = false
        L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
        L12_3 = OriginalMode
        if not L12_3 then
          L12_3 = DisableControlAction
          L13_3 = 0
          L14_3 = 30
          L15_3 = true
          L12_3(L13_3, L14_3, L15_3)
          L12_3 = DisableControlAction
          L13_3 = 0
          L14_3 = 31
          L15_3 = true
          L12_3(L13_3, L14_3, L15_3)
          L12_3 = DisableControlAction
          L13_3 = 0
          L14_3 = 34
          L15_3 = true
          L12_3(L13_3, L14_3, L15_3)
          L12_3 = DisableControlAction
          L13_3 = 0
          L14_3 = 35
          L15_3 = true
          L12_3(L13_3, L14_3, L15_3)
          L12_3 = L7_3.z
          L13_3 = PlayerPedId
          L13_3 = L13_3()
          L14_3 = GetEntityCoords
          L15_3 = L13_3
          L14_3 = L14_3(L15_3)
          L15_3 = GetEntityCoords
          L16_3 = L2_3
          L15_3 = L15_3(L16_3)
          L16_3 = vector3
          L17_3 = L15_3.x
          L18_3 = L14_3.x
          L17_3 = L17_3 - L18_3
          L18_3 = L15_3.y
          L19_3 = L14_3.y
          L18_3 = L18_3 - L19_3
          L19_3 = 0
          L16_3 = L16_3(L17_3, L18_3, L19_3)
          L17_3 = math
          L17_3 = L17_3.sqrt
          L18_3 = L16_3.x
          L18_3 = L18_3 ^ 2
          L19_3 = L16_3.y
          L19_3 = L19_3 ^ 2
          L18_3 = L18_3 + L19_3
          L17_3 = L17_3(L18_3)
          L18_3 = vector3
          L19_3 = L16_3.x
          L19_3 = L19_3 / L17_3
          L20_3 = L16_3.y
          L20_3 = L20_3 / L17_3
          L21_3 = 0
          L18_3 = L18_3(L19_3, L20_3, L21_3)
          L19_3 = vector3
          L20_3 = L18_3.y
          L20_3 = -L20_3
          L21_3 = L18_3.x
          L22_3 = 0
          L19_3 = L19_3(L20_3, L21_3, L22_3)
          L20_3 = IsDisabledControlPressed
          L21_3 = 1
          L22_3 = 32
          L20_3 = L20_3(L21_3, L22_3)
          if L20_3 then
            L20_3 = L15_3.x
            L21_3 = L18_3.x
            L21_3 = 0.01 * L21_3
            L20_3 = L20_3 + L21_3
            L21_3 = L15_3.y
            L22_3 = L18_3.y
            L22_3 = 0.01 * L22_3
            L21_3 = L21_3 + L22_3
            L22_3 = SetEntityCoords
            L23_3 = L2_3
            L24_3 = L20_3
            L25_3 = L21_3
            L26_3 = L12_3
            L22_3(L23_3, L24_3, L25_3, L26_3)
          end
          L20_3 = IsDisabledControlPressed
          L21_3 = 1
          L22_3 = 33
          L20_3 = L20_3(L21_3, L22_3)
          if L20_3 then
            L20_3 = L15_3.x
            L21_3 = L18_3.x
            L21_3 = 0.01 * L21_3
            L20_3 = L20_3 - L21_3
            L21_3 = L15_3.y
            L22_3 = L18_3.y
            L22_3 = 0.01 * L22_3
            L21_3 = L21_3 - L22_3
            L22_3 = SetEntityCoords
            L23_3 = L2_3
            L24_3 = L20_3
            L25_3 = L21_3
            L26_3 = L12_3
            L22_3(L23_3, L24_3, L25_3, L26_3)
          end
          L20_3 = IsDisabledControlPressed
          L21_3 = 1
          L22_3 = 34
          L20_3 = L20_3(L21_3, L22_3)
          if L20_3 then
            L20_3 = L15_3.x
            L21_3 = L19_3.x
            L21_3 = 0.01 * L21_3
            L20_3 = L20_3 + L21_3
            L21_3 = L15_3.y
            L22_3 = L19_3.y
            L22_3 = 0.01 * L22_3
            L21_3 = L21_3 + L22_3
            L22_3 = SetEntityCoords
            L23_3 = L2_3
            L24_3 = L20_3
            L25_3 = L21_3
            L26_3 = L12_3
            L22_3(L23_3, L24_3, L25_3, L26_3)
          end
          L20_3 = IsDisabledControlPressed
          L21_3 = 1
          L22_3 = 35
          L20_3 = L20_3(L21_3, L22_3)
          if L20_3 then
            L20_3 = L15_3.x
            L21_3 = L19_3.x
            L21_3 = 0.01 * L21_3
            L20_3 = L20_3 - L21_3
            L21_3 = L15_3.y
            L22_3 = L19_3.y
            L22_3 = 0.01 * L22_3
            L21_3 = L21_3 - L22_3
            L22_3 = SetEntityCoords
            L23_3 = L2_3
            L24_3 = L20_3
            L25_3 = L21_3
            L26_3 = L12_3
            L22_3(L23_3, L24_3, L25_3, L26_3)
          end
          L20_3 = IsControlPressed
          L21_3 = 0
          L22_3 = 172
          L20_3 = L20_3(L21_3, L22_3)
          if L20_3 then
            L20_3 = SetEntityCoords
            L21_3 = L2_3
            L22_3 = L7_3.x
            L23_3 = L7_3.y
            L24_3 = L12_3 + 0.01
            L20_3(L21_3, L22_3, L23_3, L24_3)
          end
          L20_3 = IsControlPressed
          L21_3 = 0
          L22_3 = 173
          L20_3 = L20_3(L21_3, L22_3)
          if L20_3 then
            L20_3 = SetEntityCoords
            L21_3 = L2_3
            L22_3 = L7_3.x
            L23_3 = L7_3.y
            L24_3 = L12_3 - 0.01
            L20_3(L21_3, L22_3, L23_3, L24_3)
          end
          L20_3 = L15_3.x
          L21_3 = L14_3.x
          L20_3 = L20_3 - L21_3
          L21_3 = L15_3.y
          L22_3 = L14_3.y
          L21_3 = L21_3 - L22_3
          L22_3 = math
          L22_3 = L22_3.deg
          L23_3 = math
          L23_3 = L23_3.atan2
          L24_3 = L21_3
          L25_3 = L20_3
          L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3 = L23_3(L24_3, L25_3)
          L22_3 = L22_3(L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
          L23_3 = SetEntityHeading
          L24_3 = L13_3
          L25_3 = L22_3 - 90.0
          L23_3(L24_3, L25_3)
          L23_3 = GetEntityCoords
          L24_3 = L2_3
          L23_3 = L23_3(L24_3)
          L4_3 = L23_3
        else
          L12_3 = SetEntityCoords
          L13_3 = L2_3
          L14_3 = vector3
          L15_3 = L4_3.x
          L16_3 = L4_3.y
          L17_3 = L4_3.z
          L17_3 = L17_3 + 0.5
          L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3 = L14_3(L15_3, L16_3, L17_3)
          L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3)
          L12_3 = SetEntityHeading
          L13_3 = L2_3
          L14_3 = L5_2
          L12_3(L13_3, L14_3)
        end
        L12_3 = IsControlJustPressed
        L13_3 = 1
        L14_3 = 45
        L12_3 = L12_3(L13_3, L14_3)
        if L12_3 then
          L12_3 = OriginalMode
          L12_3 = not L12_3
          OriginalMode = L12_3
          L12_3 = L16_1
          L13_3 = "instructional_buttons"
          L12_3 = L12_3(L13_3)
          L0_3 = L12_3
        end
        L12_3 = IsControlJustPressed
        L13_3 = 0
        L14_3 = 38
        L12_3 = L12_3(L13_3, L14_3)
        if L12_3 and not L1_3 then
          L1_3 = true
          L12_3 = {}
          L13_3 = L7_3.x
          L14_3 = L7_3.y
          L15_3 = L7_3.z
          L12_3[1] = L13_3
          L12_3[2] = L14_3
          L12_3[3] = L15_3
          L4_2.position = L12_3
          L12_3 = L5_2
          L4_2.heading = L12_3
          L12_3 = L4_2.heading
          if L12_3 < 1.0 then
            L4_2.heading = 1.0
          end
          break
        end
      end
      L6_3 = Wait
      L7_3 = 1
      L6_3(L7_3)
    end
    L3_3 = L4_2.position
    if L3_3 then
      L3_3 = SetNuiFocus
      L4_3 = true
      L5_3 = true
      L3_3(L4_3, L5_3)
      L3_3 = A1_2
      L4_3 = {}
      L5_3 = L4_2
      L4_3.FinalInfo = L5_3
      L3_3(L4_3)
    else
      L3_3 = SetNuiFocus
      L4_3 = true
      L5_3 = true
      L3_3(L4_3, L5_3)
      L3_3 = A1_2
      L4_3 = {}
      L4_3.error = "Failed to place sticky pad"
      L3_3(L4_3)
    end
    L3_3 = DeleteEntity
    L4_3 = L2_3
    L3_3(L4_3)
    L3_3 = HideRobberyCreatorPrompt
    L3_3()
    L3_3 = TabletEmote
    L3_3()
  end
  L6_2(L7_2)
end
L17_1(L18_1, L19_1)
L17_1 = RegisterNetEvent
L18_1 = "Pug:client:SpawnBankTruck"
function L19_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = A0_2.coords
  L3_2 = A0_2.heading
  L3_2 = L3_2 + 0.0
  L4_2 = ClearAreaOfVehicles
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L8_2 = 15.0
  L9_2 = false
  L10_2 = false
  L11_2 = false
  L12_2 = false
  L13_2 = false
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L4_2 = GetHashKey
  L5_2 = "stockade"
  L4_2 = L4_2(L5_2)
  L5_2 = RequestModel
  L6_2 = L4_2
  L5_2(L6_2)
  while true do
    L5_2 = HasModelLoaded
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      break
    end
    L5_2 = Wait
    L6_2 = 1
    L5_2(L6_2)
  end
  L5_2 = 7000
  L6_2 = 0
  L7_2 = nil
  while true do
    L8_2 = DoesEntityExist
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if not (not L8_2 and L5_2 > L6_2) then
      break
    end
    L8_2 = CreateVehicle
    L9_2 = L4_2
    L10_2 = L2_2.x
    L11_2 = L2_2.y
    L12_2 = L2_2.z
    L13_2 = L3_2
    L14_2 = true
    L15_2 = false
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L7_2 = L8_2
    L8_2 = Wait
    L9_2 = 100
    L8_2(L9_2)
    L6_2 = L6_2 + 100
  end
  L2_1 = L7_2
  L8_2 = DoesEntityExist
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = PrintDebug
    L9_2 = "Bank truck failed to spawn."
    L8_2(L9_2)
    return
  end
  L8_2 = SetEntityAsMissionEntity
  L9_2 = L7_2
  L10_2 = true
  L11_2 = true
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = SetVehicleOnGroundProperly
  L9_2 = L7_2
  L8_2(L9_2)
  L8_2 = SetVehicleDoorsLocked
  L9_2 = L7_2
  L10_2 = 2
  L8_2(L9_2, L10_2)
  L8_2 = GetHashKey
  L9_2 = "s_m_m_armoured_01"
  L8_2 = L8_2(L9_2)
  L9_2 = RequestModel
  L10_2 = L8_2
  L9_2(L10_2)
  while true do
    L9_2 = HasModelLoaded
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      break
    end
    L9_2 = Wait
    L10_2 = 1
    L9_2(L10_2)
  end
  L9_2 = nil
  L6_2 = 0
  while true do
    L10_2 = DoesEntityExist
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if not (not L10_2 and L5_2 > L6_2) then
      break
    end
    L10_2 = CreatePedInsideVehicle
    L11_2 = L7_2
    L12_2 = 4
    L13_2 = L8_2
    L14_2 = -1
    L15_2 = true
    L16_2 = false
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L9_2 = L10_2
    L10_2 = Wait
    L11_2 = 100
    L10_2(L11_2)
    L6_2 = L6_2 + 100
  end
  L10_2 = DoesEntityExist
  L11_2 = L9_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = PrintDebug
    L11_2 = "Driver failed to spawn."
    L10_2(L11_2)
    L10_2 = DeleteEntity
    L11_2 = L7_2
    L10_2(L11_2)
    return
  end
  L10_2 = nil
  L6_2 = 0
  while true do
    L11_2 = DoesEntityExist
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    if not (not L11_2 and L5_2 > L6_2) then
      break
    end
    L11_2 = CreatePedInsideVehicle
    L12_2 = L7_2
    L13_2 = 4
    L14_2 = L8_2
    L15_2 = 0
    L16_2 = true
    L17_2 = false
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L10_2 = L11_2
    L11_2 = Wait
    L12_2 = 100
    L11_2(L12_2)
    L6_2 = L6_2 + 100
  end
  L11_2 = DoesEntityExist
  L12_2 = L10_2
  L11_2 = L11_2(L12_2)
  if not L11_2 then
    L11_2 = PrintDebug
    L12_2 = "Passenger failed to spawn."
    L11_2(L12_2)
    L11_2 = DeleteEntity
    L12_2 = L7_2
    L11_2(L12_2)
    L11_2 = DeleteEntity
    L12_2 = L9_2
    L11_2(L12_2)
    return
  end
  L11_2 = SetEntityAsMissionEntity
  L12_2 = L9_2
  L13_2 = true
  L14_2 = true
  L11_2(L12_2, L13_2, L14_2)
  L11_2 = SetEntityAsMissionEntity
  L12_2 = L10_2
  L13_2 = true
  L14_2 = true
  L11_2(L12_2, L13_2, L14_2)
  L11_2 = A0_2
  if L11_2 then
    L12_2 = TaskVehicleDriveWander
    L13_2 = L9_2
    L14_2 = L7_2
    L15_2 = 80.0
    L16_2 = 443
    L12_2(L13_2, L14_2, L15_2, L16_2)
  else
    L12_2 = PrintDebug
    L13_2 = "No destination provided."
    L12_2(L13_2)
  end
  if A1_2 then
    L12_2 = print
    L13_2 = L0_1.createBlipForAllPlayers
    L14_2 = "AllBankTruckData.createBlipForAllPlayers"
    L12_2(L13_2, L14_2)
    L12_2 = L0_1.createBlipForAllPlayers
    if L12_2 then
      L12_2 = TriggerServerEvent
      L13_2 = "Pug:server:CreateBankTruckBlipForEveryone"
      L14_2 = L2_2
      L12_2(L13_2, L14_2)
    else
      L12_2 = AddBlipForEntity
      L13_2 = L7_2
      L12_2 = L12_2(L13_2)
      BankTruckBlip = L12_2
      L12_2 = SetBlipSprite
      L13_2 = BankTruckBlip
      L14_2 = 67
      L12_2(L13_2, L14_2)
      L12_2 = SetBlipColour
      L13_2 = BankTruckBlip
      L14_2 = 5
      L12_2(L13_2, L14_2)
      L12_2 = SetBlipScale
      L13_2 = BankTruckBlip
      L14_2 = 1.0
      L12_2(L13_2, L14_2)
      L12_2 = BeginTextCommandSetBlipName
      L13_2 = "STRING"
      L12_2(L13_2)
      L12_2 = AddTextComponentString
      L13_2 = "Bank Truck"
      L12_2(L13_2)
      L12_2 = EndTextCommandSetBlipName
      L13_2 = BankTruckBlip
      L12_2(L13_2)
    end
  end
  L12_2 = SetModelAsNoLongerNeeded
  L13_2 = L4_2
  L12_2(L13_2)
  L12_2 = SetModelAsNoLongerNeeded
  L13_2 = L8_2
  L12_2(L13_2)
  if A1_2 then
    L12_2 = CreateThread
    function L13_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      while true do
        L1_3 = Wait
        L2_3 = 100
        L1_3(L2_3)
        L1_3 = L2_1
        if L1_3 then
          L1_3 = DoesEntityExist
          L2_3 = L2_1
          L1_3 = L1_3(L2_3)
          if L1_3 then
            L1_3 = GetEntityCoords
            L2_3 = L0_3
            L1_3 = L1_3(L2_3)
            L2_3 = GetEntityCoords
            L3_3 = L2_1
            L2_3 = L2_3(L3_3)
            L3_3 = L1_3 - L2_3
            L3_3 = #L3_3
            if L3_3 < 50.0 then
              break
            end
            L4_3 = DoesEntityExist
            L5_3 = L2_1
            L4_3 = L4_3(L5_3)
            if L4_3 then
              goto lbl_73
            end
            L4_3 = L2_1
            if L4_3 then
              L4_3 = DoesBlipExist
              L5_3 = BankTruckBlip
              L4_3 = L4_3(L5_3)
              if L4_3 then
                L4_3 = RemoveBlip
                L5_3 = BankTruckBlip
                L4_3(L5_3)
              end
              L4_3 = Notify
              L5_3 = Config
              L5_3 = L5_3.LangT
              L5_3 = L5_3.BankTruckFinishedRoute
              L6_3 = "error"
              L4_3(L5_3, L6_3)
              L4_3 = TriggerServerEvent
              L5_3 = "Pug:Server:SpawnRandomBankTruck"
              L4_3(L5_3)
            end
            break
          else
            L1_3 = L2_1
            if L1_3 then
              L1_3 = DoesBlipExist
              L2_3 = BankTruckBlip
              L1_3 = L1_3(L2_3)
              if L1_3 then
                L1_3 = RemoveBlip
                L2_3 = BankTruckBlip
                L1_3(L2_3)
              end
              L1_3 = Notify
              L2_3 = Config
              L2_3 = L2_3.LangT
              L2_3 = L2_3.BankTruckFinishedRoute
              L3_3 = "error"
              L1_3(L2_3, L3_3)
              L1_3 = TriggerServerEvent
              L2_3 = "Pug:Server:SpawnRandomBankTruck"
              L1_3(L2_3)
            end
            break
          end
        end
        ::lbl_73::
      end
    end
    L12_2(L13_2)
  end
end
L17_1(L18_1, L19_1)
L17_1 = RegisterNetEvent
L18_1 = "Pug:client:CreateBankTruckBlipForEveryone"
function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = nil
  L2_2 = vector3
  L3_2 = A0_2.x
  L4_2 = A0_2.y
  L5_2 = A0_2.z
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = GetGamePool
  L4_2 = "CVehicle"
  L3_2 = L3_2(L4_2)
  L4_2 = 15.0
  L5_2 = pairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = GetEntityCoords
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    L12_2 = L2_2 - L11_2
    L12_2 = #L12_2
    if L4_2 > L12_2 then
      L13_2 = GetEntityModel
      L14_2 = L10_2
      L13_2 = L13_2(L14_2)
      L14_2 = GetHashKey
      L15_2 = "stockade"
      L14_2 = L14_2(L15_2)
      if L13_2 == L14_2 then
        L1_2 = L10_2
      end
    end
  end
  if L1_2 then
    L5_2 = AddBlipForEntity
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    BankTruckBlip = L5_2
    L5_2 = SetBlipSprite
    L6_2 = BankTruckBlip
    L7_2 = 67
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipColour
    L6_2 = BankTruckBlip
    L7_2 = 5
    L5_2(L6_2, L7_2)
    L5_2 = SetBlipScale
    L6_2 = BankTruckBlip
    L7_2 = 1.0
    L5_2(L6_2, L7_2)
    L5_2 = BeginTextCommandSetBlipName
    L6_2 = "STRING"
    L5_2(L6_2)
    L5_2 = AddTextComponentString
    L6_2 = "Bank Truck"
    L5_2(L6_2)
    L5_2 = EndTextCommandSetBlipName
    L6_2 = BankTruckBlip
    L5_2(L6_2)
  end
end
L17_1(L18_1, L19_1)
L17_1 = RegisterNetEvent
L18_1 = "Pug:client:SomeoneHitBankTruck"
function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = A0_2
  L2_2 = DoesEntityExist
  L3_2 = L2_1
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = L2_1
    if not L2_2 then
      goto lbl_36
    end
  end
  L2_2 = DoesBlipExist
  L3_2 = BankTruckBlip
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = RemoveBlip
    L3_2 = BankTruckBlip
    L2_2(L3_2)
  end
  L2_2 = false
  L2_1 = L2_2
  L2_2 = PlayerId
  L2_2 = L2_2()
  L3_2 = tonumber
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L4_2 = GetPlayerServerId
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if L3_2 ~= L4_2 then
    L3_2 = Notify
    L4_2 = Config
    L4_2 = L4_2.LangT
    L4_2 = L4_2.BankTruckHitByAnother
    L5_2 = "error"
    L3_2(L4_2, L5_2)
  end
  ::lbl_36::
end
L17_1(L18_1, L19_1)
function L17_1()
  local L0_2, L1_2, L2_2
  L0_2 = L8_1
  L0_2()
  L0_2 = nil
  L4_1 = L0_2
  L0_2 = DoesEntityExist
  L1_2 = BankTruckHackProp
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = DeleteEntity
    L1_2 = BankTruckHackProp
    L0_2(L1_2)
  end
  L0_2 = L3_1
  if L0_2 then
    L0_2 = false
    L3_1 = L0_2
    L0_2 = Wait
    L1_2 = 1100
    L0_2(L1_2)
  end
  L0_2 = Config
  L0_2 = L0_2.Target
  if "ox_target" == L0_2 then
    L0_2 = exports
    L0_2 = L0_2.ox_target
    L1_2 = L0_2
    L0_2 = L0_2.removeZone
    L2_2 = "bankTruckTarget"
    L0_2(L1_2, L2_2)
  else
    L0_2 = exports
    L1_2 = Config
    L1_2 = L1_2.Target
    L0_2 = L0_2[L1_2]
    L1_2 = L0_2
    L0_2 = L0_2.RemoveZone
    L2_2 = "bankTruckTarget"
    L0_2(L1_2, L2_2)
  end
end
RemoveBankTruckTarget = L17_1
L17_1 = RegisterNetEvent
L18_1 = "Pug:client:UpdateBankTruckData"
function L19_1(A0_2)
  local L1_2, L2_2
  L1_2 = json
  L1_2 = L1_2.decode
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L0_1 = L1_2
  L1_2 = L0_1.bankTruckLootCooldown
  if L1_2 then
    L1_2 = L0_1.bankTruckLootCooldown
    if not (L1_2 < 1) then
      goto lbl_13
    end
  end
  L0_1.bankTruckLootCooldown = 1
  ::lbl_13::
  L1_2 = DeleteAllBankTruckProps
  L1_2()
  L1_2 = L0_1.lockBankTruck
  if L1_2 then
    L1_2 = true
    L1_1 = L1_2
  else
    L1_2 = false
    L1_1 = L1_2
  end
  L1_2 = RemoveBankTruckTarget
  L1_2()
  L1_2 = L0_1.initiatingStartingPoint
  if L1_2 then
    L1_2 = L0_1.initiatingStartingPoint
    L1_2 = L1_2.pedCoords
    if nil ~= L1_2 then
      L1_2 = CreateBankTruckTarget
      L1_2()
    end
  end
end
L17_1(L18_1, L19_1)
L17_1 = RegisterNetEvent
L18_1 = "Pug:client:ResetBankTruckPropSetup"
function L19_1(A0_2)
  local L1_2
  L1_2 = RemoveBankTruckTarget
  L1_2()
  L1_2 = L0_1.initiatingStartingPoint
  L1_2 = L1_2.pedCoords
  if nil ~= L1_2 then
    L1_2 = CreateBankTruckTarget
    L1_2()
  end
end
L17_1(L18_1, L19_1)
function L17_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = L0_1.initiatingStartingPoint
  L1_2 = L0_2.propName
  L2_2 = L0_2.propHeading
  L2_2 = L2_2 + 0.0
  L3_2 = vector3
  L4_2 = L0_2.position
  L4_2 = L4_2[1]
  L5_2 = L0_2.position
  L5_2 = L5_2[2]
  L6_2 = L0_2.position
  L6_2 = L6_2[3]
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L1_2 and "" ~= L1_2 then
    L4_2 = L11_1
    L5_2 = L1_2
    L6_2 = L3_2
    L7_2 = L2_2
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = L0_1.initiatingStartingPoint
  L4_2 = L4_2.text
  if "" == L4_2 or " " == L4_2 then
    L4_2 = "Begin Bank Truck Robbery"
  end
  L5_2 = nil
  L6_2 = L0_1.initiatingStartingPoint
  L6_2 = L6_2.position
  if "tr_prop_tr_elecbox_01a" == L1_2 then
    L7_2 = L6_2[3]
    L7_2 = L7_2 + 1
    L6_2[3] = L7_2
  end
  L7_2 = Config
  L7_2 = L7_2.CustomZAxisTargetsOnProps
  L7_2 = L7_2[L1_2]
  if L7_2 then
    L7_2 = Config
    L7_2 = L7_2.CustomZAxisTargetsOnProps
    L7_2 = L7_2[L1_2]
    L7_2 = L7_2.Xoffset
    L8_2 = Config
    L8_2 = L8_2.CustomZAxisTargetsOnProps
    L8_2 = L8_2[L1_2]
    L8_2 = L8_2.Yoffset
    L9_2 = Config
    L9_2 = L9_2.CustomZAxisTargetsOnProps
    L9_2 = L9_2[L1_2]
    L9_2 = L9_2.zoffset
    L10_2 = math
    L10_2 = L10_2.rad
    L11_2 = L2_2
    L10_2 = L10_2(L11_2)
    L11_2 = math
    L11_2 = L11_2.cos
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    L11_2 = L7_2 * L11_2
    L12_2 = math
    L12_2 = L12_2.sin
    L13_2 = L10_2
    L12_2 = L12_2(L13_2)
    L12_2 = L8_2 * L12_2
    L11_2 = L11_2 - L12_2
    L12_2 = math
    L12_2 = L12_2.sin
    L13_2 = L10_2
    L12_2 = L12_2(L13_2)
    L12_2 = L7_2 * L12_2
    L13_2 = math
    L13_2 = L13_2.cos
    L14_2 = L10_2
    L13_2 = L13_2(L14_2)
    L13_2 = L8_2 * L13_2
    L12_2 = L12_2 + L13_2
    L13_2 = L6_2[1]
    L13_2 = L13_2 + L11_2
    L6_2[1] = L13_2
    L13_2 = L6_2[2]
    L13_2 = L13_2 + L12_2
    L6_2[2] = L13_2
    L13_2 = L6_2[3]
    L13_2 = L13_2 + L9_2
    L6_2[3] = L13_2
  end
  L7_2 = GetResourceState
  L8_2 = "RevoInteract"
  L7_2 = L7_2(L8_2)
  if "started" ~= L7_2 then
    L7_2 = Config
    L7_2 = L7_2.Target
    if L7_2 then
      L7_2 = Config
      L7_2 = L7_2.DrawTextInsteadOfTarget
      if not L7_2 then
        goto lbl_117
      end
    end
  end
  L7_2 = CreateThread
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    L0_3 = false
    L1_3 = true
    L3_1 = L1_3
    while true do
      L1_3 = L3_1
      if not L1_3 then
        break
      end
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = vector3
      L4_3 = L6_2
      L4_3 = L4_3[1]
      L5_3 = L6_2
      L5_3 = L5_3[2]
      L6_3 = L6_2
      L6_3 = L6_3[3]
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L3_3 = L2_3 - L3_3
      L3_3 = #L3_3
      L4_3 = 1.5
      if L3_3 <= L4_3 then
        if not L0_3 then
          L4_3 = GetResourceState
          L5_3 = "RevoInteract"
          L4_3 = L4_3(L5_3)
          if "started" == L4_3 then
            L4_3 = exports
            L4_3 = L4_3.RevoInteract
            L5_3 = L4_3
            L4_3 = L4_3.OpenHelp
            L6_3 = {}
            L6_3.ID = "bankTruckTarget"
            L7_3 = L4_2
            L6_3.Text = L7_3
            L6_3.Key = "[E]"
            L4_3(L5_3, L6_3)
          else
            L4_3 = DrawTextOption
            L5_3 = "[E] "
            L6_3 = L4_2
            L5_3 = L5_3 .. L6_3
            L4_3(L5_3)
          end
          L0_3 = true
        end
        L4_3 = IsControlJustPressed
        L5_3 = 0
        L6_3 = 38
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = true
          L5_3 = "none"
          L6_3 = "none"
          L7_3 = Config
          L7_3 = L7_3.FrameworkFunctions
          L7_3 = L7_3.TriggerCallback
          L8_3 = "Pug:serverCB:getPoliceCount"
          function L9_3(A0_4)
            local L1_4, L2_4, L3_4, L4_4, L5_4
            L1_4 = GetBankTruckRequiredPolice
            L1_4 = L1_4()
            if A0_4 >= L1_4 then
              L2_4 = true
              L5_3 = L2_4
            else
              L2_4 = false
              L5_3 = L2_4
              L2_4 = Notify
              L3_4 = Config
              L3_4 = L3_4.T
              L4_4 = "PoliceNotOnlineRequired"
              L5_4 = L1_4
              L3_4 = L3_4(L4_4, L5_4)
              L4_4 = "error"
              L2_4(L3_4, L4_4)
            end
          end
          L7_3(L8_3, L9_3)
          while "none" == L5_3 do
            L7_3 = Wait
            L8_3 = 50
            L7_3(L8_3)
          end
          if not L5_3 then
            L4_3 = false
          end
          if L4_3 then
            L7_3 = Config
            L7_3 = L7_3.FrameworkFunctions
            L7_3 = L7_3.TriggerCallback
            L8_3 = "Pug:server:IsBankTruckOnCooldown"
            function L9_3(A0_4, A1_4)
              local L2_4, L3_4, L4_4, L5_4, L6_4
              if A0_4 then
                L2_4 = false
                L6_3 = L2_4
                L2_4 = Notify
                L3_4 = Config
                L3_4 = L3_4.T
                L4_4 = "BankTruckCooldownMinutes"
                L5_4 = math
                L5_4 = L5_4.ceil
                L6_4 = A1_4 / 60
                L5_4, L6_4 = L5_4(L6_4)
                L3_4 = L3_4(L4_4, L5_4, L6_4)
                L4_4 = "error"
                L2_4(L3_4, L4_4)
              else
                L2_4 = true
                L6_3 = L2_4
              end
            end
            L7_3(L8_3, L9_3)
            while "none" == L6_3 do
              L7_3 = Wait
              L8_3 = 50
              L7_3(L8_3)
            end
            if not L6_3 then
              L4_3 = false
            end
            if L4_3 then
              L7_3 = ipairs
              L8_3 = L0_1.requiredItem
              L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3)
              for L11_3, L12_3 in L7_3, L8_3, L9_3, L10_3 do
                L13_3 = HasItem
                L14_3 = L12_3.name
                L15_3 = L12_3.quantityNeeded
                L13_3 = L13_3(L14_3, L15_3)
                if not L13_3 then
                  L13_3 = Notify
                  L14_3 = Config
                  L14_3 = L14_3.T
                  L15_3 = "MissingRequiredItemNamed"
                  L16_3 = L12_3.name
                  L14_3 = L14_3(L15_3, L16_3)
                  L15_3 = "error"
                  L13_3(L14_3, L15_3)
                  L4_3 = false
                end
              end
              if L4_3 then
                L7_3 = vector3
                L8_3 = L0_2.pedCoords
                L8_3 = L8_3[1]
                L9_3 = L0_2.pedCoords
                L9_3 = L9_3[2]
                L10_3 = L0_2.pedCoords
                L10_3 = L10_3[3]
                L7_3 = L7_3(L8_3, L9_3, L10_3)
                L8_3 = L0_2.animation
                L9_3 = L0_2.miniGame
                L10_3 = nil
                L11_3 = {}
                L11_3.animation = L8_3
                L12_3 = L1_2
                L11_3.propName = L12_3
                if L8_3 and "" ~= L8_3 then
                  L12_3 = Config
                  L12_3 = L12_3.Animations
                  L13_3 = tonumber
                  L14_3 = L8_3
                  L13_3 = L13_3(L14_3)
                  L12_3 = L12_3[L13_3]
                  L13_3 = Config
                  L13_3 = L13_3.RobberyAnimations
                  L13_3 = L13_3[L8_3]
                  if L13_3 then
                    L13_3 = Config
                    L13_3 = L13_3.RobberyAnimations
                    L12_3 = L13_3[L8_3]
                    L13_3 = L1_2
                    L14_3 = type
                    L15_3 = L13_3
                    L14_3 = L14_3(L15_3)
                    if "string" == L14_3 then
                      L14_3 = GetHashKey
                      L15_3 = L1_2
                      L14_3 = L14_3(L15_3)
                      L13_3 = L14_3
                    end
                    L14_3 = 1.5
                    L15_3 = GetClosestObjectOfType
                    L16_3 = GetEntityCoords
                    L17_3 = PlayerPedId
                    L17_3, L18_3, L19_3, L20_3, L21_3 = L17_3()
                    L16_3 = L16_3(L17_3, L18_3, L19_3, L20_3, L21_3)
                    L17_3 = L14_3
                    L18_3 = L13_3
                    L19_3 = 0
                    L20_3 = 0
                    L21_3 = 0
                    L15_3 = L15_3(L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
                    sceneObject = L15_3
                    L15_3 = sceneObject
                    if 0 ~= L15_3 then
                      L15_3 = {}
                      L16_3 = GetEntityCoords
                      L17_3 = sceneObject
                      L16_3 = L16_3(L17_3)
                      L15_3.Coords = L16_3
                      L16_3 = GetEntityRotation
                      L17_3 = sceneObject
                      L16_3 = L16_3(L17_3)
                      L15_3.Rotation = L16_3
                      L16_3 = L1_2
                      L15_3.PropName = L16_3
                      L15_3.RobberyName = "banktruck"
                      L16_3 = {}
                      L15_3.Stage = L16_3
                      L16_3 = sceneObject
                      L15_3.DataObject = L16_3
                      L15_3.Heist = "banktruck"
                      L16_3 = GetEntityHeading
                      L17_3 = sceneObject
                      L16_3 = L16_3(L17_3)
                      L15_3.Heading = L16_3
                      L10_3 = L15_3
                    end
                    L15_3 = L1_2
                    if "tr_prop_tr_elecbox_01a" == L15_3 then
                      L15_3 = TriggerServerEvent
                      L16_3 = "Pug:server:DeleteRobberiesEntity"
                      L17_3 = L10_3.Coords
                      L18_3 = L13_3
                      L19_3 = "banktruck"
                      L15_3(L16_3, L17_3, L18_3, L19_3)
                    end
                    L15_3 = Config
                    L15_3 = L15_3.RobberyAnimations
                    L15_3 = L15_3[L8_3]
                    L15_3 = L15_3.ReplaceProp
                    if L15_3 then
                      L15_3 = L1_2
                      if "tr_prop_tr_elecbox_01a" ~= L15_3 then
                        goto lbl_278
                      end
                    end
                    L15_3 = TriggerEvent
                    L16_3 = "Pug:client:DoRobberiesAnimation"
                    L17_3 = L8_3
                    L18_3 = PlayerPedId
                    L18_3 = L18_3()
                    L19_3 = false
                    L20_3 = L10_3
                    L21_3 = true
                    L15_3(L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
                    L15_3 = L1_2
                    if "xm_base_cia_server_01" ~= L15_3 then
                      L15_3 = L1_2
                      if "tr_prop_tr_elecbox_01a" ~= L15_3 then
                        L15_3 = Wait
                        L16_3 = 5000
                        L15_3(L16_3)
                      end
                    end
                    if "none" == L9_3 then
                      L15_3 = L1_2
                      if "xm_base_cia_server_01" ~= L15_3 then
                        goto lbl_245
                      end
                    end
                    L15_3 = L1_2
                    ::lbl_245::
                    if "tr_prop_tr_elecbox_01a" == L15_3 then
                      L15_3 = Wait
                      L16_3 = 3000
                      L15_3(L16_3)
                    end
                  else
                    L13_3 = Config
                    L13_3 = L13_3.Animations
                    L14_3 = tonumber
                    L15_3 = L8_3
                    L14_3 = L14_3(L15_3)
                    L12_3 = L13_3[L14_3]
                    L13_3 = L12_3.IsNetWorkedScene
                    if not L13_3 then
                      L13_3 = TriggerEvent
                      L14_3 = "Pug:client:DoRobberiesAnimation"
                      L15_3 = L8_3
                      L16_3 = PlayerPedId
                      L16_3 = L16_3()
                      L17_3 = false
                      L18_3 = L10_3
                      L19_3 = true
                      L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3)
                      L13_3 = Wait
                      L14_3 = 5000
                      L13_3(L14_3)
                      if "none" == L9_3 then
                        L13_3 = L1_2
                        if "xm_base_cia_server_01" ~= L13_3 then
                          L13_3 = Wait
                          L14_3 = 3000
                          L13_3(L14_3)
                        end
                      end
                    end
                  end
                end
                ::lbl_278::
                L12_3 = Config
                L12_3 = L12_3.FrameworkFunctions
                L12_3 = L12_3.TriggerCallback
                L13_3 = "Pug:server:IsBankTruckBeingInitiated"
                function L14_3(A0_4)
                  local L1_4, L2_4, L3_4, L4_4
                  if not A0_4 then
                    L1_4 = Config
                    L1_4 = L1_4.MiniGames
                    L2_4 = L9_3
                    L1_4 = L1_4[L2_4]
                    L1_4 = L1_4.Game
                    L1_4 = L1_4()
                    if L1_4 then
                      L2_4 = Notify
                      L3_4 = Config
                      L3_4 = L3_4.LangT
                      L3_4 = L3_4.Success
                      L4_4 = "success"
                      L2_4(L3_4, L4_4)
                      L2_4 = TriggerServerEvent
                      L3_4 = "Pug:Server:SpawnRandomBankTruck"
                      L2_4(L3_4)
                      L2_4 = L13_1
                      L3_4 = L11_3
                      L4_4 = L10_3
                      L2_4(L3_4, L4_4)
                      L2_4 = ClearPedTasks
                      L3_4 = PlayerPedId
                      L3_4, L4_4 = L3_4()
                      L2_4(L3_4, L4_4)
                    else
                      L2_4 = Notify
                      L3_4 = Config
                      L3_4 = L3_4.LangT
                      L3_4 = L3_4.Failed
                      L4_4 = "error"
                      L2_4(L3_4, L4_4)
                      L2_4 = L13_1
                      L3_4 = L11_3
                      L4_4 = L10_3
                      L2_4(L3_4, L4_4)
                      L2_4 = ClearPedTasks
                      L3_4 = PlayerPedId
                      L3_4, L4_4 = L3_4()
                      L2_4(L3_4, L4_4)
                    end
                  else
                    L1_4 = Notify
                    L2_4 = Config
                    L2_4 = L2_4.LangT
                    L2_4 = L2_4.BankTruckAlreadyLocated
                    L3_4 = "error"
                    L1_4(L2_4, L3_4)
                    L1_4 = L13_1
                    L2_4 = L11_3
                    L3_4 = L10_3
                    L1_4(L2_4, L3_4)
                    L1_4 = ClearPedTasks
                    L2_4 = PlayerPedId
                    L2_4, L3_4, L4_4 = L2_4()
                    L1_4(L2_4, L3_4, L4_4)
                  end
                end
                L12_3(L13_3, L14_3)
              end
            end
          end
          L7_3 = Wait
          L8_3 = 500
          L7_3(L8_3)
        end
        L4_3 = Wait
        L5_3 = 0
        L4_3(L5_3)
      else
        if L0_3 then
          L4_3 = GetResourceState
          L5_3 = "RevoInteract"
          L4_3 = L4_3(L5_3)
          if "started" == L4_3 then
            L4_3 = exports
            L4_3 = L4_3.RevoInteract
            L5_3 = L4_3
            L4_3 = L4_3.CloseHelp
            L6_3 = "bankTruckTarget"
            L4_3(L5_3, L6_3)
          else
            L4_3 = HideTextOption
            L4_3()
          end
          L0_3 = false
        end
        L4_3 = Wait
        L5_3 = 1000
        L4_3(L5_3)
      end
    end
  end
  L7_2(L8_2)
  goto lbl_146
  ::lbl_117::
  L7_2 = Config
  L7_2 = L7_2.Target
  if "ox_target" == L7_2 then
    L7_2 = {}
    L8_2 = {}
    L8_2.name = "StarBankTruckRObbery"
    L8_2.icon = "fas fa-truck-fast"
    L8_2.label = L4_2
    L8_2.distance = 1.5
    function L9_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
      L0_3 = "none"
      L1_3 = "none"
      L2_3 = Config
      L2_3 = L2_3.FrameworkFunctions
      L2_3 = L2_3.TriggerCallback
      L3_3 = "Pug:serverCB:getPoliceCount"
      function L4_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4, L5_4
        L1_4 = GetBankTruckRequiredPolice
        L1_4 = L1_4()
        if A0_4 >= L1_4 then
          L2_4 = true
          L0_3 = L2_4
        else
          L2_4 = false
          L0_3 = L2_4
          L2_4 = Notify
          L3_4 = Config
          L3_4 = L3_4.T
          L4_4 = "PoliceNotOnlineRequired"
          L5_4 = L1_4
          L3_4 = L3_4(L4_4, L5_4)
          L4_4 = "error"
          L2_4(L3_4, L4_4)
        end
      end
      L2_3(L3_3, L4_3)
      while "none" == L0_3 do
        L2_3 = Wait
        L3_3 = 50
        L2_3(L3_3)
      end
      if not L0_3 then
        return
      end
      L2_3 = Config
      L2_3 = L2_3.FrameworkFunctions
      L2_3 = L2_3.TriggerCallback
      L3_3 = "Pug:server:IsBankTruckOnCooldown"
      function L4_3(A0_4, A1_4)
        local L2_4, L3_4, L4_4, L5_4, L6_4
        if A0_4 then
          L2_4 = false
          L1_3 = L2_4
          L2_4 = Notify
          L3_4 = Config
          L3_4 = L3_4.T
          L4_4 = "BankTruckCooldownMinutes"
          L5_4 = math
          L5_4 = L5_4.ceil
          L6_4 = A1_4 / 60
          L5_4, L6_4 = L5_4(L6_4)
          L3_4 = L3_4(L4_4, L5_4, L6_4)
          L4_4 = "error"
          L2_4(L3_4, L4_4)
        else
          L2_4 = true
          L1_3 = L2_4
        end
      end
      L2_3(L3_3, L4_3)
      while "none" == L1_3 do
        L2_3 = Wait
        L3_3 = 50
        L2_3(L3_3)
      end
      if not L1_3 then
        return
      end
      L2_3 = ipairs
      L3_3 = L0_1.requiredItem
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = HasItem
        L9_3 = L7_3.name
        L10_3 = L7_3.quantityNeeded
        L8_3 = L8_3(L9_3, L10_3)
        if not L8_3 then
          L8_3 = Notify
          L9_3 = Config
          L9_3 = L9_3.T
          L10_3 = "MissingRequiredItemNamed"
          L11_3 = L7_3.name
          L9_3 = L9_3(L10_3, L11_3)
          L10_3 = "error"
          L8_3(L9_3, L10_3)
          return
        end
      end
      L2_3 = vector3
      L3_3 = L0_2.pedCoords
      L3_3 = L3_3[1]
      L4_3 = L0_2.pedCoords
      L4_3 = L4_3[2]
      L5_3 = L0_2.pedCoords
      L5_3 = L5_3[3]
      L2_3 = L2_3(L3_3, L4_3, L5_3)
      L3_3 = L0_2.animation
      L4_3 = L0_2.miniGame
      L5_3 = nil
      L6_3 = {}
      L6_3.animation = L3_3
      L7_3 = L1_2
      L6_3.propName = L7_3
      if L3_3 and "" ~= L3_3 then
        L7_3 = Config
        L7_3 = L7_3.Animations
        L8_3 = tonumber
        L9_3 = L3_3
        L8_3 = L8_3(L9_3)
        L7_3 = L7_3[L8_3]
        L8_3 = Config
        L8_3 = L8_3.RobberyAnimations
        L8_3 = L8_3[L3_3]
        if L8_3 then
          L8_3 = Config
          L8_3 = L8_3.RobberyAnimations
          L7_3 = L8_3[L3_3]
          L8_3 = L1_2
          L9_3 = type
          L10_3 = L8_3
          L9_3 = L9_3(L10_3)
          if "string" == L9_3 then
            L9_3 = GetHashKey
            L10_3 = L1_2
            L9_3 = L9_3(L10_3)
            L8_3 = L9_3
          end
          L9_3 = 1.5
          L10_3 = GetClosestObjectOfType
          L11_3 = GetEntityCoords
          L12_3 = PlayerPedId
          L12_3, L13_3, L14_3, L15_3, L16_3 = L12_3()
          L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3, L16_3)
          L12_3 = L9_3
          L13_3 = L8_3
          L14_3 = 0
          L15_3 = 0
          L16_3 = 0
          L10_3 = L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
          sceneObject = L10_3
          L10_3 = sceneObject
          if 0 ~= L10_3 then
            L10_3 = {}
            L11_3 = GetEntityCoords
            L12_3 = sceneObject
            L11_3 = L11_3(L12_3)
            L10_3.Coords = L11_3
            L11_3 = GetEntityRotation
            L12_3 = sceneObject
            L11_3 = L11_3(L12_3)
            L10_3.Rotation = L11_3
            L11_3 = L1_2
            L10_3.PropName = L11_3
            L10_3.RobberyName = "banktruck"
            L11_3 = {}
            L10_3.Stage = L11_3
            L11_3 = sceneObject
            L10_3.DataObject = L11_3
            L10_3.Heist = "banktruck"
            L11_3 = GetEntityHeading
            L12_3 = sceneObject
            L11_3 = L11_3(L12_3)
            L10_3.Heading = L11_3
            L5_3 = L10_3
          end
          L10_3 = L1_2
          if "tr_prop_tr_elecbox_01a" == L10_3 then
            L10_3 = TriggerServerEvent
            L11_3 = "Pug:server:DeleteRobberiesEntity"
            L12_3 = L5_3.Coords
            L13_3 = L8_3
            L14_3 = "banktruck"
            L10_3(L11_3, L12_3, L13_3, L14_3)
          end
          L10_3 = Config
          L10_3 = L10_3.RobberyAnimations
          L10_3 = L10_3[L3_3]
          L10_3 = L10_3.ReplaceProp
          if L10_3 then
            L10_3 = L1_2
            if "tr_prop_tr_elecbox_01a" ~= L10_3 then
              goto lbl_218
            end
          end
          L10_3 = TriggerEvent
          L11_3 = "Pug:client:DoRobberiesAnimation"
          L12_3 = L3_3
          L13_3 = PlayerPedId
          L13_3 = L13_3()
          L14_3 = false
          L15_3 = L5_3
          L16_3 = true
          L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
          L10_3 = L1_2
          if "xm_base_cia_server_01" ~= L10_3 then
            L10_3 = L1_2
            if "tr_prop_tr_elecbox_01a" ~= L10_3 then
              L10_3 = Wait
              L11_3 = 5000
              L10_3(L11_3)
            end
          end
          if "none" == L4_3 then
            L10_3 = L1_2
            if "xm_base_cia_server_01" ~= L10_3 then
              goto lbl_183
            end
          end
          L10_3 = L1_2
          ::lbl_183::
          if "tr_prop_tr_elecbox_01a" == L10_3 then
            L10_3 = Wait
            L11_3 = 3000
            L10_3(L11_3)
          end
        else
          L8_3 = Config
          L8_3 = L8_3.Animations
          L9_3 = tonumber
          L10_3 = L3_3
          L9_3 = L9_3(L10_3)
          L7_3 = L8_3[L9_3]
          if nil ~= L7_3 then
            L8_3 = L7_3.IsNetWorkedScene
            if not L8_3 then
              L8_3 = TriggerEvent
              L9_3 = "Pug:client:DoRobberiesAnimation"
              L10_3 = L3_3
              L11_3 = PlayerPedId
              L11_3 = L11_3()
              L12_3 = false
              L13_3 = L5_3
              L14_3 = true
              L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
              L8_3 = Wait
              L9_3 = 5000
              L8_3(L9_3)
              if "none" == L4_3 then
                L8_3 = L1_2
                if "xm_base_cia_server_01" ~= L8_3 then
                  L8_3 = Wait
                  L9_3 = 3000
                  L8_3(L9_3)
                end
              end
            end
          end
        end
      end
      ::lbl_218::
      L7_3 = Config
      L7_3 = L7_3.FrameworkFunctions
      L7_3 = L7_3.TriggerCallback
      L8_3 = "Pug:server:IsBankTruckBeingInitiated"
      function L9_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4
        if not A0_4 then
          L1_4 = Config
          L1_4 = L1_4.MiniGames
          L2_4 = L4_3
          L1_4 = L1_4[L2_4]
          L1_4 = L1_4.Game
          L1_4 = L1_4()
          if L1_4 then
            L2_4 = Notify
            L3_4 = Config
            L3_4 = L3_4.LangT
            L3_4 = L3_4.Success
            L4_4 = "success"
            L2_4(L3_4, L4_4)
            L2_4 = TriggerServerEvent
            L3_4 = "Pug:Server:SpawnRandomBankTruck"
            L2_4(L3_4)
            L2_4 = L13_1
            L3_4 = L6_3
            L4_4 = L5_3
            L2_4(L3_4, L4_4)
            L2_4 = ClearPedTasks
            L3_4 = PlayerPedId
            L3_4, L4_4 = L3_4()
            L2_4(L3_4, L4_4)
          else
            L2_4 = Notify
            L3_4 = Config
            L3_4 = L3_4.LangT
            L3_4 = L3_4.Failed
            L4_4 = "error"
            L2_4(L3_4, L4_4)
            L2_4 = L13_1
            L3_4 = L6_3
            L4_4 = L5_3
            L2_4(L3_4, L4_4)
            L2_4 = ClearPedTasks
            L3_4 = PlayerPedId
            L3_4, L4_4 = L3_4()
            L2_4(L3_4, L4_4)
          end
        else
          L1_4 = Notify
          L2_4 = Config
          L2_4 = L2_4.LangT
          L2_4 = L2_4.BankTruckAlreadyLocated
          L3_4 = "error"
          L1_4(L2_4, L3_4)
          L1_4 = L13_1
          L2_4 = L6_3
          L3_4 = L5_3
          L1_4(L2_4, L3_4)
          L1_4 = ClearPedTasks
          L2_4 = PlayerPedId
          L2_4, L3_4, L4_4 = L2_4()
          L1_4(L2_4, L3_4, L4_4)
        end
      end
      L7_3(L8_3, L9_3)
    end
    L8_2.onSelect = L9_2
    L7_2[1] = L8_2
    L5_2 = L7_2
  else
    L7_2 = {}
    L8_2 = {}
    L8_2.name = "StarBankTruckRObbery"
    L8_2.icon = "fas fa-truck-fast"
    L8_2.label = L4_2
    L8_2.distance = 1.5
    function L9_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
      L1_3 = "none"
      L2_3 = "none"
      L3_3 = Config
      L3_3 = L3_3.FrameworkFunctions
      L3_3 = L3_3.TriggerCallback
      L4_3 = "Pug:serverCB:getPoliceCount"
      function L5_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4, L5_4
        L1_4 = GetBankTruckRequiredPolice
        L1_4 = L1_4()
        if A0_4 >= L1_4 then
          L2_4 = true
          L1_3 = L2_4
        else
          L2_4 = false
          L1_3 = L2_4
          L2_4 = Notify
          L3_4 = Config
          L3_4 = L3_4.T
          L4_4 = "PoliceNotOnlineRequired"
          L5_4 = L1_4
          L3_4 = L3_4(L4_4, L5_4)
          L4_4 = "error"
          L2_4(L3_4, L4_4)
        end
      end
      L3_3(L4_3, L5_3)
      while "none" == L1_3 do
        L3_3 = Wait
        L4_3 = 50
        L3_3(L4_3)
      end
      if not L1_3 then
        return
      end
      L3_3 = Config
      L3_3 = L3_3.FrameworkFunctions
      L3_3 = L3_3.TriggerCallback
      L4_3 = "Pug:server:IsBankTruckOnCooldown"
      function L5_3(A0_4, A1_4)
        local L2_4, L3_4, L4_4, L5_4, L6_4
        if A0_4 then
          L2_4 = false
          L2_3 = L2_4
          L2_4 = Notify
          L3_4 = Config
          L3_4 = L3_4.T
          L4_4 = "BankTruckCooldownMinutes"
          L5_4 = math
          L5_4 = L5_4.ceil
          L6_4 = A1_4 / 60
          L5_4, L6_4 = L5_4(L6_4)
          L3_4 = L3_4(L4_4, L5_4, L6_4)
          L4_4 = "error"
          L2_4(L3_4, L4_4)
        else
          L2_4 = true
          L2_3 = L2_4
        end
      end
      L3_3(L4_3, L5_3)
      while "none" == L2_3 do
        L3_3 = Wait
        L4_3 = 50
        L3_3(L4_3)
      end
      if not L2_3 then
        return
      end
      L3_3 = ipairs
      L4_3 = L0_1.requiredItem
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L9_3 = HasItem
        L10_3 = L8_3.name
        L11_3 = L8_3.quantityNeeded
        L9_3 = L9_3(L10_3, L11_3)
        if not L9_3 then
          L9_3 = Notify
          L10_3 = Config
          L10_3 = L10_3.T
          L11_3 = "MissingRequiredItemNamed"
          L12_3 = L8_3.name
          L10_3 = L10_3(L11_3, L12_3)
          L11_3 = "error"
          L9_3(L10_3, L11_3)
          return
        end
      end
      L3_3 = vector3
      L4_3 = L0_2.pedCoords
      L4_3 = L4_3[1]
      L5_3 = L0_2.pedCoords
      L5_3 = L5_3[2]
      L6_3 = L0_2.pedCoords
      L6_3 = L6_3[3]
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L4_3 = L0_2.animation
      L5_3 = L0_2.miniGame
      L6_3 = nil
      L7_3 = {}
      L7_3.animation = L4_3
      L8_3 = L1_2
      L7_3.propName = L8_3
      if L4_3 and "" ~= L4_3 then
        L8_3 = Config
        L8_3 = L8_3.Animations
        L9_3 = tonumber
        L10_3 = L4_3
        L9_3 = L9_3(L10_3)
        L8_3 = L8_3[L9_3]
        L9_3 = Config
        L9_3 = L9_3.RobberyAnimations
        L9_3 = L9_3[L4_3]
        if L9_3 then
          L9_3 = Config
          L9_3 = L9_3.RobberyAnimations
          L8_3 = L9_3[L4_3]
          L9_3 = L1_2
          L10_3 = type
          L11_3 = L9_3
          L10_3 = L10_3(L11_3)
          if "string" == L10_3 then
            L10_3 = GetHashKey
            L11_3 = L1_2
            L10_3 = L10_3(L11_3)
            L9_3 = L10_3
          end
          L10_3 = 1.5
          L11_3 = GetClosestObjectOfType
          L12_3 = GetEntityCoords
          L13_3 = PlayerPedId
          L13_3, L14_3, L15_3, L16_3, L17_3 = L13_3()
          L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3)
          L13_3 = L10_3
          L14_3 = L9_3
          L15_3 = 0
          L16_3 = 0
          L17_3 = 0
          L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
          sceneObject = L11_3
          L11_3 = sceneObject
          if 0 ~= L11_3 then
            L11_3 = {}
            L12_3 = GetEntityCoords
            L13_3 = sceneObject
            L12_3 = L12_3(L13_3)
            L11_3.Coords = L12_3
            L12_3 = GetEntityRotation
            L13_3 = sceneObject
            L12_3 = L12_3(L13_3)
            L11_3.Rotation = L12_3
            L12_3 = L1_2
            L11_3.PropName = L12_3
            L11_3.RobberyName = "banktruck"
            L12_3 = {}
            L11_3.Stage = L12_3
            L12_3 = sceneObject
            L11_3.DataObject = L12_3
            L11_3.Heist = "banktruck"
            L12_3 = GetEntityHeading
            L13_3 = sceneObject
            L12_3 = L12_3(L13_3)
            L11_3.Heading = L12_3
            L6_3 = L11_3
          end
          L11_3 = L1_2
          if "tr_prop_tr_elecbox_01a" == L11_3 then
            L11_3 = TriggerServerEvent
            L12_3 = "Pug:server:DeleteRobberiesEntity"
            L13_3 = L6_3.Coords
            L14_3 = L9_3
            L15_3 = "banktruck"
            L11_3(L12_3, L13_3, L14_3, L15_3)
          end
          L11_3 = Config
          L11_3 = L11_3.RobberyAnimations
          L11_3 = L11_3[L4_3]
          L11_3 = L11_3.ReplaceProp
          if L11_3 then
            L11_3 = L1_2
            if "tr_prop_tr_elecbox_01a" ~= L11_3 then
              goto lbl_216
            end
          end
          L11_3 = TriggerEvent
          L12_3 = "Pug:client:DoRobberiesAnimation"
          L13_3 = L4_3
          L14_3 = PlayerPedId
          L14_3 = L14_3()
          L15_3 = false
          L16_3 = L6_3
          L17_3 = true
          L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
          L11_3 = L1_2
          if "xm_base_cia_server_01" ~= L11_3 then
            L11_3 = L1_2
            if "tr_prop_tr_elecbox_01a" ~= L11_3 then
              L11_3 = Wait
              L12_3 = 5000
              L11_3(L12_3)
            end
          end
          if "none" == L5_3 then
            L11_3 = L1_2
            if "xm_base_cia_server_01" ~= L11_3 then
              goto lbl_183
            end
          end
          L11_3 = L1_2
          ::lbl_183::
          if "tr_prop_tr_elecbox_01a" == L11_3 then
            L11_3 = Wait
            L12_3 = 3000
            L11_3(L12_3)
          end
        else
          L9_3 = Config
          L9_3 = L9_3.Animations
          L10_3 = tonumber
          L11_3 = L4_3
          L10_3 = L10_3(L11_3)
          L8_3 = L9_3[L10_3]
          L9_3 = L8_3.IsNetWorkedScene
          if not L9_3 then
            L9_3 = TriggerEvent
            L10_3 = "Pug:client:DoRobberiesAnimation"
            L11_3 = L4_3
            L12_3 = PlayerPedId
            L12_3 = L12_3()
            L13_3 = false
            L14_3 = L6_3
            L15_3 = true
            L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
            L9_3 = Wait
            L10_3 = 5000
            L9_3(L10_3)
            if "none" == L5_3 then
              L9_3 = L1_2
              if "xm_base_cia_server_01" ~= L9_3 then
                L9_3 = Wait
                L10_3 = 3000
                L9_3(L10_3)
              end
            end
          end
        end
      end
      ::lbl_216::
      L8_3 = Config
      L8_3 = L8_3.FrameworkFunctions
      L8_3 = L8_3.TriggerCallback
      L9_3 = "Pug:server:IsBankTruckBeingInitiated"
      function L10_3(A0_4)
        local L1_4, L2_4, L3_4, L4_4
        if not A0_4 then
          L1_4 = Config
          L1_4 = L1_4.MiniGames
          L2_4 = L5_3
          L1_4 = L1_4[L2_4]
          L1_4 = L1_4.Game
          L1_4 = L1_4()
          if L1_4 then
            L2_4 = Notify
            L3_4 = Config
            L3_4 = L3_4.LangT
            L3_4 = L3_4.Success
            L4_4 = "success"
            L2_4(L3_4, L4_4)
            L2_4 = TriggerServerEvent
            L3_4 = "Pug:Server:SpawnRandomBankTruck"
            L2_4(L3_4)
            L2_4 = L13_1
            L3_4 = L7_3
            L4_4 = L6_3
            L2_4(L3_4, L4_4)
            L2_4 = ClearPedTasks
            L3_4 = PlayerPedId
            L3_4, L4_4 = L3_4()
            L2_4(L3_4, L4_4)
          else
            L2_4 = Notify
            L3_4 = Config
            L3_4 = L3_4.LangT
            L3_4 = L3_4.Failed
            L4_4 = "error"
            L2_4(L3_4, L4_4)
            L2_4 = L13_1
            L3_4 = L7_3
            L4_4 = L6_3
            L2_4(L3_4, L4_4)
            L2_4 = ClearPedTasks
            L3_4 = PlayerPedId
            L3_4, L4_4 = L3_4()
            L2_4(L3_4, L4_4)
          end
        else
          L1_4 = Notify
          L2_4 = Config
          L2_4 = L2_4.LangT
          L2_4 = L2_4.BankTruckAlreadyLocated
          L3_4 = "error"
          L1_4(L2_4, L3_4)
          L1_4 = L13_1
          L2_4 = L7_3
          L3_4 = L6_3
          L1_4(L2_4, L3_4)
          L1_4 = ClearPedTasks
          L2_4 = PlayerPedId
          L2_4, L3_4, L4_4 = L2_4()
          L1_4(L2_4, L3_4, L4_4)
        end
      end
      L8_3(L9_3, L10_3)
    end
    L8_2.action = L9_2
    L7_2[1] = L8_2
    L5_2 = L7_2
  end
  ::lbl_146::
  L7_2 = GetResourceState
  L8_2 = "RevoInteract"
  L7_2 = L7_2(L8_2)
  if "started" ~= L7_2 then
    L7_2 = Config
    L7_2 = L7_2.Target
    if L7_2 then
      L7_2 = Config
      L7_2 = L7_2.DrawTextInsteadOfTarget
      if not L7_2 then
        L7_2 = Config
        L7_2 = L7_2.Target
        if "ox_target" == L7_2 then
          L7_2 = exports
          L7_2 = L7_2.ox_target
          L8_2 = L7_2
          L7_2 = L7_2.addSphereZone
          L9_2 = {}
          L9_2.name = "bankTruckTarget"
          L10_2 = vector3
          L11_2 = L6_2[1]
          L12_2 = L6_2[2]
          L13_2 = L6_2[3]
          L10_2 = L10_2(L11_2, L12_2, L13_2)
          L9_2.coords = L10_2
          L9_2.radius = 0.5
          L10_2 = Config
          L10_2 = L10_2.Debug
          L9_2.debug = L10_2
          L9_2.options = L5_2
          L7_2(L8_2, L9_2)
        else
          L7_2 = exports
          L8_2 = Config
          L8_2 = L8_2.Target
          L7_2 = L7_2[L8_2]
          L8_2 = L7_2
          L7_2 = L7_2.AddCircleZone
          L9_2 = "bankTruckTarget"
          L10_2 = vector3
          L11_2 = L6_2[1]
          L12_2 = L6_2[2]
          L13_2 = L6_2[3]
          L10_2 = L10_2(L11_2, L12_2, L13_2)
          L11_2 = 0.5
          L12_2 = {}
          L12_2.name = "bankTruckTarget"
          L13_2 = Config
          L13_2 = L13_2.Debug
          L12_2.debugPoly = L13_2
          L12_2.useZ = true
          L13_2 = {}
          L13_2.options = L5_2
          L13_2.distance = 1.5
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        end
      end
    end
  end
end
CreateBankTruckTarget = L17_1
L17_1 = RegisterNetEvent
L18_1 = "Pug:client:UseBankTruckItem"
function L19_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L12_1
  L0_2 = L0_2()
  if L0_2 then
    L1_2 = IsPlayerAtBackOfTruck
    L2_2 = PlayerPedId
    L2_2 = L2_2()
    L3_2 = L0_2
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L1_2 = Config
      L1_2 = L1_2.FrameworkFunctions
      L1_2 = L1_2.TriggerCallback
      L2_2 = "Pug:server:IsBankTruckOnCooldown"
      function L3_2(A0_3, A1_3)
        local L2_3, L3_3, L4_3, L5_3, L6_3
        if A0_3 then
          L2_3 = Notify
          L3_3 = Config
          L3_3 = L3_3.T
          L4_3 = "BankTruckCooldownMinutes"
          L5_3 = math
          L5_3 = L5_3.ceil
          L6_3 = A1_3 / 60
          L5_3, L6_3 = L5_3(L6_3)
          L3_3 = L3_3(L4_3, L5_3, L6_3)
          L4_3 = "error"
          L2_3(L3_3, L4_3)
        else
          L2_3 = Config
          L2_3 = L2_3.FrameworkFunctions
          L2_3 = L2_3.TriggerCallback
          L3_3 = "Pug:serverCB:getPoliceCount"
          function L4_3(A0_4)
            local L1_4, L2_4, L3_4, L4_4, L5_4
            L1_4 = GetBankTruckRequiredPolice
            L1_4 = L1_4()
            if A0_4 >= L1_4 then
              L2_4 = L0_1.initiatingStartingPoint
              L2_4 = L2_4.pedCoords
              if not L2_4 then
                L2_4 = StartBankTruckRobbery
                L3_4 = L0_2
                L2_4(L3_4)
              else
                L2_4 = Config
                L2_4 = L2_4.FrameworkFunctions
                L2_4 = L2_4.TriggerCallback
                L3_4 = "Pug:server:IsBankTruckBeingInitiated"
                function L4_4(A0_5)
                  local L1_5, L2_5, L3_5
                  if A0_5 then
                    L1_5 = StartBankTruckRobbery
                    L2_5 = L0_2
                    L1_5(L2_5)
                  else
                    L1_5 = Notify
                    L2_5 = Config
                    L2_5 = L2_5.LangT
                    L2_5 = L2_5.NeedInfoFromSource
                    L3_5 = "error"
                    L1_5(L2_5, L3_5)
                  end
                end
                L2_4(L3_4, L4_4)
              end
            else
              L2_4 = Notify
              L3_4 = Config
              L3_4 = L3_4.T
              L4_4 = "PoliceNotOnlineRequired"
              L5_4 = L1_4
              L3_4 = L3_4(L4_4, L5_4)
              L4_4 = "error"
              L2_4(L3_4, L4_4)
            end
          end
          L2_3(L3_3, L4_3)
        end
      end
      L1_2(L2_2, L3_2)
    else
      L1_2 = Notify
      L2_2 = Config
      L2_2 = L2_2.LangT
      L2_2 = L2_2.NeedToBeAtBackOfBankTruck
      L3_2 = "error"
      L1_2(L2_2, L3_2)
    end
  else
    L1_2 = Notify
    L2_2 = Config
    L2_2 = L2_2.LangT
    L2_2 = L2_2.NoBankTruckNearby
    L3_2 = "error"
    L1_2(L2_2, L3_2)
  end
end
L17_1(L18_1, L19_1)
function L17_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = GetEntityCoords
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = GetEntityBoneIndexByName
  L4_2 = A1_2
  L5_2 = "door_dside_r"
  L3_2 = L3_2(L4_2, L5_2)
  if -1 == L3_2 then
    L4_2 = GetEntityBoneIndexByName
    L5_2 = A1_2
    L6_2 = "boot"
    L4_2 = L4_2(L5_2, L6_2)
    L3_2 = L4_2
  end
  if -1 ~= L3_2 then
    L4_2 = GetWorldPositionOfEntityBone
    L5_2 = A1_2
    L6_2 = L3_2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = L2_2 - L4_2
    L5_2 = #L5_2
    L6_2 = L5_2 < 2.0
    return L6_2
  else
    L4_2 = GetEntityCoords
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    L5_2 = GetEntityForwardVector
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    L6_2 = L5_2 * 3.0
    L6_2 = L4_2 - L6_2
    L7_2 = L2_2 - L6_2
    L7_2 = #L7_2
    L8_2 = L7_2 < 2.0
    return L8_2
  end
end
IsPlayerAtBackOfTruck = L17_1
function L17_1()
  local L0_2, L1_2
  L0_2 = 0
  L1_2 = L0_1
  if L1_2 then
    L1_2 = L0_1.BankTruckpoliceRequired
    if L1_2 then
      L0_2 = L0_1.BankTruckpoliceRequired
  end
  else
    L0_2 = 0
  end
  return L0_2
end
GetBankTruckRequiredPolice = L17_1
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = GetHashKey
  L2_2 = "s_m_m_armoured_01"
  L1_2 = L1_2(L2_2)
  L2_2 = RequestModel
  L3_2 = L1_2
  L2_2(L3_2)
  while true do
    L2_2 = HasModelLoaded
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 10
    L2_2(L3_2)
  end
  L2_2 = GetHashKey
  L3_2 = "GUARDS"
  L2_2 = L2_2(L3_2)
  L3_2 = DoesRelationshipGroupExist
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = AddRelationshipGroup
    L4_2 = "GUARDS"
    L3_2(L4_2)
  end
  L3_2 = SetRelationshipBetweenGroups
  L4_2 = 0
  L5_2 = L2_2
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetRelationshipBetweenGroups
  L4_2 = 5
  L5_2 = L2_2
  L6_2 = GetHashKey
  L7_2 = "PLAYER"
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L6_2(L7_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L3_2 = SetRelationshipBetweenGroups
  L4_2 = 5
  L5_2 = GetHashKey
  L6_2 = "PLAYER"
  L5_2 = L5_2(L6_2)
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = {}
  L4_2 = 1
  L5_2 = 2
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = {}
  L5_2 = ipairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = CreatePedInsideVehicle
    L12_2 = A0_2
    L13_2 = 4
    L14_2 = L1_2
    L15_2 = L10_2
    L16_2 = true
    L17_2 = false
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L12_2 = DoesEntityExist
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if L12_2 then
      L12_2 = NetworkRegisterEntityAsNetworked
      L13_2 = L11_2
      L12_2(L13_2)
      L12_2 = NetworkGetNetworkIdFromEntity
      L13_2 = L11_2
      L12_2 = L12_2(L13_2)
      L13_2 = SetNetworkIdCanMigrate
      L14_2 = L12_2
      L15_2 = true
      L13_2(L14_2, L15_2)
      L13_2 = SetNetworkIdExistsOnAllMachines
      L14_2 = L12_2
      L15_2 = true
      L13_2(L14_2, L15_2)
      L13_2 = NetworkSetNetworkIdDynamic
      L14_2 = L12_2
      L15_2 = false
      L13_2(L14_2, L15_2)
      L13_2 = SetEntityAsMissionEntity
      L14_2 = L11_2
      L15_2 = true
      L16_2 = false
      L13_2(L14_2, L15_2, L16_2)
      L13_2 = SetPedRelationshipGroupHash
      L14_2 = L11_2
      L15_2 = L2_2
      L13_2(L14_2, L15_2)
      L13_2 = SetPedCombatAttributes
      L14_2 = L11_2
      L15_2 = 46
      L16_2 = true
      L13_2(L14_2, L15_2, L16_2)
      L13_2 = SetPedFleeAttributes
      L14_2 = L11_2
      L15_2 = 0
      L16_2 = false
      L13_2(L14_2, L15_2, L16_2)
      L13_2 = SetPedArmour
      L14_2 = L11_2
      L15_2 = 100
      L13_2(L14_2, L15_2)
      L13_2 = SetPedAccuracy
      L14_2 = L11_2
      L15_2 = 60
      L13_2(L14_2, L15_2)
      L13_2 = SetPedCombatAbility
      L14_2 = L11_2
      L15_2 = 2
      L13_2(L14_2, L15_2)
      L13_2 = SetPedCombatMovement
      L14_2 = L11_2
      L15_2 = 2
      L13_2(L14_2, L15_2)
      L13_2 = SetPedCombatRange
      L14_2 = L11_2
      L15_2 = 2
      L13_2(L14_2, L15_2)
      L13_2 = SetPedTargetLossResponse
      L14_2 = L11_2
      L15_2 = 1
      L13_2(L14_2, L15_2)
      L13_2 = GiveWeaponToPed
      L14_2 = L11_2
      L15_2 = GetHashKey
      L16_2 = "WEAPON_CARBINERIFLE"
      L15_2 = L15_2(L16_2)
      L16_2 = 250
      L17_2 = false
      L18_2 = true
      L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
      L13_2 = SetCurrentPedWeapon
      L14_2 = L11_2
      L15_2 = GetHashKey
      L16_2 = "WEAPON_CARBINERIFLE"
      L15_2 = L15_2(L16_2)
      L16_2 = true
      L13_2(L14_2, L15_2, L16_2)
      L13_2 = TaskLeaveVehicle
      L14_2 = L11_2
      L15_2 = A0_2
      L16_2 = 0
      L13_2(L14_2, L15_2, L16_2)
      L13_2 = CreateThread
      function L14_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3
        L0_3 = Wait
        L1_3 = 1400
        L0_3(L1_3)
        L0_3 = DoesEntityExist
        L1_3 = L11_2
        L0_3 = L0_3(L1_3)
        if L0_3 then
          L0_3 = IsEntityDead
          L1_3 = L11_2
          L0_3 = L0_3(L1_3)
          if not L0_3 then
            L0_3 = ClearPedTasksImmediately
            L1_3 = L11_2
            L0_3(L1_3)
            L0_3 = TaskCombatPed
            L1_3 = L11_2
            L2_3 = PlayerPedId
            L2_3 = L2_3()
            L3_3 = 0
            L4_3 = 16
            L0_3(L1_3, L2_3, L3_3, L4_3)
          end
        end
      end
      L13_2(L14_2)
      L13_2 = table
      L13_2 = L13_2.insert
      L14_2 = L4_2
      L15_2 = L11_2
      L13_2(L14_2, L15_2)
    else
      L12_2 = PrintDebug
      L13_2 = "Failed to create guard #"
      L14_2 = L9_2
      L13_2 = L13_2 .. L14_2
      L12_2(L13_2)
    end
  end
  L5_2 = SetModelAsNoLongerNeeded
  L6_2 = L1_2
  L5_2(L6_2)
end
SpawnGuardsAtBackOfTruck = L17_1
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L1_2 = L0_1
  if L1_2 then
    L1_2 = L0_1.requiredItem
    if L1_2 then
      L1_2 = L0_1.requiredItem
      L1_2 = #L1_2
      if L1_2 > 0 then
        L1_2 = L0_1.requiredItem
        L1_2 = L1_2[1]
        L2_2 = L1_2.chanceToLose
        if L2_2 then
          L2_2 = math
          L2_2 = L2_2.random
          L3_2 = 1
          L4_2 = 100
          L2_2 = L2_2(L3_2, L4_2)
          L3_2 = tonumber
          L4_2 = L1_2.chanceToLose
          L3_2 = L3_2(L4_2)
          if L2_2 <= L3_2 then
            TokenIsUseable = true
            L2_2 = HandleItems
            L3_2 = false
            L4_2 = tostring
            L5_2 = L1_2.name
            L4_2 = L4_2(L5_2)
            L5_2 = tonumber
            L6_2 = L1_2.quantityNeeded
            L5_2 = L5_2(L6_2)
            if not L5_2 then
              L5_2 = 1
            end
            L2_2(L3_2, L4_2, L5_2)
            TokenIsUseable = false
          end
        end
      end
    end
  end
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = SetVehicleDoorsShut
  L3_2 = A0_2
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SetVehicleDoorsLocked
  L3_2 = A0_2
  L4_2 = 4
  L2_2(L3_2, L4_2)
  L2_2 = TabletEmote
  L2_2()
  L2_2 = Config
  L2_2 = L2_2.MiniGames
  L3_2 = L0_1.miniGame
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.Game
  L2_2 = L2_2()
  if L2_2 then
    L3_2 = GetEntityCoords
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = GetEntityHeading
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    L5_2 = SendBankTruckAlert
    L5_2()
    L5_2 = StopTabletEmote
    L5_2()
    L5_2 = Notify
    L6_2 = Config
    L6_2 = L6_2.LangT
    L6_2 = L6_2.Success
    L7_2 = "success"
    L5_2(L6_2, L7_2)
    L5_2 = TriggerEvent
    L6_2 = "ox_inventory:disarm"
    L7_2 = GetPlayerServerId
    L8_2 = PlayerId
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L8_2()
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = SetCurrentPedWeapon
    L6_2 = PlayerPedId
    L6_2 = L6_2()
    L7_2 = GetHashKey
    L8_2 = "WEAPON_UNARMED"
    L7_2 = L7_2(L8_2)
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = GetEntityCoords
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    L6_2 = FreezeEntityPosition
    L7_2 = A0_2
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = FreezeEntityPosition
    L7_2 = L1_2
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = RequestAnimDict
    L7_2 = "anim@heists@ornate_bank@thermal_charge"
    L6_2(L7_2)
    while true do
      L6_2 = HasAnimDictLoaded
      L7_2 = "anim@heists@ornate_bank@thermal_charge"
      L6_2 = L6_2(L7_2)
      if L6_2 then
        break
      end
      L6_2 = Wait
      L7_2 = 10
      L6_2(L7_2)
    end
    L6_2 = GetHashKey
    L7_2 = "hei_prop_heist_thermite"
    L6_2 = L6_2(L7_2)
    L7_2 = RequestModel
    L8_2 = L6_2
    L7_2(L8_2)
    while true do
      L7_2 = HasModelLoaded
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        break
      end
      L7_2 = Wait
      L8_2 = 10
      L7_2(L8_2)
    end
    L7_2 = GetOffsetFromEntityInWorldCoords
    L8_2 = A0_2
    L9_2 = 0.0
    L10_2 = -4.0
    L11_2 = 0.0
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    L8_2 = TriggerServerEvent
    L9_2 = "Pug:server:StartBankTruckRobbery"
    L10_2 = vector3
    L11_2 = L7_2.x
    L12_2 = L7_2.y
    L13_2 = L7_2.z
    L13_2 = L13_2 - 0.4
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L10_2(L11_2, L12_2, L13_2)
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L8_2 = GetEntityHeading
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    L9_2 = SetEntityCoords
    L10_2 = L1_2
    L11_2 = L7_2.x
    L12_2 = L7_2.y
    L13_2 = L7_2.z
    L13_2 = L13_2 - 0.4
    L9_2(L10_2, L11_2, L12_2, L13_2)
    L9_2 = SetEntityHeading
    L10_2 = L1_2
    L11_2 = L8_2
    L9_2(L10_2, L11_2)
    L9_2 = CreateObject
    L10_2 = L6_2
    L11_2 = L7_2.x
    L12_2 = L7_2.y
    L13_2 = L7_2.z
    L14_2 = true
    L15_2 = true
    L16_2 = false
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L10_2 = AttachEntityToEntity
    L11_2 = L9_2
    L12_2 = L1_2
    L13_2 = GetPedBoneIndex
    L14_2 = L1_2
    L15_2 = 28422
    L13_2 = L13_2(L14_2, L15_2)
    L14_2 = 0.0
    L15_2 = 0.0
    L16_2 = 0.0
    L17_2 = 0.0
    L18_2 = 0.0
    L19_2 = 0.0
    L20_2 = true
    L21_2 = true
    L22_2 = false
    L23_2 = true
    L24_2 = 1
    L25_2 = true
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L10_2 = TaskPlayAnim
    L11_2 = L1_2
    L12_2 = "anim@heists@ornate_bank@thermal_charge"
    L13_2 = "thermal_charge"
    L14_2 = 8.0
    L15_2 = -8.0
    L16_2 = -1
    L17_2 = 1
    L18_2 = 0
    L19_2 = false
    L20_2 = false
    L21_2 = false
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    L10_2 = Wait
    L11_2 = 3500
    L10_2(L11_2)
    L10_2 = DetachEntity
    L11_2 = L9_2
    L12_2 = 1
    L13_2 = 1
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = FreezeEntityPosition
    L11_2 = L9_2
    L12_2 = true
    L10_2(L11_2, L12_2)
    L10_2 = RequestNamedPtfxAsset
    L11_2 = "scr_ornate_heist"
    L10_2(L11_2)
    while true do
      L10_2 = HasNamedPtfxAssetLoaded
      L11_2 = "scr_ornate_heist"
      L10_2 = L10_2(L11_2)
      if L10_2 then
        break
      end
      L10_2 = Wait
      L11_2 = 10
      L10_2(L11_2)
    end
    L10_2 = SetPtfxAssetNextCall
    L11_2 = "scr_ornate_heist"
    L10_2(L11_2)
    L10_2 = UseParticleFxAssetNextCall
    L11_2 = "scr_ornate_heist"
    L10_2(L11_2)
    L10_2 = StartParticleFxLoopedAtCoord
    L11_2 = "scr_heist_ornate_thermal_burn"
    L12_2 = vector3
    L13_2 = GetEntityCoords
    L14_2 = L9_2
    L13_2 = L13_2(L14_2)
    L13_2 = L13_2.x
    L14_2 = GetEntityCoords
    L15_2 = L9_2
    L14_2 = L14_2(L15_2)
    L14_2 = L14_2.y
    L15_2 = GetEntityCoords
    L16_2 = L9_2
    L15_2 = L15_2(L16_2)
    L15_2 = L15_2.z
    L15_2 = L15_2 + 0.1
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    L13_2 = 0.0
    L14_2 = 0.0
    L15_2 = 0.0
    L16_2 = 0.03
    L17_2 = false
    L18_2 = false
    L19_2 = false
    L20_2 = false
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L11_2 = Wait
    L12_2 = 4000
    L11_2(L12_2)
    L11_2 = ClearPedTasks
    L12_2 = PlayerPedId
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L12_2()
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
    L11_2 = FreezeEntityPosition
    L12_2 = L1_2
    L13_2 = false
    L11_2(L12_2, L13_2)
    L11_2 = Wait
    L12_2 = 6500
    L11_2(L12_2)
    L11_2 = StopParticleFxLooped
    L12_2 = L10_2
    L13_2 = 0
    L11_2(L12_2, L13_2)
    L11_2 = DeleteObject
    L12_2 = L9_2
    L11_2(L12_2)
    L11_2 = ClearPedTasks
    L12_2 = L1_2
    L11_2(L12_2)
    L11_2 = SetModelAsNoLongerNeeded
    L12_2 = L6_2
    L11_2(L12_2)
    L11_2 = L0_1.guardsShootOption
    if L11_2 then
      L11_2 = SetVehicleDoorsLocked
      L12_2 = A0_2
      L13_2 = 1
      L11_2(L12_2, L13_2)
      L11_2 = Wait
      L12_2 = 1000
      L11_2(L12_2)
      L11_2 = SpawnGuardsAtBackOfTruck
      L12_2 = A0_2
      L11_2(L12_2)
      L11_2 = Wait
      L12_2 = 8000
      L11_2(L12_2)
      L11_2 = SetVehicleDoorsShut
      L12_2 = A0_2
      L13_2 = true
      L11_2(L12_2, L13_2)
      L11_2 = SetVehicleDoorsLocked
      L12_2 = A0_2
      L13_2 = 4
      L11_2(L12_2, L13_2)
    end
    L11_2 = L0_1.bankTruckLootCooldown
    if not L11_2 then
      L11_2 = 1
    end
    L12_2 = Notify
    L13_2 = Config
    L13_2 = L13_2.T
    L14_2 = "BankTruckLootGrabbableMinutes"
    L15_2 = L11_2
    L13_2 = L13_2(L14_2, L15_2)
    L14_2 = "success"
    L12_2(L13_2, L14_2)
    L12_2 = CreateThread
    function L13_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L11_2
      L1_3 = L1_3 * 60
      L1_3 = L1_3 * 1000
      L0_3 = L0_3 + L1_3
      while true do
        L1_3 = GetGameTimer
        L1_3 = L1_3()
        if not (L0_3 > L1_3) then
          break
        end
        L1_3 = Wait
        L2_3 = 1000
        L1_3(L2_3)
        L1_3 = GetEntityCoords
        L2_3 = PlayerPedId
        L2_3, L3_3, L4_3, L5_3, L6_3 = L2_3()
        L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
        L2_3 = L3_2
        L2_3 = L1_3 - L2_3
        L2_3 = #L2_3
        L3_3 = 420.0
        if L2_3 <= L3_3 then
          L2_3 = DoesEntityExist
          L3_3 = A0_2
          L2_3 = L2_3(L3_3)
          if not L2_3 then
            L2_3 = PugSpawnVehicle
            L3_3 = "stockade"
            function L4_3(A0_4)
              local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
              L1_4 = SetEntityHeading
              L2_4 = A0_4
              L3_4 = L4_2
              L1_4(L2_4, L3_4)
              L1_4 = SetVehicleEngineOn
              L2_4 = A0_4
              L3_4 = false
              L4_4 = false
              L1_4(L2_4, L3_4, L4_4)
              L1_4 = SetVehicleOnGroundProperly
              L2_4 = A0_4
              L1_4(L2_4)
              L1_4 = SetVehicleNeedsToBeHotwired
              L2_4 = A0_4
              L3_4 = false
              L1_4(L2_4, L3_4)
              L1_4 = SetVehicleNumberPlateText
              L2_4 = A0_4
              L3_4 = "STOCK"
              L4_4 = tostring
              L5_4 = math
              L5_4 = L5_4.random
              L6_4 = 100
              L7_4 = 999
              L5_4, L6_4, L7_4 = L5_4(L6_4, L7_4)
              L4_4 = L4_4(L5_4, L6_4, L7_4)
              L3_4 = L3_4 .. L4_4
              L1_4(L2_4, L3_4)
              L1_4 = SetVehicleFuelLevel
              L2_4 = A0_4
              L3_4 = 100.0
              L1_4(L2_4, L3_4)
              L1_4 = SetVehicleDoorsLocked
              L2_4 = A0_4
              L3_4 = 0
              L1_4(L2_4, L3_4)
              A0_2 = A0_4
            end
            L5_3 = L3_2
            L6_3 = true
            L2_3(L3_3, L4_3, L5_3, L6_3)
          end
        end
      end
    end
    L12_2(L13_2)
  else
    L3_2 = Notify
    L4_2 = Config
    L4_2 = L4_2.LangT
    L4_2 = L4_2.Failed
    L5_2 = "error"
    L3_2(L4_2, L5_2)
    L3_2 = StopTabletEmote
    L3_2()
  end
end
StartBankTruckRobbery = L17_1
L17_1 = {}
L18_1 = RegisterNetEvent
L19_1 = "Pug:client:AllowAllToLootBankTruck"
function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L1_2 = nil
  L2_2 = vector3
  L3_2 = A0_2.x
  L4_2 = A0_2.y
  L5_2 = A0_2.z
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = GetGamePool
  L4_2 = "CVehicle"
  L3_2 = L3_2(L4_2)
  L4_2 = nil
  L5_2 = 10.0
  L6_2 = pairs
  L7_2 = L3_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = GetEntityCoords
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    L13_2 = L2_2 - L12_2
    L13_2 = #L13_2
    if L5_2 > L13_2 then
      L14_2 = GetEntityModel
      L15_2 = L11_2
      L14_2 = L14_2(L15_2)
      L15_2 = GetHashKey
      L16_2 = "stockade"
      L15_2 = L15_2(L16_2)
      if L14_2 == L15_2 then
        L1_2 = L11_2
      end
    end
  end
  if L1_2 then
    L6_2 = SetVehicleDoorOpen
    L7_2 = L1_2
    L8_2 = 2
    L9_2 = false
    L10_2 = false
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = SetVehicleDoorOpen
    L7_2 = L1_2
    L8_2 = 3
    L9_2 = false
    L10_2 = false
    L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = {}
  L17_1 = L6_2
  L6_2 = {}
  L7_2 = "prop_cash_pile_02"
  L8_2 = "prop_poly_bag_money"
  L9_2 = "hei_prop_cash_crate_half_full"
  L10_2 = "bkr_prop_bkr_cashpile_04"
  L11_2 = "bkr_prop_bkr_cashpile_05"
  L12_2 = "bkr_prop_bkr_cashpile_06"
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L6_2[5] = L11_2
  L6_2[6] = L12_2
  L7_2 = ipairs
  L8_2 = L6_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = GetHashKey
    L14_2 = L12_2
    L13_2 = L13_2(L14_2)
    L14_2 = RequestModel
    L15_2 = L13_2
    L14_2(L15_2)
    while true do
      L14_2 = HasModelLoaded
      L15_2 = L13_2
      L14_2 = L14_2(L15_2)
      if L14_2 then
        break
      end
      L14_2 = Wait
      L15_2 = 10
      L14_2(L15_2)
    end
  end
  L7_2 = {}
  L8_2 = vector3
  L9_2 = 0.0
  L10_2 = 0.0
  L11_2 = 0.0
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = vector3
  L10_2 = 0.5
  L11_2 = 0.0
  L12_2 = 0.0
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = vector3
  L11_2 = -0.5
  L12_2 = 0.0
  L13_2 = 0.0
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = vector3
  L12_2 = 0.0
  L13_2 = 0.5
  L14_2 = 0.0
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L12_2 = vector3
  L13_2 = 0.0
  L14_2 = -0.5
  L15_2 = 0.0
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L13_2 = vector3
  L14_2 = 0.3
  L15_2 = 0.3
  L16_2 = 0.0
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  L14_2 = vector3
  L15_2 = -0.3
  L16_2 = -0.3
  L17_2 = 0.0
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L15_2 = vector3
  L16_2 = 0.7
  L17_2 = 0.0
  L18_2 = 0.0
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L16_2 = vector3
  L17_2 = -0.7
  L18_2 = 0.0
  L19_2 = 0.0
  L16_2 = L16_2(L17_2, L18_2, L19_2)
  L17_2 = vector3
  L18_2 = 0.0
  L19_2 = 0.7
  L20_2 = 0.0
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  L18_2 = vector3
  L19_2 = 0.0
  L20_2 = -0.7
  L21_2 = 0.0
  L18_2 = L18_2(L19_2, L20_2, L21_2)
  L19_2 = vector3
  L20_2 = 0.5
  L21_2 = 0.5
  L22_2 = 0.0
  L19_2 = L19_2(L20_2, L21_2, L22_2)
  L20_2 = vector3
  L21_2 = -0.5
  L22_2 = -0.5
  L23_2 = 0.0
  L20_2 = L20_2(L21_2, L22_2, L23_2)
  L21_2 = vector3
  L22_2 = 0.5
  L23_2 = -0.5
  L24_2 = 0.0
  L21_2 = L21_2(L22_2, L23_2, L24_2)
  L22_2 = vector3
  L23_2 = -0.5
  L24_2 = 0.5
  L25_2 = 0.0
  L22_2 = L22_2(L23_2, L24_2, L25_2)
  L23_2 = vector3
  L24_2 = 1.0
  L25_2 = 0.0
  L26_2 = 0.0
  L23_2 = L23_2(L24_2, L25_2, L26_2)
  L24_2 = vector3
  L25_2 = -1.0
  L26_2 = 0.0
  L27_2 = 0.0
  L24_2 = L24_2(L25_2, L26_2, L27_2)
  L25_2 = vector3
  L26_2 = 0.0
  L27_2 = 1.0
  L28_2 = 0.0
  L25_2 = L25_2(L26_2, L27_2, L28_2)
  L26_2 = vector3
  L27_2 = 0.5
  L28_2 = 1.0
  L29_2 = 0.0
  L26_2, L27_2, L28_2, L29_2 = L26_2(L27_2, L28_2, L29_2)
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L7_2[4] = L11_2
  L7_2[5] = L12_2
  L7_2[6] = L13_2
  L7_2[7] = L14_2
  L7_2[8] = L15_2
  L7_2[9] = L16_2
  L7_2[10] = L17_2
  L7_2[11] = L18_2
  L7_2[12] = L19_2
  L7_2[13] = L20_2
  L7_2[14] = L21_2
  L7_2[15] = L22_2
  L7_2[16] = L23_2
  L7_2[17] = L24_2
  L7_2[18] = L25_2
  L7_2[19] = L26_2
  L7_2[20] = L27_2
  L7_2[21] = L28_2
  L7_2[22] = L29_2
  L8_2 = ipairs
  L9_2 = L7_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = math
    L14_2 = L14_2.random
    L15_2 = #L6_2
    L14_2 = L14_2(L15_2)
    L14_2 = L6_2[L14_2]
    L15_2 = GetHashKey
    L16_2 = L14_2
    L15_2 = L15_2(L16_2)
    L16_2 = vector3
    L17_2 = A0_2.x
    L18_2 = L13_2.x
    L17_2 = L17_2 + L18_2
    L18_2 = A0_2.y
    L19_2 = L13_2.y
    L18_2 = L18_2 + L19_2
    L19_2 = A0_2.z
    L20_2 = L13_2.z
    L19_2 = L19_2 + L20_2
    L19_2 = L19_2 - 1.0
    L16_2 = L16_2(L17_2, L18_2, L19_2)
    L17_2 = CreateObject
    L18_2 = L15_2
    L19_2 = L16_2.x
    L20_2 = L16_2.y
    L21_2 = L16_2.z
    L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
    L18_2 = SetEntityHeading
    L19_2 = L17_2
    L20_2 = math
    L20_2 = L20_2.random
    L21_2 = 0
    L22_2 = 360
    L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L20_2(L21_2, L22_2)
    L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
    L18_2 = PlaceObjectOnGroundProperly
    L19_2 = L17_2
    L18_2(L19_2)
    L18_2 = FreezeEntityPosition
    L19_2 = L17_2
    L20_2 = true
    L18_2(L19_2, L20_2)
    L18_2 = table
    L18_2 = L18_2.insert
    L19_2 = L17_1
    L20_2 = L17_2
    L18_2(L19_2, L20_2)
  end
  L8_2 = ipairs
  L9_2 = L6_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = GetHashKey
    L15_2 = L13_2
    L14_2 = L14_2(L15_2)
    L15_2 = SetModelAsNoLongerNeeded
    L16_2 = L14_2
    L15_2(L16_2)
  end
  L8_2 = nil
  L9_2 = GetResourceState
  L10_2 = "RevoInteract"
  L9_2 = L9_2(L10_2)
  if "started" ~= L9_2 then
    L9_2 = Config
    L9_2 = L9_2.Target
    if L9_2 then
      L9_2 = Config
      L9_2 = L9_2.DrawTextInsteadOfTarget
      if not L9_2 then
        goto lbl_270
      end
    end
  end
  L9_2 = CreateThread
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3
    L0_3 = false
    L1_3 = false
    while not L1_3 do
      L2_3 = Wait
      L3_3 = 0
      L2_3(L3_3)
      L2_3 = PlayerPedId
      L2_3 = L2_3()
      L3_3 = GetEntityCoords
      L4_3 = L2_3
      L3_3 = L3_3(L4_3)
      L4_3 = A0_2
      L4_3 = L3_3 - L4_3
      L4_3 = #L4_3
      L5_3 = 1.5
      if L4_3 < L5_3 then
        if not L0_3 then
          L5_3 = GetResourceState
          L6_3 = "RevoInteract"
          L5_3 = L5_3(L6_3)
          if "started" == L5_3 then
            L5_3 = exports
            L5_3 = L5_3.RevoInteract
            L6_3 = L5_3
            L5_3 = L5_3.OpenHelp
            L7_3 = {}
            L7_3.ID = "LootBankTruck"
            L7_3.Text = "Loot Money"
            L7_3.Key = "[E]"
            L5_3(L6_3, L7_3)
          else
            L5_3 = DrawTextOption
            L6_3 = "[E] Loot Money"
            L5_3(L6_3)
          end
          L0_3 = true
        end
        L5_3 = IsControlJustPressed
        L6_3 = 0
        L7_3 = 38
        L5_3 = L5_3(L6_3, L7_3)
        if not L5_3 then
          goto lbl_304
        end
        L1_3 = true
        L5_3 = GetResourceState
        L6_3 = "RevoInteract"
        L5_3 = L5_3(L6_3)
        if "started" == L5_3 then
          L5_3 = exports
          L5_3 = L5_3.RevoInteract
          L6_3 = L5_3
          L5_3 = L5_3.CloseHelp
          L7_3 = "LootBankTruck"
          L5_3(L6_3, L7_3)
        else
          L5_3 = HideTextOption
          L5_3()
        end
        L5_3 = TriggerServerEvent
        L6_3 = "Pug:server:PlayerStartedLootingBankTruck"
        L5_3(L6_3)
        L5_3 = {}
        L6_3 = {}
        L6_3.total = 0
        L6_3.given = 0
        L6_3.type = "cash"
        L7_3 = L0_1
        if L7_3 then
          L7_3 = L0_1.rewardItem
          if L7_3 then
            L7_3 = pairs
            L8_3 = L0_1.rewardItem
            L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3)
            for L11_3, L12_3 in L7_3, L8_3, L9_3, L10_3 do
              L13_3 = L12_3.name
              if L13_3 then
                L13_3 = L12_3.minAmount
                if L13_3 then
                  L13_3 = L12_3.maxAmount
                  if L13_3 then
                    L13_3 = tonumber
                    L14_3 = L12_3.minAmount
                    L13_3 = L13_3(L14_3)
                    L14_3 = tonumber
                    L15_3 = L12_3.maxAmount
                    L14_3 = L14_3(L15_3)
                    L15_3 = tonumber
                    L16_3 = L12_3.chance
                    L15_3 = L15_3(L16_3)
                    if not L15_3 then
                      L15_3 = 100
                    end
                    if L13_3 and L14_3 and L13_3 <= L14_3 then
                      L16_3 = math
                      L16_3 = L16_3.random
                      L17_3 = L13_3
                      L18_3 = L14_3
                      L16_3 = L16_3(L17_3, L18_3)
                      L17_3 = L12_3.name
                      L18_3 = {}
                      L18_3.total = L16_3
                      L18_3.given = 0
                      L18_3.chance = L15_3
                      L5_3[L17_3] = L18_3
                      L17_3 = math
                      L17_3 = L17_3.random
                      L18_3 = 1
                      L19_3 = 100
                      L17_3 = L17_3(L18_3, L19_3)
                      if L15_3 >= L17_3 then
                        L18_3 = L12_3.name
                        L18_3 = L5_3[L18_3]
                        L18_3.allowed = true
                      else
                        L18_3 = L12_3.name
                        L18_3 = L5_3[L18_3]
                        L18_3.allowed = false
                      end
                    else
                      L16_3 = Notify
                      L17_3 = Config
                      L17_3 = L17_3.T
                      L18_3 = "InvalidAmountOrChanceItem"
                      L19_3 = tostring
                      L20_3 = L12_3.name
                      L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3 = L19_3(L20_3)
                      L17_3 = L17_3(L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3)
                      L18_3 = "error"
                      L16_3(L17_3, L18_3)
                    end
                  end
                end
              end
            end
          end
        end
        L7_3 = L0_1
        if L7_3 then
          L7_3 = L0_1.rewardMoney
          if L7_3 then
            L7_3 = L0_1.rewardMoney
            L8_3 = L7_3.minAmount
            if L8_3 then
              L8_3 = L7_3.maxAmount
              if L8_3 then
                L8_3 = L7_3.type
                if L8_3 then
                  L8_3 = tonumber
                  L9_3 = L7_3.minAmount
                  L8_3 = L8_3(L9_3)
                  L9_3 = tonumber
                  L10_3 = L7_3.maxAmount
                  L9_3 = L9_3(L10_3)
                  L10_3 = tostring
                  L11_3 = L7_3.type
                  L10_3 = L10_3(L11_3)
                  if L8_3 and L9_3 and L8_3 <= L9_3 then
                    L11_3 = math
                    L11_3 = L11_3.random
                    L12_3 = L8_3
                    L13_3 = L9_3
                    L11_3 = L11_3(L12_3, L13_3)
                    L6_3.total = L11_3
                    L6_3.type = L10_3
                  else
                    L11_3 = Notify
                    L12_3 = Config
                    L12_3 = L12_3.LangT
                    L12_3 = L12_3.InvalidMoneyConfiguration
                    L13_3 = "error"
                    L11_3(L12_3, L13_3)
                  end
                end
              end
            end
          end
        end
        L7_3 = PlayerPedId
        L7_3 = L7_3()
        L8_3 = GetEntityCoords
        L9_3 = L7_3
        L8_3 = L8_3(L9_3)
        L9_3 = GetHashKey
        L10_3 = "hei_prop_heist_cash_pile"
        L9_3 = L9_3(L10_3)
        L10_3 = RequestModel
        L11_3 = L9_3
        L10_3(L11_3)
        while true do
          L10_3 = HasModelLoaded
          L11_3 = L9_3
          L10_3 = L10_3(L11_3)
          if L10_3 then
            break
          end
          L10_3 = Wait
          L11_3 = 10
          L10_3(L11_3)
        end
        L10_3 = CreateObject
        L11_3 = L9_3
        L12_3 = L8_3
        L13_3 = true
        L14_3 = true
        L15_3 = true
        L10_3 = L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
        L11_3 = SetEntityVisible
        L12_3 = L10_3
        L13_3 = false
        L14_3 = false
        L11_3(L12_3, L13_3, L14_3)
        L11_3 = AttachEntityToEntity
        L12_3 = L10_3
        L13_3 = L7_3
        L14_3 = GetPedBoneIndex
        L15_3 = L7_3
        L16_3 = 60309
        L14_3 = L14_3(L15_3, L16_3)
        L15_3 = 0.0
        L16_3 = 0.0
        L17_3 = 0.0
        L18_3 = 0.0
        L19_3 = 0.0
        L20_3 = 0.0
        L21_3 = false
        L22_3 = false
        L23_3 = false
        L24_3 = false
        L25_3 = 0
        L26_3 = true
        L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3)
        L11_3 = RequestAnimDict
        L12_3 = "anim@heists@ornate_bank@grab_cash_heels"
        L11_3(L12_3)
        while true do
          L11_3 = HasAnimDictLoaded
          L12_3 = "anim@heists@ornate_bank@grab_cash_heels"
          L11_3 = L11_3(L12_3)
          if L11_3 then
            break
          end
          L11_3 = Wait
          L12_3 = 50
          L11_3(L12_3)
        end
        L11_3 = TaskPlayAnim
        L12_3 = L7_3
        L13_3 = "anim@heists@ornate_bank@grab_cash_heels"
        L14_3 = "grab"
        L15_3 = 8.0
        L16_3 = -8.0
        L17_3 = -1
        L18_3 = 1
        L19_3 = 0
        L20_3 = false
        L21_3 = false
        L22_3 = false
        L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3)
        L11_3 = FreezeEntityPosition
        L12_3 = L7_3
        L13_3 = true
        L11_3(L12_3, L13_3)
        L11_3 = GetGameTimer
        L11_3 = L11_3()
        L12_3 = L17_1
        L12_3 = #L12_3
        L12_3 = L12_3 * 1000
        L13_3 = 1000
        L14_3 = GetGameTimer
        L14_3 = L14_3()
        L15_3 = CreateThread
        function L16_3()
          local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4
          while true do
            L0_4 = GetGameTimer
            L0_4 = L0_4()
            L1_4 = L11_3
            L0_4 = L0_4 - L1_4
            L1_4 = L12_3
            if not (L0_4 < L1_4) then
              break
            end
            L0_4 = Wait
            L1_4 = 0
            L0_4(L1_4)
            L0_4 = DisableControlAction
            L1_4 = 0
            L2_4 = 73
            L3_4 = true
            L0_4(L1_4, L2_4, L3_4)
            L0_4 = GetGameTimer
            L0_4 = L0_4()
            L1_4 = HasAnimEventFired
            L2_4 = L7_3
            L3_4 = GetHashKey
            L4_4 = "CASH_APPEAR"
            L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4 = L3_4(L4_4)
            L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
            if L1_4 then
              L1_4 = IsEntityVisible
              L2_4 = L10_3
              L1_4 = L1_4(L2_4)
              if not L1_4 then
                L1_4 = SetEntityVisible
                L2_4 = L10_3
                L3_4 = true
                L4_4 = false
                L1_4(L2_4, L3_4, L4_4)
              end
            end
            L1_4 = HasAnimEventFired
            L2_4 = L7_3
            L3_4 = GetHashKey
            L4_4 = "RELEASE_CASH_DESTROY"
            L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4 = L3_4(L4_4)
            L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
            if L1_4 then
              L1_4 = IsEntityVisible
              L2_4 = L10_3
              L1_4 = L1_4(L2_4)
              if L1_4 then
                L1_4 = SetEntityVisible
                L2_4 = L10_3
                L3_4 = false
                L4_4 = false
                L1_4(L2_4, L3_4, L4_4)
              end
            end
            L1_4 = L14_3
            L1_4 = L0_4 - L1_4
            L2_4 = L13_3
            if L1_4 >= L2_4 then
              L14_3 = L0_4
              L1_4 = math
              L1_4 = L1_4.floor
              L2_4 = L11_3
              L2_4 = L0_4 - L2_4
              L3_4 = L13_3
              L2_4 = L2_4 / L3_4
              L1_4 = L1_4(L2_4)
              L1_4 = L1_4 + 1
              L2_4 = L17_1
              L2_4 = #L2_4
              if L1_4 <= L2_4 then
                L2_4 = TriggerServerEvent
                L3_4 = "Pug:server:DeleteMoneyProp"
                L4_4 = L1_4
                L2_4(L3_4, L4_4)
              end
              L2_4 = pairs
              L3_4 = L5_3
              L2_4, L3_4, L4_4, L5_4 = L2_4(L3_4)
              for L6_4, L7_4 in L2_4, L3_4, L4_4, L5_4 do
                L8_4 = L7_4.allowed
                if L8_4 then
                  L8_4 = L7_4.total
                  L9_4 = L7_4.given
                  L8_4 = L8_4 - L9_4
                  if L8_4 > 0 then
                    L9_4 = L12_3
                    L10_4 = L11_3
                    L10_4 = L0_4 - L10_4
                    L9_4 = L9_4 - L10_4
                    L10_4 = math
                    L10_4 = L10_4.ceil
                    L11_4 = L13_3
                    L11_4 = L9_4 / L11_4
                    L10_4 = L10_4(L11_4)
                    L11_4 = math
                    L11_4 = L11_4.max
                    L12_4 = L10_4
                    L13_4 = 1
                    L11_4 = L11_4(L12_4, L13_4)
                    L10_4 = L11_4
                    L11_4 = math
                    L11_4 = L11_4.ceil
                    L12_4 = L8_4 / L10_4
                    L11_4 = L11_4(L12_4)
                    L12_4 = math
                    L12_4 = L12_4.min
                    L13_4 = L11_4
                    L14_4 = L8_4
                    L12_4 = L12_4(L13_4, L14_4)
                    L11_4 = L12_4
                    L12_4 = L7_4.given
                    L12_4 = L12_4 + L11_4
                    L7_4.given = L12_4
                    TokenIsUseable = true
                    L12_4 = HandleItems
                    L13_4 = true
                    L14_4 = tostring
                    L15_4 = L6_4
                    L14_4 = L14_4(L15_4)
                    L15_4 = L11_4
                    L12_4(L13_4, L14_4, L15_4)
                    TokenIsUseable = false
                  end
                end
              end
              L2_4 = L6_3.total
              if L2_4 > 0 then
                L2_4 = L6_3.given
                L3_4 = L6_3.total
                if L2_4 < L3_4 then
                  L2_4 = L6_3.total
                  L3_4 = L6_3.given
                  L2_4 = L2_4 - L3_4
                  L3_4 = L12_3
                  L4_4 = L11_3
                  L4_4 = L0_4 - L4_4
                  L3_4 = L3_4 - L4_4
                  L4_4 = math
                  L4_4 = L4_4.ceil
                  L5_4 = L13_3
                  L5_4 = L3_4 / L5_4
                  L4_4 = L4_4(L5_4)
                  L5_4 = math
                  L5_4 = L5_4.max
                  L6_4 = L4_4
                  L7_4 = 1
                  L5_4 = L5_4(L6_4, L7_4)
                  L4_4 = L5_4
                  L5_4 = math
                  L5_4 = L5_4.ceil
                  L6_4 = L2_4 / L4_4
                  L5_4 = L5_4(L6_4)
                  L6_4 = math
                  L6_4 = L6_4.min
                  L7_4 = L5_4
                  L8_4 = L2_4
                  L6_4 = L6_4(L7_4, L8_4)
                  L5_4 = L6_4
                  L6_4 = L6_3.given
                  L6_4 = L6_4 + L5_4
                  L6_3.given = L6_4
                  TokenIsUseable = true
                  L6_4 = HandleMoney
                  L7_4 = L6_3.type
                  L8_4 = L5_4
                  L6_4(L7_4, L8_4)
                  TokenIsUseable = false
                end
              end
            end
          end
          L0_4 = DeleteObject
          L1_4 = L10_3
          L0_4(L1_4)
          L0_4 = ClearPedTasks
          L1_4 = L7_3
          L0_4(L1_4)
          L0_4 = FreezeEntityPosition
          L1_4 = L7_3
          L2_4 = false
          L0_4(L1_4, L2_4)
          L0_4 = SetModelAsNoLongerNeeded
          L1_4 = L9_3
          L0_4(L1_4)
        end
        L15_3(L16_3)
      elseif L0_3 then
        L5_3 = GetResourceState
        L6_3 = "RevoInteract"
        L5_3 = L5_3(L6_3)
        if "started" == L5_3 then
          L5_3 = exports
          L5_3 = L5_3.RevoInteract
          L6_3 = L5_3
          L5_3 = L5_3.CloseHelp
          L7_3 = "LootBankTruck"
          L5_3(L6_3, L7_3)
        else
          L5_3 = HideTextOption
          L5_3()
        end
        L0_3 = false
      end
      ::lbl_304::
    end
  end
  L9_2(L10_2)
  goto lbl_297
  ::lbl_270::
  L9_2 = Config
  L9_2 = L9_2.Target
  if "ox_target" == L9_2 then
    L9_2 = {}
    L10_2 = {}
    L10_2.name = "lootBankTruck"
    L10_2.icon = "fas fa-box-open"
    L10_2.label = "Loot Money"
    function L11_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
      L0_3 = TriggerServerEvent
      L1_3 = "Pug:server:PlayerStartedLootingBankTruck"
      L0_3(L1_3)
      L0_3 = {}
      L1_3 = {}
      L1_3.total = 0
      L1_3.given = 0
      L1_3.type = "cash"
      L2_3 = L0_1
      if L2_3 then
        L2_3 = L0_1.rewardItem
        if L2_3 then
          L2_3 = pairs
          L3_3 = L0_1.rewardItem
          L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
          for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
            L8_3 = L7_3.name
            if L8_3 then
              L8_3 = L7_3.minAmount
              if L8_3 then
                L8_3 = L7_3.maxAmount
                if L8_3 then
                  L8_3 = tonumber
                  L9_3 = L7_3.minAmount
                  L8_3 = L8_3(L9_3)
                  L9_3 = tonumber
                  L10_3 = L7_3.maxAmount
                  L9_3 = L9_3(L10_3)
                  L10_3 = tonumber
                  L11_3 = L7_3.chance
                  L10_3 = L10_3(L11_3)
                  if not L10_3 then
                    L10_3 = 100
                  end
                  if L8_3 and L9_3 and L8_3 <= L9_3 then
                    L11_3 = math
                    L11_3 = L11_3.random
                    L12_3 = L8_3
                    L13_3 = L9_3
                    L11_3 = L11_3(L12_3, L13_3)
                    L12_3 = L7_3.name
                    L13_3 = {}
                    L13_3.total = L11_3
                    L13_3.given = 0
                    L13_3.chance = L10_3
                    L0_3[L12_3] = L13_3
                    L12_3 = math
                    L12_3 = L12_3.random
                    L13_3 = 1
                    L14_3 = 100
                    L12_3 = L12_3(L13_3, L14_3)
                    if L10_3 >= L12_3 then
                      L13_3 = L7_3.name
                      L13_3 = L0_3[L13_3]
                      L13_3.allowed = true
                    else
                      L13_3 = L7_3.name
                      L13_3 = L0_3[L13_3]
                      L13_3.allowed = false
                    end
                  else
                    L11_3 = Notify
                    L12_3 = Config
                    L12_3 = L12_3.T
                    L13_3 = "InvalidAmountOrChanceItem"
                    L14_3 = tostring
                    L15_3 = L7_3.name
                    L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3 = L14_3(L15_3)
                    L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
                    L13_3 = "error"
                    L11_3(L12_3, L13_3)
                  end
                end
              end
            end
          end
        end
      end
      L2_3 = L0_1
      if L2_3 then
        L2_3 = L0_1.rewardMoney
        if L2_3 then
          L2_3 = L0_1.rewardMoney
          L3_3 = L2_3.minAmount
          if L3_3 then
            L3_3 = L2_3.maxAmount
            if L3_3 then
              L3_3 = L2_3.type
              if L3_3 then
                L3_3 = tonumber
                L4_3 = L2_3.minAmount
                L3_3 = L3_3(L4_3)
                L4_3 = tonumber
                L5_3 = L2_3.maxAmount
                L4_3 = L4_3(L5_3)
                L5_3 = tostring
                L6_3 = L2_3.type
                L5_3 = L5_3(L6_3)
                if L3_3 and L4_3 and L3_3 <= L4_3 then
                  L6_3 = math
                  L6_3 = L6_3.random
                  L7_3 = L3_3
                  L8_3 = L4_3
                  L6_3 = L6_3(L7_3, L8_3)
                  L1_3.total = L6_3
                  L1_3.type = L5_3
                else
                  L6_3 = Notify
                  L7_3 = Config
                  L7_3 = L7_3.LangT
                  L7_3 = L7_3.InvalidMoneyConfiguration
                  L8_3 = "error"
                  L6_3(L7_3, L8_3)
                end
              end
            end
          end
        end
      end
      L2_3 = PlayerPedId
      L2_3 = L2_3()
      L3_3 = GetEntityCoords
      L4_3 = L2_3
      L3_3 = L3_3(L4_3)
      L4_3 = GetHashKey
      L5_3 = "hei_prop_heist_cash_pile"
      L4_3 = L4_3(L5_3)
      L5_3 = RequestModel
      L6_3 = L4_3
      L5_3(L6_3)
      while true do
        L5_3 = HasModelLoaded
        L6_3 = L4_3
        L5_3 = L5_3(L6_3)
        if L5_3 then
          break
        end
        L5_3 = Wait
        L6_3 = 10
        L5_3(L6_3)
      end
      L5_3 = CreateObject
      L6_3 = L4_3
      L7_3 = L3_3
      L8_3 = true
      L9_3 = true
      L10_3 = true
      L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)
      L6_3 = SetEntityVisible
      L7_3 = L5_3
      L8_3 = false
      L9_3 = false
      L6_3(L7_3, L8_3, L9_3)
      L6_3 = AttachEntityToEntity
      L7_3 = L5_3
      L8_3 = L2_3
      L9_3 = GetPedBoneIndex
      L10_3 = L2_3
      L11_3 = 60309
      L9_3 = L9_3(L10_3, L11_3)
      L10_3 = 0.0
      L11_3 = 0.0
      L12_3 = 0.0
      L13_3 = 0.0
      L14_3 = 0.0
      L15_3 = 0.0
      L16_3 = false
      L17_3 = false
      L18_3 = false
      L19_3 = false
      L20_3 = 0
      L21_3 = true
      L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
      L6_3 = RequestAnimDict
      L7_3 = "anim@heists@ornate_bank@grab_cash_heels"
      L6_3(L7_3)
      while true do
        L6_3 = HasAnimDictLoaded
        L7_3 = "anim@heists@ornate_bank@grab_cash_heels"
        L6_3 = L6_3(L7_3)
        if L6_3 then
          break
        end
        L6_3 = Wait
        L7_3 = 50
        L6_3(L7_3)
      end
      L6_3 = TaskPlayAnim
      L7_3 = L2_3
      L8_3 = "anim@heists@ornate_bank@grab_cash_heels"
      L9_3 = "grab"
      L10_3 = 8.0
      L11_3 = -8.0
      L12_3 = -1
      L13_3 = 1
      L14_3 = 0
      L15_3 = false
      L16_3 = false
      L17_3 = false
      L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
      L6_3 = FreezeEntityPosition
      L7_3 = L2_3
      L8_3 = true
      L6_3(L7_3, L8_3)
      L6_3 = GetGameTimer
      L6_3 = L6_3()
      L7_3 = L17_1
      L7_3 = #L7_3
      L7_3 = L7_3 * 1000
      L8_3 = 1000
      L9_3 = GetGameTimer
      L9_3 = L9_3()
      L10_3 = CreateThread
      function L11_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4
        while true do
          L0_4 = GetGameTimer
          L0_4 = L0_4()
          L1_4 = L6_3
          L0_4 = L0_4 - L1_4
          L1_4 = L7_3
          if not (L0_4 < L1_4) then
            break
          end
          L0_4 = Wait
          L1_4 = 0
          L0_4(L1_4)
          L0_4 = DisableControlAction
          L1_4 = 0
          L2_4 = 73
          L3_4 = true
          L0_4(L1_4, L2_4, L3_4)
          L0_4 = GetGameTimer
          L0_4 = L0_4()
          L1_4 = HasAnimEventFired
          L2_4 = L2_3
          L3_4 = GetHashKey
          L4_4 = "CASH_APPEAR"
          L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4 = L3_4(L4_4)
          L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
          if L1_4 then
            L1_4 = IsEntityVisible
            L2_4 = L5_3
            L1_4 = L1_4(L2_4)
            if not L1_4 then
              L1_4 = SetEntityVisible
              L2_4 = L5_3
              L3_4 = true
              L4_4 = false
              L1_4(L2_4, L3_4, L4_4)
            end
          end
          L1_4 = HasAnimEventFired
          L2_4 = L2_3
          L3_4 = GetHashKey
          L4_4 = "RELEASE_CASH_DESTROY"
          L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4 = L3_4(L4_4)
          L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
          if L1_4 then
            L1_4 = IsEntityVisible
            L2_4 = L5_3
            L1_4 = L1_4(L2_4)
            if L1_4 then
              L1_4 = SetEntityVisible
              L2_4 = L5_3
              L3_4 = false
              L4_4 = false
              L1_4(L2_4, L3_4, L4_4)
            end
          end
          L1_4 = L9_3
          L1_4 = L0_4 - L1_4
          L2_4 = L8_3
          if L1_4 >= L2_4 then
            L9_3 = L0_4
            L1_4 = math
            L1_4 = L1_4.floor
            L2_4 = L6_3
            L2_4 = L0_4 - L2_4
            L3_4 = L8_3
            L2_4 = L2_4 / L3_4
            L1_4 = L1_4(L2_4)
            L1_4 = L1_4 + 1
            L2_4 = L17_1
            L2_4 = #L2_4
            if L1_4 <= L2_4 then
              L2_4 = TriggerServerEvent
              L3_4 = "Pug:server:DeleteMoneyProp"
              L4_4 = L1_4
              L2_4(L3_4, L4_4)
            end
            L2_4 = pairs
            L3_4 = L0_3
            L2_4, L3_4, L4_4, L5_4 = L2_4(L3_4)
            for L6_4, L7_4 in L2_4, L3_4, L4_4, L5_4 do
              L8_4 = L7_4.allowed
              if L8_4 then
                L8_4 = L7_4.total
                L9_4 = L7_4.given
                L8_4 = L8_4 - L9_4
                if L8_4 > 0 then
                  L9_4 = L7_3
                  L10_4 = L6_3
                  L10_4 = L0_4 - L10_4
                  L9_4 = L9_4 - L10_4
                  L10_4 = math
                  L10_4 = L10_4.ceil
                  L11_4 = L8_3
                  L11_4 = L9_4 / L11_4
                  L10_4 = L10_4(L11_4)
                  L11_4 = math
                  L11_4 = L11_4.max
                  L12_4 = L10_4
                  L13_4 = 1
                  L11_4 = L11_4(L12_4, L13_4)
                  L10_4 = L11_4
                  L11_4 = math
                  L11_4 = L11_4.ceil
                  L12_4 = L8_4 / L10_4
                  L11_4 = L11_4(L12_4)
                  L12_4 = math
                  L12_4 = L12_4.min
                  L13_4 = L11_4
                  L14_4 = L8_4
                  L12_4 = L12_4(L13_4, L14_4)
                  L11_4 = L12_4
                  L12_4 = L7_4.given
                  L12_4 = L12_4 + L11_4
                  L7_4.given = L12_4
                  TokenIsUseable = true
                  L12_4 = HandleItems
                  L13_4 = true
                  L14_4 = tostring
                  L15_4 = L6_4
                  L14_4 = L14_4(L15_4)
                  L15_4 = L11_4
                  L12_4(L13_4, L14_4, L15_4)
                  TokenIsUseable = false
                end
              end
            end
            L2_4 = L1_3.total
            if L2_4 > 0 then
              L2_4 = L1_3.given
              L3_4 = L1_3.total
              if L2_4 < L3_4 then
                L2_4 = L1_3.total
                L3_4 = L1_3.given
                L2_4 = L2_4 - L3_4
                L3_4 = L7_3
                L4_4 = L6_3
                L4_4 = L0_4 - L4_4
                L3_4 = L3_4 - L4_4
                L4_4 = math
                L4_4 = L4_4.ceil
                L5_4 = L8_3
                L5_4 = L3_4 / L5_4
                L4_4 = L4_4(L5_4)
                L5_4 = math
                L5_4 = L5_4.max
                L6_4 = L4_4
                L7_4 = 1
                L5_4 = L5_4(L6_4, L7_4)
                L4_4 = L5_4
                L5_4 = math
                L5_4 = L5_4.ceil
                L6_4 = L2_4 / L4_4
                L5_4 = L5_4(L6_4)
                L6_4 = math
                L6_4 = L6_4.min
                L7_4 = L5_4
                L8_4 = L2_4
                L6_4 = L6_4(L7_4, L8_4)
                L5_4 = L6_4
                L6_4 = L1_3.given
                L6_4 = L6_4 + L5_4
                L1_3.given = L6_4
                TokenIsUseable = true
                L6_4 = HandleMoney
                L7_4 = L1_3.type
                L8_4 = L5_4
                L6_4(L7_4, L8_4)
                TokenIsUseable = false
              end
            end
          end
        end
        L0_4 = DeleteObject
        L1_4 = L5_3
        L0_4(L1_4)
        L0_4 = ClearPedTasks
        L1_4 = L2_3
        L0_4(L1_4)
        L0_4 = FreezeEntityPosition
        L1_4 = L2_3
        L2_4 = false
        L0_4(L1_4, L2_4)
        L0_4 = SetModelAsNoLongerNeeded
        L1_4 = L4_3
        L0_4(L1_4)
      end
      L10_3(L11_3)
    end
    L10_2.onSelect = L11_2
    L9_2[1] = L10_2
    L8_2 = L9_2
  else
    L9_2 = {}
    L10_2 = {}
    L10_2.name = "lootBankTruck"
    L10_2.icon = "fas fa-box-open"
    L10_2.label = "Loot Money"
    function L11_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3
      L1_3 = TriggerServerEvent
      L2_3 = "Pug:server:PlayerStartedLootingBankTruck"
      L1_3(L2_3)
      L1_3 = {}
      L2_3 = {}
      L2_3.total = 0
      L2_3.given = 0
      L2_3.type = "cash"
      L3_3 = L0_1
      if L3_3 then
        L3_3 = L0_1.rewardItem
        if L3_3 then
          L3_3 = pairs
          L4_3 = L0_1.rewardItem
          L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
          for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
            L9_3 = L8_3.name
            if L9_3 then
              L9_3 = L8_3.minAmount
              if L9_3 then
                L9_3 = L8_3.maxAmount
                if L9_3 then
                  L9_3 = tonumber
                  L10_3 = L8_3.minAmount
                  L9_3 = L9_3(L10_3)
                  L10_3 = tonumber
                  L11_3 = L8_3.maxAmount
                  L10_3 = L10_3(L11_3)
                  L11_3 = tonumber
                  L12_3 = L8_3.chance
                  L11_3 = L11_3(L12_3)
                  if not L11_3 then
                    L11_3 = 100
                  end
                  if L9_3 and L10_3 and L9_3 <= L10_3 then
                    L12_3 = math
                    L12_3 = L12_3.random
                    L13_3 = L9_3
                    L14_3 = L10_3
                    L12_3 = L12_3(L13_3, L14_3)
                    L13_3 = L8_3.name
                    L14_3 = {}
                    L14_3.total = L12_3
                    L14_3.given = 0
                    L14_3.chance = L11_3
                    L1_3[L13_3] = L14_3
                    L13_3 = math
                    L13_3 = L13_3.random
                    L14_3 = 1
                    L15_3 = 100
                    L13_3 = L13_3(L14_3, L15_3)
                    if L11_3 >= L13_3 then
                      L14_3 = L8_3.name
                      L14_3 = L1_3[L14_3]
                      L14_3.allowed = true
                    else
                      L14_3 = L8_3.name
                      L14_3 = L1_3[L14_3]
                      L14_3.allowed = false
                    end
                  else
                    L12_3 = Notify
                    L13_3 = Config
                    L13_3 = L13_3.T
                    L14_3 = "InvalidAmountOrChanceItem"
                    L15_3 = tostring
                    L16_3 = L8_3.name
                    L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3 = L15_3(L16_3)
                    L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3)
                    L14_3 = "error"
                    L12_3(L13_3, L14_3)
                  end
                end
              end
            end
          end
        end
      end
      L3_3 = L0_1
      if L3_3 then
        L3_3 = L0_1.rewardMoney
        if L3_3 then
          L3_3 = L0_1.rewardMoney
          L4_3 = L3_3.minAmount
          if L4_3 then
            L4_3 = L3_3.maxAmount
            if L4_3 then
              L4_3 = L3_3.type
              if L4_3 then
                L4_3 = tonumber
                L5_3 = L3_3.minAmount
                L4_3 = L4_3(L5_3)
                L5_3 = tonumber
                L6_3 = L3_3.maxAmount
                L5_3 = L5_3(L6_3)
                L6_3 = tostring
                L7_3 = L3_3.type
                L6_3 = L6_3(L7_3)
                if L4_3 and L5_3 and L4_3 <= L5_3 then
                  L7_3 = math
                  L7_3 = L7_3.random
                  L8_3 = L4_3
                  L9_3 = L5_3
                  L7_3 = L7_3(L8_3, L9_3)
                  L2_3.total = L7_3
                  L2_3.type = L6_3
                else
                  L7_3 = Notify
                  L8_3 = Config
                  L8_3 = L8_3.LangT
                  L8_3 = L8_3.InvalidMoneyConfiguration
                  L9_3 = "error"
                  L7_3(L8_3, L9_3)
                end
              end
            end
          end
        end
      end
      L3_3 = PlayerPedId
      L3_3 = L3_3()
      L4_3 = GetEntityCoords
      L5_3 = L3_3
      L4_3 = L4_3(L5_3)
      L5_3 = GetHashKey
      L6_3 = "hei_prop_heist_cash_pile"
      L5_3 = L5_3(L6_3)
      L6_3 = RequestModel
      L7_3 = L5_3
      L6_3(L7_3)
      while true do
        L6_3 = HasModelLoaded
        L7_3 = L5_3
        L6_3 = L6_3(L7_3)
        if L6_3 then
          break
        end
        L6_3 = Wait
        L7_3 = 10
        L6_3(L7_3)
      end
      L6_3 = CreateObject
      L7_3 = L5_3
      L8_3 = L4_3
      L9_3 = true
      L10_3 = true
      L11_3 = true
      L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
      L7_3 = SetEntityVisible
      L8_3 = L6_3
      L9_3 = false
      L10_3 = false
      L7_3(L8_3, L9_3, L10_3)
      L7_3 = AttachEntityToEntity
      L8_3 = L6_3
      L9_3 = L3_3
      L10_3 = GetPedBoneIndex
      L11_3 = L3_3
      L12_3 = 60309
      L10_3 = L10_3(L11_3, L12_3)
      L11_3 = 0.0
      L12_3 = 0.0
      L13_3 = 0.0
      L14_3 = 0.0
      L15_3 = 0.0
      L16_3 = 0.0
      L17_3 = false
      L18_3 = false
      L19_3 = false
      L20_3 = false
      L21_3 = 0
      L22_3 = true
      L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3)
      L7_3 = RequestAnimDict
      L8_3 = "anim@heists@ornate_bank@grab_cash_heels"
      L7_3(L8_3)
      while true do
        L7_3 = HasAnimDictLoaded
        L8_3 = "anim@heists@ornate_bank@grab_cash_heels"
        L7_3 = L7_3(L8_3)
        if L7_3 then
          break
        end
        L7_3 = Wait
        L8_3 = 50
        L7_3(L8_3)
      end
      L7_3 = TaskPlayAnim
      L8_3 = L3_3
      L9_3 = "anim@heists@ornate_bank@grab_cash_heels"
      L10_3 = "grab"
      L11_3 = 8.0
      L12_3 = -8.0
      L13_3 = -1
      L14_3 = 1
      L15_3 = 0
      L16_3 = false
      L17_3 = false
      L18_3 = false
      L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
      L7_3 = FreezeEntityPosition
      L8_3 = L3_3
      L9_3 = true
      L7_3(L8_3, L9_3)
      L7_3 = GetGameTimer
      L7_3 = L7_3()
      L8_3 = L17_1
      L8_3 = #L8_3
      L8_3 = L8_3 * 1000
      L9_3 = 1000
      L10_3 = GetGameTimer
      L10_3 = L10_3()
      L11_3 = CreateThread
      function L12_3()
        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4
        while true do
          L0_4 = GetGameTimer
          L0_4 = L0_4()
          L1_4 = L7_3
          L0_4 = L0_4 - L1_4
          L1_4 = L8_3
          if not (L0_4 < L1_4) then
            break
          end
          L0_4 = Wait
          L1_4 = 0
          L0_4(L1_4)
          L0_4 = DisableControlAction
          L1_4 = 0
          L2_4 = 73
          L3_4 = true
          L0_4(L1_4, L2_4, L3_4)
          L0_4 = GetGameTimer
          L0_4 = L0_4()
          L1_4 = HasAnimEventFired
          L2_4 = L3_3
          L3_4 = GetHashKey
          L4_4 = "CASH_APPEAR"
          L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4 = L3_4(L4_4)
          L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
          if L1_4 then
            L1_4 = IsEntityVisible
            L2_4 = L6_3
            L1_4 = L1_4(L2_4)
            if not L1_4 then
              L1_4 = SetEntityVisible
              L2_4 = L6_3
              L3_4 = true
              L4_4 = false
              L1_4(L2_4, L3_4, L4_4)
            end
          end
          L1_4 = HasAnimEventFired
          L2_4 = L3_3
          L3_4 = GetHashKey
          L4_4 = "RELEASE_CASH_DESTROY"
          L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4 = L3_4(L4_4)
          L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4)
          if L1_4 then
            L1_4 = IsEntityVisible
            L2_4 = L6_3
            L1_4 = L1_4(L2_4)
            if L1_4 then
              L1_4 = SetEntityVisible
              L2_4 = L6_3
              L3_4 = false
              L4_4 = false
              L1_4(L2_4, L3_4, L4_4)
            end
          end
          L1_4 = L10_3
          L1_4 = L0_4 - L1_4
          L2_4 = L9_3
          if L1_4 >= L2_4 then
            L10_3 = L0_4
            L1_4 = math
            L1_4 = L1_4.floor
            L2_4 = L7_3
            L2_4 = L0_4 - L2_4
            L3_4 = L9_3
            L2_4 = L2_4 / L3_4
            L1_4 = L1_4(L2_4)
            L1_4 = L1_4 + 1
            L2_4 = L17_1
            L2_4 = #L2_4
            if L1_4 <= L2_4 then
              L2_4 = TriggerServerEvent
              L3_4 = "Pug:server:DeleteMoneyProp"
              L4_4 = L1_4
              L2_4(L3_4, L4_4)
            end
            L2_4 = pairs
            L3_4 = L1_3
            L2_4, L3_4, L4_4, L5_4 = L2_4(L3_4)
            for L6_4, L7_4 in L2_4, L3_4, L4_4, L5_4 do
              L8_4 = L7_4.allowed
              if L8_4 then
                L8_4 = L7_4.total
                L9_4 = L7_4.given
                L8_4 = L8_4 - L9_4
                if L8_4 > 0 then
                  L9_4 = L8_3
                  L10_4 = L7_3
                  L10_4 = L0_4 - L10_4
                  L9_4 = L9_4 - L10_4
                  L10_4 = math
                  L10_4 = L10_4.ceil
                  L11_4 = L9_3
                  L11_4 = L9_4 / L11_4
                  L10_4 = L10_4(L11_4)
                  L11_4 = math
                  L11_4 = L11_4.max
                  L12_4 = L10_4
                  L13_4 = 1
                  L11_4 = L11_4(L12_4, L13_4)
                  L10_4 = L11_4
                  L11_4 = math
                  L11_4 = L11_4.ceil
                  L12_4 = L8_4 / L10_4
                  L11_4 = L11_4(L12_4)
                  L12_4 = math
                  L12_4 = L12_4.min
                  L13_4 = L11_4
                  L14_4 = L8_4
                  L12_4 = L12_4(L13_4, L14_4)
                  L11_4 = L12_4
                  L12_4 = L7_4.given
                  L12_4 = L12_4 + L11_4
                  L7_4.given = L12_4
                  TokenIsUseable = true
                  L12_4 = HandleItems
                  L13_4 = true
                  L14_4 = tostring
                  L15_4 = L6_4
                  L14_4 = L14_4(L15_4)
                  L15_4 = L11_4
                  L12_4(L13_4, L14_4, L15_4)
                  TokenIsUseable = false
                end
              end
            end
            L2_4 = L2_3.total
            if L2_4 > 0 then
              L2_4 = L2_3.given
              L3_4 = L2_3.total
              if L2_4 < L3_4 then
                L2_4 = L2_3.total
                L3_4 = L2_3.given
                L2_4 = L2_4 - L3_4
                L3_4 = L8_3
                L4_4 = L7_3
                L4_4 = L0_4 - L4_4
                L3_4 = L3_4 - L4_4
                L4_4 = math
                L4_4 = L4_4.ceil
                L5_4 = L9_3
                L5_4 = L3_4 / L5_4
                L4_4 = L4_4(L5_4)
                L5_4 = math
                L5_4 = L5_4.max
                L6_4 = L4_4
                L7_4 = 1
                L5_4 = L5_4(L6_4, L7_4)
                L4_4 = L5_4
                L5_4 = math
                L5_4 = L5_4.ceil
                L6_4 = L2_4 / L4_4
                L5_4 = L5_4(L6_4)
                L6_4 = math
                L6_4 = L6_4.min
                L7_4 = L5_4
                L8_4 = L2_4
                L6_4 = L6_4(L7_4, L8_4)
                L5_4 = L6_4
                L6_4 = L2_3.given
                L6_4 = L6_4 + L5_4
                L2_3.given = L6_4
                TokenIsUseable = true
                L6_4 = HandleMoney
                L7_4 = L2_3.type
                L8_4 = L5_4
                L6_4(L7_4, L8_4)
                TokenIsUseable = false
              end
            end
          end
        end
        L0_4 = DeleteObject
        L1_4 = L6_3
        L0_4(L1_4)
        L0_4 = ClearPedTasks
        L1_4 = L3_3
        L0_4(L1_4)
        L0_4 = FreezeEntityPosition
        L1_4 = L3_3
        L2_4 = false
        L0_4(L1_4, L2_4)
        L0_4 = SetModelAsNoLongerNeeded
        L1_4 = L5_3
        L0_4(L1_4)
      end
      L11_3(L12_3)
    end
    L10_2.action = L11_2
    L9_2[1] = L10_2
    L8_2 = L9_2
  end
  ::lbl_297::
  L9_2 = GetResourceState
  L10_2 = "RevoInteract"
  L9_2 = L9_2(L10_2)
  if "started" ~= L9_2 then
    L9_2 = Config
    L9_2 = L9_2.Target
    if L9_2 then
      L9_2 = Config
      L9_2 = L9_2.DrawTextInsteadOfTarget
      if not L9_2 then
        L9_2 = Config
        L9_2 = L9_2.Target
        if "ox_target" == L9_2 then
          L9_2 = exports
          L9_2 = L9_2.ox_target
          L10_2 = L9_2
          L9_2 = L9_2.addSphereZone
          L11_2 = {}
          L11_2.name = "lootBankTruckZone"
          L11_2.coords = A0_2
          L11_2.radius = 0.5
          L11_2.debug = false
          L11_2.options = L8_2
          L9_2(L10_2, L11_2)
        else
          L9_2 = exports
          L10_2 = Config
          L10_2 = L10_2.Target
          L9_2 = L9_2[L10_2]
          L10_2 = L9_2
          L9_2 = L9_2.AddCircleZone
          L11_2 = "lootBankTruckZone"
          L12_2 = A0_2
          L13_2 = 0.5
          L14_2 = {}
          L14_2.name = "lootBankTruckZone"
          L14_2.debugPoly = false
          L14_2.useZ = true
          L15_2 = {}
          L15_2.options = L8_2
          L15_2.distance = 1.5
          L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
        end
      end
    end
  end
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNetEvent
L19_1 = "Pug:client:RemoveBankTruckTarget"
function L20_1()
  local L0_2, L1_2, L2_2
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
        goto lbl_33
      end
    end
  end
  L0_2 = GetResourceState
  L1_2 = "RevoInteract"
  L0_2 = L0_2(L1_2)
  if "started" == L0_2 then
    L0_2 = exports
    L0_2 = L0_2.RevoInteract
    L1_2 = L0_2
    L0_2 = L0_2.CloseHelp
    L2_2 = "bankTruckTarget"
    L0_2(L1_2, L2_2)
    L0_2 = exports
    L0_2 = L0_2.RevoInteract
    L1_2 = L0_2
    L0_2 = L0_2.CloseHelp
    L2_2 = "LootBankTruck"
    L0_2(L1_2, L2_2)
  else
    L0_2 = HideTextOption
    L0_2()
    goto lbl_50
    ::lbl_33::
    L0_2 = Config
    L0_2 = L0_2.Target
    if "ox_target" == L0_2 then
      L0_2 = exports
      L0_2 = L0_2.ox_target
      L1_2 = L0_2
      L0_2 = L0_2.removeZone
      L2_2 = "lootBankTruckZone"
      L0_2(L1_2, L2_2)
    else
      L0_2 = exports
      L1_2 = Config
      L1_2 = L1_2.Target
      L0_2 = L0_2[L1_2]
      L1_2 = L0_2
      L0_2 = L0_2.RemoveZone
      L2_2 = "lootBankTruckZone"
      L0_2(L1_2, L2_2)
    end
  end
  ::lbl_50::
end
L18_1(L19_1, L20_1)
L18_1 = RegisterNetEvent
L19_1 = "Pug:client:DeleteMoneyProp"
function L20_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L17_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L2_2 = DoesEntityExist
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = DeleteObject
      L3_2 = L1_2
      L2_2(L3_2)
      L2_2 = L17_1
      L2_2[A0_2] = nil
    end
  end
  L2_2 = L17_1
  L2_2 = #L2_2
  if A0_2 >= L2_2 then
    L2_2 = Wait
    L3_2 = 700
    L2_2(L3_2)
    L2_2 = DeleteAllBankTruckProps
    L2_2()
  end
end
L18_1(L19_1, L20_1)
function L18_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = pairs
  L1_2 = L17_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = DeleteEntity
      L7_2 = L5_2
      L6_2(L7_2)
    end
  end
end
DeleteAllBankTruckProps = L18_1
L18_1 = AddEventHandler
L19_1 = "onResourceStop"
function L20_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = DeleteAllBankTruckProps
    L1_2()
    L1_2 = StopTabletEmote
    L1_2()
    L1_2 = RemoveBankTruckTarget
    L1_2()
  end
end
L18_1(L19_1, L20_1)
L18_1 = CreateThread
function L19_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  while true do
    L0_2 = 1000
    L1_2 = LocalPlayer
    L1_2 = L1_2.state
    L1_2 = L1_2.isLoggedIn
    L2_2 = Framework
    if "ESX" == L2_2 then
      L2_2 = FWork
      L1_2 = L2_2.PlayerLoaded
    end
    if L1_2 then
      L2_2 = L1_1
      if L2_2 then
        L0_2 = 100
        L2_2 = PlayerPedId
        L2_2 = L2_2()
        L3_2 = GetVehiclePedIsTryingToEnter
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        L4_2 = false
        if 0 ~= L3_2 then
          L5_2 = GetEntityModel
          L6_2 = L3_2
          L5_2 = L5_2(L6_2)
          L6_2 = GetHashKey
          L7_2 = "stockade"
          L6_2 = L6_2(L7_2)
          if L5_2 == L6_2 then
            L5_2 = SetVehicleDoorsLocked
            L6_2 = L3_2
            L7_2 = 4
            L5_2(L6_2, L7_2)
            L5_2 = ClearPedTasks
            L6_2 = PlayerPedId
            L6_2, L7_2 = L6_2()
            L5_2(L6_2, L7_2)
            L5_2 = Wait
            L6_2 = 500
            L5_2(L6_2)
          end
        end
      end
    end
    L2_2 = Wait
    L3_2 = L0_2
    L2_2(L3_2)
  end
end
L18_1(L19_1)
