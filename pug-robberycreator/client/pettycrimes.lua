local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1
L0_1 = {}
L1_1 = {}
L0_1.objectRobberies = L1_1
L1_1 = {}
L2_1 = {}
L1_1.locations = L2_1
L0_1.porchPirate = L1_1
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = false
L7_1 = false
L8_1 = false
function L9_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L0_2 = Config
  L0_2 = L0_2.PorchPirateBoxModels
  if not L0_2 then
    L0_2 = {}
  end
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if "table" == L8_2 then
      L8_2 = tostring
      L9_2 = L7_2.model
      if not L9_2 then
        L9_2 = ""
      end
      L8_2 = L8_2(L9_2)
      if L8_2 then
        goto lbl_31
      end
    end
    L8_2 = tostring
    L9_2 = L7_2 or L9_2
    if not L7_2 then
      L9_2 = ""
    end
    L8_2 = L8_2(L9_2)
    ::lbl_31::
    L10_2 = L8_2
    L9_2 = L8_2.gsub
    L11_2 = "^%s+"
    L12_2 = ""
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L10_2 = L9_2
    L9_2 = L9_2.gsub
    L11_2 = "%s+$"
    L12_2 = ""
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L8_2 = L9_2
    if "" ~= L8_2 then
      L9_2 = #L1_2
      L9_2 = L9_2 + 1
      L1_2[L9_2] = L8_2
    end
  end
  L2_2 = #L1_2
  if 0 == L2_2 then
    L2_2 = #L1_2
    L2_2 = L2_2 + 1
    L1_2[L2_2] = "prop_cs_cardbox_01"
  end
  return L1_2
end
function L10_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L9_1
  L0_2 = L0_2()
  L1_2 = #L0_2
  if L1_2 > 0 then
    L1_2 = math
    L1_2 = L1_2.random
    L2_2 = 1
    L3_2 = #L0_2
    L1_2 = L1_2(L2_2, L3_2)
    L1_2 = L0_2[L1_2]
    return L1_2
  end
  L1_2 = "prop_cs_cardbox_01"
  return L1_2
end
function L11_1()
  local L0_2, L1_2, L2_2
  L0_2 = {}
  L1_2 = {}
  L0_2.objectRobberies = L1_2
  L1_2 = {}
  L1_2.enabled = true
  L1_2.interactionLabel = "Steal Package"
  L1_2.progressLabel = "Snatching package"
  L1_2.progressDuration = 5000
  L1_2.policeRequired = 0
  L1_2.cooldown = 20
  L1_2.activeSpawnPercent = 25
  L1_2.minigameOption = "none"
  L1_2.moneyReward = false
  L1_2.rewardType = "cash"
  L1_2.minMoney = "50"
  L1_2.maxMoney = "150"
  L1_2.moneyChance = "100"
  L2_2 = {}
  L1_2.rewardItems = L2_2
  L2_2 = {}
  L1_2.requiredItems = L2_2
  L1_2.moneyRewardEnabled = false
  L1_2.rewardItemsEnabled = false
  L1_2.requiredItemsEnabled = false
  L2_2 = {}
  L1_2.locations = L2_2
  L2_2 = {}
  L1_2.activeLocationIds = L2_2
  L0_2.porchPirate = L1_2
  return L0_2
end
function L12_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = tostring
    L9_2 = L7_2.itemName
    if not L9_2 then
      L9_2 = L7_2.name
      if not L9_2 then
        L9_2 = ""
      end
    end
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2
    L8_2 = L8_2.gsub
    L10_2 = "^%s+"
    L11_2 = ""
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = L8_2
    L8_2 = L8_2.gsub
    L10_2 = "%s+$"
    L11_2 = ""
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    if "" ~= L8_2 then
      L9_2 = #L1_2
      L9_2 = L9_2 + 1
      L10_2 = {}
      L10_2.itemName = L8_2
      L11_2 = tostring
      L12_2 = L7_2.minAmount
      if not L12_2 then
        L12_2 = L7_2.amount
        if not L12_2 then
          L12_2 = 1
        end
      end
      L11_2 = L11_2(L12_2)
      L10_2.minAmount = L11_2
      L11_2 = tostring
      L12_2 = L7_2.maxAmount
      if not L12_2 then
        L12_2 = L7_2.amount
        if not L12_2 then
          L12_2 = 1
        end
      end
      L11_2 = L11_2(L12_2)
      L10_2.maxAmount = L11_2
      L11_2 = tostring
      L12_2 = L7_2.chance
      if nil == L12_2 then
        L12_2 = 100
        if L12_2 then
          goto lbl_63
        end
      end
      L12_2 = L7_2.chance
      ::lbl_63::
      L11_2 = L11_2(L12_2)
      L10_2.chance = L11_2
      L1_2[L9_2] = L10_2
    end
  end
  return L1_2
end
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = tostring
    L9_2 = L7_2.itemName
    if not L9_2 then
      L9_2 = L7_2.name
      if not L9_2 then
        L9_2 = ""
      end
    end
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2
    L8_2 = L8_2.gsub
    L10_2 = "^%s+"
    L11_2 = ""
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = L8_2
    L8_2 = L8_2.gsub
    L10_2 = "%s+$"
    L11_2 = ""
    L8_2 = L8_2(L9_2, L10_2, L11_2)
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
      if nil == L12_2 then
        L12_2 = 100
        if L12_2 then
          goto lbl_50
        end
      end
      L12_2 = L7_2.chance
      ::lbl_50::
      L11_2 = L11_2(L12_2)
      L10_2.chance = L11_2
      L1_2[L9_2] = L10_2
    end
  end
  return L1_2
end
function L14_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2 or L4_2
  if not A0_2 then
    L4_2 = {}
  end
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = tostring
    L10_2 = L8_2 or L10_2
    if not L8_2 then
      L10_2 = ""
    end
    L9_2 = L9_2(L10_2)
    L10_2 = L9_2
    L9_2 = L9_2.gsub
    L11_2 = "^%s+"
    L12_2 = ""
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L10_2 = L9_2
    L9_2 = L9_2.gsub
    L11_2 = "%s+$"
    L12_2 = ""
    L9_2 = L9_2(L10_2, L11_2, L12_2)
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
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = {}
  L3_2 = {}
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = tostring
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = ""
    end
    L1_3 = L1_3(L2_3)
    L2_3 = L1_3
    L1_3 = L1_3.gsub
    L3_3 = "^%s+"
    L4_3 = ""
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    L2_3 = L1_3
    L1_3 = L1_3.gsub
    L3_3 = "%s+$"
    L4_3 = ""
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    A0_3 = L1_3
    if "" ~= A0_3 then
      L1_3 = L3_2
      L1_3 = L1_3[A0_3]
      if not L1_3 then
        L1_3 = L3_2
        L1_3[A0_3] = true
        L1_3 = L2_2
        L1_3 = #L1_3
        L2_3 = L1_3 + 1
        L1_3 = L2_2
        L1_3[L2_3] = A0_3
      end
    end
  end
  L5_2 = type
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = ipairs
    L6_2 = A0_2
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      L11_2 = L4_2
      L12_2 = L10_2
      L11_2(L12_2)
    end
  end
  L5_2 = L4_2
  L6_2 = A1_2
  L5_2(L6_2)
  return L2_2
