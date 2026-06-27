local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L2_1.activeLocationIds = L3_1
L3_1 = {}
L2_1.cooldowns = L3_1
L3_1 = {}
L4_1 = nil
function L5_1(A0_2)
  local L1_2, L2_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = L0_1
    L2_2 = {}
    L1_2[A0_2] = L2_2
  end
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L5_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = tostring
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  A1_2 = L4_2
  L4_2 = tonumber
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  A2_2 = L4_2 or A2_2
  if not L4_2 then
    A2_2 = 0
  end
  if not L3_2 or "" == A1_2 or A2_2 <= 0 then
    return
  end
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L5_2 = A2_2 * 60
  L4_2 = L4_2 + L5_2
  L3_2[A1_2] = L4_2
end
function L7_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tostring
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if A0_2 and "" ~= A1_2 then
    L2_2 = L0_1
    L2_2 = L2_2[A0_2]
    if L2_2 then
      goto lbl_20
    end
  end
  do return end
  ::lbl_20::
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  L2_2[A1_2] = nil
  L2_2 = next
  L3_2 = L0_1
  L3_2 = L3_2[A0_2]
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = L0_1
    L2_2[A0_2] = nil
  end
end
function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tostring
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if not A0_2 or "" == A1_2 then
    L2_2 = false
    L3_2 = 0
    return L2_2, L3_2
  end
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L3_2 = false
    L4_2 = 0
    return L3_2, L4_2
  end
  L3_2 = L2_2[A1_2]
  if not L3_2 then
    L4_2 = false
    L5_2 = 0
    return L4_2, L5_2
  end
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  if L3_2 > L4_2 then
    L5_2 = true
    L6_2 = L3_2 - L4_2
    return L5_2, L6_2
  end
  L2_2[A1_2] = nil
  L5_2 = next
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = L0_1
    L5_2[A0_2] = nil
  end
  L5_2 = false
  L6_2 = 0
  return L5_2, L6_2
end
function L9_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  if "" == A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = tonumber
  L3_2 = L1_2.expiresAt
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = os
    L2_2 = L2_2.time
    L2_2 = L2_2()
    L3_2 = L1_2.expiresAt
    if L2_2 >= L3_2 then
      L2_2 = L1_1
      L2_2[A0_2] = nil
      L2_2 = nil
      return L2_2
    end
  end
  return L1_2
end
function L10_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Config
  L2_2 = L2_2.PettyCrimeGlobalCooldowns
  if false ~= L2_2 then
    L2_2 = type
    L3_2 = AllRobberysCooldDownTable
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      L2_2 = AllRobberysCooldDownTable
      if L2_2 then
        goto lbl_14
      end
    end
    L2_2 = nil
    ::lbl_14::
    L3_2 = tostring
    L4_2 = A1_2 or L4_2
    if not A1_2 then
      L4_2 = ""
    end
    L3_2 = L3_2(L4_2)
    A1_2 = L3_2
    if not L2_2 or "" == A1_2 then
      L3_2 = false
      L4_2 = 0
      return L3_2, L4_2
    end
    L3_2 = L2_2[A1_2]
    if not L3_2 then
      L4_2 = false
      L5_2 = 0
      return L4_2, L5_2
    end
    L4_2 = os
    L4_2 = L4_2.time
    L4_2 = L4_2()
    if L3_2 > L4_2 then
      L5_2 = true
      L6_2 = L3_2 - L4_2
      return L5_2, L6_2
    end
    L2_2[A1_2] = nil
    L5_2 = false
    L6_2 = 0
    return L5_2, L6_2
  end
  L2_2 = L8_1
  L3_2 = A0_2
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = {}
  L1_2 = ipairs
  L2_2 = Config
  L2_2 = L2_2.PettyCrimeObjectModels
  if not L2_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = #L0_2
    L7_2 = L7_2 + 1
    L8_2 = {}
    L9_2 = L6_2.label
    L8_2.label = L9_2
    L9_2 = L6_2.model
    L8_2.model = L9_2
    L9_2 = {}
    L10_2 = L6_2.model
    L9_2[1] = L10_2
    L8_2.models = L9_2
    L9_2 = "Rob "
    L10_2 = L6_2.label
    if not L10_2 then
      L10_2 = "Object"
    end
    L9_2 = L9_2 .. L10_2
    L8_2.interactionLabel = L9_2
    L9_2 = "Searching "
    L10_2 = string
    L10_2 = L10_2.lower
    L11_2 = L6_2.label
    if not L11_2 then
      L11_2 = "object"
    end
    L10_2 = L10_2(L11_2)
    L9_2 = L9_2 .. L10_2
    L8_2.progressLabel = L9_2
    L8_2.progressDuration = 7000
    L8_2.policeRequired = 0
    L8_2.cooldown = 15
    L8_2.minigameOption = "none"
    L8_2.moneyReward = false
    L8_2.rewardType = "cash"
    L8_2.minMoney = 25
    L8_2.maxMoney = 75
    L8_2.moneyChance = 100
    L9_2 = {}
    L8_2.rewardItems = L9_2
    L9_2 = {}
    L8_2.requiredItems = L9_2
    L8_2.moneyRewardEnabled = false
    L8_2.rewardItemsEnabled = false
    L8_2.requiredItemsEnabled = false
    L8_2.enabled = false
    L0_2[L7_2] = L8_2
  end
  L1_2 = {}
  L1_2.objectRobberies = L0_2
  L2_2 = {}
  L2_2.enabled = true
  L2_2.interactionLabel = "Steal Package"
  L2_2.progressLabel = "Snatching package"
  L2_2.progressDuration = 5000
  L2_2.policeRequired = 0
  L2_2.cooldown = 20
  L2_2.activeSpawnPercent = 25
  L2_2.minigameOption = "none"
  L2_2.moneyReward = false
  L2_2.rewardType = "cash"
  L2_2.minMoney = 50
  L2_2.maxMoney = 150
  L2_2.moneyChance = 100
  L3_2 = {}
  L2_2.rewardItems = L3_2
  L3_2 = {}
  L2_2.requiredItems = L3_2
  L2_2.moneyRewardEnabled = false
  L2_2.rewardItemsEnabled = false
  L2_2.requiredItemsEnabled = false
  L3_2 = {}
  L2_2.locations = L3_2
  L3_2 = {}
  L2_2.activeLocationIds = L3_2
  L1_2.porchPirate = L2_2
  return L1_2
