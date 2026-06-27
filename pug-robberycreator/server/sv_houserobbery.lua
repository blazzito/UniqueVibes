local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1, L63_1, L64_1, L65_1, L66_1, L67_1, L68_1, L69_1
L0_1 = nil
L1_1 = nil
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = 3600
L6_1 = 620000
L7_1 = 0
L8_1 = {}
L9_1 = {}
function L10_1(A0_2)
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
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = {}
  L1_2 = pairs
  L2_2 = L2_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = {}
    L8_2 = {}
    L9_2 = type
    L10_2 = L6_2.lootedPoints
    L9_2 = L9_2(L10_2)
    if "table" == L9_2 then
      L9_2 = pairs
      L10_2 = L6_2.lootedPoints
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
      for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
        if true == L14_2 then
          L15_2 = tonumber
          L16_2 = L13_2
          L15_2 = L15_2(L16_2)
          if not L15_2 then
            L15_2 = L13_2
          end
          L7_2[L15_2] = true
        end
      end
    end
    L9_2 = type
    L10_2 = L6_2.activeLootPoints
    L9_2 = L9_2(L10_2)
    if "table" == L9_2 then
      L9_2 = pairs
      L10_2 = L6_2.activeLootPoints
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
      for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
        if true == L14_2 then
          L15_2 = tonumber
          L16_2 = L13_2
          L15_2 = L15_2(L16_2)
          if not L15_2 then
            L15_2 = L13_2
          end
          L8_2[L15_2] = true
        end
      end
    end
    L9_2 = {}
    L10_2 = L10_1
    L11_2 = L6_2.locationId
    if not L11_2 then
      L11_2 = L5_2
    end
    L10_2 = L10_2(L11_2)
    L9_2.locationId = L10_2
    L10_2 = L10_1
    L11_2 = L6_2.shellId
    L10_2 = L10_2(L11_2)
    L9_2.shellId = L10_2
    L10_2 = L10_1
    L11_2 = L6_2.presetId
    L10_2 = L10_2(L11_2)
    L9_2.presetId = L10_2
    L10_2 = tonumber
    L11_2 = L6_2.endTime
    L10_2 = L10_2(L11_2)
    if not L10_2 then
      L10_2 = 0
    end
    L9_2.endTime = L10_2
    L9_2.lootedPoints = L7_2
    L9_2.activeLootPoints = L8_2
    L10_2 = L6_2.activeLootPointsSet
    L10_2 = true == L10_2
    L9_2.activeLootPointsSet = L10_2
    L10_2 = L6_2.securityDisabled
    L10_2 = true == L10_2
    L9_2.securityDisabled = L10_2
    L0_2[L5_2] = L9_2
  end
  return L0_2
end
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = TriggerClientEvent
  L2_2 = "Pug:client:UpdateOpenHouseRobberyStates"
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = -1
  end
  L4_2 = L11_1
  L4_2 = L4_2()
  L1_2(L2_2, L3_2, L4_2)
end
function L13_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L10_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  if "" == A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = L8_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = L7_1
    L1_2 = L1_2 + 1
    L7_1 = L1_2
    L1_2 = L8_1
    L2_2 = L6_1
    L3_2 = L7_1
    L2_2 = L2_2 + L3_2
    L1_2[A0_2] = L2_2
  end
  L1_2 = L8_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
function L14_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = L10_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  L2_2 = L13_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = false
    L4_2 = "invalid"
    L5_2 = 0
    return L3_2, L4_2, L5_2
  end
  L3_2 = GetPlayerRoutingBucket
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0
  end
  L4_2 = L9_1
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L5_2 = L4_2.previousBucket
    if L5_2 then
      goto lbl_28
    end
  end
  L5_2 = L3_2
  ::lbl_28::
  L6_2 = L9_1
  L7_2 = {}
  L7_2.locationId = A1_2
  L7_2.bucket = L2_2
  L7_2.previousBucket = L5_2
  L6_2[A0_2] = L7_2
  L6_2 = SetPlayerRoutingBucket
  L7_2 = A0_2
  L8_2 = L2_2
  L6_2(L7_2, L8_2)
  L6_2 = true
  L7_2 = "entered"
  L8_2 = L2_2
  return L6_2, L7_2, L8_2
end
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L9_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = L9_1
  L2_2[A0_2] = nil
  L2_2 = SetPlayerRoutingBucket
  L3_2 = A0_2
  L4_2 = tonumber
  L5_2 = L1_2.previousBucket
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0
  end
  L2_2(L3_2, L4_2)
end
function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  if not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = {}
  L3_2 = tonumber
  L4_2 = A0_2.x
  if not L4_2 then
    L4_2 = A0_2[1]
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = tonumber
    L4_2 = A1_2.x
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = 0.0
    end
  end
  L2_2.x = L3_2
  L3_2 = tonumber
  L4_2 = A0_2.y
  if not L4_2 then
    L4_2 = A0_2[2]
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = tonumber
    L4_2 = A1_2.y
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = 0.0
    end
  end
  L2_2.y = L3_2
  L3_2 = tonumber
  L4_2 = A0_2.z
  if not L4_2 then
    L4_2 = A0_2[3]
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = tonumber
    L4_2 = A1_2.z
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = 0.0
    end
  end
  L2_2.z = L3_2
  L3_2 = tonumber
  L4_2 = A0_2.w
  if not L4_2 then
    L4_2 = A0_2.h
    if not L4_2 then
      L4_2 = A0_2[4]
    end
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = tonumber
    L4_2 = A1_2.w
    if not L4_2 then
      L4_2 = A1_2.h
    end
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = 0.0
    end
  end
  L2_2.w = L3_2
  return L2_2
end
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
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
function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = tonumber
  L2_2 = A0_2.x
  if not L2_2 then
    L2_2 = A0_2[1]
  end
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = 0.0
  end
  L2_2 = tonumber
  L3_2 = A0_2.y
  if not L3_2 then
    L3_2 = A0_2[2]
  end
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0.0
  end
  L3_2 = tonumber
  L4_2 = A0_2.z
  if not L4_2 then
    L4_2 = A0_2[3]
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0.0
  end
  L4_2 = 0.0 == L1_2 and 0.0 == L2_2 and 0.0 == L3_2
  return L4_2
end
function L19_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = type
  L1_2 = Config
  L1_2 = L1_2.HouseRobberyPresetSettings
  L0_2 = L0_2(L1_2)
  if "table" == L0_2 then
    L0_2 = Config
    L0_2 = L0_2.HouseRobberyPresetSettings
    if L0_2 then
      goto lbl_13
    end
  end
  L0_2 = {}
  ::lbl_13::
  L1_2 = {}
  L2_2 = L0_2.sendAlert
  L2_2 = true == L2_2
  L1_2.sendAlert = L2_2
  L2_2 = tostring
  L3_2 = L0_2.alertChance
  if not L3_2 then
    L3_2 = 100
  end
  L2_2 = L2_2(L3_2)
  L1_2.alertChance = L2_2
  L2_2 = L10_1
  L3_2 = L0_2.policeAlertHeader
  if not L3_2 then
    L3_2 = "House Robbery Alert"
  end
  L2_2 = L2_2(L3_2)
  L1_2.policeAlertHeader = L2_2
  L2_2 = L10_1
  L3_2 = L0_2.policeAlert
  if not L3_2 then
    L3_2 = "Suspicious activity reported at a house robbery."
  end
  L2_2 = L2_2(L3_2)
  L1_2.policeAlert = L2_2
  L2_2 = L1_1
  L3_2 = L0_2.policeJobs
  if not L3_2 then
    L3_2 = Config
    L3_2 = L3_2.DefualPoliceJobs
  end
  L2_2 = L2_2(L3_2)
  L1_2.policeJobs = L2_2
  L2_2 = L10_1
  L3_2 = L0_2.alertCode
  if not L3_2 then
    L3_2 = "10-90"
  end
  L2_2 = L2_2(L3_2)
  L1_2.alertCode = L2_2
  L2_2 = L10_1
  L3_2 = L0_2.alertIcon
  if not L3_2 then
    L3_2 = "fas fa-house"
  end
  L2_2 = L2_2(L3_2)
  L1_2.alertIcon = L2_2
  L2_2 = tostring
  L3_2 = L0_2.alertPriority
  if not L3_2 then
    L3_2 = 2
  end
  L2_2 = L2_2(L3_2)
  L1_2.alertPriority = L2_2
  L2_2 = L10_1
  L3_2 = L0_2.alertCamId
  if not L3_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  L1_2.alertCamId = L2_2
  L2_2 = tostring
  L3_2 = L0_2.blipSprite
  if not L3_2 then
    L3_2 = 40
  end
  L2_2 = L2_2(L3_2)
  L1_2.blipSprite = L2_2
  L2_2 = tostring
  L3_2 = L0_2.blipColor
  if not L3_2 then
    L3_2 = 1
  end
  L2_2 = L2_2(L3_2)
  L1_2.blipColor = L2_2
  L2_2 = tostring
  L3_2 = L0_2.blipScale
  if not L3_2 then
    L3_2 = 1.0
  end
  L2_2 = L2_2(L3_2)
  L1_2.blipScale = L2_2
  L2_2 = L10_1
  L3_2 = L0_2.alertSound1
  if not L3_2 then
    L3_2 = "robberysound"
  end
  L2_2 = L2_2(L3_2)
  L1_2.alertSound1 = L2_2
  L2_2 = L0_2.blipFlash
  L2_2 = true == L2_2
  L1_2.blipFlash = L2_2
  L1_2.missionNpcEnabled = false
  L2_2 = {}
  L2_2.heading = 0.0
  L2_2.model = "a_m_y_business_03"
  L2_2.interactionLabel = "Request House Lead"
  L2_2.placed = false
  L1_2.missionNpc = L2_2
  return L1_2
end
function L20_1()
  local L0_2, L1_2
  L0_2 = {}
  L1_2 = L19_1
  L1_2 = L1_2()
  L0_2.settings = L1_2
  L1_2 = {}
  L0_2.shells = L1_2
  L1_2 = {}
  L0_2.locations = L1_2
  L1_2 = {}
  L0_2.batchLocationSettings = L1_2
  return L0_2
end
GetDefaultHouseRobberySettings = L20_1
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = type
  L1_2 = Config
  L1_2 = L1_2.HouseRobberyPresetSettings
  L0_2 = L0_2(L1_2)
  if "table" == L0_2 then
    L0_2 = Config
    L0_2 = L0_2.HouseRobberyPresetSettings
    if L0_2 then
      goto lbl_13
    end
  end
  L0_2 = {}
  ::lbl_13::
  L1_2 = L19_1
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = L10_1
  L4_2 = L0_2.targetLabel
  if not L4_2 then
    L4_2 = L0_2.interactionLabel
    if not L4_2 then
      L4_2 = "Break In"
    end
  end
  L3_2 = L3_2(L4_2)
  L2_2.interactionLabel = L3_2
  L3_2 = L10_1
  L4_2 = L0_2.progressbarLabel
  if not L4_2 then
    L4_2 = L0_2.progressLabel
    if not L4_2 then
      L4_2 = "Breaking into house"
    end
  end
  L3_2 = L3_2(L4_2)
  L2_2.progressLabel = L3_2
  L3_2 = tonumber
  L4_2 = L0_2.progressbarTime
  if not L4_2 then
    L4_2 = L0_2.progressDuration
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 6500
  end
  L2_2.progressDuration = L3_2
  L3_2 = tonumber
  L4_2 = L0_2.policeRequired
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0
  end
  L2_2.policeRequired = L3_2
  L3_2 = tonumber
  L4_2 = L0_2.cooldownTimer
  if not L4_2 then
    L4_2 = L0_2.cooldown
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 30
  end
  L2_2.cooldown = L3_2
  L3_2 = L1_2.alertChance
  L2_2.alertChance = L3_2
  L3_2 = L10_1
  L4_2 = L0_2.minigameOption
  if not L4_2 then
    L4_2 = "none"
  end
  L3_2 = L3_2(L4_2)
  L2_2.minigameOption = L3_2
  L3_2 = L1_2.sendAlert
  L2_2.sendAlert = L3_2
  L3_2 = L1_2.policeAlertHeader
  L2_2.policeAlertHeader = L3_2
  L3_2 = L1_2.policeAlert
  L2_2.policeAlert = L3_2
  L3_2 = L1_2.policeJobs
  L2_2.policeJobs = L3_2
  L3_2 = L1_2.alertCode
  L2_2.alertCode = L3_2
  L3_2 = L1_2.alertIcon
  L2_2.alertIcon = L3_2
  L3_2 = L1_2.alertPriority
  L2_2.alertPriority = L3_2
  L3_2 = L1_2.alertCamId
  L2_2.alertCamId = L3_2
  L3_2 = L1_2.blipSprite
  L2_2.blipSprite = L3_2
  L3_2 = L1_2.blipColor
  L2_2.blipColor = L3_2
  L3_2 = L1_2.blipScale
  L2_2.blipScale = L3_2
  L3_2 = L1_2.alertSound1
  L2_2.alertSound1 = L3_2
  L3_2 = L1_2.blipFlash
  L2_2.blipFlash = L3_2
  L3_2 = L0_2.moneyReward
  L3_2 = true == L3_2
  L2_2.moneyReward = L3_2
  L3_2 = L10_1
  L4_2 = L0_2.rewardType
  if not L4_2 then
    L4_2 = "cash"
  end
  L3_2 = L3_2(L4_2)
  L2_2.rewardType = L3_2
  L3_2 = tostring
  L4_2 = L0_2.minMoney
  if not L4_2 then
    L4_2 = 50
  end
  L3_2 = L3_2(L4_2)
  L2_2.minMoney = L3_2
  L3_2 = tostring
  L4_2 = L0_2.maxMoney
  if not L4_2 then
    L4_2 = 150
  end
  L3_2 = L3_2(L4_2)
  L2_2.maxMoney = L3_2
  L3_2 = tostring
  L4_2 = L0_2.moneyChance
  if not L4_2 then
    L4_2 = 100
  end
  L3_2 = L3_2(L4_2)
  L2_2.moneyChance = L3_2
  L3_2 = L0_2.xpOptions
  L3_2 = true == L3_2
  L2_2.xpOptions = L3_2
  L3_2 = tostring
  L4_2 = L0_2.xpRewardAmount
  if not L4_2 then
    L4_2 = 0
  end
  L3_2 = L3_2(L4_2)
  L2_2.xpRewardAmount = L3_2
  L3_2 = tostring
  L4_2 = L0_2.xpNeededAmount
  if not L4_2 then
    L4_2 = 0
  end
  L3_2 = L3_2(L4_2)
  L2_2.xpNeededAmount = L3_2
  L3_2 = L0_2.removeXpOnHit
  L3_2 = true == L3_2
  L2_2.removeXpOnHit = L3_2
  L3_2 = tostring
  L4_2 = L0_2.xpRemoveAmount
  if not L4_2 then
    L4_2 = 0
  end
  L3_2 = L3_2(L4_2)
  L2_2.xpRemoveAmount = L3_2
  return L2_2
end
L21_1 = "preset-info/house-presets/house-preset-index.json"
L22_1 = nil
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L10_1
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  L3_2 = L1_2
  L2_2 = L1_2.gsub
  L4_2 = "%.[Jj][Ss][Oo][Nn]$"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L3_2 = L1_2
  L2_2 = L1_2.gsub
  L4_2 = "[<>:\"/\\|?*]"
  L5_2 = "_"
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L3_2 = L1_2
  L2_2 = L1_2.gsub
  L4_2 = "%s+"
  L5_2 = "_"
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L3_2 = L1_2
  L2_2 = L1_2.gsub
  L4_2 = "_+"
  L5_2 = "_"
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  L3_2 = L1_2
  L2_2 = L1_2.gsub
  L4_2 = "^_+"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L2_2
  L2_2 = L2_2.gsub
  L4_2 = "_+$"
  L5_2 = ""
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L1_2 = L2_2
  return L1_2
