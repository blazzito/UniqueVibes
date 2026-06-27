local L0_1, L1_1
function L0_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = AddBlipForCoord
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = SetBlipSprite
  L6_2 = L4_2
  L7_2 = A1_2
  L5_2(L6_2, L7_2)
  L5_2 = SetBlipColour
  L6_2 = L4_2
  L7_2 = A2_2
  L5_2(L6_2, L7_2)
  L5_2 = SetBlipAsShortRange
  L6_2 = L4_2
  L7_2 = false
  L5_2(L6_2, L7_2)
  L5_2 = SetBlipScale
  L6_2 = L4_2
  L7_2 = 0.8
  L5_2(L6_2, L7_2)
  L5_2 = BeginTextCommandSetBlipName
  L6_2 = "STRING"
  L5_2(L6_2)
  L5_2 = AddTextComponentString
  L6_2 = A3_2
  L5_2(L6_2)
  L5_2 = EndTextCommandSetBlipName
  L6_2 = L4_2
  L5_2(L6_2)
  return L4_2
end
addBlip = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = WaitForToken
  L4_2 = 5000
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = SendProtected
  L4_2 = "Pug:server:GiveRewardForEndingHeist"
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  return L3_2(L4_2, L5_2, L6_2, L7_2)
end
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = tostring
  L3_2 = A0_2.endingTargetVector
  L2_2 = L2_2(L3_2)
  L4_2 = L2_2
  L3_2 = L2_2.match
  L5_2 = "([^,]+),%s*([^,]+),%s*([^,]+)"
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  L6_2 = vector3
  L7_2 = tonumber
  L8_2 = L3_2
  L7_2 = L7_2(L8_2)
  L8_2 = tonumber
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  L9_2 = tonumber
  L10_2 = L5_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L7_2 = Notify
  L8_2 = Config
  L8_2 = L8_2.LangT
  L8_2 = L8_2.DeliverItemsToBuyer
  L9_2 = "success"
  L7_2(L8_2, L9_2)
  L7_2 = LoadModel
  L8_2 = "baller5"
  L7_2(L8_2)
  L7_2 = addBlip
  L8_2 = L6_2
  L9_2 = 784
  L10_2 = 0
  L11_2 = "Buyer Location"
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
  buyerBlip = L7_2
  L7_2 = CreateVehicle
  L8_2 = GetHashKey
  L9_2 = "baller5"
  L8_2 = L8_2(L9_2)
  L9_2 = L6_2.xy
  L9_2 = L9_2 + 3.0
  L10_2 = L6_2.z
  L11_2 = A0_2.endingHeading
  L11_2 = L11_2 + 0.0
  L12_2 = 0
  L13_2 = 0
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  buyerVehicle = L7_2
  L7_2 = SetNewWaypoint
  L8_2 = L6_2.xy
  L7_2(L8_2)
  while true do
    L7_2 = PlayerPedId
    L7_2 = L7_2()
    L8_2 = GetEntityCoords
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2 - L6_2
    L9_2 = #L9_2
    if L9_2 <= 20.0 then
      L10_2 = PlayCutscene
      L11_2 = "hs3f_all_drp3"
      L12_2 = L6_2
      L10_2(L11_2, L12_2)
      L10_2 = DeleteVehicle
      L11_2 = buyerVehicle
      L10_2(L11_2)
      L10_2 = RemoveBlip
      L11_2 = buyerBlip
      L10_2(L11_2)
      L10_2 = tonumber
      L11_2 = A0_2.minValue
      L10_2 = L10_2(L11_2)
      L11_2 = tonumber
      L12_2 = A0_2.maxValue
      L11_2 = L11_2(L12_2)
      if L10_2 <= L11_2 then
        TokenIsUseable = true
        L12_2 = L0_1
        L13_2 = A1_2
        L14_2 = L10_2
        L15_2 = L11_2
        L12_2(L13_2, L14_2, L15_2)
        TokenIsUseable = false
        break
      end
      L12_2 = Notify
      L13_2 = Config
      L13_2 = L13_2.LangT
      L13_2 = L13_2.MaxGreaterThanMinReward
      L14_2 = "error"
      L12_2(L13_2, L14_2)
      break
    end
    L10_2 = Wait
    L11_2 = 1
    L10_2(L11_2)
  end
