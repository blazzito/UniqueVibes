local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = GetSoundId
L0_1 = L0_1()
L1_1 = 0
function L2_1(A0_2)
  local L1_2
  L1_2 = "ch_prop_gold_trolly_01a" == A0_2 or "ch_prop_cash_low_trolly_01a" == A0_2 or "ch_prop_diamond_trolly_01a" == A0_2 or "imp_prop_impexp_coke_trolly" == A0_2
  return L1_2
end
function L3_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = GetStackProps
  L1_2 = L1_2(L2_2)
  L1_2 = GetStackProps
  L2_2 = A0_2
  L1_2 = "function" == L1_2 and L1_2
  return L1_2
end
function L4_1(A0_2, A1_2)
  local L2_2, L3_2
  if A0_2 and A1_2 then
    L2_2 = A0_2._pugOriginalScenePropDeleted
    if not L2_2 then
      goto lbl_10
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_10::
  L2_2 = L2_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2 or nil
  L2_2 = A0_2 or L2_2
  if not A1_2 and A0_2 then
    L2_2 = A0_2.PropName
  end
  if "h4_prop_h4_safe_01a" == L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = L2_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = L3_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = true
  return L3_2
end
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L4_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    return
  end
  L2_2 = A0_2.DataObject
  if L2_2 then
    L2_2 = DoesEntityExist
    L3_2 = A0_2.DataObject
    L2_2 = L2_2(L3_2)
    if L2_2 then
      A0_2._pugOriginalScenePropDeleted = true
      L2_2 = A0_2.Coords
      if L2_2 then
        L2_2 = A0_2.RobberyName
        if L2_2 then
          L2_2 = TriggerEvent
          L3_2 = "Pug:client:DeleteRobberiesEntity"
          L4_2 = A0_2.Coords
          L5_2 = GetHashKey
          L6_2 = A1_2
          L5_2 = L5_2(L6_2)
          L6_2 = A0_2.RobberyName
          L7_2 = A0_2.Stage
          if L7_2 then
            L7_2 = A0_2.Stage
            L7_2 = L7_2.stepNumber
          end
          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
        end
      end
      L2_2 = DoesEntityExist
      L3_2 = A0_2.DataObject
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L2_2 = TriggerEvent
        L3_2 = "FullyDeleteRobberiesEntity"
        L4_2 = A0_2.DataObject
        L2_2(L3_2, L4_2)
      end
    end
  end
  L2_2 = A0_2.LocalOnly
  if not L2_2 then
    L2_2 = A0_2.Coords
    if L2_2 then
      L2_2 = A0_2.RobberyName
      if L2_2 then
        goto lbl_55
      end
    end
  end
  do return end
  ::lbl_55::
  A0_2._pugOriginalScenePropDeleted = true
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:server:DeleteRobberiesEntity"
  L4_2 = A0_2.Coords
  L5_2 = GetHashKey
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L6_2 = A0_2.RobberyName
  L7_2 = A0_2.Stage
  if L7_2 then
    L7_2 = A0_2.Stage
    L7_2 = L7_2.stepNumber
  end
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
function L7_1()
  local L0_2, L1_2
  L0_2 = L1_1
  L0_2 = L0_2 + 1
  L1_1 = L0_2
end
L8_1 = RegisterNetEvent
L9_1 = "Pug:client:StopRobberySceneKeepAlive"
function L10_1()
  local L0_2, L1_2
  L0_2 = L7_1
  L0_2()
end
L8_1(L9_1, L10_1)
function L8_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L5_2 = PlayerPedId
  L5_2 = L5_2()
  if not (A0_2 == L5_2 and A1_2) or not A2_2 then
    return
  end
  L5_2 = L1_1
  L5_2 = L5_2 + 1
  L1_1 = L5_2
  L5_2 = L1_1
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    L0_3 = loadAnimDict
    L1_3 = A1_2
    L0_3(L1_3)
    L0_3 = GetGameTimer
    L0_3 = L0_3()
    while true do
      L1_3 = L5_2
      L2_3 = L1_1
      if L1_3 ~= L2_3 then
        break
      end
      L1_3 = DoesEntityExist
      L2_3 = A0_2
      L1_3 = L1_3(L2_3)
      if not L1_3 then
        break
      end
      L1_3 = GetGameTimer
      L1_3 = L1_3()
      L1_3 = L1_3 - L0_3
      L2_3 = math
      L2_3 = L2_3.max
      L3_3 = A4_2
      if not L3_3 then
        L3_3 = 0
      end
      L4_3 = 1500
      L2_3 = L2_3(L3_3, L4_3)
      if not (L1_3 < L2_3) then
        break
      end
      L1_3 = IsEntityPlayingAnim
      L2_3 = A0_2
      L3_3 = A1_2
      L4_3 = A2_2
      L5_3 = 3
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)
      if not L1_3 then
        L1_3 = TaskPlayAnim
        L2_3 = A0_2
        L3_3 = A1_2
        L4_3 = A2_2
        L5_3 = 2.0
        L6_3 = 2.0
        L7_3 = 1500
        L8_3 = A3_2
        if not L8_3 then
          L8_3 = 1
        end
        L9_3 = 1.0
        L10_3 = false
        L11_3 = false
        L12_3 = false
        L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
      end
      L1_3 = Wait
      L2_3 = 500
      L1_3(L2_3)
    end
  end
  L6_2(L7_2)
end
function L9_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  L4_2 = math
  L4_2 = L4_2.max
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = 0
  end
  L6_2 = L6_2 + 2000
  L5_2 = L5_2(L6_2)
  L6_2 = 3000
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2 + L4_2
  L4_2 = A2_2 or L4_2
  if not A2_2 then
    L4_2 = 0.92
  end
  L5_2 = NetworkGetLocalSceneFromNetworkId
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if not L5_2 or -1 == L5_2 then
    L6_2 = Wait
    L7_2 = math
    L7_2 = L7_2.max
    L8_2 = math
    L8_2 = L8_2.floor
    L9_2 = A1_2 or L9_2
    if not A1_2 then
      L9_2 = 1000
    end
    L8_2 = L8_2(L9_2)
    L9_2 = 1000
    L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
    L6_2(L7_2, L8_2, L9_2)
    return
  end
  while true do
    L6_2 = GetGameTimer
    L6_2 = L6_2()
    if not (L3_2 > L6_2) then
      break
    end
    L6_2 = GetSynchronizedScenePhase
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L4_2 <= L6_2 then
      return
    end
    L7_2 = Wait
    L8_2 = 50
    L7_2(L8_2)
  end