end
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L23_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L1_2 = "house_preset"
  end
  L2_2 = "preset-info/house-presets/%s.json"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = "%s.json"
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  return L2_2, L3_2, L4_2, L5_2
end
function L25_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = GetResourcePath
  L1_2 = GetCurrentResourceName
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
  if not L0_2 or "" == L0_2 then
    L1_2 = nil
    return L1_2
  end
  L2_2 = L0_2
  L1_2 = L0_2.find
  L3_2 = "\\"
  L4_2 = 1
  L5_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if L1_2 then
    L1_2 = "\\"
    if L1_2 then
      goto lbl_22
    end
  end
  L1_2 = "/"
  ::lbl_22::
  L2_2 = L0_2
  L3_2 = L1_2
  L4_2 = "preset-info"
  L5_2 = L1_2
  L6_2 = "house-presets"
  L2_2 = L2_2 .. L3_2 .. L4_2 .. L5_2 .. L6_2
  return L2_2
end
function L26_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = "string" == L1_2
  return L1_2
end
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = L26_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = "\""
    L3_2 = A0_2
    L2_2 = A0_2.gsub
    L4_2 = "\""
    L5_2 = "\"\""
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = "\""
    L1_2 = L1_2 .. L2_2 .. L3_2
    return L1_2
  end
  L1_2 = "'"
  L3_2 = A0_2
  L2_2 = A0_2.gsub
  L4_2 = "'"
  L5_2 = "'\\''"
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = "'"
  L1_2 = L1_2 .. L2_2 .. L3_2
  return L1_2
end
function L28_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "'"
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.gsub
  L4_2 = "'"
  L5_2 = "''"
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = "'"
  L1_2 = L1_2 .. L2_2 .. L3_2
  return L1_2
end
function L29_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = LoadResourceFile
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  L2_2 = L21_1
  L0_2 = L0_2(L1_2, L2_2)
  if not L0_2 or "" == L0_2 then
    L1_2 = {}
    return L1_2
  end
  L1_2 = pcall
  L2_2 = json
  L2_2 = L2_2.decode
  L3_2 = L0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L3_2 = type
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if "table" == L3_2 then
      goto lbl_28
    end
  end
  L3_2 = {}
  do return L3_2 end
  ::lbl_28::
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = L2_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = type
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if "string" == L10_2 and "" ~= L9_2 then
      L10_2 = #L3_2
      L10_2 = L10_2 + 1
      L3_2[L10_2] = L9_2
    end
  end
  return L3_2
end
function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if "string" == L8_2 and "" ~= L7_2 then
      L8_2 = L24_1
      L9_2 = L7_2
      L8_2, L9_2 = L8_2(L9_2)
      L1_2[L9_2] = true
    end
  end
  L2_2 = {}
  L3_2 = pairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2 in L3_2, L4_2, L5_2, L6_2 do
    L8_2 = #L2_2
    L8_2 = L8_2 + 1
    L2_2[L8_2] = L7_2
  end
  L3_2 = table
  L3_2 = L3_2.sort
  L4_2 = L2_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L3_3 = A0_3
    L2_3 = A0_3.lower
    L2_3 = L2_3(L3_3)
    L4_3 = A1_3
    L3_3 = A1_3.lower
    L3_3 = L3_3(L4_3)
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  L3_2(L4_2, L5_2)
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 or "" == L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = SaveResourceFile
  L5_2 = GetCurrentResourceName
  L5_2 = L5_2()
  L6_2 = L21_1
  L7_2 = L3_2
  L8_2 = -1
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end
function L31_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L29_1
  L1_2 = L1_2()
  L2_2 = #L1_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = A0_2
  L2_2 = L30_1
  L3_2 = L1_2
  L2_2(L3_2)
end
function L32_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = {}
  function L1_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = type
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if "string" ~= L1_3 or "" == A0_3 then
      return
    end
    L2_3 = A0_3
    L1_3 = A0_3.gsub
    L3_3 = "\\"
    L4_3 = "/"
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L2_3 = L1_3
    L1_3 = L1_3.match
    L3_3 = "^preset%-info/house%-presets/(.+)$"
    L1_3 = L1_3(L2_3, L3_3)
    if not L1_3 then
      L1_3 = A0_3
    end
    L3_3 = L1_3
    L2_3 = L1_3.lower
    L2_3 = L2_3(L3_3)
    L4_3 = L2_3
    L3_3 = L2_3.match
    L5_3 = "%.json$"
    L3_3 = L3_3(L4_3, L5_3)
    if L3_3 then
      L4_3 = L2_3
      L3_3 = L2_3.match
      L5_3 = "%.bak$"
      L3_3 = L3_3(L4_3, L5_3)
      if not L3_3 and "house-preset-index.json" ~= L1_3 then
        L3_3 = L0_2
        L3_3[L1_3] = true
      end
    end
  end
  L2_2 = ipairs
  L3_2 = L29_1
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L3_2()
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L24_1
    L9_2 = L7_2
    L8_2, L9_2 = L8_2(L9_2)
    L10_2 = LoadResourceFile
    L11_2 = GetCurrentResourceName
    L11_2 = L11_2()
    L12_2 = L8_2
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 then
      L10_2 = L1_2
      L11_2 = L9_2
      L10_2(L11_2)
    end
  end
  L2_2 = L25_1
  L2_2 = L2_2()
  if L2_2 then
    L3_2 = nil
    L4_2 = L26_1
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = "powershell -NoProfile -Command \"& { Get-ChildItem -LiteralPath %s -File | Select-Object -ExpandProperty Name }\""
      L5_2 = L4_2
      L4_2 = L4_2.format
      L6_2 = L28_1
      L7_2 = L2_2
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L3_2 = L4_2
    else
      L4_2 = "ls -1 %s"
      L5_2 = L4_2
      L4_2 = L4_2.format
      L6_2 = L27_1
      L7_2 = L2_2
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L3_2 = L4_2
    end
    L4_2 = io
    L4_2 = L4_2.popen
    if L4_2 then
      L4_2 = io
      L4_2 = L4_2.popen
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        goto lbl_61
      end
    end
    L4_2 = nil
    ::lbl_61::
    if L4_2 then
      L6_2 = L4_2
      L5_2 = L4_2.lines
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
      for L9_2 in L5_2, L6_2, L7_2, L8_2 do
        L10_2 = L1_2
        L11_2 = L9_2
        L10_2(L11_2)
      end
      L6_2 = L4_2
      L5_2 = L4_2.close
      L5_2(L6_2)
    end
  end
  L3_2 = {}
  L4_2 = pairs
  L5_2 = L0_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2 in L4_2, L5_2, L6_2, L7_2 do
    L9_2 = #L3_2
    L9_2 = L9_2 + 1
    L3_2[L9_2] = L8_2
  end
  L4_2 = table
  L4_2 = L4_2.sort
  L5_2 = L3_2
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L3_3 = A0_3
    L2_3 = A0_3.lower
    L2_3 = L2_3(L3_3)
    L4_3 = A1_3
    L3_3 = A1_3.lower
    L3_3 = L3_3(L4_3)
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  L4_2(L5_2, L6_2)
  return L3_2
end
function L33_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if not A0_2 or "" == A0_2 then
    L2_2 = nil
    L3_2 = "Unable to load "
    L4_2 = A1_2
    L5_2 = "."
    L3_2 = L3_2 .. L4_2 .. L5_2
    return L2_2, L3_2
  end
  L2_2 = pcall
  L3_2 = json
  L3_2 = L3_2.decode
  L4_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L4_2 = type
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if "table" == L4_2 then
      goto lbl_28
    end
  end
  L4_2 = nil
  L5_2 = A1_2
  L6_2 = " is not valid JSON house preset data."
  L5_2 = L5_2 .. L6_2
  do return L4_2, L5_2 end
  ::lbl_28::
  L4_2 = L22_1
  L5_2 = type
  L6_2 = L3_2.settings
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = L3_2.settings
    if L5_2 then
      goto lbl_38
    end
  end
  L5_2 = L3_2
  ::lbl_38::
  return L4_2(L5_2)
end
function L34_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L10_1
    L9_2 = L7_2.itemName
    if not L9_2 then
      L9_2 = L7_2.name
      if not L9_2 then
        L9_2 = L7_2.rewardItemName
      end
    end
    L8_2 = L8_2(L9_2)
    if "" ~= L8_2 then
      L9_2 = #L1_2
      L9_2 = L9_2 + 1
      L10_2 = {}
      L10_2.itemName = L8_2
      L11_2 = tostring
      L12_2 = L7_2.minAmount
      if not L12_2 then
        L12_2 = L7_2.rewardItemMin
        if not L12_2 then
          L12_2 = L7_2.amount
          if not L12_2 then
            L12_2 = 1
          end
        end
      end
      L11_2 = L11_2(L12_2)
      L10_2.minAmount = L11_2
      L11_2 = tostring
      L12_2 = L7_2.maxAmount
      if not L12_2 then
        L12_2 = L7_2.rewardItemMax
        if not L12_2 then
          L12_2 = L7_2.amount
          if not L12_2 then
            L12_2 = 1
          end
        end
      end
      L11_2 = L11_2(L12_2)
      L10_2.maxAmount = L11_2
      L11_2 = tostring
      L12_2 = L7_2.chance
      if not L12_2 then
        L12_2 = L7_2.rewardItemChance
        if not L12_2 then
          L12_2 = 100
        end
      end
      L11_2 = L11_2(L12_2)
      L10_2.chance = L11_2
      L1_2[L9_2] = L10_2
    end
  end
  return L1_2
end
function L35_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L10_1
    L9_2 = L7_2.itemName
    if not L9_2 then
      L9_2 = L7_2.name
    end
    L8_2 = L8_2(L9_2)
    if "" ~= L8_2 then
      L9_2 = #L1_2
      L9_2 = L9_2 + 1
      L10_2 = {}
      L10_2.itemName = L8_2
      L11_2 = tostring
      L12_2 = L7_2.amount
      if not L12_2 then
        L12_2 = 1
      end
      L11_2 = L11_2(L12_2)
      L10_2.amount = L11_2
      L11_2 = tostring
      L12_2 = L7_2.chance
      if not L12_2 then
        L12_2 = 100
      end
      L11_2 = L11_2(L12_2)
      L10_2.chance = L11_2
      L1_2[L9_2] = L10_2
    end
  end
  return L1_2
end
function L36_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2 or L4_2
  if not A0_2 then
    L4_2 = {}
  end
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L10_1
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if "" ~= L9_2 then
      L10_2 = L2_2[L9_2]
      if not L10_2 then
        L2_2[L9_2] = true
        L10_2 = #L1_2
        L10_2 = L10_2 + 1
        L1_2[L10_2] = L9_2
      end
    end
  end
  return L1_2
end
L1_1 = L36_1
function L36_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = L19_1
  L1_2 = L1_2()
  L2_2 = L1_1
  L3_2 = A0_2.policeJobs
  L2_2 = L2_2(L3_2)
  L3_2 = type
  L4_2 = L1_2.missionNpc
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = L1_2.missionNpc
    if L3_2 then
      goto lbl_26
    end
  end
  L3_2 = {}
  ::lbl_26::
  L4_2 = type
  L5_2 = A0_2.missionNpc
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = A0_2.missionNpc
    if L4_2 then
      goto lbl_36
    end
  end
  L4_2 = {}
  ::lbl_36::
  L5_2 = L17_1
  L6_2 = L4_2.coords
  if not L6_2 then
    L6_2 = A0_2.missionNpcCoords
  end
  L5_2 = L5_2(L6_2)
  L6_2 = #L2_2
  if 0 == L6_2 then
    L6_2 = L1_1
    L7_2 = L1_2.policeJobs
    L6_2 = L6_2(L7_2)
    L2_2 = L6_2
  end
  L6_2 = {}
  L7_2 = A0_2.sendAlert
  L7_2 = true == L7_2
  L6_2.sendAlert = L7_2
  L7_2 = tostring
  L8_2 = A0_2.alertChance
  if not L8_2 then
    L8_2 = L1_2.alertChance
  end
  L7_2 = L7_2(L8_2)
  L6_2.alertChance = L7_2
  L7_2 = L10_1
  L8_2 = A0_2.policeAlertHeader
  if not L8_2 then
    L8_2 = L1_2.policeAlertHeader
  end
  L7_2 = L7_2(L8_2)
  L6_2.policeAlertHeader = L7_2
  L7_2 = L10_1
  L8_2 = A0_2.policeAlert
  if not L8_2 then
    L8_2 = L1_2.policeAlert
  end
  L7_2 = L7_2(L8_2)
  L6_2.policeAlert = L7_2
  L6_2.policeJobs = L2_2
  L7_2 = L10_1
  L8_2 = A0_2.alertCode
  if not L8_2 then
    L8_2 = L1_2.alertCode
  end
  L7_2 = L7_2(L8_2)
  L6_2.alertCode = L7_2
  L7_2 = L10_1
  L8_2 = A0_2.alertIcon
  if not L8_2 then
    L8_2 = L1_2.alertIcon
  end
  L7_2 = L7_2(L8_2)
  L6_2.alertIcon = L7_2
  L7_2 = tostring
  L8_2 = A0_2.alertPriority
  if not L8_2 then
    L8_2 = L1_2.alertPriority
  end
  L7_2 = L7_2(L8_2)
  L6_2.alertPriority = L7_2
  L7_2 = L10_1
  L8_2 = A0_2.alertCamId
  if not L8_2 then
    L8_2 = L1_2.alertCamId
  end
  L7_2 = L7_2(L8_2)
  L6_2.alertCamId = L7_2
  L7_2 = tostring
  L8_2 = A0_2.blipSprite
  if not L8_2 then
    L8_2 = L1_2.blipSprite
  end
  L7_2 = L7_2(L8_2)
  L6_2.blipSprite = L7_2
  L7_2 = tostring
  L8_2 = A0_2.blipColor
  if not L8_2 then
    L8_2 = L1_2.blipColor
  end
  L7_2 = L7_2(L8_2)
  L6_2.blipColor = L7_2
  L7_2 = tostring
  L8_2 = A0_2.blipScale
  if not L8_2 then
    L8_2 = L1_2.blipScale
  end
  L7_2 = L7_2(L8_2)
  L6_2.blipScale = L7_2
  L7_2 = L10_1
  L8_2 = A0_2.alertSound1
  if not L8_2 then
    L8_2 = L1_2.alertSound1
  end
  L7_2 = L7_2(L8_2)
  L6_2.alertSound1 = L7_2
  L7_2 = A0_2.blipFlash
  L7_2 = true == L7_2
  L6_2.blipFlash = L7_2
  L7_2 = A0_2.missionNpcEnabled
  L7_2 = true == L7_2 and nil ~= L5_2
  L6_2.missionNpcEnabled = L7_2
  L7_2 = {}
  L7_2.coords = L5_2
  L8_2 = tonumber
  L9_2 = L4_2.heading
  if not L9_2 then
    L9_2 = A0_2.missionNpcHeading
    if not L9_2 then
      L9_2 = L3_2.heading
    end
  end
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = 0.0
  end
  L7_2.heading = L8_2
  L8_2 = L10_1
  L9_2 = L4_2.model
  if not L9_2 then
    L9_2 = A0_2.missionNpcModel
    if not L9_2 then
      L9_2 = L3_2.model
      if not L9_2 then
        L9_2 = "a_m_y_business_03"
      end
    end
  end
  L8_2 = L8_2(L9_2)
  L7_2.model = L8_2
  L8_2 = L10_1
  L9_2 = L4_2.interactionLabel
  if not L9_2 then
    L9_2 = A0_2.missionNpcInteractionLabel
    if not L9_2 then
      L9_2 = L3_2.interactionLabel
      if not L9_2 then
        L9_2 = "Request House Lead"
      end
    end
  end
  L8_2 = L8_2(L9_2)
  L7_2.interactionLabel = L8_2
  L8_2 = nil ~= L5_2
  L7_2.placed = L8_2
  L6_2.missionNpc = L7_2
  return L6_2