end
function L16_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = L15_1
  L2_2 = A0_2.models
  L3_2 = A0_2.model
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L1_2[1]
  if not L2_2 then
    L2_2 = ""
  end
  L3_2 = tostring
  L4_2 = A0_2.label
  if not L4_2 then
    L4_2 = L2_2
  end
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2
  L3_2 = L3_2.gsub
  L5_2 = "^%s+"
  L6_2 = ""
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = L3_2
  L3_2 = L3_2.gsub
  L5_2 = "%s+$"
  L6_2 = ""
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if "" == L3_2 then
    L3_2 = L2_2
  end
  L4_2 = L12_1
  L5_2 = A0_2.rewardItems
  L4_2 = L4_2(L5_2)
  L5_2 = L13_1
  L6_2 = A0_2.requiredItems
  L5_2 = L5_2(L6_2)
  L6_2 = A0_2.moneyRewardEnabled
  L6_2 = true == L6_2
  L7_2 = A0_2.rewardItemsEnabled
  L7_2 = true == L7_2
  L8_2 = A0_2.requiredItemsEnabled
  L8_2 = true == L8_2
  L9_2 = {}
  L9_2.label = L3_2
  L9_2.model = L2_2
  L9_2.models = L1_2
  L10_2 = tostring
  L11_2 = A0_2.interactionLabel
  if not L11_2 then
    L11_2 = "Rob "
    L12_2 = L3_2
    L11_2 = L11_2 .. L12_2
  end
  L10_2 = L10_2(L11_2)
  L9_2.interactionLabel = L10_2
  L10_2 = tostring
  L11_2 = A0_2.progressLabel
  if not L11_2 then
    L11_2 = "Searching "
    L12_2 = string
    L12_2 = L12_2.lower
    L13_2 = L3_2
    L12_2 = L12_2(L13_2)
    L11_2 = L11_2 .. L12_2
  end
  L10_2 = L10_2(L11_2)
  L9_2.progressLabel = L10_2
  L10_2 = tonumber
  L11_2 = A0_2.progressDuration
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = 7000
  end
  L9_2.progressDuration = L10_2
  L10_2 = tonumber
  L11_2 = A0_2.policeRequired
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = 0
  end
  L9_2.policeRequired = L10_2
  L10_2 = tostring
  L11_2 = A0_2.alertChance
  if not L11_2 then
    L11_2 = 100
  end
  L10_2 = L10_2(L11_2)
  L9_2.alertChance = L10_2
  L10_2 = tonumber
  L11_2 = A0_2.cooldown
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = 15
  end
  L9_2.cooldown = L10_2
  L10_2 = tostring
  L11_2 = A0_2.minigameOption
  if not L11_2 then
    L11_2 = "none"
  end
  L10_2 = L10_2(L11_2)
  L9_2.minigameOption = L10_2
  L10_2 = A0_2.sendAlert
  L10_2 = true == L10_2
  L9_2.sendAlert = L10_2
  L10_2 = tostring
  L11_2 = A0_2.policeAlertHeader
  if not L11_2 then
    L11_2 = L3_2
    L12_2 = " Being Robbed"
    L11_2 = L11_2 .. L12_2
  end
  L10_2 = L10_2(L11_2)
  L9_2.policeAlertHeader = L10_2
  L10_2 = tostring
  L11_2 = A0_2.policeAlert
  if not L11_2 then
    L11_2 = L3_2
    L12_2 = " robbery in progress."
    L11_2 = L11_2 .. L12_2
  end
  L10_2 = L10_2(L11_2)
  L9_2.policeAlert = L10_2
  L10_2 = L14_1
  L11_2 = A0_2.policeJobs
  if not L11_2 then
    L11_2 = Config
    L11_2 = L11_2.DefualPoliceJobs
  end
  L10_2 = L10_2(L11_2)
  L9_2.policeJobs = L10_2
  L10_2 = tostring
  L11_2 = A0_2.alertCode
  if not L11_2 then
    L11_2 = "10-90"
  end
  L10_2 = L10_2(L11_2)
  L9_2.alertCode = L10_2
  L10_2 = tostring
  L11_2 = A0_2.alertIcon
  if not L11_2 then
    L11_2 = "fas fa-bell"
  end
  L10_2 = L10_2(L11_2)
  L9_2.alertIcon = L10_2
  L10_2 = tostring
  L11_2 = A0_2.alertPriority
  if not L11_2 then
    L11_2 = 2
  end
  L10_2 = L10_2(L11_2)
  L9_2.alertPriority = L10_2
  L10_2 = tostring
  L11_2 = A0_2.alertCamId
  if not L11_2 then
    L11_2 = ""
  end
  L10_2 = L10_2(L11_2)
  L9_2.alertCamId = L10_2
  L10_2 = tostring
  L11_2 = A0_2.blipSprite
  if not L11_2 then
    L11_2 = 59
  end
  L10_2 = L10_2(L11_2)
  L9_2.blipSprite = L10_2
  L10_2 = tostring
  L11_2 = A0_2.blipColor
  if not L11_2 then
    L11_2 = 0
  end
  L10_2 = L10_2(L11_2)
  L9_2.blipColor = L10_2
  L10_2 = tostring
  L11_2 = A0_2.blipScale
  if not L11_2 then
    L11_2 = 1.0
  end
  L10_2 = L10_2(L11_2)
  L9_2.blipScale = L10_2
  L10_2 = tostring
  L11_2 = A0_2.alertSound1
  if not L11_2 then
    L11_2 = "robberysound"
  end
  L10_2 = L10_2(L11_2)
  L9_2.alertSound1 = L10_2
  L10_2 = A0_2.blipFlash
  L10_2 = true == L10_2
  L9_2.blipFlash = L10_2
  L9_2.moneyReward = L6_2
  L9_2.moneyRewardEnabled = L6_2
  L10_2 = tostring
  L11_2 = A0_2.rewardType
  if not L11_2 then
    L11_2 = "cash"
  end
  L10_2 = L10_2(L11_2)
  L9_2.rewardType = L10_2
  L10_2 = tostring
  L11_2 = A0_2.minMoney
  if not L11_2 then
    L11_2 = 25
  end
  L10_2 = L10_2(L11_2)
  L9_2.minMoney = L10_2
  L10_2 = tostring
  L11_2 = A0_2.maxMoney
  if not L11_2 then
    L11_2 = 75
  end
  L10_2 = L10_2(L11_2)
  L9_2.maxMoney = L10_2
  L10_2 = tostring
  L11_2 = A0_2.moneyChance
  if not L11_2 then
    L11_2 = 100
  end
  L10_2 = L10_2(L11_2)
  L9_2.moneyChance = L10_2
  L9_2.rewardItems = L4_2
  L9_2.requiredItems = L5_2
  L9_2.rewardItemsEnabled = L7_2
  L9_2.requiredItemsEnabled = L8_2
  L10_2 = A0_2.enabled
  L10_2 = true == L10_2
  L9_2.enabled = L10_2
  return L9_2
end
function L17_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = A0_2.coords
  if not L2_2 then
    L2_2 = A0_2.position
    if not L2_2 then
      L2_2 = {}
    end
  end
  L3_2 = tonumber
  L4_2 = L2_2.x
  if not L4_2 then
    L4_2 = L2_2[1]
  end
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = L2_2.y
  if not L5_2 then
    L5_2 = L2_2[2]
  end
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = L2_2.z
  if not L6_2 then
    L6_2 = L2_2[3]
  end
  L5_2 = L5_2(L6_2)
  if not (L3_2 and L4_2) or not L5_2 then
    L6_2 = nil
    return L6_2
  end
  L6_2 = {}
  L7_2 = tostring
  L8_2 = A0_2.id
  if not L8_2 then
    L8_2 = "porch_"
    L9_2 = tostring
    L10_2 = A1_2
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2 .. L9_2
  end
  L7_2 = L7_2(L8_2)
  L6_2.id = L7_2
  L7_2 = tostring
  L8_2 = A0_2.label
  if not L8_2 then
    L8_2 = "Package Spot "
    L9_2 = tostring
    L10_2 = A1_2
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2 .. L9_2
  end
  L7_2 = L7_2(L8_2)
  L6_2.label = L7_2
  L7_2 = tostring
  L8_2 = A0_2.model
  if not L8_2 then
    L8_2 = ""
  end
  L7_2 = L7_2(L8_2)
  L6_2.model = L7_2
  L7_2 = tonumber
  L8_2 = A0_2.heading
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 0.0
  end
  L6_2.heading = L7_2
  L7_2 = {}
  L7_2.x = L3_2
  L7_2.y = L4_2
  L7_2.z = L5_2
  L6_2.coords = L7_2
  return L6_2