end
L10_1 = CreateThread
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  while true do
    L0_2 = Config
    L0_2 = L0_2.RobberyAnimations
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 500
    L0_2(L1_2)
  end
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "h4_prop_h4_glass_disp_01b"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.h4_prop_h4_glass_disp_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01a"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01e"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01e = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01i"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01i = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01d"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01d = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01h"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01h = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01j"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01j = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01f"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01f = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01b"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01b = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01g"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01g = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "ch_prop_vault_painting_01c"
  L2_2 = {}
  L3_2 = {}
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_vault_painting_01c = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "des_jewel_cab_end"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "missheist_jewel"
  L3_2.AnimAction = "smash_case_d"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.8
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.SceneCam = "cam_smash_case_d"
  L3_2.CamAnim = L4_2
  L4_2 = {}
  L4_2.AttachWaitDuration = 0
  L4_2.TimeUntilFreezePropPosition = 0
  L4_2.PropBone = 60309
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.des_jewel_cab_start = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "des_jewel_cab2_end"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "missheist_jewel"
  L3_2.AnimAction = "smash_case_d"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.8
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.SceneCam = "cam_smash_case_d"
  L3_2.CamAnim = L4_2
  L4_2 = {}
  L4_2.AttachWaitDuration = 0
  L4_2.TimeUntilFreezePropPosition = 0
  L4_2.PropBone = 60309
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.des_jewel_cab2_start = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "des_jewel_cab3_end"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "missheist_jewel"
  L3_2.AnimAction = "smash_case_d"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.8
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.SceneCam = "cam_smash_case_d"
  L3_2.CamAnim = L4_2
  L4_2 = {}
  L4_2.AttachWaitDuration = 0
  L4_2.TimeUntilFreezePropPosition = 0
  L4_2.PropBone = 60309
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.des_jewel_cab3_start = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "des_jewel_cab4_end"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "missheist_jewel"
  L3_2.AnimAction = "smash_case_necklace_skull"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.8
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.SceneCam = "cam_smash_case_necklace_skull"
  L3_2.CamAnim = L4_2
  L4_2 = {}
  L4_2.AttachWaitDuration = 0
  L4_2.TimeUntilFreezePropPosition = 0
  L4_2.PropBone = 60309
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.des_jewel_cab4_start = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "tr_prop_tr_elecbox_01a"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig9_control_tower@male@"
  L3_2.AnimAction = "enter"
  L3_2.WaitTime = 3000
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "tr_prop_tr_elecbox_01a"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig9_control_tower@male@"
  L4_2.PropAnimation = "enter_electric_box"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig9_control_tower@male@"
  L3_2.AnimAction = "loop"
  L3_2.WaitTime = 7500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "tr_prop_tr_elecbox_01a"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig9_control_tower@male@"
  L4_2.PropAnimation = "loop_electric_box"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig9_control_tower@male@"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 1000
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.79
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "tr_prop_tr_elecbox_01a"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig9_control_tower@male@"
  L4_2.PropAnimation = "exit_electric_box"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.tr_prop_tr_elecbox_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "enter"
  L3_2.WaitTime = 6200
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "enter_bag"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "grab"
  L3_2.WaitTime = 8500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 5000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "grab_bag"
  L4_2.SecondProp = "h4_prop_h4_cash_stack_01a"
  L4_2.SecondPropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.SecondPropAnimation = "grab_cash"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 3500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.79
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "exit_bag"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.h4_prop_h4_cash_stack_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@gold@male@"
  L3_2.AnimAction = "enter"
  L3_2.WaitTime = 6200
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@gold@male@"
  L4_2.PropAnimation = "enter_bag"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@gold@male@"
  L3_2.AnimAction = "grab"
  L3_2.WaitTime = 7500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@gold@male@"
  L4_2.PropAnimation = "grab_bag"
  L4_2.SecondProp = "h4_prop_h4_gold_stack_01a"
  L4_2.SecondPropAnimationDict = "anim@scripted@heist@ig1_table_grab@gold@male@"
  L4_2.SecondPropAnimation = "grab_gold"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@gold@male@"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 3500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.79
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@gold@male@"
  L4_2.PropAnimation = "exit_bag"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.h4_prop_h4_gold_stack_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "enter"
  L3_2.WaitTime = 6200
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "enter_bag"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "grab"
  L3_2.WaitTime = 7500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "grab_bag"
  L4_2.SecondProp = "h4_prop_h4_weed_stack_01a"
  L4_2.SecondPropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.SecondPropAnimation = "grab_cash"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 3500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.79
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "exit_bag"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.h4_prop_h4_weed_stack_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "enter"
  L3_2.WaitTime = 6200
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "enter_bag"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "grab"
  L3_2.WaitTime = 7500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "grab_bag"
  L4_2.SecondProp = "h4_prop_h4_coke_stack_01a"
  L4_2.SecondPropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.SecondPropAnimation = "grab_cash"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 3500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.79
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig1_table_grab@cash@male@"
  L4_2.PropAnimation = "exit_bag"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.h4_prop_h4_coke_stack_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L3_2.AnimAction = "action_var_01"
  L3_2.WaitTime = 6200
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "ch_prop_ch_usb_drive01x"
  L4_2.PropAnimationDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L4_2.PropAnimation = "action_var_01_ch_prop_ch_usb_drive01x"
  L4_2.SecondProp = "prop_phone_ing"
  L4_2.SecondPropAnimationDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L4_2.SecondPropAnimation = "action_var_01_prop_phone_ing"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L3_2.AnimAction = "hack_loop_var_01"
  L3_2.WaitTime = 7500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "ch_prop_ch_usb_drive01x"
  L4_2.PropAnimationDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L4_2.PropAnimation = "hack_loop_var_01_ch_prop_ch_usb_drive01x"
  L4_2.SecondProp = "prop_phone_ing"
  L4_2.SecondPropAnimationDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L4_2.SecondPropAnimation = "hack_loop_var_01_prop_phone_ing"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L3_2.AnimAction = "success_react_exit_var_01"
  L3_2.WaitTime = 3500
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.79
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "ch_prop_ch_usb_drive01x"
  L4_2.PropAnimationDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L4_2.PropAnimation = "success_react_exit_var_01_ch_prop_ch_usb_drive01x"
  L4_2.SecondProp = "prop_phone_ing"
  L4_2.SecondPropAnimationDict = "anim_heist@hs3f@ig1_hack_keypad@arcade@male@"
  L4_2.SecondPropAnimation = "success_react_exit_var_01_prop_phone_ing"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_fingerprint_scanner_01e = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@hack"
  L3_2.AnimAction = "hack_enter"
  L3_2.WaitTime = 6200
  L3_2.XOffset = 0.01
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.PropAnimation = "hack_enter_bag"
  L4_2.SecondProp = "hei_prop_hst_laptop"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.SecondPropAnimation = "hack_enter_laptop"
  L4_2.ThirdProp = "hei_prop_heist_card_hack_02"
  L4_2.ThirdPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.ThirdPropAnimation = "hack_enter_card"
  L5_2 = {}
  L6_2 = 0.1
  L7_2 = 0.0
  L8_2 = 0.0
  L9_2 = -20.0
  L10_2 = -100.0
  L11_2 = -54.0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L4_2.ThirdPropPlacement = L5_2
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@hack"
  L3_2.AnimAction = "hack_loop"
  L3_2.WaitTime = 3500
  L3_2.XOffset = 0.01
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.PropAnimation = "hack_loop_bag"
  L4_2.SecondProp = "hei_prop_hst_laptop"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.SecondPropAnimation = "hack_loop_laptop"
  L4_2.ThirdProp = "hei_prop_heist_card_hack_02"
  L4_2.ThirdPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.ThirdPropAnimation = "hack_loop_card"
  L5_2 = {}
  L6_2 = 0.1
  L7_2 = 0.0
  L8_2 = 0.0
  L9_2 = -20.0
  L10_2 = -120.0
  L11_2 = -54.0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L4_2.ThirdPropPlacement = L5_2
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@hack"
  L3_2.AnimAction = "hack_exit"
  L3_2.WaitTime = 4500
  L3_2.XOffset = 0.09
  L3_2.YOffset = 0.79
  L3_2.ZOffset = 0.402
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.PropAnimation = "hack_exit_bag"
  L4_2.SecondProp = "hei_prop_hst_laptop"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.SecondPropAnimation = "hack_exit_laptop"
  L4_2.ThirdProp = "hei_prop_heist_card_hack_02"
  L4_2.ThirdPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.ThirdPropAnimation = "hack_exit_card"
  L5_2 = {}
  L6_2 = 0.1
  L7_2 = 0.0
  L8_2 = 0.0
  L9_2 = -20.0
  L10_2 = -100.0
  L11_2 = -54.0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L4_2.ThirdPropPlacement = L5_2
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.hei_prop_hei_securitypanel = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@hack"
  L3_2.AnimAction = "hack_enter"
  L3_2.WaitTime = 6200
  L3_2.XOffset = 0.01
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.PropAnimation = "hack_enter_bag"
  L4_2.SecondProp = "hei_prop_hst_laptop"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.SecondPropAnimation = "hack_enter_laptop"
  L4_2.ThirdProp = "hei_prop_heist_card_hack_02"
  L4_2.ThirdPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.ThirdPropAnimation = "hack_enter_card"
  L5_2 = {}
  L6_2 = 0.1
  L7_2 = 0.0
  L8_2 = 0.0
  L9_2 = -20.0
  L10_2 = -100.0
  L11_2 = -54.0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L4_2.ThirdPropPlacement = L5_2
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@hack"
  L3_2.AnimAction = "hack_loop"
  L3_2.WaitTime = 3500
  L3_2.XOffset = 0.01
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.PropAnimation = "hack_loop_bag"
  L4_2.SecondProp = "hei_prop_hst_laptop"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.SecondPropAnimation = "hack_loop_laptop"
  L4_2.ThirdProp = "hei_prop_heist_card_hack_02"
  L4_2.ThirdPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.ThirdPropAnimation = "hack_loop_card"
  L5_2 = {}
  L6_2 = 0.1
  L7_2 = 0.0
  L8_2 = 0.0
  L9_2 = -20.0
  L10_2 = -120.0
  L11_2 = -54.0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L4_2.ThirdPropPlacement = L5_2
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@hack"
  L3_2.AnimAction = "hack_exit"
  L3_2.WaitTime = 4500
  L3_2.XOffset = 0.09
  L3_2.YOffset = 0.79
  L3_2.ZOffset = 0.402
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.PropAnimation = "hack_exit_bag"
  L4_2.SecondProp = "hei_prop_hst_laptop"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.SecondPropAnimation = "hack_exit_laptop"
  L4_2.ThirdProp = "hei_prop_heist_card_hack_02"
  L4_2.ThirdPropAnimationDict = "anim@heists@ornate_bank@hack"
  L4_2.ThirdPropAnimation = "hack_exit_card"
  L5_2 = {}
  L6_2 = 0.1
  L7_2 = 0.0
  L8_2 = 0.0
  L9_2 = -20.0
  L10_2 = -100.0
  L11_2 = -54.0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L4_2.ThirdPropPlacement = L5_2
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.hei_v_ilev_bk_safegate_pris = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "h4_prop_h4_safe_01b"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig15_safe_crack@male@"
  L3_2.AnimAction = "enter_player"
  L3_2.WaitTime = 6200
  L3_2.XOffset = 0.01
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.SceneCam = "enter_cam"
  L3_2.CamAnim = L4_2
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "h4_prop_h4_safe_01a"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig15_safe_crack@male@"
  L4_2.PropAnimation = "enter_safe"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig15_safe_crack@male@"
  L3_2.AnimAction = "door_open_player"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.01
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.4
  L4_2 = {}
  L4_2.SceneCam = "door_open_cam"
  L3_2.CamAnim = L4_2
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "h4_prop_h4_safe_01a"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig15_safe_crack@male@"
  L4_2.PropAnimation = "door_open_safe"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.h4_prop_h4_safe_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "hei_prop_hei_cash_trolly_03"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "intro"
  L3_2.WaitTime = 1750
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_intro"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "grab"
  L3_2.WaitTime = 37000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_grab"
  L4_2.SecondProp = "ch_prop_cash_low_trolly_01a"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.SecondPropAnimation = "cart_cash_dissapear"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.5
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_exit"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_cash_low_trolly_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "hei_prop_hei_cash_trolly_03"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "intro"
  L3_2.WaitTime = 1750
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_intro"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "grab"
  L3_2.WaitTime = 37000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_grab"
  L4_2.SecondProp = "ch_prop_gold_trolly_01a"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.SecondPropAnimation = "cart_cash_dissapear"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.5
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_exit"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_gold_trolly_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "hei_prop_hei_cash_trolly_03"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "intro"
  L3_2.WaitTime = 1750
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_intro"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "grab"
  L3_2.WaitTime = 37000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_grab"
  L4_2.SecondProp = "ch_prop_diamond_trolly_01a"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.SecondPropAnimation = "cart_cash_dissapear"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.5
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_exit"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.ch_prop_diamond_trolly_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "hei_prop_hei_cash_trolly_03"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "intro"
  L3_2.WaitTime = 1750
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_intro"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "grab"
  L3_2.WaitTime = 37000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_grab"
  L4_2.SecondProp = "imp_prop_impexp_coke_trolly"
  L4_2.SecondPropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.SecondPropAnimation = "cart_cash_dissapear"
  L3_2.AnimationOptions = L4_2
  L2_2[2] = L3_2
  L3_2 = {}
  L3_2.AnimDict = "anim@heists@ornate_bank@grab_cash"
  L3_2.AnimAction = "exit"
  L3_2.WaitTime = 2000
  L3_2.XOffset = 0.5
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@heists@ornate_bank@grab_cash"
  L4_2.PropAnimation = "bag_exit"
  L3_2.AnimationOptions = L4_2
  L2_2[3] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.imp_prop_impexp_coke_trolly = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "p_chem_vial_02b_s"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "missfbi5ig_22"
  L3_2.AnimAction = "take_chemical_player0"
  L3_2.WaitTime = 1500
  L3_2.XOffset = -2.5
  L3_2.YOffset = 6.1
  L3_2.ZOffset = -1.0
  L4_2 = {}
  L4_2.SceneCam = "take_chemical_cam"
  L3_2.CamAnim = L4_2
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "prop_cs_vial_01"
  L4_2.PropAnimationDict = "missfbi5ig_22"
  L4_2.PropAnimation = "take_chemical_tube"
  L4_2.SecondProp = "p_chem_vial_02b_s"
  L4_2.SecondPropAnimationDict = "missfbi5ig_22"
  L4_2.SecondPropAnimation = "take_chemical_vial"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.p_chem_vial_02b_s = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "tr_prop_tr_container_01a"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
  L3_2.AnimAction = "action"
  L3_2.WaitTime = 10000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = -0.5
  L4_2 = {}
  L4_2.offsetX = 1.1
  L4_2.offsetY = -1.5
  L3_2.CamAnim = L4_2
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "tr_prop_tr_grinder_01a"
  L4_2.PropAnimationDict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
  L4_2.PropAnimation = "action_angle_grinder"
  L4_2.SecondProp = "hei_p_m_bag_var22_arm_s"
  L4_2.SecondPropAnimationDict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
  L4_2.SecondPropAnimation = "action_bag"
  L4_2.ThirdProp = "tr_prop_tr_container_01a"
  L4_2.ThirdPropAnimationDict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
  L4_2.ThirdPropAnimation = "action_container"
  L4_2.FourthProp = "tr_prop_tr_lock_01a"
  L4_2.FourthPropAnimationDict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
  L4_2.FourthPropAnimation = "action_lock"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.tr_prop_tr_container_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@player@mission@tun_bunk_ig1_hdd_server@male@"
  L3_2.AnimAction = "action"
  L3_2.WaitTime = 4000
  L3_2.XOffset = 0.0
  L3_2.YOffset = 0.0
  L3_2.ZOffset = 0.0
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 3000
  L4_2.PropBone = 60309
  L4_2.Prop = "ch_p_m_bag_var03_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@player@mission@tun_bunk_ig1_hdd_server@male@"
  L4_2.PropAnimation = "action_bag"
  L4_2.SecondProp = "prop_cs_server_drive"
  L4_2.SecondPropAnimationDict = "anim@scripted@player@mission@tun_bunk_ig1_hdd_server@male@"
  L4_2.SecondPropAnimation = "action_drive"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.xm_base_cia_server_01 = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "xm3_prop_xm3_crate_01b"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@player@mission@trn_ig1_loot@male@"
  L3_2.AnimAction = "loot"
  L3_2.WaitTime = 1000
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 1000
  L4_2.PropBone = 60309
  L4_2.Prop = "xm3_prop_xm3_crate_01a"
  L4_2.PropAnimationDict = "anim@scripted@player@mission@trn_ig1_loot@male@"
  L4_2.PropAnimation = "loot_crate"
  L4_2.SecondProp = "prop_money_bag_01"
  L4_2.SecondPropAnimationDict = "anim@scripted@player@mission@trn_ig1_loot@male@"
  L4_2.SecondPropAnimation = "loot_can"
  L4_2.ThirdProp = "w_me_crowbar"
  L4_2.ThirdPropAnimationDict = "anim@scripted@player@mission@trn_ig1_loot@male@"
  L4_2.ThirdPropAnimation = "loot_crowbar"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.xm3_prop_xm3_crate_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "h4_prop_h4_chain_lock_01a"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@heist@ig4_bolt_cutters@male@"
  L3_2.AnimAction = "action_male"
  L3_2.WaitTime = 1000
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 1000
  L4_2.PropBone = 60309
  L4_2.Prop = "h4_prop_h4_chain_lock_01a"
  L4_2.PropAnimationDict = "anim@scripted@heist@ig4_bolt_cutters@male@"
  L4_2.PropAnimation = "action_chain"
  L4_2.SecondProp = "hei_p_m_bag_var22_arm_s"
  L4_2.SecondPropAnimationDict = "anim@scripted@heist@ig4_bolt_cutters@male@"
  L4_2.SecondPropAnimation = "action_bag"
  L4_2.ThirdProp = "h4_prop_h4_bolt_cutter_01a"
  L4_2.ThirdPropAnimationDict = "anim@scripted@heist@ig4_bolt_cutters@male@"
  L4_2.ThirdPropAnimation = "action_cutter"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.h4_prop_h4_chain_lock_01a = L1_2
  L0_2 = Config
  L0_2 = L0_2.RobberyAnimations
  L1_2 = {}
  L1_2.ReplaceProp = "tr_prop_tr_adv_case_01a"
  L2_2 = {}
  L3_2 = {}
  L3_2.AnimDict = "anim@scripted@player@mission@tunf_conv_ig1_monyplate@male@"
  L3_2.AnimAction = "action"
  L3_2.WaitTime = 1000
  L3_2.XOffset = 0.2
  L3_2.YOffset = 0.85
  L3_2.ZOffset = 0.3
  L4_2 = {}
  L4_2.AttachWaitDuration = 1500
  L4_2.TimeUntilFreezePropPosition = 1000
  L4_2.PropBone = 60309
  L4_2.Prop = "hei_p_m_bag_var22_arm_s"
  L4_2.PropAnimationDict = "anim@scripted@player@mission@tunf_conv_ig1_monyplate@male@"
  L4_2.PropAnimation = "action_bag"
  L4_2.SecondProp = "tr_prop_tr_carry_box_01a"
  L4_2.SecondPropAnimationDict = "anim@scripted@player@mission@tunf_conv_ig1_monyplate@male@"
  L4_2.SecondPropAnimation = "action_carry_box"
  L4_2.ThirdProp = "tr_prop_tr_adv_case_01a"
  L4_2.ThirdPropAnimationDict = "anim@scripted@player@mission@tunf_conv_ig1_monyplate@male@"
  L4_2.ThirdPropAnimation = "action_case"
  L3_2.AnimationOptions = L4_2
  L2_2[1] = L3_2
  L1_2.NetworkedAnimations = L2_2
  L0_2.tr_prop_tr_adv_case_01a = L1_2