end
function L37_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = L20_1
  L1_2 = L1_2()
  L2_2 = A0_2.xpOptionsEnabled
  L2_2 = true == L2_2
  L3_2 = {}
  L4_2 = A0_2.enabled
  L4_2 = false ~= L4_2
  L3_2.enabled = L4_2
  L4_2 = L10_1
  L5_2 = A0_2.interactionLabel
  if not L5_2 then
    L5_2 = L1_2.interactionLabel
  end
  L4_2 = L4_2(L5_2)
  L3_2.interactionLabel = L4_2
  L4_2 = L10_1
  L5_2 = A0_2.progressLabel
  if not L5_2 then
    L5_2 = L1_2.progressLabel
  end
  L4_2 = L4_2(L5_2)
  L3_2.progressLabel = L4_2
  L4_2 = tonumber
  L5_2 = A0_2.progressDuration
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = L1_2.progressDuration
  end
  L3_2.progressDuration = L4_2
  L4_2 = L10_1
  L5_2 = A0_2.minigameOption
  if not L5_2 then
    L5_2 = L1_2.minigameOption
  end
  L4_2 = L4_2(L5_2)
  L3_2.minigameOption = L4_2
  L4_2 = A0_2.requiredItemsEnabled
  L4_2 = true == L4_2
  L3_2.requiredItemsEnabled = L4_2
  L4_2 = L35_1
  L5_2 = A0_2.requiredItems
  L4_2 = L4_2(L5_2)
  L3_2.requiredItems = L4_2
  L4_2 = A0_2.rewardItemsEnabled
  L4_2 = true == L4_2
  L3_2.rewardItemsEnabled = L4_2
  L4_2 = L34_1
  L5_2 = A0_2.rewardItems
  L4_2 = L4_2(L5_2)
  L3_2.rewardItems = L4_2
  L4_2 = A0_2.moneyRewardEnabled
  L4_2 = true == L4_2
  L3_2.moneyRewardEnabled = L4_2
  L4_2 = L10_1
  L5_2 = A0_2.rewardType
  if not L5_2 then
    L5_2 = L1_2.rewardType
  end
  L4_2 = L4_2(L5_2)
  L3_2.rewardType = L4_2
  L4_2 = tostring
  L5_2 = A0_2.minMoney
  if not L5_2 then
    L5_2 = L1_2.minMoney
  end
  L4_2 = L4_2(L5_2)
  L3_2.minMoney = L4_2
  L4_2 = tostring
  L5_2 = A0_2.maxMoney
  if not L5_2 then
    L5_2 = L1_2.maxMoney
  end
  L4_2 = L4_2(L5_2)
  L3_2.maxMoney = L4_2
  L4_2 = tostring
  L5_2 = A0_2.moneyChance
  if not L5_2 then
    L5_2 = L1_2.moneyChance
  end
  L4_2 = L4_2(L5_2)
  L3_2.moneyChance = L4_2
  L3_2.xpOptionsEnabled = L2_2
  L4_2 = tostring
  L5_2 = A0_2.xpRewardAmount
  if not L5_2 then
    L5_2 = L1_2.xpRewardAmount
  end
  L4_2 = L4_2(L5_2)
  L3_2.xpRewardAmount = L4_2
  L4_2 = tostring
  L5_2 = A0_2.xpNeededAmount
  if not L5_2 then
    L5_2 = L1_2.xpNeededAmount
  end
  L4_2 = L4_2(L5_2)
  L3_2.xpNeededAmount = L4_2
  L4_2 = L2_2 or L4_2
  if L2_2 then
    L4_2 = A0_2.removeXpOnHit
    L4_2 = true == L4_2
  end
  L3_2.removeXpOnHit = L4_2
  L4_2 = tostring
  L5_2 = A0_2.xpRemoveAmount
  if not L5_2 then
    L5_2 = L1_2.xpRemoveAmount
  end
  L4_2 = L4_2(L5_2)
  L3_2.xpRemoveAmount = L4_2
  return L3_2
end
function L38_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = L17_1
  L3_2 = A0_2.coords
  if not L3_2 then
    L3_2 = A0_2.offset
    if not L3_2 then
      L3_2 = A0_2.position
    end
  end
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = tonumber
  L4_2 = A0_2.heading
  L3_2 = L3_2(L4_2)
  if nil == L3_2 then
    L4_2 = tonumber
    L5_2 = A0_2.pedHeading
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2 or L3_2
    if not L4_2 then
      L4_2 = tonumber
      L5_2 = A0_2.propHeading
      L4_2 = L4_2(L5_2)
      L3_2 = L4_2 or L3_2
      if not L4_2 then
        L3_2 = 0.0
      end
    end
  end
  L4_2 = tonumber
  L5_2 = A0_2.pedHeading
  L4_2 = L4_2(L5_2)
  if nil == L4_2 or 0.0 == L4_2 and 0.0 ~= L3_2 then
    L4_2 = L3_2
  end
  L5_2 = tonumber
  L6_2 = A0_2.propHeading
  L5_2 = L5_2(L6_2)
  if nil == L5_2 or 0.0 == L5_2 and 0.0 ~= L3_2 then
    L5_2 = L3_2
  end
  L6_2 = A0_2.isPlaced
  L6_2 = false == L6_2
  L7_2 = L18_1
  L8_2 = L2_2
  L7_2 = L7_2(L8_2)
  L7_2 = nil ~= L2_2 and L7_2
  L8_2 = L10_1
  L9_2 = A0_2.label
  if not L9_2 then
    L9_2 = A0_2.targetText
    if not L9_2 then
      L9_2 = A0_2.TargetText
      if not L9_2 then
        L9_2 = A0_2.targetLabel
        if not L9_2 then
          L9_2 = A0_2.TargetLabel
          if not L9_2 then
            L9_2 = A0_2.optionLabel
            if not L9_2 then
              L9_2 = A0_2.name
              if not L9_2 then
                L9_2 = "Search"
              end
            end
          end
        end
      end
    end
  end
  L8_2 = L8_2(L9_2)
  if "" == L8_2 then
    L8_2 = "Search"
  end
  L9_2 = A0_2.xpOptions
  L9_2 = nil ~= L9_2
  L10_2 = tonumber
  L11_2 = A0_2.xpRewardAmount
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = 0
  end
  L10_2 = L10_2 > 0
  L11_2 = false
  if L9_2 then
    L12_2 = A0_2.xpOptions
    L11_2 = true == L12_2
  else
    L11_2 = L10_2
  end
  L12_2 = {}
  L13_2 = L10_1
  L14_2 = A0_2.id
  if not L14_2 then
    L14_2 = "loot_"
    L15_2 = tostring
    L16_2 = A1_2
    L15_2 = L15_2(L16_2)
    L14_2 = L14_2 .. L15_2
  end
  L13_2 = L13_2(L14_2)
  L12_2.id = L13_2
  L12_2.label = L8_2
  L12_2.isPlaced = L7_2
  L12_2.placed = L7_2
  L12_2.coords = L2_2
  L12_2.heading = L3_2
  L13_2 = L17_1
  L14_2 = A0_2.pedCoords
  L13_2 = L13_2(L14_2)
  L12_2.pedCoords = L13_2
  L12_2.pedHeading = L4_2
  L13_2 = L10_1
  L14_2 = A0_2.prop
  if not L14_2 then
    L14_2 = A0_2.propName
    if not L14_2 then
      L14_2 = ""
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.prop = L13_2
  L13_2 = L10_1
  L14_2 = A0_2.animation
  if not L14_2 then
    L14_2 = ""
  end
  L13_2 = L13_2(L14_2)
  L12_2.animation = L13_2
  L12_2.propHeading = L5_2
  L13_2 = tostring
  L14_2 = A0_2.numberValue
  if not L14_2 then
    L14_2 = A1_2
  end
  L13_2 = L13_2(L14_2)
  L12_2.numberValue = L13_2
  L13_2 = tostring
  L14_2 = A0_2.createChance
  if not L14_2 then
    L14_2 = A0_2.targetCreateChance
    if not L14_2 then
      L14_2 = A0_2.spawnChance
      if not L14_2 then
        L14_2 = 100
      end
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.createChance = L13_2
  L13_2 = A0_2.minigameCheckbox
  L13_2 = true == L13_2
  L12_2.minigameCheckbox = L13_2
  L13_2 = L10_1
  L14_2 = A0_2.minigameType
  if not L14_2 then
    L14_2 = "none"
  end
  L13_2 = L13_2(L14_2)
  L12_2.minigameType = L13_2
  L13_2 = tostring
  L14_2 = A0_2.failPoliceChance
  if not L14_2 then
    L14_2 = A0_2.alertChance
    if not L14_2 then
      L14_2 = 0
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.failPoliceChance = L13_2
  L13_2 = A0_2.requiresItem
  L13_2 = true == L13_2
  L12_2.requiresItem = L13_2
  L13_2 = L35_1
  L14_2 = A0_2.requiredItems
  L13_2 = L13_2(L14_2)
  L12_2.requiredItems = L13_2
  L13_2 = A0_2.rewardItem
  L13_2 = true == L13_2
  L12_2.rewardItem = L13_2
  L13_2 = L34_1
  L14_2 = A0_2.rewardItems
  L13_2 = L13_2(L14_2)
  L12_2.rewardItems = L13_2
  L13_2 = A0_2.rewardMoney
  L13_2 = true == L13_2
  L12_2.rewardMoney = L13_2
  L13_2 = L10_1
  L14_2 = A0_2.rewardMoneyType
  if not L14_2 then
    L14_2 = A0_2.rewardType
    if not L14_2 then
      L14_2 = "cash"
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.rewardMoneyType = L13_2
  L13_2 = tostring
  L14_2 = A0_2.rewardMoneyMin
  if not L14_2 then
    L14_2 = A0_2.minMoney
    if not L14_2 then
      L14_2 = 1
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.rewardMoneyMin = L13_2
  L13_2 = tostring
  L14_2 = A0_2.rewardMoneyMax
  if not L14_2 then
    L14_2 = A0_2.maxMoney
    if not L14_2 then
      L14_2 = 1
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.rewardMoneyMax = L13_2
  L13_2 = tostring
  L14_2 = A0_2.moneyChance
  if not L14_2 then
    L14_2 = 100
  end
  L13_2 = L13_2(L14_2)
  L12_2.moneyChance = L13_2
  L13_2 = A0_2.delayRewardCheckbox
  L13_2 = true == L13_2
  L12_2.delayRewardCheckbox = L13_2
  L13_2 = tostring
  L14_2 = A0_2.rewardDelayTime
  if not L14_2 then
    L14_2 = 1
  end
  L13_2 = L13_2(L14_2)
  L12_2.rewardDelayTime = L13_2
  L12_2.xpOptions = L11_2
  L13_2 = tostring
  L14_2 = A0_2.xpRewardAmount
  if not L14_2 then
    L14_2 = 0
  end
  L13_2 = L13_2(L14_2)
  L12_2.xpRewardAmount = L13_2
  L13_2 = tostring
  L14_2 = A0_2.xpNeededAmount
  if not L14_2 then
    L14_2 = 0
  end
  L13_2 = L13_2(L14_2)
  L12_2.xpNeededAmount = L13_2
  L13_2 = L11_2 or L13_2
  if L11_2 then
    L13_2 = A0_2.removeXpOnHit
    L13_2 = true == L13_2
  end
  L12_2.removeXpOnHit = L13_2
  L13_2 = tostring
  L14_2 = A0_2.xpRemoveAmount
  if not L14_2 then
    L14_2 = 0
  end
  L13_2 = L13_2(L14_2)
  L12_2.xpRemoveAmount = L13_2
  L13_2 = A0_2.requireWeaponInHand
  L13_2 = true == L13_2
  L12_2.requireWeaponInHand = L13_2
  L13_2 = L1_1
  L14_2 = A0_2.requiredWeapons
  L13_2 = L13_2(L14_2)
  L12_2.requiredWeapons = L13_2
  return L12_2
end
function L39_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L17_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = {}
  L3_2 = L1_2.x
  L4_2 = L1_2.y
  L5_2 = L1_2.z
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  return L2_2
end
function L40_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = L39_1
  L3_2 = A0_2.startVector
  if not L3_2 then
    L3_2 = A0_2.vector1
    if not L3_2 then
      L3_2 = A0_2.start
    end
  end
  L2_2 = L2_2(L3_2)
  L3_2 = L39_1
  L4_2 = A0_2.endVector
  if not L4_2 then
    L4_2 = A0_2.vector2
    if not L4_2 then
      L4_2 = A0_2["end"]
      if not L4_2 then
        L4_2 = A0_2.endPos
      end
    end
  end
  L3_2 = L3_2(L4_2)
  if not L2_2 or not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = nil
  L5_2 = type
  L6_2 = A0_2.movement
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = {}
    L6_2 = L10_1
    L7_2 = A0_2.movement
    L7_2 = L7_2.direction
    if not L7_2 then
      L7_2 = "none"
    end
    L6_2 = L6_2(L7_2)
    L5_2.direction = L6_2
    L6_2 = tonumber
    L7_2 = A0_2.movement
    L7_2 = L7_2.amount
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = 0.0
    end
    L5_2.amount = L6_2
    L6_2 = tonumber
    L7_2 = A0_2.movement
    L7_2 = L7_2.speed
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = 0.007
    end
    L5_2.speed = L6_2
    L4_2 = L5_2
  end
  L5_2 = {}
  L6_2 = L10_1
  L7_2 = A0_2.id
  if not L7_2 then
    L7_2 = "laser_"
    L8_2 = tostring
    L9_2 = A1_2
    L8_2 = L8_2(L9_2)
    L7_2 = L7_2 .. L8_2
  end
  L6_2 = L6_2(L7_2)
  L5_2.id = L6_2
  L5_2.startVector = L2_2
  L5_2.endVector = L3_2
  L6_2 = tonumber
  L7_2 = A0_2.intensity
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 100.0
  end
  L5_2.intensity = L6_2
  L5_2.movement = L4_2
  return L5_2
end
function L41_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = L10_1
  L3_2 = A0_2.minigameType
  if not L3_2 then
    L3_2 = A0_2.minigameOption
    if not L3_2 then
      L3_2 = ""
    end
  end
  L2_2 = L2_2(L3_2)
  L3_2 = L10_1
  L4_2 = A1_2.minigameType
  if not L4_2 then
    L4_2 = A1_2.minigameOption
    if not L4_2 then
      L4_2 = ""
    end
  end
  L3_2 = L3_2(L4_2)
  if "" ~= L2_2 and "none" ~= L2_2 then
    return L2_2
  end
  if "" ~= L3_2 and "none" ~= L3_2 then
    return L3_2
  end
  if "" ~= L2_2 then
    return L2_2
  end
  if "" ~= L3_2 then
    return L3_2
  end
  L4_2 = "none"
  return L4_2
