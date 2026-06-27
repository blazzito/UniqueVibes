local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1
L0_1 = "config/robbery-action-logs.json"
L1_1 = nil
L2_1 = 150
L3_1 = 1000
L4_1 = 15
L5_1 = 50
L6_1 = 240
L7_1 = 1048576
L8_1 = 1000
L9_1 = nil
L10_1 = false
L11_1 = {}
L11_1.step_started = true
L11_1.step_completed = true
L11_1.step_reward_paid = true
L11_1.step_reward_item = true
L11_1.step_rewarded = true
function L12_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Config
  if L0_2 then
    L0_2 = tonumber
    L1_2 = Config
    L1_2 = L1_2.RobberyActionLogMaxEntries
    L0_2 = L0_2(L1_2)
    if L0_2 then
      goto lbl_11
    end
  end
  L0_2 = L2_1
  ::lbl_11::
  L1_2 = math
  L1_2 = L1_2.floor
  L2_2 = L0_2 or L2_2
  if not L0_2 then
    L2_2 = L2_1
  end
  L1_2 = L1_2(L2_2)
  L0_2 = L1_2
  if L0_2 < 0 then
    L1_2 = L2_1
    return L1_2
  end
  L1_2 = math
  L1_2 = L1_2.min
  L2_2 = L0_2
  L3_2 = L3_1
  return L1_2(L2_2, L3_2)
end
function L13_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = Config
    if L1_2 then
      L1_2 = tonumber
      L2_2 = Config
      L2_2 = L2_2.RobberyActionLogPageSize
      L1_2 = L1_2(L2_2)
      if L1_2 then
        goto lbl_16
      end
    end
    L1_2 = L4_1
  end
  ::lbl_16::
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = L1_2 or L3_2
  if not L1_2 then
    L3_2 = L4_1
  end
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  if L1_2 <= 0 then
    L2_2 = L4_1
    return L2_2
  end
  L2_2 = math
  L2_2 = L2_2.min
  L3_2 = L1_2
  L4_2 = L5_1
  return L2_2(L3_2, L4_2)
end
function L14_1(A0_2)
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
function L15_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = {}
  L3_2 = {}
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = L14_1
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    A0_3 = L1_3
    if "" ~= A0_3 then
      L1_3 = L3_2
      L1_3 = L1_3[A0_3]
      if not L1_3 then
        goto lbl_12
      end
    end
    do return end
    ::lbl_12::
    L1_3 = L3_2
    L1_3[A0_3] = true
    L1_3 = L2_2
    L1_3 = #L1_3
    L2_3 = L1_3 + 1
    L1_3 = L2_2
    L1_3[L2_3] = A0_3
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
  local L1_2, L2_2, L3_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2 or A0_2
  if not L1_2 then
    L1_2 = os
    L1_2 = L1_2.time
    L1_2 = L1_2()
    A0_2 = L1_2
  end
  L1_2 = os
  L1_2 = L1_2.date
  L2_2 = "%Y-%m-%d %H:%M:%S"
  L3_2 = A0_2
  return L1_2(L2_2, L3_2)
end
function L17_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L1_2.started = false
  L1_2.completed = false
  L1_2.rewarded = false
  L2_2 = ipairs
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if "step_started" == L7_2 then
      L1_2.started = true
    elseif "step_completed" == L7_2 then
      L1_2.completed = true
    elseif "step_reward_paid" == L7_2 or "step_reward_item" == L7_2 or "step_rewarded" == L7_2 then
      L1_2.rewarded = true
    end
  end
  return L1_2