end
function L18_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = L11_1
  L1_2 = L1_2()
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = {}
  L3_2 = {}
  L2_2.objectRobberies = L3_2
  L3_2 = L16_1
  L4_2 = type
  L5_2 = A0_2.porchPirate
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = A0_2.porchPirate
    if L4_2 then
      goto lbl_28
    end
  end
  L4_2 = L1_2.porchPirate
  ::lbl_28::
  L3_2 = L3_2(L4_2)
  L2_2.porchPirate = L3_2
  L3_2 = type
  L4_2 = A0_2.porchPirate
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = A0_2.porchPirate
    if L3_2 then
      goto lbl_39
    end
  end
  L3_2 = L1_2.porchPirate
  ::lbl_39::
  L4_2 = type
  L5_2 = L3_2.locations
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = L3_2.locations
    L4_2 = #L4_2
    if L4_2 then
      goto lbl_49
    end
  end
  L4_2 = 0
  ::lbl_49::
  L5_2 = L2_2.porchPirate
  L6_2 = type
  L7_2 = A0_2.porchPirate
  L6_2 = L6_2(L7_2)
  if "table" == L6_2 then
    L6_2 = A0_2.porchPirate
    L6_2 = L6_2.enabled
  end
  L6_2 = L1_2.porchPirate
  L6_2 = false ~= L6_2 or L6_2
  L5_2.enabled = L6_2
  L5_2 = tonumber
  L6_2 = L3_2.activeSpawnPercent
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L6_2 = tonumber
    L7_2 = L3_2.activeSpawnMin
    L6_2 = L6_2(L7_2)
    L7_2 = tonumber
    L8_2 = L3_2.activeSpawnMax
    L7_2 = L7_2(L8_2)
    if L4_2 > 0 and (L6_2 or L7_2) then
      L8_2 = L6_2 or L8_2
      L8_2 = L7_2 or L8_2
      if not L6_2 and not L7_2 then
        L8_2 = 0
      end
      L9_2 = L7_2 or L9_2
      L9_2 = L6_2 or L9_2
      if not L7_2 and not L6_2 then
        L9_2 = L8_2
      end
      L10_2 = L8_2 + L9_2
      L10_2 = L10_2 / 2
      L10_2 = L10_2 / L4_2
      L5_2 = L10_2 * 100
    else
      L8_2 = L1_2.porchPirate
      L8_2 = L8_2.activeSpawnPercent
      L5_2 = L8_2 or L5_2
      if not L8_2 then
        L5_2 = 25
      end
    end
  end
  L6_2 = L2_2.porchPirate
  L7_2 = math
  L7_2 = L7_2.max
  L8_2 = 0
  L9_2 = math
  L9_2 = L9_2.min
  L10_2 = 100
  L11_2 = math
  L11_2 = L11_2.floor
  L12_2 = L5_2 + 0.5
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L6_2.activeSpawnPercent = L7_2
  L6_2 = L2_2.porchPirate
  L7_2 = {}
  L6_2.locations = L7_2
  L6_2 = L2_2.porchPirate
  L7_2 = {}
  L6_2.activeLocationIds = L7_2
  L6_2 = ipairs
  L7_2 = A0_2.objectRobberies
  if not L7_2 then
    L7_2 = L1_2.objectRobberies
  end
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L16_1
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    L13_2 = L12_2.model
    if "" == L13_2 then
      L13_2 = L12_2.label
      if "" == L13_2 then
        goto lbl_151
      end
    end
    L13_2 = L2_2.objectRobberies
    L14_2 = L2_2.objectRobberies
    L14_2 = #L14_2
    L14_2 = L14_2 + 1
    L13_2[L14_2] = L12_2
    ::lbl_151::
  end
  L6_2 = ipairs
  L7_2 = L3_2.locations
  if not L7_2 then
    L7_2 = {}
  end
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L17_1
    L13_2 = L11_2
    L14_2 = L10_2
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      L13_2 = L2_2.porchPirate
      L13_2 = L13_2.locations
      L14_2 = L2_2.porchPirate
      L14_2 = L14_2.locations
      L14_2 = #L14_2
      L14_2 = L14_2 + 1
      L13_2[L14_2] = L12_2
    end
  end
  L6_2 = ipairs
  L7_2 = L3_2.activeLocationIds
  if not L7_2 then
    L7_2 = {}
  end
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = tostring
    L13_2 = L11_2 or L13_2
    if not L11_2 then
      L13_2 = ""
    end
    L12_2 = L12_2(L13_2)
    if "" ~= L12_2 then
      L13_2 = L2_2.porchPirate
      L13_2 = L13_2.activeLocationIds
      L14_2 = L2_2.porchPirate
      L14_2 = L14_2.activeLocationIds
      L14_2 = #L14_2
      L14_2 = L14_2 + 1
      L13_2[L14_2] = L12_2
    end
  end
  return L2_2
end
function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = L18_1
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  L1_2 = {}
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "string" == L2_2 and "" ~= A0_2 then
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
        L1_2 = L3_2
      end
    end
  end
  L2_2 = L18_1
  L3_2 = L1_2
  return L2_2(L3_2)
end
function L20_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = {}
  L1_1 = L0_2
  L0_2 = ipairs
  L1_2 = L0_1.objectRobberies
  if not L1_2 then
    L1_2 = {}
  end
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L5_2.enabled
    if L6_2 then
      L6_2 = ipairs
      L7_2 = L5_2.models
      if not L7_2 then
        L7_2 = {}
      end
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
        L12_2 = GetHashKey
        L13_2 = L11_2
        L12_2 = L12_2(L13_2)
        L13_2 = L1_1
        L13_2[L12_2] = L5_2
      end
    end
  end
end
function L21_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L3_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L2_2 = DoesEntityExist
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = Config
      L2_2 = L2_2.Target
      if "ox_target" == L2_2 then
        L2_2 = exports
        L2_2 = L2_2.ox_target
        L3_2 = L2_2
        L2_2 = L2_2.removeLocalEntity
        L4_2 = L1_2
        L2_2(L3_2, L4_2)
      else
        L2_2 = Config
        L2_2 = L2_2.Target
        if L2_2 then
          L2_2 = exports
          L3_2 = Config
          L3_2 = L3_2.Target
          L2_2 = L2_2[L3_2]
          L3_2 = L2_2
          L2_2 = L2_2.RemoveTargetEntity
          L4_2 = L1_2
          L2_2(L3_2, L4_2)
        end
      end
      L2_2 = DeleteEntity
      L3_2 = L1_2
      L2_2(L3_2)
    end
  end
  L2_2 = L3_1
  L2_2[A0_2] = nil
  if L1_2 then
    L2_2 = L4_1
    L2_2[L1_2] = nil
  end
end
function L22_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = pairs
  L1_2 = L3_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L21_1
    L7_2 = L4_2
    L6_2(L7_2)
  end
end
function L23_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = tostring
  L4_2 = A1_2 or L4_2
  if not A1_2 then
    L4_2 = "unknown"
  end
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2
  L3_2 = L3_2.lower
  L3_2 = L3_2(L4_2)
  L4_2 = L3_2
  L3_2 = L3_2.gsub
  L5_2 = "[^%w_]"
  L6_2 = "_"
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if not A2_2 then
    L4_2 = A0_2
    L5_2 = "_"
    L6_2 = L3_2
    L4_2 = L4_2 .. L5_2 .. L6_2
    return L4_2
  end
  L4_2 = math
  L4_2 = L4_2.floor
  L5_2 = A2_2.x
  if not L5_2 then
    L5_2 = 0
  end
  L5_2 = L5_2 * 10
  L5_2 = L5_2 + 0.5
  L4_2 = L4_2(L5_2)
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = A2_2.y
  if not L6_2 then
    L6_2 = 0
  end
  L6_2 = L6_2 * 10
  L6_2 = L6_2 + 0.5
  L5_2 = L5_2(L6_2)
  L6_2 = math
  L6_2 = L6_2.floor
  L7_2 = A2_2.z
  if not L7_2 then
    L7_2 = 0
  end
  L7_2 = L7_2 * 10
  L7_2 = L7_2 + 0.5
  L6_2 = L6_2(L7_2)
  L7_2 = string
  L7_2 = L7_2.format
  L8_2 = "%s_%s_%s_%s_%s"
  L9_2 = A0_2
  L10_2 = L3_2
  L11_2 = L4_2
  L12_2 = L5_2
  L13_2 = L6_2
  return L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
end
function L24_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Config
  L1_2 = L1_2.PettyCrimeGlobalCooldowns
  if false ~= L1_2 then
    L1_2 = IsRobberyOnCooldown
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  L1_2 = "none"
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:IsPettyCrimeOnCooldown"
  function L4_2(A0_3)
    local L1_3
    L1_2 = A0_3
  end
  L5_2 = A0_2
  L2_2(L3_2, L4_2, L5_2)
  while "none" == L1_2 do
    L2_2 = Wait
    L3_2 = 50
    L2_2(L3_2)
  end
  return L1_2
end
function L25_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = "none"
  L3_2 = "invalid"
  L4_2 = Config
  L4_2 = L4_2.FrameworkFunctions
  L4_2 = L4_2.TriggerCallback
  L5_2 = "Pug:server:TryLockPettyCrimeObject"
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3
    L2_3 = true == A0_3
    L2_2 = L2_3
    L2_3 = tostring
    L3_3 = A1_3 or L3_3
    if not A1_3 then
      L3_3 = "invalid"
    end
    L2_3 = L2_3(L3_3)
    L3_2 = L2_3
  end
  L7_2 = A0_2
  L8_2 = A1_2
  L4_2(L5_2, L6_2, L7_2, L8_2)
  while "none" == L2_2 do
    L4_2 = Wait
    L5_2 = 50
    L4_2(L5_2)
  end
  L4_2 = true == L2_2
  L5_2 = L3_2
  return L4_2, L5_2