end
L10_1(L11_1)
function L10_1()
  local L0_2, L1_2, L2_2
  L0_2 = RequestAmbientAudioBank
  L1_2 = "DLC_HEIST_FLEECA_SOUNDSET"
  L2_2 = 0
  L0_2(L1_2, L2_2)
  L0_2 = RequestAmbientAudioBank
  L1_2 = "DLC_MPHEIST\\HEIST_FLEECA_DRILL"
  L2_2 = 0
  L0_2(L1_2, L2_2)
  L0_2 = RequestAmbientAudioBank
  L1_2 = "DLC_MPHEIST\\HEIST_FLEECA_DRILL_2"
  L2_2 = 0
  L0_2(L1_2, L2_2)
end
LoadDrillSounds = L10_1
function L10_1()
  local L0_2, L1_2
  L0_2 = ReleaseAmbientAudioBank
  L1_2 = "DLC_HEIST_FLEECA_SOUNDSET"
  L0_2(L1_2)
  L0_2 = ReleaseAmbientAudioBank
  L1_2 = "DLC_MPHEIST\\HEIST_FLEECA_DRILL"
  L0_2(L1_2)
  L0_2 = ReleaseAmbientAudioBank
  L1_2 = "DLC_MPHEIST\\HEIST_FLEECA_DRILL_2"
  L0_2(L1_2)
end
UnloadDrillSounds = L10_1
function L10_1(A0_2)
  local L1_2, L2_2
  L1_2 = HasNamedPtfxAssetLoaded
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    while true do
      L1_2 = HasNamedPtfxAssetLoaded
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      if L1_2 then
        break
      end
      L1_2 = RequestNamedPtfxAsset
      L2_2 = A0_2
      L1_2(L2_2)
      L1_2 = Wait
      L2_2 = 5
      L1_2(L2_2)
    end
  end
end
LoadPtfx = L10_1
function L10_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = A0_2.type
    if "robabble_object" == L1_2 then
      L1_2 = A0_2.delayRewardCheckbox
      if L1_2 then
        goto lbl_11
      end
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_11::
  L1_2 = tonumber
  L2_2 = A0_2.rewardDelayTime
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = 0
  end
  L1_2 = L1_2 > 0
  return L1_2