end
GetDefaultPettyCrimeSettings = L11_1
function L11_1(A0_2)
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
function L13_1(A0_2)
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
function L14_1(A0_2, A1_2)
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
function L15_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = L14_1
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
  L4_2 = L11_1
  L5_2 = A0_2.rewardItems
  L4_2 = L4_2(L5_2)
  L5_2 = L12_1
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
  L10_2 = L13_1
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
function L16_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
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
  L6_2 = tostring
  L7_2 = A0_2.id
  if not L7_2 then
    L7_2 = "porch_"
    L8_2 = tostring
    L9_2 = A1_2
    L8_2 = L8_2(L9_2)
    L7_2 = L7_2 .. L8_2
  end
  L6_2 = L6_2(L7_2)
  L7_2 = tostring
  L8_2 = A0_2.model
  if not L8_2 then
    L8_2 = ""
  end
  L7_2 = L7_2(L8_2)
  L8_2 = {}
  L8_2.id = L6_2
  L9_2 = tostring
  L10_2 = A0_2.label
  if not L10_2 then
    L10_2 = "Package Spot "
    L11_2 = tostring
    L12_2 = A1_2
    L11_2 = L11_2(L12_2)
    L10_2 = L10_2 .. L11_2
  end
  L9_2 = L9_2(L10_2)
  L8_2.label = L9_2
  L8_2.model = L7_2
  L9_2 = tonumber
  L10_2 = A0_2.heading
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 0.0
  end
  L8_2.heading = L9_2
  L9_2 = {}
  L9_2.x = L3_2
  L9_2.y = L4_2
  L9_2.z = L5_2
  L8_2.coords = L9_2
  return L8_2
end
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = GetDefaultPettyCrimeSettings
  L1_2 = L1_2()
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2.objectRobberies
  if not L4_2 then
    L4_2 = L1_2.objectRobberies
  end
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L15_1
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    L10_2 = L9_2.model
    if "" == L10_2 then
      L10_2 = L9_2.label
      if "" == L10_2 then
        goto lbl_35
      end
    end
    L10_2 = #L2_2
    L10_2 = L10_2 + 1
    L2_2[L10_2] = L9_2
    ::lbl_35::
  end
  L3_2 = type
  L4_2 = A0_2.porchPirate
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = A0_2.porchPirate
    if L3_2 then
      goto lbl_47
    end
  end
  L3_2 = L1_2.porchPirate
  ::lbl_47::
  L4_2 = type
  L5_2 = L3_2.locations
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = L3_2.locations
    L4_2 = #L4_2
    if L4_2 then
      goto lbl_57
    end
  end
  L4_2 = 0
  ::lbl_57::
  L5_2 = L15_1
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L6_2 = L3_2.enabled
  L6_2 = false ~= L6_2
  L5_2.enabled = L6_2
  L6_2 = tonumber
  L7_2 = L3_2.activeSpawnPercent
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L7_2 = tonumber
    L8_2 = L3_2.activeSpawnMin
    L7_2 = L7_2(L8_2)
    L8_2 = tonumber
    L9_2 = L3_2.activeSpawnMax
    L8_2 = L8_2(L9_2)
    if L4_2 > 0 and (L7_2 or L8_2) then
      L9_2 = L7_2 or L9_2
      L9_2 = L8_2 or L9_2
      if not L7_2 and not L8_2 then
        L9_2 = 0
      end
      L10_2 = L8_2 or L10_2
      L10_2 = L7_2 or L10_2
      if not L8_2 and not L7_2 then
        L10_2 = L9_2
      end
      L11_2 = L9_2 + L10_2
      L11_2 = L11_2 / 2
      L11_2 = L11_2 / L4_2
      L6_2 = L11_2 * 100
    else
      L9_2 = L1_2.porchPirate
      L9_2 = L9_2.activeSpawnPercent
      L6_2 = L9_2 or L6_2
      if not L9_2 then
        L6_2 = 25
      end
    end
  end
  L7_2 = math
  L7_2 = L7_2.max
  L8_2 = 0
  L9_2 = math
  L9_2 = L9_2.min
  L10_2 = 100
  L11_2 = math
  L11_2 = L11_2.floor
  L12_2 = L6_2 + 0.5
  L11_2, L12_2, L13_2, L14_2, L15_2 = L11_2(L12_2)
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L5_2.activeSpawnPercent = L7_2
  L7_2 = {}
  L5_2.locations = L7_2
  L7_2 = {}
  L5_2.activeLocationIds = L7_2
  L7_2 = ipairs
  L8_2 = L3_2.locations
  if not L8_2 then
    L8_2 = {}
  end
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = L16_1
    L14_2 = L12_2
    L15_2 = L11_2
    L13_2 = L13_2(L14_2, L15_2)
    if L13_2 then
      L14_2 = L5_2.locations
      L15_2 = L5_2.locations
      L15_2 = #L15_2
      L15_2 = L15_2 + 1
      L14_2[L15_2] = L13_2
    end
  end
  L7_2 = {}
  L7_2.objectRobberies = L2_2
  L7_2.porchPirate = L5_2
  return L7_2