end
function L18_1(A0_2)
  local L1_2, L2_2
  L1_2 = L17_1
  L2_2 = A0_2.mergedActions
  if not L2_2 then
    L2_2 = {}
  end
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2.rewarded
  if L2_2 then
    A0_2.action = "step_rewarded"
    A0_2.actionLabel = "Step Rewarded"
    L2_2 = L1_2.started
    if L2_2 then
      L2_2 = L1_2.completed
      if L2_2 then
        A0_2.details = "Began interacting with a robbery step, completed it, and received the step rewards."
    end
    else
      L2_2 = L1_2.completed
      if L2_2 then
        A0_2.details = "Completed a robbery step and received the step rewards."
      else
        A0_2.details = "Received the step rewards."
      end
    end
    return
  end
  L2_2 = L1_2.completed
  if L2_2 then
    A0_2.action = "step_completed"
    A0_2.actionLabel = "Step Completed"
    L2_2 = L1_2.started
    if L2_2 then
      L2_2 = "Began interacting with a robbery step and completed it."
      if L2_2 then
        goto lbl_40
      end
    end
    L2_2 = "Completed a robbery step."
    ::lbl_40::
    A0_2.details = L2_2
    return
  end
  A0_2.action = "step_started"
  A0_2.actionLabel = "Step Started"
  A0_2.details = "Began interacting with a robbery step."
end
function L19_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = tonumber
  L3_2 = A0_2.timestamp
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = os
    L2_2 = L2_2.time
    L2_2 = L2_2()
  end
  L3_2 = L14_1
  L4_2 = A0_2.robberyName
  L3_2 = L3_2(L4_2)
  L4_2 = L14_1
  L5_2 = A0_2.action
  L4_2 = L4_2(L5_2)
  L5_2 = L14_1
  L6_2 = A0_2.actionLabel
  L5_2 = L5_2(L6_2)
  L6_2 = {}
  if "" == L3_2 then
    L3_2 = "Unknown Robbery"
  end
  if "" == L4_2 then
    L4_2 = "event"
  end
  if "" == L5_2 then
    L8_2 = L4_2
    L7_2 = L4_2.gsub
    L9_2 = "_"
    L10_2 = " "
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L5_2 = L7_2
    L8_2 = L5_2
    L7_2 = L5_2.gsub
    L9_2 = "(%a)([%w_]*)"
    function L10_2(A0_3, A1_3)
      local L2_3, L3_3, L4_3
      L2_3 = string
      L2_3 = L2_3.upper
      L3_3 = A0_3
      L2_3 = L2_3(L3_3)
      L3_3 = string
      L3_3 = L3_3.lower
      L4_3 = A1_3
      L3_3 = L3_3(L4_3)
      L2_3 = L2_3 .. L3_3
      return L2_3
    end
    L7_2 = L7_2(L8_2, L9_2, L10_2)
    L5_2 = L7_2
  end
  L7_2 = type
  L8_2 = A0_2.rewardSummaries
  L7_2 = L7_2(L8_2)
  if "table" == L7_2 then
    L7_2 = A0_2.rewardSummaries
    L7_2 = #L7_2
    if L7_2 > 0 then
      L7_2 = L15_1
      L8_2 = A0_2.rewardSummaries
      L9_2 = nil
      L7_2 = L7_2(L8_2, L9_2)
      L6_2 = L7_2
  end
  else
    L7_2 = L15_1
    L8_2 = nil
    L9_2 = A0_2.rewardSummary
    L7_2 = L7_2(L8_2, L9_2)
    L6_2 = L7_2
  end
  L7_2 = {}
  L8_2 = L14_1
  L9_2 = A0_2.id
  L8_2 = L8_2(L9_2)
  L7_2.id = L8_2
  L7_2.robberyName = L3_2
  L7_2.action = L4_2
  L7_2.actionLabel = L5_2
  L8_2 = L14_1
  L9_2 = A0_2.playerName
  L8_2 = L8_2(L9_2)
  L7_2.playerName = L8_2
  L8_2 = L14_1
  L9_2 = A0_2.citizenId
  L8_2 = L8_2(L9_2)
  L7_2.citizenId = L8_2
  L8_2 = tonumber
  L9_2 = A0_2.source
  L8_2 = L8_2(L9_2)
  L7_2.source = L8_2
  L8_2 = tonumber
  L9_2 = A0_2.stepNumber
  L8_2 = L8_2(L9_2)
  L7_2.stepNumber = L8_2
  L8_2 = L14_1
  L9_2 = A0_2.stepName
  L8_2 = L8_2(L9_2)
  L7_2.stepName = L8_2
  L8_2 = math
  L8_2 = L8_2.floor
  L9_2 = tonumber
  L10_2 = A0_2.rewardAmount
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 0
  end
  L8_2 = L8_2(L9_2)
  L7_2.rewardAmount = L8_2
  L8_2 = L14_1
  L9_2 = A0_2.rewardType
  L8_2 = L8_2(L9_2)
  L7_2.rewardType = L8_2
  L8_2 = L14_1
  L9_2 = A0_2.rewardSummary
  L8_2 = L8_2(L9_2)
  L7_2.rewardSummary = L8_2
  L8_2 = L14_1
  L9_2 = A0_2.details
  L8_2 = L8_2(L9_2)
  L7_2.details = L8_2
  L7_2.timestamp = L2_2
  L8_2 = L14_1
  L9_2 = A0_2.timeLabel
  L8_2 = L8_2(L9_2)
  L7_2.timeLabel = L8_2
  L8_2 = L15_1
  L9_2 = A0_2.mergedActions
  L10_2 = L4_2
  L8_2 = L8_2(L9_2, L10_2)
  L7_2.mergedActions = L8_2
  L7_2.rewardSummaries = L6_2
  L8_2 = tonumber
  L9_2 = A0_2.mergedWindowStartedAt
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = L2_2
  end
  L7_2.mergedWindowStartedAt = L8_2
  L8_2 = L7_2.id
  if "" == L8_2 then
    L8_2 = "%s_%s_%s"
    L9_2 = L8_2
    L8_2 = L8_2.format
    L10_2 = L2_2
    L11_2 = L7_2.source
    if not L11_2 then
      L11_2 = 0
    end
    L12_2 = tonumber
    L13_2 = A1_2
    L12_2 = L12_2(L13_2)
    if not L12_2 then
      L12_2 = 0
    end
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    L7_2.id = L8_2
  end
  L8_2 = L7_2.timeLabel
  if "" == L8_2 then
    L8_2 = L16_1
    L9_2 = L2_2
    L8_2 = L8_2(L9_2)
    L7_2.timeLabel = L8_2
  end
  L8_2 = L7_2.rewardSummaries
  L8_2 = #L8_2
  if L8_2 > 0 then
    L8_2 = table
    L8_2 = L8_2.concat
    L9_2 = L7_2.rewardSummaries
    L10_2 = " | "
    L8_2 = L8_2(L9_2, L10_2)
    L7_2.rewardSummary = L8_2
  end
  L9_2 = L7_2.action
  L8_2 = L11_1
  L8_2 = L8_2[L9_2]
  if L8_2 then
    L8_2 = L7_2.stepNumber
    if not L8_2 then
      L8_2 = 0
    end
    if L8_2 > 0 then
      L8_2 = L18_1
      L9_2 = L7_2
      L8_2(L9_2)
    end
  end
  return L7_2