end
function L42_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = type
  L2_2 = A0_2.keypad
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.keypad
    if L1_2 then
      goto lbl_21
    end
  end
  L1_2 = {}
  ::lbl_21::
  L2_2 = L17_1
  L3_2 = A0_2.keypad
  if L3_2 then
    L3_2 = A0_2.keypad
    L3_2 = L3_2.coords
    if L3_2 then
      goto lbl_30
    end
  end
  L3_2 = A0_2.keypadCoords
  ::lbl_30::
  L2_2 = L2_2(L3_2)
  L3_2 = A0_2.isPlaced
  L3_2 = false == L3_2
  L4_2 = L18_1
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = nil ~= L2_2 and L4_2
  L5_2 = L41_1
  L6_2 = A0_2
  L7_2 = L1_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = nil
  if L4_2 then
    L7_2 = {}
    L8_2 = L10_1
    L9_2 = L1_2.prop
    if not L9_2 then
      L9_2 = "prop_ld_keypad_01b"
    end
    L8_2 = L8_2(L9_2)
    L7_2.prop = L8_2
    L8_2 = L10_1
    L9_2 = L1_2.label
    if not L9_2 then
      L9_2 = "Security Keypad"
    end
    L8_2 = L8_2(L9_2)
    L7_2.label = L8_2
    L7_2.coords = L2_2
    L8_2 = tonumber
    L9_2 = L1_2.heading
    if not L9_2 then
      L9_2 = A0_2.keypadHeading
    end
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      L8_2 = 0.0
    end
    L7_2.heading = L8_2
    L7_2.placed = true
    L8_2 = A0_2.minigameCheckbox
    L8_2 = true == L8_2
    L7_2.minigameCheckbox = L8_2
    L7_2.minigameType = L5_2
    L6_2 = L7_2
  end
  L7_2 = {}
  L8_2 = ipairs
  L9_2 = A0_2.lasers
  if not L9_2 then
    L9_2 = {}
  end
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = L40_1
    L15_2 = L13_2
    L16_2 = L12_2
    L14_2 = L14_2(L15_2, L16_2)
    if L14_2 then
      L15_2 = #L7_2
      L15_2 = L15_2 + 1
      L7_2[L15_2] = L14_2
    end
  end
  L8_2 = {}
  L9_2 = L10_1
  L10_2 = A0_2.id
  if not L10_2 then
    L10_2 = "security_system"
  end
  L9_2 = L9_2(L10_2)
  L8_2.id = L9_2
  L9_2 = L10_1
  L10_2 = A0_2.label
  if not L10_2 then
    if L6_2 then
      L10_2 = L6_2.label
      if L10_2 then
        goto lbl_143
      end
    end
    L10_2 = "Security System"
  end
  ::lbl_143::
  L9_2 = L9_2(L10_2)
  L8_2.label = L9_2
  L9_2 = tostring
  L10_2 = A0_2.numberValue
  if not L10_2 then
    L10_2 = "security"
  end
  L9_2 = L9_2(L10_2)
  L8_2.numberValue = L9_2
  L8_2.isPlaced = L4_2
  if L6_2 then
    L9_2 = L6_2.coords
    if L9_2 then
      goto lbl_163
    end
  end
  L9_2 = {}
  L9_2.x = 0.0
  L9_2.y = 0.0
  L9_2.z = 0.0
  ::lbl_163::
  L8_2.coords = L9_2
  L9_2 = tonumber
  L10_2 = A0_2.heading
  if not L10_2 then
    if L6_2 then
      L10_2 = L6_2.heading
      if L10_2 then
        goto lbl_174
      end
    end
    L10_2 = 0.0
  end
  ::lbl_174::
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 0.0
  end
  L8_2.heading = L9_2
  if L6_2 then
    L9_2 = L6_2.coords
    if L9_2 then
      goto lbl_189
    end
  end
  L9_2 = {}
  L9_2.x = 0.0
  L9_2.y = 0.0
  L9_2.z = 0.0
  ::lbl_189::
  L8_2.pedCoords = L9_2
  L9_2 = tonumber
  L10_2 = A0_2.pedHeading
  if not L10_2 then
    L10_2 = A0_2.heading
    if not L10_2 then
      if L6_2 then
        L10_2 = L6_2.heading
        if L10_2 then
          goto lbl_203
        end
      end
      L10_2 = 0.0
    end
  end
  ::lbl_203::
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 0.0
  end
  L8_2.pedHeading = L9_2
  L9_2 = L10_1
  L10_2 = A0_2.prop
  if not L10_2 then
    if L6_2 then
      L10_2 = L6_2.prop
      if L10_2 then
        goto lbl_218
      end
    end
    L10_2 = "prop_ld_keypad_01b"
  end
  ::lbl_218::
  L9_2 = L9_2(L10_2)
  L8_2.prop = L9_2
  L9_2 = L10_1
  L10_2 = A0_2.animation
  if not L10_2 then
    L10_2 = ""
  end
  L9_2 = L9_2(L10_2)
  L8_2.animation = L9_2
  L9_2 = tonumber
  L10_2 = A0_2.propHeading
  if not L10_2 then
    L10_2 = A0_2.heading
    if not L10_2 then
      if L6_2 then
        L10_2 = L6_2.heading
        if L10_2 then
          goto lbl_240
        end
      end
      L10_2 = 0.0
    end
  end
  ::lbl_240::
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 0.0
  end
  L8_2.propHeading = L9_2
  L9_2 = A0_2.minigameCheckbox
  L9_2 = true == L9_2
  L8_2.minigameCheckbox = L9_2
  L8_2.minigameType = L5_2
  L9_2 = tostring
  L10_2 = A0_2.failPoliceChance
  if not L10_2 then
    L10_2 = A0_2.alertChance
    if not L10_2 then
      L10_2 = 0
    end
  end
  L9_2 = L9_2(L10_2)
  L8_2.failPoliceChance = L9_2
  L9_2 = A0_2.requiresItem
  L9_2 = true == L9_2
  L8_2.requiresItem = L9_2
  L9_2 = L35_1
  L10_2 = A0_2.requiredItems
  L9_2 = L9_2(L10_2)
  L8_2.requiredItems = L9_2
  L9_2 = A0_2.rewardItem
  L9_2 = true == L9_2
  L8_2.rewardItem = L9_2
  L9_2 = L34_1
  L10_2 = A0_2.rewardItems
  L9_2 = L9_2(L10_2)
  L8_2.rewardItems = L9_2
  L9_2 = A0_2.rewardMoney
  L9_2 = true == L9_2
  L8_2.rewardMoney = L9_2
  L9_2 = L10_1
  L10_2 = A0_2.rewardMoneyType
  if not L10_2 then
    L10_2 = A0_2.rewardType
    if not L10_2 then
      L10_2 = "cash"
    end
  end
  L9_2 = L9_2(L10_2)
  L8_2.rewardMoneyType = L9_2
  L9_2 = tostring
  L10_2 = A0_2.rewardMoneyMin
  if not L10_2 then
    L10_2 = A0_2.minMoney
    if not L10_2 then
      L10_2 = 1
    end
  end
  L9_2 = L9_2(L10_2)
  L8_2.rewardMoneyMin = L9_2
  L9_2 = tostring
  L10_2 = A0_2.rewardMoneyMax
  if not L10_2 then
    L10_2 = A0_2.maxMoney
    if not L10_2 then
      L10_2 = 1
    end
  end
  L9_2 = L9_2(L10_2)
  L8_2.rewardMoneyMax = L9_2
  L9_2 = tostring
  L10_2 = A0_2.moneyChance
  if not L10_2 then
    L10_2 = 100
  end
  L9_2 = L9_2(L10_2)
  L8_2.moneyChance = L9_2
  L9_2 = A0_2.delayRewardCheckbox
  L9_2 = true == L9_2
  L8_2.delayRewardCheckbox = L9_2
  L9_2 = tostring
  L10_2 = A0_2.rewardDelayTime
  if not L10_2 then
    L10_2 = 1
  end
  L9_2 = L9_2(L10_2)
  L8_2.rewardDelayTime = L9_2
  L9_2 = A0_2.requireWeaponInHand
  L9_2 = true == L9_2
  L8_2.requireWeaponInHand = L9_2
  L9_2 = L1_1
  L10_2 = A0_2.requiredWeapons
  L9_2 = L9_2(L10_2)
  L8_2.requiredWeapons = L9_2
  L8_2.keypad = L6_2
  L8_2.lasers = L7_2
  return L8_2
end
function L43_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = L17_1
  L2_2 = A0_2.coords
  if not L2_2 then
    L2_2 = A0_2.position
  end
  L1_2 = L1_2(L2_2)
  L2_2 = nil ~= L1_2
  L3_2 = L10_1
  L4_2 = A0_2.stance
  if not L4_2 then
    L4_2 = "sleeping"
  end
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2
  L3_2 = L3_2.lower
  L3_2 = L3_2(L4_2)
  if "standing" ~= L3_2 then
    L3_2 = "sleeping"
  end
  L4_2 = {}
  L5_2 = L10_1
  L6_2 = A0_2.id
  if not L6_2 then
    L6_2 = "home_owner"
  end
  L5_2 = L5_2(L6_2)
  L4_2.id = L5_2
  L5_2 = L10_1
  L6_2 = A0_2.label
  if not L6_2 then
    L6_2 = "Home Owner"
  end
  L5_2 = L5_2(L6_2)
  L4_2.label = L5_2
  L5_2 = tostring
  L6_2 = A0_2.numberValue
  if not L6_2 then
    L6_2 = "owner"
  end
  L5_2 = L5_2(L6_2)
  L4_2.numberValue = L5_2
  L4_2.isPlaced = L2_2
  L5_2 = L10_1
  L6_2 = A0_2.model
  if not L6_2 then
    L6_2 = "mp_m_freemode_01"
  end
  L5_2 = L5_2(L6_2)
  L4_2.model = L5_2
  L4_2.stance = L3_2
  L5_2 = L1_2 or L5_2
  if not L1_2 then
    L5_2 = {}
    L5_2.x = 0.0
    L5_2.y = 0.0
    L5_2.z = 0.0
  end
  L4_2.coords = L5_2
  L5_2 = tonumber
  L6_2 = A0_2.heading
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0.0
  end
  L4_2.heading = L5_2
  L5_2 = L1_2 or L5_2
  if not L1_2 then
    L5_2 = {}
    L5_2.x = 0.0
    L5_2.y = 0.0
    L5_2.z = 0.0
  end
  L4_2.pedCoords = L5_2
  L5_2 = tonumber
  L6_2 = A0_2.pedHeading
  if not L6_2 then
    L6_2 = A0_2.heading
  end
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0.0
  end
  L4_2.pedHeading = L5_2
  L5_2 = L10_1
  L6_2 = A0_2.prop
  if not L6_2 then
    L6_2 = ""
  end
  L5_2 = L5_2(L6_2)
  L4_2.prop = L5_2
  L5_2 = L10_1
  L6_2 = A0_2.animation
  if not L6_2 then
    L6_2 = ""
  end
  L5_2 = L5_2(L6_2)
  L4_2.animation = L5_2
  L5_2 = tonumber
  L6_2 = A0_2.propHeading
  if not L6_2 then
    L6_2 = A0_2.heading
  end
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0.0
  end
  L4_2.propHeading = L5_2
  L5_2 = A0_2.minigameCheckbox
  L5_2 = true == L5_2
  L4_2.minigameCheckbox = L5_2
  L5_2 = L10_1
  L6_2 = A0_2.minigameType
  if not L6_2 then
    L6_2 = "none"
  end
  L5_2 = L5_2(L6_2)
  L4_2.minigameType = L5_2
  L5_2 = tostring
  L6_2 = A0_2.failPoliceChance
  if not L6_2 then
    L6_2 = A0_2.alertChance
    if not L6_2 then
      L6_2 = 0
    end
  end
  L5_2 = L5_2(L6_2)
  L4_2.failPoliceChance = L5_2
  L5_2 = A0_2.requiresItem
  L5_2 = true == L5_2
  L4_2.requiresItem = L5_2
  L5_2 = L35_1
  L6_2 = A0_2.requiredItems
  L5_2 = L5_2(L6_2)
  L4_2.requiredItems = L5_2
  L5_2 = A0_2.rewardItem
  L5_2 = true == L5_2
  L4_2.rewardItem = L5_2
  L5_2 = L34_1
  L6_2 = A0_2.rewardItems
  L5_2 = L5_2(L6_2)
  L4_2.rewardItems = L5_2
  L5_2 = A0_2.rewardMoney
  L5_2 = true == L5_2
  L4_2.rewardMoney = L5_2
  L5_2 = L10_1
  L6_2 = A0_2.rewardMoneyType
  if not L6_2 then
    L6_2 = A0_2.rewardType
    if not L6_2 then
      L6_2 = "cash"
    end
  end
  L5_2 = L5_2(L6_2)
  L4_2.rewardMoneyType = L5_2
  L5_2 = tostring
  L6_2 = A0_2.rewardMoneyMin
  if not L6_2 then
    L6_2 = A0_2.minMoney
    if not L6_2 then
      L6_2 = 1
    end
  end
  L5_2 = L5_2(L6_2)
  L4_2.rewardMoneyMin = L5_2
  L5_2 = tostring
  L6_2 = A0_2.rewardMoneyMax
  if not L6_2 then
    L6_2 = A0_2.maxMoney
    if not L6_2 then
      L6_2 = 1
    end
  end
  L5_2 = L5_2(L6_2)
  L4_2.rewardMoneyMax = L5_2
  L5_2 = tostring
  L6_2 = A0_2.moneyChance
  if not L6_2 then
    L6_2 = 100
  end
  L5_2 = L5_2(L6_2)
  L4_2.moneyChance = L5_2
  L5_2 = A0_2.delayRewardCheckbox
  L5_2 = true == L5_2
  L4_2.delayRewardCheckbox = L5_2
  L5_2 = tostring
  L6_2 = A0_2.rewardDelayTime
  if not L6_2 then
    L6_2 = 1
  end
  L5_2 = L5_2(L6_2)
  L4_2.rewardDelayTime = L5_2
  L5_2 = A0_2.requireWeaponInHand
  L5_2 = true == L5_2
  L4_2.requireWeaponInHand = L5_2
  L5_2 = L1_1
  L6_2 = A0_2.requiredWeapons
  L5_2 = L5_2(L6_2)
  L4_2.requiredWeapons = L5_2
  L5_2 = L10_1
  L6_2 = A0_2.animDict
  if not L6_2 then
    L6_2 = "timetable@tracy@sleep@"
  end
  L5_2 = L5_2(L6_2)
  L4_2.animDict = L5_2
  L5_2 = L10_1
  L6_2 = A0_2.animAction
  if not L6_2 then
    L6_2 = "idle_c"
  end
  L5_2 = L5_2(L6_2)
  L4_2.animAction = L5_2
  return L4_2