end
L18_1 = "preset-info/pettycrime-presets/pettycrime-preset-index.json"
function L19_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
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
  L1_2 = L1_2(L2_2, L3_2, L4_2)
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
function L20_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L19_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L1_2 = "pettycrime_preset"
  end
  L2_2 = "preset-info/pettycrime-presets/%s.json"
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
function L21_1()
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
  L6_2 = "pettycrime-presets"
  L2_2 = L2_2 .. L3_2 .. L4_2 .. L5_2 .. L6_2
  return L2_2
end
function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = "string" == L1_2
  return L1_2
end
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = L22_1
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
function L24_1(A0_2)
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
function L25_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = LoadResourceFile
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  L2_2 = L18_1
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
function L26_1(A0_2)
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
      L8_2 = L20_1
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
  L6_2 = L18_1
  L7_2 = L3_2
  L8_2 = -1
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end
function L27_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L25_1
  L1_2 = L1_2()
  L2_2 = #L1_2
  L2_2 = L2_2 + 1
  L1_2[L2_2] = A0_2
  L2_2 = L26_1
  L3_2 = L1_2
  L2_2(L3_2)
end
function L28_1()
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
    L3_3 = "^preset%-info/pettycrime%-presets/(.+)$"
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
      if not L3_3 and "pettycrime-preset-index.json" ~= L1_3 then
        L3_3 = L0_2
        L3_3[L1_3] = true
      end
    end
  end
  L2_2 = ipairs
  L3_2 = L25_1
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L3_2()
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L20_1
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
  L2_2 = L21_1
  L2_2 = L2_2()
  if L2_2 then
    L3_2 = nil
    L4_2 = L22_1
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = "powershell -NoProfile -Command \"& { Get-ChildItem -LiteralPath %s -File | Select-Object -ExpandProperty Name }\""
      L5_2 = L4_2
      L4_2 = L4_2.format
      L6_2 = L24_1
      L7_2 = L2_2
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L3_2 = L4_2
    else
      L4_2 = "ls -1 %s"
      L5_2 = L4_2
      L4_2 = L4_2.format
      L6_2 = L23_1
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
function L29_1(A0_2, A1_2)
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
  L6_2 = " is not valid JSON petty crime preset data."
  L5_2 = L5_2 .. L6_2
  do return L4_2, L5_2 end
  ::lbl_28::
  L4_2 = L17_1
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
function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = tostring
    L9_2 = L7_2 or L9_2
    if not L7_2 then
      L9_2 = ""
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
      L1_2[L9_2] = L8_2
    end
  end
  return L1_2
end
function L31_1()
  local L0_2, L1_2
  L0_2 = L4_1
  if not L0_2 then
    L0_2 = nil
    return L0_2
  end
  L0_2 = L4_1.porchPirate
  return L0_2