end
function L20_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.timestamp
  if not L2_2 then
    L2_2 = 0
  end
  L3_2 = A1_2.timestamp
  if not L3_2 then
    L3_2 = 0
  end
  if L2_2 == L3_2 then
    L2_2 = tostring
    L3_2 = A0_2.id
    if not L3_2 then
      L3_2 = ""
    end
    L2_2 = L2_2(L3_2)
    L3_2 = tostring
    L4_2 = A1_2.id
    if not L4_2 then
      L4_2 = ""
    end
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2 < L3_2
    return L2_2
  end
  L2_2 = A0_2.timestamp
  if not L2_2 then
    L2_2 = 0
  end
  L3_2 = A1_2.timestamp
  if not L3_2 then
    L3_2 = 0
  end
  L2_2 = L2_2 < L3_2
  return L2_2
end
function L21_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.timestamp
  if not L2_2 then
    L2_2 = 0
  end
  L3_2 = A1_2.timestamp
  if not L3_2 then
    L3_2 = 0
  end
  if L2_2 == L3_2 then
    L2_2 = tostring
    L3_2 = A0_2.id
    if not L3_2 then
      L3_2 = ""
    end
    L2_2 = L2_2(L3_2)
    L3_2 = tostring
    L4_2 = A1_2.id
    if not L4_2 then
      L4_2 = ""
    end
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2 > L3_2
    return L2_2
  end
  L2_2 = A0_2.timestamp
  if not L2_2 then
    L2_2 = 0
  end
  L3_2 = A1_2.timestamp
  if not L3_2 then
    L3_2 = 0
  end
  L2_2 = L2_2 > L3_2
  return L2_2