end
function L26_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = math
  L2_2 = L2_2.max
  L3_2 = 500
  L4_2 = tonumber
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 5000
  end
  L2_2 = L2_2(L3_2, L4_2)
  A1_2 = L2_2
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = FreezeEntityPosition
  L4_2 = L2_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = TaskStartScenarioInPlace
  L4_2 = L2_2
  L5_2 = "PROP_HUMAN_BUM_BIN"
  L6_2 = 0
  L7_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = Notify
  L4_2 = A0_2 or L4_2
  if not A0_2 then
    L4_2 = Config
    L4_2 = L4_2.T
    L5_2 = "Robbing"
    L4_2 = L4_2(L5_2)
  end
  L5_2 = "primary"
  L6_2 = A1_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  L3_2 = L3_2 + A1_2
  while true do
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    if not (L3_2 > L4_2) then
      break
    end
    L4_2 = Wait
    L5_2 = 0
    L4_2(L5_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 24
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 25
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 30
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 31
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 32
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 33
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 34
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 35
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 44
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 45
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = DisableControlAction
    L5_2 = 0
    L6_2 = 73
    L7_2 = true
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = ClearPedTasksImmediately
  L5_2 = L2_2
  L4_2(L5_2)
  L4_2 = FreezeEntityPosition
  L5_2 = L2_2
  L6_2 = false
  L4_2(L5_2, L6_2)
end
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = "none"
  end
  L1_2 = L1_2(L2_2)
  if "" == L1_2 or "none" == L1_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = Config
  L2_2 = L2_2.MiniGames
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.MiniGames
    L2_2 = L2_2[L1_2]
    if L2_2 then
      L2_2 = type
      L3_2 = Config
      L3_2 = L3_2.MiniGames
      L3_2 = L3_2[L1_2]
      L3_2 = L3_2.Game
      L2_2 = L2_2(L3_2)
      if "function" == L2_2 then
        goto lbl_38
      end
    end
  end
  L2_2 = Notify
  L3_2 = Config
  L3_2 = L3_2.T
  L4_2 = "PettyMinigameUnavailable"
  L3_2 = L3_2(L4_2)
  L4_2 = "error"
  L2_2(L3_2, L4_2)
  L2_2 = false
  do return L2_2 end
  ::lbl_38::
  L2_2 = pcall
  L3_2 = Config
  L3_2 = L3_2.MiniGames
  L3_2 = L3_2[L1_2]
  L3_2 = L3_2.Game
  L2_2, L3_2 = L2_2(L3_2)
  if not L2_2 then
    L4_2 = PrintDebug
    L5_2 = "Petty crime minigame failed to start:"
    L6_2 = L3_2
    L4_2(L5_2, L6_2)
    L4_2 = Notify
    L5_2 = Config
    L5_2 = L5_2.T
    L6_2 = "PettyMinigameStartFailed"
    L5_2 = L5_2(L6_2)
    L6_2 = "error"
    L4_2(L5_2, L6_2)
    L4_2 = false
    return L4_2
  end
  L4_2 = true == L3_2
  return L4_2
end
function L28_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = ipairs
  L2_2 = A0_2.rewardItems
  if not L2_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = math
    L7_2 = L7_2.random
    L8_2 = 1
    L9_2 = 100
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = tonumber
    L9_2 = L6_2.chance
    if not L9_2 then
      L9_2 = 100
    end
    L8_2 = L8_2(L9_2)
    if L7_2 <= L8_2 then
      L7_2 = tonumber
      L8_2 = L6_2.minAmount
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = 1
      end
      L8_2 = tonumber
      L9_2 = L6_2.maxAmount
      L8_2 = L8_2(L9_2)
      if not L8_2 then
        L8_2 = L7_2
      end
      if L7_2 <= L8_2 then
        L9_2 = math
        L9_2 = L9_2.random
        L10_2 = L7_2
        L11_2 = L8_2
        L9_2 = L9_2(L10_2, L11_2)
        TokenIsUseable = true
        L10_2 = HandleItems
        L11_2 = true
        L12_2 = tostring
        L13_2 = L6_2.itemName
        L12_2 = L12_2(L13_2)
        L13_2 = L9_2
        L10_2(L11_2, L12_2, L13_2)
        TokenIsUseable = false
      end
    end
  end
  L1_2 = A0_2.moneyReward
  if L1_2 then
    L1_2 = tonumber
    L2_2 = A0_2.moneyChance
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = 100
    end
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1
    L4_2 = 100
    L2_2 = L2_2(L3_2, L4_2)
    if L1_2 < L2_2 then
      return
    end
    L2_2 = tonumber
    L3_2 = A0_2.minMoney
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = 0
    end
    L3_2 = tonumber
    L4_2 = A0_2.maxMoney
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = L2_2
    end
    if L2_2 <= L3_2 and L3_2 > 0 then
      L4_2 = math
      L4_2 = L4_2.random
      L5_2 = L2_2
      L6_2 = L3_2
      L4_2 = L4_2(L5_2, L6_2)
      TokenIsUseable = true
      L5_2 = HandleMoney
      L6_2 = A0_2.rewardType
      if not L6_2 then
        L6_2 = "cash"
      end
      L7_2 = L4_2
      L5_2(L6_2, L7_2)
      TokenIsUseable = false
    end
  end
end
function L29_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = A0_2.requiredItems
  if L1_2 then
    L1_2 = A0_2.requiredItems
    L1_2 = #L1_2
    if 0 ~= L1_2 then
      goto lbl_10
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_10::
  L1_2 = ipairs
  L2_2 = A0_2.requiredItems
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = tonumber
    L8_2 = L6_2.amount
    L7_2 = L7_2(L8_2)
    if not L7_2 then
      L7_2 = 1
    end
    L8_2 = HasItem
    L9_2 = L6_2.itemName
    L10_2 = L7_2
    L8_2 = L8_2(L9_2, L10_2)
    if not L8_2 then
      L8_2 = Notify
      L9_2 = Config
      L9_2 = L9_2.LangT
      L9_2 = L9_2.MissingItems
      L10_2 = "error"
      L8_2(L9_2, L10_2)
      L8_2 = false
      return L8_2
    end
  end
  L1_2 = ipairs
  L2_2 = A0_2.requiredItems
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = tonumber
    L8_2 = L6_2.chance
    L7_2 = L7_2(L8_2)
    if not L7_2 then
      L7_2 = 100
    end
    L8_2 = tonumber
    L9_2 = L6_2.amount
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      L8_2 = 1
    end
    L9_2 = math
    L9_2 = L9_2.random
    L10_2 = 1
    L11_2 = 100
    L9_2 = L9_2(L10_2, L11_2)
    if L7_2 >= L9_2 then
      TokenIsUseable = true
      L9_2 = HandleItems
      L10_2 = false
      L11_2 = tostring
      L12_2 = L6_2.itemName
      L11_2 = L11_2(L12_2)
      L12_2 = L8_2
      L9_2(L10_2, L11_2, L12_2)
      TokenIsUseable = false
    end
  end
  L1_2 = true
  return L1_2
end
function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = tonumber
  L2_2 = A0_2.policeRequired
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = 0
  end
  if L1_2 <= 0 then
    L2_2 = true
    return L2_2
  end
  L2_2 = "none"
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.TriggerCallback
  L4_2 = "Pug:serverCB:getPoliceCount"
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = tonumber
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = 0
    end
    L1_3 = L1_3(L2_3)
    L2_3 = L1_2
    L1_3 = L1_3 >= L2_3
    L2_2 = L1_3
    L1_3 = L2_2
    if true ~= L1_3 then
      L1_3 = Notify
      L2_3 = Config
      L2_3 = L2_3.T
      L3_3 = "PoliceNotOnlineRequired"
      L4_3 = L1_2
      L2_3 = L2_3(L3_3, L4_3)
      L3_3 = "error"
      L1_3(L2_3, L3_3)
    end
  end
  L3_2(L4_2, L5_2)
  while "none" == L2_2 do
    L3_2 = Wait
    L4_2 = 50
    L3_2(L4_2)
  end
  L3_2 = true == L2_2
  return L3_2
end
function L31_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = L8_1
  if L1_2 then
    L1_2 = Notify
    L2_2 = Config
    L2_2 = L2_2.T
    L3_2 = "AlreadyRobbingObject"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    return
  end
  if A0_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_27
    end
  end
  L1_2 = Notify
  L2_2 = Config
  L2_2 = L2_2.T
  L3_2 = "NoObjectFoundToRob"
  L2_2 = L2_2(L3_2)
  L3_2 = "error"
  L1_2(L2_2, L3_2)
  do return end
  ::lbl_27::
  L1_2 = GetEntityModel
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L1_1
  L1_2 = L2_2[L1_2]
  if L1_2 then
    L2_2 = L1_2.enabled
    if L2_2 then
      goto lbl_45
    end
  end
  L2_2 = Notify
  L3_2 = Config
  L3_2 = L3_2.T
  L4_2 = "ObjectNotPettyCrime"
  L3_2 = L3_2(L4_2)
  L4_2 = "error"
  L2_2(L3_2, L4_2)
  do return end
  ::lbl_45::
  L2_2 = GetEntityCoords
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L23_1
  L4_2 = "petty_object"
  L5_2 = L1_2.label
  if not L5_2 then
    L5_2 = L1_2.model
  end
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = math
  L4_2 = L4_2.max
  L5_2 = 180
  L6_2 = math
  L6_2 = L6_2.ceil
  L7_2 = tonumber
  L8_2 = L1_2.progressDuration
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 7000
  end
  L7_2 = L7_2 / 1000
  L6_2 = L6_2(L7_2)
  L6_2 = L6_2 + 120
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L24_1
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = Notify
    L6_2 = Config
    L6_2 = L6_2.LangT
    L6_2 = L6_2.GlobalCooldown
    L7_2 = "error"
    L5_2(L6_2, L7_2)
    return
  end
  L8_1 = L3_2
  L5_2 = L25_1
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2, L6_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L7_2 = false
    L8_1 = L7_2
    if "busy" == L6_2 or "owned" == L6_2 then
      L7_2 = Notify
      L8_2 = Config
      L8_2 = L8_2.T
      L9_2 = "ObjectAlreadyBeingRobbed"
      L8_2 = L8_2(L9_2)
      L9_2 = "error"
      L7_2(L8_2, L9_2)
    elseif "cooldown" == L6_2 then
      L7_2 = Notify
      L8_2 = Config
      L8_2 = L8_2.LangT
      L8_2 = L8_2.GlobalCooldown
      L9_2 = "error"
      L7_2(L8_2, L9_2)
    else
      L7_2 = Notify
      L8_2 = Config
      L8_2 = L8_2.T
      L9_2 = "ObjectCannotBeRobbedNow"
      L8_2 = L8_2(L9_2)
      L9_2 = "error"
      L7_2(L8_2, L9_2)
    end
    return
  end
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L8_1
    L2_3 = L3_2
    if L1_3 ~= L2_3 then
      return
    end
    if A0_3 then
      L1_3 = TriggerServerEvent
      L2_3 = "Pug:server:CompletePettyCrimeObjectLock"
      L3_3 = L3_2
      L4_3 = tonumber
      L5_3 = L1_2.cooldown
      L4_3 = L4_3(L5_3)
      if not L4_3 then
        L4_3 = 0
      end
      L1_3(L2_3, L3_3, L4_3)
    else
      L1_3 = TriggerServerEvent
      L2_3 = "Pug:server:ReleasePettyCrimeObjectLock"
      L3_3 = L3_2
      L1_3(L2_3, L3_3)
    end
    L1_3 = false
    L8_1 = L1_3
  end
  L8_2 = L30_1
  L9_2 = L1_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = L7_2
    L9_2 = false
    L8_2(L9_2)
    return
  end
  L8_2 = L29_1
  L9_2 = L1_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = L7_2
    L9_2 = false
    L8_2(L9_2)
    return
  end
  L8_2 = SetPedHeadingToFaceVector
  L9_2 = PlayerPedId
  L9_2 = L9_2()
  L10_2 = L2_2
  L8_2(L9_2, L10_2)
  L8_2 = L27_1
  L9_2 = L1_2.minigameOption
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = L7_2
    L9_2 = false
    L8_2(L9_2)
    L8_2 = Notify
    L9_2 = Config
    L9_2 = L9_2.T
    L10_2 = "PettyCrimeFailed"
    L9_2 = L9_2(L10_2)
    L10_2 = "error"
    L8_2(L9_2, L10_2)
    return
  end
  L8_2 = L26_1
  L9_2 = L1_2.progressLabel
  if not L9_2 then
    L9_2 = Config
    L9_2 = L9_2.T
    L10_2 = "Robbing"
    L9_2 = L9_2(L10_2)
  end
  L10_2 = L1_2.progressDuration
  L8_2(L9_2, L10_2)
  L8_2 = math
  L8_2 = L8_2.max
  L9_2 = 0
  L10_2 = math
  L10_2 = L10_2.min
  L11_2 = 100
  L12_2 = tonumber
  L13_2 = L1_2.alertChance
  L12_2 = L12_2(L13_2)
  if not L12_2 then
    L12_2 = 100
  end
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L9_2 = L8_2 >= 100
  if L9_2 then
    L10_2 = L7_1
    if not L10_2 then
      L10_2 = true
      L7_1 = L10_2
      L10_2 = AlertPolice
      L11_2 = L1_2
      L10_2(L11_2)
      L10_2 = CreateThread
      function L11_2()
        local L0_3, L1_3
        L0_3 = Wait
        L1_3 = 45000
        L0_3(L1_3)
        L0_3 = false
        L7_1 = L0_3
      end
      L10_2(L11_2)
    end
  end
  L10_2 = L28_1
  L11_2 = L1_2
  L10_2(L11_2)
  L10_2 = L7_2
  L11_2 = true
  L10_2(L11_2)
  L10_2 = Notify
  L11_2 = Config
  L11_2 = L11_2.T
  L12_2 = "ObjectRobberySuccessful"
  L11_2 = L11_2(L12_2)
  L12_2 = "success"
  L10_2(L11_2, L12_2)
end
function L32_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 then
    L1_2 = A0_2.id
    if L1_2 then
      L1_2 = L0_1.porchPirate
      L1_2 = L1_2.enabled
      if L1_2 then
        goto lbl_11
      end
    end
  end
  do return end
  ::lbl_11::
  L1_2 = L21_1
  L2_2 = A0_2.id
  L1_2(L2_2)
  L1_2 = "petty_porch_"
  L2_2 = tostring
  L3_2 = A0_2.id
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2 .. L2_2
  L2_2 = L24_1
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    return
  end
  L2_2 = tostring
  L3_2 = A0_2.model
  if not L3_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  if "" == L2_2 then
    L3_2 = L10_1
    L3_2 = L3_2()
    L2_2 = L3_2
  end
  L3_2 = LoadModel
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = vector3
  L4_2 = A0_2.coords
  L4_2 = L4_2.x
  L5_2 = A0_2.coords
  L5_2 = L5_2.y
  L6_2 = A0_2.coords
  L6_2 = L6_2.z
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = CreateObject
  L5_2 = GetHashKey
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = L3_2.z
  L9_2 = false
  L10_2 = false
  L11_2 = false
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L5_2 = DoesEntityExist
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L5_2 = SetEntityHeading
  L6_2 = L4_2
  L7_2 = tonumber
  L8_2 = A0_2.heading
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 0.0
  end
  L5_2(L6_2, L7_2)
  L5_2 = PlaceObjectOnGroundProperly
  L6_2 = L4_2
  L5_2(L6_2)
  L5_2 = FreezeEntityPosition
  L6_2 = L4_2
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = SetEntityAsMissionEntity
  L6_2 = L4_2
  L7_2 = true
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  L6_2 = A0_2.id
  L5_2 = L3_1
  L5_2[L6_2] = L4_2
  L5_2 = L4_1
  L6_2 = A0_2.id
  L5_2[L4_2] = L6_2
  L5_2 = GetResourceState
  L6_2 = "RevoInteract"
  L5_2 = L5_2(L6_2)
  if "started" ~= L5_2 then
    L5_2 = Config
    L5_2 = L5_2.Target
    if L5_2 then
      L5_2 = Config
      L5_2 = L5_2.DrawTextInsteadOfTarget
      if not L5_2 then
        L5_2 = Config
        L5_2 = L5_2.Target
        if "ox_target" == L5_2 then
          L5_2 = exports
          L5_2 = L5_2.ox_target
          L6_2 = L5_2
          L5_2 = L5_2.addLocalEntity
          L7_2 = L4_2
          L8_2 = {}
          L9_2 = {}
          L10_2 = "PettyPorchPirate_"
          L11_2 = tostring
          L12_2 = A0_2.id
          L11_2 = L11_2(L12_2)
          L10_2 = L10_2 .. L11_2
          L9_2.name = L10_2
          L9_2.icon = "fa-solid fa-box-open"
          L10_2 = L0_1.porchPirate
          L10_2 = L10_2.interactionLabel
          if not L10_2 then
            L10_2 = "Steal Package"
          end
          L9_2.label = L10_2
          L9_2.distance = 1.5
          function L10_2()
            local L0_3, L1_3, L2_3, L3_3
            L1_3 = L4_2
            L0_3 = L4_1
            L0_3 = L0_3[L1_3]
            if L0_3 then
              L1_3 = TriggerEvent
              L2_3 = "Pug:client:StartPorchPirateRobbery"
              L3_3 = L0_3
              L1_3(L2_3, L3_3)
            end
          end
          L9_2.onSelect = L10_2
          L8_2[1] = L9_2
          L5_2(L6_2, L7_2, L8_2)
        else
          L5_2 = exports
          L6_2 = Config
          L6_2 = L6_2.Target
          L5_2 = L5_2[L6_2]
          L6_2 = L5_2
          L5_2 = L5_2.AddTargetEntity
          L7_2 = L4_2
          L8_2 = {}
          L9_2 = {}
          L10_2 = {}
          L10_2.icon = "fa-solid fa-box-open"
          L11_2 = L0_1.porchPirate
          L11_2 = L11_2.interactionLabel
          if not L11_2 then
            L11_2 = "Steal Package"
          end
          L10_2.label = L11_2
          function L11_2(A0_3)
            local L1_3, L2_3, L3_3, L4_3
            L1_3 = L4_1
            L1_3 = L1_3[A0_3]
            if L1_3 then
              L2_3 = TriggerEvent
              L3_3 = "Pug:client:StartPorchPirateRobbery"
              L4_3 = L1_3
              L2_3(L3_3, L4_3)
            end
          end
          L10_2.action = L11_2
          L9_2[1] = L10_2
          L8_2.options = L9_2
          L8_2.distance = 1.5
          L5_2(L6_2, L7_2, L8_2)
        end
      end
    end
  end
end
function L33_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L5_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    return
  end
  L2_2 = L5_1
  L2_2[A0_2] = true
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L0_3 = math
    L0_3 = L0_3.max
    L1_3 = 1
    L2_3 = math
    L2_3 = L2_3.floor
    L3_3 = tonumber
    L4_3 = A1_2
    L3_3 = L3_3(L4_3)
    if not L3_3 then
      L3_3 = 0
    end
    L3_3 = L3_3 * 60000
    L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3 = L2_3(L3_3)
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)
    L1_3 = Wait
    L2_3 = L0_3
    L1_3(L2_3)
    L2_3 = A0_2
    L1_3 = L5_1
    L1_3[L2_3] = nil
    L1_3 = L0_1
    if L1_3 then
      L1_3 = L0_1.porchPirate
      if L1_3 then
        L1_3 = L0_1.porchPirate
        L1_3 = L1_3.enabled
        if L1_3 then
          goto lbl_33
        end
      end
    end
    do return end
    ::lbl_33::
    L1_3 = ipairs
    L2_3 = L0_1.porchPirate
    L2_3 = L2_3.locations
    if not L2_3 then
      L2_3 = {}
    end
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = tostring
      L8_3 = L6_3.id
      L7_3 = L7_3(L8_3)
      L8_3 = tostring
      L9_3 = A0_2
      L8_3 = L8_3(L9_3)
      if L7_3 == L8_3 then
        L7_3 = L32_1
        L8_3 = L6_3
        L7_3(L8_3)
        break
      end
    end
  end
  L2_2(L3_2)