end
function L32_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L1_2 = A0_2.locations
    if L1_2 then
      goto lbl_8
    end
  end
  L1_2 = {}
  ::lbl_8::
  L1_2 = #L1_2
  L2_2 = math
  L2_2 = L2_2.max
  L3_2 = 0
  L4_2 = math
  L4_2 = L4_2.min
  L5_2 = 100
  L6_2 = tonumber
  L7_2 = A0_2 or L7_2
  if A0_2 then
    L7_2 = A0_2.activeSpawnPercent
  end
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 25
  end
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  if L1_2 <= 0 or L2_2 <= 0 then
    L3_2 = 0
    return L3_2
  end
  L3_2 = math
  L3_2 = L3_2.min
  L4_2 = L1_2
  L5_2 = math
  L5_2 = L5_2.max
  L6_2 = 1
  L7_2 = math
  L7_2 = L7_2.ceil
  L8_2 = L1_2 * L2_2
  L8_2 = L8_2 / 100
  L7_2, L8_2 = L7_2(L8_2)
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
end
function L33_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = type
  L3_2 = A0_2.activeLocationIds
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = A0_2.activeLocationIds
    if L2_2 then
      goto lbl_16
    end
  end
  L2_2 = {}
  ::lbl_16::
  A0_2.activeLocationIds = L2_2
  L2_2 = type
  L3_2 = A0_2.cooldowns
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = A0_2.cooldowns
    if L2_2 then
      goto lbl_27
    end
  end
  L2_2 = {}
  ::lbl_27::
  A0_2.cooldowns = L2_2
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A1_2.locations
  if not L4_2 then
    L4_2 = {}
  end
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = tostring
    L10_2 = L8_2.id
    L9_2 = L9_2(L10_2)
    L2_2[L9_2] = true
  end
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L4_2 = pairs
  L5_2 = A0_2.cooldowns
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L2_2[L8_2]
    if not (L10_2 and L9_2) or L9_2 <= L3_2 then
      L10_2 = A0_2.cooldowns
      L10_2[L8_2] = nil
    end
  end
  L4_2 = {}
  L5_2 = {}
  L6_2 = ipairs
  L7_2 = A0_2.activeLocationIds
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = tostring
    L13_2 = L11_2 or L13_2
    if not L11_2 then
      L13_2 = ""
    end
    L12_2 = L12_2(L13_2)
    if "" ~= L12_2 then
      L13_2 = L2_2[L12_2]
      if L13_2 then
        L13_2 = A0_2.cooldowns
        L13_2 = L13_2[L12_2]
        if not L13_2 then
          L13_2 = L5_2[L12_2]
          if not L13_2 then
            L5_2[L12_2] = true
            L13_2 = #L4_2
            L13_2 = L13_2 + 1
            L4_2[L13_2] = L12_2
          end
        end
      end
    end
  end
  A0_2.activeLocationIds = L4_2
  L6_2 = L32_1
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  while true do
    L7_2 = A0_2.activeLocationIds
    L7_2 = #L7_2
    if not (L6_2 < L7_2) then
      break
    end
    L7_2 = table
    L7_2 = L7_2.remove
    L8_2 = A0_2.activeLocationIds
    L9_2 = math
    L9_2 = L9_2.random
    L10_2 = 1
    L11_2 = A0_2.activeLocationIds
    L11_2 = #L11_2
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2, L11_2)
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L7_2 = {}
  L5_2 = L7_2
  L7_2 = ipairs
  L8_2 = A0_2.activeLocationIds
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = tostring
    L14_2 = L12_2 or L14_2
    if not L12_2 then
      L14_2 = ""
    end
    L13_2 = L13_2(L14_2)
    L5_2[L13_2] = true
  end
  L7_2 = {}
  L8_2 = ipairs
  L9_2 = A1_2.locations
  if not L9_2 then
    L9_2 = {}
  end
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = tostring
    L15_2 = L13_2.id
    L14_2 = L14_2(L15_2)
    if "" ~= L14_2 then
      L15_2 = L5_2[L14_2]
      if not L15_2 then
        L15_2 = A0_2.cooldowns
        L15_2 = L15_2[L14_2]
        if not L15_2 then
          L15_2 = #L7_2
          L15_2 = L15_2 + 1
          L7_2[L15_2] = L14_2
        end
      end
    end
  end
  while true do
    L8_2 = A0_2.activeLocationIds
    L8_2 = #L8_2
    if not (L6_2 > L8_2) then
      break
    end
    L8_2 = #L7_2
    if not (L8_2 > 0) then
      break
    end
    L8_2 = math
    L8_2 = L8_2.random
    L9_2 = 1
    L10_2 = #L7_2
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = table
    L9_2 = L9_2.remove
    L10_2 = L7_2
    L11_2 = L8_2
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = A0_2.activeLocationIds
    L11_2 = A0_2.activeLocationIds
    L11_2 = #L11_2
    L11_2 = L11_2 + 1
    L10_2[L11_2] = L9_2
  end
  return A0_2
end
function L34_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = L3_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = L3_1
    L2_2 = {}
    L3_2 = {}
    L2_2.activeLocationIds = L3_2
    L3_2 = {}
    L2_2.cooldowns = L3_2
    L1_2[A0_2] = L2_2
  end
  L1_2 = L3_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
