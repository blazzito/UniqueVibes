local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = type
  L2_2 = A0_2.entries
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.entries
    if L1_2 then
      goto lbl_21
    end
  end
  L1_2 = {}
  ::lbl_21::
  L2_2 = {}
  L2_2.entries = L1_2
  L3_2 = tonumber
  L4_2 = A0_2.maxEntries
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = #L1_2
  end
  L2_2.maxEntries = L3_2
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = 1
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = tonumber
  L7_2 = A0_2.page
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 1
  end
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2.page = L3_2
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = 1
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = tonumber
  L7_2 = A0_2.perPage
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 15
  end
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2.perPage = L3_2
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = 0
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = tonumber
  L7_2 = A0_2.totalEntries
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = #L1_2
  end
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2.totalEntries = L3_2
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = 1
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = tonumber
  L7_2 = A0_2.totalPages
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 1
  end
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2.totalPages = L3_2
  L3_2 = type
  L4_2 = A0_2.robberyNames
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = A0_2.robberyNames
    if L3_2 then
      goto lbl_97
    end
  end
  L3_2 = {}
  ::lbl_97::
  L2_2.robberyNames = L3_2
  L3_2 = tostring
  L4_2 = A0_2.selectedRobbery
  if not L4_2 then
    L4_2 = "__all__"
  end
  L3_2 = L3_2(L4_2)
  L2_2.selectedRobbery = L3_2
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = 0
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = tonumber
  L7_2 = A0_2.completedRuns
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 0
  end
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2.completedRuns = L3_2
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = 0
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = tonumber
  L7_2 = A0_2.trackedPayout
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 0
  end
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2.trackedPayout = L3_2
  L3_2 = tostring
  L4_2 = A0_2.latestTimeLabel
  if not L4_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  L2_2.latestTimeLabel = L3_2
  return L2_2
end
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "updateRobberyLogsData"
  L3_2 = L0_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L2_2.RobberyLogsData = L3_2
  L1_2(L2_2)
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.type = "markRobberyLogsStale"
  L3_2 = {}
  L4_2 = tonumber
  L5_2 = A0_2.maxEntries
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0
  end
  L3_2.maxEntries = L4_2
  L4_2 = tostring
  L5_2 = A0_2.latestEntryId
  if not L5_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  L3_2.latestEntryId = L4_2
  L4_2 = tonumber
  L5_2 = A0_2.updatedAt
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0
  end
  L3_2.updatedAt = L4_2
  L2_2.RobberyLogsMeta = L3_2
  L1_2(L2_2)
end
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "function" == L2_2 then
    A1_2 = A0_2
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:GetRobberyActionLogs"
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_1
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = A1_2
    if L2_3 then
      L2_3 = A1_2
      L3_3 = L1_3
      L2_3(L3_3)
      return
    end
    L2_3 = L1_1
    L3_3 = L1_3
    L2_3(L3_3)
  end
  L5_2 = A0_2
  L2_2(L3_2, L4_2, L5_2)
end
L4_1 = RegisterNUICallback
L5_1 = "RequestRobberyActionLogs"
function L6_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L3_1
  L3_2 = A0_2
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = A1_2
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = {}
      L3_3 = {}
      L2_3.entries = L3_3
      L2_3.maxEntries = 0
    end
    L1_3(L2_3)
  end
  L2_2(L3_2, L4_2)
end
L4_1(L5_1, L6_1)
L4_1 = RegisterNetEvent
L5_1 = "Pug:client:UpdateRobberyActionLogs"
function L6_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = type
    L2_2 = A0_2.entries
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      L1_2 = L1_1
      L2_2 = A0_2
      L1_2(L2_2)
      return
    end
  end
  L1_2 = L2_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L4_1(L5_1, L6_1)