end
function L22_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = tonumber
  L2_2 = A0_2.stepNumber
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = 0
  end
  if L1_2 <= 0 then
    L2_2 = false
    return L2_2
  end
  L2_2 = A0_2.mergedActions
  if not L2_2 then
    L2_2 = {}
    L3_2 = A0_2.action
    L2_2[1] = L3_2
  end
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L11_1
    L9_2 = L9_2[L8_2]
    if not L9_2 then
      L9_2 = false
      return L9_2
    end
  end
  L3_2 = true
  return L3_2
end
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L14_1
  L3_2 = A0_2.robberyName
  L2_2 = L2_2(L3_2)
  L3_2 = L14_1
  L4_2 = A1_2.robberyName
  L3_2 = L3_2(L4_2)
  if L2_2 ~= L3_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = tonumber
  L3_2 = A0_2.stepNumber
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A1_2.stepNumber
  L3_2 = L3_2(L4_2)
  if L2_2 ~= L3_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = L14_1
  L3_2 = A0_2.citizenId
  L2_2 = L2_2(L3_2)
  L3_2 = L14_1
  L4_2 = A1_2.citizenId
  L3_2 = L3_2(L4_2)
  if "" ~= L2_2 and "" ~= L3_2 then
    L4_2 = L2_2 == L3_2
    return L4_2
  end
  L4_2 = tonumber
  L5_2 = A0_2.source
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = A1_2.source
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2 == L5_2
  return L4_2