function L35_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L31_1
  L1_2 = L1_2()
  if L1_2 then
    L2_2 = L1_2.enabled
    if false ~= L2_2 then
      goto lbl_11
    end
  end
  L2_2 = {}
  do return L2_2 end
  ::lbl_11::
  L2_2 = Config
  L2_2 = L2_2.PettyCrimeGlobalCooldowns
  if false ~= L2_2 then
    L2_2 = L33_1
    L3_2 = L2_1
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
    L2_2 = L30_1
    L3_2 = L2_1.activeLocationIds
    return L2_2(L3_2)
  end
  L2_2 = L34_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = {}
    return L3_2
  end
  L3_2 = L33_1
  L4_2 = L2_2
  L5_2 = L1_2
  L3_2(L4_2, L5_2)
  L3_2 = L30_1
  L4_2 = L2_2.activeLocationIds
  return L3_2(L4_2)
end
function L36_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L4_1
  if not L1_2 then
    L1_2 = L17_1
    L2_2 = {}
    L1_2 = L1_2(L2_2)
  end
  L2_2 = json
  L2_2 = L2_2.decode
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = L1_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L2_2.porchPirate
  if not L3_2 then
    L3_2 = {}
  end
  L2_2.porchPirate = L3_2
  L3_2 = L2_2.porchPirate
  L4_2 = L35_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L3_2.activeLocationIds = L4_2
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = L2_2
  return L3_2(L4_2)
end
function L37_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = TriggerClientEvent
  L2_2 = "Pug:client:SyncPorchPirateActiveLocations"
  L3_2 = A0_2
  L4_2 = L35_1
  L5_2 = A0_2
  L4_2, L5_2 = L4_2(L5_2)
  L1_2(L2_2, L3_2, L4_2, L5_2)
end
function L38_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = Config
  L0_2 = L0_2.PettyCrimeGlobalCooldowns
  if false ~= L0_2 then
    L0_2 = L35_1
    L1_2 = 0
    L0_2 = L0_2(L1_2)
    L1_2 = TriggerClientEvent
    L2_2 = "Pug:client:SyncPorchPirateActiveLocations"
    L3_2 = -1
    L4_2 = L0_2
    L1_2(L2_2, L3_2, L4_2)
    return
  end
  L0_2 = ipairs
  L1_2 = GetPlayers
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L1_2()
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = tonumber
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L7_2 = L37_1
      L8_2 = L6_2
      L7_2(L8_2)
    end
  end
end
function L39_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L4_1
  if L1_2 then
    L1_2 = L36_1
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT settings FROM pug_pettycrimes WHERE id = 1 LIMIT 1"
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = L1_2[1]
    if L2_2 then
      L2_2 = L1_2[1]
      L2_2 = L2_2.settings
      if L2_2 then
        L2_2 = pcall
        L3_2 = json
        L3_2 = L3_2.decode
        L4_2 = L1_2[1]
        L4_2 = L4_2.settings
        L2_2, L3_2 = L2_2(L3_2, L4_2)
        L4_2 = L17_1
        L5_2 = L3_2 or L5_2
        if not L2_2 or not L3_2 then
          L5_2 = {}
        end
        L4_2 = L4_2(L5_2)
        L4_1 = L4_2
        L4_2 = L36_1
        L5_2 = A0_2
        return L4_2(L5_2)
      end
    end
  end
  L2_2 = L17_1
  L3_2 = GetDefaultPettyCrimeSettings
  L3_2, L4_2, L5_2 = L3_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L4_1 = L2_2
  L2_2 = L36_1
  L3_2 = A0_2
  return L2_2(L3_2)
end
getPettyCrimeSettings = L39_1
L39_1 = Config
L39_1 = L39_1.FrameworkFunctions
L39_1 = L39_1.CreateCallback
L40_1 = "Pug:server:IsPettyCrimeOnCooldown"
function L41_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = L8_1
  L4_2 = A0_2
  L5_2 = A2_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  L5_2 = A1_2
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2(L6_2, L7_2)
end
L39_1(L40_1, L41_1)
L39_1 = Config
L39_1 = L39_1.FrameworkFunctions
L39_1 = L39_1.CreateCallback
L40_1 = "Pug:server:TryLockPettyCrimeObject"
function L41_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  L4_2 = tostring
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  A2_2 = L4_2
  L4_2 = math
  L4_2 = L4_2.max
  L5_2 = 30
  L6_2 = math
  L6_2 = L6_2.floor
  L7_2 = tonumber
  L8_2 = A3_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 180
  end
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  A3_2 = L4_2
  if "" == A2_2 then
    L4_2 = A1_2
    L5_2 = false
    L6_2 = "invalid"
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = L10_1
  L5_2 = A0_2
  L6_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L5_2 = A1_2
    L6_2 = false
    L7_2 = "cooldown"
    L5_2(L6_2, L7_2)
    return
  end
  L5_2 = L9_1
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = A1_2
    L7_2 = false
    L8_2 = L5_2.owner
    if L8_2 == A0_2 then
      L8_2 = "owned"
      if L8_2 then
        goto lbl_53
      end
    end
    L8_2 = "busy"
    ::lbl_53::
    L6_2(L7_2, L8_2)
    return
  end
  L6_2 = L1_1
  L7_2 = {}
  L7_2.owner = A0_2
  L8_2 = os
  L8_2 = L8_2.time
  L8_2 = L8_2()
  L8_2 = L8_2 + A3_2
  L7_2.expiresAt = L8_2
  L6_2[A2_2] = L7_2
  L6_2 = A1_2
  L7_2 = true
  L8_2 = "locked"
  L6_2(L7_2, L8_2)