end
function L44_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = {}
  L3_2 = L10_1
  L4_2 = A0_2.id
  if not L4_2 then
    L4_2 = "preset_"
    L5_2 = tostring
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2 .. L5_2
  end
  L3_2 = L3_2(L4_2)
  L2_2.id = L3_2
  L3_2 = L10_1
  L4_2 = A0_2.label
  if not L4_2 then
    L4_2 = "Preset "
    L5_2 = tostring
    L6_2 = A1_2
    L5_2 = L5_2(L6_2)
    L4_2 = L4_2 .. L5_2
  end
  L3_2 = L3_2(L4_2)
  L2_2.label = L3_2
  L3_2 = {}
  L2_2.lootPoints = L3_2
  L3_2 = L42_1
  L4_2 = A0_2.securitySystem
  L3_2 = L3_2(L4_2)
  L2_2.securitySystem = L3_2
  L3_2 = L43_1
  L4_2 = A0_2.homeOwner
  L3_2 = L3_2(L4_2)
  L2_2.homeOwner = L3_2
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = A0_2.lootPoints
  if not L5_2 then
    L5_2 = {}
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L38_1
    L11_2 = L9_2
    L12_2 = L8_2
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 then
      L11_2 = L10_1
      L12_2 = L10_2.id
      if not L12_2 then
        L12_2 = "loot_"
        L13_2 = tostring
        L14_2 = L8_2
        L13_2 = L13_2(L14_2)
        L12_2 = L12_2 .. L13_2
      end
      L11_2 = L11_2(L12_2)
      if "" == L11_2 then
        L12_2 = "loot_"
        L13_2 = tostring
        L14_2 = L8_2
        L13_2 = L13_2(L14_2)
        L12_2 = L12_2 .. L13_2
        L11_2 = L12_2
      end
      L12_2 = L11_2
      L13_2 = 2
      while true do
        L14_2 = L3_2[L12_2]
        if not L14_2 then
          break
        end
        L14_2 = L11_2
        L15_2 = "_"
        L16_2 = tostring
        L17_2 = L13_2
        L16_2 = L16_2(L17_2)
        L14_2 = L14_2 .. L15_2 .. L16_2
        L12_2 = L14_2
        L13_2 = L13_2 + 1
      end
      L10_2.id = L12_2
      L3_2[L12_2] = true
      L14_2 = L2_2.lootPoints
      L15_2 = L2_2.lootPoints
      L15_2 = #L15_2
      L15_2 = L15_2 + 1
      L14_2[L15_2] = L10_2
    end
  end
  return L2_2
end
function L45_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = ipairs
  L2_2 = Config
  L2_2 = L2_2.HouseRobberyShellModels
  if not L2_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L10_1
    L8_2 = L6_2.model
    L7_2 = L7_2(L8_2)
    if L7_2 == A0_2 then
      return L6_2
    end
  end
end
function L46_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L45_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = L16_1
    L3_2 = L1_2.enterOffset
    L4_2 = {}
    L4_2.x = 1.46
    L4_2.y = -10.33
    L4_2.z = 1.06
    L4_2.w = 0.0
    return L2_2(L3_2, L4_2)
  end
  L2_2 = {}
  L2_2.x = 1.46
  L2_2.y = -10.33
  L2_2.z = 1.06
  L2_2.w = 0.0
  return L2_2