end
function L34_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = L22_1
  L0_2()
  L0_2 = L0_1
  if L0_2 then
    L0_2 = L0_1.porchPirate
    if L0_2 then
      L0_2 = L0_1.porchPirate
      L0_2 = L0_2.enabled
      if L0_2 then
        goto lbl_14
      end
    end
  end
  do return end
  ::lbl_14::
  L0_2 = {}
  L1_2 = ipairs
  L2_2 = L0_1.porchPirate
  L2_2 = L2_2.activeLocationIds
  if not L2_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = tostring
    L8_2 = L6_2 or L8_2
    if not L6_2 then
      L8_2 = ""
    end
    L7_2 = L7_2(L8_2)
    L0_2[L7_2] = true
  end
  L1_2 = ipairs
  L2_2 = L0_1.porchPirate
  L2_2 = L2_2.locations
  if not L2_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = tostring
    L8_2 = L6_2.id
    L7_2 = L7_2(L8_2)
    L7_2 = L0_2[L7_2]
    if L7_2 then
      L7_2 = L32_1
      L8_2 = L6_2
      L7_2(L8_2)
    end
  end
end
function L35_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = L2_1
  L0_2 = #L0_2
  if 0 ~= L0_2 then
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
          goto lbl_22
        end
      end
    end
  end
  L0_2 = {}
  L2_1 = L0_2
  do return end
  ::lbl_22::
  L0_2 = ipairs
  L1_2 = L2_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L5_2.models
    if L6_2 then
      L6_2 = L5_2.models
      L6_2 = #L6_2
      if L6_2 > 0 then
        L6_2 = L5_2.optionName
        if L6_2 then
          L6_2 = Config
          L6_2 = L6_2.Target
          if "ox_target" == L6_2 then
            L6_2 = exports
            L6_2 = L6_2.ox_target
            L7_2 = L6_2
            L6_2 = L6_2.removeModel
            L8_2 = L5_2.models
            L9_2 = L5_2.optionName
            L6_2(L7_2, L8_2, L9_2)
          else
            L6_2 = exports
            L7_2 = Config
            L7_2 = L7_2.Target
            L6_2 = L6_2[L7_2]
            L7_2 = L6_2
            L6_2 = L6_2.RemoveTargetModel
            L8_2 = L5_2.models
            L9_2 = L5_2.optionName
            L6_2(L7_2, L8_2, L9_2)
          end
        end
      end
    end
  end
  L0_2 = {}
  L2_1 = L0_2