end
CompleteRobberyScene = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  while true do
    L2_2 = HasThisCutsceneLoaded
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = RequestCutscene
    L3_2 = A0_2
    L4_2 = 8
    L2_2(L3_2, L4_2)
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  L2_2 = StartCustomCutscene
  L3_2 = false
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = EndCutscene
  L3_2 = A1_2
  L2_2(L3_2)
  L2_2 = RemoveCutscene
  L2_2()
  L2_2 = DoScreenFadeIn
  L3_2 = 500
  L2_2(L3_2)
end
PlayCutscene = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = ClonePedEx
  L4_2 = L2_2
  L5_2 = 0.0
  L6_2 = false
  L7_2 = true
  L8_2 = 1
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L4_2 = ClonePedEx
  L5_2 = L2_2
  L6_2 = 0.0
  L7_2 = false
  L8_2 = true
  L9_2 = 1
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L5_2 = ClonePedEx
  L6_2 = L2_2
  L7_2 = 0.0
  L8_2 = false
  L9_2 = true
  L10_2 = 1
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L6_2 = ClonePedEx
  L7_2 = L2_2
  L8_2 = 0.0
  L9_2 = false
  L10_2 = true
  L11_2 = 1
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  L7_2 = ClonePedEx
  L8_2 = L2_2
  L9_2 = 0.0
  L10_2 = false
  L11_2 = true
  L12_2 = 1
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  L8_2 = SetBlockingOfNonTemporaryEvents
  L9_2 = L3_2
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetEntityVisible
  L9_2 = L3_2
  L10_2 = false
  L11_2 = false
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = SetEntityInvincible
  L9_2 = L3_2
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetEntityCollision
  L9_2 = L3_2
  L10_2 = false
  L11_2 = false
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = FreezeEntityPosition
  L9_2 = L3_2
  L10_2 = true
  L8_2(L9_2, L10_2)
  if A0_2 then
    L8_2 = SetCutsceneEntityStreamingFlags
    L9_2 = "MP_2"
    L10_2 = 0
    L11_2 = 1
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = RegisterEntityForCutscene
    L9_2 = L2_2
    L10_2 = "MP_2"
    L11_2 = 0
    L12_2 = GetEntityModel
    L13_2 = L2_2
    L12_2 = L12_2(L13_2)
    L13_2 = 64
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    L8_2 = SetCutsceneEntityStreamingFlags
    L9_2 = "MP_1"
    L10_2 = 0
    L11_2 = 1
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = RegisterEntityForCutscene
    L9_2 = L4_2
    L10_2 = "MP_1"
    L11_2 = 0
    L12_2 = GetEntityModel
    L13_2 = L4_2
    L12_2 = L12_2(L13_2)
    L13_2 = 64
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  else
    L8_2 = SetCutsceneEntityStreamingFlags
    L9_2 = "MP_1"
    L10_2 = 0
    L11_2 = 1
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = RegisterEntityForCutscene
    L9_2 = L2_2
    L10_2 = "MP_1"
    L11_2 = 0
    L12_2 = GetEntityModel
    L13_2 = L2_2
    L12_2 = L12_2(L13_2)
    L13_2 = 64
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    L8_2 = SetCutsceneEntityStreamingFlags
    L9_2 = "MP_2"
    L10_2 = 0
    L11_2 = 1
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = RegisterEntityForCutscene
    L9_2 = L4_2
    L10_2 = "MP_2"
    L11_2 = 0
    L12_2 = GetEntityModel
    L13_2 = L4_2
    L12_2 = L12_2(L13_2)
    L13_2 = 64
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  end
  L8_2 = SetCutsceneEntityStreamingFlags
  L9_2 = "MP_3"
  L10_2 = 0
  L11_2 = 1
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = RegisterEntityForCutscene
  L9_2 = L5_2
  L10_2 = "MP_3"
  L11_2 = 0
  L12_2 = GetEntityModel
  L13_2 = L5_2
  L12_2 = L12_2(L13_2)
  L13_2 = 64
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = SetCutsceneEntityStreamingFlags
  L9_2 = "MP_4"
  L10_2 = 0
  L11_2 = 1
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = RegisterEntityForCutscene
  L9_2 = L6_2
  L10_2 = "MP_4"
  L11_2 = 0
  L12_2 = GetEntityModel
  L13_2 = L6_2
  L12_2 = L12_2(L13_2)
  L13_2 = 64
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = SetCutsceneEntityStreamingFlags
  L9_2 = "MP_5"
  L10_2 = 0
  L11_2 = 1
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = RegisterEntityForCutscene
  L9_2 = L7_2
  L10_2 = "MP_5"
  L11_2 = 0
  L12_2 = GetEntityModel
  L13_2 = L7_2
  L12_2 = L12_2(L13_2)
  L13_2 = 64
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = Wait
  L9_2 = 10
  L8_2(L9_2)
  if A1_2 then
    L8_2 = StartCutsceneAtCoords
    L9_2 = A1_2
    L10_2 = 0
    L8_2(L9_2, L10_2)
  else
    L8_2 = StartCutscene
    L9_2 = 0
    L8_2(L9_2)
  end
  L8_2 = Wait
  L9_2 = 10
  L8_2(L9_2)
  L8_2 = ClonePedToTarget
  L9_2 = L3_2
  L10_2 = L2_2
  L8_2(L9_2, L10_2)
  L8_2 = Wait
  L9_2 = 10
  L8_2(L9_2)
  L8_2 = DeleteEntity
  L9_2 = L3_2
  L8_2(L9_2)
  L8_2 = DeleteEntity
  L9_2 = L4_2
  L8_2(L9_2)
  L8_2 = DeleteEntity
  L9_2 = L5_2
  L8_2(L9_2)
  L8_2 = DeleteEntity
  L9_2 = L6_2
  L8_2(L9_2)
  L8_2 = DeleteEntity
  L9_2 = L7_2
  L8_2(L9_2)
  L8_2 = Wait
  L9_2 = 50
  L8_2(L9_2)
  L8_2 = DoScreenFadeIn
  L9_2 = 250
  L8_2(L9_2)