end
function L47_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = L10_1
  L3_2 = A0_2.model
  L2_2 = L2_2(L3_2)
  if "" == L2_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = L45_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = {}
  end
  L4_2 = L10_1
  L5_2 = A0_2.shellType
  if not L5_2 then
    L5_2 = A0_2.type
    if not L5_2 then
      L5_2 = L3_2.shellType
      if not L5_2 then
        L5_2 = L3_2.type
        if not L5_2 then
          L5_2 = "shell"
        end
      end
    end
  end
  L4_2 = L4_2(L5_2)
  L5_2 = A0_2.isWorldInterior
  L5_2 = true == L5_2
  L6_2 = A0_2.ipls
  if not L6_2 then
    L6_2 = A0_2.ipl
    if not L6_2 then
      L6_2 = L3_2.ipls
      if not L6_2 then
        L6_2 = L3_2.ipl
      end
    end
  end
  L7_2 = {}
  L8_2 = type
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  if "table" == L8_2 then
    L8_2 = L1_1
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    L7_2 = L8_2
  else
    L8_2 = L10_1
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    if "" ~= L8_2 then
      L9_2 = #L7_2
      L9_2 = L9_2 + 1
      L7_2[L9_2] = L8_2
    end
  end
  L8_2 = {}
  L9_2 = L10_1
  L10_2 = A0_2.id
  if not L10_2 then
    L10_2 = "shell_"
    L11_2 = tostring
    L12_2 = A1_2
    L11_2 = L11_2(L12_2)
    L10_2 = L10_2 .. L11_2
  end
  L9_2 = L9_2(L10_2)
  L8_2.id = L9_2
  L9_2 = L10_1
  L10_2 = A0_2.label
  if not L10_2 then
    L10_2 = L2_2
  end
  L9_2 = L9_2(L10_2)
  L8_2.label = L9_2
  L8_2.model = L2_2
  L9_2 = L16_1
  L10_2 = A0_2.enterOffset
  L11_2 = L46_1
  L12_2 = L2_2
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L11_2(L12_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L8_2.enterOffset = L9_2
  L8_2.shellType = L4_2
  L8_2.isWorldInterior = L5_2
  L8_2.ipls = L7_2
  L9_2 = {}
  L8_2.presets = L9_2
  L9_2 = ipairs
  L10_2 = A0_2.presets
  if not L10_2 then
    L10_2 = {}
  end
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L8_2.presets
    L16_2 = L8_2.presets
    L16_2 = #L16_2
    L16_2 = L16_2 + 1
    L17_2 = L44_1
    L18_2 = L14_2
    L19_2 = L13_2
    L17_2 = L17_2(L18_2, L19_2)
    L15_2[L16_2] = L17_2
  end
  return L8_2
end
function L48_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "table" ~= L3_2 or not A0_2 then
    L3_2 = {}
    A0_2 = L3_2
  end
  L3_2 = L20_1
  L3_2 = L3_2()
  L4_2 = L36_1
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = A0_2
  end
  L4_2 = L4_2(L5_2)
  L5_2 = L17_1
  L6_2 = A0_2.entry
  if L6_2 then
    L6_2 = A0_2.entry
    L6_2 = L6_2.coords
    if L6_2 then
      goto lbl_27
    end
  end
  L6_2 = A0_2.entryCoords
  ::lbl_27::
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L6_2 = nil
    return L6_2
  end
  L6_2 = L17_1
  L7_2 = A0_2.exit
  if L7_2 then
    L7_2 = A0_2.exit
    L7_2 = L7_2.coords
    if L7_2 then
      goto lbl_41
    end
  end
  L7_2 = A0_2.exitCoords
  ::lbl_41::
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = L5_2
  end
  L7_2 = {}
  L8_2 = type
  L9_2 = A0_2.presetSelections
  L8_2 = L8_2(L9_2)
  if "table" == L8_2 then
    L8_2 = A0_2.presetSelections
    if L8_2 then
      goto lbl_57
    end
  end
  L8_2 = {}
  ::lbl_57::
  L9_2 = pairs
  L10_2 = L8_2
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = L10_1
    L16_2 = L13_2
    L15_2 = L15_2(L16_2)
    L16_2 = L1_1
    L17_2 = L14_2
    L16_2 = L16_2(L17_2)
    L7_2[L15_2] = L16_2
  end
  L9_2 = tostring
  L10_2 = A0_2.xpRewardAmount
  if not L10_2 then
    L10_2 = L3_2.xpRewardAmount
  end
  L9_2 = L9_2(L10_2)
  L10_2 = tostring
  L11_2 = A0_2.xpNeededAmount
  if not L11_2 then
    L11_2 = L3_2.xpNeededAmount
  end
  L10_2 = L10_2(L11_2)
  L11_2 = tostring
  L12_2 = A0_2.xpRemoveAmount
  if not L12_2 then
    L12_2 = L3_2.xpRemoveAmount
  end
  L11_2 = L11_2(L12_2)
  L12_2 = A0_2.xpOptions
  L12_2 = nil ~= L12_2
  L13_2 = tonumber
  L14_2 = L9_2
  L13_2 = L13_2(L14_2)
  if not L13_2 then
    L13_2 = 0
  end
  L13_2 = L13_2 > 0
  L14_2 = false
  if L12_2 then
    L15_2 = A0_2.xpOptions
    L14_2 = true == L15_2
  else
    L15_2 = L3_2.xpOptions
    L14_2 = true == L15_2 or L14_2
  end
  L15_2 = L14_2 or L15_2
  if L14_2 then
    L15_2 = A0_2.removeXpOnHit
    L15_2 = true == L15_2
  end
  L16_2 = {}
  L17_2 = L10_1
  L18_2 = A0_2.id
  if not L18_2 then
    L18_2 = "location_"
    L19_2 = tostring
    L20_2 = A1_2
    L19_2 = L19_2(L20_2)
    L18_2 = L18_2 .. L19_2
  end
  L17_2 = L17_2(L18_2)
  L16_2.id = L17_2
  L17_2 = L10_1
  L18_2 = A0_2.label
  if not L18_2 then
    L18_2 = "House Robbery "
    L19_2 = tostring
    L20_2 = A1_2
    L19_2 = L19_2(L20_2)
    L18_2 = L18_2 .. L19_2
  end
  L17_2 = L17_2(L18_2)
  L16_2.label = L17_2
  L17_2 = L10_1
  L18_2 = A0_2.streetName
  if not L18_2 then
    L18_2 = ""
  end
  L17_2 = L17_2(L18_2)
  L16_2.streetName = L17_2
  L17_2 = A0_2.enabled
  L17_2 = false ~= L17_2
  L16_2.enabled = L17_2
  L17_2 = L10_1
  L18_2 = A0_2.interactionLabel
  if not L18_2 then
    L18_2 = L3_2.interactionLabel
  end
  L17_2 = L17_2(L18_2)
  L16_2.interactionLabel = L17_2
  L17_2 = L10_1
  L18_2 = A0_2.progressLabel
  if not L18_2 then
    L18_2 = L3_2.progressLabel
  end
  L17_2 = L17_2(L18_2)
  L16_2.progressLabel = L17_2
  L17_2 = tonumber
  L18_2 = A0_2.progressDuration
  L17_2 = L17_2(L18_2)
  if not L17_2 then
    L17_2 = L3_2.progressDuration
  end
  L16_2.progressDuration = L17_2
  L17_2 = tonumber
  L18_2 = A0_2.policeRequired
  L17_2 = L17_2(L18_2)
  if not L17_2 then
    L17_2 = L3_2.policeRequired
  end
  L16_2.policeRequired = L17_2
  L17_2 = tonumber
  L18_2 = A0_2.cooldown
  L17_2 = L17_2(L18_2)
  if not L17_2 then
    L17_2 = L3_2.cooldown
  end
  L16_2.cooldown = L17_2
  L17_2 = L4_2.alertChance
  L16_2.alertChance = L17_2
  L17_2 = L10_1
  L18_2 = A0_2.minigameOption
  if not L18_2 then
    L18_2 = L3_2.minigameOption
  end
  L17_2 = L17_2(L18_2)
  L16_2.minigameOption = L17_2
  L17_2 = L4_2.sendAlert
  L16_2.sendAlert = L17_2
  L17_2 = L4_2.policeAlertHeader
  L16_2.policeAlertHeader = L17_2
  L17_2 = L4_2.policeAlert
  L16_2.policeAlert = L17_2
  L17_2 = L4_2.policeJobs
  L16_2.policeJobs = L17_2
  L17_2 = L4_2.alertCode
  L16_2.alertCode = L17_2
  L17_2 = L4_2.alertIcon
  L16_2.alertIcon = L17_2
  L17_2 = L4_2.alertPriority
  L16_2.alertPriority = L17_2
  L17_2 = L4_2.alertCamId
  L16_2.alertCamId = L17_2
  L17_2 = L4_2.blipSprite
  L16_2.blipSprite = L17_2
  L17_2 = L4_2.blipColor
  L16_2.blipColor = L17_2
  L17_2 = L4_2.blipScale
  L16_2.blipScale = L17_2
  L17_2 = L4_2.alertSound1
  L16_2.alertSound1 = L17_2
  L17_2 = L4_2.blipFlash
  L16_2.blipFlash = L17_2
  L17_2 = A0_2.moneyReward
  L17_2 = true == L17_2
  L16_2.moneyReward = L17_2
  L17_2 = L10_1
  L18_2 = A0_2.rewardType
  if not L18_2 then
    L18_2 = L3_2.rewardType
  end
  L17_2 = L17_2(L18_2)
  L16_2.rewardType = L17_2
  L17_2 = tostring
  L18_2 = A0_2.minMoney
  if not L18_2 then
    L18_2 = L3_2.minMoney
  end
  L17_2 = L17_2(L18_2)
  L16_2.minMoney = L17_2
  L17_2 = tostring
  L18_2 = A0_2.maxMoney
  if not L18_2 then
    L18_2 = L3_2.maxMoney
  end
  L17_2 = L17_2(L18_2)
  L16_2.maxMoney = L17_2
  L17_2 = tostring
  L18_2 = A0_2.moneyChance
  if not L18_2 then
    L18_2 = L3_2.moneyChance
  end
  L17_2 = L17_2(L18_2)
  L16_2.moneyChance = L17_2
  L16_2.xpOptions = L14_2
  L16_2.xpRewardAmount = L9_2
  L16_2.xpNeededAmount = L10_2
  L16_2.removeXpOnHit = L15_2
  L16_2.xpRemoveAmount = L11_2
  L17_2 = L35_1
  L18_2 = A0_2.requiredItems
  L17_2 = L17_2(L18_2)
  L16_2.requiredItems = L17_2
  L17_2 = L34_1
  L18_2 = A0_2.rewardItems
  L17_2 = L17_2(L18_2)
  L16_2.rewardItems = L17_2
  L17_2 = L1_1
  L18_2 = A0_2.shellIds
  L17_2 = L17_2(L18_2)
  L16_2.shellIds = L17_2
  L16_2.presetSelections = L7_2
  L17_2 = {}
  L17_2.coords = L5_2
  L18_2 = tonumber
  L19_2 = A0_2.entry
  if L19_2 then
    L19_2 = A0_2.entry
    L19_2 = L19_2.heading
    if L19_2 then
      goto lbl_323
    end
  end
  L19_2 = A0_2.entryHeading
  ::lbl_323::
  L18_2 = L18_2(L19_2)
  if not L18_2 then
    L18_2 = 0.0
  end
  L17_2.heading = L18_2
  L16_2.entry = L17_2
  L17_2 = {}
  L17_2.coords = L6_2
  L18_2 = tonumber
  L19_2 = A0_2.exit
  if L19_2 then
    L19_2 = A0_2.exit
    L19_2 = L19_2.heading
    if L19_2 then
      goto lbl_341
    end
  end
  L19_2 = A0_2.exitHeading
  ::lbl_341::
  L18_2 = L18_2(L19_2)
  if not L18_2 then
    L18_2 = 0.0
  end
  L17_2.heading = L18_2
  L16_2.exit = L17_2
  return L16_2
end
function L49_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = GetDefaultHouseRobberySettings
  L1_2 = L1_2()
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    A0_2 = L1_2
  end
  L2_2 = type
  L3_2 = A0_2.locations
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = A0_2.locations
    L2_2 = L2_2[1]
    if L2_2 then
      goto lbl_22
    end
  end
  L2_2 = {}
  ::lbl_22::
  L3_2 = {}
  L4_2 = L36_1
  L5_2 = A0_2.settings
  if not L5_2 then
    L5_2 = A0_2.globalAlertSettings
    if not L5_2 then
      L5_2 = A0_2.alertSettings
      if not L5_2 then
        L5_2 = L2_2
      end
    end
  end
  L4_2 = L4_2(L5_2)
  L3_2.settings = L4_2
  L4_2 = {}
  L3_2.shells = L4_2
  L4_2 = {}
  L3_2.locations = L4_2
  L4_2 = L37_1
  L5_2 = A0_2.batchLocationSettings
  if not L5_2 then
    L5_2 = A0_2.bulkLocationSettings
    if not L5_2 then
      L5_2 = {}
    end
  end
  L4_2 = L4_2(L5_2)
  L3_2.batchLocationSettings = L4_2
  L4_2 = ipairs
  L5_2 = A0_2.shells
  if not L5_2 then
    L5_2 = L1_2.shells
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L47_1
    L11_2 = L9_2
    L12_2 = L8_2
    L10_2 = L10_2(L11_2, L12_2)
    if L10_2 then
      L11_2 = L3_2.shells
      L12_2 = L3_2.shells
      L12_2 = #L12_2
      L12_2 = L12_2 + 1
      L11_2[L12_2] = L10_2
    end
  end
  L4_2 = ipairs
  L5_2 = A0_2.locations
  if not L5_2 then
    L5_2 = L1_2.locations
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L48_1
    L11_2 = L9_2
    L12_2 = L8_2
    L13_2 = L3_2.settings
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    if L10_2 then
      L11_2 = L3_2.locations
      L12_2 = L3_2.locations
      L12_2 = #L12_2
      L12_2 = L12_2 + 1
      L11_2[L12_2] = L10_2
    end
  end
  return L3_2
end
L22_1 = L49_1
function L49_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L0_1
  if L0_2 then
    L0_2 = L0_1
    return L0_2
  end
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT settings FROM pug_houserobbery WHERE id = 1 LIMIT 1"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = L0_2[1]
    if L1_2 then
      L1_2 = L0_2[1]
      L1_2 = L1_2.settings
      if L1_2 then
        L1_2 = pcall
        L2_2 = json
        L2_2 = L2_2.decode
        L3_2 = L0_2[1]
        L3_2 = L3_2.settings
        L1_2, L2_2 = L1_2(L2_2, L3_2)
        L3_2 = L22_1
        L4_2 = L2_2 or L4_2
        if not L1_2 or not L2_2 then
          L4_2 = {}
        end
        L3_2 = L3_2(L4_2)
        L0_1 = L3_2
        L3_2 = L0_1
        return L3_2
      end
    end
  end
  L1_2 = L22_1
  L2_2 = GetDefaultHouseRobberySettings
  L2_2, L3_2, L4_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L0_1 = L1_2
  L1_2 = L0_1
  return L1_2
end
getHouseRobberySettings = L49_1
function L49_1(A0_2)
  local L1_2, L2_2
  L1_2 = Framework
  if "QBCore" == L1_2 then
    L1_2 = FWork
    L1_2 = L1_2.Functions
    L1_2 = L1_2.GetPlayer
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  L1_2 = Config
  L1_2 = L1_2.FrameworkFunctions
  L1_2 = L1_2.GetPlayer
  L2_2 = A0_2
  return L1_2(L2_2)
end
function L50_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L49_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = nil
    L3_2 = nil
    return L2_2, L3_2
  end
  L2_2 = Framework
  if "QBCore" == L2_2 then
    L2_2 = L1_2.PlayerData
    if L2_2 then
      L2_2 = L1_2.PlayerData
      L2_2 = L2_2.citizenid
    end
    L3_2 = L10_1
    L4_2 = L2_2 or L4_2
    if not L2_2 then
      L4_2 = A0_2
    end
    L3_2 = L3_2(L4_2)
    L4_2 = L1_2
    return L3_2, L4_2
  end
  L2_2 = L1_2.identifier
  if L2_2 then
    L2_2 = L10_1
    L3_2 = L1_2.identifier
    L2_2 = L2_2(L3_2)
    L3_2 = L1_2
    return L2_2, L3_2
  end
  L2_2 = type
  L3_2 = L1_2.getIdentifier
  L2_2 = L2_2(L3_2)
  if "function" == L2_2 then
    L2_2 = L10_1
    L3_2 = L1_2.getIdentifier
    L3_2 = L3_2()
    if not L3_2 then
      L3_2 = A0_2
    end
    L2_2 = L2_2(L3_2)
    L3_2 = L1_2
    return L2_2, L3_2
  end
  L2_2 = L10_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L1_2
  return L2_2, L3_2
end
function L51_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = ipairs
  L3_2 = A0_2.locations
  if not L3_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L10_1
    L9_2 = L7_2.id
    L8_2 = L8_2(L9_2)
    L9_2 = L10_1
    L10_2 = A1_2
    L9_2 = L9_2(L10_2)
    if L8_2 == L9_2 then
      return L7_2
    end
  end
end
function L52_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = ipairs
  L3_2 = A0_2.shells
  if not L3_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L10_1
    L9_2 = L7_2.id
    L8_2 = L8_2(L9_2)
    L9_2 = L10_1
    L10_2 = A1_2
    L9_2 = L9_2(L10_2)
    if L8_2 == L9_2 then
      return L7_2
    end
  end
end
function L53_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = ipairs
  if A0_2 then
    L3_2 = A0_2.presets
    if L3_2 then
      goto lbl_9
    end
  end
  L3_2 = {}
  ::lbl_9::
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L10_1
    L9_2 = L7_2.id
    L8_2 = L8_2(L9_2)
    L9_2 = L10_1
    L10_2 = A1_2
    L9_2 = L9_2(L10_2)
    if L8_2 == L9_2 then
      return L7_2
    end
  end
end
function L54_1(A0_2)
  local L1_2, L2_2
  L1_2 = tonumber
  L2_2 = A0_2 or L2_2
  if A0_2 then
    L2_2 = A0_2.createChance
    if not L2_2 then
      L2_2 = A0_2.targetCreateChance
      if not L2_2 then
        L2_2 = A0_2.spawnChance
      end
    end
  end
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = 100
  end
  if L1_2 < 0 then
    L1_2 = 0
  elseif L1_2 > 100 then
    L1_2 = 100
  end
  return L1_2
end
function L55_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = A0_2.isPlaced
  L1_2 = type
  L2_2 = A0_2.coords
  L1_2 = L1_2(L2_2)
  L1_2 = L18_1
  L2_2 = A0_2.coords
  L1_2 = L1_2(L2_2)
  L1_2 = "table" == L1_2 and L1_2
  return L1_2
end
function L56_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = ipairs
  if A0_2 then
    L2_2 = A0_2.lootPoints
    if L2_2 then
      goto lbl_9
    end
  end
  L2_2 = {}
  ::lbl_9::
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L55_1
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = true
      return L7_2
    end
  end
  L1_2 = false
  return L1_2
end
function L57_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  L2_2 = ipairs
  if A0_2 then
    L3_2 = A0_2.lootPoints
    if L3_2 then
      goto lbl_11
    end
  end
  L3_2 = {}
  ::lbl_11::
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L55_1
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = math
      L8_2 = L8_2.random
      L9_2 = 1
      L10_2 = 100
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = L54_1
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      if L8_2 <= L9_2 then
        L1_2[L6_2] = true
      end
    end
  end
  return L1_2
end
function L58_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L11_1
  L2_2 = L2_2()
  L3_2 = L10_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    L2_2 = A1_2
  end
  return L2_2
end
function L59_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = type
  L2_2 = A0_2.settings
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.settings
    L1_2 = L1_2.missionNpc
    if L1_2 then
      goto lbl_21
    end
  end
  L1_2 = nil
  ::lbl_21::
  L2_2 = type
  L3_2 = A0_2.settings
  L2_2 = L2_2(L3_2)
  L2_2 = "table" == L2_2
  return L2_2
end
function L60_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = 0
  L2_2 = ipairs
  if A0_2 then
    L3_2 = A0_2.lootPoints
    if L3_2 then
      goto lbl_10
    end
  end
  L3_2 = {}
  ::lbl_10::
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 then
      L8_2 = L7_2.xpOptions
      if true == L8_2 then
        L8_2 = math
        L8_2 = L8_2.max
        L9_2 = L1_2
        L10_2 = tonumber
        L11_2 = L7_2.xpNeededAmount
        L10_2 = L10_2(L11_2)
        if not L10_2 then
          L10_2 = 0
        end
        L8_2 = L8_2(L9_2, L10_2)
        L1_2 = L8_2
      end
    end
  end
  return L1_2
end
function L61_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = A0_2.xpOptions
    if true == L1_2 then
      L1_2 = tonumber
      L2_2 = A0_2.xpNeededAmount
      L1_2 = L1_2(L2_2)
      if not L1_2 then
        L1_2 = 0
      end
      return L1_2
    end
  end
  L1_2 = 0
  return L1_2
end
function L62_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = math
  L2_2 = L2_2.max
  L3_2 = L61_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = L60_1
  L5_2 = A1_2
  L4_2, L5_2 = L4_2(L5_2)
  return L2_2(L3_2, L4_2, L5_2)
end
function L63_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L61_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 <= 0 then
    L3_2 = true
    L4_2 = L2_2
    L5_2 = 0
    return L3_2, L4_2, L5_2
  end
  L3_2 = L49_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = false
    L5_2 = L2_2
    L6_2 = 0
    return L4_2, L5_2, L6_2
  end
  L4_2 = 0
  L5_2 = type
  L6_2 = GetHouseRobberyRep
  L5_2 = L5_2(L6_2)
  if "function" == L5_2 then
    L5_2 = tonumber
    L6_2 = GetHouseRobberyRep
    L7_2 = L3_2
    L6_2, L7_2 = L6_2(L7_2)
    L5_2 = L5_2(L6_2, L7_2)
    L4_2 = L5_2 or L4_2
    if not L5_2 then
      L4_2 = 0
    end
  end
  L5_2 = L2_2 <= L4_2
  L6_2 = L2_2
  L7_2 = L4_2
  return L5_2, L6_2, L7_2
end
function L64_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L51_1
  L3_2 = A0_2
  L4_2 = A1_2.locationId
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L52_1
  L4_2 = A0_2
  L5_2 = A1_2.shellId
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L53_1
  L5_2 = L3_2
  L6_2 = A1_2.presetId
  L4_2 = L4_2(L5_2, L6_2)
  if L2_2 and L3_2 then
    L5_2 = L56_1
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_31
    end
  end
  L5_2 = nil
  do return L5_2 end
  ::lbl_31::
  L5_2 = tonumber
  L6_2 = A1_2.expiresAt
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L6_2 = math
  L6_2 = L6_2.max
  L7_2 = 0
  L8_2 = os
  L8_2 = L8_2.time
  L8_2 = L8_2()
  L8_2 = L5_2 - L8_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = {}
  L8_2 = L10_1
  L9_2 = L2_2.id
  L8_2 = L8_2(L9_2)
  L7_2.locationId = L8_2
  L8_2 = L10_1
  L9_2 = L2_2.label
  L8_2 = L8_2(L9_2)
  L7_2.locationLabel = L8_2
  L8_2 = L10_1
  L9_2 = L2_2.streetName
  L8_2 = L8_2(L9_2)
  L7_2.streetName = L8_2
  L8_2 = L10_1
  L9_2 = L3_2.id
  L8_2 = L8_2(L9_2)
  L7_2.shellId = L8_2
  L8_2 = L10_1
  L9_2 = L3_2.label
  L8_2 = L8_2(L9_2)
  L7_2.shellLabel = L8_2
  L8_2 = L10_1
  L9_2 = L4_2.id
  L8_2 = L8_2(L9_2)
  L7_2.presetId = L8_2
  L8_2 = L10_1
  L9_2 = L4_2.label
  L8_2 = L8_2(L9_2)
  L7_2.presetLabel = L8_2
  L8_2 = L2_2.entry
  if L8_2 then
    L8_2 = L2_2.entry
    L8_2 = L8_2.coords
    if L8_2 then
      goto lbl_88
    end
  end
  L8_2 = {}
  L8_2.x = 0.0
  L8_2.y = 0.0
  L8_2.z = 0.0
  ::lbl_88::
  L7_2.coords = L8_2
  L8_2 = tonumber
  L9_2 = L2_2.entry
  if L9_2 then
    L9_2 = L2_2.entry
    L9_2 = L9_2.heading
  end
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = 0.0
  end
  L7_2.heading = L8_2
  L8_2 = math
  L8_2 = L8_2.max
  L9_2 = tonumber
  L10_2 = A1_2.requiredRep
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 0
  end
  L10_2 = L62_1
  L11_2 = L2_2
  L12_2 = L4_2
  L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
  L7_2.requiredRep = L8_2
  L7_2.expiresAt = L5_2
  L7_2.timeRemaining = L6_2
  return L7_2
end
function L65_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = getHouseRobberySettings
  L1_2 = L1_2()
  L2_2 = L59_1
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = false
    L3_2 = "disabled"
    L4_2 = L1_2
    L5_2 = nil
    L6_2 = nil
    return L2_2, L3_2, L4_2, L5_2, L6_2
  end
  L2_2 = L50_1
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  if not L2_2 or "" == L2_2 or not L3_2 then
    L4_2 = false
    L5_2 = "player_missing"
    L6_2 = L1_2
    L7_2 = nil
    L8_2 = nil
    return L4_2, L5_2, L6_2, L7_2, L8_2
  end
  L4_2 = L4_1
  L4_2 = L4_2[L2_2]
  L5_2 = type
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if "table" ~= L5_2 then
    L5_2 = false
    L6_2 = "missing"
    L7_2 = L1_2
    L8_2 = nil
    L9_2 = L3_2
    return L5_2, L6_2, L7_2, L8_2, L9_2
  end
  L5_2 = tonumber
  L6_2 = L4_2.expiresAt
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  if L5_2 <= L6_2 then
    L5_2 = L4_1
    L5_2[L2_2] = nil
    L5_2 = false
    L6_2 = "expired"
    L7_2 = L1_2
    L8_2 = nil
    L9_2 = L3_2
    return L5_2, L6_2, L7_2, L8_2, L9_2
  end
  L5_2 = L64_1
  L6_2 = L1_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L6_2 = L4_1
    L6_2[L2_2] = nil
    L6_2 = false
    L7_2 = "invalid"
    L8_2 = L1_2
    L9_2 = nil
    L10_2 = L3_2
    return L6_2, L7_2, L8_2, L9_2, L10_2
  end
  L6_2 = true
  L7_2 = "active"
  L8_2 = L1_2
  L9_2 = L5_2
  L10_2 = L3_2
  return L6_2, L7_2, L8_2, L9_2, L10_2
end
function L66_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2
  L2_2 = {}
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L4_2 = ipairs
  L5_2 = A0_2.locations
  if not L5_2 then
    L5_2 = {}
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L10_1
    L11_2 = L9_2.id
    L10_2 = L10_2(L11_2)
    L11_2 = "house_location_"
    L12_2 = L10_2
    L11_2 = L11_2 .. L12_2
    L12_2 = AllRobberysCooldDownTable
    if L12_2 then
      L12_2 = AllRobberysCooldDownTable
      L12_2 = L12_2[L11_2]
      if L12_2 then
        goto lbl_28
      end
    end
    L12_2 = nil
    ::lbl_28::
    L13_2 = L2_1
    L13_2 = L13_2[L10_2]
    L13_2 = nil ~= L13_2
    L14_2 = L12_2 or L14_2
    L14_2 = L12_2 and L3_2 < L12_2
    L15_2 = L9_2.enabled
    if false ~= L15_2 and "" ~= L10_2 and not L13_2 and not L14_2 then
      L15_2 = ipairs
      L16_2 = L9_2.shellIds
      if not L16_2 then
        L16_2 = {}
      end
      L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
      for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
        L21_2 = L52_1
        L22_2 = A0_2
        L23_2 = L20_2
        L21_2 = L21_2(L22_2, L23_2)
        if L21_2 then
          L22_2 = L10_1
          L23_2 = L21_2.model
          L22_2 = L22_2(L23_2)
          if "" ~= L22_2 then
            L22_2 = type
            L23_2 = L9_2.presetSelections
            L22_2 = L22_2(L23_2)
            if "table" == L22_2 then
              L22_2 = L9_2.presetSelections
              L23_2 = L21_2.id
              L22_2 = L22_2[L23_2]
              if L22_2 then
                goto lbl_80
              end
            end
            L22_2 = {}
            ::lbl_80::
            L23_2 = {}
            if L22_2 then
              L24_2 = #L22_2
              if L24_2 > 0 then
                L24_2 = ipairs
                L25_2 = L22_2
                L24_2, L25_2, L26_2, L27_2 = L24_2(L25_2)
                for L28_2, L29_2 in L24_2, L25_2, L26_2, L27_2 do
                  L30_2 = L53_1
                  L31_2 = L21_2
                  L32_2 = L29_2
                  L30_2 = L30_2(L31_2, L32_2)
                  L31_2 = L56_1
                  L32_2 = L30_2
                  L31_2 = L31_2(L32_2)
                  if L31_2 then
                    L31_2 = #L23_2
                    L31_2 = L31_2 + 1
                    L23_2[L31_2] = L30_2
                  end
                end
            end
            else
              L24_2 = ipairs
              L25_2 = L21_2.presets
              if not L25_2 then
                L25_2 = {}
              end
              L24_2, L25_2, L26_2, L27_2 = L24_2(L25_2)
              for L28_2, L29_2 in L24_2, L25_2, L26_2, L27_2 do
                L30_2 = L56_1
                L31_2 = L29_2
                L30_2 = L30_2(L31_2)
                if L30_2 then
                  L30_2 = #L23_2
                  L30_2 = L30_2 + 1
                  L23_2[L30_2] = L29_2
                end
              end
            end
            L24_2 = ipairs
            L25_2 = L23_2
            L24_2, L25_2, L26_2, L27_2 = L24_2(L25_2)
            for L28_2, L29_2 in L24_2, L25_2, L26_2, L27_2 do
              L30_2 = L62_1
              L31_2 = L9_2
              L32_2 = L29_2
              L30_2 = L30_2(L31_2, L32_2)
              L31_2 = tonumber
              L32_2 = A1_2
              L31_2 = L31_2(L32_2)
              if L30_2 <= L31_2 then
                L31_2 = #L2_2
                L31_2 = L31_2 + 1
                L32_2 = {}
                L32_2.locationId = L10_2
                L33_2 = L10_1
                L34_2 = L21_2.id
                L33_2 = L33_2(L34_2)
                L32_2.shellId = L33_2
                L33_2 = L10_1
                L34_2 = L29_2.id
                L33_2 = L33_2(L34_2)
                L32_2.presetId = L33_2
                L32_2.requiredRep = L30_2
                L33_2 = L5_1
                L33_2 = L3_2 + L33_2
                L32_2.expiresAt = L33_2
                L2_2[L31_2] = L32_2
              end
            end
          end
        end
      end
    end
  end
  return L2_2
end
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:GetOpenHouseRobberies"
function L69_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = L11_1
  L3_2 = L3_2()
  L2_2(L3_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:EnterHouseRoutingBucket"
function L69_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = L10_1
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  A2_2 = L3_2
  if "" == A2_2 then
    L3_2 = A1_2
    L4_2 = false
    L5_2 = "invalid"
    L6_2 = 0
    L3_2(L4_2, L5_2, L6_2)
    return
  end
  L3_2 = L51_1
  L4_2 = getHouseRobberySettings
  L4_2 = L4_2()
  L5_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = L3_2.enabled
    if false ~= L4_2 then
      goto lbl_29
    end
  end
  L4_2 = A1_2
  L5_2 = false
  L6_2 = "invalid"
  L7_2 = 0
  L4_2(L5_2, L6_2, L7_2)
  do return end
  ::lbl_29::
  L4_2 = A1_2
  L5_2 = L14_1
  L6_2 = A0_2
  L7_2 = A2_2
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L4_2(L5_2, L6_2, L7_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:GetHouseRobberyMissionState"
function L69_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = L65_1
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  if L2_2 then
    L6_2 = A1_2
    L7_2 = true
    L8_2 = "active"
    L9_2 = L5_2
    L6_2(L7_2, L8_2, L9_2)
    return
  end
  if "disabled" == L3_2 then
    L6_2 = A1_2
    L7_2 = false
    L8_2 = "disabled"
    L9_2 = nil
    L6_2(L7_2, L8_2, L9_2)
    return
  end
  L6_2 = A1_2
  L7_2 = false
  L8_2 = L3_2
  L9_2 = nil
  L6_2(L7_2, L8_2, L9_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:RequestHouseRobberyMission"
function L69_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = L65_1
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2(L3_2)
  if L2_2 then
    L7_2 = A1_2
    L8_2 = true
    L9_2 = "reused"
    L10_2 = L5_2
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  if "disabled" == L3_2 then
    L7_2 = A1_2
    L8_2 = false
    L9_2 = "disabled"
    L10_2 = nil
    L7_2(L8_2, L9_2, L10_2)
    return
  end
  L7_2 = L50_1
  L8_2 = A0_2
  L7_2, L8_2 = L7_2(L8_2)
  L6_2 = L8_2 or L6_2
  if not L8_2 then
  end
  if not L7_2 or not L6_2 then
    L9_2 = A1_2
    L10_2 = false
    L11_2 = "player_missing"
    L12_2 = nil
    L9_2(L10_2, L11_2, L12_2)
    return
  end
  L9_2 = tonumber
  L10_2 = GetHouseRobberyRep
  L11_2 = L6_2
  L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L10_2(L11_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  if not L9_2 then
    L9_2 = 0
  end
  L10_2 = L66_1
  L11_2 = L4_2
  L12_2 = L9_2
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = #L10_2
  if 0 == L11_2 then
    L11_2 = A1_2
    L12_2 = false
    L13_2 = "no_eligible"
    L14_2 = nil
    L11_2(L12_2, L13_2, L14_2)
    return
  end
  L11_2 = math
  L11_2 = L11_2.random
  L12_2 = 1
  L13_2 = #L10_2
  L11_2 = L11_2(L12_2, L13_2)
  L11_2 = L10_2[L11_2]
  L12_2 = L4_1
  L12_2[L7_2] = L11_2
  L12_2 = A1_2
  L13_2 = true
  L14_2 = "assigned"
  L15_2 = L64_1
  L16_2 = L4_2
  L17_2 = L11_2
  L15_2, L16_2, L17_2 = L15_2(L16_2, L17_2)
  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:ValidateHouseRobberyMission"
function L69_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = L65_1
  L6_2 = A0_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  L9_2 = L59_1
  L10_2 = L7_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = A1_2
    L10_2 = true
    L11_2 = "disabled"
    L12_2 = nil
    L9_2(L10_2, L11_2, L12_2)
    return
  end
  if not L5_2 then
    L9_2 = A1_2
    L10_2 = false
    L11_2 = L6_2
    L12_2 = nil
    L9_2(L10_2, L11_2, L12_2)
    return
  end
  L9_2 = L10_1
  L10_2 = A2_2
  L9_2 = L9_2(L10_2)
  L10_2 = L10_1
  L11_2 = L8_2.locationId
  L10_2 = L10_2(L11_2)
  if L9_2 ~= L10_2 then
    L9_2 = A1_2
    L10_2 = false
    L11_2 = "different"
    L12_2 = L8_2
    L9_2(L10_2, L11_2, L12_2)
    return
  end
  L9_2 = L10_1
  L10_2 = A3_2
  L9_2 = L9_2(L10_2)
  if "" ~= L9_2 then
    L9_2 = L10_1
    L10_2 = A3_2
    L9_2 = L9_2(L10_2)
    L10_2 = L10_1
    L11_2 = L8_2.shellId
    L10_2 = L10_2(L11_2)
    if L9_2 ~= L10_2 then
      L9_2 = A1_2
      L10_2 = false
      L11_2 = "different_layout"
      L12_2 = L8_2
      L9_2(L10_2, L11_2, L12_2)
      return
    end
  end
  L9_2 = L10_1
  L10_2 = A4_2
  L9_2 = L9_2(L10_2)
  if "" ~= L9_2 then
    L9_2 = L10_1
    L10_2 = A4_2
    L9_2 = L9_2(L10_2)
    L10_2 = L10_1
    L11_2 = L8_2.presetId
    L10_2 = L10_2(L11_2)
    if L9_2 ~= L10_2 then
      L9_2 = A1_2
      L10_2 = false
      L11_2 = "different_layout"
      L12_2 = L8_2
      L9_2(L10_2, L11_2, L12_2)
      return
    end
  end
  L9_2 = A1_2
  L10_2 = true
  L11_2 = "allowed"
  L12_2 = L8_2
  L9_2(L10_2, L11_2, L12_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:TryBeginHouseBreakIn"
function L69_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = L10_1
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  A2_2 = L3_2
  if "" == A2_2 then
    L3_2 = A1_2
    L4_2 = false
    L5_2 = "invalid"
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = L2_1
  L3_2 = L3_2[A2_2]
  if L3_2 then
    L3_2 = A1_2
    L4_2 = false
    L5_2 = "open"
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = L51_1
  L4_2 = getHouseRobberySettings
  L4_2 = L4_2()
  L5_2 = A2_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = L3_2.enabled
    if false ~= L4_2 then
      goto lbl_36
    end
  end
  L4_2 = A1_2
  L5_2 = false
  L6_2 = "invalid"
  L4_2(L5_2, L6_2)
  do return end
  ::lbl_36::
  L4_2 = L63_1
  L5_2 = A0_2
  L6_2 = L3_2
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L7_2 = A1_2
    L8_2 = false
    L9_2 = "xp"
    L10_2 = L5_2
    L11_2 = L6_2
    L7_2(L8_2, L9_2, L10_2, L11_2)
    return
  end
  L7_2 = L3_1
  L7_2 = L7_2[A2_2]
  if L7_2 and L7_2 ~= A0_2 then
    L8_2 = A1_2
    L9_2 = false
    L10_2 = "busy"
    L8_2(L9_2, L10_2)
    return
  end
  L8_2 = L3_1
  L8_2[A2_2] = A0_2
  L8_2 = A1_2
  L9_2 = true
  L10_2 = "locked"
  L8_2(L9_2, L10_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:TryLockOpenHouseLootPoint"
function L69_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = L10_1
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  A2_2 = L4_2
  L4_2 = tonumber
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  A3_2 = L4_2
  if "" == A2_2 or not A3_2 then
    L4_2 = A1_2
    L5_2 = false
    L6_2 = "invalid"
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = L2_1
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L5_2 = A1_2
    L6_2 = false
    L7_2 = "closed"
    L5_2(L6_2, L7_2)
    return
  end
  L5_2 = type
  L6_2 = L4_2.lootedPoints
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = L4_2.lootedPoints
    if L5_2 then
      goto lbl_37
    end
  end
  L5_2 = {}
  ::lbl_37::
  L4_2.lootedPoints = L5_2
  L5_2 = type
  L6_2 = L4_2.busyLootPoints
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = L4_2.busyLootPoints
    if L5_2 then
      goto lbl_48
    end
  end
  L5_2 = {}
  ::lbl_48::
  L4_2.busyLootPoints = L5_2
  L5_2 = L4_2.activeLootPointsSet
  if true == L5_2 then
    L5_2 = type
    L6_2 = L4_2.activeLootPoints
    L5_2 = L5_2(L6_2)
    if "table" == L5_2 then
      L5_2 = L4_2.activeLootPoints
      if L5_2 then
        goto lbl_62
      end
    end
    L5_2 = {}
    ::lbl_62::
    L4_2.activeLootPoints = L5_2
    L5_2 = L4_2.activeLootPoints
    L5_2 = L5_2[A3_2]
    if true ~= L5_2 then
      L5_2 = getHouseRobberySettings
      L5_2 = L5_2()
      L6_2 = L52_1
      L7_2 = L5_2
      L8_2 = L4_2.shellId
      L6_2 = L6_2(L7_2, L8_2)
      L7_2 = L53_1
      L8_2 = L6_2
      L9_2 = L4_2.presetId
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 then
        L8_2 = L7_2.lootPoints
        if L8_2 then
          L8_2 = L7_2.lootPoints
          L8_2 = L8_2[A3_2]
          if L8_2 then
            goto lbl_87
          end
        end
      end
      L8_2 = nil
      ::lbl_87::
      L9_2 = L55_1
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        L9_2 = L54_1
        L10_2 = L8_2
        L9_2 = L9_2(L10_2)
        if L9_2 >= 100 then
          L9_2 = L4_2.activeLootPoints
          L9_2[A3_2] = true
          L9_2 = L12_1
          L9_2()
      end
      else
        L9_2 = A1_2
        L10_2 = false
        L11_2 = "inactive"
        L9_2(L10_2, L11_2)
        return
      end
    end
  end
  L5_2 = L4_2.lootedPoints
  L5_2 = L5_2[A3_2]
  if true == L5_2 then
    L5_2 = A1_2
    L6_2 = false
    L7_2 = "looted"
    L5_2(L6_2, L7_2)
    return
  end
  L5_2 = L4_2.busyLootPoints
  L5_2 = L5_2[A3_2]
  if L5_2 and L5_2 ~= A0_2 then
    L6_2 = A1_2
    L7_2 = false
    L8_2 = "busy"
    L6_2(L7_2, L8_2)
    return
  end
  L6_2 = L4_2.busyLootPoints
  L6_2[A3_2] = A0_2
  L6_2 = A1_2
  L7_2 = true
  L8_2 = "locked"
  L6_2(L7_2, L8_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:TryLockOpenHouseSecuritySystem"
function L69_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = L10_1
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  A2_2 = L3_2
  if "" == A2_2 then
    L3_2 = A1_2
    L4_2 = false
    L5_2 = "invalid"
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = L2_1
  L3_2 = L3_2[A2_2]
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = false
    L6_2 = "closed"
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = L3_2.securityDisabled
  if true == L4_2 then
    L4_2 = A1_2
    L5_2 = false
    L6_2 = "disabled"
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = L3_2.busySecuritySource
  if L4_2 and L4_2 ~= A0_2 then
    L5_2 = A1_2
    L6_2 = false
    L7_2 = "busy"
    L5_2(L6_2, L7_2)
    return
  end
  L3_2.busySecuritySource = A0_2
  L5_2 = A1_2
  L6_2 = true
  L7_2 = "locked"
  L5_2(L6_2, L7_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:GetHousePresetFiles"
function L69_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L4_2 = L32_1
  L4_2 = L4_2()
  L3_2.files = L4_2
  L2_2(L3_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:SaveHousePreset"
function L69_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = A0_2
  L5_2 = L24_1
  L6_2 = A2_2
  L5_2, L6_2 = L5_2(L6_2)
  L7_2 = L22_1
  L8_2 = A3_2
  L7_2 = L7_2(L8_2)
  L8_2 = {}
  L8_2.type = "house_robbery_preset"
  L8_2.version = 1
  L8_2.settings = L7_2
  L9_2 = json
  L9_2 = L9_2.encode
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  if not L9_2 or "" == L9_2 then
    L10_2 = A1_2
    L11_2 = {}
    L11_2.success = false
    L11_2.error = "Failed to encode house preset data."
    L10_2(L11_2)
    return
  end
  L10_2 = LoadResourceFile
  L11_2 = GetCurrentResourceName
  L11_2 = L11_2()
  L12_2 = L5_2
  L10_2 = L10_2(L11_2, L12_2)
  if L10_2 and "" ~= L10_2 then
    L11_2 = SaveResourceFile
    L12_2 = GetCurrentResourceName
    L12_2 = L12_2()
    L13_2 = L5_2
    L14_2 = ".bak"
    L13_2 = L13_2 .. L14_2
    L14_2 = L10_2
    L15_2 = -1
    L11_2(L12_2, L13_2, L14_2, L15_2)
  end
  L11_2 = SaveResourceFile
  L12_2 = GetCurrentResourceName
  L12_2 = L12_2()
  L13_2 = L5_2
  L14_2 = L9_2
  L15_2 = -1
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
  if not L11_2 then
    L12_2 = A1_2
    L13_2 = {}
    L13_2.success = false
    L14_2 = "Failed to write "
    L15_2 = L5_2
    L16_2 = "."
    L14_2 = L14_2 .. L15_2 .. L16_2
    L13_2.error = L14_2
    L12_2(L13_2)
    L12_2 = TriggerClientEvent
    L13_2 = "Pug:client:ShowHeistNotify"
    L14_2 = L4_2
    L15_2 = Config
    L15_2 = L15_2.T
    L16_2 = "HousePresetSaveFailed"
    L15_2 = L15_2(L16_2)
    L16_2 = "error"
    L12_2(L13_2, L14_2, L15_2, L16_2)
    return
  end
  L12_2 = L31_1
  L13_2 = L6_2
  L12_2(L13_2)
  L12_2 = TriggerClientEvent
  L13_2 = "Pug:client:ShowHeistNotify"
  L14_2 = L4_2
  L15_2 = Config
  L15_2 = L15_2.T
  L16_2 = "HousePresetSaved"
  L17_2 = L5_2
  L15_2 = L15_2(L16_2, L17_2)
  L16_2 = "success"
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = A1_2
  L13_2 = {}
  L13_2.success = true
  L13_2.fileName = L6_2
  L13_2.path = L5_2
  L12_2(L13_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:LoadHousePreset"
function L69_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = A0_2
  L4_2 = L24_1
  L5_2 = A2_2
  L4_2, L5_2 = L4_2(L5_2)
  L6_2 = LoadResourceFile
  L7_2 = GetCurrentResourceName
  L7_2 = L7_2()
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L33_1
  L8_2 = L6_2
  L9_2 = L4_2
  L7_2, L8_2 = L7_2(L8_2, L9_2)
  if not L7_2 then
    L9_2 = A1_2
    L10_2 = {}
    L10_2.success = false
    L11_2 = L8_2 or L11_2
    if not L8_2 then
      L11_2 = "Failed to load house preset."
    end
    L10_2.error = L11_2
    L9_2(L10_2)
    L9_2 = TriggerClientEvent
    L10_2 = "Pug:client:ShowHeistNotify"
    L11_2 = L3_2
    L12_2 = L8_2 or L12_2
    if not L8_2 then
      L12_2 = Config
      L12_2 = L12_2.T
      L13_2 = "HousePresetLoadFailed"
      L12_2 = L12_2(L13_2)
    end
    L13_2 = "error"
    L9_2(L10_2, L11_2, L12_2, L13_2)
    return
  end
  L9_2 = L31_1
  L10_2 = L5_2
  L9_2(L10_2)
  L9_2 = TriggerClientEvent
  L10_2 = "Pug:client:ShowHeistNotify"
  L11_2 = L3_2
  L12_2 = Config
  L12_2 = L12_2.T
  L13_2 = "HousePresetLoaded"
  L14_2 = L4_2
  L12_2 = L12_2(L13_2, L14_2)
  L13_2 = "success"
  L9_2(L10_2, L11_2, L12_2, L13_2)
  L9_2 = A1_2
  L10_2 = {}
  L10_2.success = true
  L10_2.fileName = L5_2
  L10_2.path = L4_2
  L10_2.data = L7_2
  L9_2(L10_2)
end
L67_1(L68_1, L69_1)
L67_1 = Config
L67_1 = L67_1.FrameworkFunctions
L67_1 = L67_1.CreateCallback
L68_1 = "Pug:server:CreateOpenHouseRobberyState"
function L69_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L6_2 = L10_1
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  A2_2 = L6_2
  L6_2 = L10_1
  L7_2 = A3_2
  L6_2 = L6_2(L7_2)
  A3_2 = L6_2
  L6_2 = L10_1
  L7_2 = A4_2
  L6_2 = L6_2(L7_2)
  A4_2 = L6_2
  L6_2 = tonumber
  L7_2 = A5_2
  L6_2 = L6_2(L7_2)
  A5_2 = L6_2 or A5_2
  if not L6_2 then
    A5_2 = 0
  end
  if "" == A2_2 or "" == A3_2 or "" == A4_2 or A5_2 <= 0 then
    L6_2 = A1_2
    L7_2 = false
    L8_2 = "invalid"
    L9_2 = nil
    L6_2(L7_2, L8_2, L9_2)
    return
  end
  L6_2 = getHouseRobberySettings
  L6_2 = L6_2()
  L7_2 = L52_1
  L8_2 = L6_2
  L9_2 = A3_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = L53_1
  L9_2 = L7_2
  L10_2 = A4_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = L56_1
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = A1_2
    L10_2 = false
    L11_2 = "missing_preset"
    L12_2 = nil
    L9_2(L10_2, L11_2, L12_2)
    return
  end
  L9_2 = os
  L9_2 = L9_2.time
  L9_2 = L9_2()
  L10_2 = A5_2 * 60
  L9_2 = L9_2 + L10_2
  L10_2 = L2_1
  L11_2 = {}
  L11_2.locationId = A2_2
  L11_2.shellId = A3_2
  L11_2.presetId = A4_2
  L11_2.endTime = L9_2
  L11_2.securityDisabled = false
  L11_2.busySecuritySource = nil
  L12_2 = {}
  L11_2.lootedPoints = L12_2
  L12_2 = {}
  L11_2.busyLootPoints = L12_2
  L12_2 = L57_1
  L13_2 = L8_2
  L12_2 = L12_2(L13_2)
  L11_2.activeLootPoints = L12_2
  L11_2.activeLootPointsSet = true
  L10_2[A2_2] = L11_2
  L10_2 = L3_1
  L10_2[A2_2] = nil
  L10_2 = L12_1
  L10_2()
  L10_2 = CreateThread
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L9_2
    while true do
      L1_3 = Wait
      L2_3 = 1000
      L1_3(L2_3)
      L2_3 = A2_2
      L1_3 = L2_1
      L1_3 = L1_3[L2_3]
      if not L1_3 then
        return
      end
      L2_3 = tonumber
      L3_3 = L1_3.endTime
      L2_3 = L2_3(L3_3)
      if L2_3 ~= L0_3 then
        return
      end
      L2_3 = os
      L2_3 = L2_3.time
      L2_3 = L2_3()
      if L0_3 <= L2_3 then
        L3_3 = A2_2
        L2_3 = L2_1
        L2_3[L3_3] = nil
        L3_3 = A2_2
        L2_3 = L3_1
        L2_3[L3_3] = nil
        L2_3 = L12_1
        L2_3()
        return
      end
    end
  end
  L10_2(L11_2)
  L10_2 = A1_2
  L11_2 = true
  L12_2 = "opened"
  L13_2 = L58_1
  L14_2 = A2_2
  L15_2 = L2_1
  L15_2 = L15_2[A2_2]
  L13_2, L14_2, L15_2 = L13_2(L14_2, L15_2)
  L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
end
L67_1(L68_1, L69_1)
L67_1 = RegisterNetEvent
L68_1 = "Pug:saveHouseRobberyData"
function L69_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = L22_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L0_1 = L2_2
  L3_2 = L59_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = {}
    L4_1 = L3_2
  end
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = MySQL
  L4_2 = L4_2.query
  L5_2 = "INSERT INTO pug_houserobbery (id, settings) VALUES (1, @settings) ON DUPLICATE KEY UPDATE settings = @settings"
  L6_2 = {}
  L6_2["@settings"] = L3_2
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    if A0_3 then
      L1_3 = TriggerClientEvent
      L2_3 = "Pug:client:UpdateHouseRobberyData"
      L3_3 = -1
      L4_3 = L2_2
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = TriggerClientEvent
      L2_3 = "Pug:client:ShowHeistNotify"
      L3_3 = L1_2
      L4_3 = Config
      L4_3 = L4_3.T
      L5_3 = "HouseDataSaved"
      L4_3 = L4_3(L5_3)
      L5_3 = "success"
      L1_3(L2_3, L3_3, L4_3, L5_3)
    else
      L1_3 = TriggerClientEvent
      L2_3 = "Pug:client:ShowHeistNotify"
      L3_3 = L1_2
      L4_3 = Config
      L4_3 = L4_3.T
      L5_3 = "HouseDataSaveFailed"
      L4_3 = L4_3(L5_3)
      L5_3 = "error"
      L1_3(L2_3, L3_3, L4_3, L5_3)
    end
  end
  L4_2(L5_2, L6_2, L7_2)
end
L67_1(L68_1, L69_1)
L67_1 = RegisterNetEvent
L68_1 = "Pug:server:SetOpenHouseRobberyState"
function L69_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = L10_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  A0_2 = L4_2
  L4_2 = L10_1
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  A1_2 = L4_2
  L4_2 = L10_1
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  A2_2 = L4_2
  L4_2 = tonumber
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  A3_2 = L4_2 or A3_2
  if not L4_2 then
    A3_2 = 0
  end
  if "" == A0_2 or "" == A1_2 or "" == A2_2 or A3_2 <= 0 then
    return
  end
  L4_2 = L52_1
  L5_2 = getHouseRobberySettings
  L5_2 = L5_2()
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L53_1
  L6_2 = L4_2
  L7_2 = A2_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L56_1
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L7_2 = A3_2 * 60
  L6_2 = L6_2 + L7_2
  L7_2 = L2_1
  L8_2 = {}
  L8_2.locationId = A0_2
  L8_2.shellId = A1_2
  L8_2.presetId = A2_2
  L8_2.endTime = L6_2
  L8_2.securityDisabled = false
  L8_2.busySecuritySource = nil
  L9_2 = {}
  L8_2.lootedPoints = L9_2
  L9_2 = {}
  L8_2.busyLootPoints = L9_2
  if L5_2 then
    L9_2 = L57_1
    L10_2 = L5_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      goto lbl_74
    end
  end
  L9_2 = {}
  ::lbl_74::
  L8_2.activeLootPoints = L9_2
  L9_2 = nil ~= L5_2
  L8_2.activeLootPointsSet = L9_2
  L7_2[A0_2] = L8_2
  L7_2 = L3_1
  L7_2[A0_2] = nil
  L7_2 = L12_1
  L7_2()
  L7_2 = CreateThread
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L6_2
    while true do
      L1_3 = Wait
      L2_3 = 1000
      L1_3(L2_3)
      L2_3 = A0_2
      L1_3 = L2_1
      L1_3 = L1_3[L2_3]
      if not L1_3 then
        return
      end
      L2_3 = tonumber
      L3_3 = L1_3.endTime
      L2_3 = L2_3(L3_3)
      if L2_3 ~= L0_3 then
        return
      end
      L2_3 = os
      L2_3 = L2_3.time
      L2_3 = L2_3()
      if L0_3 <= L2_3 then
        L3_3 = A0_2
        L2_3 = L2_1
        L2_3[L3_3] = nil
        L3_3 = A0_2
        L2_3 = L3_1
        L2_3[L3_3] = nil
        L2_3 = L12_1
        L2_3()
        return
      end
    end
  end
  L7_2(L8_2)
end
L67_1(L68_1, L69_1)
L67_1 = RegisterNetEvent
L68_1 = "Pug:server:ReleaseHouseBreakInLock"
function L69_1(A0_2)
  local L1_2, L2_2
  L1_2 = L10_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  if "" == A0_2 then
    return
  end
  L1_2 = L3_1
  L1_2 = L1_2[A0_2]
  L2_2 = source
  if L1_2 ~= L2_2 then
    L1_2 = L3_1
    L1_2 = L1_2[A0_2]
    if L1_2 then
      goto lbl_19
    end
  end
  L1_2 = L3_1
  L1_2[A0_2] = nil
  ::lbl_19::
end
L67_1(L68_1, L69_1)
L67_1 = RegisterNetEvent
L68_1 = "Pug:server:LeaveHouseRoutingBucket"
function L69_1()
  local L0_2, L1_2
  L0_2 = L15_1
  L1_2 = source
  L0_2(L1_2)
end
L67_1(L68_1, L69_1)
L67_1 = RegisterNetEvent
L68_1 = "Pug:server:ReleaseOpenHouseLootPointLock"
function L69_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L10_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  A1_2 = L3_2
  if "" == A0_2 or not A1_2 then
    return
  end
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    return
  end
  L4_2 = type
  L5_2 = L3_2.lootedPoints
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = L3_2.lootedPoints
    if L4_2 then
      goto lbl_29
    end
  end
  L4_2 = {}
  ::lbl_29::
  L3_2.lootedPoints = L4_2
  L4_2 = type
  L5_2 = L3_2.busyLootPoints
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = L3_2.busyLootPoints
    if L4_2 then
      goto lbl_40
    end
  end
  L4_2 = {}
  ::lbl_40::
  L3_2.busyLootPoints = L4_2
  L4_2 = L3_2.busyLootPoints
  L4_2 = L4_2[A1_2]
  if L4_2 then
    L5_2 = source
    if L4_2 ~= L5_2 then
      return
    end
  end
  L5_2 = L3_2.busyLootPoints
  L5_2[A1_2] = nil
  if true == A2_2 then
    L5_2 = L3_2.lootedPoints
    L5_2 = L5_2[A1_2]
    if true == L5_2 then
      return
    end
    L5_2 = L3_2.lootedPoints
    L5_2[A1_2] = true
    L5_2 = L12_1
    L5_2()
  end
end
L67_1(L68_1, L69_1)
L67_1 = RegisterNetEvent
L68_1 = "Pug:server:ReleaseOpenHouseSecurityLock"
function L69_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L10_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  if "" == A0_2 then
    return
  end
  L2_2 = L2_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    return
  end
  L3_2 = L2_2.busySecuritySource
  if L3_2 then
    L4_2 = source
    if L3_2 ~= L4_2 then
      return
    end
  end
  L2_2.busySecuritySource = nil
  if true == A1_2 then
    L4_2 = L2_2.securityDisabled
    if true ~= L4_2 then
      L2_2.securityDisabled = true
      L4_2 = L12_1
      L4_2()
    end
  end
end
L67_1(L68_1, L69_1)
L67_1 = AddEventHandler
L68_1 = "playerDropped"
function L69_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = source
  L1_2 = false
  L2_2 = L9_1
  L2_2[L0_2] = nil
  L2_2 = pairs
  L3_2 = L3_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == L0_2 then
      L8_2 = L3_1
      L8_2[L6_2] = nil
    end
  end
  L2_2 = pairs
  L3_2 = L2_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2.busyLootPoints
    L8_2 = L8_2(L9_2)
    if "table" == L8_2 then
      L8_2 = pairs
      L9_2 = L7_2.busyLootPoints
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        if L13_2 == L0_2 then
          L14_2 = L7_2.busyLootPoints
          L14_2[L12_2] = nil
          L1_2 = true
        end
      end
    end
    L8_2 = L7_2.busySecuritySource
    if L8_2 == L0_2 then
      L7_2.busySecuritySource = nil
    end
  end
  if L1_2 then
    L2_2 = L12_1
    L2_2()
  end
end
L67_1(L68_1, L69_1)
L67_1 = AddEventHandler
L68_1 = "onResourceStop"
function L69_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = {}
  L2_2 = pairs
  L3_2 = L9_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = #L1_2
    L8_2 = L8_2 + 1
    L1_2[L8_2] = L6_2
  end
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = GetPlayerName
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = L15_1
      L9_2 = L7_2
      L8_2(L9_2)
    end
  end
end
L67_1(L68_1, L69_1)