end
L11_1 = RegisterNetEvent
L12_1 = "Pug:client:DoRobberiesAnimation"
function L13_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2
  L5_2 = L7_1
  L5_2()
  if A3_2 then
    L5_2 = GetPaintingProps
    L6_2 = A3_2.PropName
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = TriggerEvent
      L6_2 = "Pug:client:DoPaintingAnimation"
      L7_2 = A0_2
      L8_2 = A1_2
      L9_2 = A2_2
      L10_2 = A3_2
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
      return
    else
      L5_2 = A3_2.PropName
      if "h4_prop_h4_glass_disp_01a" == L5_2 then
        L5_2 = TriggerEvent
        L6_2 = "Pug:client:DoGlassCaseAnimation"
        L7_2 = A0_2
        L8_2 = A1_2
        L9_2 = A2_2
        L10_2 = A3_2
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
        return
      end
    end
  end
  L5_2 = DestroyAllProps
  L5_2()
  L5_2 = 1
  L6_2 = 0
  L7_2 = 0
  L8_2 = -1
  L9_2 = nil
  L10_2 = Config
  L10_2 = L10_2.RobberyAnimations
  L10_2 = L10_2[A0_2]
  if L10_2 then
    L10_2 = Config
    L10_2 = L10_2.RobberyAnimations
    L9_2 = L10_2[A0_2]
  else
    L10_2 = Config
    L10_2 = L10_2.Animations
    L11_2 = tonumber
    L12_2 = A0_2
    L11_2 = L11_2(L12_2)
    L9_2 = L10_2[L11_2]
  end
  L10_2 = L9_2.IsNetWorkedScene
  if L10_2 and A2_2 then
    L10_2 = loadAnimDict
    L11_2 = L9_2.AnimDict
    L10_2(L11_2)
    L10_2 = 0.0
    L11_2 = 0.0
    L12_2 = 0.0
    L13_2 = L9_2.ZOffset
    if L13_2 then
      L10_2 = L9_2.ZOffset
      L11_2 = L9_2.YOffset
      L12_2 = L9_2.XOffset
    end
    L13_2 = GetEntityCoords
    L14_2 = A1_2
    L13_2 = L13_2(L14_2)
    L14_2 = GetEntityHeading
    L15_2 = PlayerPedId
    L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L15_2()
    L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
    L15_2 = math
    L15_2 = L15_2.rad
    L16_2 = L14_2
    L15_2 = L15_2(L16_2)
    L16_2 = math
    L16_2 = L16_2.cos
    L17_2 = L15_2
    L16_2 = L16_2(L17_2)
    L16_2 = -1.5 * L16_2
    L17_2 = math
    L17_2 = L17_2.sin
    L18_2 = L15_2
    L17_2 = L17_2(L18_2)
    L17_2 = 0.0 * L17_2
    L16_2 = L16_2 - L17_2
    L17_2 = math
    L17_2 = L17_2.sin
    L18_2 = L15_2
    L17_2 = L17_2(L18_2)
    L17_2 = -2.0 * L17_2
    L18_2 = math
    L18_2 = L18_2.cos
    L19_2 = L15_2
    L18_2 = L18_2(L19_2)
    L18_2 = 0.0 * L18_2
    L17_2 = L17_2 + L18_2
    L18_2 = vector3
    L19_2 = L13_2.x
    L19_2 = L19_2 + L16_2
    L20_2 = L13_2.y
    L20_2 = L20_2 + L17_2
    L21_2 = L13_2.z
    L21_2 = L21_2 + 0.1
    L18_2 = L18_2(L19_2, L20_2, L21_2)
    L19_2 = vector3
    L20_2 = 0.0
    L21_2 = 0.0
    L22_2 = L14_2 - 75.0
    L19_2 = L19_2(L20_2, L21_2, L22_2)
    L20_2 = L9_2.DoCustomCam
    if L20_2 then
      L20_2 = CreateCamera
      L21_2 = L18_2
      L22_2 = L19_2
      L23_2 = 1000
      L20_2(L21_2, L22_2, L23_2)
    end
    L20_2 = math
    L20_2 = L20_2.rad
    L21_2 = L14_2
    L20_2 = L20_2(L21_2)
    L21_2 = math
    L21_2 = L21_2.cos
    L22_2 = L20_2
    L21_2 = L21_2(L22_2)
    L21_2 = L12_2 * L21_2
    L22_2 = math
    L22_2 = L22_2.sin
    L23_2 = L20_2
    L22_2 = L22_2(L23_2)
    L22_2 = L11_2 * L22_2
    L21_2 = L21_2 - L22_2
    L22_2 = math
    L22_2 = L22_2.sin
    L23_2 = L20_2
    L22_2 = L22_2(L23_2)
    L22_2 = L12_2 * L22_2
    L23_2 = math
    L23_2 = L23_2.cos
    L24_2 = L20_2
    L23_2 = L23_2(L24_2)
    L23_2 = L11_2 * L23_2
    L22_2 = L22_2 + L23_2
    L23_2 = NetworkCreateSynchronisedScene
    L24_2 = vector3
    L25_2 = L13_2.x
    L25_2 = L25_2 + L21_2
    L26_2 = L13_2.y
    L26_2 = L26_2 + L22_2
    L27_2 = L13_2.z
    L27_2 = L27_2 + L10_2
    L24_2 = L24_2(L25_2, L26_2, L27_2)
    L25_2 = vector3
    L26_2 = 0.0
    L27_2 = 0.0
    L28_2 = L14_2
    L25_2 = L25_2(L26_2, L27_2, L28_2)
    L26_2 = 2
    L27_2 = false
    L28_2 = true
    L29_2 = 1065353216
    L30_2 = 0
    L31_2 = 1.3
    L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    L24_2 = NetworkAddPedToSynchronisedScene
    L25_2 = A1_2
    L26_2 = L23_2
    L27_2 = L9_2.AnimDict
    L28_2 = L9_2.AnimAction
    L29_2 = 1.5
    L30_2 = -4.0
    L31_2 = 1
    L32_2 = 1
    L33_2 = 1148846080
    L34_2 = 0
    L24_2(L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2)
    L24_2 = L9_2.AnimationOptions
    if L24_2 then
      L24_2 = L9_2.AnimationOptions
      L24_2 = L24_2.Prop
      L25_2 = L9_2.AnimationOptions
      L25_2 = L25_2.PropBone
      L26_2 = nil
      L27_2 = table
      L27_2 = L27_2.unpack
      L28_2 = L9_2.AnimationOptions
      L28_2 = L28_2.PropPlacement
      L27_2, L28_2, L29_2, L30_2, L31_2, L32_2 = L27_2(L28_2)
      PropPl6 = L32_2
      PropPl5 = L31_2
      PropPl4 = L30_2
      PropPl3 = L29_2
      PropPl2 = L28_2
      PropPl1 = L27_2
      L27_2 = L9_2.AnimationOptions
      L27_2 = L27_2.SecondProp
      if L27_2 then
        L27_2 = L9_2.AnimationOptions
        L27_2 = L27_2.SecondProp
        SecondPropName = L27_2
        L27_2 = L9_2.AnimationOptions
        L27_2 = L27_2.SecondPropBone
        SecondPropBone = L27_2
        L27_2 = table
        L27_2 = L27_2.unpack
        L28_2 = L9_2.AnimationOptions
        L28_2 = L28_2.SecondPropPlacement
        L27_2, L28_2, L29_2, L30_2, L31_2, L32_2 = L27_2(L28_2)
        SecondPropPl6 = L32_2
        SecondPropPl5 = L31_2
        SecondPropPl4 = L30_2
        SecondPropPl3 = L29_2
        SecondPropPl2 = L28_2
        SecondPropPl1 = L27_2
        L26_2 = true
        if A2_2 then
          L27_2 = L9_2.AnimAction
          if "thermal_charge" == L27_2 then
            L27_2 = A2_2.createExplosion
            if L27_2 then
              SecondPropName = "prop_c4_final_green"
            end
          end
        end
      end
      L27_2 = AddPropToPlayer
      L28_2 = L24_2
      L29_2 = L25_2
      L30_2 = PropPl1
      L31_2 = PropPl2
      L32_2 = PropPl3
      L33_2 = PropPl4
      L34_2 = PropPl5
      L35_2 = PropPl6
      L36_2 = A1_2
      L37_2 = true
      L27_2(L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
      L27_2 = GetGameTimer
      L27_2 = L27_2()
      while true do
        L28_2 = DoesEntityExist
        L29_2 = prop
        L28_2 = L28_2(L29_2)
        if L28_2 then
          break
        end
        L28_2 = GetGameTimer
        L28_2 = L28_2()
        L28_2 = L28_2 - L27_2
        L29_2 = 2000
        if not (L28_2 <= L29_2) then
          break
        end
        L28_2 = Wait
        L29_2 = 5
        L28_2(L29_2)
      end
      L28_2 = NetworkAddEntityToSynchronisedScene
      L29_2 = prop
      L30_2 = L23_2
      L31_2 = L9_2.AnimationOptions
      L31_2 = L31_2.PropAnimationDict
      L32_2 = L9_2.AnimationOptions
      L32_2 = L32_2.PropAnimation
      L33_2 = 4.0
      L34_2 = -8.0
      L35_2 = 1
      L28_2(L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
      if L26_2 then
        L28_2 = SecondPropName
        if "prop_c4_final_green" == L28_2 then
          L28_2 = table
          L28_2 = L28_2.unpack
          L29_2 = {}
          L30_2 = 0
          L31_2 = 0
          L32_2 = 0
          L33_2 = 90.0
          L34_2 = 170.0
          L35_2 = 0
          L29_2[1] = L30_2
          L29_2[2] = L31_2
          L29_2[3] = L32_2
          L29_2[4] = L33_2
          L29_2[5] = L34_2
          L29_2[6] = L35_2
          L28_2, L29_2, L30_2, L31_2, L32_2, L33_2 = L28_2(L29_2)
          SecondPropPl6 = L33_2
          SecondPropPl5 = L32_2
          SecondPropPl4 = L31_2
          SecondPropPl3 = L30_2
          SecondPropPl2 = L29_2
          SecondPropPl1 = L28_2
        end
        L28_2 = AddPropToPlayer
        L29_2 = SecondPropName
        L30_2 = SecondPropBone
        L31_2 = SecondPropPl1
        L32_2 = SecondPropPl2
        L33_2 = SecondPropPl3
        L34_2 = SecondPropPl4
        L35_2 = SecondPropPl5
        L36_2 = SecondPropPl6
        L37_2 = A1_2
        L28_2(L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
        L28_2 = GetGameTimer
        L28_2 = L28_2()
        while true do
          L29_2 = DoesEntityExist
          L30_2 = prop
          L29_2 = L29_2(L30_2)
          if L29_2 then
            break
          end
          L29_2 = GetGameTimer
          L29_2 = L29_2()
          L29_2 = L29_2 - L28_2
          L30_2 = 2000
          if not (L29_2 <= L30_2) then
            break
          end
          L29_2 = Wait
          L30_2 = 5
          L29_2(L30_2)
        end
        L29_2 = L9_2.AnimAction
        if "thermal_charge" == L29_2 then
          L29_2 = SetEntityVisible
          L30_2 = prop
          L31_2 = false
          L29_2(L30_2, L31_2)
        end
      end
      L28_2 = L9_2.AnimationOptions
      L28_2 = L28_2.AttachWaitDuration
      if L28_2 then
        L28_2 = L9_2.AnimationOptions
        L6_2 = L28_2.AttachWaitDuration
      end
      L28_2 = L9_2.AnimationOptions
      L28_2 = L28_2.TimeUntilFreezePropPosition
      if L28_2 then
        L28_2 = L9_2.AnimationOptions
        L7_2 = L28_2.TimeUntilFreezePropPosition
      end
    end
    L24_2 = NetworkStartSynchronisedScene
    L25_2 = L23_2
    L24_2(L25_2)
    L24_2 = L5_1
    L25_2 = A3_2
    L26_2 = L9_2.AnimationOptions
    if L26_2 then
      L26_2 = L9_2.AnimationOptions
      L26_2 = L26_2.Prop
    end
    L24_2 = L24_2(L25_2, L26_2)
    if L24_2 then
      L24_2 = L8_1
      L25_2 = A1_2
      L26_2 = L9_2.AnimDict
      L27_2 = L9_2.AnimAction
      L28_2 = L5_2
      L29_2 = math
      L29_2 = L29_2.max
      L30_2 = math
      L30_2 = L30_2.floor
      L31_2 = GetAnimDuration
      L32_2 = L9_2.AnimDict
      L33_2 = L9_2.AnimAction
      L31_2 = L31_2(L32_2, L33_2)
      L31_2 = L31_2 * 1000
      L30_2 = L30_2(L31_2)
      L31_2 = L6_2 + L7_2
      L31_2 = L31_2 + 1000
      L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L29_2(L30_2, L31_2)
      L24_2(L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
    end
    L24_2 = Wait
    L25_2 = L6_2
    L24_2(L25_2)
    L24_2 = L9_2.AnimAction
    if "thermal_charge" == L24_2 then
      L24_2 = SetEntityVisible
      L25_2 = prop
      L26_2 = true
      L24_2(L25_2, L26_2)
      L24_2 = SecondPropName
      if "prop_c4_final_green" == L24_2 then
        L24_2 = Wait
        L25_2 = 1000
        L24_2(L25_2)
      end
    end
    if not A2_2 then
      L24_2 = Wait
      L25_2 = 1000
      L24_2(L25_2)
    else
      if L7_2 > 0 then
        L24_2 = Wait
        L25_2 = L7_2
        L24_2(L25_2)
        L24_2 = DetachEntity
        L25_2 = prop
        L26_2 = 1
        L27_2 = 1
        L24_2(L25_2, L26_2, L27_2)
        L24_2 = FreezeEntityPosition
        L25_2 = prop
        L26_2 = true
        L24_2(L25_2, L26_2)
      end
      L24_2 = L9_2.AnimAction
      if "thermal_charge" == L24_2 then
        L24_2 = SetEntityVisible
        L25_2 = prop
        L26_2 = true
        L24_2(L25_2, L26_2)
        L24_2 = A2_2.createExplosion
        if not L24_2 then
          L24_2 = RequestNamedPtfxAsset
          L25_2 = "scr_ornate_heist"
          L24_2(L25_2)
          while true do
            L24_2 = HasNamedPtfxAssetLoaded
            L25_2 = "scr_ornate_heist"
            L24_2 = L24_2(L25_2)
            if L24_2 then
              break
            end
            L24_2 = Wait
            L25_2 = 5
            L24_2(L25_2)
          end
          L24_2 = SetPtfxAssetNextCall
          L25_2 = "scr_ornate_heist"
          L24_2(L25_2)
          L24_2 = StartParticleFxLoopedAtCoord
          L25_2 = "scr_heist_ornate_thermal_burn"
          L26_2 = vector3
          L27_2 = GetEntityCoords
          L28_2 = prop
          L27_2 = L27_2(L28_2)
          L27_2 = L27_2.x
          L28_2 = GetEntityCoords
          L29_2 = prop
          L28_2 = L28_2(L29_2)
          L28_2 = L28_2.y
          L28_2 = L28_2 - 1.5
          L29_2 = GetEntityCoords
          L30_2 = prop
          L29_2 = L29_2(L30_2)
          L29_2 = L29_2.z
          L29_2 = L29_2 + 0.1
          L26_2 = L26_2(L27_2, L28_2, L29_2)
          L27_2 = 0.0
          L28_2 = 0.0
          L29_2 = 0.0
          L30_2 = 1.5
          L31_2 = true
          L32_2 = true
          L33_2 = false
          L34_2 = false
          L24_2 = L24_2(L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2)
          L25_2 = GetGameTimer
          L25_2 = L25_2()
          L26_2 = Wait
          L27_2 = 1500
          L26_2(L27_2)
          L26_2 = ipairs
          L27_2 = PlayerProps
          L26_2, L27_2, L28_2, L29_2 = L26_2(L27_2)
          for L30_2, L31_2 in L26_2, L27_2, L28_2, L29_2 do
            L32_2 = GetEntityModel
            L33_2 = L31_2
            L32_2 = L32_2(L33_2)
            L33_2 = GetHashKey
            L34_2 = "hei_p_m_bag_var22_arm_s"
            L33_2 = L33_2(L34_2)
            if L32_2 == L33_2 then
              L32_2 = TriggerEvent
              L33_2 = "FullyDeleteRobberiesEntity"
              L34_2 = L31_2
              L32_2(L33_2, L34_2)
              L32_2 = table
              L32_2 = L32_2.remove
              L33_2 = PlayerProps
              L34_2 = L30_2
              L32_2(L33_2, L34_2)
              break
            end
          end
          L26_2 = L7_1
          L26_2()
          L26_2 = NetworkStopSynchronisedScene
          L27_2 = L23_2
          L26_2(L27_2)
          L26_2 = DestoryCamera
          L26_2()
          L26_2 = L10_1
          L27_2 = A2_2
          L26_2 = L26_2(L27_2)
          if L26_2 then
            L26_2 = math
            L26_2 = L26_2.ceil
            L27_2 = tonumber
            L28_2 = A2_2.rewardDelayTime
            L27_2 = L27_2(L28_2)
            if not L27_2 then
              L27_2 = 0
            end
            L27_2 = L27_2 * 1000
            L26_2 = L26_2(L27_2)
            L27_2 = GetGameTimer
            L27_2 = L27_2()
            L27_2 = L27_2 - L25_2
            L26_2 = L26_2 - L27_2
            if L26_2 > 0 then
              L27_2 = Wait
              L28_2 = L26_2
              L27_2(L28_2)
            end
          else
            L26_2 = A2_2.unlockTime
            if not L26_2 then
              L26_2 = 0
            end
            A2_2.unlockTime = L26_2
            L26_2 = type
            L27_2 = A2_2.unlockTime
            L26_2 = L26_2(L27_2)
            if "string" == L26_2 then
              L26_2 = tonumber
              L27_2 = A2_2.unlockTime
              L26_2 = L26_2(L27_2)
              A2_2.unlockTime = L26_2
            end
            L26_2 = A2_2.unlockTime
            if L26_2 then
              L26_2 = math
              L26_2 = L26_2.ceil
              L27_2 = A2_2.unlockTime
              L27_2 = L27_2 * 1000
              L26_2 = L26_2(L27_2)
              L27_2 = 3000
              if L26_2 > L27_2 then
                L26_2 = math
                L26_2 = L26_2.ceil
                L27_2 = A2_2.unlockTime
                L27_2 = L27_2 * 1000
                L26_2 = L26_2(L27_2)
                L26_2 = L26_2 - 3000
                A2_2.unlockTime = L26_2
              else
                L26_2 = math
                L26_2 = L26_2.ceil
                L27_2 = A2_2.unlockTime
                L27_2 = L27_2 * 1000
                L26_2 = L26_2(L27_2)
                A2_2.unlockTime = L26_2
              end
            end
            L26_2 = Wait
            L27_2 = A2_2.unlockTime
            L26_2(L27_2)
          end
          L26_2 = StopParticleFxLooped
          L27_2 = L24_2
          L28_2 = 0
          L26_2(L27_2, L28_2)
        end
      end
    end
    if A2_2 then
      L24_2 = A2_2.createExplosion
      if not L24_2 then
        goto lbl_610
      end
    end
    L24_2 = L7_1
    L24_2()
    ::lbl_610::
    L24_2 = DestoryCamera
    L24_2()
    L24_2 = SecondPropName
    if "prop_c4_final_green" ~= L24_2 then
      L24_2 = DestroyAllProps
      L24_2()
    else
      L24_2 = GetHashKey
      L25_2 = "hei_p_m_bag_var22_arm_s"
      L24_2 = L24_2(L25_2)
      L25_2 = GetHashKey
      L26_2 = "prop_c4_final_green"
      L25_2 = L25_2(L26_2)
      L26_2 = PlayerProps
      L26_2 = #L26_2
      L27_2 = 1
      L28_2 = -1
      for L29_2 = L26_2, L27_2, L28_2 do
        L30_2 = PlayerProps
        L30_2 = L30_2[L29_2]
        if L30_2 then
          L31_2 = DoesEntityExist
          L32_2 = L30_2
          L31_2 = L31_2(L32_2)
          if L31_2 then
            L31_2 = GetEntityModel
            L32_2 = L30_2
            L31_2 = L31_2(L32_2)
            if L31_2 == L24_2 then
              L31_2 = DeleteEntity
              L32_2 = L30_2
              L31_2(L32_2)
              L31_2 = table
              L31_2 = L31_2.remove
              L32_2 = PlayerProps
              L33_2 = L29_2
              L31_2(L32_2, L33_2)
          end
        end
        elseif L30_2 then
          L31_2 = DoesEntityExist
          L32_2 = L30_2
          L31_2 = L31_2(L32_2)
          if L31_2 then
            L31_2 = GetEntityModel
            L32_2 = L30_2
            L31_2 = L31_2(L32_2)
            if L31_2 == L25_2 then
              L31_2 = table
              L31_2 = L31_2.remove
              L32_2 = PlayerProps
              L33_2 = L29_2
              L31_2(L32_2, L33_2)
            end
          end
        end
      end
    end
    L24_2 = NetworkStopSynchronisedScene
    L25_2 = L23_2
    L24_2(L25_2)
  else
    L10_2 = L9_2.AnimationOptions
    if L10_2 then
      L10_2 = L9_2.AnimationOptions
      L10_2 = L10_2.EmoteMoving
      if L10_2 then
        L5_2 = 51
      end
      L10_2 = L9_2.AnimDict
      if nil ~= L10_2 then
        L10_2 = loadAnimDict
        L11_2 = L9_2.AnimDict
        L10_2(L11_2)
      end
      L10_2 = L9_2.AnimationOptions
      L10_2 = L10_2.Prop
      if not L10_2 then
        goto lbl_2052
      end
      L10_2 = L9_2.AnimationOptions
      L10_2 = L10_2.Prop
      L11_2 = L9_2.AnimationOptions
      L11_2 = L11_2.PropBone
      L12_2 = nil
      L13_2 = table
      L13_2 = L13_2.unpack
      L14_2 = L9_2.AnimationOptions
      L14_2 = L14_2.PropPlacement
      L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L13_2(L14_2)
      PropPl6 = L18_2
      PropPl5 = L17_2
      PropPl4 = L16_2
      PropPl3 = L15_2
      PropPl2 = L14_2
      PropPl1 = L13_2
      L13_2 = L9_2.AnimationOptions
      L13_2 = L13_2.SecondProp
      if L13_2 then
        L13_2 = L9_2.AnimationOptions
        L13_2 = L13_2.SecondProp
        SecondPropName = L13_2
        L13_2 = L9_2.AnimationOptions
        L13_2 = L13_2.SecondPropBone
        SecondPropBone = L13_2
        L13_2 = table
        L13_2 = L13_2.unpack
        L14_2 = L9_2.AnimationOptions
        L14_2 = L14_2.SecondPropPlacement
        L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L13_2(L14_2)
        SecondPropPl6 = L18_2
        SecondPropPl5 = L17_2
        SecondPropPl4 = L16_2
        SecondPropPl3 = L15_2
        SecondPropPl2 = L14_2
        SecondPropPl1 = L13_2
        L12_2 = true
      else
        L12_2 = false
      end
      L13_2 = L9_2.AnimationOptions
      L13_2 = L13_2.EmoteDuration
      if L13_2 then
        L13_2 = tonumber
        L14_2 = L9_2.AnimationOptions
        L14_2 = L14_2.EmoteDuration
        L13_2 = L13_2(L14_2)
        L8_2 = L13_2 or L8_2
        if not L13_2 then
        end
      end
      L13_2 = L9_2.AnimationOptions
      L13_2 = L13_2.AttachWaitDuration
      if L13_2 then
        L13_2 = L9_2.AnimationOptions
        L6_2 = L13_2.AttachWaitDuration
      end
      L13_2 = L9_2.AnimationOptions
      L13_2 = L13_2.TimeUntilFreezePropPosition
      if L13_2 then
        L13_2 = L9_2.AnimationOptions
        L7_2 = L13_2.TimeUntilFreezePropPosition
      end
      L13_2 = GetGameTimer
      L13_2 = L13_2()
      L14_2 = TaskPlayAnim
      L15_2 = A1_2
      L16_2 = L9_2.AnimDict
      L17_2 = L9_2.AnimAction
      L18_2 = 2.0
      L19_2 = 2.0
      L20_2 = L8_2
      L21_2 = L5_2
      L22_2 = 1.0
      L23_2 = 0
      L24_2 = 0
      L25_2 = 0
      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
      L14_2 = Wait
      L15_2 = L6_2
      L14_2(L15_2)
      L14_2 = L9_2.AnimAction
      if "thermal_charge" ~= L14_2 then
        L14_2 = AddPropToPlayer
        L15_2 = L10_2
        L16_2 = L11_2
        L17_2 = PropPl1
        L18_2 = PropPl2
        L19_2 = PropPl3
        L20_2 = PropPl4
        L21_2 = PropPl5
        L22_2 = PropPl6
        L23_2 = A1_2
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
      end
      if L12_2 then
        L14_2 = AddPropToPlayer
        L15_2 = SecondPropName
        L16_2 = SecondPropBone
        L17_2 = SecondPropPl1
        L18_2 = SecondPropPl2
        L19_2 = SecondPropPl3
        L20_2 = SecondPropPl4
        L21_2 = SecondPropPl5
        L22_2 = SecondPropPl6
        L23_2 = A1_2
        L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
      end
      L14_2 = GetGameTimer
      L14_2 = L14_2()
      while true do
        L15_2 = DoesEntityExist
        L16_2 = prop
        L15_2 = L15_2(L16_2)
        if L15_2 then
          break
        end
        L15_2 = GetGameTimer
        L15_2 = L15_2()
        L15_2 = L15_2 - L14_2
        L16_2 = 2000
        if not (L15_2 <= L16_2) then
          break
        end
        L15_2 = Wait
        L16_2 = 5
        L15_2(L16_2)
      end
      if L7_2 > 0 then
        L15_2 = Wait
        L16_2 = L7_2
        L15_2(L16_2)
        L15_2 = DetachEntity
        L16_2 = prop
        L17_2 = 1
        L18_2 = 1
        L15_2(L16_2, L17_2, L18_2)
        L15_2 = FreezeEntityPosition
        L16_2 = prop
        L17_2 = true
        L15_2(L16_2, L17_2)
        if not A2_2 then
          L15_2 = Wait
          L16_2 = 1000
          L15_2(L16_2)
        else
          L15_2 = nil
          if 6 == A0_2 then
            L16_2 = RequestNamedPtfxAsset
            L17_2 = "scr_ornate_heist"
            L16_2(L17_2)
            while true do
              L16_2 = HasNamedPtfxAssetLoaded
              L17_2 = "scr_ornate_heist"
              L16_2 = L16_2(L17_2)
              if L16_2 then
                break
              end
              L16_2 = Wait
              L17_2 = 5
              L16_2(L17_2)
            end
            L16_2 = SetPtfxAssetNextCall
            L17_2 = "scr_ornate_heist"
            L16_2(L17_2)
            L16_2 = StartParticleFxLoopedAtCoord
            L17_2 = "scr_heist_ornate_thermal_burn"
            L18_2 = vector3
            L19_2 = GetEntityCoords
            L20_2 = prop
            L19_2 = L19_2(L20_2)
            L19_2 = L19_2.x
            L20_2 = GetEntityCoords
            L21_2 = prop
            L20_2 = L20_2(L21_2)
            L20_2 = L20_2.y
            L21_2 = GetEntityCoords
            L22_2 = prop
            L21_2 = L21_2(L22_2)
            L21_2 = L21_2.z
            L21_2 = L21_2 + 0.1
            L18_2 = L18_2(L19_2, L20_2, L21_2)
            L19_2 = 0.0
            L20_2 = 0.0
            L21_2 = 0.0
            L22_2 = 0.05
            L23_2 = false
            L24_2 = false
            L25_2 = false
            L26_2 = false
            L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
            L15_2 = L16_2
            L16_2 = Wait
            L17_2 = 2000
            L16_2(L17_2)
          end
          L16_2 = ClearPedTasks
          L17_2 = PlayerPedId
          L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L17_2()
          L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
          L16_2 = type
          L17_2 = A2_2.unlockTime
          L16_2 = L16_2(L17_2)
          if "number" == L16_2 then
            L16_2 = Wait
            L17_2 = math
            L17_2 = L17_2.ceil
            L18_2 = A2_2.unlockTime
            L18_2 = L18_2 * 1000
            L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L17_2(L18_2)
            L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
          else
            L16_2 = Wait
            L17_2 = 1000
            L16_2(L17_2)
          end
          if L15_2 then
            L16_2 = StopParticleFxLooped
            L17_2 = L15_2
            L18_2 = 0
            L16_2(L17_2, L18_2)
          end
        end
        L15_2 = DestroyAllProps
        L15_2()
      else
        if L8_2 > 0 then
          L15_2 = GetGameTimer
          L15_2 = L15_2()
          L15_2 = L15_2 - L13_2
          L15_2 = L8_2 - L15_2
          if L15_2 > 0 then
            L16_2 = Wait
            L17_2 = L15_2
            L16_2(L17_2)
          end
        end
        L15_2 = ClearPedTasks
        L16_2 = PlayerPedId
        L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L16_2()
        L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
        if not A2_2 then
          L15_2 = Wait
          L16_2 = 1000
          L15_2(L16_2)
        else
          L15_2 = type
          L16_2 = A2_2.unlockTime
          L15_2 = L15_2(L16_2)
          if "number" == L15_2 then
            L15_2 = Wait
            L16_2 = math
            L16_2 = L16_2.ceil
            L17_2 = A2_2.unlockTime
            L17_2 = L17_2 * 1000
            L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L16_2(L17_2)
            L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
          else
            L15_2 = Wait
            L16_2 = 1000
            L15_2(L16_2)
          end
        end
      end
    else
      L10_2 = L9_2.NetworkedAnimations
      if L10_2 then
        L10_2 = math
        L10_2 = L10_2.max
        L11_2 = 1
        L12_2 = L9_2.NetworkedAnimations
        L12_2 = #L12_2
        L12_2 = L12_2 - 1
        L10_2 = L10_2(L11_2, L12_2)
        L11_2 = GetEntityCoords
        L12_2 = A1_2
        L11_2 = L11_2(L12_2)
        L12_2 = GetEntityHeading
        L13_2 = PlayerPedId
        L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L13_2()
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
        L13_2 = 1
        L14_2 = math
        L14_2 = L14_2.max
        L15_2 = 1
        L16_2 = L9_2.NetworkedAnimations
        L16_2 = #L16_2
        L16_2 = L16_2 - 1
        L14_2 = L14_2(L15_2, L16_2)
        L15_2 = 1
        for L16_2 = L13_2, L14_2, L15_2 do
          L17_2 = TryingHack
          if L17_2 or A4_2 then
            L17_2 = L9_2.NetworkedAnimations
            L17_2 = L17_2[L16_2]
            L17_2 = L17_2.ZOffset
            L18_2 = L9_2.NetworkedAnimations
            L18_2 = L18_2[L16_2]
            L18_2 = L18_2.YOffset
            L19_2 = L9_2.NetworkedAnimations
            L19_2 = L19_2[L16_2]
            L19_2 = L19_2.XOffset
            L20_2 = loadAnimDict
            L21_2 = L9_2.NetworkedAnimations
            L21_2 = L21_2[L16_2]
            L21_2 = L21_2.AnimDict
            L20_2(L21_2)
            L20_2 = math
            L20_2 = L20_2.rad
            L21_2 = L12_2
            L20_2 = L20_2(L21_2)
            L21_2 = math
            L21_2 = L21_2.cos
            L22_2 = L20_2
            L21_2 = L21_2(L22_2)
            L21_2 = L19_2 * L21_2
            L22_2 = math
            L22_2 = L22_2.sin
            L23_2 = L20_2
            L22_2 = L22_2(L23_2)
            L22_2 = L18_2 * L22_2
            L21_2 = L21_2 - L22_2
            L22_2 = math
            L22_2 = L22_2.sin
            L23_2 = L20_2
            L22_2 = L22_2(L23_2)
            L22_2 = L19_2 * L22_2
            L23_2 = math
            L23_2 = L23_2.cos
            L24_2 = L20_2
            L23_2 = L23_2(L24_2)
            L23_2 = L18_2 * L23_2
            L22_2 = L22_2 + L23_2
            L23_2 = 0.0
            if A3_2 then
              L24_2 = A3_2.PropName
              if "p_chem_vial_02b_s" == L24_2 then
                L23_2 = 180.0
              end
            end
            L24_2 = vector3
            L25_2 = L11_2.x
            L25_2 = L25_2 + L21_2
            L26_2 = L11_2.y
            L26_2 = L26_2 + L22_2
            L27_2 = L11_2.z
            L27_2 = L27_2 + L17_2
            L24_2 = L24_2(L25_2, L26_2, L27_2)
            L25_2 = vector3
            L26_2 = 0.0
            L27_2 = 0.0
            L28_2 = L12_2 + L23_2
            L25_2 = L25_2(L26_2, L27_2, L28_2)
            if A3_2 then
              L26_2 = A3_2.PropName
              if "p_chem_vial_02b_s" ~= L26_2 then
                L26_2 = A3_2.Coords
                L25_2 = A3_2.Rotation
                L24_2 = L26_2
              end
              L26_2 = A3_2.PropName
              if "xm_base_cia_server_01" == L26_2 then
                L26_2 = vector3
                L27_2 = A3_2.Coords
                L27_2 = L27_2.x
                L28_2 = A3_2.Coords
                L28_2 = L28_2.y
                L29_2 = A3_2.Coords
                L29_2 = L29_2.z
                L29_2 = L29_2 + 0.7
                L26_2 = L26_2(L27_2, L28_2, L29_2)
                L24_2 = L26_2
              else
                L26_2 = GetJewelryCases
                L27_2 = A3_2.PropName
                L26_2 = L26_2(L27_2)
                if L26_2 then
                  L26_2 = math
                  L26_2 = L26_2.rad
                  L27_2 = A3_2.Heading
                  L26_2 = L26_2(L27_2)
                  L27_2 = math
                  L27_2 = L27_2.cos
                  L28_2 = L26_2
                  L27_2 = L27_2(L28_2)
                  L27_2 = 0.0 * L27_2
                  L28_2 = math
                  L28_2 = L28_2.sin
                  L29_2 = L26_2
                  L28_2 = L28_2(L29_2)
                  L28_2 = -1.0 * L28_2
                  L27_2 = L27_2 - L28_2
                  L28_2 = math
                  L28_2 = L28_2.sin
                  L29_2 = L26_2
                  L28_2 = L28_2(L29_2)
                  L28_2 = 0.0 * L28_2
                  L29_2 = math
                  L29_2 = L29_2.cos
                  L30_2 = L26_2
                  L29_2 = L29_2(L30_2)
                  L29_2 = -1.0 * L29_2
                  L28_2 = L28_2 + L29_2
                  L29_2 = vector3
                  L30_2 = A3_2.Coords
                  L30_2 = L30_2.x
                  L30_2 = L30_2 + L27_2
                  L31_2 = A3_2.Coords
                  L31_2 = L31_2.y
                  L31_2 = L31_2 + L28_2
                  L32_2 = A3_2.Coords
                  L32_2 = L32_2.z
                  L32_2 = L32_2 - 0.5
                  L29_2 = L29_2(L30_2, L31_2, L32_2)
                  L24_2 = L29_2
                  L29_2 = A3_2.PropName
                  if "des_jewel_cab4_start" == L29_2 then
                    L29_2 = math
                    L29_2 = L29_2.cos
                    L30_2 = L26_2
                    L29_2 = L29_2(L30_2)
                    L29_2 = 1.0 * L29_2
                    L30_2 = math
                    L30_2 = L30_2.sin
                    L31_2 = L26_2
                    L30_2 = L30_2(L31_2)
                    L30_2 = -0.1 * L30_2
                    L27_2 = L29_2 - L30_2
                    L29_2 = math
                    L29_2 = L29_2.sin
                    L30_2 = L26_2
                    L29_2 = L29_2(L30_2)
                    L29_2 = 1.0 * L29_2
                    L30_2 = math
                    L30_2 = L30_2.cos
                    L31_2 = L26_2
                    L30_2 = L30_2(L31_2)
                    L30_2 = -0.1 * L30_2
                    L28_2 = L29_2 + L30_2
                    L29_2 = vector3
                    L30_2 = A3_2.Coords
                    L30_2 = L30_2.x
                    L30_2 = L30_2 + L27_2
                    L31_2 = A3_2.Coords
                    L31_2 = L31_2.y
                    L31_2 = L31_2 + L28_2
                    L32_2 = A3_2.Coords
                    L32_2 = L32_2.z
                    L32_2 = L32_2 - 0.5
                    L29_2 = L29_2(L30_2, L31_2, L32_2)
                    L24_2 = L29_2
                    L29_2 = vector3
                    L30_2 = L25_2.x
                    L31_2 = L25_2.y
                    L32_2 = L25_2.z
                    L32_2 = L32_2 + 80.0
                    L29_2 = L29_2(L30_2, L31_2, L32_2)
                    L25_2 = L29_2
                  end
                  L29_2 = PlaySoundFromCoord
                  L30_2 = -1
                  L31_2 = "Glass_Smash"
                  L32_2 = A3_2.Coords
                  L33_2 = 0
                  L34_2 = 0
                  L35_2 = 0
                  L29_2(L30_2, L31_2, L32_2, L33_2, L34_2, L35_2)
                  while true do
                    L29_2 = HasNamedPtfxAssetLoaded
                    L30_2 = "scr_jewelheist"
                    L29_2 = L29_2(L30_2)
                    if L29_2 then
                      break
                    end
                    L29_2 = RequestNamedPtfxAsset
                    L30_2 = "scr_jewelheist"
                    L29_2(L30_2)
                    L29_2 = Wait
                    L30_2 = 50
                    L29_2(L30_2)
                  end
                  L29_2 = SetPtfxAssetNextCall
                  L30_2 = "scr_jewelheist"
                  L29_2(L30_2)
                  L29_2 = StartNetworkedParticleFxNonLoopedAtCoord
                  L30_2 = "scr_jewel_cab_smash"
                  L31_2 = A3_2.Coords
                  L32_2 = 0.0
                  L33_2 = 0.0
                  L34_2 = 0.0
                  L35_2 = 2.0
                  L36_2 = 0
                  L37_2 = 0
                  L38_2 = 0
                  L29_2(L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2)
                  if A3_2 then
                    L29_2 = A3_2.LocalOnly
                    if L29_2 then
                      L29_2 = TriggerEvent
                      L30_2 = "Pug:client:CreateSyncedProps"
                      L31_2 = A3_2.Coords
                      L32_2 = A3_2.Rotation
                      L33_2 = L9_2.NetworkedAnimations
                      L33_2 = L33_2[1]
                      L33_2 = L33_2.AnimDict
                      L34_2 = A3_2.RobberyName
                      L35_2 = A3_2.PropName
                      L36_2 = A3_2
                      L29_2(L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2)
                  end
                  else
                    L29_2 = TriggerServerEvent
                    L30_2 = "Pug:server:CreateSyncedProps"
                    L31_2 = A3_2.Coords
                    L32_2 = A3_2.Rotation
                    L33_2 = L9_2.NetworkedAnimations
                    L33_2 = L33_2[1]
                    L33_2 = L33_2.AnimDict
                    L34_2 = A3_2.RobberyName
                    L35_2 = A3_2.PropName
                    L36_2 = A3_2
                    L29_2(L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2)
                  end
                end
              end
            end
            L26_2 = false
            L27_2 = true
            if 2 == L16_2 then
              L28_2 = L9_2.NetworkedAnimations
              L28_2 = L28_2[L16_2]
              L28_2 = L28_2.AnimAction
              if "drill_straight_fail" == L28_2 then
                L28_2 = L9_2.NetworkedAnimations
                L28_2 = L28_2[L16_2]
                L28_2 = L28_2.AnimationOptions
                L28_2 = L28_2.SecondProp
                if "hei_prop_heist_drill" == L28_2 then
                  L26_2 = true
                  L27_2 = false
                end
              end
            end
            L28_2 = NetworkCreateSynchronisedScene
            L29_2 = L24_2
            L30_2 = L25_2
            L31_2 = 2
            L32_2 = L27_2
            L33_2 = L26_2
            L34_2 = 1065353216
            L35_2 = 0
            L36_2 = 1.3
            L28_2 = L28_2(L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2)
            L29_2 = nil
            L30_2 = NetworkAddPedToSynchronisedScene
            L31_2 = A1_2
            L32_2 = L28_2
            L33_2 = L9_2.NetworkedAnimations
            L33_2 = L33_2[L16_2]
            L33_2 = L33_2.AnimDict
            L34_2 = L9_2.NetworkedAnimations
            L34_2 = L34_2[L16_2]
            L34_2 = L34_2.AnimAction
            L35_2 = 0
            L36_2 = 0
            L37_2 = 0
            L38_2 = 16
            L39_2 = 1148846080
            L40_2 = 0
            L30_2(L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2)
            L30_2 = L9_2.NetworkedAnimations
            L30_2 = L30_2[L16_2]
            L30_2 = L30_2.AnimationOptions
            if L30_2 then
              L30_2 = L9_2.NetworkedAnimations
              L30_2 = L30_2[L16_2]
              L30_2 = L30_2.AnimationOptions
              L30_2 = L30_2.Prop
              if L30_2 then
                L30_2 = L9_2.NetworkedAnimations
                L30_2 = L30_2[L16_2]
                L30_2 = L30_2.AnimationOptions
                L30_2 = L30_2.Prop
                L31_2 = nil
                L32_2 = table
                L32_2 = L32_2.unpack
                L33_2 = {}
                L34_2 = 0
                L35_2 = 0
                L36_2 = 0
                L37_2 = 0
                L38_2 = 0
                L33_2[1] = L34_2
                L33_2[2] = L35_2
                L33_2[3] = L36_2
                L33_2[4] = L37_2
                L33_2[5] = L38_2
                L32_2, L33_2, L34_2, L35_2, L36_2, L37_2 = L32_2(L33_2)
                PropPl6 = L37_2
                PropPl5 = L36_2
                PropPl4 = L35_2
                PropPl3 = L34_2
                PropPl2 = L33_2
                PropPl1 = L32_2
                L32_2 = AddPropToPlayer
                L33_2 = L30_2
                L34_2 = PropBone
                L35_2 = PropPl1
                L36_2 = PropPl2
                L37_2 = PropPl3
                L38_2 = PropPl4
                L39_2 = PropPl5
                L40_2 = PropPl6
                L41_2 = A1_2
                L42_2 = true
                L32_2(L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2)
                L32_2 = GetGameTimer
                L32_2 = L32_2()
                while true do
                  L33_2 = DoesEntityExist
                  L34_2 = prop
                  L33_2 = L33_2(L34_2)
                  if L33_2 then
                    break
                  end
                  L33_2 = GetGameTimer
                  L33_2 = L33_2()
                  L33_2 = L33_2 - L32_2
                  L34_2 = 2000
                  if not (L33_2 <= L34_2) then
                    break
                  end
                  L33_2 = Wait
                  L34_2 = 10
                  L33_2(L34_2)
                end
                L33_2 = NetworkAddEntityToSynchronisedScene
                L34_2 = prop
                L35_2 = L28_2
                L36_2 = L9_2.NetworkedAnimations
                L36_2 = L36_2[L16_2]
                L36_2 = L36_2.AnimationOptions
                L36_2 = L36_2.PropAnimationDict
                L37_2 = L9_2.NetworkedAnimations
                L37_2 = L37_2[L16_2]
                L37_2 = L37_2.AnimationOptions
                L37_2 = L37_2.PropAnimation
                L38_2 = 4.0
                L39_2 = -8.0
                L40_2 = 1
                L33_2(L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2)
                if 1 == L16_2 then
                  L33_2 = L9_2.NetworkedAnimations
                  L33_2 = L33_2[L16_2]
                  L33_2 = L33_2.AnimAction
                  if "action" == L33_2 then
                    L33_2 = L9_2.NetworkedAnimations
                    L33_2 = L33_2[L16_2]
                    L33_2 = L33_2.AnimationOptions
                    L33_2 = L33_2.Prop
                    if "tr_prop_tr_grinder_01a" == L33_2 then
                      L33_2 = CreateThread
                      function L34_2()
                        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3
                        L0_3 = Wait
                        L1_3 = 2000
                        L0_3(L1_3)
                        L0_3 = LoadDrillSounds
                        L0_3()
                        L0_3 = PlaySoundFromEntity
                        L1_3 = L0_1
                        L2_3 = "Drill"
                        L3_3 = prop
                        L4_3 = "DLC_HEIST_FLEECA_SOUNDSET"
                        L5_3 = 1
                        L6_3 = 0
                        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
                        L0_3 = LoadPtfx
                        L1_3 = "scr_tn_tr"
                        L0_3(L1_3)
                        L0_3 = UseParticleFxAssetNextCall
                        L1_3 = "scr_tn_tr"
                        L0_3(L1_3)
                        L0_3 = Wait
                        L1_3 = 1000
                        L0_3(L1_3)
                        L0_3 = StartParticleFxLoopedOnEntity
                        L1_3 = "scr_tn_tr_angle_grinder_sparks"
                        L2_3 = prop
                        L3_3 = -0.2
                        L4_3 = 0.0
                        L5_3 = 0.1
                        L6_3 = 0.0
                        L7_3 = 0.0
                        L8_3 = 0.0
                        L9_3 = 1.0
                        L10_3 = false
                        L11_3 = false
                        L12_3 = false
                        L13_3 = 1065353216
                        L14_3 = 1065353216
                        L15_3 = 1065353216
                        L16_3 = 1
                        L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
                        L1_3 = Wait
                        L2_3 = 1000
                        L1_3(L2_3)
                        L1_3 = StopParticleFxLooped
                        L2_3 = L0_3
                        L3_3 = 1
                        L1_3(L2_3, L3_3)
                        L1_3 = UnloadDrillSounds
                        L1_3()
                        L1_3 = StopSound
                        L2_3 = L0_1
                        L1_3(L2_3)
                      end
                      L33_2(L34_2)
                    end
                  end
                end
              end
              L30_2 = L9_2.NetworkedAnimations
              L30_2 = L30_2[L16_2]
              L30_2 = L30_2.AnimationOptions
              L30_2 = L30_2.SecondProp
              if L30_2 then
                L30_2 = L9_2.NetworkedAnimations
                L30_2 = L30_2[L16_2]
                L30_2 = L30_2.AnimationOptions
                L30_2 = L30_2.SecondProp
                L31_2 = table
                L31_2 = L31_2.unpack
                L32_2 = {}
                L33_2 = 0
                L34_2 = 0
                L35_2 = 0
                L36_2 = 0
                L37_2 = 0
                L32_2[1] = L33_2
                L32_2[2] = L34_2
                L32_2[3] = L35_2
                L32_2[4] = L36_2
                L32_2[5] = L37_2
                L31_2, L32_2, L33_2, L34_2, L35_2, L36_2 = L31_2(L32_2)
                L37_2 = AddPropToPlayer
                L38_2 = L30_2
                L39_2 = SecondPropBone
                L40_2 = L31_2
                L41_2 = L32_2
                L42_2 = L33_2
                L43_2 = L34_2
                L44_2 = L35_2
                L45_2 = L36_2
                L46_2 = A1_2
                L47_2 = true
                L37_2(L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
                L37_2 = GetGameTimer
                L37_2 = L37_2()
                while true do
                  L38_2 = DoesEntityExist
                  L39_2 = prop
                  L38_2 = L38_2(L39_2)
                  if L38_2 then
                    break
                  end
                  L38_2 = GetGameTimer
                  L38_2 = L38_2()
                  L38_2 = L38_2 - L37_2
                  L39_2 = 2000
                  if not (L38_2 <= L39_2) then
                    break
                  end
                  L38_2 = Wait
                  L39_2 = 10
                  L38_2(L39_2)
                end
                if 2 == L16_2 then
                  L38_2 = L9_2.NetworkedAnimations
                  L38_2 = L38_2[L16_2]
                  L38_2 = L38_2.AnimAction
                  if "drill_straight_fail" == L38_2 then
                    L38_2 = L9_2.NetworkedAnimations
                    L38_2 = L38_2[L16_2]
                    L38_2 = L38_2.AnimationOptions
                    L38_2 = L38_2.SecondProp
                    if "hei_prop_heist_drill" == L38_2 then
                      L38_2 = LoadDrillSounds
                      L38_2()
                      L38_2 = PlaySoundFromEntity
                      L39_2 = L0_1
                      L40_2 = "Drill"
                      L41_2 = prop
                      L42_2 = "DLC_HEIST_FLEECA_SOUNDSET"
                      L43_2 = 1
                      L44_2 = 0
                      L38_2(L39_2, L40_2, L41_2, L42_2, L43_2, L44_2)
                      L38_2 = CreateThread
                      function L39_2()
                        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
                        L0_3 = LoadPtfx
                        L1_3 = "core"
                        L0_3(L1_3)
                        while true do
                          L0_3 = TryingHack
                          if not L0_3 then
                            break
                          end
                          L0_3 = UseParticleFxAssetNextCall
                          L1_3 = "core"
                          L0_3(L1_3)
                          L0_3 = GetEntityForwardVector
                          L1_3 = prop
                          L0_3 = L0_3(L1_3)
                          L1_3 = table
                          L1_3 = L1_3.unpack
                          L2_3 = GetEntityCoords
                          L3_3 = prop
                          L2_3 = L2_3(L3_3)
                          L3_3 = L0_3 * 0.7
                          L2_3 = L2_3 - L3_3
                          L1_3, L2_3, L3_3 = L1_3(L2_3)
                          L4_3 = StartNetworkedParticleFxNonLoopedAtCoord
                          L5_3 = "ent_brk_sparking_wires"
                          L6_3 = L1_3
                          L7_3 = L2_3
                          L8_3 = L3_3
                          L9_3 = 0.0
                          L10_3 = 0.0
                          L11_3 = GetEntityHeading
                          L12_3 = PlayerPedId
                          L12_3, L13_3, L14_3, L15_3 = L12_3()
                          L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3)
                          L11_3 = L11_3 - 180.0
                          L12_3 = 1.0
                          L13_3 = 0.0
                          L14_3 = 0.0
                          L15_3 = 0.0
                          L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
                          L5_3 = Wait
                          L6_3 = 600
                          L5_3(L6_3)
                        end
                        L0_3 = UnloadDrillSounds
                        L0_3()
                        L0_3 = StopSound
                        L1_3 = L0_1
                        L0_3(L1_3)
                      end
                      L38_2(L39_2)
                    end
                  end
                end
                L38_2 = NetworkAddEntityToSynchronisedScene
                L39_2 = prop
                L40_2 = L28_2
                L41_2 = L9_2.NetworkedAnimations
                L41_2 = L41_2[L16_2]
                L41_2 = L41_2.AnimationOptions
                L41_2 = L41_2.SecondPropAnimationDict
                L42_2 = L9_2.NetworkedAnimations
                L42_2 = L42_2[L16_2]
                L42_2 = L42_2.AnimationOptions
                L42_2 = L42_2.SecondPropAnimation
                L43_2 = 4.0
                L44_2 = -8.0
                L45_2 = 1
                L38_2(L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2)
                if A3_2 then
                  L38_2 = A3_2.PropName
                  if L30_2 == L38_2 then
                    L38_2 = L4_1
                    L39_2 = A3_2
                    L40_2 = L30_2
                    L38_2 = L38_2(L39_2, L40_2)
                    if L38_2 then
                      L29_2 = L30_2
                    end
                  end
                end
              end
              L30_2 = L9_2.NetworkedAnimations
              L30_2 = L30_2[L16_2]
              L30_2 = L30_2.AnimationOptions
              L30_2 = L30_2.ThirdProp
              if L30_2 then
                L30_2 = table
                L30_2 = L30_2.unpack
                L31_2 = {}
                L32_2 = 0
                L33_2 = 0
                L34_2 = 0
                L35_2 = 0
                L36_2 = 0
                L31_2[1] = L32_2
                L31_2[2] = L33_2
                L31_2[3] = L34_2
                L31_2[4] = L35_2
                L31_2[5] = L36_2
                L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L30_2(L31_2)
                L36_2 = AddPropToPlayer
                L37_2 = L9_2.NetworkedAnimations
                L37_2 = L37_2[L16_2]
                L37_2 = L37_2.AnimationOptions
                L37_2 = L37_2.ThirdProp
                L38_2 = L30_2
                L39_2 = L31_2
                L40_2 = L32_2
                L41_2 = L33_2
                L42_2 = L34_2
                L43_2 = L35_2
                L44_2 = A1_2
                L45_2 = true
                L36_2(L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2)
                L36_2 = SetEntityCollision
                L37_2 = prop
                L38_2 = false
                L39_2 = true
                L36_2(L37_2, L38_2, L39_2)
                L36_2 = GetGameTimer
                L36_2 = L36_2()
                while true do
                  L37_2 = DoesEntityExist
                  L38_2 = prop
                  L37_2 = L37_2(L38_2)
                  if L37_2 then
                    break
                  end
                  L37_2 = GetGameTimer
                  L37_2 = L37_2()
                  L37_2 = L37_2 - L36_2
                  L38_2 = 2000
                  if not (L37_2 <= L38_2) then
                    break
                  end
                  L37_2 = Wait
                  L38_2 = 10
                  L37_2(L38_2)
                end
                L37_2 = NetworkAddEntityToSynchronisedScene
                L38_2 = prop
                L39_2 = L28_2
                L40_2 = L9_2.NetworkedAnimations
                L40_2 = L40_2[L16_2]
                L40_2 = L40_2.AnimationOptions
                L40_2 = L40_2.ThirdPropAnimationDict
                L41_2 = L9_2.NetworkedAnimations
                L41_2 = L41_2[L16_2]
                L41_2 = L41_2.AnimationOptions
                L41_2 = L41_2.ThirdPropAnimation
                L42_2 = 4.0
                L43_2 = -8.0
                L44_2 = 1
                L37_2(L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2)
              end
              L30_2 = L9_2.NetworkedAnimations
              L30_2 = L30_2[L16_2]
              L30_2 = L30_2.AnimationOptions
              L30_2 = L30_2.FourthProp
              if L30_2 then
                L30_2 = table
                L30_2 = L30_2.unpack
                L31_2 = {}
                L32_2 = 0
                L33_2 = 0
                L34_2 = 0
                L35_2 = 0
                L36_2 = 0
                L31_2[1] = L32_2
                L31_2[2] = L33_2
                L31_2[3] = L34_2
                L31_2[4] = L35_2
                L31_2[5] = L36_2
                L30_2, L31_2, L32_2, L33_2, L34_2, L35_2 = L30_2(L31_2)
                L36_2 = AddPropToPlayer
                L37_2 = L9_2.NetworkedAnimations
                L37_2 = L37_2[L16_2]
                L37_2 = L37_2.AnimationOptions
                L37_2 = L37_2.FourthProp
                L38_2 = L30_2
                L39_2 = L31_2
                L40_2 = L32_2
                L41_2 = L33_2
                L42_2 = L34_2
                L43_2 = L35_2
                L44_2 = A1_2
                L45_2 = true
                L36_2(L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2)
                L36_2 = GetGameTimer
                L36_2 = L36_2()
                while true do
                  L37_2 = DoesEntityExist
                  L38_2 = prop
                  L37_2 = L37_2(L38_2)
                  if L37_2 then
                    break
                  end
                  L37_2 = GetGameTimer
                  L37_2 = L37_2()
                  L37_2 = L37_2 - L36_2
                  L38_2 = 2000
                  if not (L37_2 <= L38_2) then
                    break
                  end
                  L37_2 = Wait
                  L38_2 = 10
                  L37_2(L38_2)
                end
                L37_2 = SetEntityCollision
                L38_2 = prop
                L39_2 = false
                L40_2 = true
                L37_2(L38_2, L39_2, L40_2)
                L37_2 = NetworkAddEntityToSynchronisedScene
                L38_2 = prop
                L39_2 = L28_2
                L40_2 = L9_2.NetworkedAnimations
                L40_2 = L40_2[L16_2]
                L40_2 = L40_2.AnimationOptions
                L40_2 = L40_2.FourthPropAnimationDict
                L41_2 = L9_2.NetworkedAnimations
                L41_2 = L41_2[L16_2]
                L41_2 = L41_2.AnimationOptions
                L41_2 = L41_2.FourthPropAnimation
                L42_2 = 4.0
                L43_2 = -8.0
                L44_2 = 1
                L37_2(L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2)
              end
            end
            L30_2 = nil
            L31_2 = NetworkStartSynchronisedScene
            L32_2 = L28_2
            L31_2(L32_2)
            if L29_2 then
              L31_2 = CreateThread
              function L32_2()
                local L0_3, L1_3, L2_3
                L0_3 = Wait
                L1_3 = 0
                L0_3(L1_3)
                L0_3 = L6_1
                L1_3 = A3_2
                L2_3 = L29_2
                L0_3(L1_3, L2_3)
              end
              L31_2(L32_2)
            end
            L31_2 = L9_2.NetworkedAnimations
            L31_2 = L31_2[L16_2]
            L31_2 = L31_2.WaitTime
            if not L31_2 then
              L31_2 = math
              L31_2 = L31_2.floor
              L32_2 = GetAnimDuration
              L33_2 = L9_2.NetworkedAnimations
              L33_2 = L33_2[L16_2]
              L33_2 = L33_2.AnimDict
              L34_2 = L9_2.NetworkedAnimations
              L34_2 = L34_2[L16_2]
              L34_2 = L34_2.AnimAction
              L32_2 = L32_2(L33_2, L34_2)
              L32_2 = L32_2 * 1000
              L31_2 = L31_2(L32_2)
            end
            L32_2 = L5_1
            L33_2 = A3_2
            L34_2 = L9_2.NetworkedAnimations
            L34_2 = L34_2[L16_2]
            L34_2 = L34_2.AnimationOptions
            if L34_2 then
              L34_2 = L9_2.NetworkedAnimations
              L34_2 = L34_2[L16_2]
              L34_2 = L34_2.AnimationOptions
              L34_2 = L34_2.Prop
            end
            L32_2 = L32_2(L33_2, L34_2)
            if L32_2 then
              L32_2 = L8_1
              L33_2 = A1_2
              L34_2 = L9_2.NetworkedAnimations
              L34_2 = L34_2[L16_2]
              L34_2 = L34_2.AnimDict
              L35_2 = L9_2.NetworkedAnimations
              L35_2 = L35_2[L16_2]
              L35_2 = L35_2.AnimAction
              L36_2 = L5_2
              L37_2 = L31_2
              L32_2(L33_2, L34_2, L35_2, L36_2, L37_2)
            end
            if 1 == L16_2 then
              L32_2 = L9_2.NetworkedAnimations
              L32_2 = L32_2[L16_2]
              L32_2 = L32_2.CamAnim
              if L32_2 then
                L32_2 = L9_2.NetworkedAnimations
                L32_2 = L32_2[L16_2]
                L32_2 = L32_2.CamAnim
                L32_2 = L32_2.SceneCam
                if L32_2 then
                  L32_2 = RenderScriptCams
                  L33_2 = false
                  L34_2 = false
                  L35_2 = 0
                  L36_2 = 1
                  L37_2 = 0
                  L32_2(L33_2, L34_2, L35_2, L36_2, L37_2)
                  L32_2 = DestroyCam
                  L33_2 = L30_2
                  L34_2 = false
                  L32_2(L33_2, L34_2)
                  L32_2 = CreateCam
                  L33_2 = "DEFAULT_ANIMATED_CAMERA"
                  L34_2 = true
                  L32_2 = L32_2(L33_2, L34_2)
                  L30_2 = L32_2
                  L32_2 = SetCamActive
                  L33_2 = L30_2
                  L34_2 = true
                  L32_2(L33_2, L34_2)
                  L32_2 = RenderScriptCams
                  L33_2 = true
                  L34_2 = 0
                  L35_2 = 0
                  L36_2 = 0
                  L37_2 = 0
                  L32_2(L33_2, L34_2, L35_2, L36_2, L37_2)
                  L32_2 = L9_2.NetworkedAnimations
                  L32_2 = L32_2[L16_2]
                  L32_2 = L32_2.AnimDict
                  if "missheist_jewel" == L32_2 then
                    L32_2 = {}
                    L33_2 = "cam_smash_case_d"
                    L34_2 = "cam_smash_case_d"
                    L35_2 = "cam_smash_case_d"
                    L36_2 = "cam_smash_case_f"
                    L37_2 = "cam_smash_case_f"
                    L38_2 = "cam_smash_case_e"
                    L32_2[1] = L33_2
                    L32_2[2] = L34_2
                    L32_2[3] = L35_2
                    L32_2[4] = L36_2
                    L32_2[5] = L37_2
                    L32_2[6] = L38_2
                    L33_2 = L9_2.NetworkedAnimations
                    L33_2 = L33_2[L16_2]
                    L33_2 = L33_2.CamAnim
                    L34_2 = math
                    L34_2 = L34_2.random
                    L35_2 = 1
                    L36_2 = #L32_2
                    L34_2 = L34_2(L35_2, L36_2)
                    L34_2 = L32_2[L34_2]
                    L33_2.SceneCam = L34_2
                    L33_2 = A3_2.PropName
                    if "des_jewel_cab4_start" == L33_2 then
                      L33_2 = L9_2.NetworkedAnimations
                      L33_2 = L33_2[L16_2]
                      L33_2 = L33_2.CamAnim
                      L33_2.SceneCam = "cam_smash_case_necklace_skull"
                    end
                    L33_2 = PlayCamAnim
                    L34_2 = L30_2
                    L35_2 = L9_2.NetworkedAnimations
                    L35_2 = L35_2[L16_2]
                    L35_2 = L35_2.CamAnim
                    L35_2 = L35_2.SceneCam
                    L36_2 = L9_2.NetworkedAnimations
                    L36_2 = L36_2[L16_2]
                    L36_2 = L36_2.AnimDict
                    L37_2 = L24_2
                    L38_2 = L25_2
                    L39_2 = 0
                    L40_2 = 2
                    L33_2(L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2)
                    L33_2 = Wait
                    L34_2 = 3000
                    L33_2(L34_2)
                    L33_2 = RenderScriptCams
                    L34_2 = false
                    L35_2 = false
                    L36_2 = 0
                    L37_2 = 1
                    L38_2 = 0
                    L33_2(L34_2, L35_2, L36_2, L37_2, L38_2)
                    L33_2 = DestroyCam
                    L34_2 = L30_2
                    L35_2 = false
                    L33_2(L34_2, L35_2)
                    break
                  end
                  L32_2 = PlayCamAnim
                  L33_2 = L30_2
                  L34_2 = L9_2.NetworkedAnimations
                  L34_2 = L34_2[L16_2]
                  L34_2 = L34_2.CamAnim
                  L34_2 = L34_2.SceneCam
                  L35_2 = L9_2.NetworkedAnimations
                  L35_2 = L35_2[L16_2]
                  L35_2 = L35_2.AnimDict
                  L36_2 = L24_2
                  L37_2 = L25_2
                  L38_2 = 0
                  L39_2 = 2
                  L32_2(L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2)
                  if not A3_2 then
                    goto lbl_1918
                  end
                  L32_2 = A3_2.PropName
                  if "p_chem_vial_02b_s" == L32_2 then
                    L32_2 = Wait
                    L33_2 = 10000
                    L32_2(L33_2)
                    L32_2 = RenderScriptCams
                    L33_2 = false
                    L34_2 = false
                    L35_2 = 0
                    L36_2 = 1
                    L37_2 = 0
                    L32_2(L33_2, L34_2, L35_2, L36_2, L37_2)
                    L32_2 = DestroyCam
                    L33_2 = L30_2
                    L34_2 = false
                    L32_2(L33_2, L34_2)
                  else
                    L32_2 = A3_2.PropName
                    if "h4_prop_h4_safe_01a" ~= L32_2 then
                      goto lbl_1918
                    end
                    L32_2 = RequestAmbientAudioBank
                    L33_2 = "SAFE_CRACK"
                    L34_2 = false
                    L32_2(L33_2, L34_2)
                    while true do
                      L32_2 = TryingHack
                      if not L32_2 then
                        break
                      end
                      L32_2 = Wait
                      L33_2 = 500
                      L32_2(L33_2)
                    end
                    L32_2 = RenderScriptCams
                    L33_2 = false
                    L34_2 = false
                    L35_2 = 0
                    L36_2 = 1
                    L37_2 = 0
                    L32_2(L33_2, L34_2, L35_2, L36_2, L37_2)
                    L32_2 = DestroyCam
                    L33_2 = L30_2
                    L34_2 = false
                    L32_2(L33_2, L34_2)
                    L32_2 = Wait
                    L33_2 = 3000
                    L32_2(L33_2)
                    L32_2 = DestroyAllProps
                    L32_2()
                  end
                else
                  L32_2 = math
                  L32_2 = L32_2.rad
                  L33_2 = L12_2
                  L32_2 = L32_2(L33_2)
                  L33_2 = L9_2.NetworkedAnimations
                  L33_2 = L33_2[L16_2]
                  L33_2 = L33_2.CamAnim
                  L33_2 = L33_2.offsetX
                  L34_2 = math
                  L34_2 = L34_2.cos
                  L35_2 = L32_2
                  L34_2 = L34_2(L35_2)
                  L33_2 = L33_2 * L34_2
                  L34_2 = L9_2.NetworkedAnimations
                  L34_2 = L34_2[L16_2]
                  L34_2 = L34_2.CamAnim
                  L34_2 = L34_2.offsetY
                  L35_2 = math
                  L35_2 = L35_2.sin
                  L36_2 = L32_2
                  L35_2 = L35_2(L36_2)
                  L34_2 = L34_2 * L35_2
                  L33_2 = L33_2 - L34_2
                  L34_2 = L9_2.NetworkedAnimations
                  L34_2 = L34_2[L16_2]
                  L34_2 = L34_2.CamAnim
                  L34_2 = L34_2.offsetX
                  L35_2 = math
                  L35_2 = L35_2.sin
                  L36_2 = L32_2
                  L35_2 = L35_2(L36_2)
                  L34_2 = L34_2 * L35_2
                  L35_2 = L9_2.NetworkedAnimations
                  L35_2 = L35_2[L16_2]
                  L35_2 = L35_2.CamAnim
                  L35_2 = L35_2.offsetY
                  L36_2 = math
                  L36_2 = L36_2.cos
                  L37_2 = L32_2
                  L36_2 = L36_2(L37_2)
                  L35_2 = L35_2 * L36_2
                  L34_2 = L34_2 + L35_2
                  L35_2 = vector3
                  L36_2 = L11_2.x
                  L36_2 = L36_2 + L33_2
                  L37_2 = L11_2.y
                  L37_2 = L37_2 + L34_2
                  L38_2 = L11_2.z
                  L38_2 = L38_2 + 0.4
                  L35_2 = L35_2(L36_2, L37_2, L38_2)
                  L36_2 = vector3
                  L37_2 = 0.0
                  L38_2 = 0.0
                  L39_2 = L12_2
                  L36_2 = L36_2(L37_2, L38_2, L39_2)
                  L37_2 = CreateCamera
                  L38_2 = L35_2
                  L39_2 = L36_2
                  L40_2 = 1000
                  L37_2(L38_2, L39_2, L40_2)
                end
              end
              ::lbl_1918::
              if A3_2 then
                L32_2 = A3_2.PropName
                if "ch_prop_gold_trolly_01a" ~= L32_2 then
                  L32_2 = A3_2.PropName
                  if "ch_prop_cash_low_trolly_01a" ~= L32_2 then
                    L32_2 = A3_2.PropName
                    if "ch_prop_diamond_trolly_01a" ~= L32_2 then
                      L32_2 = A3_2.PropName
                      if "imp_prop_impexp_coke_trolly" ~= L32_2 then
                        goto lbl_1937
                      end
                    end
                  end
                end
                L32_2 = PutCashInGand
                L33_2 = A3_2.PropName
                L34_2 = A3_2.Stage
                L35_2 = A3_2.RobberyName
                L32_2(L33_2, L34_2, L35_2)
              end
            end
            ::lbl_1937::
            if L10_2 > L16_2 then
              L32_2 = L9_2.NetworkedAnimations
              L32_2 = L32_2[L16_2]
              L32_2 = L32_2.WaitTime
              if not L32_2 then
                L32_2 = GetAnimDuration
                L33_2 = L9_2.NetworkedAnimations
                L33_2 = L33_2[L16_2]
                L33_2 = L33_2.AnimDict
                L34_2 = L9_2.NetworkedAnimations
                L34_2 = L34_2[L16_2]
                L34_2 = L34_2.AnimAction
                L32_2 = L32_2(L33_2, L34_2)
                L32_2 = L32_2 * 1000
              end
              if A3_2 then
                L33_2 = A3_2.PropName
                if "tr_prop_tr_elecbox_01a" == L33_2 then
                  L33_2 = Wait
                  L34_2 = 1000
                  L33_2(L34_2)
                end
              end
              if A3_2 then
                L33_2 = L3_1
                L34_2 = A3_2.PropName
                L33_2 = L33_2(L34_2)
                if not L33_2 then
                  L33_2 = L2_1
                  L34_2 = A3_2.PropName
                  L33_2 = L33_2(L34_2)
                  if not L33_2 then
                    goto lbl_1993
                  end
                end
                L33_2 = Wait
                L34_2 = math
                L34_2 = L34_2.max
                L35_2 = GetAnimDuration
                L36_2 = L9_2.NetworkedAnimations
                L36_2 = L36_2[L16_2]
                L36_2 = L36_2.AnimDict
                L37_2 = L9_2.NetworkedAnimations
                L37_2 = L37_2[L16_2]
                L37_2 = L37_2.AnimAction
                L35_2 = L35_2(L36_2, L37_2)
                L35_2 = L35_2 * 1000
                L35_2 = L35_2 - 2000
                L36_2 = 0
                L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2 = L34_2(L35_2, L36_2)
                L33_2(L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2, L45_2, L46_2, L47_2)
              ::lbl_1993::
              else
                L33_2 = L9_1
                L34_2 = L28_2
                L35_2 = L32_2
                L36_2 = 0.92
                L33_2(L34_2, L35_2, L36_2)
              end
              L33_2 = DestroyAllProps
              L33_2()
              if L30_2 then
                L33_2 = RenderScriptCams
                L34_2 = false
                L35_2 = false
                L36_2 = 0
                L37_2 = 1
                L38_2 = 0
                L33_2(L34_2, L35_2, L36_2, L37_2, L38_2)
                L33_2 = DestroyCam
                L34_2 = L30_2
                L35_2 = false
                L33_2(L34_2, L35_2)
              end
            end
          end
        end
      else
        L10_2 = L9_2.AnimDict
        if nil ~= L10_2 then
          L10_2 = L9_2.IsScenario
          if not L10_2 then
            L10_2 = loadAnimDict
            L11_2 = L9_2.AnimDict
            L10_2(L11_2)
          end
        end
        L10_2 = L9_2.IsScenario
        if L10_2 then
          L10_2 = ClearPedTasksImmediately
          L11_2 = A1_2
          L10_2(L11_2)
          L10_2 = TaskStartScenarioInPlace
          L11_2 = A1_2
          L12_2 = L9_2.AnimDict
          L13_2 = 0
          L14_2 = false
          L10_2(L11_2, L12_2, L13_2, L14_2)
        else
          L10_2 = TaskPlayAnim
          L11_2 = A1_2
          L12_2 = L9_2.AnimDict
          L13_2 = L9_2.AnimAction
          L14_2 = 2.0
          L15_2 = 2.0
          L16_2 = L8_2
          L17_2 = L5_2
          L18_2 = 1.0
          L19_2 = 0
          L20_2 = 0
          L21_2 = 0
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
        end
      end
    end
  end
  ::lbl_2052::
end
L11_1(L12_1, L13_1)