end
function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = L22_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = #A0_2
  L3_2 = 1
  L4_2 = -1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = A0_2[L5_2]
    L7_2 = L22_1
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = L23_1
      L8_2 = L6_2
      L9_2 = A1_2
      L7_2 = L7_2(L8_2, L9_2)
    end
    if L7_2 then
      L8_2 = math
      L8_2 = L8_2.min
      L9_2 = tonumber
      L10_2 = L6_2.mergedWindowStartedAt
      L9_2 = L9_2(L10_2)
      if not L9_2 then
        L9_2 = L6_2.timestamp
        if not L9_2 then
          L9_2 = 0
        end
      end
      L10_2 = tonumber
      L11_2 = L6_2.timestamp
      L10_2 = L10_2(L11_2)
      if not L10_2 then
        L10_2 = 0
      end
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = A1_2.timestamp
      if not L9_2 then
        L9_2 = 0
      end
      L9_2 = L9_2 - L8_2
      L10_2 = L6_1
      L7_2 = L9_2 <= L10_2
    end
    if L7_2 then
      L8_2 = L15_1
      L9_2 = L6_2.mergedActions
      L10_2 = nil
      L8_2 = L8_2(L9_2, L10_2)
      L6_2.mergedActions = L8_2
      L8_2 = ipairs
      L9_2 = A1_2.mergedActions
      if not L9_2 then
        L9_2 = {}
      end
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        L14_2 = L15_1
        L15_2 = L6_2.mergedActions
        L16_2 = L13_2
        L14_2 = L14_2(L15_2, L16_2)
        L6_2.mergedActions = L14_2
      end
      L8_2 = L15_1
      L9_2 = L6_2.rewardSummaries
      L10_2 = nil
      L8_2 = L8_2(L9_2, L10_2)
      L6_2.rewardSummaries = L8_2
      L8_2 = ipairs
      L9_2 = A1_2.rewardSummaries
      if not L9_2 then
        L9_2 = {}
      end
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        L14_2 = L6_2.rewardSummaries
        L15_2 = L6_2.rewardSummaries
        L15_2 = #L15_2
        L15_2 = L15_2 + 1
        L14_2[L15_2] = L13_2
      end
      L8_2 = L15_1
      L9_2 = L6_2.rewardSummaries
      L10_2 = nil
      L8_2 = L8_2(L9_2, L10_2)
      L6_2.rewardSummaries = L8_2
      L8_2 = L6_2.rewardSummaries
      L8_2 = #L8_2
      if L8_2 > 0 then
        L8_2 = table
        L8_2 = L8_2.concat
        L9_2 = L6_2.rewardSummaries
        L10_2 = " | "
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          goto lbl_115
        end
      end
      L8_2 = ""
      ::lbl_115::
      L6_2.rewardSummary = L8_2
      L8_2 = tonumber
      L9_2 = A1_2.rewardAmount
      L8_2 = L8_2(L9_2)
      if L8_2 then
        L8_2 = tonumber
        L9_2 = A1_2.rewardAmount
        L8_2 = L8_2(L9_2)
        if L8_2 > 0 then
          L8_2 = math
          L8_2 = L8_2.floor
          L9_2 = tonumber
          L10_2 = L6_2.rewardAmount
          L9_2 = L9_2(L10_2)
          if not L9_2 then
            L9_2 = 0
          end
          L10_2 = tonumber
          L11_2 = A1_2.rewardAmount
          L10_2 = L10_2(L11_2)
          L9_2 = L9_2 + L10_2
          L8_2 = L8_2(L9_2)
          L6_2.rewardAmount = L8_2
        end
      end
      L8_2 = L14_1
      L9_2 = A1_2.rewardType
      L8_2 = L8_2(L9_2)
      L9_2 = L14_1
      L10_2 = L6_2.rewardType
      L9_2 = L9_2(L10_2)
      if "" == L9_2 then
        L6_2.rewardType = L8_2
      elseif "" ~= L8_2 and L8_2 ~= L9_2 then
        L6_2.rewardType = "mixed"
      end
      L10_2 = L14_1
      L11_2 = L6_2.stepName
      L10_2 = L10_2(L11_2)
      if "" == L10_2 then
        L10_2 = L14_1
        L11_2 = A1_2.stepName
        L10_2 = L10_2(L11_2)
        L6_2.stepName = L10_2
      end
      L10_2 = math
      L10_2 = L10_2.max
      L11_2 = tonumber
      L12_2 = L6_2.timestamp
      L11_2 = L11_2(L12_2)
      if not L11_2 then
        L11_2 = 0
      end
      L12_2 = tonumber
      L13_2 = A1_2.timestamp
      L12_2 = L12_2(L13_2)
      if not L12_2 then
        L12_2 = 0
      end
      L10_2 = L10_2(L11_2, L12_2)
      L6_2.timestamp = L10_2
      L10_2 = L16_1
      L11_2 = L6_2.timestamp
      L10_2 = L10_2(L11_2)
      L6_2.timeLabel = L10_2
      L10_2 = math
      L10_2 = L10_2.min
      L11_2 = tonumber
      L12_2 = L6_2.mergedWindowStartedAt
      L11_2 = L11_2(L12_2)
      if not L11_2 then
        L11_2 = L6_2.timestamp
      end
      L12_2 = tonumber
      L13_2 = A1_2.mergedWindowStartedAt
      L12_2 = L12_2(L13_2)
      if not L12_2 then
        L12_2 = A1_2.timestamp
        if not L12_2 then
          L12_2 = L6_2.timestamp
        end
      end
      L10_2 = L10_2(L11_2, L12_2)
      L6_2.mergedWindowStartedAt = L10_2
      L10_2 = L18_1
      L11_2 = L6_2
      L10_2(L11_2)
      L10_2 = true
      return L10_2
    end
  end
  L2_2 = false
  return L2_2
end
function L25_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = L12_1
  L2_2 = L2_2()
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "table" ~= L3_2 then
    return L1_2
  end
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = #L1_2
    L9_2 = L9_2 + 1
    L10_2 = L19_1
    L11_2 = L8_2
    L12_2 = L7_2
    L10_2 = L10_2(L11_2, L12_2)
    L1_2[L9_2] = L10_2
  end
  L3_2 = table
  L3_2 = L3_2.sort
  L4_2 = L1_2
  L5_2 = L20_1
  L3_2(L4_2, L5_2)
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = L1_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L24_1
    L11_2 = L3_2
    L12_2 = L9_2
    L10_2 = L10_2(L11_2, L12_2)
    if not L10_2 then
      L10_2 = #L3_2
      L10_2 = L10_2 + 1
      L3_2[L10_2] = L9_2
    end
  end
  L4_2 = table
  L4_2 = L4_2.sort
  L5_2 = L3_2
  L6_2 = L21_1
  L4_2(L5_2, L6_2)
  while true do
    L4_2 = #L3_2
    if not (L2_2 < L4_2) then
      break
    end
    L4_2 = table
    L4_2 = L4_2.remove
    L5_2 = L3_2
    L4_2(L5_2)
  end
  return L3_2