end
L39_1(L40_1, L41_1)
L39_1 = RegisterNetEvent
L40_1 = "Pug:server:SetPettyCrimeCooldown"
function L41_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L6_1
  L3_2 = source
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
L39_1(L40_1, L41_1)
L39_1 = RegisterNetEvent
L40_1 = "Pug:server:ReleasePettyCrimeObjectLock"
function L41_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = source
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  if "" == A0_2 then
    return
  end
  L2_2 = L9_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L2_2.owner
    if L3_2 ~= L1_2 then
      return
    end
  end
  L3_2 = L1_1
  L3_2[A0_2] = nil
end
L39_1(L40_1, L41_1)
L39_1 = RegisterNetEvent
L40_1 = "Pug:server:CompletePettyCrimeObjectLock"
function L41_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = source
  L3_2 = tostring
  L4_2 = A0_2 or L4_2
  if not A0_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  A0_2 = L3_2
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  A1_2 = L3_2 or A1_2
  if not L3_2 then
    A1_2 = 0
  end
  if "" == A0_2 then
    return
  end
  L3_2 = L9_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = L3_2.owner
    if L4_2 == L2_2 then
      goto lbl_26
    end
  end
  do return end
  ::lbl_26::
  L4_2 = L1_1
  L4_2[A0_2] = nil
  if A1_2 <= 0 then
    return
  end
  L4_2 = Config
  L4_2 = L4_2.PettyCrimeGlobalCooldowns
  if false ~= L4_2 then
    L4_2 = TriggerEvent
    L5_2 = "Pug:server:SetRobberiesOnCooldown"
    L6_2 = {}
    L7_2 = A0_2
    L6_2[1] = L7_2
    L7_2 = A1_2
    L4_2(L5_2, L6_2, L7_2)
  else
    L4_2 = L6_1
    L5_2 = L2_2
    L6_2 = A0_2
    L7_2 = A1_2
    L4_2(L5_2, L6_2, L7_2)
  end
end
L39_1(L40_1, L41_1)
L39_1 = AddEventHandler
L40_1 = "playerDropped"
function L41_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = source
  L1_2 = L0_1
  L1_2[L0_2] = nil
  L1_2 = L3_1
  L1_2[L0_2] = nil
  L1_2 = pairs
  L2_2 = L1_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if L6_2 then
      L7_2 = L6_2.owner
      if L7_2 == L0_2 then
        L7_2 = L1_1
        L7_2[L5_2] = nil
      end
    end
  end
end
L39_1(L40_1, L41_1)
L39_1 = Config
L39_1 = L39_1.FrameworkFunctions
L39_1 = L39_1.CreateCallback
L40_1 = "Pug:server:GetPettyCrimePresetFiles"
function L41_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L4_2 = L28_1
  L4_2 = L4_2()
  L3_2.files = L4_2
  L2_2(L3_2)