end
StartCustomCutscene = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = false
    repeat
      L2_2 = Wait
      L3_2 = 0
      L2_2(L3_2)
      L2_2 = timer
      if L2_2 then
        L2_2 = GetCutsceneTime
        L2_2 = L2_2()
        L3_2 = timer
        if L2_2 > L3_2 then
          L2_2 = DoScreenFadeOut
          L3_2 = 250
          L2_2(L3_2)
          L1_2 = true
        end
      end
      L2_2 = GetCutsceneTotalDuration
      L2_2 = L2_2()
      L3_2 = GetCutsceneTime
      L3_2 = L3_2()
      L2_2 = L2_2 - L3_2
      L3_2 = 250
      if L2_2 <= L3_2 then
        L2_2 = DoScreenFadeOut
        L3_2 = 250
        L2_2(L3_2)
        L1_2 = true
      end
      L2_2 = IsCutscenePlaying
      L2_2 = L2_2()
    until not L2_2
    if not L1_2 then
      L2_2 = DoScreenFadeOut
      L3_2 = 100
      L2_2(L3_2)
      L2_2 = Wait
      L3_2 = 150
      L2_2(L3_2)
    end
    return
  else
    L1_2 = Wait
    L2_2 = 18500
    L1_2(L2_2)
    L1_2 = StopCutsceneImmediately
    L1_2()
  end
end
EndCutscene = L1_1