end
function L26_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = L12_1
  L1_2 = L1_2()
  while true do
    L2_2 = #A0_2
    if not (L1_2 < L2_2) then
      break
    end
    L2_2 = table
    L2_2 = L2_2.remove
    L3_2 = A0_2
    L2_2(L3_2)
  end
  L2_2 = json
  L2_2 = L2_2.encode
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2 = L2_2(L3_2)
  L3_2 = SaveResourceFile
  L4_2 = GetCurrentResourceName
  L4_2 = L4_2()
  L5_2 = L0_1
  L6_2 = L2_2
  L7_2 = -1
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = true == L3_2
  return L4_2
end
function L27_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = type
  L1_2 = GetResourcePath
  L0_2 = L0_2(L1_2)
  if "function" == L0_2 then
    L0_2 = type
    L1_2 = io
    L0_2 = L0_2(L1_2)
    if "table" == L0_2 then
      L0_2 = type
      L1_2 = io
      L1_2 = L1_2.open
      L0_2 = L0_2(L1_2)
      if "function" == L0_2 then
        goto lbl_19
      end
    end
  end
  L0_2 = nil
  do return L0_2 end
  ::lbl_19::
  L0_2 = GetResourcePath
  L1_2 = GetCurrentResourceName
  L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  if not L0_2 or "" == L0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = io
  L1_2 = L1_2.open
  L2_2 = "%s/%s"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = L0_2
  L5_2 = L0_1
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = "rb"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  L3_2 = L1_2
  L2_2 = L1_2.seek
  L4_2 = "end"
  L2_2 = L2_2(L3_2, L4_2)
  L4_2 = L1_2
  L3_2 = L1_2.close
  L3_2(L4_2)
  L3_2 = tonumber
  L4_2 = L2_2
  return L3_2(L4_2)
end
function L28_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L1_1
  if L0_2 then
    L0_2 = L1_1
    return L0_2
  end
  L0_2 = L27_1
  L0_2 = L0_2()
  if L0_2 then
    L1_2 = L7_1
    if L0_2 > L1_2 then
      L1_2 = type
      L2_2 = PrintDebug
      L1_2 = L1_2(L2_2)
      if "function" == L1_2 then
        L1_2 = PrintDebug
        L2_2 = "Robbery action log file is too large (%s bytes). Resetting it to protect server startup."
        L3_2 = L2_2
        L2_2 = L2_2.format
        L4_2 = L0_2
        L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2)
        L1_2(L2_2, L3_2, L4_2, L5_2)
      end
      L1_2 = {}
      L1_1 = L1_2
      L1_2 = L26_1
      L2_2 = L1_1
      L1_2(L2_2)
      L1_2 = L1_1
      return L1_2
    end
  end
  L1_2 = LoadResourceFile
  L2_2 = GetCurrentResourceName
  L2_2 = L2_2()
  L3_2 = L0_1
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 and "" ~= L1_2 then
    L2_2 = pcall
    L3_2 = json
    L3_2 = L3_2.decode
    L4_2 = L1_2
    L2_2, L3_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L4_2 = type
      L5_2 = L3_2
      L4_2 = L4_2(L5_2)
      if "table" == L4_2 then
        L4_2 = L25_1
        L5_2 = L3_2
        L4_2 = L4_2(L5_2)
        L1_1 = L4_2
        L4_2 = L26_1
        L5_2 = L1_1
        L4_2(L5_2)
        L4_2 = L1_1
        return L4_2
      end
    end
  end
  L2_2 = {}
  L1_1 = L2_2
  L2_2 = L1_1
  return L2_2