end
L39_1(L40_1, L41_1)
L39_1 = Config
L39_1 = L39_1.FrameworkFunctions
L39_1 = L39_1.CreateCallback
L40_1 = "Pug:server:SavePettyCrimePreset"
function L41_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = A0_2
  L5_2 = L20_1
  L6_2 = A2_2
  L5_2, L6_2 = L5_2(L6_2)
  L7_2 = L17_1
  L8_2 = A3_2
  L7_2 = L7_2(L8_2)
  L8_2 = {}
  L8_2.type = "petty_crime_preset"
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
    L11_2.error = "Failed to encode petty crime preset data."
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
    L16_2 = "PettyPresetSaveFailed"
    L15_2 = L15_2(L16_2)
    L16_2 = "error"
    L12_2(L13_2, L14_2, L15_2, L16_2)
    return
  end
  L12_2 = L27_1
  L13_2 = L6_2
  L12_2(L13_2)
  L12_2 = TriggerClientEvent
  L13_2 = "Pug:client:ShowHeistNotify"
  L14_2 = L4_2
  L15_2 = Config
  L15_2 = L15_2.T
  L16_2 = "PettyPresetSaved"
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
L39_1(L40_1, L41_1)
L39_1 = Config
L39_1 = L39_1.FrameworkFunctions
L39_1 = L39_1.CreateCallback
L40_1 = "Pug:server:LoadPettyCrimePreset"
function L41_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = A0_2
  L4_2 = L20_1
  L5_2 = A2_2
  L4_2, L5_2 = L4_2(L5_2)
  L6_2 = LoadResourceFile
  L7_2 = GetCurrentResourceName
  L7_2 = L7_2()
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L29_1
  L8_2 = L6_2
  L9_2 = L4_2
  L7_2, L8_2 = L7_2(L8_2, L9_2)
  if not L7_2 then
    L9_2 = A1_2
    L10_2 = {}
    L10_2.success = false
    L11_2 = L8_2 or L11_2
    if not L8_2 then
      L11_2 = "Failed to load petty crime preset."
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
      L13_2 = "PettyPresetLoadFailed"
      L12_2 = L12_2(L13_2)
    end
    L13_2 = "error"
    L9_2(L10_2, L11_2, L12_2, L13_2)
    return
  end
  L9_2 = L27_1
  L10_2 = L5_2
  L9_2(L10_2)
  L9_2 = TriggerClientEvent
  L10_2 = "Pug:client:ShowHeistNotify"
  L11_2 = L3_2
  L12_2 = Config
  L12_2 = L12_2.T
  L13_2 = "PettyPresetLoaded"
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
L39_1(L40_1, L41_1)
L39_1 = RegisterNetEvent
L40_1 = "Pug:savePettyCrimeData"
function L41_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = source
  L2_2 = L17_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L4_1 = L2_2
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = MySQL
  L4_2 = L4_2.query
  L5_2 = "INSERT INTO pug_pettycrimes (id, settings) VALUES (1, @settings) ON DUPLICATE KEY UPDATE settings = @settings"
  L6_2 = {}
  L6_2["@settings"] = L3_2
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    if A0_3 then
      L1_3 = Config
      L1_3 = L1_3.PettyCrimeGlobalCooldowns
      if false ~= L1_3 then
        L1_3 = L33_1
        L2_3 = L2_1
        L3_3 = L31_1
        L3_3 = L3_3()
        if not L3_3 then
          L3_3 = {}
        end
        L1_3(L2_3, L3_3)
      else
        L1_3 = pairs
        L2_3 = L3_1
        L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
        for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
          L7_3 = L33_1
          L8_3 = L6_3
          L9_3 = L31_1
          L9_3 = L9_3()
          if not L9_3 then
            L9_3 = {}
          end
          L7_3(L8_3, L9_3)
        end
      end
      L1_3 = ipairs
      L2_3 = GetPlayers
      L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L2_3()
      L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
      for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
        L7_3 = tonumber
        L8_3 = L6_3
        L7_3 = L7_3(L8_3)
        if L7_3 then
          L8_3 = TriggerClientEvent
          L9_3 = "Pug:client:UpdatePettyCrimeData"
          L10_3 = L7_3
          L11_3 = L36_1
          L12_3 = L7_3
          L11_3, L12_3 = L11_3(L12_3)
          L8_3(L9_3, L10_3, L11_3, L12_3)
        end
      end
      L1_3 = Wait
      L2_3 = 50
      L1_3(L2_3)
      L1_3 = TriggerClientEvent
      L2_3 = "Pug:client:ShowHeistNotify"
      L3_3 = L1_2
      L4_3 = Config
      L4_3 = L4_3.T
      L5_3 = "PettyCrimeDataSaved"
      L4_3 = L4_3(L5_3)
      L5_3 = "success"
      L1_3(L2_3, L3_3, L4_3, L5_3)
    else
      L1_3 = TriggerClientEvent
      L2_3 = "Pug:client:ShowHeistNotify"
      L3_3 = L1_2
      L4_3 = Config
      L4_3 = L4_3.T
      L5_3 = "PettyCrimeDataSaveFailed"
      L4_3 = L4_3(L5_3)
      L5_3 = "error"
      L1_3(L2_3, L3_3, L4_3, L5_3)
    end
  end
  L4_2(L5_2, L6_2, L7_2)