end
function L36_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = L35_1
  L0_2()
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
        goto lbl_17
      end
    end
  end
  do return end
  ::lbl_17::
  L0_2 = ipairs
  L1_2 = L0_1.objectRobberies
  if not L1_2 then
    L1_2 = {}
  end
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L5_2.enabled
    if L6_2 then
      L6_2 = {}
      L7_2 = ipairs
      L8_2 = L5_2.models
      if not L8_2 then
        L8_2 = {}
      end
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        if "" ~= L12_2 then
          L13_2 = #L6_2
          L13_2 = L13_2 + 1
          L6_2[L13_2] = L12_2
        end
      end
      L7_2 = #L6_2
      if L7_2 > 0 then
        L7_2 = "PettyCrimeObjectTarget_%s"
        L8_2 = L7_2
        L7_2 = L7_2.format
        L9_2 = L4_2
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = L5_2.interactionLabel
        if not L8_2 then
          L8_2 = "Rob "
          L9_2 = L5_2.label
          if not L9_2 then
            L9_2 = "Object"
          end
          L8_2 = L8_2 .. L9_2
        end
        L9_2 = Config
        L9_2 = L9_2.Target
        if "ox_target" == L9_2 then
          L9_2 = exports
          L9_2 = L9_2.ox_target
          L10_2 = L9_2
          L9_2 = L9_2.addModel
          L11_2 = L6_2
          L12_2 = {}
          L13_2 = {}
          L13_2.name = L7_2
          L13_2.icon = "fa-solid fa-sack-dollar"
          L13_2.label = L8_2
          L13_2.distance = 1.5
          function L14_2(A0_3)
            local L1_3, L2_3
            L1_3 = L31_1
            L2_3 = A0_3.entity
            L1_3(L2_3)
          end
          L13_2.onSelect = L14_2
          L12_2[1] = L13_2
          L9_2(L10_2, L11_2, L12_2)
        else
          L9_2 = exports
          L10_2 = Config
          L10_2 = L10_2.Target
          L9_2 = L9_2[L10_2]
          L10_2 = L9_2
          L9_2 = L9_2.AddTargetModel
          L11_2 = L6_2
          L12_2 = {}
          L13_2 = {}
          L14_2 = {}
          L14_2.name = L7_2
          L14_2.icon = "fa-solid fa-sack-dollar"
          L14_2.label = L8_2
          function L15_2(A0_3)
            local L1_3, L2_3
            L1_3 = L31_1
            L2_3 = A0_3
            L1_3(L2_3)
          end
          L14_2.action = L15_2
          L13_2[1] = L14_2
          L12_2.options = L13_2
          L12_2.distance = 1.5
          L9_2(L10_2, L11_2, L12_2)
        end
        L9_2 = L2_1
        L9_2 = #L9_2
        L10_2 = L9_2 + 1
        L9_2 = L2_1
        L11_2 = {}
        L11_2.models = L6_2
        L11_2.optionName = L7_2
        L9_2[L10_2] = L11_2
      end
    end
  end
end
function L37_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L0_2 = GetEntityCoords
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  L1_2 = nil
  L2_2 = nil
  L3_2 = nil
  L4_2 = ipairs
  L5_2 = L0_1.objectRobberies
  if not L5_2 then
    L5_2 = {}
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L9_2.enabled
    if L10_2 then
      L10_2 = ipairs
      L11_2 = L9_2.models
      if not L11_2 then
        L11_2 = {}
      end
      L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
      for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
        L16_2 = GetClosestObjectOfType
        L17_2 = L0_2.x
        L18_2 = L0_2.y
        L19_2 = L0_2.z
        L20_2 = 1.6
        L21_2 = GetHashKey
        L22_2 = L15_2
        L21_2 = L21_2(L22_2)
        L22_2 = false
        L23_2 = false
        L24_2 = false
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
        if L16_2 and 0 ~= L16_2 then
          L17_2 = DoesEntityExist
          L18_2 = L16_2
          L17_2 = L17_2(L18_2)
          if L17_2 then
            L17_2 = GetEntityCoords
            L18_2 = L16_2
            L17_2 = L17_2(L18_2)
            L17_2 = L0_2 - L17_2
            L17_2 = #L17_2
            L18_2 = 1.6
            if L17_2 <= L18_2 and (not L3_2 or L3_2 > L17_2) then
              L1_2 = L16_2
              L2_2 = L9_2
              L3_2 = L17_2
            end
          end
        end
      end
    end
  end
  L4_2 = L1_2
  L5_2 = L2_2
  return L4_2, L5_2
end
function L38_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = GetEntityCoords
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L1_2 = nil
  L2_2 = nil
  L3_2 = pairs
  L4_2 = L3_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    if L8_2 then
      L9_2 = DoesEntityExist
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        L9_2 = GetEntityCoords
        L10_2 = L8_2
        L9_2 = L9_2(L10_2)
        L9_2 = L0_2 - L9_2
        L9_2 = #L9_2
        L10_2 = 1.6
        if L9_2 <= L10_2 and (not L2_2 or L2_2 > L9_2) then
          L1_2 = L7_2
          L2_2 = L9_2
        end
      end
    end
  end
  L3_2 = L1_2
  L4_2 = L2_2
  return L3_2, L4_2