end
function L29_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L1_2 = L28_1
  L1_2 = L1_2()
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = L14_1
  L3_2 = A0_2.robberyName
  if not L3_2 then
    L3_2 = A0_2.selectedRobbery
  end
  L2_2 = L2_2(L3_2)
  if "__all__" == L2_2 then
    L2_2 = ""
  end
  L3_2 = L13_1
  L4_2 = A0_2.perPage
  if not L4_2 then
    L4_2 = A0_2.pageSize
  end
  L3_2 = L3_2(L4_2)
  L4_2 = math
  L4_2 = L4_2.floor
  L5_2 = tonumber
  L6_2 = A0_2.page
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 1
  end
  L4_2 = L4_2(L5_2)
  if L4_2 < 1 then
    L4_2 = 1
  end
  L5_2 = {}
  L6_2 = {}
  L7_2 = {}
  L8_2 = 0
  L9_2 = 0
  L10_2 = ipairs
  L11_2 = L1_2
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
  for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
    L16_2 = L14_1
    L17_2 = L15_2.robberyName
    L16_2 = L16_2(L17_2)
    if "" ~= L16_2 then
      L17_2 = L6_2[L16_2]
      if not L17_2 then
        L6_2[L16_2] = true
        L17_2 = #L5_2
        L17_2 = L17_2 + 1
        L5_2[L17_2] = L16_2
      end
    end
    if "" == L2_2 or L16_2 == L2_2 then
      L17_2 = #L7_2
      L17_2 = L17_2 + 1
      L7_2[L17_2] = L15_2
      L17_2 = L15_2.action
      if "robbery_completed" == L17_2 then
        L8_2 = L8_2 + 1
      end
      L17_2 = tonumber
      L18_2 = L15_2.rewardAmount
      L17_2 = L17_2(L18_2)
      if not L17_2 then
        L17_2 = 0
      end
      L9_2 = L9_2 + L17_2
    end
  end
  L10_2 = table
  L10_2 = L10_2.sort
  L11_2 = L5_2
  function L12_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = tostring
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L3_3 = L2_3
    L2_3 = L2_3.lower
    L2_3 = L2_3(L3_3)
    L3_3 = tostring
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = L3_3
    L3_3 = L3_3.lower
    L3_3 = L3_3(L4_3)
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  L10_2(L11_2, L12_2)
  L10_2 = #L7_2
  L11_2 = math
  L11_2 = L11_2.max
  L12_2 = 1
  L13_2 = math
  L13_2 = L13_2.ceil
  L14_2 = L10_2 / L3_2
  L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L13_2(L14_2)
  L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  if L4_2 > L11_2 then
    L4_2 = L11_2
  end
  L12_2 = {}
  L13_2 = L4_2 - 1
  L13_2 = L13_2 * L3_2
  L13_2 = L13_2 + 1
  L14_2 = math
  L14_2 = L14_2.min
  L15_2 = L13_2 + L3_2
  L15_2 = L15_2 - 1
  L16_2 = L10_2
  L14_2 = L14_2(L15_2, L16_2)
  L15_2 = L13_2
  L16_2 = L14_2
  L17_2 = 1
  for L18_2 = L15_2, L16_2, L17_2 do
    L19_2 = #L12_2
    L19_2 = L19_2 + 1
    L20_2 = L7_2[L18_2]
    L12_2[L19_2] = L20_2
  end
  L15_2 = L7_2[1]
  L16_2 = {}
  L16_2.entries = L12_2
  L17_2 = L12_1
  L17_2 = L17_2()
  L16_2.maxEntries = L17_2
  L16_2.page = L4_2
  L16_2.perPage = L3_2
  L16_2.totalEntries = L10_2
  L16_2.totalPages = L11_2
  L16_2.robberyNames = L5_2
  L17_2 = L2_2 or L17_2
  if "" == L2_2 or not L2_2 then
    L17_2 = "__all__"
  end
  L16_2.selectedRobbery = L17_2
  L16_2.completedRuns = L8_2
  L17_2 = math
  L17_2 = L17_2.floor
  L18_2 = L9_2
  L17_2 = L17_2(L18_2)
  L16_2.trackedPayout = L17_2
  if L15_2 then
    L17_2 = L15_2.timeLabel
    if L17_2 then
      goto lbl_163
    end
  end
  L17_2 = ""
  ::lbl_163::
  L16_2.latestTimeLabel = L17_2
  return L16_2