end
L39_1(L40_1, L41_1)
L39_1 = RegisterNetEvent
L40_1 = "Pug:server:MarkPorchPirateLocationTaken"
function L41_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = source
  L3_2 = tostring
  L4_2 = A0_2 or L4_2
  if not A0_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  if "" == L3_2 then
    return
  end
  L4_2 = L31_1
  L4_2 = L4_2()
  if L4_2 then
    L5_2 = L4_2.enabled
    if false ~= L5_2 then
      goto lbl_18
    end
  end
  do return end
  ::lbl_18::
  L5_2 = tonumber
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  A1_2 = L5_2 or A1_2
  if not L5_2 then
    A1_2 = 0
  end
  if A1_2 > 0 then
    L5_2 = os
    L5_2 = L5_2.time
    L5_2 = L5_2()
    L6_2 = A1_2 * 60
    L5_2 = L5_2 + L6_2
    if L5_2 then
      goto lbl_36
    end
  end
  L5_2 = nil
  ::lbl_36::
  L6_2 = Config
  L6_2 = L6_2.PettyCrimeGlobalCooldowns
  if false ~= L6_2 then
    L6_2 = L33_1
    L7_2 = L2_1
    L8_2 = L4_2
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = {}
    L8_2 = ipairs
    L9_2 = L6_2.activeLocationIds
    if not L9_2 then
      L9_2 = {}
    end
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = tostring
      L15_2 = L13_2
      L14_2 = L14_2(L15_2)
      if L14_2 ~= L3_2 then
        L14_2 = #L7_2
        L14_2 = L14_2 + 1
        L15_2 = tostring
        L16_2 = L13_2
        L15_2 = L15_2(L16_2)
        L7_2[L14_2] = L15_2
      end
    end
    L6_2.activeLocationIds = L7_2
    if L5_2 then
      L8_2 = L6_2.cooldowns
      L8_2[L3_2] = L5_2
    else
      L8_2 = L6_2.cooldowns
      L8_2[L3_2] = nil
    end
    L8_2 = L33_1
    L9_2 = L6_2
    L10_2 = L4_2
    L8_2(L9_2, L10_2)
    L8_2 = TriggerClientEvent
    L9_2 = "Pug:client:SyncPorchPirateActiveLocations"
    L10_2 = -1
    L11_2 = L30_1
    L12_2 = L6_2.activeLocationIds
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L11_2(L12_2)
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  else
    L6_2 = L34_1
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      return
    end
    L7_2 = L33_1
    L8_2 = L6_2
    L9_2 = L4_2
    L7_2(L8_2, L9_2)
    L7_2 = {}
    L8_2 = ipairs
    L9_2 = L6_2.activeLocationIds
    if not L9_2 then
      L9_2 = {}
    end
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = tostring
      L15_2 = L13_2
      L14_2 = L14_2(L15_2)
      if L14_2 ~= L3_2 then
        L14_2 = #L7_2
        L14_2 = L14_2 + 1
        L15_2 = tostring
        L16_2 = L13_2
        L15_2 = L15_2(L16_2)
        L7_2[L14_2] = L15_2
      end
    end
    L6_2.activeLocationIds = L7_2
    if L5_2 then
      L8_2 = L6_2.cooldowns
      L8_2[L3_2] = L5_2
    else
      L8_2 = L6_2.cooldowns
      L8_2[L3_2] = nil
    end
    L8_2 = L33_1
    L9_2 = L6_2
    L10_2 = L4_2
    L8_2(L9_2, L10_2)
    L8_2 = TriggerClientEvent
    L9_2 = "Pug:client:SyncPorchPirateActiveLocations"
    L10_2 = L2_2
    L11_2 = L30_1
    L12_2 = L6_2.activeLocationIds
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L11_2(L12_2)
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  end
end
L39_1(L40_1, L41_1)
L39_1 = CreateThread
function L40_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  while true do
    L0_2 = Wait
    L1_2 = 5000
    L0_2(L1_2)
    L0_2 = L31_1
    L0_2 = L0_2()
    if L0_2 then
      L1_2 = L0_2.enabled
      if false == L1_2 then
      else
        L1_2 = Config
        L1_2 = L1_2.PettyCrimeGlobalCooldowns
        if false ~= L1_2 then
          L1_2 = json
          L1_2 = L1_2.encode
          L2_2 = L2_1.activeLocationIds
          if not L2_2 then
            L2_2 = {}
          end
          L1_2 = L1_2(L2_2)
          L2_2 = L33_1
          L3_2 = L2_1
          L4_2 = L0_2
          L2_2(L3_2, L4_2)
          L2_2 = json
          L2_2 = L2_2.encode
          L3_2 = L2_1.activeLocationIds
          if not L3_2 then
            L3_2 = {}
          end
          L2_2 = L2_2(L3_2)
          if L1_2 ~= L2_2 then
            L2_2 = TriggerClientEvent
            L3_2 = "Pug:client:SyncPorchPirateActiveLocations"
            L4_2 = -1
            L5_2 = L30_1
            L6_2 = L2_1.activeLocationIds
            L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2(L6_2)
            L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
          end
        else
          L1_2 = ipairs
          L2_2 = GetPlayers
          L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L2_2()
          L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
          for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
            L7_2 = tonumber
            L8_2 = L6_2
            L7_2 = L7_2(L8_2)
            if L7_2 then
              L8_2 = L34_1
              L9_2 = L7_2
              L8_2 = L8_2(L9_2)
              if L8_2 then
                goto lbl_62
              end
            end
            L8_2 = nil
            ::lbl_62::
            if L8_2 then
              L9_2 = json
              L9_2 = L9_2.encode
              L10_2 = L8_2.activeLocationIds
              if not L10_2 then
                L10_2 = {}
              end
              L9_2 = L9_2(L10_2)
              L10_2 = L33_1
              L11_2 = L8_2
              L12_2 = L0_2
              L10_2(L11_2, L12_2)
              L10_2 = json
              L10_2 = L10_2.encode
              L11_2 = L8_2.activeLocationIds
              if not L11_2 then
                L11_2 = {}
              end
              L10_2 = L10_2(L11_2)
              if L9_2 ~= L10_2 then
                L10_2 = TriggerClientEvent
                L11_2 = "Pug:client:SyncPorchPirateActiveLocations"
                L12_2 = L7_2
                L13_2 = L30_1
                L14_2 = L8_2.activeLocationIds
                L13_2, L14_2 = L13_2(L14_2)
                L10_2(L11_2, L12_2, L13_2, L14_2)
              end
            end
          end
        end
      end
    end
  end
end
L39_1(L40_1)