end
function L39_1()
  local L0_2, L1_2
  L0_2 = L6_1
  if L0_2 then
    return
  end
  L0_2 = true
  L6_1 = L0_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = false
    while true do
      L1_3 = L6_1
      if not L1_3 then
        break
      end
      L1_3 = L37_1
      L1_3, L2_3 = L1_3()
      L3_3 = L38_1
      L3_3 = L3_3()
      if L3_3 then
        L4_3 = L0_1.porchPirate
        L4_3 = L4_3.interactionLabel
        if not L4_3 then
          L4_3 = "Steal Package"
        end
        L5_3 = DrawTextOption
        L6_3 = "[E] "
        L7_3 = L4_3
        L6_3 = L6_3 .. L7_3
        L5_3(L6_3)
        L0_3 = true
        L5_3 = IsControlJustPressed
        L6_3 = 0
        L7_3 = 38
        L5_3 = L5_3(L6_3, L7_3)
        if L5_3 then
          L5_3 = TriggerEvent
          L6_3 = "Pug:client:StartPorchPirateRobbery"
          L7_3 = L3_3
          L5_3(L6_3, L7_3)
          L5_3 = Wait
          L6_3 = 300
          L5_3(L6_3)
        end
        L5_3 = Wait
        L6_3 = 0
        L5_3(L6_3)
      elseif L1_3 and L2_3 then
        L4_3 = DrawTextOption
        L5_3 = "[E] "
        L6_3 = L2_3.interactionLabel
        if not L6_3 then
          L6_3 = "Rob Object"
        end
        L5_3 = L5_3 .. L6_3
        L4_3(L5_3)
        L0_3 = true
        L4_3 = IsControlJustPressed
        L5_3 = 0
        L6_3 = 38
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = L31_1
          L5_3 = L1_3
          L4_3(L5_3)
          L4_3 = Wait
          L5_3 = 300
          L4_3(L5_3)
        end
        L4_3 = Wait
        L5_3 = 0
        L4_3(L5_3)
      else
        if L0_3 then
          L4_3 = HideTextOption
          L4_3()
          L0_3 = false
        end
        L4_3 = Wait
        L5_3 = 500
        L4_3(L5_3)
      end
    end
    if L0_3 then
      L1_3 = HideTextOption
      L1_3()
    end
  end
  L0_2(L1_2)
end
function L40_1()
  local L0_2, L1_2
  L0_2 = L20_1
  L0_2()
  L0_2 = L36_1
  L0_2()
  L0_2 = L34_1
  L0_2()
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
        goto lbl_22
      end
    end
  end
  L0_2 = L39_1
  L0_2()
  ::lbl_22::
end
L41_1 = RegisterNUICallback
L42_1 = "SavePettyCrimeData"
function L43_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:savePettyCrimeData"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L2_2(L3_2)
end
L41_1(L42_1, L43_1)
L41_1 = RegisterNUICallback
L42_1 = "GetPettyCrimePresetFiles"
function L43_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:GetPettyCrimePresetFiles"
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A1_2
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = {}
      L2_3.success = false
      L3_3 = {}
      L2_3.files = L3_3
    end
    L1_3(L2_3)
  end
  L2_2(L3_2, L4_2)
end
L41_1(L42_1, L43_1)
L41_1 = RegisterNUICallback
L42_1 = "SavePettyCrimePreset"
function L43_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:SavePettyCrimePreset"
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = {}
      L2_3.success = false
      L2_3.error = "Failed to save petty crime preset."
    end
    L1_3(L2_3)
  end
  L5_2 = A0_2 or L5_2
  if A0_2 then
    L5_2 = A0_2.fileName
  end
  L6_2 = A0_2 or L6_2
  if A0_2 then
    L6_2 = A0_2.data
  end
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L41_1(L42_1, L43_1)
L41_1 = RegisterNUICallback
L42_1 = "LoadPettyCrimePreset"
function L43_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:LoadPettyCrimePreset"
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = {}
      L2_3.success = false
      L2_3.error = "Failed to load petty crime preset."
    end
    L1_3(L2_3)
  end
  L5_2 = A0_2 or L5_2
  if A0_2 then
    L5_2 = A0_2.fileName
  end
  L2_2(L3_2, L4_2, L5_2)