end
function L30_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2[1]
    if L1_2 then
      goto lbl_10
    end
  end
  L1_2 = nil
  ::lbl_10::
  L2_2 = {}
  L2_2.refresh = true
  L3_2 = L12_1
  L3_2 = L3_2()
  L2_2.maxEntries = L3_2
  if L1_2 then
    L3_2 = L1_2.id
    if L3_2 then
      goto lbl_22
    end
  end
  L3_2 = nil
  ::lbl_22::
  L2_2.latestEntryId = L3_2
  if L1_2 then
    L3_2 = L1_2.timestamp
    if L3_2 then
      goto lbl_31
    end
  end
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  ::lbl_31::
  L2_2.updatedAt = L3_2
  return L2_2
end
function L31_1(A0_2)
  local L1_2, L2_2
  L1_2 = L30_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L9_1 = L1_2
  L1_2 = L10_1
  if L1_2 then
    return
  end
  L1_2 = true
  L10_1 = L1_2
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = Wait
    L1_3 = L8_1
    L0_3(L1_3)
    L0_3 = L9_1
    if not L0_3 then
      L0_3 = L30_1
      L1_3 = L28_1
      L1_3, L2_3, L3_3, L4_3 = L1_3()
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
    end
    L1_3 = nil
    L9_1 = L1_3
    L1_3 = false
    L10_1 = L1_3
    L1_3 = TriggerClientEvent
    L2_3 = "Pug:client:UpdateRobberyActionLogs"
    L3_3 = -1
    L4_3 = L0_3
    L1_3(L2_3, L3_3, L4_3)
  end
  L1_2(L2_2)
end
function L32_1()
  local L0_2, L1_2
  L0_2 = L29_1
  return L0_2()
end
GetRobberyActionLogs = L32_1
function L32_1()
  local L0_2, L1_2
  L0_2 = L30_1
  L1_2 = L28_1
  L1_2 = L1_2()
  return L0_2(L1_2)
end
GetRobberyActionLogsSummary = L32_1
function L32_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = type
  L2_2 = SendRobberyActionLogToWebhook
  L1_2 = L1_2(L2_2)
  if "function" ~= L1_2 then
    return
  end
  L1_2 = pcall
  L2_2 = SendRobberyActionLogToWebhook
  L3_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L3_2 = type
    L4_2 = PrintDebug
    L3_2 = L3_2(L4_2)
    if "function" == L3_2 then
      L3_2 = PrintDebug
      L4_2 = "Failed to send robbery action log webhook: "
      L5_2 = tostring
      L6_2 = L2_2
      L5_2 = L5_2(L6_2)
      L4_2 = L4_2 .. L5_2
      L3_2(L4_2)
    end
  end
end
function L33_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L28_1
  L1_2 = L1_2()
  L2_2 = L19_1
  L3_2 = A0_2
  L4_2 = #L1_2
  L4_2 = L4_2 + 1
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L12_1
  L3_2 = L3_2()
  L4_2 = table
  L4_2 = L4_2.insert
  L5_2 = L1_2
  L6_2 = 1
  L7_2 = L2_2
  L4_2(L5_2, L6_2, L7_2)
  while true do
    L4_2 = #L1_2
    if not (L3_2 < L4_2) then
      break
    end
    L4_2 = table
    L4_2 = L4_2.remove
    L5_2 = L1_2
    L4_2(L5_2)
  end
  L4_2 = L25_1
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L1_2 = L4_2
  L1_1 = L1_2
  L4_2 = L26_1
  L5_2 = L1_2
  L4_2(L5_2)
  L4_2 = L31_1
  L5_2 = L1_2
  L4_2(L5_2)
  L4_2 = L32_1
  L5_2 = L2_2
  L4_2(L5_2)
  return L2_2
end
AddRobberyActionLog = L33_1
L33_1 = Config
L33_1 = L33_1.FrameworkFunctions
L33_1 = L33_1.CreateCallback
L34_1 = "Pug:server:GetRobberyActionLogs"
function L35_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = A1_2
  L4_2 = L29_1
  L5_2 = A2_2
  L4_2, L5_2 = L4_2(L5_2)
  L3_2(L4_2, L5_2)
end
L33_1(L34_1, L35_1)