end
L41_1(L42_1, L43_1)
L41_1 = RegisterNUICallback
L42_1 = "PlacePorchPirateLocation"
function L43_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = "toggleUIVisibility"
  L3_2.visible = false
  L2_2(L3_2)
  L2_2 = L9_1
  L2_2 = L2_2()
  L3_2 = math
  L3_2 = L3_2.random
  L4_2 = 1
  L5_2 = #L2_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L2_2[L3_2]
  L5_2 = GetEntityHeading
  L6_2 = PlayerPedId
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L6_2()
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L6_2 = true
  L7_2 = GetEntityCoords
  L8_2 = PlayerPedId
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L8_2()
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L8_2 = nil
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = L8_2
    if L0_3 then
      L0_3 = DoesEntityExist
      L1_3 = L8_2
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = DeleteEntity
        L1_3 = L8_2
        L0_3(L1_3)
      end
    end
    L1_3 = L3_2
    L0_3 = L2_2
    L0_3 = L0_3[L1_3]
    if not L0_3 then
      L0_3 = "prop_cs_cardbox_01"
    end
    L4_2 = L0_3
    L0_3 = LoadModel
    L1_3 = L4_2
    L0_3(L1_3)
    L0_3 = CreateObject
    L1_3 = GetHashKey
    L2_3 = L4_2
    L1_3 = L1_3(L2_3)
    L2_3 = L7_2.x
    L3_3 = L7_2.y
    L4_3 = L7_2.z
    L5_3 = false
    L6_3 = false
    L7_3 = false
    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
    L8_2 = L0_3
    L0_3 = SetEntityCollision
    L1_3 = L8_2
    L2_3 = false
    L3_3 = false
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = SetEntityAlpha
    L1_3 = L8_2
    L2_3 = 180
    L3_3 = false
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = FreezeEntityPosition
    L1_3 = L8_2
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = SetEntityHeading
    L1_3 = L8_2
    L2_3 = L5_2
    L0_3(L1_3, L2_3)
  end
  function L10_2(A0_3)
    local L1_3, L2_3
    L1_3 = L3_2
    L1_3 = L1_3 + A0_3
    L3_2 = L1_3
    L1_3 = L3_2
    L2_3 = L2_2
    L2_3 = #L2_3
    if L1_3 > L2_3 then
      L1_3 = 1
      L3_2 = L1_3
    else
      L1_3 = L3_2
      if L1_3 < 1 then
        L1_3 = L2_2
        L1_3 = #L1_3
        L3_2 = L1_3
      end
    end
    L1_3 = L8_2
    if L1_3 then
      L1_3 = DoesEntityExist
      L2_3 = L8_2
      L1_3 = L1_3(L2_3)
      if L1_3 then
        L1_3 = GetEntityCoords
        L2_3 = L8_2
        L1_3 = L1_3(L2_3)
        if L1_3 then
          goto lbl_36
        end
      end
    end
    L1_3 = GetEntityCoords
    L2_3 = PlayerPedId
    L2_3 = L2_3()
    L1_3 = L1_3(L2_3)
    ::lbl_36::
    L7_2 = L1_3
    L1_3 = L9_2
    L1_3()
  end
  L11_2 = L9_2
  L11_2()
  while L6_2 do
    L11_2 = Wait
    L12_2 = 0
    L11_2(L12_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 24
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 25
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 14
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 15
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 1
    L13_2 = 14
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 1
    L13_2 = 15
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 44
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 45
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 140
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 141
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = DisableControlAction
    L12_2 = 0
    L13_2 = 142
    L14_2 = true
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = RayCastGamePlayCamera
    L12_2 = 20.0
    L11_2, L12_2 = L11_2(L12_2)
    if L11_2 and L12_2 then
      L13_2 = SetEntityCoords
      L14_2 = L8_2
      L15_2 = L12_2.x
      L16_2 = L12_2.y
      L17_2 = L12_2.z
      L13_2(L14_2, L15_2, L16_2, L17_2)
      L13_2 = PlaceObjectOnGroundProperly
      L14_2 = L8_2
      L13_2(L14_2)
      L13_2 = SetEntityHeading
      L14_2 = L8_2
      L15_2 = L5_2
      L13_2(L14_2, L15_2)
    end
    L13_2 = DrawRobberyCreatorPrompt
    L14_2 = {}
    L14_2.title = "Porch Package Placement"
    L14_2.description = "Place the package where players should be able to steal it."
    L15_2 = "Box prop %s/%s: %s"
    L16_2 = L15_2
    L15_2 = L15_2.format
    L17_2 = L3_2
    L18_2 = #L2_2
    L19_2 = L4_2
    L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2)
    L14_2.meta = L15_2
    L15_2 = {}
    L16_2 = {}
    L16_2.key = "E"
    L16_2.label = "Place package"
    L16_2.tone = "primary"
    L17_2 = {}
    L17_2.key = "Left / Right"
    L17_2.label = "Rotate package"
    L18_2 = {}
    L18_2.key = "Mouse Wheel"
    L18_2.label = "Change box prop"
    L19_2 = {}
    L19_2.key = "Backspace / ESC"
    L19_2.label = "Cancel"
    L19_2.tone = "danger"
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L15_2[4] = L19_2
    L14_2.actions = L15_2
    L13_2(L14_2)
    L13_2 = IsControlPressed
    L14_2 = 0
    L15_2 = 174
    L13_2 = L13_2(L14_2, L15_2)
    if not L13_2 then
      L13_2 = IsDisabledControlPressed
      L14_2 = 0
      L15_2 = 44
      L13_2 = L13_2(L14_2, L15_2)
      if not L13_2 then
        goto lbl_163
      end
    end
    L5_2 = L5_2 + 2.0
    goto lbl_177
    ::lbl_163::
    L13_2 = IsControlPressed
    L14_2 = 0
    L15_2 = 175
    L13_2 = L13_2(L14_2, L15_2)
    if not L13_2 then
      L13_2 = IsDisabledControlPressed
      L14_2 = 0
      L15_2 = 45
      L13_2 = L13_2(L14_2, L15_2)
      if not L13_2 then
        goto lbl_177
      end
    end
    L5_2 = L5_2 - 2.0
    ::lbl_177::
    L13_2 = 360.0
    if L5_2 >= L13_2 then
      L5_2 = L5_2 - 360.0
    elseif L5_2 < 0.0 then
      L5_2 = L5_2 + 360.0
    end
    L13_2 = IsDisabledControlJustPressed
    L14_2 = 0
    L15_2 = 15
    L13_2 = L13_2(L14_2, L15_2)
    if not L13_2 then
      L13_2 = IsDisabledControlJustPressed
      L14_2 = 1
      L15_2 = 15
      L13_2 = L13_2(L14_2, L15_2)
      if not L13_2 then
        goto lbl_203
      end
    end
    L13_2 = L10_2
    L14_2 = 1
    L13_2(L14_2)
    goto lbl_218
    ::lbl_203::
    L13_2 = IsDisabledControlJustPressed
    L14_2 = 0
    L15_2 = 14
    L13_2 = L13_2(L14_2, L15_2)
    if not L13_2 then
      L13_2 = IsDisabledControlJustPressed
      L14_2 = 1
      L15_2 = 14
      L13_2 = L13_2(L14_2, L15_2)
      if not L13_2 then
        goto lbl_218
      end
    end
    L13_2 = L10_2
    L14_2 = -1
    L13_2(L14_2)
    ::lbl_218::
    L13_2 = IsControlJustPressed
    L14_2 = 0
    L15_2 = 38
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 then
      L13_2 = GetEntityCoords
      L14_2 = L8_2
      L13_2 = L13_2(L14_2)
      L14_2 = DeleteEntity
      L15_2 = L8_2
      L14_2(L15_2)
      L14_2 = HideRobberyCreatorPrompt
      L14_2()
      L14_2 = SetNuiFocus
      L15_2 = true
      L16_2 = true
      L14_2(L15_2, L16_2)
      L14_2 = SendNUIMessage
      L15_2 = {}
      L15_2.type = "toggleUIVisibility"
      L15_2.visible = true
      L14_2(L15_2)
      L14_2 = A1_2
      L15_2 = {}
      L15_2.success = true
      L16_2 = {}
      L16_2.model = L4_2
      L16_2.heading = L5_2
      L17_2 = {}
      L18_2 = L13_2.x
      L17_2.x = L18_2
      L18_2 = L13_2.y
      L17_2.y = L18_2
      L18_2 = L13_2.z
      L17_2.z = L18_2
      L16_2.coords = L17_2
      L15_2.location = L16_2
      L14_2(L15_2)
      return
    else
      L13_2 = IsControlJustPressed
      L14_2 = 0
      L15_2 = 177
      L13_2 = L13_2(L14_2, L15_2)
      if not L13_2 then
        L13_2 = IsControlJustPressed
        L14_2 = 0
        L15_2 = 202
        L13_2 = L13_2(L14_2, L15_2)
        if not L13_2 then
          L13_2 = IsControlJustPressed
          L14_2 = 0
          L15_2 = 322
          L13_2 = L13_2(L14_2, L15_2)
          if not L13_2 then
            goto lbl_282
          end
        end
      end
      L6_2 = false
    end
    ::lbl_282::
  end
  if L8_2 then
    L11_2 = DoesEntityExist
    L12_2 = L8_2
    L11_2 = L11_2(L12_2)
    if L11_2 then
      L11_2 = DeleteEntity
      L12_2 = L8_2
      L11_2(L12_2)
    end
  end
  L11_2 = HideRobberyCreatorPrompt
  L11_2()
  L11_2 = SetNuiFocus
  L12_2 = true
  L13_2 = true
  L11_2(L12_2, L13_2)
  L11_2 = SendNUIMessage
  L12_2 = {}
  L12_2.type = "toggleUIVisibility"
  L12_2.visible = true
  L11_2(L12_2)
  L11_2 = A1_2
  L12_2 = {}
  L12_2.success = false
  L12_2.error = "Placement cancelled."
  L11_2(L12_2)
end
L41_1(L42_1, L43_1)
L41_1 = RegisterNetEvent
L42_1 = "Pug:client:UpdatePettyCrimeData"
function L43_1(A0_2)
  local L1_2, L2_2
  L1_2 = L19_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L0_1 = L1_2
  L1_2 = L40_1
  L1_2()
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "updatePettyCrimeData"
  L2_2.PettyCrimeData = A0_2
  L1_2(L2_2)
end
L41_1(L42_1, L43_1)
L41_1 = RegisterNetEvent
L42_1 = "Pug:client:SyncPorchPirateActiveLocations"
function L43_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = L0_1
  if L1_2 then
    L1_2 = L0_1.porchPirate
    if L1_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L1_2 = L0_1.porchPirate
  L2_2 = {}
  L1_2.activeLocationIds = L2_2
  L1_2 = ipairs
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = tostring
    L8_2 = L6_2 or L8_2
    if not L6_2 then
      L8_2 = ""
    end
    L7_2 = L7_2(L8_2)
    if "" ~= L7_2 then
      L8_2 = L0_1.porchPirate
      L8_2 = L8_2.activeLocationIds
      L9_2 = L0_1.porchPirate
      L9_2 = L9_2.activeLocationIds
      L9_2 = #L9_2
      L9_2 = L9_2 + 1
      L8_2[L9_2] = L7_2
    end
  end
  L1_2 = L34_1
  L1_2()
end
L41_1(L42_1, L43_1)
L41_1 = RegisterNetEvent
L42_1 = "Pug:client:StartPorchPirateRobbery"
function L43_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  if "" == A0_2 then
    return
  end
  L1_2 = L0_1.porchPirate
  if not L1_2 then
    L1_2 = {}
  end
  L2_2 = L3_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L3_2 = DoesEntityExist
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_32
    end
  end
  L3_2 = Notify
  L4_2 = Config
  L4_2 = L4_2.T
  L5_2 = "PackageUnavailable"
  L4_2 = L4_2(L5_2)
  L5_2 = "error"
  L3_2(L4_2, L5_2)
  do return end
  ::lbl_32::
  L3_2 = "petty_porch_"
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L4_2 = L24_1
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = Notify
    L5_2 = Config
    L5_2 = L5_2.LangT
    L5_2 = L5_2.GlobalCooldown
    L6_2 = "error"
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = L30_1
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = L29_1
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L4_2 = L27_1
  L5_2 = L1_2.minigameOption
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = Notify
    L5_2 = Config
    L5_2 = L5_2.T
    L6_2 = "PackageStealFailed"
    L5_2 = L5_2(L6_2)
    L6_2 = "error"
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = L26_1
  L5_2 = L1_2.progressLabel
  if not L5_2 then
    L5_2 = Config
    L5_2 = L5_2.T
    L6_2 = "StealingPackage"
    L5_2 = L5_2(L6_2)
  end
  L6_2 = L1_2.progressDuration
  L4_2(L5_2, L6_2)
  L4_2 = L28_1
  L5_2 = L1_2
  L4_2(L5_2)
  L4_2 = TriggerServerEvent
  L5_2 = "Pug:server:MarkPorchPirateLocationTaken"
  L6_2 = A0_2
  L7_2 = tonumber
  L8_2 = L1_2.cooldown
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 0
  end
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = Notify
  L5_2 = Config
  L5_2 = L5_2.T
  L6_2 = "PackageStolen"
  L5_2 = L5_2(L6_2)
  L6_2 = "success"
  L4_2(L5_2, L6_2)
end
L41_1(L42_1, L43_1)
L41_1 = AddEventHandler
L42_1 = "onResourceStop"
function L43_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = false
  L6_1 = L1_2
  L1_2 = L22_1
  L1_2()
end
L41_1(L42_1, L43_1)
