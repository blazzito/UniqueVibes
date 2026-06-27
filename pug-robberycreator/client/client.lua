local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1, L63_1, L64_1, L65_1, L66_1, L67_1, L68_1, L69_1, L70_1, L71_1, L72_1, L73_1, L74_1, L75_1, L76_1, L77_1, L78_1, L79_1, L80_1, L81_1, L82_1, L83_1, L84_1, L85_1, L86_1, L87_1, L88_1, L89_1, L90_1, L91_1, L92_1, L93_1, L94_1, L95_1, L96_1, L97_1, L98_1, L99_1, L100_1, L101_1, L102_1, L103_1, L104_1, L105_1, L106_1, L107_1, L108_1, L109_1, L110_1, L111_1, L112_1, L113_1, L114_1, L115_1, L116_1, L117_1, L118_1, L119_1, L120_1, L121_1, L122_1, L123_1, L124_1, L125_1, L126_1, L127_1, L128_1, L129_1, L130_1, L131_1, L132_1, L133_1, L134_1, L135_1, L136_1, L137_1
createdCamera = 0
SelectedAnimationNumber = 0
L0_1 = false
OriginalMode = false
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = nil
L5_1 = {}
L6_1 = {}
L7_1 = {}
L8_1 = false
L9_1 = 100.0
L10_1 = 120.0
L11_1 = false
L12_1 = {}
L13_1 = {}
L14_1 = {}
L15_1 = {}
EditingFeatureItem = "props"
currentWeapon = false
L16_1 = {}
L17_1 = {}
L18_1 = {}
L19_1 = nil
L20_1 = false
L21_1 = nil
L22_1 = nil
L23_1 = nil
L24_1 = nil
L25_1 = nil
L26_1 = nil
L27_1 = GetSoundId
L27_1 = L27_1()
soundIdGolbal = L27_1
TryingHack = false
L27_1 = {}
PlayerProps = L27_1
L27_1 = {}
AllDoorData = L27_1
token = false
TokenIsUseable = false
L27_1 = PlayerData
if not L27_1 then
  L27_1 = {}
end
PlayerData = L27_1
function L27_1()
  local L0_2, L1_2, L2_2
  L0_2 = nil
  L1_2 = Framework
  if "QBCore" == L1_2 then
    L1_2 = FWork
    if L1_2 then
      L1_2 = FWork
      L1_2 = L1_2.Functions
      if L1_2 then
        L1_2 = FWork
        L1_2 = L1_2.Functions
        L1_2 = L1_2.GetPlayerData
        if L1_2 then
          L1_2 = FWork
          L1_2 = L1_2.Functions
          L1_2 = L1_2.GetPlayerData
          L1_2 = L1_2()
          L0_2 = L1_2
      end
    end
  end
  else
    L1_2 = Framework
    if "ESX" == L1_2 then
      L1_2 = FWork
      if L1_2 then
        L1_2 = FWork
        L1_2 = L1_2.GetPlayerData
        if L1_2 then
          L1_2 = FWork
          L1_2 = L1_2.GetPlayerData
          L1_2 = L1_2()
          L0_2 = L1_2
        end
      end
    end
  end
  if L0_2 then
    L1_2 = type
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      PlayerData = L0_2
    end
  end
  L1_2 = PlayerData
  return L1_2
end
PugRefreshRobberyCreatorPlayerData = L27_1
function L27_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = PlayerData
  if L0_2 then
    L1_2 = L0_2.job
    if L1_2 then
      L1_2 = L0_2.job
      L1_2 = L1_2.name
      if L1_2 then
        goto lbl_14
      end
    end
  end
  L1_2 = PugRefreshRobberyCreatorPlayerData
  L1_2 = L1_2()
  L0_2 = L1_2
  ::lbl_14::
  L1_2 = L0_2 or L1_2
  if L0_2 then
    L1_2 = L0_2.job
  end
  if L1_2 then
    L2_2 = L1_2.name
    if L2_2 then
      L2_2 = tostring
      L3_2 = L1_2.name
      return L2_2(L3_2)
    end
  end
  L2_2 = nil
  return L2_2
end
PugGetRobberyCreatorJobName = L27_1
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = PugGetRobberyCreatorJobName
  L1_2 = L1_2()
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = pairs
  L3_2 = Config
  L3_2 = L3_2.DefualPoliceJobs
  if not L3_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = tostring
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L1_2 == L8_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = pairs
    L3_2 = A0_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = tostring
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      if L1_2 == L8_2 then
        L8_2 = true
        return L8_2
      end
    end
  elseif A0_2 then
    L2_2 = tostring
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L1_2 == L2_2 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = false
  return L2_2
end
PugIsRobberyCreatorPoliceJob = L27_1
function L27_1(...)
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = Config
  L0_2 = L0_2.Debug
  if L0_2 then
    L0_2 = {}
    L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = ...
    L0_2[1] = L1_2
    L0_2[2] = L2_2
    L0_2[3] = L3_2
    L0_2[4] = L4_2
    L0_2[5] = L5_2
    L0_2[6] = L6_2
    L0_2[7] = L7_2
    L0_2[8] = L8_2
    L0_2[9] = L9_2
    L1_2 = ipairs
    L2_2 = L0_2
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = type
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if "table" == L7_2 then
        L7_2 = json
        L7_2 = L7_2.encode
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        L0_2[L5_2] = L7_2
      end
    end
    L1_2 = table
    L1_2 = L1_2.concat
    L2_2 = L0_2
    L3_2 = " "
    L1_2 = L1_2(L2_2, L3_2)
    L2_2 = debug
    L2_2 = L2_2.getinfo
    L3_2 = 2
    L4_2 = "Sl"
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L2_2.currentline
    L4_2 = L2_2.source
    L6_2 = L4_2
    L5_2 = L4_2.gsub
    L7_2 = "^@"
    L8_2 = ""
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L4_2 = L5_2
    L5_2 = string
    L5_2 = L5_2.format
    L6_2 = "^2PUG DEBUG: ^6%s ^0(^4%s:^0%d^0) (THIS IS JUST A PRINT, NOT AN ERROR)"
    L7_2 = L1_2
    L8_2 = L4_2
    L9_2 = L3_2
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    L6_2 = print
    L7_2 = L5_2
    L6_2(L7_2)
  end
end
PrintDebug = L27_1
L27_1 = CreateThread
function L28_1()
  local L0_2, L1_2, L2_2
  L0_2 = Wait
  L1_2 = 3000
  L0_2(L1_2)
  L0_2 = Config
  L0_2 = L0_2.FrameworkFunctions
  L0_2 = L0_2.TriggerCallback
  L1_2 = "Pug:server:RetrieveTokenRobbery"
  function L2_2(A0_3)
    local L1_3
    token = A0_3
  end
  L0_2(L1_2, L2_2)
end
L27_1(L28_1)
L27_1 = nil
L28_1 = false
L29_1 = 15000
function L30_1()
  local L0_2, L1_2
  while true do
    L0_2 = L28_1
    if not L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = true
  L28_1 = L0_2
end
function L31_1()
  local L0_2, L1_2
  L0_2 = false
  L28_1 = L0_2
end
L32_1 = RegisterNetEvent
L33_1 = "Pug:client:UpdateRobberyToken"
function L34_1(A0_2)
  local L1_2, L2_2, L3_2
  token = A0_2
  L1_2 = L27_1
  if L1_2 then
    L1_2 = L27_1
    L2_2 = L1_2
    L1_2 = L1_2.resolve
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = nil
    L27_1 = L1_2
  end
end
L32_1(L33_1, L34_1)
function L32_1(A0_2, ...)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = TokenIsUseable
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = L30_1
  L1_2()
  L1_2 = promise
  L1_2 = L1_2.new
  L1_2 = L1_2()
  L27_1 = L1_2
  L1_2 = {}
  L2_2, L3_2, L4_2, L5_2, L6_2 = ...
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L2_2 = #L1_2
  L2_2 = L2_2 + 1
  L3_2 = token
  L1_2[L2_2] = L3_2
  L2_2 = TriggerServerEvent
  L3_2 = A0_2
  L4_2 = table
  L4_2 = L4_2.unpack
  L5_2 = L1_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  while true do
    L3_2 = L27_1
    if not L3_2 then
      break
    end
    L3_2 = GetGameTimer
    L3_2 = L3_2()
    L3_2 = L3_2 - L2_2
    L4_2 = L29_1
    if L3_2 > L4_2 then
      L3_2 = nil
      L27_1 = L3_2
      L3_2 = L31_1
      L3_2()
      L3_2 = print
      L4_2 = "[ANTI-CHEAT] Token ack timeout for %s"
      L5_2 = L4_2
      L4_2 = L4_2.format
      L6_2 = A0_2
      L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = false
      return L3_2
    end
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
  end
  L3_2 = L31_1
  L3_2()
  L3_2 = true
  return L3_2
end
SendProtected = L32_1
function L32_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetGameTimer
  L1_2 = L1_2()
  while true do
    L2_2 = token
    if L2_2 then
      L2_2 = token
      if "" ~= L2_2 then
        break
      end
    end
    L2_2 = GetGameTimer
    L2_2 = L2_2()
    L2_2 = L2_2 - L1_2
    L3_2 = A0_2 or L3_2
    if not A0_2 then
      L3_2 = 5000
    end
    if L2_2 > L3_2 then
      L2_2 = false
      return L2_2
    end
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  L2_2 = true
  return L2_2
end
WaitForToken = L32_1
function L32_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = A0_2
    L4_2 = tostring
    L5_2 = L3_2.heistName
    if not L5_2 then
      L5_2 = L3_2.robberyName
      if not L5_2 then
        L5_2 = ""
      end
    end
    L4_2 = L4_2(L5_2)
    L5_2 = tonumber
    L6_2 = L3_2.stepNumber
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      L5_2 = 0
    end
    L6_2 = tostring
    L7_2 = L3_2.rewardContext
    if not L7_2 then
      L7_2 = L3_2.source
      if not L7_2 then
        L7_2 = ""
      end
    end
    L6_2, L7_2 = L6_2(L7_2)
    return L4_2, L5_2, L6_2, L7_2
  end
  L3_2 = tostring
  L4_2 = A0_2 or L4_2
  if not A0_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0
  end
  L5_2 = tostring
  L6_2 = A2_2 or L6_2
  if not A2_2 then
    L6_2 = ""
  end
  L5_2, L6_2, L7_2 = L5_2(L6_2)
  return L3_2, L4_2, L5_2, L6_2, L7_2
end
function L33_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 then
    L1_2 = ""
    return L1_2
  end
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2
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
    L9_2 = tonumber
    L10_2 = L7_2.itemQuantity
    if not L10_2 then
      L10_2 = L7_2.amount
      if not L10_2 then
        L10_2 = 1
      end
    end
    L9_2 = L9_2(L10_2)
    if not L9_2 then
      L9_2 = 1
    end
    if "" ~= L8_2 then
      L10_2 = #L1_2
      L10_2 = L10_2 + 1
      L11_2 = "%sx %s"
      L12_2 = L11_2
      L11_2 = L11_2.format
      L13_2 = L9_2
      L14_2 = L8_2
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L1_2[L10_2] = L11_2
    end
  end
  L2_2 = table
  L2_2 = L2_2.concat
  L3_2 = L1_2
  L4_2 = ", "
  return L2_2(L3_2, L4_2)
end
function L34_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = tostring
  L5_2 = A0_2 or L5_2
  if not A0_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  A0_2 = L4_2
  if "" == A0_2 or not A1_2 then
    return
  end
  L4_2 = TriggerServerEvent
  L5_2 = "Pug:server:TrackHeistStepBlocked"
  L6_2 = A0_2
  L7_2 = tonumber
  L8_2 = A1_2.stepNumber
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 0
  end
  L8_2 = tostring
  L9_2 = A2_2 or L9_2
  if not A2_2 then
    L9_2 = ""
  end
  L8_2 = L8_2(L9_2)
  L9_2 = tostring
  L10_2 = A3_2 or L10_2
  if not A3_2 then
    L10_2 = ""
  end
  L9_2, L10_2 = L9_2(L10_2)
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
function L35_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L5_2 = WaitForToken
  L6_2 = 5000
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = L32_1
  L6_2 = A2_2
  L7_2 = A3_2
  L8_2 = A4_2
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2, L8_2)
  L8_2 = SendProtected
  L9_2 = "heist:server:giveRewardMoney"
  L10_2 = A0_2
  L11_2 = A1_2
  L12_2 = L5_2
  L13_2 = L6_2
  L14_2 = L7_2
  return L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
end
HandleMoney = L35_1
function L35_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L6_2 = WaitForToken
  L7_2 = 5000
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = A2_2 or L6_2
  if not A2_2 then
    L6_2 = 1
  end
  L7_2 = L32_1
  L8_2 = A3_2
  L9_2 = A4_2
  L10_2 = A5_2
  L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2, L10_2)
  L10_2 = SendProtected
  L11_2 = "Pug:server:RobberyGiveItem"
  L12_2 = A0_2
  L13_2 = string
  L13_2 = L13_2.lower
  L14_2 = tostring
  L15_2 = A1_2
  L14_2, L15_2, L16_2, L17_2, L18_2 = L14_2(L15_2)
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
  L14_2 = L6_2
  L15_2 = false
  L16_2 = L7_2
  L17_2 = L8_2
  L18_2 = L9_2
  return L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
end
HandleItems = L35_1
function L35_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = GetHashKey
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = IsModelInCdimage
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = IsThisModelACar
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = true
      return L2_2
  end
  else
    L2_2 = false
    return L2_2
  end
end
IsVehicleModel = L35_1
L35_1 = {}
L35_1.hei_prop_hei_securitypanel = true
L35_1.prop_ld_keypad_01b = true
function L36_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = string
  L1_2 = L1_2.lower
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2, L3_2 = L2_2(L3_2)
  L1_2 = L1_2(L2_2, L3_2)
  L2_2 = L35_1
  L1_2 = L2_2[L1_2]
  L1_2 = true == L1_2
  return L1_2
end
function L37_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 or 0 == A0_2 or not A1_2 then
    return
  end
  if A2_2 then
    L3_2 = SetEntityCoordsNoOffset
    L4_2 = A0_2
    L5_2 = A1_2.x
    L5_2 = L5_2 + 0.0
    L6_2 = A1_2.y
    L6_2 = L6_2 + 0.0
    L7_2 = A1_2.z
    L7_2 = L7_2 + 0.0
    L8_2 = false
    L9_2 = false
    L10_2 = false
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  else
    L3_2 = SetEntityCoords
    L4_2 = A0_2
    L5_2 = A1_2.x
    L6_2 = A1_2.y
    L7_2 = A1_2.z
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
end
function L38_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = pairs
  L1_2 = PlayerProps
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    if L5_2 then
      L6_2 = DoesEntityExist
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = TriggerEvent
        L7_2 = "FullyDeleteRobberiesEntity"
        L8_2 = L5_2
        L6_2(L7_2, L8_2)
      end
    end
  end
  L0_2 = {}
  PlayerProps = L0_2
  prop = nil
end
DestroyAllProps = L38_1
function L38_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L1_2 = SetEntityAsMissionEntity
  L2_2 = A0_2
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = DeleteEntity
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = DoesEntityExist
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = DeleteObject
    L2_2 = A0_2
    L1_2(L2_2)
  end
  L1_2 = DoesEntityExist
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = TriggerEvent
    L2_2 = "FullyDeleteRobberiesEntity"
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
end
function L39_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  if A0_2 and 0 ~= A0_2 then
    L3_2 = DoesEntityExist
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 and A1_2 then
      goto lbl_14
    end
  end
  L3_2 = false
  do return L3_2 end
  ::lbl_14::
  L3_2 = GetEntityCoords
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 - A1_2
  L3_2 = #L3_2
  L4_2 = A2_2 or L4_2
  if not A2_2 then
    L4_2 = 0.15
  end
  L3_2 = L3_2 <= L4_2
  return L3_2
end
function L40_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if not A0_2 or not A1_2 then
    return
  end
  L4_2 = tonumber
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = GetHashKey
    L5_2 = tostring
    L6_2 = A1_2
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L5_2(L6_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  end
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = 1.75
  end
  L6_2 = A3_2 or L6_2
  if not A3_2 then
    L6_2 = 0.15
  end
  L7_2 = 1
  L8_2 = 8
  L9_2 = 1
  for L10_2 = L7_2, L8_2, L9_2 do
    L11_2 = GetClosestObjectOfType
    L12_2 = A0_2.x
    L13_2 = A0_2.y
    L14_2 = A0_2.z
    L15_2 = L5_2
    L16_2 = L4_2
    L17_2 = false
    L18_2 = false
    L19_2 = false
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    if 0 == L11_2 then
      break
    end
    L12_2 = DoesEntityExist
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if not L12_2 then
      break
    end
    L12_2 = L39_1
    L13_2 = L11_2
    L14_2 = A0_2
    L15_2 = L6_2
    L12_2 = L12_2(L13_2, L14_2, L15_2)
    if not L12_2 then
      break
    end
    L12_2 = L38_1
    L13_2 = L11_2
    L12_2(L13_2)
    L12_2 = Wait
    L13_2 = 0
    L12_2(L13_2)
  end
  L7_2 = pairs
  L8_2 = GetGamePool
  L9_2 = "CVehicle"
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L8_2(L9_2)
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = DoesEntityExist
    L14_2 = L12_2
    L13_2 = L13_2(L14_2)
    if L13_2 then
      L13_2 = GetEntityModel
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      if L13_2 == L4_2 then
        L13_2 = L39_1
        L14_2 = L12_2
        L15_2 = A0_2
        L16_2 = L6_2
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        if L13_2 then
          L13_2 = L38_1
          L14_2 = L12_2
          L13_2(L14_2)
        end
      end
    end
  end
end
function L41_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 and A1_2 then
    L2_2 = A0_2.propName
    if L2_2 then
      L2_2 = A0_2.propName
      if "" ~= L2_2 then
        goto lbl_12
      end
    end
  end
  do return end
  ::lbl_12::
  L2_2 = L40_1
  L3_2 = A1_2
  L4_2 = A0_2.propName
  L5_2 = 2.0
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = Config
  L2_2 = L2_2.RobberyAnimations
  L3_2 = A0_2.animation
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    L2_2 = Config
    L2_2 = L2_2.RobberyAnimations
    L3_2 = A0_2.propName
    L2_2 = L2_2[L3_2]
  end
  if L2_2 then
    L3_2 = L2_2.ReplaceProp
    if L3_2 then
      L3_2 = L40_1
      L4_2 = A1_2
      L5_2 = L2_2.ReplaceProp
      L6_2 = 2.0
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = L40_1
      L4_2 = vector3
      L5_2 = A1_2.x
      L6_2 = A1_2.y
      L7_2 = A1_2.z
      L7_2 = L7_2 - 0.5
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = L2_2.ReplaceProp
      L6_2 = 2.0
      L3_2(L4_2, L5_2, L6_2)
    end
  end
  L3_2 = A0_2.propName
  if "tr_prop_tr_container_01a" == L3_2 then
    L3_2 = L40_1
    L4_2 = A1_2
    L5_2 = "prop_ld_container"
    L6_2 = 2.0
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = L40_1
    L4_2 = A1_2
    L5_2 = "tr_prop_tr_lock_01a"
    L6_2 = 2.0
    L3_2(L4_2, L5_2, L6_2)
  else
    L3_2 = A0_2.propName
    if "h4_prop_h4_glass_disp_01a" == L3_2 then
      L3_2 = L40_1
      L4_2 = vector3
      L5_2 = A1_2.x
      L6_2 = A1_2.y
      L7_2 = A1_2.z
      L7_2 = L7_2 + 1.0
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = "h4_prop_h4_neck_disp_01a"
      L6_2 = 2.0
      L3_2(L4_2, L5_2, L6_2)
      L3_2 = L40_1
      L4_2 = vector3
      L5_2 = A1_2.x
      L6_2 = A1_2.y
      L7_2 = A1_2.z
      L7_2 = L7_2 + 1.18
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = "h4_prop_h4_necklace_01a"
      L6_2 = 2.0
      L3_2(L4_2, L5_2, L6_2)
    end
  end
end
function L42_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "vector3" ~= L1_2 then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if "vector4" ~= L1_2 then
      goto lbl_17
    end
  end
  L1_2 = vector3
  L2_2 = A0_2.x
  L3_2 = A0_2.y
  L4_2 = A0_2.z
  do return L1_2(L2_2, L3_2, L4_2) end
  ::lbl_17::
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
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
    if L1_2 and L2_2 and L3_2 then
      L4_2 = vector3
      L5_2 = L1_2
      L6_2 = L2_2
      L7_2 = L3_2
      return L4_2(L5_2, L6_2, L7_2)
    end
  end
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.match
  L3_2 = "([^,]+),%s*([^,]+),%s*([^,]+)"
  L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2)
  if L1_2 and L2_2 and L3_2 then
    L4_2 = vector3
    L5_2 = tonumber
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    L6_2 = tonumber
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    L7_2 = tonumber
    L8_2 = L3_2
    L7_2, L8_2 = L7_2(L8_2)
    return L4_2(L5_2, L6_2, L7_2, L8_2)
  end
end
function L43_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L1_2 = A0_2.targetVector
    if L1_2 then
      L1_2 = A0_2.targetVector
      if "" ~= L1_2 then
        goto lbl_11
      end
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_11::
  L1_2 = L42_1
  L2_2 = A0_2.targetVector
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L1_2.z
  L3_2 = A0_2.propName
  if "v_ilev_gb_vauldr" == L3_2 then
    L2_2 = L2_2 - 1.2
  else
    L3_2 = A0_2.propName
    if "ch_prop_fingerprint_scanner_01e" == L3_2 then
      L2_2 = L2_2 - 0.22
    else
      L3_2 = GetJewelryCases
      L4_2 = A0_2.propName
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L2_2 = L2_2 + 0.16
      end
    end
  end
  L3_2 = vector3
  L4_2 = L1_2.x
  L5_2 = L1_2.y
  L6_2 = L2_2
  return L3_2(L4_2, L5_2, L6_2)
end
function L44_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = pairs
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.propName
    if L7_2 then
      L7_2 = L6_2.propName
      if "" ~= L7_2 then
        L7_2 = L43_1
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L8_2 = L41_1
          L9_2 = L6_2
          L10_2 = L7_2
          L8_2(L9_2, L10_2)
        end
      end
    end
  end
end
function L45_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 and A1_2 then
    L2_2 = A1_2.stepNumber
    if L2_2 then
      goto lbl_10
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_10::
  L2_2 = tostring
  L3_2 = A0_2
  L4_2 = "_Step:"
  L5_2 = A1_2.stepNumber
  L6_2 = "end"
  L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
  return L2_2(L3_2)
end
function L46_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  if not A1_2 or not A2_2 then
    return
  end
  L3_2 = L6_1
  L3_2 = L3_2[A2_2]
  if L3_2 then
    L4_2 = DoesEntityExist
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_16
    end
  end
  do return end
  ::lbl_16::
  A1_2._pugPropPlacementKey = A2_2
  A1_2._pugPropEntity = L3_2
  L4_2 = GetEntityCoords
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  A1_2._pugPropCoords = L4_2
end
function L47_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  if A2_2 then
    L3_2 = GetHashKey
    L4_2 = tostring
    L5_2 = A2_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    if L3_2 then
      goto lbl_11
    end
  end
  L3_2 = nil
  ::lbl_11::
  if A1_2 then
    L4_2 = A1_2._pugPropEntity
    if L4_2 then
      L4_2 = DoesEntityExist
      L5_2 = A1_2._pugPropEntity
      L4_2 = L4_2(L5_2)
      if L4_2 then
        if L3_2 then
          L4_2 = GetEntityModel
          L5_2 = A1_2._pugPropEntity
          L4_2 = L4_2(L5_2)
          if L4_2 ~= L3_2 then
            goto lbl_30
          end
        end
        L4_2 = A1_2._pugPropEntity
        return L4_2
      end
    end
  end
  ::lbl_30::
  if A1_2 then
    L4_2 = A1_2._pugPropPlacementKey
    if L4_2 then
      goto lbl_39
    end
  end
  L4_2 = L45_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  ::lbl_39::
  L5_2 = L4_2 or L5_2
  if L4_2 then
    L5_2 = L6_1
    L5_2 = L5_2[L4_2]
  end
  if L5_2 then
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      if L3_2 then
        L6_2 = GetEntityModel
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        if L6_2 ~= L3_2 then
          goto lbl_66
        end
      end
      if A1_2 then
        A1_2._pugPropPlacementKey = L4_2
        A1_2._pugPropEntity = L5_2
        L6_2 = GetEntityCoords
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        A1_2._pugPropCoords = L6_2
      end
      return L5_2
    end
  end
  ::lbl_66::
  L6_2 = nil
  return L6_2
end
function L48_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = 1000
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  if not A0_2 then
    L3_2 = print
    L4_2 = "Model: "
    L5_2 = tostring
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    L6_2 = " didnt exist"
    L4_2 = L4_2 .. L5_2 .. L6_2
    L3_2(L4_2)
    return
  end
  L3_2 = HasModelLoaded
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    return
  end
  L3_2 = RequestModel
  L4_2 = A0_2
  L3_2(L4_2)
  while true do
    L3_2 = HasModelLoaded
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L3_2 = GetGameTimer
    L3_2 = L3_2()
    L3_2 = L3_2 - L2_2
    if L1_2 < L3_2 then
      L3_2 = print
      L4_2 = "^2Model could not be loaded within 5 seconds: "
      L5_2 = A0_2
      L4_2 = L4_2 .. L5_2
      L3_2(L4_2)
      break
    end
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
  end
end
LoadModel = L48_1
function L48_1(A0_2)
  local L1_2, L2_2
  L1_2 = RequestAnimDict
  L2_2 = A0_2
  L1_2(L2_2)
  while true do
    L1_2 = HasAnimDictLoaded
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
end
loadAnimDict = L48_1
function L48_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = pairs
  L1_2 = GetGamePool
  L2_2 = "CObject"
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L1_2(L2_2)
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = IsEntityAttachedToEntity
    L7_2 = PlayerPedId
    L7_2 = L7_2()
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L6_2 = SetEntityAsMissionEntity
      L7_2 = L5_2
      L8_2 = true
      L9_2 = true
      L6_2(L7_2, L8_2, L9_2)
      L6_2 = TriggerEvent
      L7_2 = "FullyDeleteRobberiesEntity"
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
    end
  end
  L0_2 = TriggerEvent
  L1_2 = "Pug:ReloadGuns:sling"
  L0_2(L1_2)
end
ReloadSkin = L48_1
function L48_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = DestoryCamera
  L3_2()
  L3_2 = "DEFAULT_SCRIPTED_CAMERA"
  L4_2 = CreateCam
  L5_2 = L3_2
  L6_2 = 1
  L4_2 = L4_2(L5_2, L6_2)
  cam = L4_2
  L4_2 = SetCamCoord
  L5_2 = cam
  L6_2 = A0_2
  L4_2(L5_2, L6_2)
  if nil ~= A1_2 then
    L4_2 = vector3
    L5_2 = A1_2.x
    L6_2 = A1_2.y
    L7_2 = A1_2.z
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = SetCamRot
    L6_2 = cam
    L7_2 = L4_2
    L5_2(L6_2, L7_2)
  end
  if A2_2 then
    L4_2 = RenderScriptCams
    L5_2 = 1
    L6_2 = 0
    L7_2 = 0
    L8_2 = 1
    L9_2 = 1
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = PointCamAtEntity
    L5_2 = cam
    L6_2 = PlayerPedId
    L6_2, L7_2, L8_2, L9_2 = L6_2()
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  else
    L4_2 = RenderScriptCams
    L5_2 = 1
    L6_2 = 0
    L7_2 = 0
    L8_2 = 1
    L9_2 = 1
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
  L4_2 = cam
  createdCamera = L4_2
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3
    L0_3 = Wait
    L1_3 = 800
    L0_3(L1_3)
    L0_3 = PointCamAtEntity
    L1_3 = cam
    L2_3 = PlayerPedId
    L2_3 = L2_3()
    L0_3(L1_3, L2_3)
  end
  L4_2(L5_2)
end
CreateCamera = L48_1
function L48_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = createdCamera
  if 0 ~= L0_2 then
    L0_2 = RenderScriptCams
    L1_2 = 0
    L2_2 = 0
    L3_2 = 1
    L4_2 = 1
    L5_2 = 1
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
    L0_2 = DestroyCam
    L1_2 = createdCamera
    L2_2 = 0
    L0_2(L1_2, L2_2)
    createdCamera = 0
    L0_2 = SetFocusEntity
    L1_2 = GetPlayerPed
    L2_2 = PlayerPedId
    L2_2, L3_2, L4_2, L5_2 = L2_2()
    L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
  end
end
DestoryCamera = L48_1
function L48_1(A0_2)
  local L1_2
  if "ch_prop_vault_painting_01a" == A0_2 or "ch_prop_vault_painting_01e" == A0_2 or "ch_prop_vault_painting_01i" == A0_2 or "ch_prop_vault_painting_01d" == A0_2 or "ch_prop_vault_painting_01h" == A0_2 or "ch_prop_vault_painting_01j" == A0_2 or "ch_prop_vault_painting_01f" == A0_2 or "ch_prop_vault_painting_01b" == A0_2 or "ch_prop_vault_painting_01g" == A0_2 or "ch_prop_vault_painting_01c" == A0_2 then
    L1_2 = true
    return L1_2
  else
    L1_2 = false
    return L1_2
  end
end
GetPaintingProps = L48_1
function L48_1(A0_2)
  local L1_2
  if "h4_prop_h4_gold_stack_01a" == A0_2 or "h4_prop_h4_cash_stack_01a" == A0_2 or "h4_prop_h4_weed_stack_01a" == A0_2 or "h4_prop_h4_coke_stack_01a" == A0_2 then
    L1_2 = true
    return L1_2
  else
    L1_2 = false
    return L1_2
  end
end
GetStackProps = L48_1
function L48_1(A0_2)
  local L1_2
  if "ch_prop_gold_trolly_01a" == A0_2 or "ch_prop_cash_low_trolly_01a" == A0_2 or "ch_prop_diamond_trolly_01a" == A0_2 or "imp_prop_impexp_coke_trolly" == A0_2 then
    L1_2 = true
    return L1_2
  else
    L1_2 = false
    return L1_2
  end
end
GetTrollyProps = L48_1
function L48_1(A0_2)
  local L1_2
  if "des_jewel_cab_start" == A0_2 or "des_jewel_cab2_start" == A0_2 or "des_jewel_cab3_start" == A0_2 or "des_jewel_cab4_start" == A0_2 then
    L1_2 = true
    return L1_2
  else
    L1_2 = false
    return L1_2
  end
end
GetJewelryCases = L48_1
function L48_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = ipairs
  L2_2 = L5_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.heist_name
    if L7_2 == A0_2 then
      return L6_2
    end
  end
  L1_2 = nil
  return L1_2
end
function L49_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tostring
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "([%%%^%$%(%)%.%[%]%*%+%-%?])"
  L4_2 = "%%%1"
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  return L1_2
end
function L50_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = GetHashKey
    L2_2 = tostring
    L3_2 = A0_2
    L2_2, L3_2 = L2_2(L3_2)
    L1_2 = L1_2(L2_2, L3_2)
  end
  return L1_2
end
function L51_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = tostring
  L4_2 = A0_2 or L4_2
  if not A0_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  L4_2 = tostring
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  L5_2 = "_Step:"
  L4_2 = L4_2 .. L5_2
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = 1 == L2_2
  return L2_2
end
function L52_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = string
  L3_2 = L3_2.find
  L4_2 = tostring
  L5_2 = A0_2 or L5_2
  if not A0_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  L5_2 = tostring
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = ""
  end
  L5_2 = L5_2(L6_2)
  L6_2 = "_Step:"
  L7_2 = tostring
  L8_2 = A2_2
  L7_2 = L7_2(L8_2)
  L8_2 = "end"
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
  L6_2 = 1
  L7_2 = true
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = 1 == L3_2
  return L3_2
end
function L53_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    return
  end
  L1_2 = A0_2.entity
  if not L1_2 then
    L1_2 = A0_2.key
    if L1_2 then
      L2_2 = A0_2.key
      L1_2 = L6_1
      L1_2 = L1_2[L2_2]
    end
  end
  if L1_2 then
    L2_2 = DoesEntityExist
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = AllDoorData
      L2_2[L1_2] = nil
      L2_2 = L38_1
      L3_2 = L1_2
      L2_2(L3_2)
    end
  end
  L2_2 = A0_2.key
  if L2_2 then
    L3_2 = A0_2.key
    L2_2 = L6_1
    L2_2 = L2_2[L3_2]
    if L2_2 == L1_2 then
      L3_2 = A0_2.key
      L2_2 = L6_1
      L2_2[L3_2] = nil
    end
  end
  A0_2.entity = nil
  L2_2 = A0_2.primary
  if L2_2 then
    L2_2 = A0_2.stage
    if L2_2 then
      L2_2 = A0_2.stage
      L2_2 = L2_2._pugPropPlacementKey
      L3_2 = A0_2.key
      if L2_2 == L3_2 then
        L2_2 = A0_2.stage
        L2_2._pugPropPlacementKey = nil
        L2_2 = A0_2.stage
        L2_2._pugPropEntity = nil
        L2_2 = A0_2.stage
        L2_2._pugPropCoords = nil
      end
    end
  end
end
function L54_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 then
    L1_2 = A0_2.disabled
    if not L1_2 then
      L1_2 = A0_2.key
      if L1_2 then
        L1_2 = A0_2.coords
        if L1_2 then
          L1_2 = A0_2.model
          if L1_2 then
            goto lbl_17
          end
        end
      end
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_17::
  L1_2 = A0_2.entity
  if L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2.entity
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = A0_2.entity
      return L1_2
    end
  end
  L2_2 = A0_2.key
  L1_2 = L6_1
  L1_2 = L1_2[L2_2]
  if L1_2 then
    L2_2 = DoesEntityExist
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      A0_2.entity = L1_2
      return L1_2
    end
  end
  L2_2 = A0_2.cleanupStage
  if L2_2 then
    L2_2 = A0_2.stage
    if L2_2 then
      L2_2 = L41_1
      L3_2 = A0_2.stage
      L4_2 = A0_2.coords
      L2_2(L3_2, L4_2)
    end
  end
  L2_2 = A0_2.cleanupModel
  if L2_2 then
    L2_2 = A0_2.cleanupCoords
    if L2_2 then
      L2_2 = L40_1
      L3_2 = A0_2.cleanupCoords
      L4_2 = A0_2.cleanupModel
      L5_2 = A0_2.cleanupRadius
      if not L5_2 then
        L5_2 = 0.75
      end
      L2_2(L3_2, L4_2, L5_2)
    end
  end
  L2_2 = LoadModel
  L3_2 = A0_2.model
  L2_2(L3_2)
  L2_2 = A0_2.coords
  L3_2 = nil
  L4_2 = A0_2.createType
  if "vehicle" == L4_2 then
    L4_2 = CreateVehicle
    L5_2 = A0_2.model
    L6_2 = vector3
    L7_2 = L2_2.x
    L8_2 = L2_2.y
    L9_2 = L2_2.z
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2, L8_2, L9_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L3_2 = L4_2
  else
    L4_2 = A0_2.noOffset
    if L4_2 then
      L4_2 = CreateObjectNoOffset
      L5_2 = L50_1
      L6_2 = A0_2.model
      L5_2 = L5_2(L6_2)
      L6_2 = L2_2.x
      L7_2 = L2_2.y
      L8_2 = L2_2.z
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L3_2 = L4_2
    else
      L4_2 = CreateObject
      L5_2 = A0_2.model
      L6_2 = vector3
      L7_2 = L2_2.x
      L8_2 = L2_2.y
      L9_2 = L2_2.z
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2, L8_2, L9_2)
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L3_2 = L4_2
    end
  end
  L4_2 = GetGameTimer
  L4_2 = L4_2()
  while L3_2 and 0 ~= L3_2 do
    L5_2 = DoesEntityExist
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      break
    end
    L5_2 = GetGameTimer
    L5_2 = L5_2()
    L5_2 = L5_2 - L4_2
    L6_2 = 3000
    if L5_2 > L6_2 then
      break
    end
    L5_2 = Wait
    L6_2 = 0
    L5_2(L6_2)
  end
  if L3_2 and 0 ~= L3_2 then
    L5_2 = DoesEntityExist
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_140
    end
  end
  A0_2.entity = nil
  L6_2 = A0_2.key
  L5_2 = L6_1
  L5_2[L6_2] = nil
  L5_2 = nil
  do return L5_2 end
  ::lbl_140::
  L6_2 = A0_2.key
  L5_2 = L6_1
  L5_2[L6_2] = L3_2
  A0_2.entity = L3_2
  L5_2 = A0_2.primary
  if L5_2 then
    L5_2 = L46_1
    L6_2 = A0_2.heistName
    L7_2 = A0_2.stage
    L8_2 = A0_2.key
    L5_2(L6_2, L7_2, L8_2)
  end
  L5_2 = A0_2.createType
  if "vehicle" == L5_2 then
    L5_2 = A0_2.vehicleLocked
    if L5_2 then
      L5_2 = SetVehicleDoorsLocked
      L6_2 = L3_2
      L7_2 = 4
      L5_2(L6_2, L7_2)
    end
  end
  L5_2 = A0_2.heading
  if L5_2 then
    L5_2 = SetEntityHeading
    L6_2 = L3_2
    L7_2 = tonumber
    L8_2 = A0_2.heading
    L7_2 = L7_2(L8_2)
    L7_2 = L7_2 + 0.0
    L5_2(L6_2, L7_2)
  end
  L5_2 = A0_2.precisePlacement
  if L5_2 then
    L5_2 = SetEntityCoordsNoOffset
    L6_2 = L3_2
    L7_2 = L2_2.x
    L8_2 = L2_2.y
    L9_2 = L2_2.z
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  else
    L5_2 = A0_2.customDoor
    if L5_2 then
      L5_2 = SetEntityCoordsNoOffset
      L6_2 = L3_2
      L7_2 = vector3
      L8_2 = L2_2.x
      L9_2 = L2_2.y
      L10_2 = L2_2.z
      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2, L10_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L5_2 = AllDoorData
      L6_2 = {}
      L7_2 = GetEntityCoords
      L8_2 = L3_2
      L7_2 = L7_2(L8_2)
      L6_2.Coords = L7_2
      L7_2 = A0_2.propName
      L6_2.Prop = L7_2
      L7_2 = tonumber
      L8_2 = A0_2.heading
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = 0.0
      end
      L6_2.Heading = L7_2
      L7_2 = A0_2.targetText
      L6_2.Name = L7_2
      L7_2 = A0_2.stepNumber
      L6_2.StageNumber = L7_2
      L7_2 = A0_2.heistName
      L6_2.Robbery = L7_2
      L5_2[L3_2] = L6_2
    end
  end
  L5_2 = A0_2.visible
  if nil ~= L5_2 then
    L5_2 = SetEntityVisible
    L6_2 = L3_2
    L7_2 = A0_2.visible
    L8_2 = false
    L5_2(L6_2, L7_2, L8_2)
  end
  L5_2 = A0_2.freeze
  if false ~= L5_2 then
    L5_2 = FreezeEntityPosition
    L6_2 = L3_2
    L7_2 = true
    L5_2(L6_2, L7_2)
  end
  L5_2 = A0_2.collision
  if nil ~= L5_2 then
    L5_2 = SetEntityCollision
    L6_2 = L3_2
    L7_2 = A0_2.collision
    L8_2 = A0_2.collision
    L5_2(L6_2, L7_2, L8_2)
  end
  L5_2 = A0_2.invincible
  if L5_2 then
    L5_2 = SetEntityInvincible
    L6_2 = L3_2
    L7_2 = true
    L5_2(L6_2, L7_2)
  end
  return L3_2
end
function L55_1()
  local L0_2, L1_2
  L0_2 = L8_1
  if L0_2 then
    return
  end
  L0_2 = true
  L8_1 = L0_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    while true do
      L0_3 = false
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L2_3 = GetEntityCoords
      L3_3 = L1_3
      L2_3 = L2_3(L3_3)
      L3_3 = pairs
      L4_3 = L7_1
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L0_3 = true
        L9_3 = L8_3.coords
        if L9_3 then
          L9_3 = L8_3.coords
          L9_3 = L2_3 - L9_3
          L9_3 = #L9_3
          L10_3 = L8_3.spawnDistance
          if not L10_3 then
            L10_3 = L9_1
          end
          L11_3 = L8_3.despawnDistance
          if not L11_3 then
            L11_3 = L10_1
          end
          L12_3 = L8_3.disabled
          if not L12_3 and L9_3 <= L10_3 then
            L12_3 = L54_1
            L13_3 = L8_3
            L12_3(L13_3)
          else
            L12_3 = L8_3.entity
            if L12_3 then
              L12_3 = DoesEntityExist
              L13_3 = L8_3.entity
              L12_3 = L12_3(L13_3)
              if L12_3 and L9_3 >= L11_3 then
                L12_3 = L53_1
                L13_3 = L8_3
                L12_3(L13_3)
              end
            end
          end
        end
      end
      if not L0_3 then
        L3_3 = false
        L8_1 = L3_3
        return
      end
      L3_3 = Wait
      L4_3 = 1000
      L3_3(L4_3)
    end
  end
  L0_2(L1_2)
end
function L56_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = A0_2.key
    if L1_2 then
      L1_2 = A0_2.coords
      if L1_2 then
        L1_2 = A0_2.model
        if L1_2 then
          goto lbl_14
        end
      end
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_14::
  L2_2 = A0_2.key
  L1_2 = L7_1
  L1_2 = L1_2[L2_2]
  if L1_2 then
    L1_2 = L53_1
    L3_2 = A0_2.key
    L2_2 = L7_1
    L2_2 = L2_2[L3_2]
    L1_2(L2_2)
  end
  L1_2 = A0_2.spawnDistance
  if not L1_2 then
    L1_2 = L9_1
  end
  A0_2.spawnDistance = L1_2
  L1_2 = A0_2.despawnDistance
  if not L1_2 then
    L1_2 = L10_1
  end
  A0_2.despawnDistance = L1_2
  A0_2.disabled = false
  L2_2 = A0_2.key
  L1_2 = L7_1
  L1_2[L2_2] = A0_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  if L1_2 and 0 ~= L1_2 then
    L2_2 = DoesEntityExist
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = GetEntityCoords
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      L3_2 = A0_2.coords
      L2_2 = L2_2 - L3_2
      L2_2 = #L2_2
      L3_2 = A0_2.spawnDistance
      if L2_2 <= L3_2 then
        L3_2 = L54_1
        L4_2 = A0_2
        L3_2(L4_2)
      end
    end
  end
  L2_2 = L55_1
  L2_2()
  return A0_2
end
function L57_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L7_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    return
  end
  if false ~= A1_2 then
    L3_2 = L53_1
    L4_2 = L2_2
    L3_2(L4_2)
  end
  L3_2 = L7_1
  L3_2[A0_2] = nil
end
function L58_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = pairs
  L3_2 = L7_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L51_1
    L9_2 = L6_2
    L10_2 = A0_2
    L8_2 = L8_2(L9_2, L10_2)
    if L8_2 then
      if false ~= A1_2 then
        L8_2 = L53_1
        L9_2 = L7_2
        L8_2(L9_2)
      end
      L8_2 = L7_1
      L8_2[L6_2] = nil
    end
  end
end
function L59_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = pairs
  L2_2 = L7_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    if false ~= A0_2 then
      L7_2 = L53_1
      L8_2 = L6_2
      L7_2(L8_2)
    end
    L7_2 = L7_1
    L7_2[L5_2] = nil
  end
end
function L60_1(A0_2, A1_2)
  local L2_2, L3_2
  if not A1_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = L50_1
  L3_2 = A0_2 or L3_2
  if A0_2 then
    L3_2 = A0_2.model
  end
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2 == A1_2
  return L2_2
end
function L61_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L7_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = false
    return L2_2
  end
  L1_2.disabled = true
  L2_2 = L53_1
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = true
  return L2_2
end
function L62_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L5_2 = false
  if not A2_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = pairs
  L7_2 = L7_1
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = false
    if A1_2 then
      L13_2 = L52_1
      L14_2 = L10_2
      L15_2 = A0_2
      L16_2 = A1_2
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L12_2 = L13_2
    else
      L13_2 = L51_1
      L14_2 = L10_2
      L15_2 = A0_2
      L13_2 = L13_2(L14_2, L15_2)
      L12_2 = L13_2
    end
    if L12_2 then
      L13_2 = L60_1
      L14_2 = L11_2
      L15_2 = A3_2
      L13_2 = L13_2(L14_2, L15_2)
      if L13_2 then
        L13_2 = Vdist
        L14_2 = L11_2.coords
        L14_2 = L14_2.x
        L15_2 = L11_2.coords
        L15_2 = L15_2.y
        L16_2 = L11_2.coords
        L16_2 = L16_2.z
        L17_2 = A2_2.x
        L18_2 = A2_2.y
        L19_2 = A2_2.z
        L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        if A4_2 >= L13_2 then
          L13_2 = L61_1
          L14_2 = L10_2
          L13_2(L14_2)
          L5_2 = true
        end
      end
    end
  end
  return L5_2
end
function L63_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 or not A1_2 then
    L2_2 = nil
    L3_2 = nil
    L4_2 = nil
    L5_2 = nil
    return L2_2, L3_2, L4_2, L5_2
  end
  L2_2 = tostring
  L3_2 = A0_2
  L4_2 = "_Step:"
  L5_2 = A1_2
  L6_2 = "end"
  L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L4_2 = L2_2
  L5_2 = "_opened_container"
  L4_2 = L4_2 .. L5_2
  L5_2 = L2_2
  L6_2 = "_opened_lock"
  L5_2 = L5_2 .. L6_2
  L6_2 = L2_2
  L7_2 = tostring
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  L6_2 = L6_2 .. L7_2
  return L3_2, L4_2, L5_2, L6_2
end
function L64_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = L63_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L5_2 = L61_1
    L6_2 = L3_2
    L5_2(L6_2)
  end
  if not A2_2 then
    return
  end
  L5_2 = L62_1
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = GetHashKey
  L10_2 = "tr_prop_tr_container_01a"
  L9_2 = L9_2(L10_2)
  L10_2 = 1.5
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  if L4_2 then
    L5_2 = L6_1
    L5_2 = L5_2[L4_2]
    if L5_2 then
      L5_2 = DoesEntityExist
      L6_2 = L6_1
      L6_2 = L6_2[L4_2]
      L5_2 = L5_2(L6_2)
      if L5_2 then
        return
      end
    end
  end
  L5_2 = L40_1
  L6_2 = A2_2
  L7_2 = "tr_prop_tr_container_01a"
  L8_2 = 1.5
  L9_2 = 0.75
  L5_2(L6_2, L7_2, L8_2, L9_2)
end
function L65_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 and A1_2 then
    L4_2 = A1_2.propName
    if "tr_prop_tr_container_01a" == L4_2 and A2_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L4_2 = tonumber
  L5_2 = A1_2.stepNumber
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = Config
  L5_2 = L5_2.FrameworkFunctions
  L5_2 = L5_2.TriggerCallback
  L6_2 = "Pug:server:hasStepObjectBeenCompleted"
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    if not A0_3 then
      return
    end
    L1_3 = Config
    L1_3 = L1_3.RobberyAnimations
    L2_3 = A1_2.animation
    L1_3 = L1_3[L2_3]
    if not L1_3 then
      L1_3 = Config
      L1_3 = L1_3.RobberyAnimations
      L2_3 = A1_2.propName
      L1_3 = L1_3[L2_3]
    end
    L2_3 = L1_3 or L2_3
    if L1_3 then
      L2_3 = L1_3.NetworkedAnimations
      if L2_3 then
        L2_3 = L1_3.NetworkedAnimations
        L2_3 = L2_3[1]
      end
    end
    if L2_3 then
      L3_3 = L2_3.AnimDict
      if L3_3 then
        goto lbl_27
      end
    end
    do return end
    ::lbl_27::
    L3_3 = tonumber
    L4_3 = A3_2
    L3_3 = L3_3(L4_3)
    if not L3_3 then
      L3_3 = 0.0
    end
    L4_3 = {}
    L5_3 = A2_2
    L4_3.Coords = L5_3
    L5_3 = vector3
    L6_3 = 0.0
    L7_3 = 0.0
    L8_3 = L3_3
    L5_3 = L5_3(L6_3, L7_3, L8_3)
    L4_3.Rotation = L5_3
    L5_3 = A1_2.propName
    L4_3.PropName = L5_3
    L5_3 = A0_2
    L4_3.RobberyName = L5_3
    L5_3 = A1_2
    L4_3.Stage = L5_3
    L4_3.Heading = L3_3
    L5_3 = TriggerEvent
    L6_3 = "Pug:client:CreateSyncedProps"
    L7_3 = A2_2
    L8_3 = L4_3.Rotation
    L9_3 = L2_3.AnimDict
    L10_3 = A0_2
    L11_3 = A1_2.propName
    L12_3 = L4_3
    L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
  end
  L8_2 = A0_2
  L9_2 = L4_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
end
function L66_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if not (A0_2 and A1_2) or not A2_2 then
    return
  end
  L5_2 = vector3
  L6_2 = A2_2.x
  L6_2 = L6_2 + 0.0
  L7_2 = A2_2.y
  L7_2 = L7_2 + 0.0
  L8_2 = A2_2.z
  L8_2 = L8_2 + 0.0
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if not A4_2 then
    L6_2 = math
    L6_2 = L6_2.rad
    L7_2 = A3_2 or L7_2
    if not A3_2 then
      L7_2 = 0.0
    end
    L6_2 = L6_2(L7_2)
    L7_2 = math
    L7_2 = L7_2.sin
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    L7_2 = -L7_2
    L8_2 = math
    L8_2 = L8_2.cos
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    L9_2 = vector3
    L10_2 = A2_2.x
    L11_2 = L7_2 * 0.011
    L10_2 = L10_2 + L11_2
    L11_2 = A2_2.y
    L12_2 = L8_2 * 0.011
    L11_2 = L11_2 + L12_2
    L12_2 = A2_2.z
    L12_2 = L12_2 - 0.1
    L9_2 = L9_2(L10_2, L11_2, L12_2)
    L5_2 = L9_2
  end
  L6_2 = L56_1
  L7_2 = {}
  L8_2 = tostring
  L9_2 = A0_2
  L10_2 = "_Step:"
  L11_2 = A1_2.stepNumber
  L12_2 = "end_passcode"
  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2
  L8_2 = L8_2(L9_2)
  L7_2.key = L8_2
  L7_2.heistName = A0_2
  L8_2 = A1_2.stepNumber
  L7_2.stepNumber = L8_2
  L7_2.model = "xs_prop_arena_stickynote_01a"
  L7_2.coords = L5_2
  L8_2 = A3_2 or L8_2
  if not A3_2 then
    L8_2 = 0.0
  end
  L7_2.heading = L8_2
  L8_2 = true == A4_2
  L7_2.noOffset = L8_2
  if true == A4_2 then
  end
  L7_2.collision = nil
  L8_2 = true == A4_2
  L7_2.invincible = L8_2
  L7_2.cleanupModel = "xs_prop_arena_stickynote_01a"
  L8_2 = vector3
  L9_2 = A2_2.x
  L9_2 = L9_2 + 0.0
  L10_2 = A2_2.y
  L10_2 = L10_2 + 0.0
  L11_2 = A2_2.z
  L11_2 = L11_2 + 0.0
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L7_2.cleanupCoords = L8_2
  L7_2.cleanupRadius = 0.75
  L7_2.cleanupStage = false
  L6_2(L7_2)
end
function L67_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if A0_2 and A1_2 then
    L4_2 = A1_2.propName
    if L4_2 then
      L4_2 = A1_2.propName
      if "" ~= L4_2 then
        goto lbl_13
      end
    end
  end
  L4_2 = nil
  do return L4_2 end
  ::lbl_13::
  L4_2 = L42_1
  L5_2 = A1_2.targetVector
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = nil
    return L5_2
  end
  A1_2.targetVector = L4_2
  L5_2 = L4_2.z
  L6_2 = A1_2.propName
  if "v_ilev_gb_vauldr" == L6_2 then
    L5_2 = L5_2 - 1.2
  else
    L6_2 = A1_2.propName
    if "ch_prop_fingerprint_scanner_01e" == L6_2 then
      L5_2 = L5_2 - 0.22
    else
      L6_2 = GetJewelryCases
      L7_2 = A1_2.propName
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L5_2 = L5_2 + 0.16
      end
    end
  end
  L6_2 = A1_2.propName
  L7_2 = tonumber
  L8_2 = A1_2.propHeading
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 0.0
  end
  L8_2 = vector3
  L9_2 = L4_2.x
  L10_2 = L4_2.y
  L11_2 = L5_2
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = L45_1
  L10_2 = A0_2
  L11_2 = A1_2
  L9_2 = L9_2(L10_2, L11_2)
  L10_2 = IsVehicleModel
  L11_2 = L6_2
  L10_2 = L10_2(L11_2)
  L11_2 = L56_1
  L12_2 = {}
  L12_2.key = L9_2
  L12_2.heistName = A0_2
  L13_2 = A1_2.stepNumber
  L12_2.stepNumber = L13_2
  L12_2.stage = A1_2
  L12_2.primary = true
  L13_2 = A1_2.propName
  L12_2.propName = L13_2
  L13_2 = A1_2.targetText
  L12_2.targetText = L13_2
  L12_2.model = L6_2
  L12_2.coords = L8_2
  L12_2.heading = L7_2
  if L10_2 then
    L13_2 = "vehicle"
    if L13_2 then
      goto lbl_82
    end
  end
  L13_2 = "object"
  ::lbl_82::
  L12_2.createType = L13_2
  L12_2.vehicleLocked = L10_2
  L13_2 = L36_1
  L14_2 = A1_2.propName
  L13_2 = L13_2(L14_2)
  L12_2.precisePlacement = L13_2
  L13_2 = L19_1
  L14_2 = L6_2
  L13_2 = L13_2(L14_2)
  L12_2.customDoor = L13_2
  L13_2 = true == A2_2
  L12_2.cleanupStage = L13_2
  L11_2(L12_2)
  if L10_2 then
    L11_2 = -0.8
    L12_2 = 0.0
    L13_2 = 0.9
    L14_2 = math
    L14_2 = L14_2.rad
    L15_2 = L7_2
    L14_2 = L14_2(L15_2)
    L15_2 = math
    L15_2 = L15_2.cos
    L16_2 = L14_2
    L15_2 = L15_2(L16_2)
    L15_2 = L11_2 * L15_2
    L16_2 = math
    L16_2 = L16_2.sin
    L17_2 = L14_2
    L16_2 = L16_2(L17_2)
    L16_2 = L12_2 * L16_2
    L15_2 = L15_2 - L16_2
    L16_2 = math
    L16_2 = L16_2.sin
    L17_2 = L14_2
    L16_2 = L16_2(L17_2)
    L16_2 = L11_2 * L16_2
    L17_2 = math
    L17_2 = L17_2.cos
    L18_2 = L14_2
    L17_2 = L17_2(L18_2)
    L17_2 = L12_2 * L17_2
    L16_2 = L16_2 + L17_2
    L17_2 = vector3
    L18_2 = L8_2.x
    L18_2 = L18_2 + L15_2
    L19_2 = L8_2.y
    L19_2 = L19_2 + L16_2
    L20_2 = L8_2.z
    L20_2 = L20_2 + L13_2
    L17_2 = L17_2(L18_2, L19_2, L20_2)
    A1_2.targetVector = L17_2
  end
  L11_2 = A1_2.propName
  if "tr_prop_tr_container_01a" == L11_2 then
    L11_2 = L56_1
    L12_2 = {}
    L13_2 = tostring
    L14_2 = A0_2
    L15_2 = "_Step:"
    L16_2 = A1_2.stepNumber
    L17_2 = "end"
    L18_2 = A1_2.stepNumber
    L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2 .. L18_2
    L13_2 = L13_2(L14_2)
    L12_2.key = L13_2
    L12_2.heistName = A0_2
    L13_2 = A1_2.stepNumber
    L12_2.stepNumber = L13_2
    L12_2.model = "prop_ld_container"
    L12_2.coords = L8_2
    L12_2.heading = L7_2
    L12_2.visible = false
    L11_2(L12_2)
  else
    L11_2 = A1_2.propName
    if "h4_prop_h4_glass_disp_01a" == L11_2 then
      L11_2 = L56_1
      L12_2 = {}
      L13_2 = tostring
      L14_2 = A0_2
      L15_2 = "_Step:"
      L16_2 = A1_2.stepNumber
      L17_2 = "end_neck_display"
      L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2
      L13_2 = L13_2(L14_2)
      L12_2.key = L13_2
      L12_2.heistName = A0_2
      L13_2 = A1_2.stepNumber
      L12_2.stepNumber = L13_2
      L12_2.model = "h4_prop_h4_neck_disp_01a"
      L13_2 = vector3
      L14_2 = L4_2.x
      L15_2 = L4_2.y
      L16_2 = L5_2 + 1.0
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L12_2.coords = L13_2
      L12_2.heading = L7_2
      L11_2(L12_2)
      L11_2 = L56_1
      L12_2 = {}
      L13_2 = tostring
      L14_2 = A0_2
      L15_2 = "_Step:"
      L16_2 = A1_2.stepNumber
      L17_2 = "end_necklace"
      L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2
      L13_2 = L13_2(L14_2)
      L12_2.key = L13_2
      L12_2.heistName = A0_2
      L13_2 = A1_2.stepNumber
      L12_2.stepNumber = L13_2
      L12_2.model = "h4_prop_h4_necklace_01a"
      L13_2 = vector3
      L14_2 = L4_2.x
      L15_2 = L4_2.y
      L16_2 = L5_2 + 1.18
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L12_2.coords = L13_2
      L12_2.heading = L7_2
      L11_2(L12_2)
    end
  end
  if not A3_2 then
    L11_2 = L65_1
    L12_2 = A0_2
    L13_2 = A1_2
    L14_2 = L8_2
    L15_2 = L7_2
    L11_2(L12_2, L13_2, L14_2, L15_2)
  end
  L11_2 = Config
  L11_2 = L11_2.CustomZAxisTargetsOnProps
  L12_2 = A1_2.propName
  L11_2 = L11_2[L12_2]
  if L11_2 then
    L11_2 = Config
    L11_2 = L11_2.CustomZAxisTargetsOnProps
    L12_2 = A1_2.propName
    L11_2 = L11_2[L12_2]
    L11_2 = L11_2.Xoffset
    L12_2 = Config
    L12_2 = L12_2.CustomZAxisTargetsOnProps
    L13_2 = A1_2.propName
    L12_2 = L12_2[L13_2]
    L12_2 = L12_2.Yoffset
    L13_2 = Config
    L13_2 = L13_2.CustomZAxisTargetsOnProps
    L14_2 = A1_2.propName
    L13_2 = L13_2[L14_2]
    L13_2 = L13_2.zoffset
    L14_2 = math
    L14_2 = L14_2.rad
    L15_2 = L7_2
    L14_2 = L14_2(L15_2)
    L15_2 = math
    L15_2 = L15_2.cos
    L16_2 = L14_2
    L15_2 = L15_2(L16_2)
    L15_2 = L11_2 * L15_2
    L16_2 = math
    L16_2 = L16_2.sin
    L17_2 = L14_2
    L16_2 = L16_2(L17_2)
    L16_2 = L12_2 * L16_2
    L15_2 = L15_2 - L16_2
    L16_2 = math
    L16_2 = L16_2.sin
    L17_2 = L14_2
    L16_2 = L16_2(L17_2)
    L16_2 = L11_2 * L16_2
    L17_2 = math
    L17_2 = L17_2.cos
    L18_2 = L14_2
    L17_2 = L17_2(L18_2)
    L17_2 = L12_2 * L17_2
    L16_2 = L16_2 + L17_2
    L17_2 = vector3
    L18_2 = A1_2.targetVector
    L18_2 = L18_2.x
    L18_2 = L18_2 + L15_2
    L19_2 = A1_2.targetVector
    L19_2 = L19_2.y
    L19_2 = L19_2 + L16_2
    L20_2 = A1_2.targetVector
    L20_2 = L20_2.z
    L20_2 = L20_2 + L13_2
    L17_2 = L17_2(L18_2, L19_2, L20_2)
    A1_2.targetVector = L17_2
  end
  L11_2 = GetPaintingProps
  L12_2 = A1_2.propName
  L11_2 = L11_2(L12_2)
  if not L11_2 then
    L11_2 = A1_2.propName
    if "ch_prop_gold_trolly_01a" ~= L11_2 then
      L11_2 = A1_2.propName
      if "ch_prop_cash_low_trolly_01a" ~= L11_2 then
        L11_2 = A1_2.propName
        if "tr_prop_tr_container_01a" ~= L11_2 then
          L11_2 = A1_2.propName
          if "ch_prop_diamond_trolly_01a" ~= L11_2 then
            L11_2 = A1_2.propName
            if "imp_prop_impexp_coke_trolly" ~= L11_2 then
              L11_2 = A1_2.propName
              if "h4_prop_h4_glass_disp_01a" ~= L11_2 then
                L11_2 = A1_2.propName
                if "tr_prop_tr_elecbox_01a" ~= L11_2 then
                  L11_2 = GetJewelryCases
                  L12_2 = A1_2.propName
                  L11_2 = L11_2(L12_2)
                  if not L11_2 then
                    L11_2 = A1_2.propName
                    if "h4_prop_h4_safe_01a" ~= L11_2 then
                      goto lbl_414
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L11_2 = 0.0
  L12_2 = 0.0
  L13_2 = 0.9
  L14_2 = GetPaintingProps
  L15_2 = A1_2.propName
  L14_2 = L14_2(L15_2)
  if L14_2 then
    L13_2 = 0.5
  else
    L14_2 = A1_2.propName
    if "h4_prop_h4_glass_disp_01a" ~= L14_2 then
      L14_2 = A1_2.propName
      if "h4_prop_h4_safe_01a" ~= L14_2 then
        goto lbl_351
      end
    end
    L12_2 = -0.2
    L13_2 = 1.2
    goto lbl_362
    ::lbl_351::
    L14_2 = A1_2.propName
    if "tr_prop_tr_elecbox_01a" == L14_2 then
      L13_2 = 1.2
    else
      L14_2 = GetJewelryCases
      L15_2 = A1_2.propName
      L14_2 = L14_2(L15_2)
      if L14_2 then
        L13_2 = 0.5
      end
    end
  end
  ::lbl_362::
  L14_2 = A1_2.propName
  if "tr_prop_tr_container_01a" == L14_2 then
    L12_2 = -1.8
    L13_2 = 1.3
  end
  L14_2 = math
  L14_2 = L14_2.rad
  L15_2 = L7_2
  L14_2 = L14_2(L15_2)
  L15_2 = math
  L15_2 = L15_2.cos
  L16_2 = L14_2
  L15_2 = L15_2(L16_2)
  L15_2 = L11_2 * L15_2
  L16_2 = math
  L16_2 = L16_2.sin
  L17_2 = L14_2
  L16_2 = L16_2(L17_2)
  L16_2 = L12_2 * L16_2
  L15_2 = L15_2 - L16_2
  L16_2 = math
  L16_2 = L16_2.sin
  L17_2 = L14_2
  L16_2 = L16_2(L17_2)
  L16_2 = L11_2 * L16_2
  L17_2 = math
  L17_2 = L17_2.cos
  L18_2 = L14_2
  L17_2 = L17_2(L18_2)
  L17_2 = L12_2 * L17_2
  L16_2 = L16_2 + L17_2
  L17_2 = vector3
  L18_2 = A1_2.targetVector
  L18_2 = L18_2.x
  L18_2 = L18_2 + L15_2
  L19_2 = A1_2.targetVector
  L19_2 = L19_2.y
  L19_2 = L19_2 + L16_2
  L20_2 = A1_2.targetVector
  L20_2 = L20_2.z
  L20_2 = L20_2 + L13_2
  L17_2 = L17_2(L18_2, L19_2, L20_2)
  A1_2.targetVector = L17_2
  ::lbl_414::
  L11_2 = {}
  L11_2.key = L9_2
  L11_2.coords = L8_2
  L11_2.zAxis = L5_2
  return L11_2
end
function L68_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = tostring
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = pairs
  L3_2 = L13_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = string
    L8_2 = L8_2.find
    L9_2 = tostring
    L10_2 = L6_2
    L9_2 = L9_2(L10_2)
    L10_2 = L1_2
    L11_2 = 1
    L12_2 = true
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    if not L8_2 then
      L8_2 = string
      L8_2 = L8_2.find
      L9_2 = tostring
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      L10_2 = L1_2
      L11_2 = 1
      L12_2 = true
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    end
    if L8_2 then
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
            goto lbl_66
          end
        end
      end
      L9_2 = tostring
      L10_2 = L6_2
      L9_2 = L9_2(L10_2)
      L10_2 = L9_2
      L9_2 = L9_2.gsub
      L11_2 = "%s+"
      L12_2 = ""
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      if "" ~= L9_2 then
        L10_2 = GetResourceState
        L11_2 = "RevoInteract"
        L10_2 = L10_2(L11_2)
        if "started" == L10_2 then
          L10_2 = exports
          L10_2 = L10_2.RevoInteract
          L11_2 = L10_2
          L10_2 = L10_2.CloseHelp
          L12_2 = L9_2
          L10_2(L11_2, L12_2)
        else
          L10_2 = HideTextOption
          L10_2()
          goto lbl_83
          ::lbl_66::
          L9_2 = Config
          L9_2 = L9_2.Target
          if "ox_target" == L9_2 then
            L9_2 = exports
            L9_2 = L9_2.ox_target
            L10_2 = L9_2
            L9_2 = L9_2.removeZone
            L11_2 = L7_2
            L9_2(L10_2, L11_2)
          else
            L9_2 = exports
            L10_2 = Config
            L10_2 = L10_2.Target
            L9_2 = L9_2[L10_2]
            L10_2 = L9_2
            L9_2 = L9_2.RemoveZone
            L11_2 = L6_2
            L9_2(L10_2, L11_2)
          end
        end
      end
      ::lbl_83::
      L9_2 = L13_1
      L9_2[L6_2] = nil
    end
  end
end
function L69_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = L58_1
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = "^"
  L2_2 = L49_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = "_Step:%d+end"
  L1_2 = L1_2 .. L2_2 .. L3_2
  L2_2 = pairs
  L3_2 = L6_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    if "string" == L8_2 then
      L8_2 = string
      L8_2 = L8_2.match
      L9_2 = L6_2
      L10_2 = L1_2
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 then
        L8_2 = DoesEntityExist
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L8_2 = L38_1
          L9_2 = L7_2
          L8_2(L9_2)
        end
        L8_2 = L6_1
        L8_2[L6_2] = nil
      end
    end
  end
  L2_2 = pairs
  L3_2 = AllDoorData
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 then
      L8_2 = tostring
      L9_2 = L7_2.Robbery
      L8_2 = L8_2(L9_2)
      L9_2 = tostring
      L10_2 = A0_2
      L9_2 = L9_2(L10_2)
      if L8_2 == L9_2 then
        L8_2 = AllDoorData
        L8_2[L6_2] = nil
      end
    end
  end
end
function L70_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = pairs
  L1_2 = L13_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = GetResourceState
    L7_2 = "RevoInteract"
    L6_2 = L6_2(L7_2)
    if "started" ~= L6_2 then
      L6_2 = Config
      L6_2 = L6_2.Target
      if L6_2 then
        L6_2 = Config
        L6_2 = L6_2.DrawTextInsteadOfTarget
        if not L6_2 then
          goto lbl_41
        end
      end
    end
    L6_2 = tostring
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    L7_2 = L6_2
    L6_2 = L6_2.gsub
    L8_2 = "%s+"
    L9_2 = ""
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    if "" ~= L6_2 then
      L7_2 = GetResourceState
      L8_2 = "RevoInteract"
      L7_2 = L7_2(L8_2)
      if "started" == L7_2 then
        L7_2 = exports
        L7_2 = L7_2.RevoInteract
        L8_2 = L7_2
        L7_2 = L7_2.CloseHelp
        L9_2 = L6_2
        L7_2(L8_2, L9_2)
      else
        L7_2 = HideTextOption
        L7_2()
        goto lbl_58
        ::lbl_41::
        L6_2 = Config
        L6_2 = L6_2.Target
        if "ox_target" == L6_2 then
          L6_2 = exports
          L6_2 = L6_2.ox_target
          L7_2 = L6_2
          L6_2 = L6_2.removeZone
          L8_2 = L5_2
          L6_2(L7_2, L8_2)
        else
          L6_2 = exports
          L7_2 = Config
          L7_2 = L7_2.Target
          L6_2 = L6_2[L7_2]
          L7_2 = L6_2
          L6_2 = L6_2.RemoveZone
          L8_2 = L4_2
          L6_2(L7_2, L8_2)
        end
      end
    end
    ::lbl_58::
    L6_2 = L13_1
    L6_2[L4_2] = nil
  end
end
function L71_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = L59_1
  L1_2 = true
  L0_2(L1_2)
  L0_2 = pairs
  L1_2 = L6_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = L38_1
      L7_2 = L5_2
      L6_2(L7_2)
    end
    L6_2 = L6_1
    L6_2[L4_2] = nil
  end
  L0_2 = {}
  AllDoorData = L0_2
end
function L72_1()
  local L0_2, L1_2
  L0_2 = L71_1
  L0_2()
  L0_2 = L70_1
  L0_2()
  L0_2 = {}
  LaserTable = L0_2
  L0_2 = {}
  L16_1 = L0_2
  L0_2 = {}
  L17_1 = L0_2
  L0_2 = {}
  L18_1 = L0_2
  L0_2 = {}
  L12_1 = L0_2
  L0_2 = {}
  L14_1 = L0_2
  L0_2 = {}
  L15_1 = L0_2
  L0_2 = {}
  L5_1 = L0_2
end
function L73_1()
  local L0_2, L1_2
  L0_2 = L11_1
  if L0_2 then
    return
  end
  L0_2 = true
  L11_1 = L0_2
  L0_2 = DestroyAllProps
  L0_2()
  L0_2 = L72_1
  L0_2()
end
function L74_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = L5_1
  L1_2 = #L1_2
  L2_2 = 1
  L3_2 = -1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L5_1
    L5_2 = L5_2[L4_2]
    L5_2 = L5_2.heist_name
    if L5_2 == A0_2 then
      L5_2 = table
      L5_2 = L5_2.remove
      L6_2 = L5_1
      L7_2 = L4_2
      L5_2(L6_2, L7_2)
    end
  end
  L1_2 = L17_1
  L1_2[A0_2] = nil
  L1_2 = L14_1
  L1_2[A0_2] = nil
  L1_2 = "^"
  L2_2 = L49_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2 .. L2_2
  L2_2 = pairs
  L3_2 = L18_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2 in L2_2, L3_2, L4_2, L5_2 do
    L7_2 = type
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if "string" == L7_2 then
      L7_2 = string
      L7_2 = L7_2.match
      L8_2 = L6_2
      L9_2 = L1_2
      L7_2 = L7_2(L8_2, L9_2)
      if L7_2 then
        L7_2 = L18_1
        L7_2[L6_2] = nil
      end
    end
  end
end
function L75_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L14_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = L14_1
    L3_2 = {}
    L2_2[A0_2] = L3_2
  end
  L2_2 = L14_1
  L2_2 = L2_2[A0_2]
  L2_2[A1_2] = true
  L2_2 = TriggerServerEvent
  L3_2 = "heist:server:startExecutingStep"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
function L76_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L14_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = L14_1
    L2_2 = L2_2[A0_2]
    L2_2[A1_2] = nil
  end
  L2_2 = TriggerServerEvent
  L3_2 = "heist:server:stopExecutingStep"
  L4_2 = A0_2
  L5_2 = A1_2
  L2_2(L3_2, L4_2, L5_2)
end
function L77_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.TriggerCallback
  L4_2 = "heist:server:isSimultaneousStepActive"
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    if A0_3 then
      L1_3 = PrintDebug
      L2_3 = "Proceeding with step"
      L3_3 = A1_2
      L4_3 = "of heist"
      L5_3 = A0_2
      L1_3(L2_3, L3_3, L4_3, L5_3)
      L1_3 = A2_2
      L2_3 = true
      L1_3(L2_3)
    else
      L1_3 = PrintDebug
      L2_3 = "Cannot proceed with step"
      L3_3 = A1_2
      L4_3 = "because the required simultaneous step is not active."
      L1_3(L2_3, L3_3, L4_3)
      L1_3 = A2_2
      L2_3 = false
      L1_3(L2_3)
    end
  end
  L6_2 = A0_2
  L7_2 = A1_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
end
function L78_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = ipairs
  L2_2 = Config
  L2_2 = L2_2.CustomDoorModels
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = tostring
    L8_2 = A0_2
    L7_2 = L7_2(L8_2)
    if L7_2 == L6_2 then
      L7_2 = true
      return L7_2
    end
  end
  L1_2 = false
  return L1_2
end
L19_1 = L78_1
function L78_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = bobcatVaultdooropen
  if L0_2 then
    L0_2 = bobcatVaultdooropen
    if L0_2 then
      L0_2 = {}
      L0_2.x = 888.12
      L0_2.y = -2130.54
      L0_2.z = 31.24
      L1_2 = GetRayfireMapObject
      L2_2 = L0_2.x
      L3_2 = L0_2.y
      L4_2 = L0_2.z
      L5_2 = 10.0
      L6_2 = "DES_VaultDoor001"
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
      L2_2 = SetStateOfRayfireMapObject
      L3_2 = L1_2
      L4_2 = 4
      L2_2(L3_2, L4_2)
      bobcatVaultdooropen = false
    end
  end
end
function L79_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = "none"
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:IsRobberyOnCooldown"
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    if A0_3 then
      L2_3 = PrintDebug
      L3_3 = "Robbery '"
      L4_3 = A0_2
      L5_3 = "' is on cooldown for another "
      L6_3 = A1_3
      L7_3 = " seconds."
      L3_3 = L3_3 .. L4_3 .. L5_3 .. L6_3 .. L7_3
      L2_3(L3_3)
      L1_2 = A0_3
    else
      L2_3 = PrintDebug
      L3_3 = "Robbery '"
      L4_3 = A0_2
      L5_3 = "' is available."
      L3_3 = L3_3 .. L4_3 .. L5_3
      L2_3(L3_3)
      L1_2 = A0_3
    end
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
IsRobberyOnCooldown = L79_1
function L79_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 24
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 257
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 25
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 263
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 44
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 2
  L2_2 = 36
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 264
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 257
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 140
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 141
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 142
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
  L0_2 = DisableControlAction
  L1_2 = 0
  L2_2 = 143
  L3_2 = true
  L0_2(L1_2, L2_2, L3_2)
end
function L80_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = tonumber
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = tonumber
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = tonumber
      L4_2 = A2_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L3_2 = GetGroundZFor_3dCoord
        L4_2 = A0_2 + 0.0
        L5_2 = A1_2 + 0.0
        L6_2 = A2_2 + 0.0
        L7_2 = Citizen
        L7_2 = L7_2.ReturnResultAnyway
        L7_2 = L7_2()
        L3_2, L4_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
        return L4_2
    end
  end
  else
    L3_2 = 0.0
    return L3_2
  end
end
GetGroundZ = L80_1
function L80_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = GetEntityCoords
  L4_2 = A0_2
  L5_2 = false
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = GetEntityHeading
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = 0.0
  end
  L4_2 = L4_2 + L5_2
  L5_2 = math
  L5_2 = L5_2.pi
  L4_2 = L4_2 * L5_2
  L4_2 = L4_2 / 180.0
  L5_2 = {}
  L6_2 = L3_2.x
  L7_2 = math
  L7_2 = L7_2.sin
  L8_2 = -1.0 * L4_2
  L7_2 = L7_2(L8_2)
  L7_2 = A1_2 * L7_2
  L6_2 = L6_2 + L7_2
  L5_2.x = L6_2
  L6_2 = L3_2.y
  L7_2 = math
  L7_2 = L7_2.cos
  L8_2 = -1.0 * L4_2
  L7_2 = L7_2(L8_2)
  L7_2 = A1_2 * L7_2
  L6_2 = L6_2 + L7_2
  L5_2.y = L6_2
  L6_2 = L3_2.z
  L5_2.z = L6_2
  return L5_2
end
GetCoordsInfrontOfEntityWithDistance = L80_1
function L80_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = DoesEntityExist
  L1_2 = TabletProp
  L0_2 = L0_2(L1_2)
  if not L0_2 then
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = loadAnimDict
    L3_2 = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a"
    L2_2(L3_2)
    L2_2 = TaskPlayAnim
    L3_2 = L0_2
    L4_2 = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a"
    L5_2 = "idle_a"
    L6_2 = 2.0
    L7_2 = 2.0
    L8_2 = -1
    L9_2 = 51
    L10_2 = 0
    L11_2 = false
    L12_2 = false
    L13_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L2_2 = CreateObject
    L3_2 = GetHashKey
    L4_2 = "prop_cs_tablet"
    L3_2 = L3_2(L4_2)
    L4_2 = L1_2.x
    L5_2 = L1_2.y
    L6_2 = L1_2.z
    L7_2 = true
    L8_2 = true
    L9_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    TabletProp = L2_2
    L2_2 = AttachEntityToEntity
    L3_2 = TabletProp
    L4_2 = L0_2
    L5_2 = GetPedBoneIndex
    L6_2 = L0_2
    L7_2 = 28422
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = -0.05
    L7_2 = 0.0
    L8_2 = 0.0
    L9_2 = 0.0
    L10_2 = 0.0
    L11_2 = 0.0
    L12_2 = true
    L13_2 = true
    L14_2 = false
    L15_2 = true
    L16_2 = 1
    L17_2 = true
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  end
end
TabletEmote = L80_1
function L80_1()
  local L0_2, L1_2, L2_2
  L0_2 = ClearPedTasks
  L1_2 = PlayerPedId
  L1_2, L2_2 = L1_2()
  L0_2(L1_2, L2_2)
  L0_2 = DoesEntityExist
  L1_2 = TabletProp
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L0_2 = TriggerEvent
    L1_2 = "FullyDeleteRobberiesEntity"
    L2_2 = TabletProp
    L0_2(L1_2, L2_2)
  end
end
StopTabletEmote = L80_1
function L80_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = string
  L1_2 = L1_2.gsub
  L2_2 = A0_2
  L3_2 = "^%s*(.-)%s*$"
  L4_2 = "%1"
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  return L1_2
end
PugTrim = L80_1
function L80_1(A0_2)
  local L1_2, L2_2, L3_2
  if 0 == A0_2 then
    return
  end
  L1_2 = PugTrim
  L2_2 = GetVehicleNumberPlateText
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  return L1_2(L2_2, L3_2)
end
PugGetPlate = L80_1
function L80_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L1_2 = DoesEntityExist
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = GetVehicleExtraColours
    L2_2 = A0_2
    L1_2, L2_2 = L1_2(L2_2)
    L3_2 = GetVehicleColours
    L4_2 = A0_2
    L3_2, L4_2 = L3_2(L4_2)
    L5_2 = GetIsVehiclePrimaryColourCustom
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = GetVehicleCustomPrimaryColour
      L6_2 = A0_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      L8_2 = {}
      L9_2 = L5_2
      L10_2 = L6_2
      L11_2 = L7_2
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L3_2 = L8_2
    end
    L5_2 = GetIsVehicleSecondaryColourCustom
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = GetVehicleCustomSecondaryColour
      L6_2 = A0_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      L8_2 = {}
      L9_2 = L5_2
      L10_2 = L6_2
      L11_2 = L7_2
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L4_2 = L8_2
    end
    L5_2 = {}
    L6_2 = 0
    L7_2 = 12
    L8_2 = 1
    for L9_2 = L6_2, L7_2, L8_2 do
      L10_2 = DoesExtraExist
      L11_2 = A0_2
      L12_2 = L9_2
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 then
        L10_2 = IsVehicleExtraTurnedOn
        L11_2 = A0_2
        L12_2 = L9_2
        L10_2 = L10_2(L11_2, L12_2)
        L10_2 = 1 == L10_2
        L11_2 = tostring
        L12_2 = L9_2
        L11_2 = L11_2(L12_2)
        L5_2[L11_2] = L10_2
      end
    end
    L6_2 = GetVehicleMod
    L7_2 = A0_2
    L8_2 = 48
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = GetVehicleMod
    L8_2 = A0_2
    L9_2 = 48
    L7_2 = L7_2(L8_2, L9_2)
    if -1 == L7_2 then
      L7_2 = GetVehicleLivery
      L8_2 = A0_2
      L7_2 = L7_2(L8_2)
      if 0 ~= L7_2 then
        L7_2 = GetVehicleLivery
        L8_2 = A0_2
        L7_2 = L7_2(L8_2)
        L6_2 = L7_2
      end
    end
    L7_2 = {}
    L8_2 = 0
    L9_2 = 3
    L10_2 = 1
    for L11_2 = L8_2, L9_2, L10_2 do
      L12_2 = GetVehicleWheelHealth
      L13_2 = A0_2
      L14_2 = L11_2
      L12_2 = L12_2(L13_2, L14_2)
      L7_2[L11_2] = L12_2
    end
    L8_2 = {}
    L9_2 = 0
    L10_2 = 5
    L11_2 = 1
    for L12_2 = L9_2, L10_2, L11_2 do
      L13_2 = IsVehicleTyreBurst
      L14_2 = A0_2
      L15_2 = L12_2
      L16_2 = false
      L13_2 = L13_2(L14_2, L15_2, L16_2)
      L8_2[L12_2] = L13_2
    end
    L9_2 = {}
    L10_2 = 0
    L11_2 = 5
    L12_2 = 1
    for L13_2 = L10_2, L11_2, L12_2 do
      L14_2 = IsVehicleTyreBurst
      L15_2 = A0_2
      L16_2 = L13_2
      L17_2 = true
      L14_2 = L14_2(L15_2, L16_2, L17_2)
      L9_2[L13_2] = L14_2
    end
    L10_2 = {}
    L11_2 = 0
    L12_2 = 7
    L13_2 = 1
    for L14_2 = L11_2, L12_2, L13_2 do
      L15_2 = IsVehicleWindowIntact
      L16_2 = A0_2
      L17_2 = L14_2
      L15_2 = L15_2(L16_2, L17_2)
      L15_2 = 1 == L15_2
      L10_2[L14_2] = L15_2
    end
    L11_2 = {}
    L12_2 = 0
    L13_2 = 5
    L14_2 = 1
    for L15_2 = L12_2, L13_2, L14_2 do
      L16_2 = IsVehicleDoorDamaged
      L17_2 = A0_2
      L18_2 = L15_2
      L16_2 = L16_2(L17_2, L18_2)
      L16_2 = 1 == L16_2
      L11_2[L15_2] = L16_2
    end
    L12_2 = nil
    L13_2 = GetVehicleXenonLightsCustomColor
    L14_2 = A0_2
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
    if L13_2 then
      L17_2 = table
      L17_2 = L17_2.pack
      L18_2 = L14_2
      L19_2 = L15_2
      L20_2 = L16_2
      L17_2 = L17_2(L18_2, L19_2, L20_2)
      L12_2 = L17_2
    else
      L17_2 = GetVehicleXenonLightsColor
      L18_2 = A0_2
      L17_2 = L17_2(L18_2)
      L12_2 = L17_2
    end
    L17_2 = {}
    L18_2 = GetEntityModel
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.model = L18_2
    L18_2 = PugGetPlate
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.plate = L18_2
    L18_2 = GetVehicleNumberPlateTextIndex
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.plateIndex = L18_2
    L18_2 = math
    L18_2 = L18_2.ceil
    L19_2 = GetVehicleBodyHealth
    L20_2 = A0_2
    L19_2 = L19_2(L20_2)
    L20_2 = 0.1
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.bodyHealth = L18_2
    L18_2 = math
    L18_2 = L18_2.ceil
    L19_2 = GetVehicleEngineHealth
    L20_2 = A0_2
    L19_2 = L19_2(L20_2)
    L20_2 = 0.1
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.engineHealth = L18_2
    L18_2 = math
    L18_2 = L18_2.ceil
    L19_2 = GetVehiclePetrolTankHealth
    L20_2 = A0_2
    L19_2 = L19_2(L20_2)
    L20_2 = 0.1
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.tankHealth = L18_2
    L18_2 = math
    L18_2 = L18_2.ceil
    L19_2 = GetVehicleFuelLevel
    L20_2 = A0_2
    L19_2 = L19_2(L20_2)
    L20_2 = 0.1
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.fuelLevel = L18_2
    L18_2 = math
    L18_2 = L18_2.ceil
    L19_2 = GetVehicleDirtLevel
    L20_2 = A0_2
    L19_2 = L19_2(L20_2)
    L20_2 = 0.1
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.dirtLevel = L18_2
    L18_2 = math
    L18_2 = L18_2.ceil
    L19_2 = GetVehicleOilLevel
    L20_2 = A0_2
    L19_2 = L19_2(L20_2)
    L20_2 = 0.1
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.oilLevel = L18_2
    L17_2.color1 = L3_2
    L17_2.color2 = L4_2
    L17_2.pearlescentColor = L1_2
    L18_2 = GetVehicleDashboardColour
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.dashboardColor = L18_2
    L17_2.wheelColor = L2_2
    L18_2 = GetVehicleWheelType
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.wheels = L18_2
    L18_2 = GetVehicleWheelSize
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.wheelSize = L18_2
    L18_2 = GetVehicleWheelWidth
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.wheelWidth = L18_2
    L17_2.tireHealth = L7_2
    L17_2.tireBurstState = L8_2
    L17_2.tireBurstCompletely = L9_2
    L18_2 = GetVehicleWindowTint
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.windowTint = L18_2
    L17_2.windowStatus = L10_2
    L17_2.doorStatus = L11_2
    L18_2 = {}
    L19_2 = IsVehicleNeonLightEnabled
    L20_2 = A0_2
    L21_2 = 0
    L19_2 = L19_2(L20_2, L21_2)
    L20_2 = IsVehicleNeonLightEnabled
    L21_2 = A0_2
    L22_2 = 1
    L20_2 = L20_2(L21_2, L22_2)
    L21_2 = IsVehicleNeonLightEnabled
    L22_2 = A0_2
    L23_2 = 2
    L21_2 = L21_2(L22_2, L23_2)
    L22_2 = IsVehicleNeonLightEnabled
    L23_2 = A0_2
    L24_2 = 3
    L22_2, L23_2, L24_2 = L22_2(L23_2, L24_2)
    L18_2[1] = L19_2
    L18_2[2] = L20_2
    L18_2[3] = L21_2
    L18_2[4] = L22_2
    L18_2[5] = L23_2
    L18_2[6] = L24_2
    L17_2.neonEnabled = L18_2
    L18_2 = table
    L18_2 = L18_2.pack
    L19_2 = GetVehicleNeonLightsColour
    L20_2 = A0_2
    L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L19_2(L20_2)
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
    L17_2.neonColor = L18_2
    L18_2 = GetVehicleInteriorColour
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.interiorColor = L18_2
    L17_2.extras = L5_2
    L18_2 = table
    L18_2 = L18_2.pack
    L19_2 = GetVehicleTyreSmokeColor
    L20_2 = A0_2
    L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L19_2(L20_2)
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
    L17_2.tyreSmokeColor = L18_2
    L17_2.xenonColor = L12_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 0
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modSpoilers = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 1
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modFrontBumper = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 2
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modRearBumper = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 3
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modSideSkirt = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 4
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modExhaust = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 5
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modFrame = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 6
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modGrille = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 7
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modHood = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 8
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modFender = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 9
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modRightFender = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 10
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modRoof = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 11
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modEngine = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 12
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modBrakes = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 13
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modTransmission = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 14
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modHorns = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 15
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modSuspension = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 16
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modArmor = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 17
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modKit17 = L18_2
    L18_2 = IsToggleModOn
    L19_2 = A0_2
    L20_2 = 18
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modTurbo = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 19
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modKit19 = L18_2
    L18_2 = IsToggleModOn
    L19_2 = A0_2
    L20_2 = 20
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modSmokeEnabled = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 21
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modKit21 = L18_2
    L18_2 = IsToggleModOn
    L19_2 = A0_2
    L20_2 = 22
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modXenon = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 23
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modFrontWheels = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 24
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modBackWheels = L18_2
    L18_2 = GetVehicleModVariation
    L19_2 = A0_2
    L20_2 = 23
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modCustomTiresF = L18_2
    L18_2 = GetVehicleModVariation
    L19_2 = A0_2
    L20_2 = 24
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modCustomTiresR = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 25
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modPlateHolder = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 26
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modVanityPlate = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 27
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modTrimA = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 28
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modOrnaments = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 29
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modDashboard = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 30
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modDial = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 31
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modDoorSpeaker = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 32
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modSeats = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 33
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modSteeringWheel = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 34
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modShifterLeavers = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 35
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modAPlate = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 36
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modSpeakers = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 37
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modTrunk = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 38
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modHydrolic = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 39
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modEngineBlock = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 40
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modAirFilter = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 41
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modStruts = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 42
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modArchCover = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 43
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modAerials = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 44
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modTrimB = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 45
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modTank = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 46
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modWindows = L18_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 47
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modKit47 = L18_2
    L17_2.modLivery = L6_2
    L18_2 = GetVehicleMod
    L19_2 = A0_2
    L20_2 = 49
    L18_2 = L18_2(L19_2, L20_2)
    L17_2.modKit49 = L18_2
    L18_2 = GetVehicleRoofLivery
    L19_2 = A0_2
    L18_2 = L18_2(L19_2)
    L17_2.liveryRoof = L18_2
    return L17_2
  else
    return
  end
end
PugGetVehicleProperties = L80_1
function L80_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.UniqueBankDoors
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.location
    L7_2 = A0_2 - L7_2
    L7_2 = #L7_2
    if L7_2 <= 15 then
      L7_2 = Config
      L7_2 = L7_2.UniqueBankDoors
      L7_2 = L7_2[L5_2]
      L7_2.status = false
    end
  end
end
function L81_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.UniqueBankDoors
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.location
    L7_2 = A0_2 - L7_2
    L7_2 = #L7_2
    if L7_2 <= 15 then
      L7_2 = Config
      L7_2 = L7_2.UniqueBankDoors
      L7_2 = L7_2[L5_2]
      L7_2.status = true
    end
  end
end
L82_1 = RegisterNetEvent
L83_1 = "Pug:client:OpenBanDoorForEveryone"
function L84_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = json
  L3_2 = L3_2.decode
  L4_2 = A1_2.settings
  L3_2 = L3_2(L4_2)
  L4_2 = type
  L5_2 = L3_2.robberyCooldown
  L4_2 = L4_2(L5_2)
  if "string" == L4_2 then
    L4_2 = tonumber
    L5_2 = L3_2.robberyCooldown
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L4_2 = 1
    end
    L3_2.robberyCooldown = L4_2
  end
  L4_2 = L3_2.robberyCooldown
  L4_2 = L4_2 * 60000
  L6_2 = A1_2.heist_name
  L5_2 = L12_1
  L5_2 = L5_2[L6_2]
  if not L5_2 then
    L6_2 = A1_2.heist_name
    L5_2 = L12_1
    L7_2 = {}
    L5_2[L6_2] = L7_2
  end
  L6_2 = A1_2.heist_name
  L5_2 = L12_1
  L5_2 = L5_2[L6_2]
  L6_2 = GetGameTimer
  L6_2 = L6_2()
  L6_2 = L6_2 + L4_2
  L5_2[A2_2] = L6_2
  L5_2 = L81_1
  L6_2 = A0_2
  L5_2(L6_2)
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
    L0_3 = 10000
    while true do
      L2_3 = A1_2.heist_name
      L1_3 = L12_1
      L1_3 = L1_3[L2_3]
      L2_3 = A2_2
      L1_3 = L1_3[L2_3]
      if L1_3 then
        L1_3 = GetGameTimer
        L1_3 = L1_3()
        L3_3 = A1_2.heist_name
        L2_3 = L12_1
        L2_3 = L2_3[L3_3]
        L3_3 = A2_2
        L2_3 = L2_3[L3_3]
        if L1_3 >= L2_3 then
          L1_3 = L80_1
          L2_3 = A0_2
          L1_3(L2_3)
          L2_3 = A1_2.heist_name
          L1_3 = L12_1
          L1_3 = L1_3[L2_3]
          L2_3 = A2_2
          L1_3[L2_3] = nil
          break
        else
          L1_3 = GetEntityCoords
          L2_3 = PlayerPedId
          L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L2_3()
          L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
          L2_3 = A0_2
          L1_3 = L1_3 - L2_3
          L1_3 = #L1_3
          if L1_3 >= 45 then
            while true do
              L1_3 = GetEntityCoords
              L2_3 = PlayerPedId
              L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L2_3()
              L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
              L2_3 = A0_2
              L1_3 = L1_3 - L2_3
              L1_3 = #L1_3
              if not (L1_3 >= 45) then
                break
              end
              L2_3 = A1_2.heist_name
              L1_3 = L12_1
              L1_3 = L1_3[L2_3]
              L2_3 = A2_2
              L1_3 = L1_3[L2_3]
              if L1_3 then
                L1_3 = GetGameTimer
                L1_3 = L1_3()
                L3_3 = A1_2.heist_name
                L2_3 = L12_1
                L2_3 = L2_3[L3_3]
                L3_3 = A2_2
                L2_3 = L2_3[L3_3]
                if L1_3 >= L2_3 then
                  L2_3 = A1_2.heist_name
                  L1_3 = L12_1
                  L1_3 = L1_3[L2_3]
                  L2_3 = A2_2
                  L1_3[L2_3] = nil
                  L1_3 = L80_1
                  L2_3 = A0_2
                  L1_3(L2_3)
                  break
                end
              else
                break
              end
              L1_3 = Wait
              L2_3 = 1000
              L1_3(L2_3)
            end
          end
          L2_3 = A1_2.heist_name
          L1_3 = L12_1
          L1_3 = L1_3[L2_3]
          L2_3 = A2_2
          L1_3 = L1_3[L2_3]
          if not L1_3 then
            break
          end
          L1_3 = GetGameTimer
          L1_3 = L1_3()
          L3_3 = A1_2.heist_name
          L2_3 = L12_1
          L2_3 = L2_3[L3_3]
          L3_3 = A2_2
          L2_3 = L2_3[L3_3]
          if L1_3 >= L2_3 then
            L2_3 = A1_2.heist_name
            L1_3 = L12_1
            L1_3 = L1_3[L2_3]
            L2_3 = A2_2
            L1_3[L2_3] = nil
            L1_3 = L80_1
            L2_3 = A0_2
            L1_3(L2_3)
            break
          else
            L1_3 = pairs
            L2_3 = Config
            L2_3 = L2_3.BankDoorModels
            L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
            for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
              L7_3 = nil
              L8_3 = GetClosestObjectOfType
              L9_3 = A0_2.x
              L10_3 = A0_2.y
              L11_3 = A0_2.z
              L12_3 = 2.0
              L13_3 = GetHashKey
              L14_3 = L6_3
              L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L13_3(L14_3)
              L8_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
              if 0 ~= L8_3 then
                L9_3 = GetEntityHeading
                L10_3 = L8_3
                L9_3 = L9_3(L10_3)
                L7_3 = true
                L10_3 = math
                L10_3 = L10_3.abs
                L11_3 = L0_3 - L9_3
                L10_3 = L10_3(L11_3)
                if L10_3 > 20.0 then
                  L10_3 = 0.1
                  L11_3 = pairs
                  L12_3 = Config
                  L12_3 = L12_3.UniqueBankDoors
                  L11_3, L12_3, L13_3, L14_3 = L11_3(L12_3)
                  for L15_3, L16_3 in L11_3, L12_3, L13_3, L14_3 do
                    L17_3 = A0_2
                    L18_3 = L16_3.location
                    L17_3 = L17_3 - L18_3
                    L17_3 = #L17_3
                    if L17_3 <= 25 then
                      L17_3 = L16_3.ReverseHeading
                      if L17_3 then
                        L10_3 = -0.1
                      end
                    end
                  end
                  L11_3 = CreateThread
                  function L12_3()
                    local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4
                    L0_4 = 0
                    while true do
                      L1_4 = 900
                      if not (L0_4 < L1_4) then
                        break
                      end
                      L0_4 = L0_4 + 1
                      L1_4 = GetEntityHeading
                      L2_4 = L8_3
                      L1_4 = L1_4(L2_4)
                      L2_4 = L10_3
                      L2_4 = L1_4 - L2_4
                      L3_4 = SetEntityHeading
                      L4_4 = L8_3
                      L5_4 = L2_4
                      L3_4(L4_4, L5_4)
                      L3_4 = 900
                      if L0_4 > L3_4 then
                        break
                      end
                      L0_3 = L2_4
                      L3_4 = Wait
                      L4_4 = 10
                      L3_4(L4_4)
                    end
                  end
                  L11_3(L12_3)
                end
              end
              if L7_3 then
                break
              end
            end
            L1_3 = GetEntityCoords
            L2_3 = PlayerPedId
            L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L2_3()
            L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
            L2_3 = A0_2
            L1_3 = L1_3 - L2_3
            L1_3 = #L1_3
            if L1_3 <= 45 then
              while true do
                L1_3 = GetEntityCoords
                L2_3 = PlayerPedId
                L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L2_3()
                L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)
                L2_3 = A0_2
                L1_3 = L1_3 - L2_3
                L1_3 = #L1_3
                if not (L1_3 <= 45) then
                  goto lbl_216
                end
                L2_3 = A1_2.heist_name
                L1_3 = L12_1
                L1_3 = L1_3[L2_3]
                L2_3 = A2_2
                L1_3 = L1_3[L2_3]
                if L1_3 then
                  L1_3 = GetGameTimer
                  L1_3 = L1_3()
                  L3_3 = A1_2.heist_name
                  L2_3 = L12_1
                  L2_3 = L2_3[L3_3]
                  L3_3 = A2_2
                  L2_3 = L2_3[L3_3]
                  if L1_3 >= L2_3 then
                    L2_3 = A1_2.heist_name
                    L1_3 = L12_1
                    L1_3 = L1_3[L2_3]
                    L2_3 = A2_2
                    L1_3[L2_3] = nil
                    L1_3 = L80_1
                    L2_3 = A0_2
                    L1_3(L2_3)
                    break
                  end
                else
                  break
                end
                L1_3 = Wait
                L2_3 = 1000
                L1_3(L2_3)
              end
              goto lbl_221
              break
            end
          end
        end
        ::lbl_216::
      else
        L1_3 = L80_1
        L2_3 = A0_2
        L1_3(L2_3)
        break
      end
      ::lbl_221::
      L1_3 = Wait
      L2_3 = 1000
      L1_3(L2_3)
    end
    L1_3 = L80_1
    L2_3 = A0_2
    L1_3(L2_3)
  end
  L5_2(L6_2)
end
L82_1(L83_1, L84_1)
L82_1 = RegisterNetEvent
L83_1 = "Pug:client:RemoveBankDoorState"
function L84_1(A0_2, A1_2)
  local L2_2
  L2_2 = L12_1
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = L12_1
    L2_2 = L2_2[A0_2]
    L2_2 = L2_2[A1_2]
    if L2_2 then
      L2_2 = L12_1
      L2_2 = L2_2[A0_2]
      L2_2[A1_2] = false
    end
  end
end
L82_1(L83_1, L84_1)
L82_1 = CreateThread
function L83_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  while true do
    L0_2 = PlayerPedId
    L0_2 = L0_2()
    L1_2 = GetEntityCoords
    L2_2 = L0_2
    L1_2 = L1_2(L2_2)
    L2_2 = pairs
    L3_2 = Config
    L3_2 = L3_2.UniqueBankDoors
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L8_2 = L7_2.status
      if not L8_2 then
        L8_2 = L7_2.location
        L8_2 = L1_2 - L8_2
        L8_2 = #L8_2
        if L8_2 <= 25 then
          L8_2 = GetClosestObjectOfType
          L9_2 = L7_2.location
          L10_2 = 5.0
          L11_2 = -1185205679
          L12_2 = false
          L13_2 = false
          L14_2 = false
          L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
          if 0 ~= L8_2 then
            L9_2 = SetEntityHeading
            L10_2 = L8_2
            L11_2 = L7_2.LockedHeading
            L9_2(L10_2, L11_2)
          end
        end
      else
        L8_2 = Wait
        L9_2 = 2000
        L8_2(L9_2)
      end
    end
    L2_2 = Wait
    L3_2 = 1000
    L2_2(L3_2)
  end
end
L82_1(L83_1)
function L82_1()
  local L0_2, L1_2, L2_2
  L0_2 = TriggerEvent
  L1_2 = "FullyDeleteRobberiesEntity"
  L2_2 = L1_1
  L0_2(L1_2, L2_2)
  L0_2 = TriggerEvent
  L1_2 = "FullyDeleteRobberiesEntity"
  L2_2 = L2_1
  L0_2(L1_2, L2_2)
  L0_2 = DestroyAllProps
  L0_2()
  SelectedAnimationNumber = 0
  L0_2 = false
  L0_1 = L0_2
  L0_2 = nil
  L1_1 = L0_2
  L0_2 = nil
  L3_1 = L0_2
  L0_2 = nil
  L4_1 = L0_2
  SelectedAnimation = nil
  L0_2 = HideRobberyCreatorPrompt
  L0_2()
end
function L83_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = PlayerPedId
  L5_2 = L5_2()
  L6_2 = type
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if "string" == L6_2 then
    L6_2 = GetHashKey
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
    A0_2 = L6_2 or A0_2
    if not L6_2 then
    end
  end
  L6_2 = IsModelInCdimage
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    return
  end
  if A2_2 then
    L6_2 = type
    L7_2 = A2_2
    L6_2 = L6_2(L7_2)
    if "table" == L6_2 then
      L6_2 = vec3
      L7_2 = A2_2.x
      L8_2 = A2_2.y
      L9_2 = A2_2.z
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      A2_2 = L6_2 or A2_2
      if not L6_2 then
      end
    end
  else
    L6_2 = GetEntityCoords
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    A2_2 = L6_2
  end
  A3_2 = true
  L6_2 = LoadModel
  L7_2 = A0_2
  L6_2(L7_2)
  L6_2 = CreateVehicle
  L7_2 = A0_2
  L8_2 = A2_2.x
  L9_2 = A2_2.y
  L10_2 = A2_2.z
  L11_2 = A2_2.w
  L12_2 = A3_2
  L13_2 = false
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2 = NetworkGetNetworkIdFromEntity
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = SetVehicleHasBeenOwnedByPlayer
  L9_2 = L6_2
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetNetworkIdCanMigrate
  L9_2 = L7_2
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = SetVehicleNeedsToBeHotwired
  L9_2 = L6_2
  L10_2 = false
  L8_2(L9_2, L10_2)
  L8_2 = SetVehRadioStation
  L9_2 = L6_2
  L10_2 = "OFF"
  L8_2(L9_2, L10_2)
  L8_2 = SetVehicleFuelLevel
  L9_2 = L6_2
  L10_2 = 100.0
  L8_2(L9_2, L10_2)
  L8_2 = SetModelAsNoLongerNeeded
  L9_2 = A0_2
  L8_2(L9_2)
  if A1_2 then
    L8_2 = A1_2
    L9_2 = L6_2
    L8_2(L9_2)
  end
end
PugSpawnVehicle = L83_1
L83_1 = {}
L83_1.visible = false
L83_1.cache = nil
function L84_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = {}
  L4_2 = tostring
  L5_2 = A0_2 or L5_2
  if not A0_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  L3_2.key = L4_2
  L4_2 = tostring
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  L3_2.label = L4_2
  L3_2.tone = A2_2
  return L3_2
end
function L85_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = {}
  L2_2 = tostring
  if A0_2 then
    L3_2 = A0_2.title
    if L3_2 then
      goto lbl_10
    end
  end
  L3_2 = ""
  ::lbl_10::
  L2_2 = L2_2(L3_2)
  L1_2.title = L2_2
  L2_2 = tostring
  if A0_2 then
    L3_2 = A0_2.description
    if L3_2 then
      goto lbl_19
    end
  end
  L3_2 = ""
  ::lbl_19::
  L2_2 = L2_2(L3_2)
  L1_2.description = L2_2
  L2_2 = tostring
  if A0_2 then
    L3_2 = A0_2.meta
    if L3_2 then
      goto lbl_28
    end
  end
  L3_2 = ""
  ::lbl_28::
  L2_2 = L2_2(L3_2)
  L1_2.meta = L2_2
  L2_2 = {}
  L1_2.actions = L2_2
  L2_2 = ipairs
  if A0_2 then
    L3_2 = A0_2.actions
    if L3_2 then
      goto lbl_41
    end
  end
  L3_2 = {}
  ::lbl_41::
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 then
      L8_2 = L7_2.key
      if L8_2 then
        L8_2 = L7_2.label
        if L8_2 then
          L8_2 = L1_2.actions
          L9_2 = L1_2.actions
          L9_2 = #L9_2
          L9_2 = L9_2 + 1
          L10_2 = {}
          L11_2 = tostring
          L12_2 = L7_2.key
          L11_2 = L11_2(L12_2)
          L10_2.key = L11_2
          L11_2 = tostring
          L12_2 = L7_2.label
          L11_2 = L11_2(L12_2)
          L10_2.label = L11_2
          L11_2 = L7_2.tone
          if L11_2 then
            L11_2 = tostring
            L12_2 = L7_2.tone
            L11_2 = L11_2(L12_2)
            if L11_2 then
              goto lbl_75
            end
          end
          L11_2 = nil
          ::lbl_75::
          L10_2.tone = L11_2
          L8_2[L9_2] = L10_2
        end
      end
    end
  end
  return L1_2
end
function L86_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L85_1
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = {}
  end
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2.actions
  L2_2 = #L2_2
  if 0 == L2_2 then
    L2_2 = HideRobberyCreatorPrompt
    L2_2()
    return
  end
  L2_2 = json
  L2_2 = L2_2.encode
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = L83_1.visible
  if L3_2 then
    L3_2 = L83_1.cache
    if L3_2 == L2_2 then
      return
    end
  end
  L83_1.visible = true
  L83_1.cache = L2_2
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.type = "rcPromptHud"
  L4_2.visible = true
  L4_2.prompt = L1_2
  L3_2(L4_2)
end
ShowRobberyCreatorPrompt = L86_1
function L86_1()
  local L0_2, L1_2
  L0_2 = L83_1.visible
  if not L0_2 then
    return
  end
  L83_1.visible = false
  L83_1.cache = nil
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.type = "rcPromptHud"
  L1_2.visible = false
  L0_2(L1_2)
end
HideRobberyCreatorPrompt = L86_1
function L86_1(A0_2)
  local L1_2, L2_2
  L1_2 = ShowRobberyCreatorPrompt
  L2_2 = A0_2
  L1_2(L2_2)
end
DrawRobberyCreatorPrompt = L86_1
L86_1 = AddEventHandler
L87_1 = "onResourceStop"
function L88_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = HideRobberyCreatorPrompt
  L1_2()
  L1_2 = L73_1
  L1_2()
end
L86_1(L87_1, L88_1)
function L86_1()
  local L0_2, L1_2
  L0_2 = OriginalMode
  if L0_2 then
    L0_2 = "Free placement mode"
    return L0_2
  end
  L0_2 = "Precision mode active"
  return L0_2
end
function L87_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if "table" ~= L3_2 or not A2_2 then
    L3_2 = {}
    A2_2 = L3_2
  end
  L3_2 = A2_2.changeKey
  if not L3_2 then
    L3_2 = OriginalMode
    if L3_2 then
      L3_2 = "MW / Up / Down"
      if L3_2 then
        goto lbl_21
      end
    end
    L3_2 = "MW"
  end
  ::lbl_21::
  L4_2 = {}
  L5_2 = L84_1
  L6_2 = A2_2.confirmKey
  if not L6_2 then
    L6_2 = "E"
  end
  L7_2 = A2_2.confirmLabel
  if not L7_2 then
    L7_2 = "Confirm placement"
  end
  L8_2 = "primary"
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L84_1
  L7_2 = A2_2.cancelKey
  if not L7_2 then
    L7_2 = "Backspace"
  end
  L8_2 = A2_2.cancelLabel
  if not L8_2 then
    L8_2 = "Cancel"
  end
  L9_2 = "danger"
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2, L8_2, L9_2)
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L4_2[5] = L9_2
  L4_2[6] = L10_2
  L4_2[7] = L11_2
  L4_2[8] = L12_2
  L4_2[9] = L13_2
  L4_2[10] = L14_2
  L4_2[11] = L15_2
  L5_2 = A2_2.saveKey
  if L5_2 then
    L5_2 = A2_2.saveLabel
    if L5_2 then
      L5_2 = table
      L5_2 = L5_2.insert
      L6_2 = L4_2
      L7_2 = 2
      L8_2 = L84_1
      L9_2 = A2_2.saveKey
      L10_2 = A2_2.saveLabel
      L11_2 = "success"
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L8_2(L9_2, L10_2, L11_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    end
  end
  if A1_2 and "" ~= A1_2 then
    L5_2 = #L4_2
    L5_2 = L5_2 + 1
    L6_2 = L84_1
    L7_2 = L3_2
    L8_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2)
    L4_2[L5_2] = L6_2
  end
  L5_2 = A2_2.showRotate
  if false ~= L5_2 then
    L5_2 = #L4_2
    L5_2 = L5_2 + 1
    L6_2 = L84_1
    L7_2 = "Left / Right"
    L8_2 = Config
    L8_2 = L8_2.LangT
    L8_2 = L8_2.ROTATEHEADING
    if not L8_2 then
      L8_2 = "Rotate heading"
    end
    L6_2 = L6_2(L7_2, L8_2)
    L4_2[L5_2] = L6_2
  end
  L5_2 = A2_2.showToggle
  if false ~= L5_2 then
    L5_2 = #L4_2
    L5_2 = L5_2 + 1
    L6_2 = L84_1
    L7_2 = "R"
    L8_2 = A2_2.toggleLabel
    if not L8_2 then
      L8_2 = "Toggle precision mode"
    end
    L6_2 = L6_2(L7_2, L8_2)
    L4_2[L5_2] = L6_2
  end
  L5_2 = OriginalMode
  if not L5_2 then
    L5_2 = #L4_2
    L5_2 = L5_2 + 1
    L6_2 = L84_1
    L7_2 = "W A S D"
    L8_2 = A2_2.moveLabel
    if not L8_2 then
      L8_2 = "Move"
    end
    L6_2 = L6_2(L7_2, L8_2)
    L4_2[L5_2] = L6_2
    L5_2 = #L4_2
    L5_2 = L5_2 + 1
    L6_2 = L84_1
    L7_2 = "Up / Down"
    L8_2 = A2_2.heightLabel
    if not L8_2 then
      L8_2 = "Adjust height"
    end
    L6_2 = L6_2(L7_2, L8_2)
    L4_2[L5_2] = L6_2
  end
  L5_2 = type
  L6_2 = A2_2.extraActions
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = ipairs
    L6_2 = A2_2.extraActions
    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
      if L10_2 then
        L11_2 = L10_2.key
        if L11_2 then
          L11_2 = L10_2.label
          if L11_2 then
            L11_2 = #L4_2
            L11_2 = L11_2 + 1
            L12_2 = L84_1
            L13_2 = L10_2.key
            L14_2 = L10_2.label
            L15_2 = L10_2.tone
            L12_2 = L12_2(L13_2, L14_2, L15_2)
            L4_2[L11_2] = L12_2
          end
        end
      end
    end
  end
  L5_2 = {}
  L5_2.title = A0_2
  L6_2 = A2_2.description
  if not L6_2 then
    L6_2 = ""
  end
  L5_2.description = L6_2
  L6_2 = A2_2.meta
  if not L6_2 then
    L6_2 = L86_1
    L6_2 = L6_2()
  end
  L5_2.meta = L6_2
  L5_2.actions = L4_2
  return L5_2
end
BuildRobberyCreatorPlacementPrompt = L87_1
function L87_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = EditingFeatureItem
  L3_2 = "peds" == L3_2
  L4_2 = BuildRobberyCreatorPlacementPrompt
  if L3_2 then
    L5_2 = "Animation Placement"
    if L5_2 then
      goto lbl_13
    end
  end
  L5_2 = "Object Placement"
  ::lbl_13::
  if L3_2 then
    L6_2 = Config
    L6_2 = L6_2.LangT
    L6_2 = L6_2.ANIMATION
    if L6_2 then
      goto lbl_29
    end
    L6_2 = "Change animation"
    if L6_2 then
      goto lbl_29
    end
  end
  L6_2 = Config
  L6_2 = L6_2.LangT
  L6_2 = L6_2.CHANGEPROP
  if not L6_2 then
    L6_2 = "Change prop"
  end
  ::lbl_29::
  L7_2 = {}
  if L3_2 then
    L8_2 = "Confirm animation"
    if L8_2 then
      goto lbl_37
    end
  end
  L8_2 = "Confirm placement"
  ::lbl_37::
  L7_2.confirmLabel = L8_2
  if A2_2 then
    L8_2 = A2_2.allowSaveAndExit
    if L8_2 then
      L8_2 = "Enter"
      if L8_2 then
        goto lbl_47
      end
    end
  end
  L8_2 = nil
  ::lbl_47::
  L7_2.saveKey = L8_2
  if A2_2 then
    L8_2 = A2_2.allowSaveAndExit
    if L8_2 then
      L8_2 = "Save and exit"
      if L8_2 then
        goto lbl_57
      end
    end
  end
  L8_2 = nil
  ::lbl_57::
  L7_2.saveLabel = L8_2
  return L4_2(L5_2, L6_2, L7_2)
end
setupScaleform = L87_1
function L87_1(A0_2)
  local L1_2, L2_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2 or A0_2
  if not L1_2 then
    A0_2 = 0.0
  end
  while true do
    L1_2 = 360.0
    if not (A0_2 >= L1_2) then
      break
    end
    A0_2 = A0_2 - 360.0
  end
  while A0_2 < 0.0 do
    A0_2 = A0_2 + 360.0
  end
  return A0_2
end
function L88_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = EditingFeatureItem
  L0_2 = "sell_trader_animation" == L0_2
  L1_2 = BuildRobberyCreatorPlacementPrompt
  if L0_2 then
    L2_2 = "Animation Placement"
    if L2_2 then
      goto lbl_13
    end
  end
  L2_2 = "Sell Trader Ped Placement"
  ::lbl_13::
  if L0_2 then
    L3_2 = Config
    L3_2 = L3_2.LangT
    L3_2 = L3_2.ANIMATION
    if L3_2 then
      goto lbl_24
    end
    L3_2 = "Change animation"
    if L3_2 then
      goto lbl_24
    end
  end
  L3_2 = "Change ped"
  ::lbl_24::
  L4_2 = {}
  if L0_2 then
    L5_2 = "Confirm animation"
    if L5_2 then
      goto lbl_32
    end
  end
  L5_2 = "Confirm ped"
  ::lbl_32::
  L4_2.confirmLabel = L5_2
  if L0_2 then
    L5_2 = "Place your interaction clone and pick the animation."
    if L5_2 then
      goto lbl_39
    end
  end
  L5_2 = "Pick the trader ped model and place the interaction target."
  ::lbl_39::
  L4_2.description = L5_2
  return L1_2(L2_2, L3_2, L4_2)
end
function L89_1()
  local L0_2, L1_2
  L0_2 = type
  L1_2 = Config
  L1_2 = L1_2.SellTraderPedModels
  L0_2 = L0_2(L1_2)
  if "table" == L0_2 then
    L0_2 = Config
    L0_2 = L0_2.SellTraderPedModels
    L0_2 = #L0_2
    if L0_2 > 0 then
      L0_2 = Config
      L0_2 = L0_2.SellTraderPedModels
      return L0_2
    end
  end
  L0_2 = type
  L1_2 = Config
  L1_2 = L1_2.HouseRobberyNpcs
  L0_2 = L0_2(L1_2)
  if "table" == L0_2 then
    L0_2 = Config
    L0_2 = L0_2.HouseRobberyNpcs
    L0_2 = #L0_2
    if L0_2 > 0 then
      L0_2 = Config
      L0_2 = L0_2.HouseRobberyNpcs
      return L0_2
    end
  end
  L0_2 = {}
  L1_2 = "s_m_y_dealer_01"
  L0_2[1] = L1_2
  return L0_2
end
function L90_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_10
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_10::
  L1_2 = GetEntityCoords
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = RequestCollisionAtCoord
  L3_2 = L1_2.x
  L4_2 = L1_2.y
  L5_2 = L1_2.z
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = GetGroundZFor_3dCoord
  L3_2 = L1_2.x
  L3_2 = L3_2 + 0.0
  L4_2 = L1_2.y
  L4_2 = L4_2 + 0.0
  L5_2 = L1_2.z
  L5_2 = L5_2 + 2.0
  L6_2 = false
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if not L2_2 then
    L4_2 = GetGroundZFor_3dCoord
    L5_2 = L1_2.x
    L5_2 = L5_2 + 0.0
    L6_2 = L1_2.y
    L6_2 = L6_2 + 0.0
    L7_2 = L1_2.z
    L7_2 = L7_2 + 50.0
    L8_2 = false
    L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    L3_2 = L5_2
    L2_2 = L4_2
  end
  if L2_2 and L3_2 then
    L4_2 = vector3
    L5_2 = L1_2.x
    L6_2 = L1_2.y
    L7_2 = L3_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L1_2 = L4_2
    L4_2 = SetEntityCoords
    L5_2 = A0_2
    L6_2 = L1_2.x
    L7_2 = L1_2.y
    L8_2 = L1_2.z
    L9_2 = false
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
  L4_2 = FreezeEntityPosition
  L5_2 = A0_2
  L6_2 = true
  L4_2(L5_2, L6_2)
  return L1_2
end
function L91_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = L1_1
  if L3_2 then
    L3_2 = DoesEntityExist
    L4_2 = L1_1
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L3_2 = DeleteEntity
      L4_2 = L1_1
      L3_2(L4_2)
    end
  end
  L3_2 = LoadModel
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = GetHashKey
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = CreatePed
  L5_2 = 4
  L6_2 = L3_2
  L7_2 = A1_2.x
  L8_2 = A1_2.y
  L9_2 = A1_2.z
  L10_2 = A2_2 + 0.0
  L11_2 = false
  L12_2 = true
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L1_1 = L4_2
  L4_2 = SetEntityAsMissionEntity
  L5_2 = L1_1
  L6_2 = true
  L7_2 = true
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = SetEntityCollision
  L5_2 = L1_1
  L6_2 = false
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = SetEntityInvincible
  L5_2 = L1_1
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SetBlockingOfNonTemporaryEvents
  L5_2 = L1_1
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SetPedCanRagdoll
  L5_2 = L1_1
  L6_2 = false
  L4_2(L5_2, L6_2)
  L4_2 = L90_1
  L5_2 = L1_1
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = A1_2
  end
  L3_1 = L4_2
end
function L92_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if not A0_2 or "" == A0_2 then
    return
  end
  L1_2 = SetTextFont
  L2_2 = 4
  L1_2(L2_2)
  L1_2 = SetTextProportional
  L2_2 = 1
  L1_2(L2_2)
  L1_2 = SetTextScale
  L2_2 = 0.5
  L3_2 = 0.5
  L1_2(L2_2, L3_2)
  L1_2 = SetTextColour
  L2_2 = 255
  L3_2 = 255
  L4_2 = 255
  L5_2 = 255
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = SetTextDropShadow
  L2_2 = 0
  L3_2 = 0
  L4_2 = 0
  L5_2 = 0
  L6_2 = 255
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = SetTextEdge
  L2_2 = 1
  L3_2 = 0
  L4_2 = 0
  L5_2 = 0
  L6_2 = 255
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = SetTextOutline
  L1_2()
  L1_2 = SetTextCentre
  L2_2 = true
  L1_2(L2_2)
  L1_2 = BeginTextCommandDisplayText
  L2_2 = "STRING"
  L1_2(L2_2)
  L1_2 = AddTextComponentSubstringPlayerName
  L2_2 = string
  L2_2 = L2_2.upper
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  L1_2 = EndTextCommandDisplayText
  L2_2 = 0.5
  L3_2 = 0.8
  L1_2(L2_2, L3_2)
end
function L93_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L1_1
  if L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = L1_1
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L1_2 = DestroyAllProps
  L1_2()
  L1_2 = ClearPedTasksImmediately
  L2_2 = L1_1
  L1_2(L2_2)
  L1_2 = Config
  L1_2 = L1_2.Animations
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = L1_2.IsScenario
  if L2_2 then
    L2_2 = TaskStartScenarioInPlace
    L3_2 = L1_1
    L4_2 = L1_2.AnimDict
    L5_2 = 0
    L6_2 = false
    L2_2(L3_2, L4_2, L5_2, L6_2)
    return
  end
  L2_2 = TriggerEvent
  L3_2 = "Pug:client:DoRobberiesAnimation"
  L4_2 = A0_2
  L5_2 = L1_1
  L2_2(L3_2, L4_2, L5_2)
end
function L94_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = BuildRobberyCreatorPlacementPrompt
  L3_2 = "Custom Door Placement"
  L4_2 = "Change door model"
  L5_2 = {}
  L5_2.confirmLabel = "Confirm door"
  L5_2.description = "Pick the model, adjust the placement, and save the custom door."
  return L2_2(L3_2, L4_2, L5_2)
end
setupDoorForm = L94_1
function L94_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = {}
  L2_2.title = "Laser Placement"
  if A1_2 then
    L3_2 = "Choose the end point for this laser beam."
    if L3_2 then
      goto lbl_10
    end
  end
  L3_2 = "Choose the starting point for this laser beam."
  ::lbl_10::
  L2_2.description = L3_2
  if A1_2 then
    L3_2 = "Point 1 saved"
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = "Awaiting first point"
  ::lbl_17::
  L2_2.meta = L3_2
  L3_2 = {}
  L4_2 = L84_1
  L5_2 = "E"
  if A1_2 then
    L6_2 = "Set end point"
    if L6_2 then
      goto lbl_28
    end
  end
  L6_2 = "Set starting point"
  ::lbl_28::
  L7_2 = "primary"
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L84_1
  L6_2 = "Backspace"
  if A1_2 then
    L7_2 = "Remove last point"
    if L7_2 then
      goto lbl_38
    end
  end
  L7_2 = "Cancel"
  ::lbl_38::
  L8_2 = "danger"
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L2_2.actions = L3_2
  return L2_2
end
setupLaserform = L94_1
function L94_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = BuildRobberyCreatorPlacementPrompt
  L2_2 = "Guard Placement"
  L3_2 = "Change weapon: %s"
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = string
  L5_2 = L5_2.upper
  L6_2 = currentWeapon
  if not L6_2 then
    L6_2 = "unarmed"
  end
  L5_2, L6_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = {}
  L4_2.confirmLabel = "Confirm guard"
  L4_2.description = "Position the guard, rotate them, and choose the loadout."
  return L1_2(L2_2, L3_2, L4_2)
end
setupGuardform = L94_1
function L94_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = BuildRobberyCreatorPlacementPrompt
  L2_2 = "Hidden NPC Placement"
  L3_2 = nil
  L4_2 = {}
  L4_2.confirmLabel = "Confirm NPC"
  L4_2.description = "Position the hidden NPC, rotate them, and save the exact interaction spot."
  return L1_2(L2_2, L3_2, L4_2)
end
setupRobberyIntelNpcForm = L94_1
function L94_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = BuildRobberyCreatorPlacementPrompt
  L2_2 = "Ending Scene Placement"
  L3_2 = nil
  L4_2 = {}
  L4_2.confirmLabel = "Confirm ending scene"
  L4_2.description = "Place the center actor and the two escorts will follow automatically."
  return L1_2(L2_2, L3_2, L4_2)
end
setupEndingSceneform = L94_1
function L94_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = BuildRobberyCreatorPlacementPrompt
  L2_2 = "Passcode Placement"
  L3_2 = nil
  L4_2 = {}
  L4_2.confirmLabel = "Confirm passcode note"
  L4_2.description = "Place the sticky note where players should find the passcode."
  return L1_2(L2_2, L3_2, L4_2)
end
setupStickyform = L94_1
function L94_1()
  local L0_2, L1_2
  L0_2 = L82_1
  L0_2()
end
function L95_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = {}
  L2_2 = math
  L2_2 = L2_2.pi
  L2_2 = L2_2 / 180
  L3_2 = A0_2.x
  L2_2 = L2_2 * L3_2
  L1_2.x = L2_2
  L2_2 = math
  L2_2 = L2_2.pi
  L2_2 = L2_2 / 180
  L3_2 = A0_2.y
  L2_2 = L2_2 * L3_2
  L1_2.y = L2_2
  L2_2 = math
  L2_2 = L2_2.pi
  L2_2 = L2_2 / 180
  L3_2 = A0_2.z
  L2_2 = L2_2 * L3_2
  L1_2.z = L2_2
  L2_2 = {}
  L3_2 = math
  L3_2 = L3_2.sin
  L4_2 = L1_2.z
  L3_2 = L3_2(L4_2)
  L3_2 = -L3_2
  L4_2 = math
  L4_2 = L4_2.abs
  L5_2 = math
  L5_2 = L5_2.cos
  L6_2 = L1_2.x
  L5_2, L6_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2 * L4_2
  L2_2.x = L3_2
  L3_2 = math
  L3_2 = L3_2.cos
  L4_2 = L1_2.z
  L3_2 = L3_2(L4_2)
  L4_2 = math
  L4_2 = L4_2.abs
  L5_2 = math
  L5_2 = L5_2.cos
  L6_2 = L1_2.x
  L5_2, L6_2 = L5_2(L6_2)
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L3_2 * L4_2
  L2_2.y = L3_2
  L3_2 = math
  L3_2 = L3_2.sin
  L4_2 = L1_2.x
  L3_2 = L3_2(L4_2)
  L2_2.z = L3_2
  return L2_2
end
function L96_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = false
  L2_2 = IsGameplayCamRendering
  L2_2 = L2_2()
  if not L2_2 then
    L2_2 = GetRenderingCam
    L2_2 = L2_2()
    L1_2 = L2_2
  end
  if not L1_2 then
    L2_2 = GetGameplayCamRot
    L2_2 = L2_2()
    if L2_2 then
      goto lbl_19
    end
  end
  L2_2 = GetCamRot
  L3_2 = L1_2
  L4_2 = 2
  L2_2 = L2_2(L3_2, L4_2)
  ::lbl_19::
  if not L1_2 then
    L3_2 = GetGameplayCamCoord
    L3_2 = L3_2()
    if L3_2 then
      goto lbl_28
    end
  end
  L3_2 = GetCamCoord
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  ::lbl_28::
  L4_2 = L95_1
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = {}
  L6_2 = L3_2.x
  L7_2 = L4_2.x
  L7_2 = L7_2 * A0_2
  L6_2 = L6_2 + L7_2
  L5_2.x = L6_2
  L6_2 = L3_2.y
  L7_2 = L4_2.y
  L7_2 = L7_2 * A0_2
  L6_2 = L6_2 + L7_2
  L5_2.y = L6_2
  L6_2 = L3_2.z
  L7_2 = L4_2.z
  L7_2 = L7_2 * A0_2
  L6_2 = L6_2 + L7_2
  L5_2.z = L6_2
  L6_2 = GetShapeTestResult
  L7_2 = StartShapeTestRay
  L8_2 = L3_2.x
  L9_2 = L3_2.y
  L10_2 = L3_2.z
  L11_2 = L5_2.x
  L12_2 = L5_2.y
  L13_2 = L5_2.z
  L14_2 = -1
  L15_2 = PlayerPedId
  L15_2 = L15_2()
  L16_2 = 0
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = L7_2
  L12_2 = L8_2
  L13_2 = L10_2
  return L11_2, L12_2, L13_2
end
RayCastGamePlayCamera = L96_1
L96_1 = RegisterNUICallback
L97_1 = "createHeist"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.name
  L3_2 = tonumber
  L4_2 = A0_2.stages
  L3_2 = L3_2(L4_2)
  if L2_2 and L3_2 then
    L4_2 = A1_2
    L5_2 = {}
    L5_2.success = true
    L4_2(L5_2)
  else
    L4_2 = A1_2
    L5_2 = {}
    L5_2.success = false
    L5_2.error = "Invalid data"
    L4_2(L5_2)
  end
end
L96_1(L97_1, L98_1)
L96_1 = RegisterNUICallback
L97_1 = "CreateNewHeist"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.name
  if "" ~= L2_2 then
    L2_2 = A0_2.name
    if " " ~= L2_2 then
      L2_2 = TriggerServerEvent
      L3_2 = "heist:createNewHeist"
      L4_2 = string
      L4_2 = L4_2.lower
      L5_2 = A0_2.name
      L4_2, L5_2 = L4_2(L5_2)
      L2_2(L3_2, L4_2, L5_2)
  end
  else
    L2_2 = Notify
    L3_2 = Config
    L3_2 = L3_2.LangT
    L3_2 = L3_2.NameRequired
    L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L96_1(L97_1, L98_1)
L96_1 = RegisterNUICallback
L97_1 = "CloseHeistUi"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = CleanupHouseEditorPreview
  if L2_2 then
    L2_2 = CleanupHouseEditorPreview
    L3_2 = true
    L2_2(L3_2)
  end
  L2_2 = StopTabletEmote
  L2_2()
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L96_1(L97_1, L98_1)
L96_1 = RegisterNUICallback
L97_1 = "NuiNotify"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Notify
  L3_2 = Config
  L3_2 = L3_2.T
  L4_2 = A0_2.Notify
  L3_2 = L3_2(L4_2)
  L4_2 = A0_2.Type
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L96_1(L97_1, L98_1)
L96_1 = RegisterNUICallback
L97_1 = "DeleteHeist"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "heist:deleteHeist"
  L4_2 = A0_2.heistName
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L96_1(L97_1, L98_1)
L96_1 = RegisterNUICallback
L97_1 = "DeleteAllHeists"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:server:DeleteAllHeists"
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L96_1(L97_1, L98_1)
L96_1 = RegisterNUICallback
L97_1 = "GetPresetFiles"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:GetPresetFiles"
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
L96_1(L97_1, L98_1)
L96_1 = RegisterNUICallback
L97_1 = "LoadPresetRobberies"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:server:LoadPresetRobberies"
  L4_2 = A0_2 or L4_2
  if A0_2 then
    L4_2 = A0_2.fileName
  end
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L96_1(L97_1, L98_1)
L96_1 = RegisterNUICallback
L97_1 = "SavePresetRobberies"
function L98_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:server:SavePresetRobberies"
  L4_2 = A0_2 or L4_2
  if A0_2 then
    L4_2 = A0_2.fileName
  end
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L96_1(L97_1, L98_1)
function L96_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = RegisterNUICallback
  L4_2 = "Get"
  L5_2 = A0_2
  L6_2 = "PresetFiles"
  L4_2 = L4_2 .. L5_2 .. L6_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = Config
    L2_3 = L2_3.FrameworkFunctions
    L2_3 = L2_3.TriggerCallback
    L3_3 = "Pug:server:Get"
    L4_3 = A1_2
    L5_3 = "PresetFiles"
    L3_3 = L3_3 .. L4_3 .. L5_3
    function L4_3(A0_4)
      local L1_4, L2_4, L3_4
      L1_4 = A1_3
      L2_4 = A0_4 or L2_4
      if not A0_4 then
        L2_4 = {}
        L2_4.success = false
        L3_4 = {}
        L2_4.files = L3_4
      end
      L1_4(L2_4)
    end
    L2_3(L3_3, L4_3)
  end
  L3_2(L4_2, L5_2)
  L3_2 = RegisterNUICallback
  L4_2 = "Save"
  L5_2 = A0_2
  L6_2 = "Preset"
  L4_2 = L4_2 .. L5_2 .. L6_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    L2_3 = Config
    L2_3 = L2_3.FrameworkFunctions
    L2_3 = L2_3.TriggerCallback
    L3_3 = "Pug:server:Save"
    L4_3 = A1_2
    L5_3 = "Preset"
    L3_3 = L3_3 .. L4_3 .. L5_3
    function L4_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4
      L1_4 = A1_3
      L2_4 = A0_4 or L2_4
      if not A0_4 then
        L2_4 = {}
        L2_4.success = false
        L3_4 = "Failed to save "
        L4_4 = A2_2
        L5_4 = " preset."
        L3_4 = L3_4 .. L4_4 .. L5_4
        L2_4.error = L3_4
      end
      L1_4(L2_4)
    end
    L5_3 = A0_3 or L5_3
    if A0_3 then
      L5_3 = A0_3.fileName
    end
    L6_3 = A0_3 or L6_3
    if A0_3 then
      L6_3 = A0_3.data
    end
    L2_3(L3_3, L4_3, L5_3, L6_3)
  end
  L3_2(L4_2, L5_2)
  L3_2 = RegisterNUICallback
  L4_2 = "Load"
  L5_2 = A0_2
  L6_2 = "Preset"
  L4_2 = L4_2 .. L5_2 .. L6_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = Config
    L2_3 = L2_3.FrameworkFunctions
    L2_3 = L2_3.TriggerCallback
    L3_3 = "Pug:server:Load"
    L4_3 = A1_2
    L5_3 = "Preset"
    L3_3 = L3_3 .. L4_3 .. L5_3
    function L4_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4
      L1_4 = A1_3
      L2_4 = A0_4 or L2_4
      if not A0_4 then
        L2_4 = {}
        L2_4.success = false
        L3_4 = "Failed to load "
        L4_4 = A2_2
        L5_4 = " preset."
        L3_4 = L3_4 .. L4_4 .. L5_4
        L2_4.error = L3_4
      end
      L1_4(L2_4)
    end
    L5_3 = A0_3 or L5_3
    if A0_3 then
      L5_3 = A0_3.fileName
    end
    L2_3(L3_3, L4_3, L5_3)
  end
  L3_2(L4_2, L5_2)
end
L97_1 = L96_1
L98_1 = "BankTruck"
L99_1 = "BankTruck"
L100_1 = "bank truck"
L97_1(L98_1, L99_1, L100_1)
L97_1 = L96_1
L98_1 = "Atm"
L99_1 = "Atm"
L100_1 = "ATM"
L97_1(L98_1, L99_1, L100_1)
L97_1 = L96_1
L98_1 = "SellLocation"
L99_1 = "SellLocation"
L100_1 = "item sell/trader"
L97_1(L98_1, L99_1, L100_1)
L97_1 = RegisterNUICallback
L98_1 = "RequestConfig"
function L99_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = Config
  L2_2(L3_2)
end
L97_1(L98_1, L99_1)
L97_1 = RegisterNUICallback
L98_1 = "SaveHeist"
function L99_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:server:SaveHeistData"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L97_1(L98_1, L99_1)
L97_1 = RegisterNUICallback
L98_1 = "RequestHeistData"
function L99_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = {}
  L4_2 = L5_1
  L3_2.heistData = L4_2
  L2_2(L3_2)
end
L97_1(L98_1, L99_1)
L97_1 = "config/config-minigames.lua"
L98_1 = 4000
function L99_1()
  local L0_2, L1_2, L2_2
  L0_2 = LoadResourceFile
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  L2_2 = L97_1
  L0_2 = L0_2(L1_2, L2_2)
  L1_2 = type
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if "string" == L1_2 and "" ~= L0_2 then
    return L0_2
  end
  L1_2 = nil
  return L1_2
end
function L100_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = {}
  L1_2 = Config
  if L1_2 then
    L1_2 = type
    L2_2 = Config
    L2_2 = L2_2.MiniGames
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      goto lbl_13
    end
  end
  do return L0_2 end
  ::lbl_13::
  L1_2 = pairs
  L2_2 = Config
  L2_2 = L2_2.MiniGames
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = type
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    if "string" == L7_2 and "numberpad" ~= L5_2 then
      L7_2 = L5_2
      L8_2 = type
      L9_2 = L6_2
      L8_2 = L8_2(L9_2)
      if "table" == L8_2 then
        L8_2 = type
        L9_2 = L6_2.label
        L8_2 = L8_2(L9_2)
        if "string" == L8_2 then
          L8_2 = L6_2.label
          if "" ~= L8_2 then
            L7_2 = L6_2.label
          end
        end
      end
      L8_2 = #L0_2
      L8_2 = L8_2 + 1
      L9_2 = {}
      L9_2.id = L5_2
      L9_2.key = L5_2
      L9_2.value = L5_2
      L9_2.name = L5_2
      L9_2.label = L7_2
      L0_2[L8_2] = L9_2
    end
  end
  L1_2 = table
  L1_2 = L1_2.sort
  L2_2 = L0_2
  function L3_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = tostring
    L3_3 = A0_3.label
    L2_3 = L2_3(L3_3)
    L3_3 = L2_3
    L2_3 = L2_3.lower
    L2_3 = L2_3(L3_3)
    L3_3 = tostring
    L4_3 = A1_3.label
    L3_3 = L3_3(L4_3)
    L4_3 = L3_3
    L3_3 = L3_3.lower
    L3_3 = L3_3(L4_3)
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  L1_2(L2_2, L3_2)
  return L0_2
end
function L101_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = L100_1
  L3_2 = L3_2()
  L4_2 = {}
  L4_2.success = true
  L4_2.raw = A0_2
  L4_2.config = A0_2
  L4_2.configText = A0_2
  L4_2.content = A0_2
  L4_2.lua = A0_2
  L4_2.text = A0_2
  L4_2.minigames = L3_2
  L4_2.miniGames = L3_2
  L4_2.MiniGames = L3_2
  L5_2 = {}
  L5_2.raw = A0_2
  L5_2.config = A0_2
  L5_2.configText = A0_2
  L5_2.content = A0_2
  L5_2.lua = A0_2
  L5_2.text = A0_2
  L5_2.minigames = L3_2
  L5_2.miniGames = L3_2
  L5_2.MiniGames = L3_2
  L4_2.data = L5_2
  L4_2.source = A1_2
  L4_2.warning = A2_2
  return L4_2
end
function L102_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = false
  L2_2 = false
  L3_2 = false
  L4_2 = false
  L5_2 = {}
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = L1_2
    if L2_3 then
      return
    end
    L2_3 = true
    L1_2 = L2_3
    L2_3 = A0_2
    L3_3 = A0_3
    L4_3 = A1_3
    L2_3(L3_3, L4_3)
  end
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L1_3 = table
    L1_3 = L1_3.insert
    L2_3 = L5_2
    L3_3 = tostring
    L4_3 = A0_3 or L4_3
    if not A0_3 then
      L4_3 = "Unable to load "
      L5_3 = L97_1
      L6_3 = "."
      L4_3 = L4_3 .. L5_3 .. L6_3
    end
    L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
  end
  function L8_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = L1_2
    if L0_3 then
      return
    end
    L0_3 = L3_2
    if L0_3 then
      L0_3 = L4_2
      if L0_3 then
        L0_3 = L6_2
        L1_3 = false
        L2_3 = table
        L2_3 = L2_3.concat
        L3_3 = L5_2
        L4_3 = " | "
        L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
        L0_3(L1_3, L2_3, L3_3, L4_3)
      end
    end
  end
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3
    L0_3 = L2_2
    if not L0_3 then
      L0_3 = L1_2
      if not L0_3 then
        goto lbl_8
      end
    end
    do return end
    ::lbl_8::
    L0_3 = true
    L2_2 = L0_3
    L0_3 = pcall
    function L1_3()
      local L0_4, L1_4, L2_4
      L0_4 = Config
      L0_4 = L0_4.FrameworkFunctions
      L0_4 = L0_4.TriggerCallback
      L1_4 = "Pug:server:GetMiniGameConfigMeta"
      function L2_4(A0_5, A1_5)
        local L2_5, L3_5, L4_5, L5_5, L6_5
        L2_5 = L1_2
        if L2_5 then
          return
        end
        if not A0_5 then
          L2_5 = true
          L4_2 = L2_5
          L2_5 = L7_2
          L3_5 = A1_5
          L2_5(L3_5)
          L2_5 = L8_2
          L2_5()
          return
        end
        L2_5 = type
        L3_5 = A1_5
        L2_5 = L2_5(L3_5)
        if "table" ~= L2_5 then
          L2_5 = true
          L4_2 = L2_5
          L2_5 = L7_2
          L3_5 = "Mini game config metadata returned "
          L4_5 = type
          L5_5 = A1_5
          L4_5 = L4_5(L5_5)
          L5_5 = " instead of a table."
          L3_5 = L3_5 .. L4_5 .. L5_5
          L2_5(L3_5)
          L2_5 = L8_2
          L2_5()
          return
        end
        L2_5 = tonumber
        L3_5 = A1_5.chunks
        L2_5 = L2_5(L3_5)
        if not L2_5 then
          L2_5 = 0
        end
        if L2_5 < 1 then
          L3_5 = true
          L4_2 = L3_5
          L3_5 = L7_2
          L4_5 = "Mini game config metadata did not include any chunks."
          L3_5(L4_5)
          L3_5 = L8_2
          L3_5()
          return
        end
        L3_5 = {}
        L4_5 = 1
        function L5_5()
          local L0_6, L1_6, L2_6, L3_6, L4_6, L5_6, L6_6, L7_6, L8_6
          L0_6 = L1_2
          if L0_6 then
            return
          end
          L0_6 = L4_5
          L1_6 = L2_5
          if L0_6 > L1_6 then
            L0_6 = true
            L4_2 = L0_6
            L0_6 = L6_2
            L1_6 = true
            L2_6 = table
            L2_6 = L2_6.concat
            L3_6 = L3_5
            L2_6, L3_6, L4_6, L5_6, L6_6, L7_6, L8_6 = L2_6(L3_6)
            L0_6(L1_6, L2_6, L3_6, L4_6, L5_6, L6_6, L7_6, L8_6)
            return
          end
          L0_6 = L4_5
          L1_6 = pcall
          function L2_6()
            local L0_7, L1_7, L2_7, L3_7
            L0_7 = Config
            L0_7 = L0_7.FrameworkFunctions
            L0_7 = L0_7.TriggerCallback
            L1_7 = "Pug:server:GetMiniGameConfigChunk"
            function L2_7(A0_8, A1_8)
              local L2_8, L3_8, L4_8, L5_8, L6_8, L7_8
              L2_8 = L1_2
              if L2_8 then
                return
              end
              if not A0_8 then
                L2_8 = true
                L4_2 = L2_8
                L2_8 = L7_2
                L3_8 = A1_8
                L2_8(L3_8)
                L2_8 = L8_2
                L2_8()
                return
              end
              L2_8 = type
              L3_8 = A1_8
              L2_8 = L2_8(L3_8)
              if "string" ~= L2_8 then
                L2_8 = true
                L4_2 = L2_8
                L2_8 = L7_2
                L3_8 = "Mini game config chunk "
                L4_8 = L0_6
                L5_8 = " returned "
                L6_8 = type
                L7_8 = A1_8
                L6_8 = L6_8(L7_8)
                L7_8 = " instead of text."
                L3_8 = L3_8 .. L4_8 .. L5_8 .. L6_8 .. L7_8
                L2_8(L3_8)
                L2_8 = L8_2
                L2_8()
                return
              end
              L3_8 = L0_6
              L2_8 = L3_5
              L2_8[L3_8] = A1_8
              L2_8 = L0_6
              L2_8 = L2_8 + 1
              L4_5 = L2_8
              L2_8 = L5_5
              L2_8()
            end
            L3_7 = L0_6
            L0_7(L1_7, L2_7, L3_7)
          end
          L1_6, L2_6 = L1_6(L2_6)
          if not L1_6 then
            L3_6 = true
            L4_2 = L3_6
            L3_6 = L7_2
            L4_6 = "Failed to request mini game config chunk "
            L5_6 = L0_6
            L6_6 = ": "
            L7_6 = tostring
            L8_6 = L2_6
            L7_6 = L7_6(L8_6)
            L4_6 = L4_6 .. L5_6 .. L6_6 .. L7_6
            L3_6(L4_6)
            L3_6 = L8_2
            L3_6()
          end
        end
        L6_5 = L5_5
        L6_5()
      end
      L0_4(L1_4, L2_4)
    end
    L0_3, L1_3 = L0_3(L1_3)
    if not L0_3 then
      L2_3 = true
      L4_2 = L2_3
      L2_3 = L7_2
      L3_3 = "Failed to request mini game config metadata: "
      L4_3 = tostring
      L5_3 = L1_3
      L4_3 = L4_3(L5_3)
      L3_3 = L3_3 .. L4_3
      L2_3(L3_3)
      L2_3 = L8_2
      L2_3()
    end
  end
  L10_2 = pcall
  function L11_2()
    local L0_3, L1_3, L2_3
    L0_3 = Config
    L0_3 = L0_3.FrameworkFunctions
    L0_3 = L0_3.TriggerCallback
    L1_3 = "Pug:server:GetMiniGameConfig"
    function L2_3(A0_4, A1_4)
      local L2_4, L3_4, L4_4, L5_4
      L2_4 = L1_2
      if L2_4 then
        return
      end
      L2_4 = true
      L3_2 = L2_4
      if A0_4 then
        L2_4 = type
        L3_4 = A1_4
        L2_4 = L2_4(L3_4)
        if "string" == L2_4 and "" ~= A1_4 then
          L2_4 = L6_2
          L3_4 = true
          L4_4 = A1_4
          L2_4(L3_4, L4_4)
          return
        end
      end
      L2_4 = L7_2
      L3_4 = A1_4 or L3_4
      if not A1_4 then
        L3_4 = "Mini game config callback returned "
        L4_4 = type
        L5_4 = A1_4
        L4_4 = L4_4(L5_4)
        L5_4 = " instead of file text."
        L3_4 = L3_4 .. L4_4 .. L5_4
      end
      L2_4(L3_4)
      L2_4 = L9_2
      L2_4()
      L2_4 = L8_2
      L2_4()
    end
    L0_3(L1_3, L2_3)
  end
  L10_2, L11_2 = L10_2(L11_2)
  if not L10_2 then
    L3_2 = true
    L12_2 = L7_2
    L13_2 = "Failed to request mini game config callback: "
    L14_2 = tostring
    L15_2 = L11_2
    L14_2 = L14_2(L15_2)
    L13_2 = L13_2 .. L14_2
    L12_2(L13_2)
    L12_2 = L9_2
    L12_2()
    L12_2 = L8_2
    L12_2()
  end
  L12_2 = CreateThread
  function L13_2()
    local L0_3, L1_3
    L0_3 = Wait
    L1_3 = 500
    L0_3(L1_3)
    L0_3 = L1_2
    if not L0_3 then
      L0_3 = L3_2
      if not L0_3 then
        L0_3 = L9_2
        L0_3()
      end
    end
  end
  L12_2(L13_2)
end
function L103_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  L2_2 = A0_2
  if not L2_2 or "" == L2_2 then
    L3_2 = L99_1
    L3_2 = L3_2()
    L2_2 = L3_2
  end
  if not L2_2 or "" == L2_2 then
    L3_2 = false
    L4_2 = "Unable to load "
    L5_2 = L97_1
    L6_2 = "."
    L4_2 = L4_2 .. L5_2 .. L6_2
    return L3_2, L4_2
  end
  L3_2 = {}
  L4_2 = Config
  if L4_2 then
    L4_2 = Config
    L4_2 = L4_2.MiniGames
    if L4_2 then
      L4_2 = Config
      L4_2 = L4_2.MiniGames
      L4_2 = L4_2.numberpad
      if L4_2 then
        L4_2 = Config
        L4_2 = L4_2.MiniGames
        L4_2 = L4_2.numberpad
        L3_2.numberpad = L4_2
      end
    end
  end
  L4_2 = Config
  L5_2 = {}
  L4_2.MiniGames = L5_2
  L4_2 = pairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = Config
    L10_2 = L10_2.MiniGames
    L10_2[L8_2] = L9_2
  end
  L4_2 = load
  L5_2 = L2_2
  L6_2 = "@%s/%s"
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = L1_2
  L9_2 = L97_1
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2(L7_2, L8_2, L9_2)
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  if not L4_2 then
    L6_2 = false
    L7_2 = L5_2
    return L6_2, L7_2
  end
  L6_2 = pcall
  L7_2 = L4_2
  L6_2, L7_2 = L6_2(L7_2)
  if not L6_2 then
    L8_2 = false
    L9_2 = L7_2
    return L8_2, L9_2
  end
  L8_2 = true
  return L8_2
end
L104_1 = RegisterNUICallback
L105_1 = "RequestMiniGameConfigData"
function L106_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L99_1
  L2_2 = L2_2()
  L3_2 = A0_2 or L3_2
  if A0_2 then
    L3_2 = A0_2.allowClientFallback
    L3_2 = true == L3_2
  end
  L4_2 = false
  function L5_2(A0_3)
    local L1_3, L2_3
    L1_3 = L4_2
    if L1_3 then
      return
    end
    L1_3 = true
    L4_2 = L1_3
    L1_3 = A1_2
    L2_3 = A0_3
    L1_3(L2_3)
  end
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = Wait
    L1_3 = L98_1
    L0_3(L1_3)
    L0_3 = L4_2
    if not L0_3 then
      L0_3 = L2_2
      if L0_3 then
        L0_3 = L3_2
        if L0_3 then
          L0_3 = PrintDebug
          L1_3 = "Mini game config server chunk request timed out, using client resource file fallback. Bytes:"
          L2_3 = L2_2
          L2_3 = #L2_3
          L0_3(L1_3, L2_3)
          L0_3 = L5_2
          L1_3 = L101_1
          L2_3 = L2_2
          L3_3 = "client-timeout-fallback"
          L4_3 = "Timed out waiting for the server copy, so the client resource copy was used."
          L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3, L3_3, L4_3)
          L0_3(L1_3, L2_3, L3_3, L4_3)
      end
      else
        L0_3 = L5_2
        L1_3 = {}
        L1_3.success = false
        L1_3.error = "Timed out waiting for the server copy of mini game config. Restart pug-robberycreator and check client/server console for callback errors."
        L0_3(L1_3)
      end
    end
  end
  L6_2(L7_2)
  L6_2 = L102_1
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    if A0_3 then
      L2_3 = type
      L3_3 = A1_3
      L2_3 = L2_3(L3_3)
      if "string" == L2_3 and "" ~= A1_3 then
        L2_3 = PrintDebug
        L3_3 = "Loaded mini game config for editor from server. Bytes:"
        L4_3 = #A1_3
        L2_3(L3_3, L4_3)
        L2_3 = L5_2
        L3_3 = L101_1
        L4_3 = A1_3
        L5_3 = "server"
        L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3, L5_3)
        L2_3(L3_3, L4_3, L5_3, L6_3)
        return
      end
    end
    L2_3 = L2_2
    if L2_3 then
      L2_3 = L3_2
      if L2_3 then
        L2_3 = PrintDebug
        L3_3 = "Mini game config server chunk request failed, using client resource file fallback. Bytes:"
        L4_3 = L2_2
        L4_3 = #L4_3
        L2_3(L3_3, L4_3)
        L2_3 = L5_2
        L3_3 = L101_1
        L4_3 = L2_2
        L5_3 = "client-fallback"
        L6_3 = A1_3 or L6_3
        if not A1_3 then
          L6_3 = "Server copy could not be loaded, so the client resource copy was used."
        end
        L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3, L5_3, L6_3)
        L2_3(L3_3, L4_3, L5_3, L6_3)
        return
      end
    end
    L2_3 = type
    L3_3 = A1_3
    L2_3 = L2_3(L3_3)
    if "string" ~= L2_3 or "" == A1_3 then
      L2_3 = L5_2
      L3_3 = {}
      L3_3.success = false
      L4_3 = "Mini game config request returned "
      L5_3 = type
      L6_3 = A1_3
      L5_3 = L5_3(L6_3)
      L6_3 = " instead of file text."
      L4_3 = L4_3 .. L5_3 .. L6_3
      L3_3.error = L4_3
      L2_3(L3_3)
      return
    end
    L2_3 = L5_2
    L3_3 = {}
    L3_3.success = false
    L3_3.error = A1_3
    L2_3(L3_3)
  end
  L6_2(L7_2)
end
L104_1(L105_1, L106_1)
L104_1 = RegisterNUICallback
L105_1 = "SaveMiniGameConfigData"
function L106_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = tostring
  L3_2 = A0_2.raw
  if not L3_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  if "" == L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L4_2.success = false
    L4_2.error = "Mini game config data was empty."
    L3_2(L4_2)
    return
  end
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.TriggerCallback
  L4_2 = "Pug:server:SaveMiniGameConfig"
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3
    if not A0_3 then
      L2_3 = A1_2
      L3_3 = {}
      L3_3.success = false
      L4_3 = A1_3 or L4_3
      if not A1_3 then
        L4_3 = "Failed to save mini game config."
      end
      L3_3.error = L4_3
      L2_3(L3_3)
      return
    end
    L2_3 = L103_1
    L3_3 = L2_2
    L2_3, L3_3 = L2_3(L3_3)
    if not L2_3 then
      L4_3 = A1_2
      L5_3 = {}
      L5_3.success = false
      L6_3 = L3_3 or L6_3
      if not L3_3 then
        L6_3 = "Saved file but failed to reload mini game config in memory."
      end
      L5_3.error = L6_3
      L4_3(L5_3)
      return
    end
    L4_3 = A1_2
    L5_3 = {}
    L5_3.success = true
    L6_3 = A1_3 or L6_3
    if not A1_3 then
      L6_3 = "Mini game config saved successfully."
    end
    L5_3.message = L6_3
    L4_3(L5_3)
  end
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
L104_1(L105_1, L106_1)
L104_1 = RegisterNUICallback
L105_1 = "TestMiniGame"
function L106_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = tostring
  L3_2 = A0_2.key
  if not L3_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  if "" == L2_2 then
    L3_2 = A1_2
    L4_2 = {}
    L4_2.success = false
    L4_2.error = "No mini game key was provided."
    L3_2(L4_2)
    return
  end
  L3_2 = Config
  L3_2 = L3_2.MiniGames
  if L3_2 then
    L3_2 = Config
    L3_2 = L3_2.MiniGames
    L3_2 = L3_2[L2_2]
    if L3_2 then
      L3_2 = type
      L4_2 = Config
      L4_2 = L4_2.MiniGames
      L4_2 = L4_2[L2_2]
      L4_2 = L4_2.Game
      L3_2 = L3_2(L4_2)
      if "function" == L3_2 then
        goto lbl_40
      end
    end
  end
  L3_2 = A1_2
  L4_2 = {}
  L4_2.success = false
  L4_2.error = "That mini game is not currently loaded."
  L3_2(L4_2)
  do return end
  ::lbl_40::
  L3_2 = StopTabletEmote
  L3_2()
  L3_2 = SetNuiFocus
  L4_2 = false
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = A1_2
  L4_2 = {}
  L4_2.success = true
  L3_2(L4_2)
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = Wait
    L1_3 = 250
    L0_3(L1_3)
    L0_3 = TabletEmote
    L0_3()
    L0_3 = SetNuiFocus
    L1_3 = true
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = SendNUIMessage
    L1_3 = {}
    L1_3.type = "showMiniGameSettingsUi"
    L0_3(L1_3)
  end
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = Wait
    L1_3 = 150
    L0_3(L1_3)
    L0_3 = pcall
    L1_3 = Config
    L1_3 = L1_3.MiniGames
    L2_3 = L2_2
    L1_3 = L1_3[L2_3]
    L1_3 = L1_3.Game
    L0_3, L1_3 = L0_3(L1_3)
    if not L0_3 then
      L2_3 = Notify
      L3_3 = Config
      L3_3 = L3_3.T
      L4_3 = "MiniGameTestFailedToStart"
      L5_3 = tostring
      L6_3 = L1_3
      L5_3, L6_3 = L5_3(L6_3)
      L3_3 = L3_3(L4_3, L5_3, L6_3)
      L4_3 = "error"
      L5_3 = 6000
      L2_3(L3_3, L4_3, L5_3)
      L2_3 = L3_2
      L2_3()
      return
    end
    if L1_3 then
      L2_3 = Notify
      L3_3 = Config
      L3_3 = L3_3.T
      L4_3 = "MiniGameTestSuccessful"
      L3_3 = L3_3(L4_3)
      L4_3 = "success"
      L5_3 = 5000
      L2_3(L3_3, L4_3, L5_3)
    else
      L2_3 = Notify
      L3_3 = Config
      L3_3 = L3_3.T
      L4_3 = "MiniGameTestFailed"
      L3_3 = L3_3(L4_3)
      L4_3 = "error"
      L5_3 = 5000
      L2_3(L3_3, L4_3, L5_3)
    end
    L2_3 = L3_2
    L2_3()
  end
  L4_2(L5_2)
end
L104_1(L105_1, L106_1)
function L104_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = {}
  L3_2 = {}
  L4_2 = A0_2 or L4_2
  if A0_2 then
    L4_2 = A0_2.allowSaveAndExit
    L4_2 = true == L4_2
  end
  L5_2 = false
  OriginalMode = true
  EditingFeatureItem = "props"
  L6_2 = Config
  L6_2 = L6_2.HackableProps
  L7_2 = tostring
  L8_2 = A0_2.message
  L7_2 = L7_2(L8_2)
  if "robabble object" == L7_2 then
    L7_2 = Config
    L6_2 = L7_2.RobabbleProps
  end
  L7_2 = 0.0
  L8_2 = SetEntityHeading
  L9_2 = L1_1
  L10_2 = L7_2
  L8_2(L9_2, L10_2)
  L8_2 = SetEntityCollision
  L9_2 = L1_1
  L10_2 = false
  L11_2 = false
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = SetEntityInvincible
  L9_2 = L1_1
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = FreezeEntityPosition
  L9_2 = L1_1
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = nil
  L9_2 = nil
  L10_2 = false
  L11_2 = true
  L0_1 = L11_2
  L11_2 = ClearPedTasksImmediately
  L12_2 = PlayerPedId
  L12_2 = L12_2()
  L11_2(L12_2)
  L11_2 = CreateThread
  function L12_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3
    L0_3 = setupScaleform
    L1_3 = "instructional_buttons"
    L2_3 = true
    L3_3 = {}
    L4_3 = L4_2
    L3_3.allowSaveAndExit = L4_3
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    form = L0_3
    while true do
      L0_3 = L0_1
      if not L0_3 then
        break
      end
      L0_3 = L79_1
      L0_3()
      L0_3 = RayCastGamePlayCamera
      L1_3 = 20.0
      L0_3, L1_3, L2_3 = L0_3(L1_3)
      L3_1 = L1_3
      L4_3 = SelectedAnimationNumber
      L3_3 = L6_2
      L3_3 = L3_3[L4_3]
      if "ch_prop_gold_trolly_01a" ~= L3_3 then
        L4_3 = SelectedAnimationNumber
        L3_3 = L6_2
        L3_3 = L3_3[L4_3]
        if "ch_prop_cash_low_trolly_01a" ~= L3_3 then
          L4_3 = SelectedAnimationNumber
          L3_3 = L6_2
          L3_3 = L3_3[L4_3]
          if "ch_prop_diamond_trolly_01a" ~= L3_3 then
            L4_3 = SelectedAnimationNumber
            L3_3 = L6_2
            L3_3 = L3_3[L4_3]
            if "imp_prop_impexp_coke_trolly" ~= L3_3 then
              L4_3 = SelectedAnimationNumber
              L3_3 = L6_2
              L3_3 = L3_3[L4_3]
              if "p_chem_vial_02b_s" ~= L3_3 then
                L4_3 = SelectedAnimationNumber
                L3_3 = L6_2
                L3_3 = L3_3[L4_3]
                if "v_ret_gc_gasmask" ~= L3_3 then
                  L4_3 = SelectedAnimationNumber
                  L3_3 = L6_2
                  L3_3 = L3_3[L4_3]
                  if "h4_prop_h4_chain_lock_01a" ~= L3_3 then
                    L4_3 = SelectedAnimationNumber
                    L3_3 = L6_2
                    L3_3 = L3_3[L4_3]
                    if "tr_prop_tr_adv_case_01a" ~= L3_3 then
                      goto lbl_153
                    end
                  end
                end
              end
            end
          end
        end
      end
      L3_3 = 0.47
      L4_3 = 0.15
      L5_3 = 0.35
      L7_3 = SelectedAnimationNumber
      L6_3 = L6_2
      L6_3 = L6_3[L7_3]
      if "p_chem_vial_02b_s" == L6_3 then
        L3_3 = 0.4
        L4_3 = 0.05
        L5_3 = 0.15
      else
        L7_3 = SelectedAnimationNumber
        L6_3 = L6_2
        L6_3 = L6_3[L7_3]
        if "v_ret_gc_gasmask" == L6_3 then
          L3_3 = 0.15
        else
          L7_3 = SelectedAnimationNumber
          L6_3 = L6_2
          L6_3 = L6_3[L7_3]
          if "h4_prop_h4_chain_lock_01a" == L6_3 then
            L3_3 = 0.0
            L4_3 = 0.05
            L5_3 = -0.1
          else
            L7_3 = SelectedAnimationNumber
            L6_3 = L6_2
            L6_3 = L6_3[L7_3]
            if "tr_prop_tr_adv_case_01a" == L6_3 then
              L3_3 = 0.3
              L4_3 = 0.15
              L5_3 = -0.48
            end
          end
        end
      end
      L6_3 = vector3
      L7_3 = L3_1.x
      L8_3 = L3_1.y
      L9_3 = L3_1.z
      L9_3 = L9_3 + L3_3
      L6_3 = L6_3(L7_3, L8_3, L9_3)
      L1_3 = L6_3
      L6_3 = GetEntityForwardVector
      L7_3 = L1_1
      L6_3 = L6_3(L7_3)
      L7_3 = table
      L7_3 = L7_3.unpack
      L8_3 = GetEntityCoords
      L9_3 = L1_1
      L8_3 = L8_3(L9_3)
      L9_3 = L6_3 * L5_3
      L8_3 = L8_3 + L9_3
      L7_3, L8_3, L9_3 = L7_3(L8_3)
      L11_3 = SelectedAnimationNumber
      L10_3 = L6_2
      L10_3 = L10_3[L11_3]
      if "v_ret_gc_gasmask" ~= L10_3 then
        L11_3 = SelectedAnimationNumber
        L10_3 = L6_2
        L10_3 = L10_3[L11_3]
        if "h4_prop_h4_chain_lock_01a" ~= L10_3 then
          L9_3 = L9_3 + 0.1
        end
        L10_3 = DrawMarker
        L11_3 = 28
        L12_3 = L7_3
        L13_3 = L8_3
        L14_3 = L9_3
        L15_3 = 0.0
        L16_3 = 0.0
        L17_3 = 0.0
        L18_3 = 0.0
        L19_3 = 0.0
        L20_3 = 0.0
        L21_3 = L4_3
        L22_3 = L4_3
        L23_3 = L4_3
        L24_3 = 0
        L25_3 = 150
        L26_3 = 0
        L27_3 = 100
        L28_3 = false
        L29_3 = false
        L30_3 = 2
        L31_3 = false
        L32_3 = nil
        L33_3 = nil
        L34_3 = false
        L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
      end
      ::lbl_153::
      L3_3 = DrawRobberyCreatorPrompt
      L4_3 = form
      L3_3(L4_3)
      if L0_3 then
        L3_3 = OriginalMode
        if L3_3 then
          L3_3 = L37_1
          L4_3 = L1_1
          L5_3 = L1_3
          L6_3 = EditingFeatureItem
          L6_3 = L36_1
          L8_3 = SelectedAnimationNumber
          L7_3 = L6_2
          L7_3 = L7_3[L8_3]
          L6_3 = "props" == L6_3 and L6_3
          L3_3(L4_3, L5_3, L6_3)
        end
      end
      L4_3 = SelectedAnimationNumber
      L3_3 = L6_2
      L3_3 = L3_3[L4_3]
      if "hei_prop_hei_securitypanel" ~= L3_3 then
        L4_3 = SelectedAnimationNumber
        L3_3 = L6_2
        L3_3 = L3_3[L4_3]
        if "ch_prop_fingerprint_scanner_01e" ~= L3_3 then
          goto lbl_236
        end
      end
      L3_3 = GetEntityCoords
      L4_3 = L1_1
      L3_3 = L3_3(L4_3)
      L4_3 = vector3
      L5_3 = L3_3.x
      L6_3 = L3_3.y
      L7_3 = L3_3.z
      L7_3 = L7_3 - 1.42
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      L5_3 = DrawLine
      L6_3 = L3_3.x
      L7_3 = L3_3.y
      L8_3 = L3_3.z
      L9_3 = L4_3.x
      L10_3 = L4_3.y
      L11_3 = L4_3.z
      L12_3 = 0
      L13_3 = 150
      L14_3 = 0
      L15_3 = 255
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
      L5_3 = DrawMarker
      L6_3 = 25
      L7_3 = L4_3.x
      L8_3 = L4_3.y
      L9_3 = L4_3.z
      L9_3 = L9_3 + 0.02
      L10_3 = 0.0
      L11_3 = 0.0
      L12_3 = 0.0
      L13_3 = 0.0
      L14_3 = 0.0
      L15_3 = 0.0
      L16_3 = 0.5
      L17_3 = 0.5
      L18_3 = 0.5
      L19_3 = 0
      L20_3 = 150
      L21_3 = 0
      L22_3 = 100
      L23_3 = false
      L24_3 = false
      L25_3 = 2
      L26_3 = false
      L27_3 = nil
      L28_3 = nil
      L29_3 = false
      L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3)
      goto lbl_339
      ::lbl_236::
      L3_3 = GetPaintingProps
      L5_3 = SelectedAnimationNumber
      L4_3 = L6_2
      L4_3 = L4_3[L5_3]
      L3_3 = L3_3(L4_3)
      if L3_3 then
        L3_3 = GetEntityCoords
        L4_3 = L1_1
        L3_3 = L3_3(L4_3)
        L4_3 = vector3
        L5_3 = L3_3.x
        L6_3 = L3_3.y
        L7_3 = L3_3.z
        L7_3 = L7_3 - 1.15
        L4_3 = L4_3(L5_3, L6_3, L7_3)
        L5_3 = DrawLine
        L6_3 = L3_3.x
        L7_3 = L3_3.y
        L8_3 = L3_3.z
        L9_3 = L4_3.x
        L10_3 = L4_3.y
        L11_3 = L4_3.z
        L12_3 = 0
        L13_3 = 150
        L14_3 = 0
        L15_3 = 255
        L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
        L5_3 = DrawMarker
        L6_3 = 25
        L7_3 = L4_3.x
        L8_3 = L4_3.y
        L9_3 = L4_3.z
        L9_3 = L9_3 + 0.02
        L10_3 = 0.0
        L11_3 = 0.0
        L12_3 = 0.0
        L13_3 = 0.0
        L14_3 = 0.0
        L15_3 = 0.0
        L16_3 = 0.5
        L17_3 = 0.5
        L18_3 = 0.5
        L19_3 = 0
        L20_3 = 150
        L21_3 = 0
        L22_3 = 100
        L23_3 = false
        L24_3 = false
        L25_3 = 2
        L26_3 = false
        L27_3 = nil
        L28_3 = nil
        L29_3 = false
        L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3)
      else
        L3_3 = GetStackProps
        L5_3 = SelectedAnimationNumber
        L4_3 = L6_2
        L4_3 = L4_3[L5_3]
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = GetEntityForwardVector
          L4_3 = L1_1
          L3_3 = L3_3(L4_3)
          L4_3 = table
          L4_3 = L4_3.unpack
          L5_3 = GetEntityCoords
          L6_3 = L1_1
          L5_3 = L5_3(L6_3)
          L6_3 = L3_3 * 0.35
          L5_3 = L5_3 - L6_3
          L4_3, L5_3, L6_3 = L4_3(L5_3)
          L7_3 = DrawMarker
          L8_3 = 28
          L9_3 = L4_3
          L10_3 = L5_3
          L11_3 = L6_3 + 0.1
          L12_3 = 0.0
          L13_3 = 0.0
          L14_3 = 0.0
          L15_3 = 0.0
          L16_3 = 0.0
          L17_3 = 0.0
          L18_3 = 0.15
          L19_3 = 0.15
          L20_3 = 0.15
          L21_3 = 0
          L22_3 = 150
          L23_3 = 0
          L24_3 = 100
          L25_3 = false
          L26_3 = false
          L27_3 = 2
          L28_3 = false
          L29_3 = nil
          L30_3 = nil
          L31_3 = false
          L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3)
        end
      end
      ::lbl_339::
      L4_3 = SelectedAnimationNumber
      L3_3 = L6_2
      L3_3 = L3_3[L4_3]
      if "h4_prop_h4_glass_disp_01a" == L3_3 then
        L3_3 = L10_2
        if not L3_3 then
          L3_3 = LoadModel
          L4_3 = "h4_prop_h4_neck_disp_01a"
          L3_3(L4_3)
          L3_3 = LoadModel
          L4_3 = "h4_prop_h4_necklace_01a"
          L3_3(L4_3)
          L3_3 = GetEntityCoords
          L4_3 = L1_1
          L3_3 = L3_3(L4_3)
          L4_3 = CreateObject
          L5_3 = GetHashKey
          L6_3 = "h4_prop_h4_neck_disp_01a"
          L5_3 = L5_3(L6_3)
          L6_3 = L3_3.x
          L7_3 = L3_3.y
          L8_3 = L3_3.z
          L8_3 = L8_3 + 1
          L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
          L8_2 = L4_3
          L4_3 = CreateObject
          L5_3 = GetHashKey
          L6_3 = "h4_prop_h4_necklace_01a"
          L5_3 = L5_3(L6_3)
          L6_3 = L3_3.x
          L7_3 = L3_3.y
          L8_3 = L3_3.z
          L8_3 = L8_3 + 1
          L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)
          L9_2 = L4_3
          L4_3 = SetEntityCollision
          L5_3 = L8_2
          L6_3 = false
          L7_3 = false
          L4_3(L5_3, L6_3, L7_3)
          L4_3 = SetEntityCollision
          L5_3 = L9_2
          L6_3 = false
          L7_3 = false
          L4_3(L5_3, L6_3, L7_3)
          L4_3 = true
          L10_2 = L4_3
      end
      else
        L4_3 = SelectedAnimationNumber
        L3_3 = L6_2
        L3_3 = L3_3[L4_3]
        if "h4_prop_h4_glass_disp_01a" ~= L3_3 then
          L3_3 = L10_2
          if L3_3 then
            L3_3 = false
            L10_2 = L3_3
            L3_3 = DoesEntityExist
            L4_3 = L8_2
            L3_3 = L3_3(L4_3)
            if L3_3 then
              L3_3 = DeleteEntity
              L4_3 = L8_2
              L3_3(L4_3)
            end
            L3_3 = DoesEntityExist
            L4_3 = L9_2
            L3_3 = L3_3(L4_3)
            if L3_3 then
              L3_3 = DeleteEntity
              L4_3 = L9_2
              L3_3(L4_3)
            end
          end
        else
          L3_3 = L10_2
          if L3_3 then
            L3_3 = GetEntityCoords
            L4_3 = L1_1
            L3_3 = L3_3(L4_3)
            L4_3 = GetEntityHeading
            L5_3 = L1_1
            L4_3 = L4_3(L5_3)
            L5_3 = SetEntityCoords
            L6_3 = L8_2
            L7_3 = vector3
            L8_3 = L3_3.x
            L9_3 = L3_3.y
            L10_3 = L3_3.z
            L10_3 = L10_3 + 1
            L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L7_3(L8_3, L9_3, L10_3)
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
            L5_3 = SetEntityCoords
            L6_3 = L9_2
            L7_3 = vector3
            L8_3 = L3_3.x
            L9_3 = L3_3.y
            L10_3 = L3_3.z
            L10_3 = L10_3 + 1
            L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L7_3(L8_3, L9_3, L10_3)
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
            L5_3 = SetEntityHeading
            L6_3 = L8_2
            L7_3 = L4_3 + 0.0
            L5_3(L6_3, L7_3)
            L5_3 = SetEntityHeading
            L6_3 = L9_2
            L7_3 = L4_3 + 0.0
            L5_3(L6_3, L7_3)
          end
        end
      end
      L3_3 = IsControlPressed
      L4_3 = 0
      L5_3 = 174
      L3_3 = L3_3(L4_3, L5_3)
      if L3_3 then
        L3_3 = L7_2
        L3_3 = L3_3 + 1
        L7_2 = L3_3
        L3_3 = L7_2
        L4_3 = 360
        if L3_3 > L4_3 then
          L3_3 = 0.0
          L7_2 = L3_3
        end
      end
      L3_3 = IsControlPressed
      L4_3 = 0
      L5_3 = 175
      L3_3 = L3_3(L4_3, L5_3)
      if L3_3 then
        L3_3 = L7_2
        L3_3 = L3_3 - 1
        L7_2 = L3_3
        L3_3 = L7_2
        if L3_3 < 0 then
          L3_3 = 360.0
          L7_2 = L3_3
        end
      end
      L3_3 = OriginalMode
      if not L3_3 then
        L3_3 = DisableControlAction
        L4_3 = 0
        L5_3 = 30
        L6_3 = true
        L3_3(L4_3, L5_3, L6_3)
        L3_3 = DisableControlAction
        L4_3 = 0
        L5_3 = 31
        L6_3 = true
        L3_3(L4_3, L5_3, L6_3)
        L3_3 = DisableControlAction
        L4_3 = 0
        L5_3 = 34
        L6_3 = true
        L3_3(L4_3, L5_3, L6_3)
        L3_3 = DisableControlAction
        L4_3 = 0
        L5_3 = 35
        L6_3 = true
        L3_3(L4_3, L5_3, L6_3)
        L3_3 = GetEntityCoords
        L4_3 = L1_1
        L3_3 = L3_3(L4_3)
        L4_3 = L3_3.z
        L5_3 = EditingFeatureItem
        if "props" ~= L5_3 then
          L5_3 = L3_3.z
          L4_3 = L5_3 - 1
        end
        L5_3 = EditingFeatureItem
        L5_3 = L36_1
        L7_3 = SelectedAnimationNumber
        L6_3 = L6_2
        L6_3 = L6_3[L7_3]
        L5_3 = "props" == L5_3 and L5_3
        L6_3 = PlayerPedId
        L6_3 = L6_3()
        L7_3 = GetEntityCoords
        L8_3 = L6_3
        L7_3 = L7_3(L8_3)
        L8_3 = GetEntityCoords
        L9_3 = L1_1
        L8_3 = L8_3(L9_3)
        L9_3 = vector3
        L10_3 = L8_3.x
        L11_3 = L7_3.x
        L10_3 = L10_3 - L11_3
        L11_3 = L8_3.y
        L12_3 = L7_3.y
        L11_3 = L11_3 - L12_3
        L12_3 = 0
        L9_3 = L9_3(L10_3, L11_3, L12_3)
        L10_3 = math
        L10_3 = L10_3.sqrt
        L11_3 = L9_3.x
        L11_3 = L11_3 ^ 2
        L12_3 = L9_3.y
        L12_3 = L12_3 ^ 2
        L11_3 = L11_3 + L12_3
        L10_3 = L10_3(L11_3)
        L11_3 = vector3
        L12_3 = L9_3.x
        L12_3 = L12_3 / L10_3
        L13_3 = L9_3.y
        L13_3 = L13_3 / L10_3
        L14_3 = 0
        L11_3 = L11_3(L12_3, L13_3, L14_3)
        L12_3 = vector3
        L13_3 = L11_3.y
        L13_3 = -L13_3
        L14_3 = L11_3.x
        L15_3 = 0
        L12_3 = L12_3(L13_3, L14_3, L15_3)
        L13_3 = IsDisabledControlPressed
        L14_3 = 1
        L15_3 = 32
        L13_3 = L13_3(L14_3, L15_3)
        if L13_3 then
          L13_3 = L8_3.x
          L14_3 = L11_3.x
          L14_3 = 0.01 * L14_3
          L13_3 = L13_3 + L14_3
          L14_3 = L8_3.y
          L15_3 = L11_3.y
          L15_3 = 0.01 * L15_3
          L14_3 = L14_3 + L15_3
          L15_3 = L37_1
          L16_3 = L1_1
          L17_3 = vector3
          L18_3 = L13_3
          L19_3 = L14_3
          L20_3 = L4_3
          L17_3 = L17_3(L18_3, L19_3, L20_3)
          L18_3 = L5_3
          L15_3(L16_3, L17_3, L18_3)
        end
        L13_3 = IsDisabledControlPressed
        L14_3 = 1
        L15_3 = 33
        L13_3 = L13_3(L14_3, L15_3)
        if L13_3 then
          L13_3 = L8_3.x
          L14_3 = L11_3.x
          L14_3 = 0.01 * L14_3
          L13_3 = L13_3 - L14_3
          L14_3 = L8_3.y
          L15_3 = L11_3.y
          L15_3 = 0.01 * L15_3
          L14_3 = L14_3 - L15_3
          L15_3 = L37_1
          L16_3 = L1_1
          L17_3 = vector3
          L18_3 = L13_3
          L19_3 = L14_3
          L20_3 = L4_3
          L17_3 = L17_3(L18_3, L19_3, L20_3)
          L18_3 = L5_3
          L15_3(L16_3, L17_3, L18_3)
        end
        L13_3 = IsDisabledControlPressed
        L14_3 = 1
        L15_3 = 34
        L13_3 = L13_3(L14_3, L15_3)
        if L13_3 then
          L13_3 = L8_3.x
          L14_3 = L12_3.x
          L14_3 = 0.01 * L14_3
          L13_3 = L13_3 + L14_3
          L14_3 = L8_3.y
          L15_3 = L12_3.y
          L15_3 = 0.01 * L15_3
          L14_3 = L14_3 + L15_3
          L15_3 = L37_1
          L16_3 = L1_1
          L17_3 = vector3
          L18_3 = L13_3
          L19_3 = L14_3
          L20_3 = L4_3
          L17_3 = L17_3(L18_3, L19_3, L20_3)
          L18_3 = L5_3
          L15_3(L16_3, L17_3, L18_3)
        end
        L13_3 = IsDisabledControlPressed
        L14_3 = 1
        L15_3 = 35
        L13_3 = L13_3(L14_3, L15_3)
        if L13_3 then
          L13_3 = L8_3.x
          L14_3 = L12_3.x
          L14_3 = 0.01 * L14_3
          L13_3 = L13_3 - L14_3
          L14_3 = L8_3.y
          L15_3 = L12_3.y
          L15_3 = 0.01 * L15_3
          L14_3 = L14_3 - L15_3
          L15_3 = L37_1
          L16_3 = L1_1
          L17_3 = vector3
          L18_3 = L13_3
          L19_3 = L14_3
          L20_3 = L4_3
          L17_3 = L17_3(L18_3, L19_3, L20_3)
          L18_3 = L5_3
          L15_3(L16_3, L17_3, L18_3)
        end
        L13_3 = IsControlPressed
        L14_3 = 0
        L15_3 = 172
        L13_3 = L13_3(L14_3, L15_3)
        if L13_3 then
          L13_3 = L37_1
          L14_3 = L1_1
          L15_3 = vector3
          L16_3 = L3_3.x
          L17_3 = L3_3.y
          L18_3 = L4_3 + 0.01
          L15_3 = L15_3(L16_3, L17_3, L18_3)
          L16_3 = L5_3
          L13_3(L14_3, L15_3, L16_3)
        end
        L13_3 = IsControlPressed
        L14_3 = 0
        L15_3 = 173
        L13_3 = L13_3(L14_3, L15_3)
        if L13_3 then
          L13_3 = L37_1
          L14_3 = L1_1
          L15_3 = vector3
          L16_3 = L3_3.x
          L17_3 = L3_3.y
          L18_3 = L4_3 - 0.01
          L15_3 = L15_3(L16_3, L17_3, L18_3)
          L16_3 = L5_3
          L13_3(L14_3, L15_3, L16_3)
        end
        L13_3 = L8_3.x
        L14_3 = L7_3.x
        L13_3 = L13_3 - L14_3
        L14_3 = L8_3.y
        L15_3 = L7_3.y
        L14_3 = L14_3 - L15_3
        L15_3 = math
        L15_3 = L15_3.deg
        L16_3 = math
        L16_3 = L16_3.atan2
        L17_3 = L14_3
        L18_3 = L13_3
        L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L16_3(L17_3, L18_3)
        L15_3 = L15_3(L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
        L16_3 = SetEntityHeading
        L17_3 = L6_3
        L18_3 = L15_3 - 90.0
        L16_3(L17_3, L18_3)
        L16_3 = EditingFeatureItem
        if "props" ~= L16_3 then
          L16_3 = vector3
          L17_3 = GetEntityCoords
          L18_3 = L1_1
          L17_3 = L17_3(L18_3)
          L17_3 = L17_3.x
          L18_3 = GetEntityCoords
          L19_3 = L1_1
          L18_3 = L18_3(L19_3)
          L18_3 = L18_3.y
          L19_3 = GetEntityCoords
          L20_3 = L1_1
          L19_3 = L19_3(L20_3)
          L19_3 = L19_3.z
          L19_3 = L19_3 - 1
          L16_3 = L16_3(L17_3, L18_3, L19_3)
          L1_3 = L16_3
        else
          L16_3 = GetEntityCoords
          L17_3 = L1_1
          L16_3 = L16_3(L17_3)
          L1_3 = L16_3
        end
        L3_1 = L1_3
      end
      L3_3 = IsControlJustPressed
      L4_3 = 1
      L5_3 = 45
      L3_3 = L3_3(L4_3, L5_3)
      if L3_3 then
        L3_3 = OriginalMode
        L3_3 = not L3_3
        OriginalMode = L3_3
        L3_3 = setupScaleform
        L4_3 = "instructional_buttons"
        L5_3 = true
        L6_3 = {}
        L7_3 = L4_2
        L6_3.allowSaveAndExit = L7_3
        L3_3 = L3_3(L4_3, L5_3, L6_3)
        form = L3_3
      end
      L3_3 = L4_2
      if L3_3 then
        L3_3 = IsControlJustPressed
        L4_3 = 0
        L5_3 = 191
        L3_3 = L3_3(L4_3, L5_3)
        if not L3_3 then
          L3_3 = IsControlJustPressed
          L4_3 = 0
          L5_3 = 201
          L3_3 = L3_3(L4_3, L5_3)
          if not L3_3 then
            goto lbl_818
          end
        end
        L3_3 = DoesEntityExist
        L4_3 = L8_2
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = DeleteEntity
          L4_3 = L8_2
          L3_3(L4_3)
        end
        L3_3 = DoesEntityExist
        L4_3 = L9_2
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = DeleteEntity
          L4_3 = L9_2
          L3_3(L4_3)
        end
        L3_3 = true
        L5_2 = L3_3
        L3_3 = L82_1
        L3_3()
        break
      end
      ::lbl_818::
      L3_3 = IsControlJustPressed
      L4_3 = 1
      L5_3 = 177
      L3_3 = L3_3(L4_3, L5_3)
      if L3_3 then
        L3_3 = DoesEntityExist
        L4_3 = L8_2
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = DeleteEntity
          L4_3 = L8_2
          L3_3(L4_3)
        end
        L3_3 = DoesEntityExist
        L4_3 = L9_2
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = DeleteEntity
          L4_3 = L9_2
          L3_3(L4_3)
        end
        L3_3 = L94_1
        L3_3()
      end
      L3_3 = SetEntityHeading
      L4_3 = L1_1
      L5_3 = L7_2
      L3_3(L4_3, L5_3)
      L3_3 = EditingFeatureItem
      if "props" == L3_3 then
        L3_3 = SelectedAnimationNumber
        if L3_3 < 1 then
          L3_3 = SetEntityVisible
          L4_3 = L1_1
          L5_3 = false
          L3_3(L4_3, L5_3)
          L3_3 = GetEntityCoords
          L4_3 = PlayerPedId
          L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L4_3()
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
          L4_3 = 0.2
          L5_3 = Config
          L5_3 = L5_3.Color
          OriginalMode = true
          L6_3 = DrawMarker
          L7_3 = 28
          L8_3 = L1_3.x
          L9_3 = L1_3.y
          L10_3 = L1_3.z
          L11_3 = 0.0
          L12_3 = 0.0
          L13_3 = 0.0
          L14_3 = 0.0
          L15_3 = 0.0
          L16_3 = 0.0
          L17_3 = L4_3
          L18_3 = L4_3
          L19_3 = L4_3
          L20_3 = L5_3.r
          L21_3 = L5_3.g
          L22_3 = L5_3.b
          L23_3 = L5_3.a
          L24_3 = false
          L25_3 = false
          L26_3 = 2
          L27_3 = nil
          L28_3 = nil
          L29_3 = false
          L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3)
          L6_3 = DrawLine
          L7_3 = L3_3.x
          L8_3 = L3_3.y
          L9_3 = L3_3.z
          L9_3 = L9_3 + 0.4
          L10_3 = L1_3.x
          L11_3 = L1_3.y
          L12_3 = L1_3.z
          L13_3 = L5_3.r
          L14_3 = L5_3.g
          L15_3 = L5_3.b
          L16_3 = L5_3.a
          L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
        else
          L3_3 = SetEntityVisible
          L4_3 = L1_1
          L5_3 = true
          L3_3(L4_3, L5_3)
        end
      end
      L3_3 = IsControlJustPressed
      L4_3 = 0
      L5_3 = 38
      L3_3 = L3_3(L4_3, L5_3)
      if L3_3 then
        L3_3 = DoesEntityExist
        L4_3 = L8_2
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = DeleteEntity
          L4_3 = L8_2
          L3_3(L4_3)
        end
        L3_3 = DoesEntityExist
        L4_3 = L9_2
        L3_3 = L3_3(L4_3)
        if L3_3 then
          L3_3 = DeleteEntity
          L4_3 = L9_2
          L3_3(L4_3)
        end
        L3_3 = EditingFeatureItem
        if "props" == L3_3 then
          L3_3 = SelectedAnimationNumber
          if L3_3 > 0 then
            L3_3 = {}
            L4_3 = L3_1
            L3_3.Target = L4_3
            L5_3 = SelectedAnimationNumber
            L4_3 = L6_2
            L4_3 = L4_3[L5_3]
            L3_3.Prop = L4_3
            L4_3 = L7_2
            L3_3.PropHeading = L4_3
            L3_2 = L3_3
          else
            L3_3 = false
            L4_3 = L7_2
            L5_3 = {}
            L6_3 = "des_jewel_cab_start"
            L7_3 = "des_jewel_cab2_start"
            L8_3 = "des_jewel_cab3_start"
            L9_3 = "des_jewel_cab4_start"
            L5_3[1] = L6_3
            L5_3[2] = L7_3
            L5_3[3] = L8_3
            L5_3[4] = L9_3
            L6_3 = nil
            L7_3 = 1
            L8_3 = #L5_3
            L9_3 = 1
            for L10_3 = L7_3, L8_3, L9_3 do
              L11_3 = GetClosestObjectOfType
              L12_3 = L3_1.x
              L13_3 = L3_1.y
              L14_3 = L3_1.z
              L15_3 = 0.5
              L16_3 = GetHashKey
              L17_3 = L5_3[L10_3]
              L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L16_3(L17_3)
              L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
              L6_3 = L11_3
              if 0 ~= L6_3 then
                L11_3 = Notify
                L12_3 = Config
                L12_3 = L12_3.T
                L13_3 = "VaseDetectedFormat"
                L14_3 = L5_3[L10_3]
                L12_3 = L12_3(L13_3, L14_3)
                L13_3 = "success"
                L11_3(L12_3, L13_3)
                L11_3 = tostring
                L12_3 = L5_3[L10_3]
                L11_3 = L11_3(L12_3)
                L3_3 = L11_3
                L11_3 = GetEntityHeading
                L12_3 = L6_3
                L11_3 = L11_3(L12_3)
                L4_3 = L11_3
                L11_3 = GetEntityCoords
                L12_3 = L6_3
                L11_3 = L11_3(L12_3)
                L3_1 = L11_3
                break
              end
            end
            L7_3 = GetClosestObjectOfType
            L8_3 = L3_1.x
            L9_3 = L3_1.y
            L10_3 = L3_1.z
            L11_3 = 1.5
            L12_3 = GetHashKey
            L13_3 = "hei_prop_hei_securitypanel"
            L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L12_3(L13_3)
            L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
            if 0 ~= L7_3 and 0 == L6_3 then
              L8_3 = Notify
              L9_3 = Config
              L9_3 = L9_3.T
              L10_3 = "SecurityPanelDetected"
              L9_3 = L9_3(L10_3)
              L10_3 = "success"
              L8_3(L9_3, L10_3)
              L3_3 = "hei_prop_hei_securitypanel"
              L8_3 = GetEntityHeading
              L9_3 = L7_3
              L8_3 = L8_3(L9_3)
              L4_3 = L8_3
              L8_3 = GetEntityCoords
              L9_3 = L7_3
              L8_3 = L8_3(L9_3)
              L3_1 = L8_3
            end
            L8_3 = {}
            L9_3 = L3_1
            L8_3.Target = L9_3
            L8_3.Prop = L3_3
            L8_3.PropHeading = L4_3
            L3_2 = L8_3
            if L3_3 then
              L8_3 = {}
              L9_3 = {}
              L10_3 = L3_2.Target
              L10_3 = L10_3.x
              L9_3.x = L10_3
              L10_3 = L3_2.Target
              L10_3 = L10_3.y
              L9_3.y = L10_3
              L10_3 = L3_2.Target
              L10_3 = L10_3.z
              L9_3.z = L10_3
              L8_3.Target = L9_3
              L9_3 = L3_2.Prop
              L8_3.Prop = L9_3
              L9_3 = {}
              L10_3 = L3_1.x
              L9_3.x = L10_3
              L10_3 = L3_1.y
              L9_3.y = L10_3
              L10_3 = L3_1.z
              L9_3.z = L10_3
              L8_3.PedCoords = L9_3
              L8_3.Animation = L3_3
              L9_3 = L7_2
              L8_3.Heading = L9_3
              L9_3 = L3_2.PropHeading
              L8_3.PropHeading = L9_3
              L2_2 = L8_3
              L8_3 = L82_1
              L8_3()
              break
            end
          end
          L3_3 = tostring
          L4_3 = A0_2.message
          L3_3 = L3_3(L4_3)
          if "robabble object" ~= L3_3 then
            L3_3 = L3_2.Prop
            if "tr_prop_tr_elecbox_01a" ~= L3_3 then
              L3_3 = L3_2.Prop
              if "h4_prop_h4_chain_lock_01a" ~= L3_3 then
                L3_3 = L3_2.Prop
                if "hei_prop_hei_securitypanel" ~= L3_3 then
                  goto lbl_1157
                end
              end
            end
          end
          L3_3 = L3_2.Prop
          if "tr_prop_tr_elecbox_01a" == L3_3 then
            L3_3 = tostring
            L4_3 = A0_2.message
            L3_3 = L3_3(L4_3)
            if "robabble object" ~= L3_3 then
              L3_3 = Notify
              L4_3 = Config
              L4_3 = L4_3.T
              L5_3 = "PropAnimationPreset"
              L4_3 = L4_3(L5_3)
              L5_3 = "success"
              L3_3(L4_3, L5_3)
          end
          else
            L3_3 = L3_2.Prop
            if "hei_prop_hei_securitypanel" == L3_3 then
              L3_3 = tostring
              L4_3 = A0_2.message
              L3_3 = L3_3(L4_3)
              if "robabble object" ~= L3_3 then
                L3_3 = Notify
                L4_3 = Config
                L4_3 = L4_3.T
                L5_3 = "SecurityPanelDetected"
                L4_3 = L4_3(L5_3)
                L5_3 = "success"
                L3_3(L4_3, L5_3)
              end
            end
          end
          L3_3 = SelectedAnimationNumber
          SelectedAnimation = L3_3
          L3_3 = Config
          L3_3 = L3_3.RobberyAnimations
          L4_3 = L3_2.Prop
          L3_3 = L3_3[L4_3]
          if L3_3 then
            L3_3 = L3_2.Prop
            SelectedAnimation = L3_3
            L3_3 = {}
            L4_3 = {}
            L5_3 = L3_2.Target
            L5_3 = L5_3.x
            L4_3.x = L5_3
            L5_3 = L3_2.Target
            L5_3 = L5_3.y
            L4_3.y = L5_3
            L5_3 = L3_2.Target
            L5_3 = L5_3.z
            L4_3.z = L5_3
            L3_3.Target = L4_3
            L4_3 = L3_2.Prop
            L3_3.Prop = L4_3
            L4_3 = {}
            L5_3 = L3_1.x
            L4_3.x = L5_3
            L5_3 = L3_1.y
            L4_3.y = L5_3
            L5_3 = L3_1.z
            L4_3.z = L5_3
            L3_3.PedCoords = L4_3
            L4_3 = SelectedAnimation
            L3_3.Animation = L4_3
            L4_3 = L7_2
            L3_3.Heading = L4_3
            L4_3 = L3_2.PropHeading
            L3_3.PropHeading = L4_3
            L2_2 = L3_3
            L3_3 = L82_1
            L3_3()
            break
          end
          ::lbl_1157::
          L3_3 = Config
          L3_3 = L3_3.Animations
          L6_2 = L3_3
          EditingFeatureItem = "peds"
          SelectedAnimationNumber = 1
          L3_3 = L1_1
          L2_1 = L3_3
          L3_3 = ClonePedEx
          L4_3 = PlayerPedId
          L4_3 = L4_3()
          L5_3 = 0.0
          L6_3 = false
          L7_3 = true
          L8_3 = 1
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
          L1_1 = L3_3
          L3_3 = SetEntityHeading
          L4_3 = L1_1
          L5_3 = L7_2
          L3_3(L4_3, L5_3)
          L3_3 = SetEntityCollision
          L4_3 = L1_1
          L5_3 = false
          L6_3 = false
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = SetEntityInvincible
          L4_3 = L1_1
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = FreezeEntityPosition
          L4_3 = L1_1
          L5_3 = true
          L3_3(L4_3, L5_3)
          OriginalMode = true
        else
          L3_3 = SelectedAnimationNumber
          SelectedAnimation = L3_3
          L3_3 = Config
          L3_3 = L3_3.Animations
          L4_3 = SelectedAnimationNumber
          L3_3 = L3_3[L4_3]
          if L3_3 then
            L3_3 = Config
            L3_3 = L3_3.Animations
            L4_3 = SelectedAnimationNumber
            L3_3 = L3_3[L4_3]
            L3_3 = L3_3.NetworkedAnimations
            if L3_3 then
              L3_3 = Config
              L3_3 = L3_3.Animations
              L4_3 = SelectedAnimationNumber
              L3_3 = L3_3[L4_3]
              L3_3 = L3_3.NetworkedAnimations
              L3_3 = L3_3[1]
              L3_3 = L3_3.AnimAction
              if "action_var_01" == L3_3 then
                L3_3 = L3_2.Prop
                if "ch_prop_fingerprint_scanner_01e" == L3_3 then
                  goto lbl_1231
                end
              end
              L3_3 = Config
              L3_3 = L3_3.Animations
              L4_3 = SelectedAnimationNumber
              L3_3 = L3_3[L4_3]
              L3_3 = L3_3.NetworkedAnimations
              L3_3 = L3_3[1]
              L3_3 = L3_3.AnimAction
              if "hack_enter" == L3_3 then
                L3_3 = L3_2.Prop
                ::lbl_1231::
                if "hei_prop_hei_securitypanel" == L3_3 then
                  L3_3 = Config
                  L3_3 = L3_3.RobberyAnimations
                  L4_3 = L3_2.Prop
                  L3_3 = L3_3[L4_3]
                  if L3_3 then
                    L3_3 = L3_2.Prop
                    SelectedAnimation = L3_3
                  end
                end
              end
            end
          end
          L3_3 = {}
          L4_3 = {}
          L5_3 = L3_2.Target
          L5_3 = L5_3.x
          L4_3.x = L5_3
          L5_3 = L3_2.Target
          L5_3 = L5_3.y
          L4_3.y = L5_3
          L5_3 = L3_2.Target
          L5_3 = L5_3.z
          L4_3.z = L5_3
          L3_3.Target = L4_3
          L4_3 = L3_2.Prop
          L3_3.Prop = L4_3
          L4_3 = {}
          L5_3 = L3_1.x
          L4_3.x = L5_3
          L5_3 = L3_1.y
          L4_3.y = L5_3
          L5_3 = L3_1.z
          L4_3.z = L5_3
          L3_3.PedCoords = L4_3
          L4_3 = SelectedAnimation
          L3_3.Animation = L4_3
          L4_3 = L7_2
          L3_3.Heading = L4_3
          L4_3 = L3_2.PropHeading
          L3_3.PropHeading = L4_3
          L2_2 = L3_3
          L3_3 = L82_1
          L3_3()
        end
        L3_3 = setupScaleform
        L4_3 = "instructional_buttons"
        L5_3 = true
        L6_3 = {}
        L7_3 = L4_2
        L6_3.allowSaveAndExit = L7_3
        L3_3 = L3_3(L4_3, L5_3, L6_3)
        form = L3_3
      end
      L3_3 = true
      L4_3 = EditingFeatureItem
      if "props" == L4_3 then
        L3_3 = false
      end
      L4_3 = IsControlJustPressed
      L5_3 = 1
      L6_3 = 15
      L4_3 = L4_3(L5_3, L6_3)
      if not L4_3 then
        L4_3 = IsControlJustPressed
        L5_3 = 1
        L6_3 = 173
        L4_3 = L4_3(L5_3, L6_3)
        if not L4_3 then
          goto lbl_1503
        end
        L4_3 = OriginalMode
        if not L4_3 then
          goto lbl_1503
        end
      end
      L4_3 = DestroyAllProps
      L4_3()
      L4_3 = SelectedAnimationNumber
      L4_3 = L4_3 + 1
      SelectedAnimationNumber = L4_3
      L4_3 = Config
      L4_3 = L4_3.Animations
      L5_3 = SelectedAnimationNumber
      L4_3 = L4_3[L5_3]
      if L4_3 then
        L4_3 = Config
        L4_3 = L4_3.Animations
        L5_3 = SelectedAnimationNumber
        L4_3 = L4_3[L5_3]
        L4_3 = L4_3.NetworkedAnimations
        if L4_3 then
          L4_3 = OriginalMode
          if not L4_3 then
            L4_3 = GetEntityCoords
            L5_3 = L1_1
            L4_3 = L4_3(L5_3)
            L5_3 = SetEntityCoords
            L6_3 = L1_1
            L7_3 = L4_3.x
            L8_3 = L4_3.y
            L9_3 = L4_3.z
            L9_3 = L9_3 - 0.92
            L5_3(L6_3, L7_3, L8_3, L9_3)
          end
        end
      end
      L4_3 = SelectedAnimationNumber
      L5_3 = Config
      L5_3 = L5_3.Animations
      L5_3 = #L5_3
      if not (L4_3 > L5_3) or not L3_3 then
        L4_3 = EditingFeatureItem
        if "props" ~= L4_3 then
          goto lbl_1368
        end
        L4_3 = SelectedAnimationNumber
        L5_3 = L6_2
        L5_3 = #L5_3
        if not (L4_3 > L5_3) then
          goto lbl_1368
        end
      end
      SelectedAnimationNumber = 0
      L4_3 = EditingFeatureItem
      if "props" == L4_3 then
        L4_3 = DoesEntityExist
        L5_3 = L1_1
        L4_3 = L4_3(L5_3)
        if L4_3 then
          L4_3 = DeleteEntity
          L5_3 = L1_1
          L4_3(L5_3)
        end
      else
        L4_3 = ClearPedTasksImmediately
        L5_3 = L1_1
        L4_3(L5_3)
        goto lbl_1494
        ::lbl_1368::
        L4_3 = EditingFeatureItem
        if "props" == L4_3 then
          L4_3 = DoesEntityExist
          L5_3 = L1_1
          L4_3 = L4_3(L5_3)
          if L4_3 then
            L4_3 = DeleteEntity
            L5_3 = L1_1
            L4_3(L5_3)
          end
          L4_3 = LoadModel
          L6_3 = SelectedAnimationNumber
          L5_3 = L6_2
          L5_3 = L5_3[L6_3]
          L4_3(L5_3)
          L5_3 = SelectedAnimationNumber
          L4_3 = L6_2
          L4_3 = L4_3[L5_3]
          L5_3 = IsVehicleModel
          L6_3 = L4_3
          L5_3 = L5_3(L6_3)
          if L5_3 then
            L5_3 = Framework
            if "QBCore" == L5_3 then
              L5_3 = FWork
              L5_3 = L5_3.Shared
              L5_3 = L5_3.Vehicles
              L5_3 = L5_3[L4_3]
              if not L5_3 then
                L5_3 = Notify
                L6_3 = Config
                L6_3 = L6_3.T
                L7_3 = "NotInSharedVehiclesFormat"
                L8_3 = L4_3
                L6_3 = L6_3(L7_3, L8_3)
                L7_3 = "error"
                L5_3(L6_3, L7_3)
              end
            end
            L5_3 = CreateVehicle
            L6_3 = L4_3
            L7_3 = L3_1
            L5_3 = L5_3(L6_3, L7_3)
            L1_1 = L5_3
          else
            L5_3 = CreateObject
            L6_3 = L4_3
            L7_3 = L3_1
            L5_3 = L5_3(L6_3, L7_3)
            L1_1 = L5_3
          end
          L5_3 = SetEntityHeading
          L6_3 = L1_1
          L7_3 = GetEntityHeading
          L8_3 = L1_1
          L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L7_3(L8_3)
          L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
          L5_3 = SetEntityCollision
          L6_3 = L1_1
          L7_3 = false
          L8_3 = false
          L5_3(L6_3, L7_3, L8_3)
          L5_3 = SetEntityInvincible
          L6_3 = L1_1
          L7_3 = true
          L5_3(L6_3, L7_3)
          L5_3 = FreezeEntityPosition
          L6_3 = L1_1
          L7_3 = true
          L5_3(L6_3, L7_3)
        else
          L4_3 = Config
          L4_3 = L4_3.Animations
          L5_3 = SelectedAnimationNumber
          L4_3 = L4_3[L5_3]
          L4_3 = L4_3.IsScenario
          if not L4_3 then
            L4_3 = Config
            L4_3 = L4_3.Animations
            L5_3 = SelectedAnimationNumber
            L4_3 = L4_3[L5_3]
            L4_3 = L4_3.NetworkedAnimations
            if L4_3 then
              L4_3 = CreateThread
              function L5_3()
                local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4
                L0_4 = SelectedAnimationNumber
                L1_4 = ClearPedTasksImmediately
                L2_4 = L1_1
                L1_4(L2_4)
                while true do
                  L1_4 = SelectedAnimationNumber
                  if L0_4 ~= L1_4 then
                    break
                  end
                  L1_4 = 1
                  L2_4 = Config
                  L2_4 = L2_4.Animations
                  L3_4 = SelectedAnimationNumber
                  L2_4 = L2_4[L3_4]
                  L2_4 = L2_4.NetworkedAnimations
                  L2_4 = #L2_4
                  L3_4 = 1
                  for L4_4 = L1_4, L2_4, L3_4 do
                    L5_4 = SelectedAnimationNumber
                    if L0_4 ~= L5_4 then
                      break
                    end
                    L5_4 = loadAnimDict
                    L6_4 = Config
                    L6_4 = L6_4.Animations
                    L7_4 = SelectedAnimationNumber
                    L6_4 = L6_4[L7_4]
                    L6_4 = L6_4.NetworkedAnimations
                    L6_4 = L6_4[L4_4]
                    L6_4 = L6_4.AnimDict
                    L5_4(L6_4)
                    L5_4 = TaskPlayAnim
                    L6_4 = L1_1
                    L7_4 = Config
                    L7_4 = L7_4.Animations
                    L8_4 = SelectedAnimationNumber
                    L7_4 = L7_4[L8_4]
                    L7_4 = L7_4.NetworkedAnimations
                    L7_4 = L7_4[L4_4]
                    L7_4 = L7_4.AnimDict
                    L8_4 = Config
                    L8_4 = L8_4.Animations
                    L9_4 = SelectedAnimationNumber
                    L8_4 = L8_4[L9_4]
                    L8_4 = L8_4.NetworkedAnimations
                    L8_4 = L8_4[L4_4]
                    L8_4 = L8_4.AnimAction
                    L9_4 = 2.0
                    L10_4 = 2.0
                    L11_4 = -1
                    L12_4 = 47
                    L13_4 = 1.0
                    L14_4 = 0
                    L15_4 = 0
                    L16_4 = 0
                    L5_4(L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4)
                    L5_4 = Config
                    L5_4 = L5_4.Animations
                    L6_4 = SelectedAnimationNumber
                    L5_4 = L5_4[L6_4]
                    L5_4 = L5_4.NetworkedAnimations
                    L5_4 = L5_4[L4_4]
                    L5_4 = L5_4.AnimationOptions
                    if L5_4 then
                      L5_4 = Config
                      L5_4 = L5_4.Animations
                      L6_4 = SelectedAnimationNumber
                      L5_4 = L5_4[L6_4]
                      L5_4 = L5_4.NetworkedAnimations
                      L5_4 = L5_4[L4_4]
                      L5_4 = L5_4.AnimationOptions
                      L5_4 = L5_4.ThirdProp
                      if L5_4 then
                        L5_4 = table
                        L5_4 = L5_4.unpack
                        L6_4 = Config
                        L6_4 = L6_4.Animations
                        L7_4 = SelectedAnimationNumber
                        L6_4 = L6_4[L7_4]
                        L6_4 = L6_4.NetworkedAnimations
                        L6_4 = L6_4[L4_4]
                        L6_4 = L6_4.AnimationOptions
                        L6_4 = L6_4.ThirdPropPlacement
                        L5_4, L6_4, L7_4, L8_4, L9_4, L10_4 = L5_4(L6_4)
                        L11_4 = AddPropToPlayer
                        L12_4 = Config
                        L12_4 = L12_4.Animations
                        L13_4 = SelectedAnimationNumber
                        L12_4 = L12_4[L13_4]
                        L12_4 = L12_4.NetworkedAnimations
                        L12_4 = L12_4[L4_4]
                        L12_4 = L12_4.AnimationOptions
                        L12_4 = L12_4.ThirdProp
                        L13_4 = Config
                        L13_4 = L13_4.Animations
                        L14_4 = SelectedAnimationNumber
                        L13_4 = L13_4[L14_4]
                        L13_4 = L13_4.NetworkedAnimations
                        L13_4 = L13_4[1]
                        L13_4 = L13_4.AnimationOptions
                        L13_4 = L13_4.PropBone
                        L14_4 = L5_4
                        L15_4 = L6_4
                        L16_4 = L7_4
                        L17_4 = L8_4
                        L18_4 = L9_4
                        L19_4 = L10_4
                        L20_4 = L1_1
                        L11_4(L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4)
                      end
                    end
                    L5_4 = Config
                    L5_4 = L5_4.Animations
                    L6_4 = SelectedAnimationNumber
                    L5_4 = L5_4[L6_4]
                    L5_4 = L5_4.NetworkedAnimations
                    L5_4 = L5_4[L4_4]
                    L5_4 = L5_4.WaitTime
                    L6_4 = 0
                    L7_4 = Config
                    L7_4 = L7_4.Animations
                    L8_4 = SelectedAnimationNumber
                    L7_4 = L7_4[L8_4]
                    L7_4 = L7_4.NetworkedAnimations
                    if L7_4 then
                      L7_4 = Config
                      L7_4 = L7_4.Animations
                      L8_4 = SelectedAnimationNumber
                      L7_4 = L7_4[L8_4]
                      L7_4 = L7_4.NetworkedAnimations
                      L7_4 = L7_4[L4_4]
                      L7_4 = L7_4.AnimationOptions
                      if L7_4 then
                        L7_4 = Config
                        L7_4 = L7_4.Animations
                        L8_4 = SelectedAnimationNumber
                        L7_4 = L7_4[L8_4]
                        L7_4 = L7_4.NetworkedAnimations
                        L7_4 = L7_4[L4_4]
                        L7_4 = L7_4.AnimationOptions
                        L7_4 = L7_4.ThirdProp
                        if L7_4 and 1 == L4_4 then
                          L5_4 = 1500
                        end
                        L7_4 = Config
                        L7_4 = L7_4.Animations
                        L8_4 = SelectedAnimationNumber
                        L7_4 = L7_4[L8_4]
                        L7_4 = L7_4.NetworkedAnimations
                        L7_4 = L7_4[L4_4]
                        L7_4 = L7_4.AnimationOptions
                        L7_4 = L7_4.ThirdProp
                        if L7_4 and 2 == L4_4 then
                          L7_4 = DetachEntity
                          L8_4 = prop
                          L9_4 = 1
                          L10_4 = 1
                          L7_4(L8_4, L9_4, L10_4)
                          L7_4 = FreezeEntityPosition
                          L8_4 = prop
                          L9_4 = true
                          L7_4(L8_4, L9_4)
                          L7_4 = GetEntityCoords
                          L8_4 = prop
                          L7_4 = L7_4(L8_4)
                          L8_4 = SetEntityCoords
                          L9_4 = prop
                          L10_4 = vector3
                          L11_4 = L7_4.x
                          L12_4 = L7_4.y
                          L13_4 = L7_4.z
                          L13_4 = L13_4 + 0.2
                          L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4 = L10_4(L11_4, L12_4, L13_4)
                          L8_4(L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4)
                        end
                        L7_4 = Config
                        L7_4 = L7_4.Animations
                        L8_4 = SelectedAnimationNumber
                        L7_4 = L7_4[L8_4]
                        L7_4 = L7_4.NetworkedAnimations
                        L7_4 = L7_4[L4_4]
                        L7_4 = L7_4.AnimationOptions
                        L7_4 = L7_4.ThirdProp
                        if L7_4 and 3 == L4_4 then
                          L7_4 = DestroyAllProps
                          L7_4()
                        end
                      end
                    end
                    while L6_4 < L5_4 do
                      L7_4 = SelectedAnimationNumber
                      if L0_4 ~= L7_4 then
                        break
                      end
                      L7_4 = Wait
                      L8_4 = 10
                      L7_4(L8_4)
                      L6_4 = L6_4 + 10
                    end
                  end
                  L1_4 = Wait
                  L2_4 = 0
                  L1_4(L2_4)
                end
              end
              L4_3(L5_3)
            else
              L4_3 = ClearPedTasksImmediately
              L5_3 = L1_1
              L4_3(L5_3)
              L4_3 = Config
              L4_3 = L4_3.Animations
              L5_3 = SelectedAnimationNumber
              L4_3 = L4_3[L5_3]
              L4_3 = L4_3.NetworkedAnimations
              if not L4_3 then
                L4_3 = loadAnimDict
                L5_3 = Config
                L5_3 = L5_3.Animations
                L6_3 = SelectedAnimationNumber
                L5_3 = L5_3[L6_3]
                L5_3 = L5_3.AnimDict
                L4_3(L5_3)
              end
              L4_3 = TriggerEvent
              L5_3 = "Pug:client:DoRobberiesAnimation"
              L6_3 = SelectedAnimationNumber
              L7_3 = L1_1
              L4_3(L5_3, L6_3, L7_3)
            end
          else
            L4_3 = ClearPedTasksImmediately
            L5_3 = L1_1
            L4_3(L5_3)
            L4_3 = TaskStartScenarioInPlace
            L5_3 = L1_1
            L6_3 = Config
            L6_3 = L6_3.Animations
            L7_3 = SelectedAnimationNumber
            L6_3 = L6_3[L7_3]
            L6_3 = L6_3.AnimDict
            L7_3 = 0
            L8_3 = false
            L4_3(L5_3, L6_3, L7_3, L8_3)
          end
        end
      end
      ::lbl_1494::
      L4_3 = setupScaleform
      L5_3 = "instructional_buttons"
      L6_3 = true
      L7_3 = {}
      L8_3 = L4_2
      L7_3.allowSaveAndExit = L8_3
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      form = L4_3
      ::lbl_1503::
      L4_3 = IsControlJustPressed
      L5_3 = 1
      L6_3 = 14
      L4_3 = L4_3(L5_3, L6_3)
      if not L4_3 then
        L4_3 = IsControlJustPressed
        L5_3 = 1
        L6_3 = 172
        L4_3 = L4_3(L5_3, L6_3)
        if not L4_3 then
          goto lbl_1846
        end
        L4_3 = OriginalMode
        if not L4_3 then
          goto lbl_1846
        end
      end
      L4_3 = DestroyAllProps
      L4_3()
      L4_3 = SelectedAnimationNumber
      L4_3 = L4_3 - 1
      SelectedAnimationNumber = L4_3
      L4_3 = Config
      L4_3 = L4_3.Animations
      L5_3 = SelectedAnimationNumber
      L4_3 = L4_3[L5_3]
      if L4_3 then
        L4_3 = Config
        L4_3 = L4_3.Animations
        L5_3 = SelectedAnimationNumber
        L4_3 = L4_3[L5_3]
        L4_3 = L4_3.NetworkedAnimations
        if L4_3 then
          L4_3 = OriginalMode
          if not L4_3 then
            L4_3 = GetEntityCoords
            L5_3 = L1_1
            L4_3 = L4_3(L5_3)
            L5_3 = SetEntityCoords
            L6_3 = L1_1
            L7_3 = L4_3.x
            L8_3 = L4_3.y
            L9_3 = L4_3.z
            L9_3 = L9_3 - 0.92
            L5_3(L6_3, L7_3, L8_3, L9_3)
          end
        end
      end
      L4_3 = SelectedAnimationNumber
      if 0 == L4_3 then
        L4_3 = EditingFeatureItem
        if "props" == L4_3 then
          L4_3 = DoesEntityExist
          L5_3 = L1_1
          L4_3 = L4_3(L5_3)
          if L4_3 then
            L4_3 = DeleteEntity
            L5_3 = L1_1
            L4_3(L5_3)
          end
        else
          L4_3 = ClearPedTasksImmediately
          L5_3 = L1_1
          L4_3(L5_3)
        end
      else
        L4_3 = SelectedAnimationNumber
        if L4_3 < 0 then
          L4_3 = EditingFeatureItem
          if "props" == L4_3 then
            L4_3 = L6_2
            L4_3 = #L4_3
            SelectedAnimationNumber = L4_3
          else
            L4_3 = Config
            L4_3 = L4_3.Animations
            L4_3 = #L4_3
            SelectedAnimationNumber = L4_3
          end
          L4_3 = EditingFeatureItem
          if "props" == L4_3 then
            L4_3 = DoesEntityExist
            L5_3 = L1_1
            L4_3 = L4_3(L5_3)
            if L4_3 then
              L4_3 = DeleteEntity
              L5_3 = L1_1
              L4_3(L5_3)
            end
            L4_3 = LoadModel
            L6_3 = SelectedAnimationNumber
            L5_3 = L6_2
            L5_3 = L5_3[L6_3]
            L4_3(L5_3)
            L5_3 = SelectedAnimationNumber
            L4_3 = L6_2
            L4_3 = L4_3[L5_3]
            L5_3 = IsVehicleModel
            L6_3 = L4_3
            L5_3 = L5_3(L6_3)
            if L5_3 then
              L5_3 = Framework
              if "QBCore" == L5_3 then
                L5_3 = FWork
                L5_3 = L5_3.Shared
                L5_3 = L5_3.Vehicles
                L5_3 = L5_3[L4_3]
                if not L5_3 then
                  L5_3 = Notify
                  L6_3 = Config
                  L6_3 = L6_3.T
                  L7_3 = "NotInSharedVehiclesFormat"
                  L8_3 = L4_3
                  L6_3 = L6_3(L7_3, L8_3)
                  L7_3 = "error"
                  L5_3(L6_3, L7_3)
                end
              end
              L5_3 = CreateVehicle
              L6_3 = L4_3
              L7_3 = L3_1
              L5_3 = L5_3(L6_3, L7_3)
              L1_1 = L5_3
            else
              L5_3 = CreateObject
              L6_3 = L4_3
              L7_3 = L3_1
              L5_3 = L5_3(L6_3, L7_3)
              L1_1 = L5_3
            end
            L5_3 = SetEntityHeading
            L6_3 = L1_1
            L7_3 = GetEntityHeading
            L8_3 = L1_1
            L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L7_3(L8_3)
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
            L5_3 = SetEntityCollision
            L6_3 = L1_1
            L7_3 = false
            L8_3 = false
            L5_3(L6_3, L7_3, L8_3)
            L5_3 = SetEntityInvincible
            L6_3 = L1_1
            L7_3 = true
            L5_3(L6_3, L7_3)
            L5_3 = FreezeEntityPosition
            L6_3 = L1_1
            L7_3 = true
            L5_3(L6_3, L7_3)
          else
            L4_3 = Config
            L4_3 = L4_3.Animations
            L5_3 = SelectedAnimationNumber
            L4_3 = L4_3[L5_3]
            L4_3 = L4_3.IsScenario
            if not L4_3 then
              L4_3 = Config
              L4_3 = L4_3.Animations
              L5_3 = SelectedAnimationNumber
              L4_3 = L4_3[L5_3]
              L4_3 = L4_3.NetworkedAnimations
              if L4_3 then
                L4_3 = CreateThread
                function L5_3()
                  local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4
                  L0_4 = SelectedAnimationNumber
                  L1_4 = ClearPedTasksImmediately
                  L2_4 = L1_1
                  L1_4(L2_4)
                  while true do
                    L1_4 = SelectedAnimationNumber
                    if L0_4 ~= L1_4 then
                      break
                    end
                    L1_4 = 1
                    L2_4 = Config
                    L2_4 = L2_4.Animations
                    L3_4 = SelectedAnimationNumber
                    L2_4 = L2_4[L3_4]
                    L2_4 = L2_4.NetworkedAnimations
                    L2_4 = #L2_4
                    L3_4 = 1
                    for L4_4 = L1_4, L2_4, L3_4 do
                      L5_4 = SelectedAnimationNumber
                      if L0_4 ~= L5_4 then
                        break
                      end
                      L5_4 = loadAnimDict
                      L6_4 = Config
                      L6_4 = L6_4.Animations
                      L7_4 = SelectedAnimationNumber
                      L6_4 = L6_4[L7_4]
                      L6_4 = L6_4.NetworkedAnimations
                      L6_4 = L6_4[L4_4]
                      L6_4 = L6_4.AnimDict
                      L5_4(L6_4)
                      L5_4 = TaskPlayAnim
                      L6_4 = L1_1
                      L7_4 = Config
                      L7_4 = L7_4.Animations
                      L8_4 = SelectedAnimationNumber
                      L7_4 = L7_4[L8_4]
                      L7_4 = L7_4.NetworkedAnimations
                      L7_4 = L7_4[L4_4]
                      L7_4 = L7_4.AnimDict
                      L8_4 = Config
                      L8_4 = L8_4.Animations
                      L9_4 = SelectedAnimationNumber
                      L8_4 = L8_4[L9_4]
                      L8_4 = L8_4.NetworkedAnimations
                      L8_4 = L8_4[L4_4]
                      L8_4 = L8_4.AnimAction
                      L9_4 = 2.0
                      L10_4 = 2.0
                      L11_4 = -1
                      L12_4 = 47
                      L13_4 = 1.0
                      L14_4 = 0
                      L15_4 = 0
                      L16_4 = 0
                      L5_4(L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4)
                      L5_4 = Config
                      L5_4 = L5_4.Animations
                      L6_4 = SelectedAnimationNumber
                      L5_4 = L5_4[L6_4]
                      L5_4 = L5_4.NetworkedAnimations
                      L5_4 = L5_4[L4_4]
                      L5_4 = L5_4.AnimationOptions
                      if L5_4 then
                        L5_4 = Config
                        L5_4 = L5_4.Animations
                        L6_4 = SelectedAnimationNumber
                        L5_4 = L5_4[L6_4]
                        L5_4 = L5_4.NetworkedAnimations
                        L5_4 = L5_4[L4_4]
                        L5_4 = L5_4.AnimationOptions
                        L5_4 = L5_4.ThirdProp
                        if L5_4 then
                          L5_4 = table
                          L5_4 = L5_4.unpack
                          L6_4 = Config
                          L6_4 = L6_4.Animations
                          L7_4 = SelectedAnimationNumber
                          L6_4 = L6_4[L7_4]
                          L6_4 = L6_4.NetworkedAnimations
                          L6_4 = L6_4[L4_4]
                          L6_4 = L6_4.AnimationOptions
                          L6_4 = L6_4.ThirdPropPlacement
                          L5_4, L6_4, L7_4, L8_4, L9_4, L10_4 = L5_4(L6_4)
                          L11_4 = AddPropToPlayer
                          L12_4 = Config
                          L12_4 = L12_4.Animations
                          L13_4 = SelectedAnimationNumber
                          L12_4 = L12_4[L13_4]
                          L12_4 = L12_4.NetworkedAnimations
                          L12_4 = L12_4[L4_4]
                          L12_4 = L12_4.AnimationOptions
                          L12_4 = L12_4.ThirdProp
                          L13_4 = Config
                          L13_4 = L13_4.Animations
                          L14_4 = SelectedAnimationNumber
                          L13_4 = L13_4[L14_4]
                          L13_4 = L13_4.NetworkedAnimations
                          L13_4 = L13_4[1]
                          L13_4 = L13_4.AnimationOptions
                          L13_4 = L13_4.PropBone
                          L14_4 = L5_4
                          L15_4 = L6_4
                          L16_4 = L7_4
                          L17_4 = L8_4
                          L18_4 = L9_4
                          L19_4 = L10_4
                          L20_4 = L1_1
                          L11_4(L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4)
                        end
                      end
                      L5_4 = Config
                      L5_4 = L5_4.Animations
                      L6_4 = SelectedAnimationNumber
                      L5_4 = L5_4[L6_4]
                      L5_4 = L5_4.NetworkedAnimations
                      L5_4 = L5_4[L4_4]
                      L5_4 = L5_4.WaitTime
                      L6_4 = 0
                      L7_4 = Config
                      L7_4 = L7_4.Animations
                      L8_4 = SelectedAnimationNumber
                      L7_4 = L7_4[L8_4]
                      L7_4 = L7_4.NetworkedAnimations
                      if L7_4 then
                        L7_4 = Config
                        L7_4 = L7_4.Animations
                        L8_4 = SelectedAnimationNumber
                        L7_4 = L7_4[L8_4]
                        L7_4 = L7_4.NetworkedAnimations
                        L7_4 = L7_4[L4_4]
                        L7_4 = L7_4.AnimationOptions
                        if L7_4 then
                          L7_4 = Config
                          L7_4 = L7_4.Animations
                          L8_4 = SelectedAnimationNumber
                          L7_4 = L7_4[L8_4]
                          L7_4 = L7_4.NetworkedAnimations
                          L7_4 = L7_4[L4_4]
                          L7_4 = L7_4.AnimationOptions
                          L7_4 = L7_4.ThirdProp
                          if L7_4 and 1 == L4_4 then
                            L7_4 = SelectedAnimationNumber
                            if 7 == L7_4 then
                              L5_4 = 1500
                            end
                          end
                          L7_4 = Config
                          L7_4 = L7_4.Animations
                          L8_4 = SelectedAnimationNumber
                          L7_4 = L7_4[L8_4]
                          L7_4 = L7_4.NetworkedAnimations
                          L7_4 = L7_4[L4_4]
                          L7_4 = L7_4.AnimationOptions
                          L7_4 = L7_4.ThirdProp
                          if L7_4 and 2 == L4_4 then
                            L7_4 = DetachEntity
                            L8_4 = prop
                            L9_4 = 1
                            L10_4 = 1
                            L7_4(L8_4, L9_4, L10_4)
                            L7_4 = FreezeEntityPosition
                            L8_4 = prop
                            L9_4 = true
                            L7_4(L8_4, L9_4)
                            L7_4 = GetEntityCoords
                            L8_4 = prop
                            L7_4 = L7_4(L8_4)
                            L8_4 = SetEntityCoords
                            L9_4 = prop
                            L10_4 = vector3
                            L11_4 = L7_4.x
                            L12_4 = L7_4.y
                            L13_4 = L7_4.z
                            L13_4 = L13_4 + 0.2
                            L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4 = L10_4(L11_4, L12_4, L13_4)
                            L8_4(L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4)
                          end
                          L7_4 = Config
                          L7_4 = L7_4.Animations
                          L8_4 = SelectedAnimationNumber
                          L7_4 = L7_4[L8_4]
                          L7_4 = L7_4.NetworkedAnimations
                          L7_4 = L7_4[L4_4]
                          L7_4 = L7_4.AnimationOptions
                          L7_4 = L7_4.ThirdProp
                          if L7_4 and 3 == L4_4 then
                            L7_4 = DestroyAllProps
                            L7_4()
                          end
                        end
                      end
                      while L6_4 < L5_4 do
                        L7_4 = SelectedAnimationNumber
                        if L0_4 ~= L7_4 then
                          break
                        end
                        L7_4 = Wait
                        L8_4 = 10
                        L7_4(L8_4)
                        L6_4 = L6_4 + 10
                      end
                    end
                    L1_4 = Wait
                    L2_4 = 0
                    L1_4(L2_4)
                  end
                end
                L4_3(L5_3)
              else
                L4_3 = ClearPedTasksImmediately
                L5_3 = L1_1
                L4_3(L5_3)
                L4_3 = Config
                L4_3 = L4_3.Animations
                L5_3 = SelectedAnimationNumber
                L4_3 = L4_3[L5_3]
                L4_3 = L4_3.NetworkedAnimations
                if not L4_3 then
                  L4_3 = loadAnimDict
                  L5_3 = Config
                  L5_3 = L5_3.Animations
                  L6_3 = SelectedAnimationNumber
                  L5_3 = L5_3[L6_3]
                  L5_3 = L5_3.AnimDict
                  L4_3(L5_3)
                end
                L4_3 = TriggerEvent
                L5_3 = "Pug:client:DoRobberiesAnimation"
                L6_3 = SelectedAnimationNumber
                L7_3 = L1_1
                L4_3(L5_3, L6_3, L7_3)
              end
            else
              L4_3 = ClearPedTasksImmediately
              L5_3 = L1_1
              L4_3(L5_3)
              L4_3 = TaskStartScenarioInPlace
              L5_3 = L1_1
              L6_3 = Config
              L6_3 = L6_3.Animations
              L7_3 = SelectedAnimationNumber
              L6_3 = L6_3[L7_3]
              L6_3 = L6_3.AnimDict
              L7_3 = 0
              L8_3 = false
              L4_3(L5_3, L6_3, L7_3, L8_3)
            end
          end
        else
          L4_3 = EditingFeatureItem
          if "props" == L4_3 then
            L4_3 = DoesEntityExist
            L5_3 = L1_1
            L4_3 = L4_3(L5_3)
            if L4_3 then
              L4_3 = DeleteEntity
              L5_3 = L1_1
              L4_3(L5_3)
            end
            L4_3 = LoadModel
            L6_3 = SelectedAnimationNumber
            L5_3 = L6_2
            L5_3 = L5_3[L6_3]
            L4_3(L5_3)
            L5_3 = SelectedAnimationNumber
            L4_3 = L6_2
            L4_3 = L4_3[L5_3]
            L5_3 = IsVehicleModel
            L6_3 = L4_3
            L5_3 = L5_3(L6_3)
            if L5_3 then
              L5_3 = Framework
              if "QBCore" == L5_3 then
                L5_3 = FWork
                L5_3 = L5_3.Shared
                L5_3 = L5_3.Vehicles
                L5_3 = L5_3[L4_3]
                if not L5_3 then
                  L5_3 = Notify
                  L6_3 = Config
                  L6_3 = L6_3.T
                  L7_3 = "NotInSharedVehiclesFormat"
                  L8_3 = L4_3
                  L6_3 = L6_3(L7_3, L8_3)
                  L7_3 = "error"
                  L5_3(L6_3, L7_3)
                end
              end
              L5_3 = CreateVehicle
              L6_3 = L4_3
              L7_3 = L3_1
              L5_3 = L5_3(L6_3, L7_3)
              L1_1 = L5_3
            else
              L5_3 = CreateObject
              L6_3 = L4_3
              L7_3 = L3_1
              L5_3 = L5_3(L6_3, L7_3)
              L1_1 = L5_3
            end
            L5_3 = SetEntityHeading
            L6_3 = L1_1
            L7_3 = GetEntityHeading
            L8_3 = L1_1
            L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3 = L7_3(L8_3)
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3)
            L5_3 = SetEntityCollision
            L6_3 = L1_1
            L7_3 = false
            L8_3 = false
            L5_3(L6_3, L7_3, L8_3)
            L5_3 = SetEntityInvincible
            L6_3 = L1_1
            L7_3 = true
            L5_3(L6_3, L7_3)
            L5_3 = FreezeEntityPosition
            L6_3 = L1_1
            L7_3 = true
            L5_3(L6_3, L7_3)
          else
            L4_3 = Config
            L4_3 = L4_3.Animations
            L5_3 = SelectedAnimationNumber
            L4_3 = L4_3[L5_3]
            L4_3 = L4_3.IsScenario
            if not L4_3 then
              L4_3 = Config
              L4_3 = L4_3.Animations
              L5_3 = SelectedAnimationNumber
              L4_3 = L4_3[L5_3]
              L4_3 = L4_3.NetworkedAnimations
              if L4_3 then
                L4_3 = CreateThread
                function L5_3()
                  local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4
                  L0_4 = SelectedAnimationNumber
                  L1_4 = ClearPedTasksImmediately
                  L2_4 = L1_1
                  L1_4(L2_4)
                  while true do
                    L1_4 = SelectedAnimationNumber
                    if L0_4 ~= L1_4 then
                      break
                    end
                    L1_4 = 1
                    L2_4 = Config
                    L2_4 = L2_4.Animations
                    L3_4 = SelectedAnimationNumber
                    L2_4 = L2_4[L3_4]
                    L2_4 = L2_4.NetworkedAnimations
                    L2_4 = #L2_4
                    L3_4 = 1
                    for L4_4 = L1_4, L2_4, L3_4 do
                      L5_4 = SelectedAnimationNumber
                      if L0_4 ~= L5_4 then
                        break
                      end
                      L5_4 = loadAnimDict
                      L6_4 = Config
                      L6_4 = L6_4.Animations
                      L7_4 = SelectedAnimationNumber
                      L6_4 = L6_4[L7_4]
                      L6_4 = L6_4.NetworkedAnimations
                      L6_4 = L6_4[L4_4]
                      L6_4 = L6_4.AnimDict
                      L5_4(L6_4)
                      L5_4 = TaskPlayAnim
                      L6_4 = L1_1
                      L7_4 = Config
                      L7_4 = L7_4.Animations
                      L8_4 = SelectedAnimationNumber
                      L7_4 = L7_4[L8_4]
                      L7_4 = L7_4.NetworkedAnimations
                      L7_4 = L7_4[L4_4]
                      L7_4 = L7_4.AnimDict
                      L8_4 = Config
                      L8_4 = L8_4.Animations
                      L9_4 = SelectedAnimationNumber
                      L8_4 = L8_4[L9_4]
                      L8_4 = L8_4.NetworkedAnimations
                      L8_4 = L8_4[L4_4]
                      L8_4 = L8_4.AnimAction
                      L9_4 = 2.0
                      L10_4 = 2.0
                      L11_4 = -1
                      L12_4 = 47
                      L13_4 = 1.0
                      L14_4 = 0
                      L15_4 = 0
                      L16_4 = 0
                      L5_4(L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4)
                      L5_4 = Config
                      L5_4 = L5_4.Animations
                      L6_4 = SelectedAnimationNumber
                      L5_4 = L5_4[L6_4]
                      L5_4 = L5_4.NetworkedAnimations
                      L5_4 = L5_4[L4_4]
                      L5_4 = L5_4.AnimationOptions
                      if L5_4 then
                        L5_4 = Config
                        L5_4 = L5_4.Animations
                        L6_4 = SelectedAnimationNumber
                        L5_4 = L5_4[L6_4]
                        L5_4 = L5_4.NetworkedAnimations
                        L5_4 = L5_4[L4_4]
                        L5_4 = L5_4.AnimationOptions
                        L5_4 = L5_4.ThirdProp
                        if L5_4 then
                          L5_4 = table
                          L5_4 = L5_4.unpack
                          L6_4 = Config
                          L6_4 = L6_4.Animations
                          L7_4 = SelectedAnimationNumber
                          L6_4 = L6_4[L7_4]
                          L6_4 = L6_4.NetworkedAnimations
                          L6_4 = L6_4[L4_4]
                          L6_4 = L6_4.AnimationOptions
                          L6_4 = L6_4.ThirdPropPlacement
                          L5_4, L6_4, L7_4, L8_4, L9_4, L10_4 = L5_4(L6_4)
                          L11_4 = AddPropToPlayer
                          L12_4 = Config
                          L12_4 = L12_4.Animations
                          L13_4 = SelectedAnimationNumber
                          L12_4 = L12_4[L13_4]
                          L12_4 = L12_4.NetworkedAnimations
                          L12_4 = L12_4[L4_4]
                          L12_4 = L12_4.AnimationOptions
                          L12_4 = L12_4.ThirdProp
                          L13_4 = Config
                          L13_4 = L13_4.Animations
                          L14_4 = SelectedAnimationNumber
                          L13_4 = L13_4[L14_4]
                          L13_4 = L13_4.NetworkedAnimations
                          L13_4 = L13_4[1]
                          L13_4 = L13_4.AnimationOptions
                          L13_4 = L13_4.PropBone
                          L14_4 = L5_4
                          L15_4 = L6_4
                          L16_4 = L7_4
                          L17_4 = L8_4
                          L18_4 = L9_4
                          L19_4 = L10_4
                          L20_4 = L1_1
                          L11_4(L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4)
                        end
                      end
                      L5_4 = Config
                      L5_4 = L5_4.Animations
                      L6_4 = SelectedAnimationNumber
                      L5_4 = L5_4[L6_4]
                      L5_4 = L5_4.NetworkedAnimations
                      L5_4 = L5_4[L4_4]
                      L5_4 = L5_4.WaitTime
                      L6_4 = 0
                      L7_4 = Config
                      L7_4 = L7_4.Animations
                      L8_4 = SelectedAnimationNumber
                      L7_4 = L7_4[L8_4]
                      L7_4 = L7_4.NetworkedAnimations
                      if L7_4 then
                        L7_4 = Config
                        L7_4 = L7_4.Animations
                        L8_4 = SelectedAnimationNumber
                        L7_4 = L7_4[L8_4]
                        L7_4 = L7_4.NetworkedAnimations
                        L7_4 = L7_4[L4_4]
                        L7_4 = L7_4.AnimationOptions
                        if L7_4 then
                          L7_4 = Config
                          L7_4 = L7_4.Animations
                          L8_4 = SelectedAnimationNumber
                          L7_4 = L7_4[L8_4]
                          L7_4 = L7_4.NetworkedAnimations
                          L7_4 = L7_4[L4_4]
                          L7_4 = L7_4.AnimationOptions
                          L7_4 = L7_4.ThirdProp
                          if L7_4 and 1 == L4_4 then
                            L5_4 = 1500
                          end
                          L7_4 = Config
                          L7_4 = L7_4.Animations
                          L8_4 = SelectedAnimationNumber
                          L7_4 = L7_4[L8_4]
                          L7_4 = L7_4.NetworkedAnimations
                          L7_4 = L7_4[L4_4]
                          L7_4 = L7_4.AnimationOptions
                          L7_4 = L7_4.ThirdProp
                          if L7_4 and 2 == L4_4 then
                            L7_4 = DetachEntity
                            L8_4 = prop
                            L9_4 = 1
                            L10_4 = 1
                            L7_4(L8_4, L9_4, L10_4)
                            L7_4 = FreezeEntityPosition
                            L8_4 = prop
                            L9_4 = true
                            L7_4(L8_4, L9_4)
                            L7_4 = GetEntityCoords
                            L8_4 = prop
                            L7_4 = L7_4(L8_4)
                            L8_4 = SetEntityCoords
                            L9_4 = prop
                            L10_4 = vector3
                            L11_4 = L7_4.x
                            L12_4 = L7_4.y
                            L13_4 = L7_4.z
                            L13_4 = L13_4 + 0.2
                            L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4 = L10_4(L11_4, L12_4, L13_4)
                            L8_4(L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4)
                          end
                          L7_4 = Config
                          L7_4 = L7_4.Animations
                          L8_4 = SelectedAnimationNumber
                          L7_4 = L7_4[L8_4]
                          L7_4 = L7_4.NetworkedAnimations
                          L7_4 = L7_4[L4_4]
                          L7_4 = L7_4.AnimationOptions
                          L7_4 = L7_4.ThirdProp
                          if L7_4 and 3 == L4_4 then
                            L7_4 = DestroyAllProps
                            L7_4()
                          end
                        end
                      end
                      while L6_4 < L5_4 do
                        L7_4 = SelectedAnimationNumber
                        if L0_4 ~= L7_4 then
                          break
                        end
                        L7_4 = Wait
                        L8_4 = 10
                        L7_4(L8_4)
                        L6_4 = L6_4 + 10
                      end
                    end
                    L1_4 = Wait
                    L2_4 = 0
                    L1_4(L2_4)
                  end
                end
                L4_3(L5_3)
              else
                L4_3 = ClearPedTasksImmediately
                L5_3 = L1_1
                L4_3(L5_3)
                L4_3 = Config
                L4_3 = L4_3.Animations
                L5_3 = SelectedAnimationNumber
                L4_3 = L4_3[L5_3]
                L4_3 = L4_3.NetworkedAnimations
                if not L4_3 then
                  L4_3 = loadAnimDict
                  L5_3 = Config
                  L5_3 = L5_3.Animations
                  L6_3 = SelectedAnimationNumber
                  L5_3 = L5_3[L6_3]
                  L5_3 = L5_3.AnimDict
                  L4_3(L5_3)
                end
                L4_3 = TriggerEvent
                L5_3 = "Pug:client:DoRobberiesAnimation"
                L6_3 = SelectedAnimationNumber
                L7_3 = L1_1
                L4_3(L5_3, L6_3, L7_3)
              end
            else
              L4_3 = ClearPedTasksImmediately
              L5_3 = L1_1
              L4_3(L5_3)
              L4_3 = TaskStartScenarioInPlace
              L5_3 = L1_1
              L6_3 = Config
              L6_3 = L6_3.Animations
              L7_3 = SelectedAnimationNumber
              L6_3 = L6_3[L7_3]
              L6_3 = L6_3.AnimDict
              L7_3 = 0
              L8_3 = false
              L4_3(L5_3, L6_3, L7_3, L8_3)
            end
          end
        end
      end
      L4_3 = setupScaleform
      L5_3 = "instructional_buttons"
      L6_3 = true
      L7_3 = {}
      L8_3 = L4_2
      L7_3.allowSaveAndExit = L8_3
      L4_3 = L4_3(L5_3, L6_3, L7_3)
      form = L4_3
      ::lbl_1846::
      L4_3 = Config
      L4_3 = L4_3.Animations
      L5_3 = SelectedAnimationNumber
      L4_3 = L4_3[L5_3]
      if L4_3 then
        L4_3 = EditingFeatureItem
        if "props" == L4_3 then
          L5_3 = SelectedAnimationNumber
          L4_3 = L6_2
          L4_3 = L4_3[L5_3]
          if L4_3 then
            L5_3 = string
            L5_3 = L5_3.upper
            L6_3 = L4_3
            L5_3 = L5_3(L6_3)
            L6_3 = string
            L6_3 = L6_3.upper
            L7_3 = "prop_ld_keypad_01b"
            L6_3 = L6_3(L7_3)
            if L5_3 == L6_3 then
              L6_3 = string
              L6_3 = L6_3.upper
              L7_3 = L4_3
              L8_3 = ":  YOU NEED TO SET SOME WAY TO GET A PASSWORD FOR THIS (ie. GUARDS DROP WALLET)"
              L7_3 = L7_3 .. L8_3
              L6_3 = L6_3(L7_3)
              L5_3 = L6_3
            else
              L6_3 = string
              L6_3 = L6_3.upper
              L7_3 = "hei_prop_hei_securitypanel"
              L6_3 = L6_3(L7_3)
              if L5_3 == L6_3 then
                L6_3 = string
                L6_3 = L6_3.upper
                L7_3 = L4_3
                L8_3 = ":  GOES BEST WITH THE LAPTOP AND BAG ANIMATION"
                L7_3 = L7_3 .. L8_3
                L6_3 = L6_3(L7_3)
                L5_3 = L6_3
              else
                L6_3 = string
                L6_3 = L6_3.upper
                L7_3 = "ch_prop_fingerprint_scanner_01e"
                L6_3 = L6_3(L7_3)
                if L5_3 == L6_3 then
                  L6_3 = string
                  L6_3 = L6_3.upper
                  L7_3 = L4_3
                  L8_3 = ":  GOES BEST WITH THE USB hack control pad animation"
                  L7_3 = L7_3 .. L8_3
                  L6_3 = L6_3(L7_3)
                  L5_3 = L6_3
                else
                  L6_3 = string
                  L6_3 = L6_3.upper
                  L7_3 = "tr_prop_tr_elecbox_01a"
                  L6_3 = L6_3(L7_3)
                  if L5_3 == L6_3 then
                    L6_3 = string
                    L6_3 = L6_3.upper
                    L7_3 = L4_3
                    L8_3 = ":  has a preset anination"
                    L7_3 = L7_3 .. L8_3
                    L6_3 = L6_3(L7_3)
                    L5_3 = L6_3
                  end
                end
              end
            end
            L6_3 = SetTextFont
            L7_3 = 4
            L6_3(L7_3)
            L6_3 = SetTextProportional
            L7_3 = 1
            L6_3(L7_3)
            L6_3 = SetTextScale
            L7_3 = 0.5
            L8_3 = 0.5
            L6_3(L7_3, L8_3)
            L6_3 = SetTextColour
            L7_3 = 255
            L8_3 = 255
            L9_3 = 255
            L10_3 = 255
            L6_3(L7_3, L8_3, L9_3, L10_3)
            L6_3 = SetTextDropShadow
            L7_3 = 0
            L8_3 = 0
            L9_3 = 0
            L10_3 = 0
            L11_3 = 255
            L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
            L6_3 = SetTextEdge
            L7_3 = 1
            L8_3 = 0
            L9_3 = 0
            L10_3 = 0
            L11_3 = 255
            L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
            L6_3 = SetTextOutline
            L6_3()
            L6_3 = SetTextCentre
            L7_3 = true
            L6_3(L7_3)
            L6_3 = BeginTextCommandDisplayText
            L7_3 = "STRING"
            L6_3(L7_3)
            L6_3 = AddTextComponentSubstringPlayerName
            L7_3 = L5_3
            L6_3(L7_3)
            L6_3 = EndTextCommandDisplayText
            L7_3 = 0.5
            L8_3 = 0.8
            L6_3(L7_3, L8_3)
          end
        else
          L4_3 = Config
          L4_3 = L4_3.Animations
          L5_3 = SelectedAnimationNumber
          L4_3 = L4_3[L5_3]
          L4_3 = L4_3.Name
          if L4_3 then
            L4_3 = string
            L4_3 = L4_3.upper
            L5_3 = Config
            L5_3 = L5_3.Animations
            L6_3 = SelectedAnimationNumber
            L5_3 = L5_3[L6_3]
            L5_3 = L5_3.Name
            L4_3 = L4_3(L5_3)
            L5_3 = SetTextFont
            L6_3 = 4
            L5_3(L6_3)
            L5_3 = SetTextProportional
            L6_3 = 1
            L5_3(L6_3)
            L5_3 = SetTextScale
            L6_3 = 0.5
            L7_3 = 0.5
            L5_3(L6_3, L7_3)
            L5_3 = SetTextColour
            L6_3 = 255
            L7_3 = 255
            L8_3 = 255
            L9_3 = 255
            L5_3(L6_3, L7_3, L8_3, L9_3)
            L5_3 = SetTextDropShadow
            L6_3 = 0
            L7_3 = 0
            L8_3 = 0
            L9_3 = 0
            L10_3 = 255
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)
            L5_3 = SetTextEdge
            L6_3 = 1
            L7_3 = 0
            L8_3 = 0
            L9_3 = 0
            L10_3 = 255
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)
            L5_3 = SetTextOutline
            L5_3()
            L5_3 = SetTextCentre
            L6_3 = true
            L5_3(L6_3)
            L5_3 = BeginTextCommandDisplayText
            L6_3 = "STRING"
            L5_3(L6_3)
            L5_3 = AddTextComponentSubstringPlayerName
            L6_3 = L4_3
            L5_3(L6_3)
            L5_3 = EndTextCommandDisplayText
            L6_3 = 0.5
            L7_3 = 0.8
            L5_3(L6_3, L7_3)
          end
        end
      end
      L4_3 = Wait
      L5_3 = 1
      L4_3(L5_3)
    end
    L0_3 = SetNuiFocus
    L1_3 = true
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = A1_2
    L1_3 = {}
    L2_3 = L2_2
    L1_3.FinalInfo = L2_3
    L2_3 = L5_2
    L1_3.SaveAndExit = L2_3
    L0_3(L1_3)
    L0_3 = TabletEmote
    L0_3()
  end
  L11_2(L12_2)
end
RunRobberyCreatorTargetPlacement = L104_1
function L104_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = nil
  L3_2 = nil
  L4_2 = L89_1
  L4_2 = L4_2()
  L5_2 = GetEntityHeading
  L6_2 = PlayerPedId
  L6_2, L7_2 = L6_2()
  L5_2 = L5_2(L6_2, L7_2)
  OriginalMode = true
  EditingFeatureItem = "sell_trader_ped"
  SelectedAnimationNumber = 0
  L6_2 = true
  L0_1 = L6_2
  L6_2 = GetEntityCoords
  L7_2 = PlayerPedId
  L7_2 = L7_2()
  L6_2 = L6_2(L7_2)
  L3_1 = L6_2
  L6_2 = ClearPedTasksImmediately
  L7_2 = PlayerPedId
  L7_2 = L7_2()
  L6_2(L7_2)
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3
    L0_3 = L88_1
    L0_3 = L0_3()
    form = L0_3
    while true do
      L0_3 = L0_1
      if not L0_3 then
        break
      end
      L0_3 = L79_1
      L0_3()
      L0_3 = RayCastGamePlayCamera
      L1_3 = 20.0
      L0_3, L1_3 = L0_3(L1_3)
      if L0_3 then
        L2_3 = OriginalMode
        if L2_3 then
          L3_1 = L1_3
          L2_3 = L1_1
          if L2_3 then
            L2_3 = DoesEntityExist
            L3_3 = L1_1
            L2_3 = L2_3(L3_3)
            if L2_3 then
              L2_3 = SetEntityCoords
              L3_3 = L1_1
              L4_3 = L1_3.x
              L5_3 = L1_3.y
              L6_3 = L1_3.z
              L2_3(L3_3, L4_3, L5_3, L6_3)
              L2_3 = EditingFeatureItem
              if "sell_trader_ped" == L2_3 then
                L2_3 = L90_1
                L3_3 = L1_1
                L2_3 = L2_3(L3_3)
                if not L2_3 then
                  L2_3 = L3_1
                end
                L3_1 = L2_3
              end
            end
          end
      end
      else
        L2_3 = L1_1
        if L2_3 then
          L2_3 = DoesEntityExist
          L3_3 = L1_1
          L2_3 = L2_3(L3_3)
          if L2_3 then
            L2_3 = GetEntityCoords
            L3_3 = L1_1
            L2_3 = L2_3(L3_3)
            L3_1 = L2_3
          end
        end
      end
      L2_3 = IsControlPressed
      L3_3 = 0
      L4_3 = 174
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        L2_3 = L87_1
        L3_3 = L5_2
        L3_3 = L3_3 + 1.0
        L2_3 = L2_3(L3_3)
        L5_2 = L2_3
      end
      L2_3 = IsControlPressed
      L3_3 = 0
      L4_3 = 175
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        L2_3 = L87_1
        L3_3 = L5_2
        L3_3 = L3_3 - 1.0
        L2_3 = L2_3(L3_3)
        L5_2 = L2_3
      end
      L2_3 = L1_1
      if L2_3 then
        L2_3 = DoesEntityExist
        L3_3 = L1_1
        L2_3 = L2_3(L3_3)
        if L2_3 then
          L2_3 = SetEntityHeading
          L3_3 = L1_1
          L4_3 = L5_2
          L4_3 = L4_3 + 0.0
          L2_3(L3_3, L4_3)
        end
      end
      L2_3 = OriginalMode
      if not L2_3 then
        L2_3 = L1_1
        if L2_3 then
          L2_3 = DoesEntityExist
          L3_3 = L1_1
          L2_3 = L2_3(L3_3)
          if L2_3 then
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 30
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 31
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 34
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 35
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = GetEntityCoords
            L3_3 = L1_1
            L2_3 = L2_3(L3_3)
            L3_3 = L2_3.z
            L4_3 = EditingFeatureItem
            if "sell_trader_animation" == L4_3 then
              L4_3 = L2_3.z
              L3_3 = L4_3 - 1
            end
            L4_3 = GetEntityCoords
            L5_3 = PlayerPedId
            L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3 = L5_3()
            L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3)
            L5_3 = vector3
            L6_3 = L2_3.x
            L7_3 = L4_3.x
            L6_3 = L6_3 - L7_3
            L7_3 = L2_3.y
            L8_3 = L4_3.y
            L7_3 = L7_3 - L8_3
            L8_3 = 0
            L5_3 = L5_3(L6_3, L7_3, L8_3)
            L6_3 = math
            L6_3 = L6_3.sqrt
            L7_3 = L5_3.x
            L7_3 = L7_3 ^ 2
            L8_3 = L5_3.y
            L8_3 = L8_3 ^ 2
            L7_3 = L7_3 + L8_3
            L6_3 = L6_3(L7_3)
            L7_3 = 0.001
            if L6_3 < L7_3 then
              L6_3 = 1.0
            end
            L7_3 = vector3
            L8_3 = L5_3.x
            L8_3 = L8_3 / L6_3
            L9_3 = L5_3.y
            L9_3 = L9_3 / L6_3
            L10_3 = 0
            L7_3 = L7_3(L8_3, L9_3, L10_3)
            L8_3 = vector3
            L9_3 = L7_3.y
            L9_3 = -L9_3
            L10_3 = L7_3.x
            L11_3 = 0
            L8_3 = L8_3(L9_3, L10_3, L11_3)
            L9_3 = IsDisabledControlPressed
            L10_3 = 1
            L11_3 = 32
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L1_1
              L11_3 = L2_3.x
              L12_3 = L7_3.x
              L12_3 = 0.01 * L12_3
              L11_3 = L11_3 + L12_3
              L12_3 = L2_3.y
              L13_3 = L7_3.y
              L13_3 = 0.01 * L13_3
              L12_3 = L12_3 + L13_3
              L13_3 = L3_3
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = IsDisabledControlPressed
            L10_3 = 1
            L11_3 = 33
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L1_1
              L11_3 = L2_3.x
              L12_3 = L7_3.x
              L12_3 = 0.01 * L12_3
              L11_3 = L11_3 - L12_3
              L12_3 = L2_3.y
              L13_3 = L7_3.y
              L13_3 = 0.01 * L13_3
              L12_3 = L12_3 - L13_3
              L13_3 = L3_3
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = IsDisabledControlPressed
            L10_3 = 1
            L11_3 = 34
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L1_1
              L11_3 = L2_3.x
              L12_3 = L8_3.x
              L12_3 = 0.01 * L12_3
              L11_3 = L11_3 + L12_3
              L12_3 = L2_3.y
              L13_3 = L8_3.y
              L13_3 = 0.01 * L13_3
              L12_3 = L12_3 + L13_3
              L13_3 = L3_3
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = IsDisabledControlPressed
            L10_3 = 1
            L11_3 = 35
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L1_1
              L11_3 = L2_3.x
              L12_3 = L8_3.x
              L12_3 = 0.01 * L12_3
              L11_3 = L11_3 - L12_3
              L12_3 = L2_3.y
              L13_3 = L8_3.y
              L13_3 = 0.01 * L13_3
              L12_3 = L12_3 - L13_3
              L13_3 = L3_3
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = IsControlPressed
            L10_3 = 0
            L11_3 = 172
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L1_1
              L11_3 = L2_3.x
              L12_3 = L2_3.y
              L13_3 = L3_3 + 0.01
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = IsControlPressed
            L10_3 = 0
            L11_3 = 173
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L1_1
              L11_3 = L2_3.x
              L12_3 = L2_3.y
              L13_3 = L3_3 - 0.01
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = GetEntityCoords
            L10_3 = L1_1
            L9_3 = L9_3(L10_3)
            L3_1 = L9_3
            L9_3 = EditingFeatureItem
            if "sell_trader_animation" == L9_3 then
              L9_3 = vector3
              L10_3 = L3_1.x
              L11_3 = L3_1.y
              L12_3 = L3_1.z
              L12_3 = L12_3 - 1
              L9_3 = L9_3(L10_3, L11_3, L12_3)
              L3_1 = L9_3
            end
          end
        end
      end
      L2_3 = IsControlJustPressed
      L3_3 = 1
      L4_3 = 45
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        L2_3 = EditingFeatureItem
        if "sell_trader_ped" == L2_3 then
          L2_3 = SelectedAnimationNumber
          if L2_3 < 1 then
            OriginalMode = true
        end
        else
          L2_3 = OriginalMode
          L2_3 = not L2_3
          OriginalMode = L2_3
        end
        L2_3 = L88_1
        L2_3 = L2_3()
        form = L2_3
      end
      L2_3 = IsControlJustPressed
      L3_3 = 1
      L4_3 = 177
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        L2_3 = L94_1
        L2_3()
      end
      L2_3 = IsControlJustPressed
      L3_3 = 1
      L4_3 = 15
      L2_3 = L2_3(L3_3, L4_3)
      if not L2_3 then
        L2_3 = IsControlJustPressed
        L3_3 = 1
        L4_3 = 173
        L2_3 = L2_3(L3_3, L4_3)
        if not L2_3 then
          goto lbl_399
        end
        L2_3 = OriginalMode
        if not L2_3 then
          goto lbl_399
        end
      end
      L2_3 = SelectedAnimationNumber
      L2_3 = L2_3 + 1
      SelectedAnimationNumber = L2_3
      L2_3 = EditingFeatureItem
      if "sell_trader_ped" == L2_3 then
        L2_3 = SelectedAnimationNumber
        L3_3 = L4_2
        L3_3 = #L3_3
        if L2_3 > L3_3 then
          SelectedAnimationNumber = 0
        end
        L2_3 = SelectedAnimationNumber
        if L2_3 < 1 then
          L2_3 = L1_1
          if L2_3 then
            L2_3 = DoesEntityExist
            L3_3 = L1_1
            L2_3 = L2_3(L3_3)
            if L2_3 then
              L2_3 = DeleteEntity
              L3_3 = L1_1
              L2_3(L3_3)
            end
          end
          L2_3 = nil
          L1_1 = L2_3
        else
          L2_3 = L91_1
          L4_3 = SelectedAnimationNumber
          L3_3 = L4_2
          L3_3 = L3_3[L4_3]
          L4_3 = L3_1
          L5_3 = L5_2
          L2_3(L3_3, L4_3, L5_3)
        end
      else
        L2_3 = SelectedAnimationNumber
        L3_3 = Config
        L3_3 = L3_3.Animations
        L3_3 = #L3_3
        if L2_3 > L3_3 then
          SelectedAnimationNumber = 0
        end
        L2_3 = L93_1
        L3_3 = SelectedAnimationNumber
        L2_3(L3_3)
      end
      ::lbl_399::
      L2_3 = IsControlJustPressed
      L3_3 = 1
      L4_3 = 14
      L2_3 = L2_3(L3_3, L4_3)
      if not L2_3 then
        L2_3 = IsControlJustPressed
        L3_3 = 1
        L4_3 = 172
        L2_3 = L2_3(L3_3, L4_3)
        if not L2_3 then
          goto lbl_462
        end
        L2_3 = OriginalMode
        if not L2_3 then
          goto lbl_462
        end
      end
      L2_3 = SelectedAnimationNumber
      L2_3 = L2_3 - 1
      SelectedAnimationNumber = L2_3
      L2_3 = EditingFeatureItem
      if "sell_trader_ped" == L2_3 then
        L2_3 = SelectedAnimationNumber
        if L2_3 < 0 then
          L2_3 = L4_2
          L2_3 = #L2_3
          SelectedAnimationNumber = L2_3
        end
        L2_3 = SelectedAnimationNumber
        if L2_3 < 1 then
          L2_3 = L1_1
          if L2_3 then
            L2_3 = DoesEntityExist
            L3_3 = L1_1
            L2_3 = L2_3(L3_3)
            if L2_3 then
              L2_3 = DeleteEntity
              L3_3 = L1_1
              L2_3(L3_3)
            end
          end
          L2_3 = nil
          L1_1 = L2_3
        else
          L2_3 = L91_1
          L4_3 = SelectedAnimationNumber
          L3_3 = L4_2
          L3_3 = L3_3[L4_3]
          L4_3 = L3_1
          L5_3 = L5_2
          L2_3(L3_3, L4_3, L5_3)
        end
      else
        L2_3 = SelectedAnimationNumber
        if L2_3 < 0 then
          L2_3 = Config
          L2_3 = L2_3.Animations
          L2_3 = #L2_3
          SelectedAnimationNumber = L2_3
        end
        L2_3 = L93_1
        L3_3 = SelectedAnimationNumber
        L2_3(L3_3)
      end
      ::lbl_462::
      L2_3 = IsControlJustPressed
      L3_3 = 0
      L4_3 = 38
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        L2_3 = EditingFeatureItem
        if "sell_trader_ped" == L2_3 then
          L2_3 = L3_1
          if not L2_3 then
            L2_3 = GetEntityCoords
            L3_3 = PlayerPedId
            L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3 = L3_3()
            L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3)
          end
          L3_3 = L5_2
          L4_3 = ""
          L5_3 = L1_1
          if L5_3 then
            L5_3 = DoesEntityExist
            L6_3 = L1_1
            L5_3 = L5_3(L6_3)
            if L5_3 then
              L5_3 = L90_1
              L6_3 = L1_1
              L5_3 = L5_3(L6_3)
              L2_3 = L5_3 or L2_3
              if not L5_3 then
                L5_3 = GetEntityCoords
                L6_3 = L1_1
                L5_3 = L5_3(L6_3)
                L2_3 = L5_3
              end
              L5_3 = GetEntityHeading
              L6_3 = L1_1
              L5_3 = L5_3(L6_3)
              L3_3 = L5_3
              L6_3 = SelectedAnimationNumber
              L5_3 = L4_2
              L5_3 = L5_3[L6_3]
              L4_3 = L5_3 or L4_3
              if not L5_3 then
                L4_3 = ""
              end
            end
          end
          L5_3 = L87_1
          L6_3 = L3_3 + 180.0
          L5_3 = L5_3(L6_3)
          L6_3 = {}
          L7_3 = {}
          L8_3 = L2_3.x
          L7_3.x = L8_3
          L8_3 = L2_3.y
          L7_3.y = L8_3
          L8_3 = L2_3.z
          L7_3.z = L8_3
          L6_3.Target = L7_3
          L6_3.PedModel = L4_3
          L6_3.PropHeading = L3_3
          L3_2 = L6_3
          L6_3 = L1_1
          L2_1 = L6_3
          L6_3 = ClonePedEx
          L7_3 = PlayerPedId
          L7_3 = L7_3()
          L8_3 = 0.0
          L9_3 = false
          L10_3 = true
          L11_3 = 1
          L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)
          L1_1 = L6_3
          L6_3 = SetEntityCoords
          L7_3 = L1_1
          L8_3 = L2_3.x
          L9_3 = L2_3.y
          L10_3 = L2_3.z
          L6_3(L7_3, L8_3, L9_3, L10_3)
          L6_3 = SetEntityHeading
          L7_3 = L1_1
          L8_3 = L5_3
          L6_3(L7_3, L8_3)
          L6_3 = SetEntityCollision
          L7_3 = L1_1
          L8_3 = false
          L9_3 = false
          L6_3(L7_3, L8_3, L9_3)
          L6_3 = SetEntityInvincible
          L7_3 = L1_1
          L8_3 = true
          L6_3(L7_3, L8_3)
          L6_3 = FreezeEntityPosition
          L7_3 = L1_1
          L8_3 = true
          L6_3(L7_3, L8_3)
          L5_2 = L5_3
          L3_1 = L2_3
          OriginalMode = true
          EditingFeatureItem = "sell_trader_animation"
          SelectedAnimationNumber = 1
          L6_3 = L93_1
          L7_3 = SelectedAnimationNumber
          L6_3(L7_3)
          L6_3 = L88_1
          L6_3 = L6_3()
          form = L6_3
        else
          L2_3 = L1_1
          if L2_3 then
            L2_3 = DoesEntityExist
            L3_3 = L1_1
            L2_3 = L2_3(L3_3)
            if L2_3 then
              L2_3 = L3_1
              if not L2_3 then
                L2_3 = GetEntityCoords
                L3_3 = L1_1
                L2_3 = L2_3(L3_3)
              end
              L3_3 = GetEntityHeading
              L4_3 = L1_1
              L3_3 = L3_3(L4_3)
              L4_3 = {}
              L5_3 = L3_2
              if L5_3 then
                L5_3 = L3_2.Target
                if L5_3 then
                  goto lbl_604
                end
              end
              L5_3 = {}
              L6_3 = L2_3.x
              L5_3.x = L6_3
              L6_3 = L2_3.y
              L5_3.y = L6_3
              L6_3 = L2_3.z
              L5_3.z = L6_3
              ::lbl_604::
              L4_3.Target = L5_3
              L4_3.Prop = ""
              L5_3 = L3_2
              if L5_3 then
                L5_3 = L3_2.PedModel
                if L5_3 then
                  goto lbl_614
                end
              end
              L5_3 = L4_2
              L5_3 = L5_3[1]
              ::lbl_614::
              L4_3.PedModel = L5_3
              L5_3 = {}
              L6_3 = L2_3.x
              L5_3.x = L6_3
              L6_3 = L2_3.y
              L5_3.y = L6_3
              L6_3 = L2_3.z
              L5_3.z = L6_3
              L4_3.PedCoords = L5_3
              L5_3 = SelectedAnimationNumber
              if L5_3 > 0 then
                L5_3 = SelectedAnimationNumber
                if L5_3 then
                  goto lbl_631
                end
              end
              L5_3 = ""
              ::lbl_631::
              L4_3.Animation = L5_3
              L4_3.Heading = L3_3
              L5_3 = L3_2
              if L5_3 then
                L5_3 = L3_2.PropHeading
                if L5_3 then
                  goto lbl_640
                end
              end
              L5_3 = L3_3
              ::lbl_640::
              L4_3.PropHeading = L5_3
              L2_2 = L4_3
              L4_3 = L82_1
              L4_3()
              break
            end
          end
        end
      end
      L2_3 = DrawRobberyCreatorPrompt
      L3_3 = form
      L2_3(L3_3)
      L2_3 = EditingFeatureItem
      if "sell_trader_ped" == L2_3 then
        L2_3 = SelectedAnimationNumber
        if L2_3 < 1 then
          L2_3 = L3_1
          if L2_3 then
            L2_3 = GetEntityCoords
            L3_3 = PlayerPedId
            L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3 = L3_3()
            L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3)
            L3_3 = 0.2
            L4_3 = Config
            L4_3 = L4_3.Color
            OriginalMode = true
            L5_3 = DrawMarker
            L6_3 = 28
            L7_3 = L3_1.x
            L8_3 = L3_1.y
            L9_3 = L3_1.z
            L10_3 = 0.0
            L11_3 = 0.0
            L12_3 = 0.0
            L13_3 = 0.0
            L14_3 = 0.0
            L15_3 = 0.0
            L16_3 = L3_3
            L17_3 = L3_3
            L18_3 = L3_3
            L19_3 = L4_3.r
            L20_3 = L4_3.g
            L21_3 = L4_3.b
            L22_3 = L4_3.a
            L23_3 = false
            L24_3 = false
            L25_3 = 2
            L26_3 = nil
            L27_3 = nil
            L28_3 = false
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3)
            L5_3 = DrawLine
            L6_3 = L2_3.x
            L7_3 = L2_3.y
            L8_3 = L2_3.z
            L8_3 = L8_3 + 0.4
            L9_3 = L3_1.x
            L10_3 = L3_1.y
            L11_3 = L3_1.z
            L12_3 = L4_3.r
            L13_3 = L4_3.g
            L14_3 = L4_3.b
            L15_3 = L4_3.a
            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
            L5_3 = L92_1
            L6_3 = "Marker target"
            L5_3(L6_3)
        end
        else
          L2_3 = L92_1
          L4_3 = SelectedAnimationNumber
          L3_3 = L4_2
          L3_3 = L3_3[L4_3]
          L2_3(L3_3)
        end
      else
        L2_3 = SelectedAnimationNumber
        if L2_3 < 1 then
          L2_3 = L92_1
          L3_3 = "No animation"
          L2_3(L3_3)
        else
          L2_3 = Config
          L2_3 = L2_3.Animations
          L3_3 = SelectedAnimationNumber
          L2_3 = L2_3[L3_3]
          if L2_3 then
            L2_3 = Config
            L2_3 = L2_3.Animations
            L3_3 = SelectedAnimationNumber
            L2_3 = L2_3[L3_3]
            L2_3 = L2_3.Name
            if L2_3 then
              L2_3 = L92_1
              L3_3 = Config
              L3_3 = L3_3.Animations
              L4_3 = SelectedAnimationNumber
              L3_3 = L3_3[L4_3]
              L3_3 = L3_3.Name
              L2_3(L3_3)
            end
          end
        end
      end
      L2_3 = Wait
      L3_3 = 1
      L2_3(L3_3)
    end
    L0_3 = SetNuiFocus
    L1_3 = true
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = SendNUIMessage
    L1_3 = {}
    L1_3.type = "showSellLocationAfterPlacement"
    L2_3 = L2_2
    L1_3.FinalInfo = L2_3
    L0_3(L1_3)
    L0_3 = A1_2
    L1_3 = {}
    L2_3 = L2_2
    L1_3.FinalInfo = L2_3
    L1_3.SaveAndExit = false
    L0_3(L1_3)
    L0_3 = TabletEmote
    L0_3()
  end
  L6_2(L7_2)
end
L105_1 = RegisterNUICallback
L106_1 = "placeTarget"
L107_1 = RunRobberyCreatorTargetPlacement
L105_1(L106_1, L107_1)
L105_1 = RegisterNUICallback
L106_1 = "placeSellPedTarget"
L107_1 = L104_1
L105_1(L106_1, L107_1)
L105_1 = RegisterNUICallback
L106_1 = "requestLaserVectors"
function L107_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = Config
  L2_2 = L2_2.Color
  L3_2 = 0.04
  L4_2 = nil
  L5_2 = {}
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3
    L0_3 = setupLaserform
    L1_3 = "instructional_buttons"
    L0_3 = L0_3(L1_3)
    form = L0_3
    while true do
      L0_3 = RayCastGamePlayCamera
      L1_3 = 20.0
      L0_3, L1_3, L2_3 = L0_3(L1_3)
      L3_3 = DrawRobberyCreatorPrompt
      L4_3 = form
      L3_3(L4_3)
      if L0_3 then
        L3_3 = L79_1
        L3_3()
        L3_3 = IsControlJustPressed
        L4_3 = 1
        L5_3 = 177
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = L5_2.vector1
          if L3_3 then
            L3_3 = false
            L4_2 = L3_3
            L5_2.vector1 = false
            L3_3 = setupLaserform
            L4_3 = "instructional_buttons"
            L3_3 = L3_3(L4_3)
            form = L3_3
          else
            break
          end
        end
        L3_3 = GetEntityCoords
        L4_3 = PlayerPedId
        L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3 = L4_3()
        L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3)
        L4_3 = DrawMarker
        L5_3 = 28
        L6_3 = L1_3.x
        L7_3 = L1_3.y
        L8_3 = L1_3.z
        L9_3 = 0.0
        L10_3 = 0.0
        L11_3 = 0.0
        L12_3 = 0.0
        L13_3 = 0.0
        L14_3 = 0.0
        L15_3 = L3_2
        L16_3 = L3_2
        L17_3 = L3_2
        L18_3 = L2_2.r
        L19_3 = L2_2.g
        L20_3 = L2_2.b
        L21_3 = L2_2.a
        L22_3 = false
        L23_3 = false
        L24_3 = 2
        L25_3 = nil
        L26_3 = nil
        L27_3 = false
        L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3)
        L4_3 = DrawLine
        L5_3 = L3_3.x
        L6_3 = L3_3.y
        L7_3 = L3_3.z
        L8_3 = L1_3.x
        L9_3 = L1_3.y
        L10_3 = L1_3.z
        L11_3 = L2_2.r
        L12_3 = L2_2.g
        L13_3 = L2_2.b
        L14_3 = L2_2.a
        L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
        L4_3 = L4_2
        if L4_3 then
          L4_3 = DrawLine
          L5_3 = L4_2.x
          L6_3 = L4_2.y
          L7_3 = L4_2.z
          L8_3 = L1_3.x
          L9_3 = L1_3.y
          L10_3 = L1_3.z
          L11_3 = 255
          L12_3 = 0
          L13_3 = 0
          L14_3 = L2_2.a
          L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
        end
        L4_3 = IsControlJustPressed
        L5_3 = 0
        L6_3 = 38
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = L4_2
          if not L4_3 then
            L4_2 = L1_3
            L4_3 = {}
            L5_3 = L4_2.x
            L6_3 = L4_2.y
            L7_3 = L4_2.z
            L4_3[1] = L5_3
            L4_3[2] = L6_3
            L4_3[3] = L7_3
            L5_2.vector1 = L4_3
            L4_3 = setupLaserform
            L5_3 = "instructional_buttons"
            L6_3 = true
            L4_3 = L4_3(L5_3, L6_3)
            form = L4_3
          else
            L4_3 = {}
            L5_3 = L1_3.x
            L6_3 = L1_3.y
            L7_3 = L1_3.z
            L4_3[1] = L5_3
            L4_3[2] = L6_3
            L4_3[3] = L7_3
            L5_2.vector2 = L4_3
            break
          end
        end
      end
      L3_3 = Wait
      L4_3 = 1
      L3_3(L4_3)
    end
    L0_3 = L5_2.vector1
    if L0_3 then
      L0_3 = L5_2.vector2
      if L0_3 then
        L0_3 = A1_2
        L1_3 = {}
        L2_3 = L5_2
        L1_3.FinalInfo = L2_3
        L0_3(L1_3)
    end
    else
      L0_3 = A1_2
      L1_3 = {}
      L1_3.error = "Missing vector data"
      L0_3(L1_3)
      L0_3 = SetNuiFocus
      L1_3 = true
      L2_3 = true
      L0_3(L1_3, L2_3)
    end
    L0_3 = HideRobberyCreatorPrompt
    L0_3()
    L0_3 = TabletEmote
    L0_3()
  end
  L6_2(L7_2)
end
L105_1(L106_1, L107_1)
L105_1 = RegisterNUICallback
L106_1 = "requestToxicGas"
function L107_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = Config
  L2_2 = L2_2.Color
  L3_2 = nil
  L4_2 = {}
  L5_2 = 0.1
  L6_2 = CreateThread
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3
    while true do
      L0_3 = RayCastGamePlayCamera
      L1_3 = 20.0
      L0_3, L1_3, L2_3 = L0_3(L1_3)
      L3_3 = DrawRobberyCreatorPrompt
      L4_3 = {}
      L4_3.title = "Toxic Gas Placement"
      L4_3.description = "Place the toxic gas bubble and adjust how large the danger zone should be."
      L5_3 = "Current size: %.1f"
      L6_3 = L5_3
      L5_3 = L5_3.format
      L7_3 = L5_2
      L5_3 = L5_3(L6_3, L7_3)
      L4_3.meta = L5_3
      L5_3 = {}
      L6_3 = {}
      L6_3.key = "E"
      L6_3.label = "Confirm gas bubble"
      L6_3.tone = "primary"
      L7_3 = {}
      L7_3.key = "MW / Up / Down"
      L7_3.label = "Adjust bubble size"
      L8_3 = {}
      L8_3.key = "Backspace"
      L8_3.label = "Cancel"
      L8_3.tone = "danger"
      L5_3[1] = L6_3
      L5_3[2] = L7_3
      L5_3[3] = L8_3
      L4_3.actions = L5_3
      L3_3(L4_3)
      if L0_3 then
        L3_3 = L79_1
        L3_3()
        L3_3 = IsControlJustPressed
        L4_3 = 1
        L5_3 = 177
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          break
        end
        L3_3 = GetEntityCoords
        L4_3 = PlayerPedId
        L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3 = L4_3()
        L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3)
        L4_3 = DrawMarker
        L5_3 = 28
        L6_3 = L1_3.x
        L7_3 = L1_3.y
        L8_3 = L1_3.z
        L9_3 = 0.0
        L10_3 = 0.0
        L11_3 = 0.0
        L12_3 = 0.0
        L13_3 = 0.0
        L14_3 = 0.0
        L15_3 = L5_2
        L16_3 = L5_2
        L17_3 = L5_2
        L18_3 = L2_2.r
        L19_3 = L2_2.g
        L20_3 = L2_2.b
        L21_3 = L2_2.a
        L22_3 = false
        L23_3 = false
        L24_3 = 2
        L25_3 = nil
        L26_3 = nil
        L27_3 = false
        L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3)
        L4_3 = DrawLine
        L5_3 = L3_3.x
        L6_3 = L3_3.y
        L7_3 = L3_3.z
        L8_3 = L1_3.x
        L9_3 = L1_3.y
        L10_3 = L1_3.z
        L11_3 = L2_2.r
        L12_3 = L2_2.g
        L13_3 = L2_2.b
        L14_3 = L2_2.a
        L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3)
        L4_3 = IsControlJustPressed
        L5_3 = 1
        L6_3 = 15
        L4_3 = L4_3(L5_3, L6_3)
        if not L4_3 then
          L4_3 = IsControlJustPressed
          L5_3 = 1
          L6_3 = 173
          L4_3 = L4_3(L5_3, L6_3)
          if not L4_3 then
            goto lbl_100
          end
        end
        L4_3 = L5_2
        L4_3 = L4_3 + 0.1
        L5_2 = L4_3
        goto lbl_116
        ::lbl_100::
        L4_3 = IsControlJustPressed
        L5_3 = 1
        L6_3 = 14
        L4_3 = L4_3(L5_3, L6_3)
        if not L4_3 then
          L4_3 = IsControlJustPressed
          L5_3 = 1
          L6_3 = 172
          L4_3 = L4_3(L5_3, L6_3)
          if not L4_3 then
            goto lbl_116
          end
        end
        L4_3 = L5_2
        L4_3 = L4_3 - 0.1
        L5_2 = L4_3
        ::lbl_116::
        L4_3 = IsControlJustPressed
        L5_3 = 0
        L6_3 = 38
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = L3_2
          if not L4_3 then
            L3_2 = L1_3
            L4_3 = {}
            L5_3 = L3_2.x
            L6_3 = L3_2.y
            L7_3 = L3_2.z
            L4_3[1] = L5_3
            L4_3[2] = L6_3
            L4_3[3] = L7_3
            L4_2.vector = L4_3
            L4_3 = L5_2
            L4_2.size = L4_3
            break
          end
        end
      end
      L3_3 = Wait
      L4_3 = 1
      L3_3(L4_3)
    end
    L0_3 = SetNuiFocus
    L1_3 = true
    L2_3 = true
    L0_3(L1_3, L2_3)
    L0_3 = L4_2.vector
    if L0_3 then
      L0_3 = A1_2
      L1_3 = {}
      L2_3 = L4_2
      L1_3.FinalInfo = L2_3
      L0_3(L1_3)
    else
      L0_3 = A1_2
      L1_3 = {}
      L1_3.error = "Missing vector data"
      L0_3(L1_3)
      L0_3 = SetNuiFocus
      L1_3 = true
      L2_3 = true
      L0_3(L1_3, L2_3)
    end
    L0_3 = HideRobberyCreatorPrompt
    L0_3()
    L0_3 = TabletEmote
    L0_3()
  end
  L6_2(L7_2)
end
L105_1(L106_1, L107_1)
function L105_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  if not A0_2 or 0 == A0_2 then
    L1_2 = nil
    L2_2 = nil
    return L1_2, L2_2
  end
  L1_2 = GetEntityModel
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetModelDimensions
  L3_2 = L1_2
  L2_2, L3_2 = L2_2(L3_2)
  L4_2 = L2_2.z
  L5_2 = L3_2.z
  L4_2 = L4_2 + L5_2
  L4_2 = L4_2 * 0.5
  L5_2 = L3_2.y
  L6_2 = {}
  L7_2 = 0.0
  L8_2 = L5_2 - 0.001
  L9_2 = L4_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L7_2 = {}
  L8_2 = 0.0
  L9_2 = L5_2 - 0.003
  L10_2 = L4_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L8_2 = table
  L8_2 = L8_2.unpack
  L9_2 = GetOffsetFromEntityInWorldCoords
  L10_2 = A0_2
  L11_2 = L6_2[1]
  L12_2 = L6_2[2]
  L13_2 = L6_2[3]
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L8_2, L9_2, L10_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L11_2 = table
  L11_2 = L11_2.unpack
  L12_2 = GetOffsetFromEntityInWorldCoords
  L13_2 = A0_2
  L14_2 = L7_2[1]
  L15_2 = L7_2[2]
  L16_2 = L7_2[3]
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2, L14_2, L15_2, L16_2)
  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L14_2 = vector3
  L15_2 = L8_2
  L16_2 = L9_2
  L17_2 = L10_2
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L15_2 = vector3
  L16_2 = L11_2
  L17_2 = L12_2
  L18_2 = L13_2
  L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2, L17_2, L18_2)
  return L14_2, L15_2, L16_2, L17_2, L18_2
end
L106_1 = RegisterNUICallback
L107_1 = "requestPasscodePlacement"
function L108_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = {}
  L3_2 = 0.0
  OriginalMode = true
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3
    L0_3 = setupStickyform
    L1_3 = "instructional_buttons"
    L0_3 = L0_3(L1_3)
    L1_3 = false
    L2_3 = GetHashKey
    L3_3 = "xs_prop_arena_stickynote_01a"
    L2_3 = L2_3(L3_3)
    L3_3 = LoadModel
    L4_3 = "xs_prop_arena_stickynote_01a"
    L3_3(L4_3)
    L3_3 = GetModelDimensions
    L4_3 = L2_3
    L3_3, L4_3 = L3_3(L4_3)
    L5_3 = L3_3.z
    L6_3 = L4_3.z
    L5_3 = L5_3 + L6_3
    L5_3 = L5_3 * 0.5
    L6_3 = L4_3.y
    L7_3 = L4_3.z
    L8_3 = L3_3.z
    L7_3 = L7_3 - L8_3
    L7_3 = L7_3 * 0.5
    L8_3 = {}
    L9_3 = 0.0
    L10_3 = L6_3 + 0.001
    L11_3 = L5_3
    L8_3[1] = L9_3
    L8_3[2] = L10_3
    L8_3[3] = L11_3
    L9_3 = {}
    L10_3 = 0.0
    L11_3 = L6_3 + 0.003
    L12_3 = L5_3
    L9_3[1] = L10_3
    L9_3[2] = L11_3
    L9_3[3] = L12_3
    function L10_3(A0_4, A1_4, A2_4, A3_4)
      local L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4
      L4_4 = table
      L4_4 = L4_4.unpack
      L5_4 = GetOffsetFromEntityInWorldCoords
      L6_4 = A0_4
      L7_4 = A1_4 + 0.0
      L8_4 = A2_4 + 0.0
      L9_4 = A3_4 + 0.0
      L5_4, L6_4, L7_4, L8_4, L9_4, L10_4 = L5_4(L6_4, L7_4, L8_4, L9_4)
      L4_4, L5_4, L6_4 = L4_4(L5_4, L6_4, L7_4, L8_4, L9_4, L10_4)
      L7_4 = vector3
      L8_4 = L4_4
      L9_4 = L5_4
      L10_4 = L6_4
      return L7_4(L8_4, L9_4, L10_4)
    end
    function L11_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4
      L1_4 = L10_3
      L2_4 = A0_4
      L3_4 = L8_3
      L3_4 = L3_4[1]
      L4_4 = L8_3
      L4_4 = L4_4[2]
      L5_4 = L8_3
      L5_4 = L5_4[3]
      L1_4 = L1_4(L2_4, L3_4, L4_4, L5_4)
      L2_4 = L10_3
      L3_4 = A0_4
      L4_4 = L9_3
      L4_4 = L4_4[1]
      L5_4 = L9_3
      L5_4 = L5_4[2]
      L6_4 = L9_3
      L6_4 = L6_4[3]
      L2_4 = L2_4(L3_4, L4_4, L5_4, L6_4)
      L3_4 = L1_4
      L4_4 = L2_4
      return L3_4, L4_4
    end
    L12_3 = CreateObject
    L13_3 = L2_3
    L14_3 = GetEntityCoords
    L15_3 = PlayerPedId
    L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3 = L15_3()
    L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3 = L14_3(L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3)
    L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3)
    L13_3 = SetEntityCollision
    L14_3 = L12_3
    L15_3 = false
    L16_3 = false
    L13_3(L14_3, L15_3, L16_3)
    L13_3 = SetEntityInvincible
    L14_3 = L12_3
    L15_3 = true
    L13_3(L14_3, L15_3)
    L13_3 = FreezeEntityPosition
    L14_3 = L12_3
    L15_3 = true
    L13_3(L14_3, L15_3)
    while true do
      L13_3 = RayCastGamePlayCamera
      L14_3 = 20.0
      L13_3, L14_3, L15_3 = L13_3(L14_3)
      L16_3 = DrawRobberyCreatorPrompt
      L17_3 = L0_3
      L16_3(L17_3)
      if L13_3 then
        L16_3 = L79_1
        L16_3()
        L16_3 = IsControlJustPressed
        L17_3 = 1
        L18_3 = 177
        L16_3 = L16_3(L17_3, L18_3)
        if L16_3 then
          break
        end
        L16_3 = IsControlPressed
        L17_3 = 0
        L18_3 = 174
        L16_3 = L16_3(L17_3, L18_3)
        if L16_3 then
          L16_3 = L3_2
          L16_3 = L16_3 + 1.0
          L3_2 = L16_3
          L16_3 = L3_2
          L17_3 = 360.0
          if L16_3 > L17_3 then
            L16_3 = 0.0
            L3_2 = L16_3
          end
        else
          L16_3 = IsControlPressed
          L17_3 = 0
          L18_3 = 175
          L16_3 = L16_3(L17_3, L18_3)
          if L16_3 then
            L16_3 = L3_2
            L16_3 = L16_3 - 1.0
            L3_2 = L16_3
            L16_3 = L3_2
            if L16_3 < 0.0 then
              L16_3 = 360.0
              L3_2 = L16_3
            end
          end
        end
        L16_3 = GetEntityCoords
        L17_3 = L12_3
        L16_3 = L16_3(L17_3)
        L17_3 = L10_3
        L18_3 = L12_3
        L19_3 = 0.0
        L20_3 = L6_3 + 0.03
        L21_3 = L5_3
        L17_3 = L17_3(L18_3, L19_3, L20_3, L21_3)
        L18_3 = DrawMarker
        L19_3 = 28
        L20_3 = L17_3.x
        L21_3 = L17_3.y
        L22_3 = L17_3.z
        L23_3 = 0.0
        L24_3 = 0.0
        L25_3 = 0.0
        L26_3 = 0.0
        L27_3 = 0.0
        L28_3 = 0.0
        L29_3 = 0.03
        L30_3 = 0.03
        L31_3 = 0.03
        L32_3 = 0
        L33_3 = 150
        L34_3 = 0
        L35_3 = 100
        L36_3 = false
        L37_3 = false
        L38_3 = 2
        L39_3 = false
        L40_3 = nil
        L41_3 = nil
        L42_3 = false
        L18_3(L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3)
        L18_3 = OriginalMode
        if not L18_3 then
          L18_3 = DisableControlAction
          L19_3 = 0
          L20_3 = 30
          L21_3 = true
          L18_3(L19_3, L20_3, L21_3)
          L18_3 = DisableControlAction
          L19_3 = 0
          L20_3 = 31
          L21_3 = true
          L18_3(L19_3, L20_3, L21_3)
          L18_3 = DisableControlAction
          L19_3 = 0
          L20_3 = 34
          L21_3 = true
          L18_3(L19_3, L20_3, L21_3)
          L18_3 = DisableControlAction
          L19_3 = 0
          L20_3 = 35
          L21_3 = true
          L18_3(L19_3, L20_3, L21_3)
          L18_3 = L16_3.z
          L19_3 = PlayerPedId
          L19_3 = L19_3()
          L20_3 = GetEntityCoords
          L21_3 = L19_3
          L20_3 = L20_3(L21_3)
          L21_3 = L16_3
          L22_3 = vector3
          L23_3 = L21_3.x
          L24_3 = L20_3.x
          L23_3 = L23_3 - L24_3
          L24_3 = L21_3.y
          L25_3 = L20_3.y
          L24_3 = L24_3 - L25_3
          L25_3 = 0.0
          L22_3 = L22_3(L23_3, L24_3, L25_3)
          L23_3 = math
          L23_3 = L23_3.sqrt
          L24_3 = L22_3.x
          L25_3 = L22_3.x
          L24_3 = L24_3 * L25_3
          L25_3 = L22_3.y
          L26_3 = L22_3.y
          L25_3 = L25_3 * L26_3
          L24_3 = L24_3 + L25_3
          L23_3 = L23_3(L24_3)
          L24_3 = 1.0E-4
          if L23_3 < L24_3 then
            L23_3 = 1.0E-4
          end
          L24_3 = vector3
          L25_3 = L22_3.x
          L25_3 = L25_3 / L23_3
          L26_3 = L22_3.y
          L26_3 = L26_3 / L23_3
          L27_3 = 0.0
          L24_3 = L24_3(L25_3, L26_3, L27_3)
          L25_3 = vector3
          L26_3 = L24_3.y
          L26_3 = -L26_3
          L27_3 = L24_3.x
          L28_3 = 0.0
          L25_3 = L25_3(L26_3, L27_3, L28_3)
          L26_3 = IsDisabledControlPressed
          L27_3 = 1
          L28_3 = 32
          L26_3 = L26_3(L27_3, L28_3)
          if L26_3 then
            L26_3 = SetEntityCoordsNoOffset
            L27_3 = L12_3
            L28_3 = L21_3.x
            L29_3 = L24_3.x
            L29_3 = 0.01 * L29_3
            L28_3 = L28_3 + L29_3
            L29_3 = L21_3.y
            L30_3 = L24_3.y
            L30_3 = 0.01 * L30_3
            L29_3 = L29_3 + L30_3
            L30_3 = L18_3
            L31_3 = false
            L32_3 = false
            L33_3 = false
            L26_3(L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)
          end
          L26_3 = IsDisabledControlPressed
          L27_3 = 1
          L28_3 = 33
          L26_3 = L26_3(L27_3, L28_3)
          if L26_3 then
            L26_3 = SetEntityCoordsNoOffset
            L27_3 = L12_3
            L28_3 = L21_3.x
            L29_3 = L24_3.x
            L29_3 = 0.01 * L29_3
            L28_3 = L28_3 - L29_3
            L29_3 = L21_3.y
            L30_3 = L24_3.y
            L30_3 = 0.01 * L30_3
            L29_3 = L29_3 - L30_3
            L30_3 = L18_3
            L31_3 = false
            L32_3 = false
            L33_3 = false
            L26_3(L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)
          end
          L26_3 = IsDisabledControlPressed
          L27_3 = 1
          L28_3 = 34
          L26_3 = L26_3(L27_3, L28_3)
          if L26_3 then
            L26_3 = SetEntityCoordsNoOffset
            L27_3 = L12_3
            L28_3 = L21_3.x
            L29_3 = L25_3.x
            L29_3 = 0.01 * L29_3
            L28_3 = L28_3 + L29_3
            L29_3 = L21_3.y
            L30_3 = L25_3.y
            L30_3 = 0.01 * L30_3
            L29_3 = L29_3 + L30_3
            L30_3 = L18_3
            L31_3 = false
            L32_3 = false
            L33_3 = false
            L26_3(L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)
          end
          L26_3 = IsDisabledControlPressed
          L27_3 = 1
          L28_3 = 35
          L26_3 = L26_3(L27_3, L28_3)
          if L26_3 then
            L26_3 = SetEntityCoordsNoOffset
            L27_3 = L12_3
            L28_3 = L21_3.x
            L29_3 = L25_3.x
            L29_3 = 0.01 * L29_3
            L28_3 = L28_3 - L29_3
            L29_3 = L21_3.y
            L30_3 = L25_3.y
            L30_3 = 0.01 * L30_3
            L29_3 = L29_3 - L30_3
            L30_3 = L18_3
            L31_3 = false
            L32_3 = false
            L33_3 = false
            L26_3(L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)
          end
          L26_3 = IsControlPressed
          L27_3 = 0
          L28_3 = 172
          L26_3 = L26_3(L27_3, L28_3)
          if L26_3 then
            L26_3 = SetEntityCoordsNoOffset
            L27_3 = L12_3
            L28_3 = L16_3.x
            L29_3 = L16_3.y
            L30_3 = L18_3 + 0.01
            L31_3 = false
            L32_3 = false
            L33_3 = false
            L26_3(L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)
          end
          L26_3 = IsControlPressed
          L27_3 = 0
          L28_3 = 173
          L26_3 = L26_3(L27_3, L28_3)
          if L26_3 then
            L26_3 = SetEntityCoordsNoOffset
            L27_3 = L12_3
            L28_3 = L16_3.x
            L29_3 = L16_3.y
            L30_3 = L18_3 - 0.01
            L31_3 = false
            L32_3 = false
            L33_3 = false
            L26_3(L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)
          end
          L26_3 = L21_3.x
          L27_3 = L20_3.x
          L26_3 = L26_3 - L27_3
          L27_3 = L21_3.y
          L28_3 = L20_3.y
          L27_3 = L27_3 - L28_3
          L28_3 = math
          L28_3 = L28_3.deg
          L29_3 = math
          L29_3 = L29_3.atan2
          L30_3 = L27_3
          L31_3 = L26_3
          L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3 = L29_3(L30_3, L31_3)
          L28_3 = L28_3(L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3, L39_3, L40_3, L41_3, L42_3)
          L29_3 = SetEntityHeading
          L30_3 = L19_3
          L31_3 = L28_3 - 90.0
          L29_3(L30_3, L31_3)
          L29_3 = GetEntityCoords
          L30_3 = L12_3
          L29_3 = L29_3(L30_3)
          L14_3 = L29_3
        else
          L18_3 = SetEntityCoordsNoOffset
          L19_3 = L12_3
          L20_3 = L14_3.x
          L21_3 = L14_3.y
          L22_3 = L14_3.z
          L22_3 = L22_3 + L7_3
          L23_3 = false
          L24_3 = false
          L25_3 = false
          L18_3(L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3)
        end
        L18_3 = SetEntityHeading
        L19_3 = L12_3
        L20_3 = L3_2
        L18_3(L19_3, L20_3)
        L18_3 = IsControlJustPressed
        L19_3 = 1
        L20_3 = 45
        L18_3 = L18_3(L19_3, L20_3)
        if L18_3 then
          L18_3 = OriginalMode
          L18_3 = not L18_3
          OriginalMode = L18_3
          L18_3 = setupStickyform
          L19_3 = "instructional_buttons"
          L18_3 = L18_3(L19_3)
          L0_3 = L18_3
        end
        L18_3 = GetGameplayCamCoords
        L18_3 = L18_3()
        L19_3 = L11_3
        L20_3 = L12_3
        L19_3, L20_3 = L19_3(L20_3)
        if L19_3 and L20_3 then
          L21_3 = IsLineOfSightClear
          L22_3 = L18_3.x
          L23_3 = L18_3.y
          L24_3 = L18_3.z
          L25_3 = L20_3.x
          L26_3 = L20_3.y
          L27_3 = L20_3.z
          L21_3 = L21_3(L22_3, L23_3, L24_3, L25_3, L26_3, L27_3)
          if L21_3 then
            L21_3 = DrawText3D
            L22_3 = L19_3.x
            L23_3 = L19_3.y
            L24_3 = L19_3.z
            L25_3 = "1234"
            L21_3(L22_3, L23_3, L24_3, L25_3)
          end
        end
        L21_3 = IsControlJustPressed
        L22_3 = 0
        L23_3 = 38
        L21_3 = L21_3(L22_3, L23_3)
        if L21_3 and not L1_3 then
          L1_3 = true
          L21_3 = GetEntityCoords
          L22_3 = L12_3
          L21_3 = L21_3(L22_3)
          L22_3 = {}
          L23_3 = L21_3.x
          L24_3 = L21_3.y
          L25_3 = L21_3.z
          L22_3[1] = L23_3
          L22_3[2] = L24_3
          L22_3[3] = L25_3
          L2_2.position = L22_3
          L22_3 = L3_2
          L2_2.heading = L22_3
          break
        end
      end
      L16_3 = Wait
      L17_3 = 1
      L16_3(L17_3)
    end
    L13_3 = L2_2.position
    if L13_3 then
      L13_3 = A1_2
      L14_3 = {}
      L15_3 = L2_2
      L14_3.FinalInfo = L15_3
      L13_3(L14_3)
    else
      L13_3 = A1_2
      L14_3 = {}
      L14_3.error = "Failed to place sticky pad"
      L13_3(L14_3)
    end
    L13_3 = SetNuiFocus
    L14_3 = true
    L15_3 = true
    L13_3(L14_3, L15_3)
    L13_3 = DeleteEntity
    L14_3 = L12_3
    L13_3(L14_3)
    L13_3 = HideRobberyCreatorPrompt
    L13_3()
    L13_3 = TabletEmote
    L13_3()
  end
  L4_2(L5_2)
end
L106_1(L107_1, L108_1)
L106_1 = RegisterNUICallback
L107_1 = "placeCustomDoor"
function L108_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  OriginalMode = true
  L2_2 = Config
  L2_2 = L2_2.Color
  L3_2 = 0.04
  L4_2 = 1
  L5_2 = Config
  L5_2 = L5_2.CustomDoorModels
  L5_2 = L5_2[L4_2]
  L6_2 = GetHashKey
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = {}
  L8_2 = nil
  L9_2 = 0.0
  L10_2 = LoadModel
  L11_2 = L6_2
  L10_2(L11_2)
  L10_2 = CreateThread
  function L11_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3
    L0_3 = setupDoorForm
    L1_3 = "instructional_buttons"
    L0_3 = L0_3(L1_3)
    while true do
      L1_3 = RayCastGamePlayCamera
      L2_3 = 20.0
      L1_3, L2_3, L3_3 = L1_3(L2_3)
      L4_3 = DrawRobberyCreatorPrompt
      L5_3 = L0_3
      L4_3(L5_3)
      if L1_3 then
        L4_3 = L79_1
        L4_3()
        L4_3 = IsControlJustPressed
        L5_3 = 1
        L6_3 = 177
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = L8_2
          if L4_3 then
            L4_3 = DeleteEntity
            L5_3 = L8_2
            L4_3(L5_3)
          end
          L4_3 = A1_2
          L5_3 = {}
          L5_3.FinalInfo = false
          L4_3(L5_3)
          L4_3 = SetNuiFocus
          L5_3 = true
          L6_3 = true
          L4_3(L5_3, L6_3)
          break
        end
        L4_3 = OriginalMode
        if not L4_3 then
          L4_3 = DisableControlAction
          L5_3 = 0
          L6_3 = 30
          L7_3 = true
          L4_3(L5_3, L6_3, L7_3)
          L4_3 = DisableControlAction
          L5_3 = 0
          L6_3 = 31
          L7_3 = true
          L4_3(L5_3, L6_3, L7_3)
          L4_3 = DisableControlAction
          L5_3 = 0
          L6_3 = 34
          L7_3 = true
          L4_3(L5_3, L6_3, L7_3)
          L4_3 = DisableControlAction
          L5_3 = 0
          L6_3 = 35
          L7_3 = true
          L4_3(L5_3, L6_3, L7_3)
          L4_3 = GetEntityCoords
          L5_3 = L8_2
          L4_3 = L4_3(L5_3)
          L5_3 = L4_3.z
          L6_3 = PlayerPedId
          L6_3 = L6_3()
          L7_3 = GetEntityCoords
          L8_3 = L6_3
          L7_3 = L7_3(L8_3)
          L8_3 = GetEntityCoords
          L9_3 = L8_2
          L8_3 = L8_3(L9_3)
          L9_3 = vector3
          L10_3 = L8_3.x
          L11_3 = L7_3.x
          L10_3 = L10_3 - L11_3
          L11_3 = L8_3.y
          L12_3 = L7_3.y
          L11_3 = L11_3 - L12_3
          L12_3 = 0
          L9_3 = L9_3(L10_3, L11_3, L12_3)
          L10_3 = math
          L10_3 = L10_3.sqrt
          L11_3 = L9_3.x
          L11_3 = L11_3 ^ 2
          L12_3 = L9_3.y
          L12_3 = L12_3 ^ 2
          L11_3 = L11_3 + L12_3
          L10_3 = L10_3(L11_3)
          L11_3 = vector3
          L12_3 = L9_3.x
          L12_3 = L12_3 / L10_3
          L13_3 = L9_3.y
          L13_3 = L13_3 / L10_3
          L14_3 = 0
          L11_3 = L11_3(L12_3, L13_3, L14_3)
          L12_3 = vector3
          L13_3 = L11_3.y
          L13_3 = -L13_3
          L14_3 = L11_3.x
          L15_3 = 0
          L12_3 = L12_3(L13_3, L14_3, L15_3)
          L13_3 = IsDisabledControlPressed
          L14_3 = 1
          L15_3 = 32
          L13_3 = L13_3(L14_3, L15_3)
          if L13_3 then
            L13_3 = L8_3.x
            L14_3 = L11_3.x
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 + L14_3
            L14_3 = L8_3.y
            L15_3 = L11_3.y
            L15_3 = 0.01 * L15_3
            L14_3 = L14_3 + L15_3
            L15_3 = SetEntityCoords
            L16_3 = L8_2
            L17_3 = L13_3
            L18_3 = L14_3
            L19_3 = L5_3
            L15_3(L16_3, L17_3, L18_3, L19_3)
          end
          L13_3 = IsDisabledControlPressed
          L14_3 = 1
          L15_3 = 33
          L13_3 = L13_3(L14_3, L15_3)
          if L13_3 then
            L13_3 = L8_3.x
            L14_3 = L11_3.x
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 - L14_3
            L14_3 = L8_3.y
            L15_3 = L11_3.y
            L15_3 = 0.01 * L15_3
            L14_3 = L14_3 - L15_3
            L15_3 = SetEntityCoords
            L16_3 = L8_2
            L17_3 = L13_3
            L18_3 = L14_3
            L19_3 = L5_3
            L15_3(L16_3, L17_3, L18_3, L19_3)
          end
          L13_3 = IsDisabledControlPressed
          L14_3 = 1
          L15_3 = 34
          L13_3 = L13_3(L14_3, L15_3)
          if L13_3 then
            L13_3 = L8_3.x
            L14_3 = L12_3.x
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 + L14_3
            L14_3 = L8_3.y
            L15_3 = L12_3.y
            L15_3 = 0.01 * L15_3
            L14_3 = L14_3 + L15_3
            L15_3 = SetEntityCoords
            L16_3 = L8_2
            L17_3 = L13_3
            L18_3 = L14_3
            L19_3 = L5_3
            L15_3(L16_3, L17_3, L18_3, L19_3)
          end
          L13_3 = IsDisabledControlPressed
          L14_3 = 1
          L15_3 = 35
          L13_3 = L13_3(L14_3, L15_3)
          if L13_3 then
            L13_3 = L8_3.x
            L14_3 = L12_3.x
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 - L14_3
            L14_3 = L8_3.y
            L15_3 = L12_3.y
            L15_3 = 0.01 * L15_3
            L14_3 = L14_3 - L15_3
            L15_3 = SetEntityCoords
            L16_3 = L8_2
            L17_3 = L13_3
            L18_3 = L14_3
            L19_3 = L5_3
            L15_3(L16_3, L17_3, L18_3, L19_3)
          end
          L13_3 = IsControlPressed
          L14_3 = 0
          L15_3 = 172
          L13_3 = L13_3(L14_3, L15_3)
          if L13_3 then
            L13_3 = SetEntityCoords
            L14_3 = L8_2
            L15_3 = L4_3.x
            L16_3 = L4_3.y
            L17_3 = L5_3 + 0.01
            L13_3(L14_3, L15_3, L16_3, L17_3)
          end
          L13_3 = IsControlPressed
          L14_3 = 0
          L15_3 = 173
          L13_3 = L13_3(L14_3, L15_3)
          if L13_3 then
            L13_3 = SetEntityCoords
            L14_3 = L8_2
            L15_3 = L4_3.x
            L16_3 = L4_3.y
            L17_3 = L5_3 - 0.01
            L13_3(L14_3, L15_3, L16_3, L17_3)
          end
          L13_3 = GetEntityCoords
          L14_3 = L8_2
          L13_3 = L13_3(L14_3)
          L2_3 = L13_3
        end
        L4_3 = IsControlJustPressed
        L5_3 = 1
        L6_3 = 45
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = OriginalMode
          L4_3 = not L4_3
          OriginalMode = L4_3
          L4_3 = setupDoorForm
          L5_3 = "instructional_buttons"
          L4_3 = L4_3(L5_3)
          L0_3 = L4_3
        end
        L4_3 = L8_2
        if not L4_3 then
          L4_3 = CreateObject
          L5_3 = L6_2
          L6_3 = L2_3.x
          L7_3 = L2_3.y
          L8_3 = L2_3.z
          L9_3 = false
          L10_3 = false
          L11_3 = false
          L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
          L8_2 = L4_3
          L4_3 = SetEntityInvincible
          L5_3 = L8_2
          L6_3 = true
          L4_3(L5_3, L6_3)
          L4_3 = SetEntityCollision
          L5_3 = L8_2
          L6_3 = false
          L7_3 = false
          L4_3(L5_3, L6_3, L7_3)
          L4_3 = FreezeEntityPosition
          L5_3 = L8_2
          L6_3 = true
          L4_3(L5_3, L6_3)
        else
          L4_3 = OriginalMode
          if L4_3 then
            L4_3 = SetEntityCoords
            L5_3 = L8_2
            L6_3 = L2_3.x
            L7_3 = L2_3.y
            L8_3 = L2_3.z
            L8_3 = L8_3 + 1
            L4_3(L5_3, L6_3, L7_3, L8_3)
          end
        end
        L4_3 = SetEntityHeading
        L5_3 = L8_2
        L6_3 = L9_2
        L4_3(L5_3, L6_3)
        L4_3 = IsControlPressed
        L5_3 = 0
        L6_3 = 174
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = L9_2
          L4_3 = L4_3 + 1.0
          L9_2 = L4_3
          L4_3 = L9_2
          L5_3 = 360
          if L4_3 > L5_3 then
            L4_3 = 0.0
            L9_2 = L4_3
          end
        else
          L4_3 = IsControlPressed
          L5_3 = 0
          L6_3 = 175
          L4_3 = L4_3(L5_3, L6_3)
          if L4_3 then
            L4_3 = L9_2
            L4_3 = L4_3 - 1.0
            L9_2 = L4_3
            L4_3 = L9_2
            if L4_3 < 0 then
              L4_3 = 360.0
              L9_2 = L4_3
            end
          end
        end
        L4_3 = IsControlJustPressed
        L5_3 = 1
        L6_3 = 15
        L4_3 = L4_3(L5_3, L6_3)
        if not L4_3 then
          L4_3 = IsControlJustPressed
          L5_3 = 1
          L6_3 = 173
          L4_3 = L4_3(L5_3, L6_3)
          if not L4_3 then
            goto lbl_408
          end
        end
        L4_3 = L4_2
        L4_3 = L4_3 + 1
        L4_2 = L4_3
        L4_3 = L4_2
        L5_3 = Config
        L5_3 = L5_3.CustomDoorModels
        L5_3 = #L5_3
        if L4_3 > L5_3 then
          L4_3 = 1
          L4_2 = L4_3
        end
        L4_3 = Config
        L4_3 = L4_3.CustomDoorModels
        L5_3 = L4_2
        L4_3 = L4_3[L5_3]
        L5_2 = L4_3
        L4_3 = GetHashKey
        L5_3 = L5_2
        L4_3 = L4_3(L5_3)
        L6_2 = L4_3
        L4_3 = IsModelValid
        L5_3 = L6_2
        L4_3 = L4_3(L5_3)
        if L4_3 then
          L4_3 = L8_2
          if L4_3 then
            L4_3 = DeleteEntity
            L5_3 = L8_2
            L4_3(L5_3)
          end
          L4_3 = LoadModel
          L5_3 = L6_2
          L4_3(L5_3)
          L4_3 = CreateObject
          L5_3 = L6_2
          L6_3 = L2_3.x
          L7_3 = L2_3.y
          L8_3 = L2_3.z
          L9_3 = false
          L10_3 = false
          L11_3 = false
          L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
          L8_2 = L4_3
          L4_3 = SetEntityHeading
          L5_3 = L8_2
          L6_3 = L9_2
          L4_3(L5_3, L6_3)
          L4_3 = SetEntityInvincible
          L5_3 = L8_2
          L6_3 = true
          L4_3(L5_3, L6_3)
          L4_3 = SetEntityCollision
          L5_3 = L8_2
          L6_3 = false
          L7_3 = false
          L4_3(L5_3, L6_3, L7_3)
          L4_3 = FreezeEntityPosition
          L5_3 = L8_2
          L6_3 = true
          L4_3(L5_3, L6_3)
          L4_3 = setupDoorForm
          L5_3 = "instructional_buttons"
          L4_3 = L4_3(L5_3)
          L0_3 = L4_3
        else
          L4_3 = print
          L5_3 = "Invalid door model: "
          L6_3 = tostring
          L7_3 = L5_2
          L6_3 = L6_3(L7_3)
          L5_3 = L5_3 .. L6_3
          L4_3(L5_3)
          goto lbl_493
          ::lbl_408::
          L4_3 = IsControlJustPressed
          L5_3 = 1
          L6_3 = 14
          L4_3 = L4_3(L5_3, L6_3)
          if not L4_3 then
            L4_3 = IsControlJustPressed
            L5_3 = 1
            L6_3 = 172
            L4_3 = L4_3(L5_3, L6_3)
            if not L4_3 then
              goto lbl_493
            end
          end
          L4_3 = L4_2
          L4_3 = L4_3 - 1
          L4_2 = L4_3
          L4_3 = L4_2
          if L4_3 < 1 then
            L4_3 = Config
            L4_3 = L4_3.CustomDoorModels
            L4_3 = #L4_3
            L4_2 = L4_3
          end
          L4_3 = Config
          L4_3 = L4_3.CustomDoorModels
          L5_3 = L4_2
          L4_3 = L4_3[L5_3]
          L5_2 = L4_3
          L4_3 = GetHashKey
          L5_3 = L5_2
          L4_3 = L4_3(L5_3)
          L6_2 = L4_3
          L4_3 = IsModelValid
          L5_3 = L6_2
          L4_3 = L4_3(L5_3)
          if L4_3 then
            L4_3 = L8_2
            if L4_3 then
              L4_3 = DeleteEntity
              L5_3 = L8_2
              L4_3(L5_3)
            end
            L4_3 = LoadModel
            L5_3 = L6_2
            L4_3(L5_3)
            L4_3 = CreateObject
            L5_3 = L6_2
            L6_3 = L2_3.x
            L7_3 = L2_3.y
            L8_3 = L2_3.z
            L9_3 = false
            L10_3 = false
            L11_3 = false
            L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
            L8_2 = L4_3
            L4_3 = SetEntityHeading
            L5_3 = L8_2
            L6_3 = L9_2
            L4_3(L5_3, L6_3)
            L4_3 = SetEntityInvincible
            L5_3 = L8_2
            L6_3 = true
            L4_3(L5_3, L6_3)
            L4_3 = SetEntityCollision
            L5_3 = L8_2
            L6_3 = false
            L7_3 = false
            L4_3(L5_3, L6_3, L7_3)
            L4_3 = FreezeEntityPosition
            L5_3 = L8_2
            L6_3 = true
            L4_3(L5_3, L6_3)
            L4_3 = setupDoorForm
            L5_3 = "instructional_buttons"
            L4_3 = L4_3(L5_3)
            L0_3 = L4_3
          else
            L4_3 = print
            L5_3 = "Invalid door model: "
            L6_3 = tostring
            L7_3 = L5_2
            L6_3 = L6_3(L7_3)
            L5_3 = L5_3 .. L6_3
            L4_3(L5_3)
          end
        end
        ::lbl_493::
        L4_3 = IsControlJustPressed
        L5_3 = 0
        L6_3 = 38
        L4_3 = L4_3(L5_3, L6_3)
        if L4_3 then
          L4_3 = GetEntityCoords
          L5_3 = L8_2
          L4_3 = L4_3(L5_3)
          L5_3 = GetEntityHeading
          L6_3 = L8_2
          L5_3 = L5_3(L6_3)
          L6_3 = {}
          L7_3 = {}
          L8_3 = L4_3.x
          L7_3.x = L8_3
          L8_3 = L4_3.y
          L7_3.y = L8_3
          L8_3 = L4_3.z
          L7_3.z = L8_3
          L6_3.doorPosition = L7_3
          L6_3.heading = L5_3
          L7_3 = L5_2
          L6_3.doorModel = L7_3
          L7_2 = L6_3
          L6_3 = SetNuiFocus
          L7_3 = true
          L8_3 = true
          L6_3(L7_3, L8_3)
          L6_3 = A1_2
          L7_3 = {}
          L8_3 = L7_2
          L7_3.FinalInfo = L8_3
          L6_3(L7_3)
          break
        end
      end
      L4_3 = Wait
      L5_3 = 1
      L4_3(L5_3)
    end
    L1_3 = L8_2
    if L1_3 then
      L1_3 = DeleteEntity
      L2_3 = L8_2
      L1_3(L2_3)
    end
    L1_3 = HideRobberyCreatorPrompt
    L1_3()
    L1_3 = TabletEmote
    L1_3()
  end
  L10_2(L11_2)
end
L106_1(L107_1, L108_1)
L106_1 = RegisterNUICallback
L107_1 = "requestGuardPlacement"
function L108_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  OriginalMode = true
  L2_2 = Config
  L2_2 = L2_2.Color
  L3_2 = 0.04
  L4_2 = 3
  L5_2 = "s_m_m_chemsec_01"
  L6_2 = Config
  L6_2 = L6_2.WeaponList
  L6_2 = L6_2[L4_2]
  currentWeapon = L6_2
  L6_2 = {}
  L7_2 = nil
  L8_2 = 0.0
  L9_2 = LoadModel
  L10_2 = L5_2
  L9_2(L10_2)
  L9_2 = CreateThread
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3
    L0_3 = setupGuardform
    L1_3 = "instructional_buttons"
    L0_3 = L0_3(L1_3)
    form = L0_3
    while true do
      L0_3 = RayCastGamePlayCamera
      L1_3 = 20.0
      L0_3, L1_3, L2_3 = L0_3(L1_3)
      L3_3 = DrawRobberyCreatorPrompt
      L4_3 = form
      L3_3(L4_3)
      if L0_3 then
        L3_3 = L79_1
        L3_3()
        L3_3 = IsControlJustPressed
        L4_3 = 1
        L5_3 = 177
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = L7_2
          if L3_3 then
            L3_3 = DeleteEntity
            L4_3 = L7_2
            L3_3(L4_3)
          end
          L3_3 = A1_2
          L4_3 = {}
          L4_3.FinalInfo = false
          L3_3(L4_3)
          L3_3 = SetNuiFocus
          L4_3 = true
          L5_3 = true
          L3_3(L4_3, L5_3)
          break
        end
        L3_3 = OriginalMode
        if not L3_3 then
          L3_3 = DisableControlAction
          L4_3 = 0
          L5_3 = 30
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = DisableControlAction
          L4_3 = 0
          L5_3 = 31
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = DisableControlAction
          L4_3 = 0
          L5_3 = 34
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = DisableControlAction
          L4_3 = 0
          L5_3 = 35
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = GetEntityCoords
          L4_3 = L7_2
          L3_3 = L3_3(L4_3)
          L4_3 = L3_3.z
          L4_3 = L4_3 - 1
          L5_3 = PlayerPedId
          L5_3 = L5_3()
          L6_3 = GetEntityCoords
          L7_3 = L5_3
          L6_3 = L6_3(L7_3)
          L7_3 = GetEntityCoords
          L8_3 = L7_2
          L7_3 = L7_3(L8_3)
          L8_3 = vector3
          L9_3 = L7_3.x
          L10_3 = L6_3.x
          L9_3 = L9_3 - L10_3
          L10_3 = L7_3.y
          L11_3 = L6_3.y
          L10_3 = L10_3 - L11_3
          L11_3 = 0
          L8_3 = L8_3(L9_3, L10_3, L11_3)
          L9_3 = math
          L9_3 = L9_3.sqrt
          L10_3 = L8_3.x
          L10_3 = L10_3 ^ 2
          L11_3 = L8_3.y
          L11_3 = L11_3 ^ 2
          L10_3 = L10_3 + L11_3
          L9_3 = L9_3(L10_3)
          L10_3 = vector3
          L11_3 = L8_3.x
          L11_3 = L11_3 / L9_3
          L12_3 = L8_3.y
          L12_3 = L12_3 / L9_3
          L13_3 = 0
          L10_3 = L10_3(L11_3, L12_3, L13_3)
          L11_3 = vector3
          L12_3 = L10_3.y
          L12_3 = -L12_3
          L13_3 = L10_3.x
          L14_3 = 0
          L11_3 = L11_3(L12_3, L13_3, L14_3)
          L12_3 = IsDisabledControlPressed
          L13_3 = 1
          L14_3 = 32
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = L7_3.x
            L13_3 = L10_3.x
            L13_3 = 0.01 * L13_3
            L12_3 = L12_3 + L13_3
            L13_3 = L7_3.y
            L14_3 = L10_3.y
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 + L14_3
            L14_3 = SetEntityCoords
            L15_3 = L7_2
            L16_3 = L12_3
            L17_3 = L13_3
            L18_3 = L4_3
            L14_3(L15_3, L16_3, L17_3, L18_3)
          end
          L12_3 = IsDisabledControlPressed
          L13_3 = 1
          L14_3 = 33
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = L7_3.x
            L13_3 = L10_3.x
            L13_3 = 0.01 * L13_3
            L12_3 = L12_3 - L13_3
            L13_3 = L7_3.y
            L14_3 = L10_3.y
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 - L14_3
            L14_3 = SetEntityCoords
            L15_3 = L7_2
            L16_3 = L12_3
            L17_3 = L13_3
            L18_3 = L4_3
            L14_3(L15_3, L16_3, L17_3, L18_3)
          end
          L12_3 = IsDisabledControlPressed
          L13_3 = 1
          L14_3 = 34
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = L7_3.x
            L13_3 = L11_3.x
            L13_3 = 0.01 * L13_3
            L12_3 = L12_3 + L13_3
            L13_3 = L7_3.y
            L14_3 = L11_3.y
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 + L14_3
            L14_3 = SetEntityCoords
            L15_3 = L7_2
            L16_3 = L12_3
            L17_3 = L13_3
            L18_3 = L4_3
            L14_3(L15_3, L16_3, L17_3, L18_3)
          end
          L12_3 = IsDisabledControlPressed
          L13_3 = 1
          L14_3 = 35
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = L7_3.x
            L13_3 = L11_3.x
            L13_3 = 0.01 * L13_3
            L12_3 = L12_3 - L13_3
            L13_3 = L7_3.y
            L14_3 = L11_3.y
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 - L14_3
            L14_3 = SetEntityCoords
            L15_3 = L7_2
            L16_3 = L12_3
            L17_3 = L13_3
            L18_3 = L4_3
            L14_3(L15_3, L16_3, L17_3, L18_3)
          end
          L12_3 = IsControlPressed
          L13_3 = 0
          L14_3 = 172
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = SetEntityCoords
            L13_3 = L7_2
            L14_3 = L3_3.x
            L15_3 = L3_3.y
            L16_3 = L4_3 + 0.01
            L12_3(L13_3, L14_3, L15_3, L16_3)
          end
          L12_3 = IsControlPressed
          L13_3 = 0
          L14_3 = 173
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = SetEntityCoords
            L13_3 = L7_2
            L14_3 = L3_3.x
            L15_3 = L3_3.y
            L16_3 = L4_3 - 0.01
            L12_3(L13_3, L14_3, L15_3, L16_3)
          end
          L12_3 = L7_3.x
          L13_3 = L6_3.x
          L12_3 = L12_3 - L13_3
          L13_3 = L7_3.y
          L14_3 = L6_3.y
          L13_3 = L13_3 - L14_3
          L14_3 = math
          L14_3 = L14_3.deg
          L15_3 = math
          L15_3 = L15_3.atan2
          L16_3 = L13_3
          L17_3 = L12_3
          L15_3, L16_3, L17_3, L18_3 = L15_3(L16_3, L17_3)
          L14_3 = L14_3(L15_3, L16_3, L17_3, L18_3)
          L15_3 = SetEntityHeading
          L16_3 = L5_3
          L17_3 = L14_3 - 90.0
          L15_3(L16_3, L17_3)
          L15_3 = GetEntityCoords
          L16_3 = L7_2
          L15_3 = L15_3(L16_3)
          L1_3 = L15_3
        end
        L3_3 = IsControlJustPressed
        L4_3 = 1
        L5_3 = 45
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = OriginalMode
          L3_3 = not L3_3
          OriginalMode = L3_3
          L3_3 = setupGuardform
          L4_3 = "instructional_buttons"
          L3_3 = L3_3(L4_3)
          form = L3_3
        end
        L3_3 = L7_2
        if not L3_3 then
          L3_3 = CreatePed
          L4_3 = 2
          L5_3 = L5_2
          L6_3 = L1_3.x
          L7_3 = L1_3.y
          L8_3 = L1_3.z
          L9_3 = L8_2
          L10_3 = false
          L11_3 = true
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
          L7_2 = L3_3
          L3_3 = SetEntityInvincible
          L4_3 = L7_2
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = SetEntityCollision
          L4_3 = L7_2
          L5_3 = false
          L6_3 = false
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = FreezeEntityPosition
          L4_3 = L7_2
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = GiveWeaponToPed
          L4_3 = L7_2
          L5_3 = GetHashKey
          L6_3 = currentWeapon
          L5_3 = L5_3(L6_3)
          L6_3 = 0
          L7_3 = false
          L8_3 = false
          L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
          L3_3 = SetCurrentPedWeapon
          L4_3 = L7_2
          L5_3 = GetHashKey
          L6_3 = currentWeapon
          L5_3 = L5_3(L6_3)
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
        else
          L3_3 = OriginalMode
          if L3_3 then
            L3_3 = SetEntityCoords
            L4_3 = L7_2
            L5_3 = L1_3.x
            L6_3 = L1_3.y
            L7_3 = L1_3.z
            L3_3(L4_3, L5_3, L6_3, L7_3)
          end
          L3_3 = SetEntityHeading
          L4_3 = L7_2
          L5_3 = L8_2
          L3_3(L4_3, L5_3)
        end
        L3_3 = IsControlPressed
        L4_3 = 0
        L5_3 = 174
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = L8_2
          L3_3 = L3_3 + 1.0
          L8_2 = L3_3
          L3_3 = L8_2
          L4_3 = 360
          if L3_3 > L4_3 then
            L3_3 = 0.0
            L8_2 = L3_3
          end
        else
          L3_3 = IsControlPressed
          L4_3 = 0
          L5_3 = 175
          L3_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            L3_3 = L8_2
            L3_3 = L3_3 - 1.0
            L8_2 = L3_3
            L3_3 = L8_2
            if L3_3 < 0 then
              L3_3 = 360.0
              L8_2 = L3_3
            end
          end
        end
        L3_3 = IsControlJustPressed
        L4_3 = 1
        L5_3 = 15
        L3_3 = L3_3(L4_3, L5_3)
        if not L3_3 then
          L3_3 = IsControlJustPressed
          L4_3 = 1
          L5_3 = 173
          L3_3 = L3_3(L4_3, L5_3)
          if not L3_3 then
            goto lbl_410
          end
        end
        L3_3 = L4_2
        L3_3 = L3_3 + 1
        L4_2 = L3_3
        L3_3 = L4_2
        L4_3 = Config
        L4_3 = L4_3.WeaponList
        L4_3 = #L4_3
        if L3_3 > L4_3 then
          L3_3 = 1
          L4_2 = L3_3
        end
        L3_3 = Config
        L3_3 = L3_3.WeaponList
        L4_3 = L4_2
        L3_3 = L3_3[L4_3]
        currentWeapon = L3_3
        L3_3 = GiveWeaponToPed
        L4_3 = L7_2
        L5_3 = GetHashKey
        L6_3 = currentWeapon
        L5_3 = L5_3(L6_3)
        L6_3 = 0
        L7_3 = false
        L8_3 = false
        L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
        L3_3 = SetCurrentPedWeapon
        L4_3 = L7_2
        L5_3 = GetHashKey
        L6_3 = currentWeapon
        L5_3 = L5_3(L6_3)
        L6_3 = true
        L3_3(L4_3, L5_3, L6_3)
        L3_3 = setupGuardform
        L4_3 = "instructional_buttons"
        L3_3 = L3_3(L4_3)
        form = L3_3
        goto lbl_458
        ::lbl_410::
        L3_3 = IsControlJustPressed
        L4_3 = 1
        L5_3 = 14
        L3_3 = L3_3(L4_3, L5_3)
        if not L3_3 then
          L3_3 = IsControlJustPressed
          L4_3 = 1
          L5_3 = 172
          L3_3 = L3_3(L4_3, L5_3)
          if not L3_3 then
            goto lbl_458
          end
        end
        L3_3 = L4_2
        L3_3 = L3_3 - 1
        L4_2 = L3_3
        L3_3 = L4_2
        if L3_3 < 1 then
          L3_3 = Config
          L3_3 = L3_3.WeaponList
          L3_3 = #L3_3
          L4_2 = L3_3
        end
        L3_3 = Config
        L3_3 = L3_3.WeaponList
        L4_3 = L4_2
        L3_3 = L3_3[L4_3]
        currentWeapon = L3_3
        L3_3 = GiveWeaponToPed
        L4_3 = L7_2
        L5_3 = GetHashKey
        L6_3 = currentWeapon
        L5_3 = L5_3(L6_3)
        L6_3 = 0
        L7_3 = false
        L8_3 = false
        L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
        L3_3 = SetCurrentPedWeapon
        L4_3 = L7_2
        L5_3 = GetHashKey
        L6_3 = currentWeapon
        L5_3 = L5_3(L6_3)
        L6_3 = true
        L3_3(L4_3, L5_3, L6_3)
        L3_3 = setupGuardform
        L4_3 = "instructional_buttons"
        L3_3 = L3_3(L4_3)
        form = L3_3
        ::lbl_458::
        L3_3 = IsControlJustPressed
        L4_3 = 0
        L5_3 = 38
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = {}
          L4_3 = L1_3.x
          L5_3 = L1_3.y
          L6_3 = L1_3.z
          L3_3[1] = L4_3
          L3_3[2] = L5_3
          L3_3[3] = L6_3
          L6_2.guardPosition = L3_3
          L3_3 = L8_2
          L6_2.heading = L3_3
          L3_3 = currentWeapon
          L6_2.weapon = L3_3
          L3_3 = GiveWeaponToPed
          L4_3 = L7_2
          L5_3 = GetHashKey
          L6_3 = currentWeapon
          L5_3 = L5_3(L6_3)
          L6_3 = 999
          L7_3 = false
          L8_3 = true
          L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)
          L3_3 = SetNuiFocus
          L4_3 = true
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = A1_2
          L4_3 = {}
          L5_3 = L6_2
          L4_3.FinalInfo = L5_3
          L3_3(L4_3)
          break
        end
      end
      L3_3 = Wait
      L4_3 = 1
      L3_3(L4_3)
    end
    L0_3 = L7_2
    if L0_3 then
      L0_3 = DeleteEntity
      L1_3 = L7_2
      L0_3(L1_3)
    end
    L0_3 = HideRobberyCreatorPrompt
    L0_3()
    L0_3 = TabletEmote
    L0_3()
  end
  L9_2(L10_2)
end
L106_1(L107_1, L108_1)
L106_1 = RegisterNUICallback
L107_1 = "placeRobberyIntelNpc"
function L108_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  OriginalMode = true
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = tonumber
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      L1_3 = 0.0
    end
    L1_3 = L1_3 % 360.0
    if L1_3 < 0.0 then
      L1_3 = L1_3 + 360.0
    end
    L2_3 = tonumber
    L3_3 = string
    L3_3 = L3_3.format
    L4_3 = "%.2f"
    L5_3 = L1_3
    L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    if not L2_3 then
      L2_3 = 0.0
    end
    return L2_3
  end
  L3_2 = L2_2
  L4_2 = A0_2 or L4_2
  if A0_2 then
    L4_2 = A0_2.heading
  end
  L3_2 = L3_2(L4_2)
  L4_2 = tostring
  if A0_2 then
    L5_2 = A0_2.pedModel
    if L5_2 then
      goto lbl_19
    end
  end
  L5_2 = "g_m_y_mexgoon_02"
  ::lbl_19::
  L4_2 = L4_2(L5_2)
  L5_2 = GetHashKey
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = nil
  L7_2 = {}
  L8_2 = LoadModel
  L9_2 = L4_2
  L8_2(L9_2)
  L8_2 = CreateThread
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    L0_3 = setupRobberyIntelNpcForm
    L1_3 = "instructional_buttons"
    L0_3 = L0_3(L1_3)
    form = L0_3
    while true do
      L0_3 = RayCastGamePlayCamera
      L1_3 = 20.0
      L0_3, L1_3 = L0_3(L1_3)
      L2_3 = DrawRobberyCreatorPrompt
      L3_3 = form
      L2_3(L3_3)
      if L0_3 then
        L2_3 = L79_1
        L2_3()
        L2_3 = IsControlJustPressed
        L3_3 = 1
        L4_3 = 177
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = L6_2
          if L2_3 then
            L2_3 = DeleteEntity
            L3_3 = L6_2
            L2_3(L3_3)
          end
          L2_3 = A1_2
          L3_3 = {}
          L3_3.FinalInfo = false
          L2_3(L3_3)
          L2_3 = SetNuiFocus
          L3_3 = true
          L4_3 = true
          L2_3(L3_3, L4_3)
          break
        end
        L2_3 = OriginalMode
        if not L2_3 then
          L2_3 = L6_2
          if L2_3 then
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 30
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 31
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 34
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 35
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = GetEntityCoords
            L3_3 = L6_2
            L2_3 = L2_3(L3_3)
            L3_3 = L2_3.z
            L3_3 = L3_3 - 1
            L4_3 = PlayerPedId
            L4_3 = L4_3()
            L5_3 = GetEntityCoords
            L6_3 = L4_3
            L5_3 = L5_3(L6_3)
            L6_3 = GetEntityCoords
            L7_3 = L6_2
            L6_3 = L6_3(L7_3)
            L7_3 = vector3
            L8_3 = L6_3.x
            L9_3 = L5_3.x
            L8_3 = L8_3 - L9_3
            L9_3 = L6_3.y
            L10_3 = L5_3.y
            L9_3 = L9_3 - L10_3
            L10_3 = 0
            L7_3 = L7_3(L8_3, L9_3, L10_3)
            L8_3 = math
            L8_3 = L8_3.sqrt
            L9_3 = L7_3.x
            L9_3 = L9_3 ^ 2
            L10_3 = L7_3.y
            L10_3 = L10_3 ^ 2
            L9_3 = L9_3 + L10_3
            L8_3 = L8_3(L9_3)
            L9_3 = 0.001
            if L8_3 > L9_3 then
              L9_3 = vector3
              L10_3 = L7_3.x
              L10_3 = L10_3 / L8_3
              L11_3 = L7_3.y
              L11_3 = L11_3 / L8_3
              L12_3 = 0
              L9_3 = L9_3(L10_3, L11_3, L12_3)
              L10_3 = vector3
              L11_3 = L9_3.y
              L11_3 = -L11_3
              L12_3 = L9_3.x
              L13_3 = 0
              L10_3 = L10_3(L11_3, L12_3, L13_3)
              L11_3 = IsDisabledControlPressed
              L12_3 = 1
              L13_3 = 32
              L11_3 = L11_3(L12_3, L13_3)
              if L11_3 then
                L11_3 = SetEntityCoords
                L12_3 = L6_2
                L13_3 = L6_3.x
                L14_3 = L9_3.x
                L14_3 = 0.01 * L14_3
                L13_3 = L13_3 + L14_3
                L14_3 = L6_3.y
                L15_3 = L9_3.y
                L15_3 = 0.01 * L15_3
                L14_3 = L14_3 + L15_3
                L15_3 = L3_3
                L11_3(L12_3, L13_3, L14_3, L15_3)
              end
              L11_3 = IsDisabledControlPressed
              L12_3 = 1
              L13_3 = 33
              L11_3 = L11_3(L12_3, L13_3)
              if L11_3 then
                L11_3 = SetEntityCoords
                L12_3 = L6_2
                L13_3 = L6_3.x
                L14_3 = L9_3.x
                L14_3 = 0.01 * L14_3
                L13_3 = L13_3 - L14_3
                L14_3 = L6_3.y
                L15_3 = L9_3.y
                L15_3 = 0.01 * L15_3
                L14_3 = L14_3 - L15_3
                L15_3 = L3_3
                L11_3(L12_3, L13_3, L14_3, L15_3)
              end
              L11_3 = IsDisabledControlPressed
              L12_3 = 1
              L13_3 = 34
              L11_3 = L11_3(L12_3, L13_3)
              if L11_3 then
                L11_3 = SetEntityCoords
                L12_3 = L6_2
                L13_3 = L6_3.x
                L14_3 = L10_3.x
                L14_3 = 0.01 * L14_3
                L13_3 = L13_3 + L14_3
                L14_3 = L6_3.y
                L15_3 = L10_3.y
                L15_3 = 0.01 * L15_3
                L14_3 = L14_3 + L15_3
                L15_3 = L3_3
                L11_3(L12_3, L13_3, L14_3, L15_3)
              end
              L11_3 = IsDisabledControlPressed
              L12_3 = 1
              L13_3 = 35
              L11_3 = L11_3(L12_3, L13_3)
              if L11_3 then
                L11_3 = SetEntityCoords
                L12_3 = L6_2
                L13_3 = L6_3.x
                L14_3 = L10_3.x
                L14_3 = 0.01 * L14_3
                L13_3 = L13_3 - L14_3
                L14_3 = L6_3.y
                L15_3 = L10_3.y
                L15_3 = 0.01 * L15_3
                L14_3 = L14_3 - L15_3
                L15_3 = L3_3
                L11_3(L12_3, L13_3, L14_3, L15_3)
              end
            end
            L9_3 = IsControlPressed
            L10_3 = 0
            L11_3 = 172
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L6_2
              L11_3 = L2_3.x
              L12_3 = L2_3.y
              L13_3 = L3_3 + 0.01
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = IsControlPressed
            L10_3 = 0
            L11_3 = 173
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L6_2
              L11_3 = L2_3.x
              L12_3 = L2_3.y
              L13_3 = L3_3 - 0.01
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = L6_3.x
            L10_3 = L5_3.x
            L9_3 = L9_3 - L10_3
            L10_3 = L6_3.y
            L11_3 = L5_3.y
            L10_3 = L10_3 - L11_3
            L11_3 = math
            L11_3 = L11_3.deg
            L12_3 = math
            L12_3 = L12_3.atan2
            L13_3 = L10_3
            L14_3 = L9_3
            L12_3, L13_3, L14_3, L15_3 = L12_3(L13_3, L14_3)
            L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3)
            L12_3 = SetEntityHeading
            L13_3 = L4_3
            L14_3 = L11_3 - 90.0
            L12_3(L13_3, L14_3)
            L12_3 = GetEntityCoords
            L13_3 = L6_2
            L12_3 = L12_3(L13_3)
            L1_3 = L12_3
          end
        end
        L2_3 = IsControlJustPressed
        L3_3 = 1
        L4_3 = 45
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = OriginalMode
          L2_3 = not L2_3
          OriginalMode = L2_3
          L2_3 = setupRobberyIntelNpcForm
          L3_3 = "instructional_buttons"
          L2_3 = L2_3(L3_3)
          form = L2_3
        end
        L2_3 = L6_2
        if not L2_3 then
          L2_3 = CreatePed
          L3_3 = 2
          L4_3 = L5_2
          L5_3 = L1_3.x
          L6_3 = L1_3.y
          L7_3 = L1_3.z
          L8_3 = L3_2
          L8_3 = L8_3 + 0.0
          L9_3 = false
          L10_3 = true
          L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
          L6_2 = L2_3
          L2_3 = SetEntityInvincible
          L3_3 = L6_2
          L4_3 = true
          L2_3(L3_3, L4_3)
          L2_3 = SetEntityCollision
          L3_3 = L6_2
          L4_3 = false
          L5_3 = false
          L2_3(L3_3, L4_3, L5_3)
          L2_3 = FreezeEntityPosition
          L3_3 = L6_2
          L4_3 = true
          L2_3(L3_3, L4_3)
          L2_3 = SetBlockingOfNonTemporaryEvents
          L3_3 = L6_2
          L4_3 = true
          L2_3(L3_3, L4_3)
        else
          L2_3 = OriginalMode
          if L2_3 then
            L2_3 = SetEntityCoords
            L3_3 = L6_2
            L4_3 = L1_3.x
            L5_3 = L1_3.y
            L6_3 = L1_3.z
            L2_3(L3_3, L4_3, L5_3, L6_3)
          end
        end
        L2_3 = IsControlPressed
        L3_3 = 0
        L4_3 = 174
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = L2_2
          L3_3 = L3_2
          L3_3 = L3_3 + 1.0
          L2_3 = L2_3(L3_3)
          L3_2 = L2_3
        else
          L2_3 = IsControlPressed
          L3_3 = 0
          L4_3 = 175
          L2_3 = L2_3(L3_3, L4_3)
          if L2_3 then
            L2_3 = L2_2
            L3_3 = L3_2
            L3_3 = L3_3 - 1.0
            L2_3 = L2_3(L3_3)
            L3_2 = L2_3
          end
        end
        L2_3 = L6_2
        if L2_3 then
          L2_3 = SetEntityHeading
          L3_3 = L6_2
          L4_3 = L3_2
          L4_3 = L4_3 + 0.0
          L2_3(L3_3, L4_3)
        end
        L2_3 = IsControlJustPressed
        L3_3 = 0
        L4_3 = 38
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = L6_2
          if L2_3 then
            L2_3 = {}
            L3_3 = L1_3.x
            L2_3.x = L3_3
            L3_3 = L1_3.y
            L2_3.y = L3_3
            L3_3 = L1_3.z
            L2_3.z = L3_3
            L7_2.coords = L2_3
            L2_3 = L2_2
            L3_3 = L3_2
            L3_3 = L3_3 + 0.0
            L2_3 = L2_3(L3_3)
            L7_2.heading = L2_3
            L2_3 = SetNuiFocus
            L3_3 = true
            L4_3 = true
            L2_3(L3_3, L4_3)
            L2_3 = A1_2
            L3_3 = {}
            L4_3 = L7_2
            L3_3.FinalInfo = L4_3
            L2_3(L3_3)
            break
          end
        end
      end
      L2_3 = Wait
      L3_3 = 1
      L2_3(L3_3)
    end
    L0_3 = L6_2
    if L0_3 then
      L0_3 = DeleteEntity
      L1_3 = L6_2
      L0_3(L1_3)
    end
    L0_3 = HideRobberyCreatorPrompt
    L0_3()
    L0_3 = TabletEmote
    L0_3()
  end
  L8_2(L9_2)
end
L106_1(L107_1, L108_1)
L106_1 = RegisterNUICallback
L107_1 = "placeHouseMissionNpc"
function L108_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  OriginalMode = true
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = tonumber
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      L1_3 = 0.0
    end
    L1_3 = L1_3 % 360.0
    if L1_3 < 0.0 then
      L1_3 = L1_3 + 360.0
    end
    L2_3 = tonumber
    L3_3 = string
    L3_3 = L3_3.format
    L4_3 = "%.2f"
    L5_3 = L1_3
    L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
    L2_3 = L2_3(L3_3, L4_3, L5_3)
    if not L2_3 then
      L2_3 = 0.0
    end
    return L2_3
  end
  L3_2 = L2_2
  L4_2 = A0_2 or L4_2
  if A0_2 then
    L4_2 = A0_2.heading
  end
  L3_2 = L3_2(L4_2)
  L4_2 = tostring
  if A0_2 then
    L5_2 = A0_2.pedModel
    if L5_2 then
      goto lbl_19
    end
  end
  L5_2 = "a_m_y_business_03"
  ::lbl_19::
  L4_2 = L4_2(L5_2)
  L5_2 = GetHashKey
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = nil
  L7_2 = {}
  L8_2 = LoadModel
  L9_2 = L4_2
  L8_2(L9_2)
  L8_2 = CreateThread
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    L0_3 = setupRobberyIntelNpcForm
    L1_3 = "instructional_buttons"
    L0_3 = L0_3(L1_3)
    form = L0_3
    while true do
      L0_3 = RayCastGamePlayCamera
      L1_3 = 20.0
      L0_3, L1_3 = L0_3(L1_3)
      L2_3 = DrawRobberyCreatorPrompt
      L3_3 = form
      L2_3(L3_3)
      if L0_3 then
        L2_3 = L79_1
        L2_3()
        L2_3 = IsControlJustPressed
        L3_3 = 1
        L4_3 = 177
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = L6_2
          if L2_3 then
            L2_3 = DeleteEntity
            L3_3 = L6_2
            L2_3(L3_3)
          end
          L2_3 = A1_2
          L3_3 = {}
          L3_3.FinalInfo = false
          L2_3(L3_3)
          L2_3 = SetNuiFocus
          L3_3 = true
          L4_3 = true
          L2_3(L3_3, L4_3)
          break
        end
        L2_3 = OriginalMode
        if not L2_3 then
          L2_3 = L6_2
          if L2_3 then
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 30
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 31
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 34
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = DisableControlAction
            L3_3 = 0
            L4_3 = 35
            L5_3 = true
            L2_3(L3_3, L4_3, L5_3)
            L2_3 = GetEntityCoords
            L3_3 = L6_2
            L2_3 = L2_3(L3_3)
            L3_3 = L2_3.z
            L3_3 = L3_3 - 1
            L4_3 = PlayerPedId
            L4_3 = L4_3()
            L5_3 = GetEntityCoords
            L6_3 = L4_3
            L5_3 = L5_3(L6_3)
            L6_3 = GetEntityCoords
            L7_3 = L6_2
            L6_3 = L6_3(L7_3)
            L7_3 = vector3
            L8_3 = L6_3.x
            L9_3 = L5_3.x
            L8_3 = L8_3 - L9_3
            L9_3 = L6_3.y
            L10_3 = L5_3.y
            L9_3 = L9_3 - L10_3
            L10_3 = 0
            L7_3 = L7_3(L8_3, L9_3, L10_3)
            L8_3 = math
            L8_3 = L8_3.sqrt
            L9_3 = L7_3.x
            L9_3 = L9_3 ^ 2
            L10_3 = L7_3.y
            L10_3 = L10_3 ^ 2
            L9_3 = L9_3 + L10_3
            L8_3 = L8_3(L9_3)
            L9_3 = 0.001
            if L8_3 > L9_3 then
              L9_3 = vector3
              L10_3 = L7_3.x
              L10_3 = L10_3 / L8_3
              L11_3 = L7_3.y
              L11_3 = L11_3 / L8_3
              L12_3 = 0
              L9_3 = L9_3(L10_3, L11_3, L12_3)
              L10_3 = vector3
              L11_3 = L9_3.y
              L11_3 = -L11_3
              L12_3 = L9_3.x
              L13_3 = 0
              L10_3 = L10_3(L11_3, L12_3, L13_3)
              L11_3 = IsDisabledControlPressed
              L12_3 = 1
              L13_3 = 32
              L11_3 = L11_3(L12_3, L13_3)
              if L11_3 then
                L11_3 = SetEntityCoords
                L12_3 = L6_2
                L13_3 = L6_3.x
                L14_3 = L9_3.x
                L14_3 = 0.01 * L14_3
                L13_3 = L13_3 + L14_3
                L14_3 = L6_3.y
                L15_3 = L9_3.y
                L15_3 = 0.01 * L15_3
                L14_3 = L14_3 + L15_3
                L15_3 = L3_3
                L11_3(L12_3, L13_3, L14_3, L15_3)
              end
              L11_3 = IsDisabledControlPressed
              L12_3 = 1
              L13_3 = 33
              L11_3 = L11_3(L12_3, L13_3)
              if L11_3 then
                L11_3 = SetEntityCoords
                L12_3 = L6_2
                L13_3 = L6_3.x
                L14_3 = L9_3.x
                L14_3 = 0.01 * L14_3
                L13_3 = L13_3 - L14_3
                L14_3 = L6_3.y
                L15_3 = L9_3.y
                L15_3 = 0.01 * L15_3
                L14_3 = L14_3 - L15_3
                L15_3 = L3_3
                L11_3(L12_3, L13_3, L14_3, L15_3)
              end
              L11_3 = IsDisabledControlPressed
              L12_3 = 1
              L13_3 = 34
              L11_3 = L11_3(L12_3, L13_3)
              if L11_3 then
                L11_3 = SetEntityCoords
                L12_3 = L6_2
                L13_3 = L6_3.x
                L14_3 = L10_3.x
                L14_3 = 0.01 * L14_3
                L13_3 = L13_3 + L14_3
                L14_3 = L6_3.y
                L15_3 = L10_3.y
                L15_3 = 0.01 * L15_3
                L14_3 = L14_3 + L15_3
                L15_3 = L3_3
                L11_3(L12_3, L13_3, L14_3, L15_3)
              end
              L11_3 = IsDisabledControlPressed
              L12_3 = 1
              L13_3 = 35
              L11_3 = L11_3(L12_3, L13_3)
              if L11_3 then
                L11_3 = SetEntityCoords
                L12_3 = L6_2
                L13_3 = L6_3.x
                L14_3 = L10_3.x
                L14_3 = 0.01 * L14_3
                L13_3 = L13_3 - L14_3
                L14_3 = L6_3.y
                L15_3 = L10_3.y
                L15_3 = 0.01 * L15_3
                L14_3 = L14_3 - L15_3
                L15_3 = L3_3
                L11_3(L12_3, L13_3, L14_3, L15_3)
              end
            end
            L9_3 = IsControlPressed
            L10_3 = 0
            L11_3 = 172
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L6_2
              L11_3 = L2_3.x
              L12_3 = L2_3.y
              L13_3 = L3_3 + 0.01
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = IsControlPressed
            L10_3 = 0
            L11_3 = 173
            L9_3 = L9_3(L10_3, L11_3)
            if L9_3 then
              L9_3 = SetEntityCoords
              L10_3 = L6_2
              L11_3 = L2_3.x
              L12_3 = L2_3.y
              L13_3 = L3_3 - 0.01
              L9_3(L10_3, L11_3, L12_3, L13_3)
            end
            L9_3 = L6_3.x
            L10_3 = L5_3.x
            L9_3 = L9_3 - L10_3
            L10_3 = L6_3.y
            L11_3 = L5_3.y
            L10_3 = L10_3 - L11_3
            L11_3 = math
            L11_3 = L11_3.deg
            L12_3 = math
            L12_3 = L12_3.atan2
            L13_3 = L10_3
            L14_3 = L9_3
            L12_3, L13_3, L14_3, L15_3 = L12_3(L13_3, L14_3)
            L11_3 = L11_3(L12_3, L13_3, L14_3, L15_3)
            L12_3 = SetEntityHeading
            L13_3 = L4_3
            L14_3 = L11_3 - 90.0
            L12_3(L13_3, L14_3)
            L12_3 = GetEntityCoords
            L13_3 = L6_2
            L12_3 = L12_3(L13_3)
            L1_3 = L12_3
          end
        end
        L2_3 = IsControlJustPressed
        L3_3 = 1
        L4_3 = 45
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = OriginalMode
          L2_3 = not L2_3
          OriginalMode = L2_3
          L2_3 = setupRobberyIntelNpcForm
          L3_3 = "instructional_buttons"
          L2_3 = L2_3(L3_3)
          form = L2_3
        end
        L2_3 = L6_2
        if not L2_3 then
          L2_3 = CreatePed
          L3_3 = 2
          L4_3 = L5_2
          L5_3 = L1_3.x
          L6_3 = L1_3.y
          L7_3 = L1_3.z
          L8_3 = L3_2
          L8_3 = L8_3 + 0.0
          L9_3 = false
          L10_3 = true
          L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
          L6_2 = L2_3
          L2_3 = SetEntityInvincible
          L3_3 = L6_2
          L4_3 = true
          L2_3(L3_3, L4_3)
          L2_3 = SetEntityCollision
          L3_3 = L6_2
          L4_3 = false
          L5_3 = false
          L2_3(L3_3, L4_3, L5_3)
          L2_3 = FreezeEntityPosition
          L3_3 = L6_2
          L4_3 = true
          L2_3(L3_3, L4_3)
          L2_3 = SetBlockingOfNonTemporaryEvents
          L3_3 = L6_2
          L4_3 = true
          L2_3(L3_3, L4_3)
        else
          L2_3 = OriginalMode
          if L2_3 then
            L2_3 = SetEntityCoords
            L3_3 = L6_2
            L4_3 = L1_3.x
            L5_3 = L1_3.y
            L6_3 = L1_3.z
            L2_3(L3_3, L4_3, L5_3, L6_3)
          end
        end
        L2_3 = IsControlPressed
        L3_3 = 0
        L4_3 = 174
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = L2_2
          L3_3 = L3_2
          L3_3 = L3_3 + 1.0
          L2_3 = L2_3(L3_3)
          L3_2 = L2_3
        else
          L2_3 = IsControlPressed
          L3_3 = 0
          L4_3 = 175
          L2_3 = L2_3(L3_3, L4_3)
          if L2_3 then
            L2_3 = L2_2
            L3_3 = L3_2
            L3_3 = L3_3 - 1.0
            L2_3 = L2_3(L3_3)
            L3_2 = L2_3
          end
        end
        L2_3 = L6_2
        if L2_3 then
          L2_3 = SetEntityHeading
          L3_3 = L6_2
          L4_3 = L3_2
          L4_3 = L4_3 + 0.0
          L2_3(L3_3, L4_3)
        end
        L2_3 = IsControlJustPressed
        L3_3 = 0
        L4_3 = 38
        L2_3 = L2_3(L3_3, L4_3)
        if L2_3 then
          L2_3 = L6_2
          if L2_3 then
            L2_3 = {}
            L3_3 = L1_3.x
            L2_3.x = L3_3
            L3_3 = L1_3.y
            L2_3.y = L3_3
            L3_3 = L1_3.z
            L2_3.z = L3_3
            L7_2.coords = L2_3
            L2_3 = L2_2
            L3_3 = L3_2
            L3_3 = L3_3 + 0.0
            L2_3 = L2_3(L3_3)
            L7_2.heading = L2_3
            L2_3 = SetNuiFocus
            L3_3 = true
            L4_3 = true
            L2_3(L3_3, L4_3)
            L2_3 = A1_2
            L3_3 = {}
            L4_3 = L7_2
            L3_3.FinalInfo = L4_3
            L2_3(L3_3)
            break
          end
        end
      end
      L2_3 = Wait
      L3_3 = 1
      L2_3(L3_3)
    end
    L0_3 = L6_2
    if L0_3 then
      L0_3 = DeleteEntity
      L1_3 = L6_2
      L0_3(L1_3)
    end
    L0_3 = HideRobberyCreatorPrompt
    L0_3()
    L0_3 = TabletEmote
    L0_3()
  end
  L8_2(L9_2)
end
L106_1(L107_1, L108_1)
L106_1 = RegisterNUICallback
L107_1 = "requestEndingScene"
function L108_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  OriginalMode = true
  L2_2 = "s_m_m_highsec_02"
  L3_2 = {}
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  L7_2 = 0.0
  L8_2 = 1.0
  L9_2 = LoadModel
  L10_2 = L2_2
  L9_2(L10_2)
  L9_2 = LoadModel
  L10_2 = "s_m_m_highsec_01"
  L9_2(L10_2)
  L9_2 = CreateThread
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3
    L0_3 = setupEndingSceneform
    L1_3 = "instructional_buttons"
    L0_3 = L0_3(L1_3)
    form = L0_3
    while true do
      L0_3 = RayCastGamePlayCamera
      L1_3 = 20.0
      L0_3, L1_3, L2_3 = L0_3(L1_3)
      L3_3 = DrawRobberyCreatorPrompt
      L4_3 = form
      L3_3(L4_3)
      if L0_3 then
        L3_3 = L79_1
        L3_3()
        L3_3 = IsControlJustPressed
        L4_3 = 1
        L5_3 = 177
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = L4_2
          if L3_3 then
            L3_3 = DeleteEntity
            L4_3 = L4_2
            L3_3(L4_3)
            L3_3 = DeleteEntity
            L4_3 = L5_2
            L3_3(L4_3)
            L3_3 = DeleteEntity
            L4_3 = L6_2
            L3_3(L4_3)
          end
          L3_3 = A1_2
          L4_3 = {}
          L4_3.FinalInfo = false
          L3_3(L4_3)
          L3_3 = SetNuiFocus
          L4_3 = true
          L5_3 = true
          L3_3(L4_3, L5_3)
          break
        end
        L3_3 = OriginalMode
        if not L3_3 then
          L3_3 = DisableControlAction
          L4_3 = 0
          L5_3 = 30
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = DisableControlAction
          L4_3 = 0
          L5_3 = 31
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = DisableControlAction
          L4_3 = 0
          L5_3 = 34
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = DisableControlAction
          L4_3 = 0
          L5_3 = 35
          L6_3 = true
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = GetEntityCoords
          L4_3 = L4_2
          L3_3 = L3_3(L4_3)
          L4_3 = L3_3.z
          L4_3 = L4_3 - 1
          L5_3 = PlayerPedId
          L5_3 = L5_3()
          L6_3 = GetEntityCoords
          L7_3 = L5_3
          L6_3 = L6_3(L7_3)
          L7_3 = GetEntityCoords
          L8_3 = L4_2
          L7_3 = L7_3(L8_3)
          L8_3 = vector3
          L9_3 = L7_3.x
          L10_3 = L6_3.x
          L9_3 = L9_3 - L10_3
          L10_3 = L7_3.y
          L11_3 = L6_3.y
          L10_3 = L10_3 - L11_3
          L11_3 = 0
          L8_3 = L8_3(L9_3, L10_3, L11_3)
          L9_3 = math
          L9_3 = L9_3.sqrt
          L10_3 = L8_3.x
          L10_3 = L10_3 ^ 2
          L11_3 = L8_3.y
          L11_3 = L11_3 ^ 2
          L10_3 = L10_3 + L11_3
          L9_3 = L9_3(L10_3)
          L10_3 = vector3
          L11_3 = L8_3.x
          L11_3 = L11_3 / L9_3
          L12_3 = L8_3.y
          L12_3 = L12_3 / L9_3
          L13_3 = 0
          L10_3 = L10_3(L11_3, L12_3, L13_3)
          L11_3 = vector3
          L12_3 = L10_3.y
          L12_3 = -L12_3
          L13_3 = L10_3.x
          L14_3 = 0
          L11_3 = L11_3(L12_3, L13_3, L14_3)
          L12_3 = IsDisabledControlPressed
          L13_3 = 1
          L14_3 = 32
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = L7_3.x
            L13_3 = L10_3.x
            L13_3 = 0.01 * L13_3
            L12_3 = L12_3 + L13_3
            L13_3 = L7_3.y
            L14_3 = L10_3.y
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 + L14_3
            L14_3 = SetEntityCoords
            L15_3 = L4_2
            L16_3 = L12_3
            L17_3 = L13_3
            L18_3 = L4_3
            L14_3(L15_3, L16_3, L17_3, L18_3)
          end
          L12_3 = IsDisabledControlPressed
          L13_3 = 1
          L14_3 = 33
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = L7_3.x
            L13_3 = L10_3.x
            L13_3 = 0.01 * L13_3
            L12_3 = L12_3 - L13_3
            L13_3 = L7_3.y
            L14_3 = L10_3.y
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 - L14_3
            L14_3 = SetEntityCoords
            L15_3 = L4_2
            L16_3 = L12_3
            L17_3 = L13_3
            L18_3 = L4_3
            L14_3(L15_3, L16_3, L17_3, L18_3)
          end
          L12_3 = IsDisabledControlPressed
          L13_3 = 1
          L14_3 = 34
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = L7_3.x
            L13_3 = L11_3.x
            L13_3 = 0.01 * L13_3
            L12_3 = L12_3 + L13_3
            L13_3 = L7_3.y
            L14_3 = L11_3.y
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 + L14_3
            L14_3 = SetEntityCoords
            L15_3 = L4_2
            L16_3 = L12_3
            L17_3 = L13_3
            L18_3 = L4_3
            L14_3(L15_3, L16_3, L17_3, L18_3)
          end
          L12_3 = IsDisabledControlPressed
          L13_3 = 1
          L14_3 = 35
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = L7_3.x
            L13_3 = L11_3.x
            L13_3 = 0.01 * L13_3
            L12_3 = L12_3 - L13_3
            L13_3 = L7_3.y
            L14_3 = L11_3.y
            L14_3 = 0.01 * L14_3
            L13_3 = L13_3 - L14_3
            L14_3 = SetEntityCoords
            L15_3 = L4_2
            L16_3 = L12_3
            L17_3 = L13_3
            L18_3 = L4_3
            L14_3(L15_3, L16_3, L17_3, L18_3)
          end
          L12_3 = IsControlPressed
          L13_3 = 0
          L14_3 = 172
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = SetEntityCoords
            L13_3 = L4_2
            L14_3 = L3_3.x
            L15_3 = L3_3.y
            L16_3 = L4_3 + 0.01
            L12_3(L13_3, L14_3, L15_3, L16_3)
          end
          L12_3 = IsControlPressed
          L13_3 = 0
          L14_3 = 173
          L12_3 = L12_3(L13_3, L14_3)
          if L12_3 then
            L12_3 = SetEntityCoords
            L13_3 = L4_2
            L14_3 = L3_3.x
            L15_3 = L3_3.y
            L16_3 = L4_3 - 0.01
            L12_3(L13_3, L14_3, L15_3, L16_3)
          end
          L12_3 = L7_3.x
          L13_3 = L6_3.x
          L12_3 = L12_3 - L13_3
          L13_3 = L7_3.y
          L14_3 = L6_3.y
          L13_3 = L13_3 - L14_3
          L14_3 = math
          L14_3 = L14_3.deg
          L15_3 = math
          L15_3 = L15_3.atan2
          L16_3 = L13_3
          L17_3 = L12_3
          L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3 = L15_3(L16_3, L17_3)
          L14_3 = L14_3(L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3)
          L15_3 = SetEntityHeading
          L16_3 = L5_3
          L17_3 = L14_3 - 90.0
          L15_3(L16_3, L17_3)
          L15_3 = GetEntityCoords
          L16_3 = L4_2
          L15_3 = L15_3(L16_3)
          L1_3 = L15_3
          L15_3 = L5_2
          if L15_3 then
            L15_3 = L6_2
            if L15_3 then
              L15_3 = vector3
              L16_3 = L8_2
              L16_3 = -L16_3
              L17_3 = L11_3.x
              L16_3 = L16_3 * L17_3
              L17_3 = L8_2
              L17_3 = -L17_3
              L18_3 = L11_3.y
              L17_3 = L17_3 * L18_3
              L18_3 = 0
              L15_3 = L15_3(L16_3, L17_3, L18_3)
              L15_3 = L1_3 + L15_3
              L16_3 = vector3
              L17_3 = L8_2
              L18_3 = L11_3.x
              L17_3 = L17_3 * L18_3
              L18_3 = L8_2
              L19_3 = L11_3.y
              L18_3 = L18_3 * L19_3
              L19_3 = 0
              L16_3 = L16_3(L17_3, L18_3, L19_3)
              L16_3 = L1_3 + L16_3
              L17_3 = SetEntityCoords
              L18_3 = L5_2
              L19_3 = L15_3.x
              L20_3 = L15_3.y
              L20_3 = L20_3 - 1
              L21_3 = L15_3.z
              L21_3 = L21_3 - 1
              L17_3(L18_3, L19_3, L20_3, L21_3)
              L17_3 = SetEntityCoords
              L18_3 = L6_2
              L19_3 = L16_3.x
              L20_3 = L16_3.y
              L20_3 = L20_3 - 1
              L21_3 = L16_3.z
              L21_3 = L21_3 - 1
              L17_3(L18_3, L19_3, L20_3, L21_3)
            end
          end
        end
        L3_3 = IsControlJustPressed
        L4_3 = 1
        L5_3 = 45
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = OriginalMode
          L3_3 = not L3_3
          OriginalMode = L3_3
          L3_3 = setupEndingSceneform
          L4_3 = "instructional_buttons"
          L3_3 = L3_3(L4_3)
          form = L3_3
        end
        L3_3 = L4_2
        if not L3_3 then
          L3_3 = CreatePed
          L4_3 = 2
          L5_3 = L2_2
          L6_3 = L1_3.x
          L7_3 = L1_3.y
          L8_3 = L1_3.z
          L9_3 = L7_2
          L10_3 = false
          L11_3 = true
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
          L4_2 = L3_3
          L3_3 = SetEntityInvincible
          L4_3 = L4_2
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = SetEntityCollision
          L4_3 = L4_2
          L5_3 = false
          L6_3 = false
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = FreezeEntityPosition
          L4_3 = L4_2
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = CreatePed
          L4_3 = 2
          L5_3 = "s_m_m_highsec_01"
          L6_3 = L1_3.x
          L7_3 = L8_2
          L6_3 = L6_3 - L7_3
          L7_3 = L1_3.y
          L8_3 = L1_3.z
          L9_3 = L7_2
          L10_3 = false
          L11_3 = true
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
          L5_2 = L3_3
          L3_3 = CreatePed
          L4_3 = 2
          L5_3 = "s_m_m_highsec_01"
          L6_3 = L1_3.x
          L7_3 = L8_2
          L6_3 = L6_3 + L7_3
          L7_3 = L1_3.y
          L8_3 = L1_3.z
          L9_3 = L7_2
          L10_3 = false
          L11_3 = true
          L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
          L6_2 = L3_3
          L3_3 = SetEntityInvincible
          L4_3 = L5_2
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = SetEntityCollision
          L4_3 = L5_2
          L5_3 = false
          L6_3 = false
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = FreezeEntityPosition
          L4_3 = L5_2
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = SetEntityInvincible
          L4_3 = L6_2
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = SetEntityCollision
          L4_3 = L6_2
          L5_3 = false
          L6_3 = false
          L3_3(L4_3, L5_3, L6_3)
          L3_3 = FreezeEntityPosition
          L4_3 = L6_2
          L5_3 = true
          L3_3(L4_3, L5_3)
        else
          L3_3 = OriginalMode
          if L3_3 then
            L3_3 = SetEntityCoords
            L4_3 = L4_2
            L5_3 = L1_3.x
            L6_3 = L1_3.y
            L7_3 = L1_3.z
            L3_3(L4_3, L5_3, L6_3, L7_3)
            L3_3 = SetEntityCoords
            L4_3 = L5_2
            L5_3 = L1_3.x
            L6_3 = L8_2
            L5_3 = L5_3 - L6_3
            L6_3 = L1_3.y
            L6_3 = L6_3 - 1
            L7_3 = L1_3.z
            L3_3(L4_3, L5_3, L6_3, L7_3)
            L3_3 = SetEntityCoords
            L4_3 = L6_2
            L5_3 = L1_3.x
            L6_3 = L8_2
            L5_3 = L5_3 + L6_3
            L6_3 = L1_3.y
            L6_3 = L6_3 - 1
            L7_3 = L1_3.z
            L3_3(L4_3, L5_3, L6_3, L7_3)
          end
          L3_3 = SetEntityHeading
          L4_3 = L4_2
          L5_3 = L7_2
          L3_3(L4_3, L5_3)
          L3_3 = SetEntityHeading
          L4_3 = L5_2
          L5_3 = L7_2
          L3_3(L4_3, L5_3)
          L3_3 = SetEntityHeading
          L4_3 = L6_2
          L5_3 = L7_2
          L3_3(L4_3, L5_3)
        end
        L3_3 = IsControlPressed
        L4_3 = 0
        L5_3 = 174
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = L7_2
          L3_3 = L3_3 + 1.0
          L7_2 = L3_3
          L3_3 = L7_2
          L4_3 = 360
          if L3_3 > L4_3 then
            L3_3 = 0.0
            L7_2 = L3_3
          end
        else
          L3_3 = IsControlPressed
          L4_3 = 0
          L5_3 = 175
          L3_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            L3_3 = L7_2
            L3_3 = L3_3 - 1.0
            L7_2 = L3_3
            L3_3 = L7_2
            if L3_3 < 0 then
              L3_3 = 360.0
              L7_2 = L3_3
            end
          end
        end
        L3_3 = IsControlJustPressed
        L4_3 = 0
        L5_3 = 38
        L3_3 = L3_3(L4_3, L5_3)
        if L3_3 then
          L3_3 = {}
          L4_3 = L1_3.x
          L5_3 = L1_3.y
          L6_3 = L1_3.z
          L3_3[1] = L4_3
          L3_3[2] = L5_3
          L3_3[3] = L6_3
          L3_2.vector = L3_3
          L3_3 = L7_2
          L3_2.heading = L3_3
          L3_3 = SetNuiFocus
          L4_3 = true
          L5_3 = true
          L3_3(L4_3, L5_3)
          L3_3 = A1_2
          L4_3 = {}
          L5_3 = L3_2
          L4_3.FinalInfo = L5_3
          L3_3(L4_3)
          break
        end
      end
      L3_3 = Wait
      L4_3 = 1
      L3_3(L4_3)
    end
    L0_3 = L4_2
    if L0_3 then
      L0_3 = DeleteEntity
      L1_3 = L4_2
      L0_3(L1_3)
      L0_3 = DeleteEntity
      L1_3 = L5_2
      L0_3(L1_3)
      L0_3 = DeleteEntity
      L1_3 = L6_2
      L0_3(L1_3)
    end
    L0_3 = HideRobberyCreatorPrompt
    L0_3()
    L0_3 = TabletEmote
    L0_3()
  end
  L9_2(L10_2)
end
L106_1(L107_1, L108_1)
L106_1 = RegisterNUICallback
L107_1 = "TeleportToPosition"
function L108_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = tonumber
  L3_2 = A0_2.x
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A0_2.y
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = A0_2.z
  L4_2 = L4_2(L5_2)
  L5_2 = PlayerPedId
  L5_2 = L5_2()
  if L2_2 and L3_2 and L4_2 then
    L6_2 = SetEntityCoords
    L7_2 = L5_2
    L8_2 = L2_2
    L9_2 = L3_2
    L10_2 = L4_2
    L11_2 = false
    L12_2 = false
    L13_2 = false
    L14_2 = false
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    L6_2 = tonumber
    L7_2 = A0_2.heading
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L7_2 = SetEntityHeading
      L8_2 = L5_2
      L9_2 = L6_2 + 0.0
      L7_2(L8_2, L9_2)
    end
  end
  L6_2 = A1_2
  L7_2 = "ok"
  L6_2(L7_2)
end
L106_1(L107_1, L108_1)
function L106_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L4_2 = World3dToScreen2d
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2, L7_2)
  L7_2 = table
  L7_2 = L7_2.unpack
  L8_2 = GetGameplayCamCoords
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L8_2()
  L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L10_2 = vector3
  L11_2 = L7_2
  L12_2 = L8_2
  L13_2 = L9_2
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = vector3
  L12_2 = A0_2
  L13_2 = A1_2
  L14_2 = A2_2
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  L10_2 = L10_2 - L11_2
  L10_2 = #L10_2
  L11_2 = 1
  L11_2 = L11_2 / L10_2
  L11_2 = L11_2 * 2
  L12_2 = 0.3
  if L11_2 > L12_2 then
    L11_2 = 0.3
  else
    L12_2 = 0.3
    if L11_2 < L12_2 then
      L11_2 = 0.3
    end
  end
  L12_2 = SetTextScale
  L13_2 = L11_2
  L14_2 = L11_2
  L12_2(L13_2, L14_2)
  L12_2 = SetTextFont
  L13_2 = 1
  L12_2(L13_2)
  L12_2 = SetTextProportional
  L13_2 = 1
  L12_2(L13_2)
  L12_2 = SetTextColour
  L13_2 = 0
  L14_2 = 0
  L15_2 = 0
  L16_2 = 215
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = SetTextEntry
  L13_2 = "STRING"
  L12_2(L13_2)
  L12_2 = SetTextCentre
  L13_2 = 1
  L12_2(L13_2)
  L12_2 = AddTextComponentString
  L13_2 = A3_2
  L12_2(L13_2)
  L12_2 = DrawText
  L13_2 = L5_2
  L14_2 = L6_2
  L12_2(L13_2, L14_2)
end
DrawText3D = L106_1
function L106_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L6_2 = StartShapeTestRay
  L7_2 = A0_2
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = A3_2
  L11_2 = A4_2
  L12_2 = A5_2
  L13_2 = -1
  L14_2 = PlayerPedId
  L14_2 = L14_2()
  L15_2 = 0
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L7_2 = GetShapeTestResult
  L8_2 = L6_2
  L7_2, L8_2, L9_2, L10_2, L11_2 = L7_2(L8_2)
  L12_2 = 0 == L8_2
  return L12_2
end
IsLineOfSightClear = L106_1
function L106_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L3_2 = GetModelDimensions
  L4_2 = A0_2
  L3_2, L4_2 = L3_2(L4_2)
  L5_2 = L3_2.z
  L6_2 = L4_2.z
  L5_2 = L5_2 + L6_2
  L5_2 = L5_2 * 0.5
  L6_2 = L4_2.y
  L7_2 = L6_2 + 0.001
  L8_2 = L6_2 + 0.003
  L9_2 = math
  L9_2 = L9_2.rad
  L10_2 = A2_2 + 0.0
  L9_2 = L9_2(L10_2)
  L10_2 = vector3
  L11_2 = math
  L11_2 = L11_2.sin
  L12_2 = L9_2
  L11_2 = L11_2(L12_2)
  L11_2 = -L11_2
  L12_2 = math
  L12_2 = L12_2.cos
  L13_2 = L9_2
  L12_2 = L12_2(L13_2)
  L13_2 = 0.0
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = vector3
  L12_2 = math
  L12_2 = L12_2.cos
  L13_2 = L9_2
  L12_2 = L12_2(L13_2)
  L13_2 = math
  L13_2 = L13_2.sin
  L14_2 = L9_2
  L13_2 = L13_2(L14_2)
  L14_2 = 0.0
  L11_2 = L11_2(L12_2, L13_2, L14_2)
  function L12_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3
    L3_3 = vector3
    L4_3 = A1_2.x
    L5_3 = L11_2.x
    L5_3 = L5_3 * A0_3
    L4_3 = L4_3 + L5_3
    L5_3 = L10_2.x
    L5_3 = L5_3 * A1_3
    L4_3 = L4_3 + L5_3
    L5_3 = A1_2.y
    L6_3 = L11_2.y
    L6_3 = L6_3 * A0_3
    L5_3 = L5_3 + L6_3
    L6_3 = L10_2.y
    L6_3 = L6_3 * A1_3
    L5_3 = L5_3 + L6_3
    L6_3 = A1_2.z
    L6_3 = L6_3 + A2_3
    return L3_3(L4_3, L5_3, L6_3)
  end
  L13_2 = L12_2
  L14_2 = 0.0
  L15_2 = L7_2
  L16_2 = L5_2
  L13_2 = L13_2(L14_2, L15_2, L16_2)
  L14_2 = L12_2
  L15_2 = 0.0
  L16_2 = L8_2
  L17_2 = L5_2
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  L15_2 = L13_2
  L16_2 = L14_2
  return L15_2, L16_2
end
function L107_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2
  L0_2 = GetEntityCoords
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
  L1_2 = false
  L2_2 = GetHashKey
  L3_2 = "xs_prop_arena_stickynote_01a"
  L2_2 = L2_2(L3_2)
  L3_2 = pairs
  L4_2 = L17_1
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = pairs
    L10_2 = L16_1
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = string
      L15_2 = L15_2.find
      L16_2 = L13_2
      L17_2 = L7_2
      L15_2 = L15_2(L16_2, L17_2)
      if L15_2 then
        L15_2 = vector3
        L16_2 = L14_2.position
        L16_2 = L16_2.x
        L17_2 = L14_2.position
        L17_2 = L17_2.y
        L18_2 = L14_2.position
        L18_2 = L18_2.z
        L15_2 = L15_2(L16_2, L17_2, L18_2)
        L16_2 = L0_2 - L15_2
        L16_2 = #L16_2
        if L16_2 < 7.0 then
          L1_2 = true
          L17_2 = GetGameplayCamCoords
          L17_2 = L17_2()
          L18_2 = L106_1
          L19_2 = L2_2
          L20_2 = L15_2
          L21_2 = L14_2.heading
          L18_2, L19_2 = L18_2(L19_2, L20_2, L21_2)
          L20_2 = IsLineOfSightClear
          L21_2 = L17_2.x
          L22_2 = L17_2.y
          L23_2 = L17_2.z
          L24_2 = L19_2.x
          L25_2 = L19_2.y
          L26_2 = L19_2.z
          L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
          if L20_2 then
            L20_2 = DrawText3D
            L21_2 = L18_2.x
            L22_2 = L18_2.y
            L23_2 = L18_2.z
            L24_2 = tostring
            L25_2 = L8_2
            L24_2, L25_2, L26_2 = L24_2(L25_2)
            L20_2(L21_2, L22_2, L23_2, L24_2, L25_2, L26_2)
          end
        end
      end
    end
  end
  return L1_2
end
L108_1 = CreateThread
function L109_1()
  local L0_2, L1_2, L2_2
  while true do
    L0_2 = L107_1
    L0_2 = L0_2()
    if L0_2 then
      L1_2 = Wait
      L2_2 = 0
      L1_2(L2_2)
    else
      L1_2 = Wait
      L2_2 = 1000
      L1_2(L2_2)
    end
  end
end
L108_1(L109_1)
L108_1 = "none"
L109_1 = RegisterNetEvent
L110_1 = "Pug:client:showNumberPad"
function L111_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = true
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.type = "openNumberPad"
  L0_2(L1_2)
end
L109_1(L110_1, L111_1)
L109_1 = RegisterNUICallback
L110_1 = "numberPadResult"
function L111_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A0_2.input
  L108_1 = L2_2
  L3_2 = SetNuiFocus
  L4_2 = false
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = A1_2
  L4_2 = "ok"
  L3_2(L4_2)
end
L109_1(L110_1, L111_1)
L109_1 = RegisterNUICallback
L110_1 = "playKeypadSound"
function L111_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = PlaySoundFrontend
  L3_2 = -1
  L4_2 = "PIN_Good"
  L5_2 = "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"
  L6_2 = true
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = A1_2
  L3_2 = "ok"
  L2_2(L3_2)
end
L109_1(L110_1, L111_1)
function L109_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2
  L2_2 = tonumber
  L3_2 = A0_2.stepNumber
  L2_2 = L2_2(L3_2)
  L3_2 = nil
  L4_2 = nil
  L5_2 = math
  L5_2 = L5_2.huge
  L6_2 = pairs
  L7_2 = json
  L7_2 = L7_2.decode
  L8_2 = A1_2.stages
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2 = L7_2(L8_2)
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = tonumber
    L13_2 = L11_2.stepNumber
    L12_2 = L12_2(L13_2)
    L13_2 = L2_2 - 3
    if L12_2 >= L13_2 then
      L13_2 = L2_2 + 3
      if L12_2 <= L13_2 then
        L13_2 = L11_2.passcodes
        if L13_2 then
          L13_2 = math
          L13_2 = L13_2.abs
          L14_2 = L12_2 - L2_2
          L13_2 = L13_2(L14_2)
          if L5_2 > L13_2 then
            L5_2 = L13_2
            L3_2 = L12_2
            L14_2 = A1_2.heist_name
            L15_2 = L12_2
            L14_2 = L14_2 .. L15_2
            L15_2 = L18_1
            L14_2 = L15_2[L14_2]
            L15_2 = ipairs
            L16_2 = L11_2.passcodes
            L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
            for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
              if L19_2 == L14_2 then
                L21_2 = {}
                L22_2 = L20_2.position
                L22_2 = L22_2[1]
                L21_2.x = L22_2
                L22_2 = L20_2.position
                L22_2 = L22_2[2]
                L21_2.y = L22_2
                L22_2 = L20_2.position
                L22_2 = L22_2[3]
                L21_2.z = L22_2
                L22_2 = vector3
                L23_2 = L21_2.x
                L24_2 = L21_2.y
                L25_2 = L21_2.z
                L22_2 = L22_2(L23_2, L24_2, L25_2)
                L4_2 = L22_2
                L22_2 = json
                L22_2 = L22_2.decode
                L23_2 = A1_2.settings
                L22_2 = L22_2(L23_2)
                L23_2 = TriggerServerEvent
                L24_2 = "Pug:server:SetStepOnCoolDown"
                L25_2 = A1_2.heist_name
                L26_2 = tonumber
                L27_2 = L12_2
                L26_2 = L26_2(L27_2)
                L27_2 = L22_2.robberyCooldown
                L23_2(L24_2, L25_2, L26_2, L27_2)
              end
            end
          end
        end
      end
    end
  end
  if not L4_2 then
    L6_2 = Notify
    L7_2 = Config
    L7_2 = L7_2.LangT
    L7_2 = L7_2.NoPasscodesFound
    L8_2 = "error"
    L6_2(L7_2, L8_2)
  end
  return L4_2
end
function L110_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = type
  L2_2 = A0_2.stages
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.stages
    return L1_2
  end
  L1_2 = type
  L2_2 = A0_2.stages
  L1_2 = L1_2(L2_2)
  if "string" == L1_2 then
    L1_2 = A0_2.stages
    if "" ~= L1_2 then
      L1_2 = pcall
      L2_2 = json
      L2_2 = L2_2.decode
      L3_2 = A0_2.stages
      L1_2, L2_2 = L1_2(L2_2, L3_2)
      if L1_2 then
        L3_2 = type
        L4_2 = L2_2
        L3_2 = L3_2(L4_2)
        if "table" == L3_2 then
          return L2_2
        end
      end
    end
  end
  L1_2 = nil
  return L1_2
end
function L111_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A0_2 then
    L1_2 = nil
    return L1_2
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "vector3" == L1_2 then
    return A0_2
  end
  if "table" == L1_2 then
    L2_2 = tonumber
    L3_2 = A0_2.x
    if not L3_2 then
      L3_2 = A0_2[1]
    end
    L2_2 = L2_2(L3_2)
    L3_2 = tonumber
    L4_2 = A0_2.y
    if not L4_2 then
      L4_2 = A0_2[2]
    end
    L3_2 = L3_2(L4_2)
    L4_2 = tonumber
    L5_2 = A0_2.z
    if not L5_2 then
      L5_2 = A0_2[3]
    end
    L4_2 = L4_2(L5_2)
    if L2_2 and L3_2 and L4_2 then
      L5_2 = vector3
      L6_2 = L2_2
      L7_2 = L3_2
      L8_2 = L4_2
      return L5_2(L6_2, L7_2, L8_2)
    end
    L5_2 = nil
    return L5_2
  end
  if "string" == L1_2 then
    L3_2 = A0_2
    L2_2 = A0_2.match
    L4_2 = "([%-%d%.]+),%s*([%-%d%.]+),%s*([%-%d%.]+)"
    L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
    if L2_2 and L3_2 and L4_2 then
      L5_2 = vector3
      L6_2 = tonumber
      L7_2 = L2_2
      L6_2 = L6_2(L7_2)
      L7_2 = tonumber
      L8_2 = L3_2
      L7_2 = L7_2(L8_2)
      L8_2 = tonumber
      L9_2 = L4_2
      L8_2, L9_2 = L8_2(L9_2)
      return L5_2(L6_2, L7_2, L8_2, L9_2)
    end
  end
  L2_2 = nil
  return L2_2
end
function L112_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L111_1
  L3_2 = A0_2.targetVector
  L2_2 = L2_2(L3_2)
  if L2_2 then
    return L2_2
  end
  L3_2 = L111_1
  L4_2 = A0_2.doorPosition
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  if L2_2 then
    return L2_2
  end
  L3_2 = L111_1
  L4_2 = A0_2.endingTargetVector
  L3_2 = L3_2(L4_2)
  L2_2 = L3_2
  if L2_2 then
    return L2_2
  end
  L3_2 = A0_2.passcodes
  if L3_2 then
    L3_2 = type
    L4_2 = A0_2.passcodes
    L3_2 = L3_2(L4_2)
    if "table" == L3_2 then
      L3_2 = tostring
      L4_2 = A1_2.heist_name
      L3_2 = L3_2(L4_2)
      L4_2 = tostring
      L5_2 = A0_2.stepNumber
      L4_2 = L4_2(L5_2)
      L3_2 = L3_2 .. L4_2
      L4_2 = L18_1
      L3_2 = L4_2[L3_2]
      if not L3_2 then
        L3_2 = 1
      end
      L4_2 = A0_2.passcodes
      L4_2 = L4_2[L3_2]
      if not L4_2 then
        L4_2 = A0_2.passcodes
        L4_2 = L4_2[1]
      end
      if L4_2 then
        L5_2 = L4_2.position
        if L5_2 then
          L5_2 = L111_1
          L6_2 = L4_2.position
          L5_2 = L5_2(L6_2)
          L2_2 = L5_2
          if L2_2 then
            return L2_2
          end
        end
      end
    end
  end
  L3_2 = A0_2.guards
  if L3_2 then
    L3_2 = type
    L4_2 = A0_2.guards
    L3_2 = L3_2(L4_2)
    if "table" == L3_2 then
      L3_2 = pairs
      L4_2 = A0_2.guards
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L9_2 = L111_1
        L10_2 = L8_2.guardPosition
        if not L10_2 then
          L10_2 = L8_2.position
        end
        L9_2 = L9_2(L10_2)
        L2_2 = L9_2
        if L2_2 then
          return L2_2
        end
      end
    end
  end
  L3_2 = A0_2.lasers
  if L3_2 then
    L3_2 = type
    L4_2 = A0_2.lasers
    L3_2 = L3_2(L4_2)
    if "table" == L3_2 then
      L3_2 = pairs
      L4_2 = A0_2.lasers
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
        L9_2 = L111_1
        L10_2 = L8_2.startVector
        if not L10_2 then
          L10_2 = L8_2.startCoords
          if not L10_2 then
            L10_2 = L8_2.position
          end
        end
        L9_2 = L9_2(L10_2)
        L2_2 = L9_2
        if L2_2 then
          return L2_2
        end
        L9_2 = L111_1
        L10_2 = L8_2.endVector
        if not L10_2 then
          L10_2 = L8_2.endCoords
        end
        L9_2 = L9_2(L10_2)
        L2_2 = L9_2
        if L2_2 then
          return L2_2
        end
      end
    end
  end
  L3_2 = nil
  return L3_2
end
function L113_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if A0_2 then
    L2_2 = A0_2.sendWaypointToStep
    if L2_2 then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L2_2 = tonumber
  L3_2 = A0_2.waypointStepNumber
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = L110_1
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = type
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if "table" ~= L4_2 then
    return
  end
  L4_2 = pairs
  L5_2 = L3_2
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = tonumber
    L11_2 = L9_2.stepNumber
    L10_2 = L10_2(L11_2)
    if L10_2 == L2_2 then
      L10_2 = L112_1
      L11_2 = L9_2
      L12_2 = A1_2
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 then
        L11_2 = SetNewWaypoint
        L12_2 = L10_2.x
        L12_2 = L12_2 + 0.0
        L13_2 = L10_2.y
        L13_2 = L13_2 + 0.0
        L11_2(L12_2, L13_2)
        L11_2 = Notify
        L12_2 = Config
        L12_2 = L12_2.T
        L13_2 = "WaypointSetToStep"
        L14_2 = tostring
        L15_2 = L2_2
        L14_2, L15_2 = L14_2(L15_2)
        L12_2 = L12_2(L13_2, L14_2, L15_2)
        L13_2 = "success"
        L11_2(L12_2, L13_2)
      else
        L11_2 = Notify
        L12_2 = Config
        L12_2 = L12_2.T
        L13_2 = "WaypointCoordsMissing"
        L14_2 = tostring
        L15_2 = L2_2
        L14_2, L15_2 = L14_2(L15_2)
        L12_2 = L12_2(L13_2, L14_2, L15_2)
        L13_2 = "error"
        L11_2(L12_2, L13_2)
      end
      return
    end
  end
  L4_2 = Notify
  L5_2 = Config
  L5_2 = L5_2.T
  L6_2 = "WaypointDestinationMissing"
  L7_2 = tostring
  L8_2 = L2_2
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L7_2(L8_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L6_2 = "error"
  L4_2(L5_2, L6_2)
end
function L114_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = GetClosestObjectOfType
  L3_2 = A0_2.targetVector
  L3_2 = L3_2.x
  L4_2 = A0_2.targetVector
  L4_2 = L4_2.y
  L5_2 = A0_2.targetVector
  L5_2 = L5_2.z
  L6_2 = 1.0
  L7_2 = GetHashKey
  L8_2 = A0_2.propName
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L7_2(L8_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L3_2 = 1000
  L4_2 = "DEFAULT_SCRIPTED_CAMERA"
  L5_2 = nil
  if 0 ~= L2_2 then
    L6_2 = GetEntityModel
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    L7_2 = GetHashKey
    L8_2 = "prop_ld_keypad_01b"
    L7_2 = L7_2(L8_2)
    if L6_2 ~= L7_2 then
      L6_2 = Notify
      L7_2 = Config
      L7_2 = L7_2.LangT
      L7_2 = L7_2.NumberpadMinigamePropError
      L8_2 = "error"
      L6_2(L7_2, L8_2)
      L6_2 = false
      return L6_2
    end
    L6_2 = CreateCam
    L7_2 = L4_2
    L8_2 = 1
    L6_2 = L6_2(L7_2, L8_2)
    L5_2 = L6_2
    L6_2 = GetEntityForwardVector
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    L7_2 = table
    L7_2 = L7_2.unpack
    L8_2 = vector3
    L9_2 = A0_2.targetVector
    L9_2 = L9_2.x
    L10_2 = A0_2.targetVector
    L10_2 = L10_2.y
    L11_2 = A0_2.targetVector
    L11_2 = L11_2.z
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L9_2 = L6_2 * -0.21
    L8_2 = L8_2 + L9_2
    L7_2, L8_2, L9_2 = L7_2(L8_2)
    L10_2 = SetCamCoord
    L11_2 = L5_2
    L12_2 = vector3
    L13_2 = L7_2
    L14_2 = L8_2
    L15_2 = L9_2 + 0.02
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L12_2(L13_2, L14_2, L15_2)
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L10_2 = PointCamAtEntity
    L11_2 = L5_2
    L12_2 = L2_2
    L10_2(L11_2, L12_2)
    if L3_2 then
      L10_2 = RenderScriptCams
      L11_2 = true
      L12_2 = 1
      L13_2 = L3_2
      L14_2 = 300
      L15_2 = 0
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    end
  end
  L6_2 = SetNuiFocus
  L7_2 = true
  L8_2 = true
  L6_2(L7_2, L8_2)
  L6_2 = SendNUIMessage
  L7_2 = {}
  L7_2.type = "openNumberPad"
  L6_2(L7_2)
  L6_2 = Wait
  L7_2 = 800
  L6_2(L7_2)
  L6_2 = PlaySoundFrontend
  L7_2 = -1
  L8_2 = "Fail"
  L9_2 = "dlc_xm_silo_laser_hack_sounds"
  L10_2 = true
  L6_2(L7_2, L8_2, L9_2, L10_2)
  while true do
    L6_2 = L108_1
    if "none" ~= L6_2 then
      break
    end
    L6_2 = IsNuiFocused
    L6_2 = L6_2()
    if not L6_2 then
      break
    end
    L6_2 = Wait
    L7_2 = 500
    L6_2(L7_2)
  end
  L6_2 = RenderScriptCams
  L7_2 = 0
  L8_2 = 0
  L9_2 = 1
  L10_2 = 1
  L11_2 = 1
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  if L5_2 then
    L6_2 = DestroyCam
    L7_2 = L5_2
    L8_2 = 0
    L6_2(L7_2, L8_2)
  end
  L6_2 = L108_1
  if "none" == L6_2 then
    L7_2 = SendNUIMessage
    L8_2 = {}
    L8_2.type = "closeNumberPad"
    L7_2(L8_2)
    L6_2 = false
  end
  L7_2 = "none"
  L108_1 = L7_2
  L8_2 = A1_2.heist_name
  L7_2 = L17_1
  L7_2 = L7_2[L8_2]
  if L7_2 then
    L8_2 = A1_2.heist_name
    L7_2 = L17_1
    L7_2 = L7_2[L8_2]
    L8_2 = tostring
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    L9_2 = tostring
    L10_2 = L7_2
    L9_2 = L9_2(L10_2)
    if L8_2 == L9_2 then
      L8_2 = PlaySoundFrontend
      L9_2 = -1
      L10_2 = "Pass"
      L11_2 = "dlc_xm_silo_laser_hack_sounds"
      L12_2 = true
      L8_2(L9_2, L10_2, L11_2, L12_2)
      L8_2 = Notify
      L9_2 = Config
      L9_2 = L9_2.LangT
      L9_2 = L9_2.PasscodeAccepted
      L10_2 = "success"
      L8_2(L9_2, L10_2)
      L8_2 = GetHashKey
      L9_2 = "prop_ld_wallet_pickup"
      L8_2 = L8_2(L9_2)
      L9_2 = pairs
      L10_2 = GetGamePool
      L11_2 = "CObject"
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L10_2(L11_2)
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
        L15_2 = GetEntityModel
        L16_2 = L14_2
        L15_2 = L15_2(L16_2)
        if L15_2 == L8_2 then
          L15_2 = TriggerEvent
          L16_2 = "FullyDeleteRobberiesEntity"
          L17_2 = L14_2
          L15_2(L16_2, L17_2)
        end
      end
      L9_2 = TriggerServerEvent
      L10_2 = "Pug:server:ChangeRobberyPasscode"
      L11_2 = A1_2.heist_name
      L12_2 = A0_2
      L9_2(L10_2, L11_2, L12_2)
      L9_2 = L109_1
      L10_2 = A0_2
      L11_2 = A1_2
      L9_2 = L9_2(L10_2, L11_2)
      if L9_2 then
        L10_2 = TriggerServerEvent
        L11_2 = "Pug:server:DeleteRobberiesEntity"
        L12_2 = L9_2
        L13_2 = GetHashKey
        L14_2 = "xs_prop_arena_stickynote_01a"
        L13_2 = L13_2(L14_2)
        L14_2 = A1_2.heist_name
        L10_2(L11_2, L12_2, L13_2, L14_2)
      end
      L10_2 = true
      return L10_2
    end
    L8_2 = PlaySoundFrontend
    L9_2 = -1
    L10_2 = "Hack_Failed"
    L11_2 = "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"
    L12_2 = true
    L8_2(L9_2, L10_2, L11_2, L12_2)
    L8_2 = Notify
    L9_2 = Config
    L9_2 = L9_2.LangT
    L9_2 = L9_2.IncorrectPasscode
    L10_2 = "error"
    L8_2(L9_2, L10_2)
    L8_2 = false
    return L8_2
  else
    L7_2 = Notify
    L8_2 = Config
    L8_2 = L8_2.LangT
    L8_2 = L8_2.NoPasscodesForHeist
    L9_2 = "error"
    L7_2(L8_2, L9_2)
    L7_2 = false
    return L7_2
  end
end
DoNumberPadMiniGame = L114_1
L114_1 = RegisterNetEvent
L115_1 = "Pug:client:ChangeRobberyPasscode"
function L116_1(A0_2, A1_2, A2_2)
  local L3_2
  L3_2 = L17_1
  L3_2[A0_2] = A1_2
end
L114_1(L115_1, L116_1)
L114_1 = CreateThread
function L115_1()
  local L0_2, L1_2
end
L114_1(L115_1)
L114_1 = RegisterNetEvent
L115_1 = "heist:showHeistUI"
function L116_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2)
  local L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L9_2 = TabletEmote
  L9_2()
  L9_2 = nil
  L10_2 = PrintDebug
  L11_2 = Config
  L11_2 = L11_2.InventoryType
  L12_2 = "Your inventory is Config.InventoryType"
  L10_2(L11_2, L12_2)
  L10_2 = Config
  L10_2 = L10_2.InventoryType
  if "ox_inventory" == L10_2 then
    L10_2 = exports
    L10_2 = L10_2.ox_inventory
    L11_2 = L10_2
    L10_2 = L10_2.Items
    L10_2 = L10_2(L11_2)
    L9_2 = L10_2
  else
    L10_2 = Framework
    if "ESX" == L10_2 then
      L10_2 = Config
      L10_2 = L10_2.InventoryType
      if "origen_inventory" == L10_2 then
        L10_2 = exports
        L10_2 = L10_2.origen_inventory
        L11_2 = L10_2
        L10_2 = L10_2.GetItems
        L10_2 = L10_2(L11_2)
        L9_2 = L10_2
    end
    else
      L10_2 = Framework
      if "ESX" == L10_2 then
        L10_2 = Config
        L10_2 = L10_2.InventoryType
        if "qs-inventory" == L10_2 then
          L10_2 = exports
          L10_2 = L10_2["qs-inventory"]
          L11_2 = L10_2
          L10_2 = L10_2.GetItemList
          L10_2 = L10_2(L11_2)
          L9_2 = L10_2
      end
      else
        L10_2 = Framework
        if "ESX" == L10_2 then
          L10_2 = Config
          L10_2 = L10_2.InventoryType
          if "codem-inventory" == L10_2 then
            L10_2 = exports
            L10_2 = L10_2["codem-inventory"]
            L11_2 = L10_2
            L10_2 = L10_2.GetItemList
            L10_2 = L10_2(L11_2)
            L9_2 = L10_2
        end
        else
          L10_2 = Framework
          if "ESX" == L10_2 then
            L10_2 = Config
            L10_2 = L10_2.InventoryType
            if "tgiann-inventory" == L10_2 then
              L10_2 = exports
              L10_2 = L10_2["tgiann-inventory"]
              L11_2 = L10_2
              L10_2 = L10_2.GetItemList
              L10_2 = L10_2(L11_2)
              L9_2 = L10_2
          end
          else
            L10_2 = Config
            L10_2 = L10_2.PullItemsFromOXInventory
            if L10_2 then
              L10_2 = exports
              L10_2 = L10_2.ox_inventory
              L11_2 = L10_2
              L10_2 = L10_2.Items
              L10_2 = L10_2(L11_2)
              L9_2 = L10_2
            else
              L10_2 = Config
              L10_2 = L10_2.FrameworkFunctions
              L10_2 = L10_2.TriggerCallback
              L11_2 = "Pug:server:GetUpdatedCoreDataRobberyCreator"
              function L12_2(A0_3)
                local L1_3, L2_3
                L1_3 = GetResourceState
                L2_3 = "core_inventory"
                L1_3 = L1_3(L2_3)
                if "started" == L1_3 then
                  L9_2 = A0_3
                else
                  L1_3 = A0_3.Shared
                  L1_3 = L1_3.Items
                  L9_2 = L1_3
                end
              end
              L10_2(L11_2, L12_2)
            end
          end
        end
      end
    end
  end
  while not L9_2 do
    L10_2 = Wait
    L11_2 = 1
    L10_2(L11_2)
  end
  L10_2 = type
  L11_2 = L9_2
  L10_2 = L10_2(L11_2)
  if "table" ~= L10_2 then
    L10_2 = print
    L11_2 = "^1ERROR: SharedItem is not a table, got type: "
    L12_2 = type
    L13_2 = L9_2
    L12_2 = L12_2(L13_2)
    L11_2 = L11_2 .. L12_2
    L10_2(L11_2)
    return
  end
  L10_2 = nil
  L11_2 = pairs
  L12_2 = L9_2
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = type
    L18_2 = L16_2
    L17_2 = L17_2(L18_2)
    if "table" ~= L17_2 then
      L17_2 = print
      L18_2 = "^1ERROR: SharedItem["
      L19_2 = tostring
      L20_2 = L15_2
      L19_2 = L19_2(L20_2)
      L20_2 = "] is not a table, it's a "
      L21_2 = type
      L22_2 = L16_2
      L21_2 = L21_2(L22_2)
      L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2
      L17_2(L18_2)
      L10_2 = true
    else
      L17_2 = L16_2.name
      if L17_2 then
        L17_2 = type
        L18_2 = L16_2.name
        L17_2 = L17_2(L18_2)
        if "number" == L17_2 then
          L17_2 = Notify
          L18_2 = Config
          L18_2 = L18_2.T
          L19_2 = "ItemReadAsNumber"
          L20_2 = L15_2
          L21_2 = L16_2.name
          L18_2 = L18_2(L19_2, L20_2, L21_2)
          L19_2 = "error"
          L17_2(L18_2, L19_2)
          L17_2 = print
          L18_2 = "^2Item "
          L19_2 = L15_2
          L20_2 = " or "
          L21_2 = L16_2.name
          L22_2 = " Is read as a number where your items are stored and you need to fix them."
          L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2 .. L22_2
          L17_2(L18_2)
          L10_2 = true
        end
      end
      L17_2 = L16_2.label
      if L17_2 then
        L17_2 = L16_2.name
        if L17_2 then
          goto lbl_181
        end
        L17_2 = GetResourceState
        L18_2 = "ak47_inventory"
        L17_2 = L17_2(L18_2)
        if "started" == L17_2 then
          goto lbl_181
        end
      end
      L17_2 = Notify
      L18_2 = Config
      L18_2 = L18_2.T
      L19_2 = "ItemMissingLabel"
      L20_2 = L15_2
      L18_2 = L18_2(L19_2, L20_2)
      L19_2 = "error"
      L17_2(L18_2, L19_2)
      L17_2 = print
      L18_2 = "^2Item "
      L19_2 = L15_2
      L20_2 = " Is missing the 'label' variable where your items are stored and you need to fix it."
      L18_2 = L18_2 .. L19_2 .. L20_2
      L17_2(L18_2)
      L10_2 = true
    end
    ::lbl_181::
  end
  if L10_2 then
    return
  end
  L11_2 = SetNuiFocus
  L12_2 = true
  L13_2 = true
  L11_2(L12_2, L13_2)
  L11_2 = Config
  L11_2 = L11_2.DoorLock
  if not L11_2 then
    L11_2 = PrintDebug
    L12_2 = "^2 YOU NEED TO HAVE A Config.CompatibleDoorLockScripts TO USE THIS SCRIPT"
    L11_2(L12_2)
  end
  L5_1 = A0_2
  L11_2 = SendNUIMessage
  L12_2 = {}
  L12_2.type = "showHeistUI"
  L12_2.heistData = A0_2
  L12_2.AllItems = L9_2
  L12_2.TruckData = A1_2
  L12_2.ItemsData = A2_2
  L12_2.AtmRobberyData = A3_2
  L12_2.PettyCrimeData = A4_2
  L12_2.HouseRobberyData = A5_2
  L12_2.RobberyIntelData = A6_2
  L13_2 = A7_2 or L13_2
  if not A7_2 then
    L13_2 = {}
  end
  L12_2.HeistStatistics = L13_2
  L13_2 = A8_2 or L13_2
  if not A8_2 then
    L13_2 = {}
    L14_2 = {}
    L13_2.entries = L14_2
  end
  L12_2.RobberyLogsData = L13_2
  L11_2(L12_2)
end
L114_1(L115_1, L116_1)
L114_1 = RegisterNetEvent
L115_1 = "FullyDeleteRobberiesEntity"
function L116_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2
  L2_2 = NetworkRequestControlOfEntity
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = 2000
  while L2_2 > 0 do
    L3_2 = NetworkHasControlOfEntity
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L3_2 = Wait
    L4_2 = 100
    L3_2(L4_2)
    L2_2 = L2_2 - 100
  end
  L3_2 = SetEntityAsMissionEntity
  L4_2 = L1_2
  L5_2 = true
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = 2000
  while L3_2 > 0 do
    L4_2 = IsEntityAMissionEntity
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      break
    end
    L4_2 = Wait
    L5_2 = 100
    L4_2(L5_2)
    L3_2 = L3_2 - 100
  end
  L4_2 = Citizen
  L4_2 = L4_2.InvokeNative
  L5_2 = -1569388442007722673
  L6_2 = Citizen
  L6_2 = L6_2.PointerValueIntInitialized
  L7_2 = L1_2
  L6_2, L7_2 = L6_2(L7_2)
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = DoesEntityExist
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = DeleteEntity
    L5_2 = L1_2
    L4_2(L5_2)
    L4_2 = DoesEntityExist
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = false
      return L4_2
    else
      L4_2 = true
      return L4_2
    end
  else
    L4_2 = true
    return L4_2
  end
end
L114_1(L115_1, L116_1)
L114_1 = RegisterNetEvent
L115_1 = "QBCore:Client:OnPlayerLoaded"
L114_1(L115_1)
L114_1 = AddEventHandler
L115_1 = "QBCore:Client:OnPlayerLoaded"
function L116_1()
  local L0_2, L1_2, L2_2
  L0_2 = Wait
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = Framework
  if "QBCore" == L0_2 then
    L0_2 = FWork
    L0_2 = L0_2.Functions
    L0_2 = L0_2.GetPlayerData
    L0_2 = L0_2()
    PlayerData = L0_2
    L0_2 = IsPoliceCheck
    L0_2()
  end
  L0_2 = Config
  L0_2 = L0_2.FrameworkFunctions
  L0_2 = L0_2.TriggerCallback
  L1_2 = "Pug:serverCB:GetHeistData"
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    if A0_3 then
      L1_3 = A0_3.heistData
      if L1_3 then
        L1_3 = A0_3.passcodeLocation
        if L1_3 then
          L1_3 = pairs
          L2_3 = A0_3.passcodeLocation
          L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
          for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
            L7_3 = L18_1
            L7_3[L5_3] = L6_3
          end
        end
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:HandleAllRobberyTargets"
        L3_3 = A0_3.heistData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateBankTruckData"
        L3_3 = A0_3.TruckData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateSellItemsData"
        L3_3 = A0_3.SellItemsData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateAtmRobberyData"
        L3_3 = A0_3.AtmRobberyData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdatePettyCrimeData"
        L3_3 = A0_3.PettyCrimeData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateHouseRobberyData"
        L3_3 = A0_3.HouseRobberyData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateRobberyIntelData"
        L3_3 = A0_3.RobberyIntelData
        L1_3(L2_3, L3_3)
        L1_3 = A0_3.passcodes
        if L1_3 then
          L1_3 = pairs
          L2_3 = A0_3.passcodes
          L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
          for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
            L7_3 = L17_1
            L7_3[L5_3] = L6_3
          end
        end
      end
    end
  end
  L0_2(L1_2, L2_2)
  L0_2 = TriggerServerEvent
  L1_2 = "Pug:server:RequestLaserStates"
  L0_2(L1_2)
  L0_2 = TriggerServerEvent
  L1_2 = "Pug:server:RequestBankDoorStates"
  L0_2(L1_2)
  L0_2 = TriggerServerEvent
  L1_2 = "Pug:server:CheckCityWideBlackoutOnLoad"
  L0_2(L1_2)
end
L114_1(L115_1, L116_1)
L114_1 = RegisterNetEvent
L115_1 = "esx:playerLoaded"
L114_1(L115_1)
L114_1 = AddEventHandler
L115_1 = "esx:playerLoaded"
function L116_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Wait
  L2_2 = 2000
  L1_2(L2_2)
  L1_2 = Framework
  if "ESX" == L1_2 then
    if A0_2 then
      L1_2 = type
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      if "table" == L1_2 then
        PlayerData = A0_2
    end
    else
      L1_2 = PugRefreshRobberyCreatorPlayerData
      L1_2()
    end
    L1_2 = IsPoliceCheck
    L1_2()
  end
  L1_2 = Config
  L1_2 = L1_2.FrameworkFunctions
  L1_2 = L1_2.TriggerCallback
  L2_2 = "Pug:serverCB:GetHeistData"
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    if A0_3 then
      L1_3 = A0_3.heistData
      if L1_3 then
        L1_3 = A0_3.passcodeLocation
        if L1_3 then
          L1_3 = pairs
          L2_3 = A0_3.passcodeLocation
          L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
          for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
            L7_3 = L18_1
            L7_3[L5_3] = L6_3
          end
        end
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:HandleAllRobberyTargets"
        L3_3 = A0_3.heistData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateBankTruckData"
        L3_3 = A0_3.TruckData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateSellItemsData"
        L3_3 = A0_3.SellItemsData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateAtmRobberyData"
        L3_3 = A0_3.AtmRobberyData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdatePettyCrimeData"
        L3_3 = A0_3.PettyCrimeData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateHouseRobberyData"
        L3_3 = A0_3.HouseRobberyData
        L1_3(L2_3, L3_3)
        L1_3 = TriggerEvent
        L2_3 = "Pug:client:UpdateRobberyIntelData"
        L3_3 = A0_3.RobberyIntelData
        L1_3(L2_3, L3_3)
        L1_3 = A0_3.passcodes
        if L1_3 then
          L1_3 = pairs
          L2_3 = A0_3.passcodes
          L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
          for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
            L7_3 = L17_1
            L7_3[L5_3] = L6_3
          end
        end
      end
    end
  end
  L1_2(L2_2, L3_2)
  L1_2 = TriggerServerEvent
  L2_2 = "Pug:server:RequestLaserStates"
  L1_2(L2_2)
  L1_2 = TriggerServerEvent
  L2_2 = "Pug:server:RequestBankDoorStates"
  L1_2(L2_2)
  L1_2 = TriggerServerEvent
  L2_2 = "Pug:server:CheckCityWideBlackoutOnLoad"
  L1_2(L2_2)
end
L114_1(L115_1, L116_1)
L114_1 = CreateThread
function L115_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = Wait
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = LocalPlayer
  L0_2 = L0_2.state
  L0_2 = L0_2.isLoggedIn
  L1_2 = Framework
  if "ESX" == L1_2 then
    L1_2 = FWork
    L0_2 = L1_2.PlayerLoaded
  end
  if L0_2 then
    L1_2 = Framework
    if "QBCore" == L1_2 then
      L1_2 = FWork
      L1_2 = L1_2.Functions
      L1_2 = L1_2.GetPlayerData
      L1_2 = L1_2()
      PlayerData = L1_2
      L1_2 = IsPoliceCheck
      L1_2()
    else
      L1_2 = Framework
      if "ESX" == L1_2 then
        L1_2 = PugRefreshRobberyCreatorPlayerData
        L1_2()
        L1_2 = IsPoliceCheck
        L1_2()
      end
    end
    L1_2 = Config
    L1_2 = L1_2.FrameworkFunctions
    L1_2 = L1_2.TriggerCallback
    L2_2 = "Pug:serverCB:GetHeistData"
    function L3_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
      if A0_3 then
        L1_3 = A0_3.heistData
        if L1_3 then
          L1_3 = A0_3.passcodeLocation
          if L1_3 then
            L1_3 = pairs
            L2_3 = A0_3.passcodeLocation
            L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
            for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
              L7_3 = L18_1
              L7_3[L5_3] = L6_3
            end
          end
          L1_3 = TriggerEvent
          L2_3 = "Pug:client:HandleAllRobberyTargets"
          L3_3 = A0_3.heistData
          L4_3 = true
          L1_3(L2_3, L3_3, L4_3)
          L1_3 = TriggerEvent
          L2_3 = "Pug:client:UpdateBankTruckData"
          L3_3 = A0_3.TruckData
          L1_3(L2_3, L3_3)
          L1_3 = TriggerEvent
          L2_3 = "Pug:client:UpdateSellItemsData"
          L3_3 = A0_3.SellItemsData
          L1_3(L2_3, L3_3)
          L1_3 = TriggerEvent
          L2_3 = "Pug:client:UpdateAtmRobberyData"
          L3_3 = A0_3.AtmRobberyData
          L1_3(L2_3, L3_3)
          L1_3 = TriggerEvent
          L2_3 = "Pug:client:UpdatePettyCrimeData"
          L3_3 = A0_3.PettyCrimeData
          L1_3(L2_3, L3_3)
          L1_3 = TriggerEvent
          L2_3 = "Pug:client:UpdateHouseRobberyData"
          L3_3 = A0_3.HouseRobberyData
          L1_3(L2_3, L3_3)
          L1_3 = TriggerEvent
          L2_3 = "Pug:client:UpdateRobberyIntelData"
          L3_3 = A0_3.RobberyIntelData
          L1_3(L2_3, L3_3)
          L1_3 = A0_3.passcodes
          if L1_3 then
            L1_3 = pairs
            L2_3 = A0_3.passcodes
            L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
            for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
              L7_3 = L17_1
              L7_3[L5_3] = L6_3
            end
          end
        end
      end
    end
    L1_2(L2_2, L3_2)
  end
  L1_2 = GetResourceState
  L2_2 = "qb-bankrobbery"
  L1_2 = L1_2(L2_2)
  if "started" == L1_2 then
    L1_2 = PrintDebug
    L2_2 = "^1PUG: ^2REMOVE QB-BANKROBBERY FROM YOUR SERVER WHEN USING ROBBERY CREATOR"
    L1_2(L2_2)
  end
  L1_2 = GetResourceState
  L2_2 = "qb-storerobbery"
  L1_2 = L1_2(L2_2)
  if "started" == L1_2 then
    L1_2 = PrintDebug
    L2_2 = "^1PUG: ^2REMOVE QB-STOREROBBERY FROM YOUR SERVER WHEN USING ROBBERY CREATOR"
    L1_2(L2_2)
  end
  L1_2 = GetResourceState
  L2_2 = "qb-jewelery"
  L1_2 = L1_2(L2_2)
  if "started" == L1_2 then
    L1_2 = PrintDebug
    L2_2 = "^1PUG: ^2REMOVE QB-JEWLERY FROM YOUR SERVER WHEN USING ROBBERY CREATOR"
    L1_2(L2_2)
  end
end
L114_1(L115_1)
function L114_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 then
    L2_2 = A0_2.stages
    if L2_2 then
      L2_2 = pairs
      L3_2 = L16_1
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = string
        L8_2 = L8_2.find
        L9_2 = L6_2
        L10_2 = A0_2.heist_name
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          L8_2 = L16_1
          L8_2[L6_2] = nil
        end
      end
      if A1_2 then
        L2_2 = L68_1
        L3_2 = A0_2.heist_name
        L2_2(L3_2)
        L2_2 = L69_1
        L3_2 = A0_2.heist_name
        L2_2(L3_2)
      else
        L2_2 = L68_1
        L3_2 = A0_2.heist_name
        L2_2(L3_2)
        L2_2 = L69_1
        L3_2 = A0_2.heist_name
        L2_2(L3_2)
      end
  end
  else
    L2_2 = PrintDebug
    L3_2 = "I DONT THINK THIS SHOULD EVER RUN BUT IF IT DOES I NEED TO CHECK WHY"
    L2_2(L3_2)
  end
end
L115_1 = RegisterNetEvent
L116_1 = "Pug:client:ResetRobberyProp"
function L117_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L2_2 = pairs
  L3_2 = L6_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = DoesEntityExist
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = tostring
      L9_2 = A0_2
      L8_2 = L8_2(L9_2)
      L9_2 = tostring
      L10_2 = A1_2
      L9_2 = L9_2(L10_2)
      L10_2 = string
      L10_2 = L10_2.match
      L11_2 = L6_2
      L12_2 = L8_2
      L13_2 = "_Step:"
      L14_2 = L9_2
      L15_2 = "end"
      L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 then
        L11_2 = pairs
        L12_2 = AllDoorData
        L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
        for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
          L17_2 = L16_2.Coords
          if L17_2 then
            L17_2 = GetEntityModel
            L18_2 = L7_2
            L17_2 = L17_2(L18_2)
            L18_2 = GetHashKey
            L19_2 = L16_2.Prop
            L18_2 = L18_2(L19_2)
            if L17_2 == L18_2 then
              L17_2 = vector3
              L18_2 = L16_2.Coords
              L18_2 = L18_2.x
              L19_2 = L16_2.Coords
              L19_2 = L19_2.y
              L20_2 = L16_2.Coords
              L20_2 = L20_2.z
              L17_2 = L17_2(L18_2, L19_2, L20_2)
              L18_2 = GetEntityCoords
              L19_2 = L7_2
              L18_2 = L18_2(L19_2)
              L18_2 = L18_2 - L17_2
              L18_2 = #L18_2
              L19_2 = 1.5
              if L18_2 <= L19_2 then
                L19_2 = PrintDebug
                L20_2 = "Removing door from AllDoorData"
                L21_2 = L15_2
                L19_2(L20_2, L21_2)
                L19_2 = AllDoorData
                L19_2[L15_2] = nil
              end
            end
          end
        end
        L11_2 = PrintDebug
        L12_2 = L6_2
        L13_2 = "k"
        L11_2(L12_2, L13_2)
        L11_2 = PrintDebug
        L12_2 = "DELETE HERE AT Step: "
        L13_2 = A1_2
        L12_2 = L12_2 .. L13_2
        L11_2(L12_2)
        L11_2 = L38_1
        L12_2 = L7_2
        L11_2(L12_2)
        L11_2 = L6_1
        L11_2[L6_2] = nil
      end
    end
  end
  L2_2 = L48_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = pairs
  L4_2 = json
  L4_2 = L4_2.decode
  L5_2 = L2_2.stages
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L4_2(L5_2)
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.stepNumber
    if L9_2 == A1_2 then
      L9_2 = L8_2.targetVector
      if "" ~= L9_2 then
        L9_2 = L8_2.targetVector
        if nil ~= L9_2 then
          L9_2 = L42_1
          L10_2 = L8_2.targetVector
          L9_2 = L9_2(L10_2)
          L8_2.targetVector = L9_2
          L9_2 = L8_2.targetVector
          if not L9_2 then
            return
          end
          L9_2 = {}
          L9_2.x = 888.12
          L9_2.y = -2130.54
          L9_2.z = 31.24
          L10_2 = L8_2.targetVector
          L11_2 = vector3
          L12_2 = L9_2.x
          L13_2 = L9_2.y
          L14_2 = L9_2.z
          L11_2 = L11_2(L12_2, L13_2, L14_2)
          L10_2 = L10_2 - L11_2
          L10_2 = #L10_2
          if L10_2 <= 2.0 then
            L11_2 = L78_1
            L11_2()
          end
          L11_2 = L8_2.propName
          if L11_2 then
            L11_2 = L8_2.propName
            if "" ~= L11_2 then
              L11_2 = L67_1
              L12_2 = A0_2
              L13_2 = L8_2
              L14_2 = true
              L15_2 = true
              L11_2(L12_2, L13_2, L14_2, L15_2)
              L11_2 = PrintDebug
              L12_2 = "REGISTERED STREAMED PROP HERE AT "
              L13_2 = A1_2
              L12_2 = L12_2 .. L13_2
              L11_2(L12_2)
            end
          end
        end
      end
      L9_2 = L8_2.passcodes
      if L9_2 then
        L9_2 = A0_2
        L10_2 = L8_2.stepNumber
        L9_2 = L9_2 .. L10_2
        L10_2 = L18_1
        L9_2 = L10_2[L9_2]
        L10_2 = ipairs
        L11_2 = L8_2.passcodes
        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
        for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
          if L14_2 == L9_2 then
            L16_2 = {}
            L17_2 = L15_2.position
            L17_2 = L17_2[1]
            L16_2.x = L17_2
            L17_2 = L15_2.position
            L17_2 = L17_2[2]
            L16_2.y = L17_2
            L17_2 = L15_2.position
            L17_2 = L17_2[3]
            L16_2.z = L17_2
            L17_2 = L15_2.heading
            L18_2 = tostring
            L19_2 = A0_2
            L20_2 = "_passcode_"
            L21_2 = L8_2.stepNumber
            L19_2 = L19_2 .. L20_2 .. L21_2
            L18_2 = L18_2(L19_2)
            L19_2 = L16_1
            L20_2 = {}
            L20_2.position = L16_2
            L20_2.heading = L17_2
            L19_2[L18_2] = L20_2
            L19_2 = L66_1
            L20_2 = A0_2
            L21_2 = L8_2
            L22_2 = L16_2
            L23_2 = L17_2
            L24_2 = false
            L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
          end
        end
      end
    end
  end
end
L115_1(L116_1, L117_1)
function L115_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = pairs
  L3_2 = A0_2.lasers
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.startVector
    L9_2 = L7_2.endVector
    if L8_2 and L9_2 then
      L10_2 = #L8_2
      if 3 == L10_2 then
        L10_2 = #L9_2
        if 3 == L10_2 then
          L10_2 = table
          L10_2 = L10_2.insert
          L11_2 = LaserTable
          L12_2 = {}
          L13_2 = vector3
          L14_2 = tonumber
          L15_2 = L8_2[1]
          L14_2 = L14_2(L15_2)
          L15_2 = tonumber
          L16_2 = L8_2[2]
          L15_2 = L15_2(L16_2)
          L16_2 = tonumber
          L17_2 = L8_2[3]
          L16_2, L17_2 = L16_2(L17_2)
          L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
          L12_2.start = L13_2
          L13_2 = vector3
          L14_2 = tonumber
          L15_2 = L9_2[1]
          L14_2 = L14_2(L15_2)
          L15_2 = tonumber
          L16_2 = L9_2[2]
          L15_2 = L15_2(L16_2)
          L16_2 = tonumber
          L17_2 = L9_2[3]
          L16_2, L17_2 = L16_2(L17_2)
          L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
          L12_2.endPos = L13_2
          L13_2 = {}
          L13_2.r = 255
          L13_2.g = 0
          L13_2.b = 0
          L13_2.a = 255
          L12_2.color = L13_2
          L13_2 = tonumber
          L14_2 = L7_2.intensity
          L13_2 = L13_2(L14_2)
          L13_2 = L13_2 + 2
          if not L13_2 then
            L13_2 = 0
          end
          L12_2.damage = L13_2
          L12_2.Heist = A1_2
          L13_2 = L7_2.movement
          if not L13_2 then
            L13_2 = {}
            L13_2.direction = "none"
            L13_2.amount = 0
          end
          L12_2.movement = L13_2
          L13_2 = L7_2.movement
          if L13_2 then
            L13_2 = L7_2.movement
            L13_2 = L13_2.speed
            if L13_2 then
              goto lbl_79
            end
          end
          L13_2 = 0.007
          ::lbl_79::
          L12_2.speed = L13_2
          L12_2.directionState = 1
          L13_2 = vector3
          L14_2 = tonumber
          L15_2 = L8_2[1]
          L14_2 = L14_2(L15_2)
          L15_2 = tonumber
          L16_2 = L8_2[2]
          L15_2 = L15_2(L16_2)
          L16_2 = tonumber
          L17_2 = L8_2[3]
          L16_2, L17_2 = L16_2(L17_2)
          L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
          L12_2.initialStart = L13_2
          L13_2 = vector3
          L14_2 = tonumber
          L15_2 = L9_2[1]
          L14_2 = L14_2(L15_2)
          L15_2 = tonumber
          L16_2 = L9_2[2]
          L15_2 = L15_2(L16_2)
          L16_2 = tonumber
          L17_2 = L9_2[3]
          L16_2, L17_2 = L16_2(L17_2)
          L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
          L12_2.initialEnd = L13_2
          L13_2 = A0_2.stepNumber
          L12_2.stepId = L13_2
          L10_2(L11_2, L12_2)
      end
    end
    else
      L10_2 = PrintDebug
      L11_2 = "Error: Invalid vector format."
      L10_2(L11_2)
    end
  end
end
function L116_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = pairs
  L2_2 = LaserTable
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = tostring
    L8_2 = L6_2.Heist
    L7_2 = L7_2(L8_2)
    L8_2 = tostring
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    if L7_2 == L8_2 then
      L7_2 = LaserTable
      L7_2[L5_2] = nil
    end
  end
end
function L117_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if A0_2 then
    L1_2 = A0_2.stages
    if L1_2 then
      L1_2 = json
      L1_2 = L1_2.decode
      L2_2 = A0_2.stages
      L1_2 = L1_2(L2_2)
      if not L1_2 then
        L1_2 = {}
      end
      L2_2 = L44_1
      L3_2 = L1_2
      L2_2(L3_2)
      L2_2 = pairs
      L3_2 = L1_2
      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
        L8_2 = L7_2.lasers
        if L8_2 then
          L8_2 = L7_2.lasers
          L8_2 = #L8_2
          if L8_2 > 0 then
            L8_2 = L115_1
            L9_2 = L7_2
            L10_2 = A0_2.heist_name
            L8_2(L9_2, L10_2)
          end
        end
        L8_2 = L7_2.passcodes
        if L8_2 then
          L8_2 = PrintDebug
          L9_2 = A0_2.heist_name
          L10_2 = L7_2.stepNumber
          L9_2 = L9_2 .. L10_2
          L10_2 = L18_1
          L9_2 = L10_2[L9_2]
          L10_2 = "IndividualRobberyPasscodeLocations[heist.heist_name..stage.stepNumber]"
          L8_2(L9_2, L10_2)
          L8_2 = A0_2.heist_name
          L9_2 = L7_2.stepNumber
          L8_2 = L8_2 .. L9_2
          L9_2 = L18_1
          L8_2 = L9_2[L8_2]
          L9_2 = ipairs
          L10_2 = L7_2.passcodes
          L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
          for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
            if L13_2 == L8_2 then
              L15_2 = {}
              L16_2 = L14_2.position
              L16_2 = L16_2[1]
              L15_2.x = L16_2
              L16_2 = L14_2.position
              L16_2 = L16_2[2]
              L15_2.y = L16_2
              L16_2 = L14_2.position
              L16_2 = L16_2[3]
              L15_2.z = L16_2
              L16_2 = L14_2.heading
              L17_2 = tostring
              L18_2 = A0_2.heist_name
              L19_2 = "_passcode_"
              L20_2 = L7_2.stepNumber
              L18_2 = L18_2 .. L19_2 .. L20_2
              L17_2 = L17_2(L18_2)
              L18_2 = L16_1
              L19_2 = {}
              L19_2.position = L15_2
              L19_2.heading = L16_2
              L18_2[L17_2] = L19_2
              L18_2 = L66_1
              L19_2 = A0_2.heist_name
              L20_2 = L7_2
              L21_2 = L15_2
              L22_2 = L16_2
              L23_2 = true
              L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
            end
          end
        end
        L8_2 = L42_1
        L9_2 = L7_2.targetVector
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L7_2.targetVector = L8_2
          L9_2 = "Interact"
          L10_2 = L7_2.targetText
          if "" ~= L10_2 then
            L9_2 = L7_2.targetText
          end
          L10_2 = L7_2.propName
          if L10_2 then
            L10_2 = L7_2.propName
            if "" ~= L10_2 then
              L10_2 = L67_1
              L11_2 = A0_2.heist_name
              L12_2 = L7_2
              L13_2 = true
              L10_2(L11_2, L12_2, L13_2)
            end
          end
          L10_2 = "Pug:client:RobberyTargetHackableDoor"
          L11_2 = tostring
          L12_2 = A0_2.heist_name
          L13_2 = L7_2.stepNumber
          L12_2 = L12_2 .. L13_2
          L11_2 = L11_2(L12_2)
          L12_2 = "Pug_Heist"
          L11_2 = L11_2 .. L12_2
          L12_2 = {}
          L12_2.name = L11_2
          L13_2 = vector3
          L14_2 = L7_2.targetVector
          L14_2 = L14_2.x
          L15_2 = L7_2.targetVector
          L15_2 = L15_2.y
          L16_2 = L7_2.targetVector
          L16_2 = L16_2.z
          L13_2 = L13_2(L14_2, L15_2, L16_2)
          L12_2.coords = L13_2
          L12_2.length = 0.5
          L12_2.width = 0.5
          L13_2 = L7_2.propHeading
          if not L13_2 then
            L13_2 = 0.0
          end
          L12_2.heading = L13_2
          L13_2 = L7_2.targetVector
          L13_2 = L13_2.z
          L13_2 = L13_2 - 0.5
          L12_2.minZ = L13_2
          L13_2 = L7_2.targetVector
          L13_2 = L13_2.z
          L13_2 = L13_2 + 0.5
          L12_2.maxZ = L13_2
          L12_2.event = L10_2
          L12_2.icon = "fas fa-user-secret"
          L12_2.label = L9_2
          L12_2.distance = 2.0
          L13_2 = L19_1
          L14_2 = L7_2.propName
          L13_2 = L13_2(L14_2)
          if not L13_2 then
            L13_2 = GetResourceState
            L14_2 = "RevoInteract"
            L13_2 = L13_2(L14_2)
            if "started" ~= L13_2 then
              L13_2 = Config
              L13_2 = L13_2.Target
              if L13_2 then
                L13_2 = Config
                L13_2 = L13_2.DrawTextInsteadOfTarget
                if not L13_2 then
                  goto lbl_184
                end
              end
            end
            L13_2 = L13_1
            L14_2 = tostring
            L15_2 = A0_2.heist_name
            L16_2 = L7_2.stepNumber
            L15_2 = L15_2 .. L16_2
            L14_2 = L14_2(L15_2)
            L13_2[L11_2] = L14_2
            L13_2 = {}
            L13_2.stage = L7_2
            L13_2.heist = A0_2
            L14_2 = CreateThread
            function L15_2()
              local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
              L0_3 = false
              while true do
                L2_3 = L11_2
                L1_3 = L13_1
                L1_3 = L1_3[L2_3]
                if not L1_3 then
                  break
                end
                L1_3 = PlayerPedId
                L1_3 = L1_3()
                L2_3 = GetEntityCoords
                L3_3 = L1_3
                L2_3 = L2_3(L3_3)
                L3_3 = L12_2.coords
                L3_3 = L2_3 - L3_3
                L3_3 = #L3_3
                L4_3 = 1.5
                if L3_3 <= L4_3 then
                  if not L0_3 then
                    L4_3 = L11_2
                    L5_3 = L4_3
                    L4_3 = L4_3.gsub
                    L6_3 = "%s+"
                    L7_3 = ""
                    L4_3 = L4_3(L5_3, L6_3, L7_3)
                    L5_3 = GetResourceState
                    L6_3 = "RevoInteract"
                    L5_3 = L5_3(L6_3)
                    if "started" == L5_3 then
                      L5_3 = exports
                      L5_3 = L5_3.RevoInteract
                      L6_3 = L5_3
                      L5_3 = L5_3.OpenHelp
                      L7_3 = {}
                      L7_3.ID = L4_3
                      L8_3 = L12_2.label
                      L7_3.Text = L8_3
                      L7_3.Key = "[E]"
                      L5_3(L6_3, L7_3)
                    else
                      L5_3 = DrawTextOption
                      L6_3 = "[E] "
                      L7_3 = L12_2.label
                      L6_3 = L6_3 .. L7_3
                      L5_3(L6_3)
                    end
                    L0_3 = true
                  end
                  L4_3 = IsControlJustPressed
                  L5_3 = 0
                  L6_3 = 38
                  L4_3 = L4_3(L5_3, L6_3)
                  if L4_3 then
                    L4_3 = TriggerEvent
                    L5_3 = L12_2.event
                    L6_3 = L7_2
                    L7_3 = A0_2
                    L4_3(L5_3, L6_3, L7_3)
                    L4_3 = Wait
                    L5_3 = 500
                    L4_3(L5_3)
                  end
                  L4_3 = Wait
                  L5_3 = 0
                  L4_3(L5_3)
                else
                  L4_3 = L11_2
                  L5_3 = L4_3
                  L4_3 = L4_3.gsub
                  L6_3 = "%s+"
                  L7_3 = ""
                  L4_3 = L4_3(L5_3, L6_3, L7_3)
                  if L0_3 then
                    L5_3 = GetResourceState
                    L6_3 = "RevoInteract"
                    L5_3 = L5_3(L6_3)
                    if "started" == L5_3 then
                      L5_3 = exports
                      L5_3 = L5_3.RevoInteract
                      L6_3 = L5_3
                      L5_3 = L5_3.CloseHelp
                      L7_3 = L4_3
                      L5_3(L6_3, L7_3)
                    else
                      L5_3 = HideTextOption
                      L5_3()
                    end
                    L0_3 = false
                  end
                  L5_3 = Wait
                  L6_3 = 1000
                  L5_3(L6_3)
                end
              end
            end
            L14_2(L15_2)
            goto lbl_302
            ::lbl_184::
            L13_2 = Config
            L13_2 = L13_2.Target
            if "ox_target" == L13_2 then
              L13_2 = {}
              L13_2.stage = L7_2
              L13_2.heist = A0_2
              L14_2 = L13_1
              L15_2 = exports
              L15_2 = L15_2.ox_target
              L16_2 = L15_2
              L15_2 = L15_2.addSphereZone
              L17_2 = {}
              L18_2 = L12_2.coords
              L17_2.coords = L18_2
              L17_2.radius = 0.4
              L18_2 = Config
              L18_2 = L18_2.Debug
              L17_2.debug = L18_2
              L18_2 = {}
              L19_2 = {}
              L19_2.name = L11_2
              L19_2.type = "client"
              L20_2 = L12_2.event
              L19_2.event = L20_2
              L19_2.args = L13_2
              L20_2 = L12_2.icon
              L19_2.icon = L20_2
              L20_2 = L12_2.label
              L19_2.label = L20_2
              L20_2 = L12_2.distance
              L19_2.distance = L20_2
              L20_2 = {}
              L21_2 = L11_2
              L22_2 = "police"
              L21_2 = L21_2 .. L22_2
              L20_2.name = L21_2
              L20_2.type = "client"
              L21_2 = Config
              L21_2 = L21_2.DefualPoliceJobs
              L20_2.groups = L21_2
              function L21_2()
                local L0_3, L1_3
                L0_3 = Config
                L0_3 = L0_3.CanPoliceResetStep
                return L0_3
              end
              L20_2.canInteract = L21_2
              function L21_2()
                local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
                L0_3 = json
                L0_3 = L0_3.decode
                L1_3 = A0_2.settings
                L0_3 = L0_3(L1_3)
                L1_3 = TriggerServerEvent
                L2_3 = "Pug:server:SetStepOnCoolDown"
                L3_3 = A0_2.heist_name
                L4_3 = tonumber
                L5_3 = L7_2.stepNumber
                L4_3 = L4_3(L5_3)
                L5_3 = L0_3.robberyCooldown
                L6_3 = "police"
                L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
              end
              L20_2.onSelect = L21_2
              L20_2.args = L13_2
              L20_2.icon = "fa-solid fa-building-shield"
              L21_2 = Config
              L21_2 = L21_2.LangT
              L21_2 = L21_2.ResetRobberyStep
              L20_2.label = L21_2
              L21_2 = L12_2.distance
              L20_2.distance = L21_2
              L18_2[1] = L19_2
              L18_2[2] = L20_2
              L17_2.options = L18_2
              L15_2 = L15_2(L16_2, L17_2)
              L14_2[L11_2] = L15_2
            else
              L13_2 = L13_1
              L14_2 = tostring
              L15_2 = A0_2.heist_name
              L16_2 = L7_2.stepNumber
              L15_2 = L15_2 .. L16_2
              L14_2 = L14_2(L15_2)
              L13_2[L11_2] = L14_2
              L13_2 = exports
              L14_2 = Config
              L14_2 = L14_2.Target
              L13_2 = L13_2[L14_2]
              L14_2 = L13_2
              L13_2 = L13_2.AddCircleZone
              L15_2 = L12_2.name
              L16_2 = L12_2.coords
              L17_2 = 0.5
              L18_2 = {}
              L19_2 = L12_2.name
              L18_2.name = L19_2
              L19_2 = Config
              L19_2 = L19_2.Debug
              L18_2.debugPoly = L19_2
              L18_2.useZ = true
              L19_2 = {}
              L20_2 = {}
              L21_2 = {}
              L21_2.type = "client"
              L22_2 = L12_2.icon
              L21_2.icon = L22_2
              L22_2 = L12_2.label
              L21_2.label = L22_2
              function L22_2()
                local L0_3, L1_3, L2_3, L3_3
                L0_3 = TriggerEvent
                L1_3 = L12_2.event
                L2_3 = L7_2
                L3_3 = A0_2
                L0_3(L1_3, L2_3, L3_3)
              end
              L21_2.action = L22_2
              L22_2 = {}
              L22_2.type = "client"
              L22_2.icon = "fa-solid fa-building-shield"
              L23_2 = Config
              L23_2 = L23_2.LangT
              L23_2 = L23_2.ResetRobberyStep
              L22_2.label = L23_2
              L23_2 = Config
              L23_2 = L23_2.DefualPoliceJobs
              L22_2.job = L23_2
              function L23_2()
                local L0_3, L1_3
                L0_3 = Config
                L0_3 = L0_3.CanPoliceResetStep
                return L0_3
              end
              L22_2.canInteract = L23_2
              function L23_2()
                local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
                L0_3 = json
                L0_3 = L0_3.decode
                L1_3 = A0_2.settings
                L0_3 = L0_3(L1_3)
                L1_3 = TriggerServerEvent
                L2_3 = "Pug:server:SetStepOnCoolDown"
                L3_3 = A0_2.heist_name
                L4_3 = tonumber
                L5_3 = L7_2.stepNumber
                L4_3 = L4_3(L5_3)
                L5_3 = L0_3.robberyCooldown
                L6_3 = "police"
                L1_3(L2_3, L3_3, L4_3, L5_3, L6_3)
              end
              L22_2.action = L23_2
              L20_2[1] = L21_2
              L20_2[2] = L22_2
              L19_2.options = L20_2
              L20_2 = L12_2.distance
              L19_2.distance = L20_2
              L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
            end
          end
          ::lbl_302::
        end
      end
    end
  end
end
L118_1 = RegisterNetEvent
L119_1 = "Pug:client:CreateSyncedProps"
function L120_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  if "tr_prop_tr_container_01a" == A4_2 then
    L6_2 = A5_2 or L6_2
    if A5_2 then
      L6_2 = A5_2.Stage
      if L6_2 then
        L6_2 = A5_2.Stage
        L6_2 = L6_2.stepNumber
      end
    end
    L7_2 = L63_1
    L8_2 = A3_2
    L9_2 = L6_2
    L7_2, L8_2, L9_2 = L7_2(L8_2, L9_2)
    L10_2 = tostring
    L11_2 = A3_2 or L11_2
    if not A3_2 then
      L11_2 = "unknown"
    end
    L10_2 = L10_2(L11_2)
    if not L8_2 then
      L11_2 = tostring
      L12_2 = L10_2
      L13_2 = "_Step:"
      L14_2 = tostring
      L15_2 = L6_2 or L15_2
      if not L6_2 then
        L15_2 = "unknown"
      end
      L14_2 = L14_2(L15_2)
      L15_2 = "end_opened_container"
      L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2
      L11_2 = L11_2(L12_2)
      L8_2 = L11_2
    end
    if not L9_2 then
      L11_2 = tostring
      L12_2 = L10_2
      L13_2 = "_Step:"
      L14_2 = tostring
      L15_2 = L6_2 or L15_2
      if not L6_2 then
        L15_2 = "unknown"
      end
      L14_2 = L14_2(L15_2)
      L15_2 = "end_opened_lock"
      L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2
      L11_2 = L11_2(L12_2)
      L9_2 = L11_2
    end
    L11_2 = L64_1
    L12_2 = A3_2
    L13_2 = L6_2
    L14_2 = A0_2
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = Config
    L11_2 = L11_2.RobberyAnimations
    L11_2 = L11_2[A4_2]
    L11_2 = L11_2.ReplaceProp
    L12_2 = LoadModel
    L13_2 = L11_2
    L12_2(L13_2)
    L12_2 = LoadModel
    L13_2 = "tr_prop_tr_lock_01a"
    L12_2(L13_2)
    L12_2 = L6_1
    L12_2 = L12_2[L8_2]
    if L12_2 then
      L12_2 = DoesEntityExist
      L13_2 = L6_1
      L13_2 = L13_2[L8_2]
      L12_2 = L12_2(L13_2)
      if L12_2 then
        goto lbl_96
      end
    end
    L12_2 = L6_1
    L13_2 = CreateObject
    L14_2 = GetHashKey
    L15_2 = L11_2
    L14_2 = L14_2(L15_2)
    L15_2 = A0_2
    L13_2 = L13_2(L14_2, L15_2)
    L12_2[L8_2] = L13_2
    while true do
      L12_2 = DoesEntityExist
      L13_2 = L6_1
      L13_2 = L13_2[L8_2]
      L12_2 = L12_2(L13_2)
      if L12_2 then
        break
      end
      L12_2 = Wait
      L13_2 = 100
      L12_2(L13_2)
    end
    L12_2 = SetEntityAsMissionEntity
    L13_2 = L6_1
    L13_2 = L13_2[L8_2]
    L14_2 = true
    L15_2 = true
    L12_2(L13_2, L14_2, L15_2)
    ::lbl_96::
    L12_2 = L6_1
    L12_2 = L12_2[L9_2]
    if L12_2 then
      L12_2 = DoesEntityExist
      L13_2 = L6_1
      L13_2 = L13_2[L9_2]
      L12_2 = L12_2(L13_2)
      if L12_2 then
        goto lbl_130
      end
    end
    L12_2 = L6_1
    L13_2 = CreateObject
    L14_2 = GetHashKey
    L15_2 = "tr_prop_tr_lock_01a"
    L14_2 = L14_2(L15_2)
    L15_2 = A0_2
    L13_2 = L13_2(L14_2, L15_2)
    L12_2[L9_2] = L13_2
    while true do
      L12_2 = DoesEntityExist
      L13_2 = L6_1
      L13_2 = L13_2[L9_2]
      L12_2 = L12_2(L13_2)
      if L12_2 then
        break
      end
      L12_2 = Wait
      L13_2 = 100
      L12_2(L13_2)
    end
    L12_2 = SetEntityAsMissionEntity
    L13_2 = L6_1
    L13_2 = L13_2[L9_2]
    L14_2 = true
    L15_2 = true
    L12_2(L13_2, L14_2, L15_2)
    ::lbl_130::
    L12_2 = CreateSynchronizedScene
    L13_2 = A0_2
    L14_2 = A1_2
    L15_2 = 2
    L16_2 = true
    L17_2 = false
    L18_2 = 1065353216
    L19_2 = 0
    L20_2 = 1065353216
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L13_2 = PlaySynchronizedEntityAnim
    L14_2 = L6_1
    L14_2 = L14_2[L8_2]
    L15_2 = L12_2
    L16_2 = "action_container"
    L17_2 = A2_2
    L18_2 = 1.0
    L19_2 = -1.0
    L20_2 = 0
    L21_2 = 1148846080
    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    L13_2 = ForceEntityAiAndAnimationUpdate
    L14_2 = L6_1
    L14_2 = L14_2[L8_2]
    L13_2(L14_2)
    L13_2 = PlaySynchronizedEntityAnim
    L14_2 = L6_1
    L14_2 = L14_2[L9_2]
    L15_2 = L12_2
    L16_2 = "action_lock"
    L17_2 = A2_2
    L18_2 = 1.0
    L19_2 = -1.0
    L20_2 = 0
    L21_2 = 1148846080
    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
    L13_2 = ForceEntityAiAndAnimationUpdate
    L14_2 = L6_1
    L14_2 = L14_2[L9_2]
    L13_2(L14_2)
    L13_2 = SetSynchronizedScenePhase
    L14_2 = L12_2
    L15_2 = 0.99
    L13_2(L14_2, L15_2)
    L13_2 = SetEntityCollision
    L14_2 = L6_1
    L14_2 = L14_2[L8_2]
    L15_2 = false
    L16_2 = true
    L13_2(L14_2, L15_2, L16_2)
    L13_2 = SetEntityCollision
    L14_2 = L6_1
    L14_2 = L14_2[L9_2]
    L15_2 = true
    L16_2 = true
    L13_2(L14_2, L15_2, L16_2)
    L13_2 = FreezeEntityPosition
    L14_2 = L6_1
    L14_2 = L14_2[L8_2]
    L15_2 = true
    L13_2(L14_2, L15_2)
    L13_2 = Wait
    L14_2 = 100
    L13_2(L14_2)
    L13_2 = DestoryCamera
    L13_2()
  elseif "ch_prop_gold_trolly_01a" == A4_2 or "ch_prop_cash_low_trolly_01a" == A4_2 or "ch_prop_diamond_trolly_01a" == A4_2 or "imp_prop_impexp_coke_trolly" == A4_2 then
    L6_2 = Config
    L6_2 = L6_2.RobberyAnimations
    L6_2 = L6_2[A4_2]
    L6_2 = L6_2.ReplaceProp
    L7_2 = LoadModel
    L8_2 = L6_2
    L7_2(L8_2)
    L7_2 = tostring
    L8_2 = A3_2
    L9_2 = "_Step:"
    L10_2 = A5_2.Stage
    L10_2 = L10_2.stepNumber
    L11_2 = "end_"
    L12_2 = A4_2
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
    L7_2 = L7_2(L8_2)
    L8_2 = L6_1
    L8_2 = L8_2[L7_2]
    if L8_2 then
      L8_2 = DoesEntityExist
      L9_2 = L6_1
      L9_2 = L9_2[L7_2]
      L8_2 = L8_2(L9_2)
      if L8_2 then
        return
      end
    end
    L8_2 = L6_1
    L9_2 = CreateObject
    L10_2 = L6_2
    L11_2 = vector3
    L12_2 = A0_2.x
    L13_2 = A0_2.y
    L14_2 = A0_2.z
    L14_2 = L14_2 - 0.5
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2)
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
    L8_2[L7_2] = L9_2
    while true do
      L8_2 = DoesEntityExist
      L9_2 = L6_1
      L9_2 = L9_2[L7_2]
      L8_2 = L8_2(L9_2)
      if L8_2 then
        break
      end
      L8_2 = Wait
      L9_2 = 100
      L8_2(L9_2)
    end
    L8_2 = SetEntityRotation
    L9_2 = L6_1
    L9_2 = L9_2[L7_2]
    L10_2 = A1_2
    L8_2(L9_2, L10_2)
    L8_2 = FreezeEntityPosition
    L9_2 = L6_1
    L9_2 = L9_2[L7_2]
    L10_2 = true
    L8_2(L9_2, L10_2)
  else
    L6_2 = GetPaintingProps
    L7_2 = A4_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = -0.43
      L7_2 = math
      L7_2 = L7_2.rad
      L8_2 = A5_2.Heading
      L7_2 = L7_2(L8_2)
      L8_2 = math
      L8_2 = L8_2.sin
      L9_2 = L7_2
      L8_2 = L8_2(L9_2)
      L8_2 = -L8_2
      L8_2 = L8_2 * L6_2
      L9_2 = math
      L9_2 = L9_2.cos
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      L9_2 = L9_2 * L6_2
      L10_2 = {}
      L11_2 = vector3
      L12_2 = A5_2.Coords
      L12_2 = L12_2.x
      L12_2 = L12_2 + L8_2
      L13_2 = A5_2.Coords
      L13_2 = L13_2.y
      L13_2 = L13_2 + L9_2
      L14_2 = A5_2.Coords
      L14_2 = L14_2.z
      L14_2 = L14_2 - 1.163
      L11_2 = L11_2(L12_2, L13_2, L14_2)
      L10_2.Coords = L11_2
      L11_2 = A5_2.Rotation
      L10_2.Rotation = L11_2
      L11_2 = loadAnimDict
      L12_2 = A2_2
      L11_2(L12_2)
      L11_2 = A4_2
      L12_2 = LoadModel
      L13_2 = L11_2
      L12_2(L13_2)
      L12_2 = tostring
      L13_2 = A3_2
      L14_2 = "_Step:"
      L15_2 = A5_2.Stage
      L15_2 = L15_2.stepNumber
      L16_2 = "end"
      L17_2 = math
      L17_2 = L17_2.random
      L18_2 = 1
      L19_2 = 9999
      L17_2 = L17_2(L18_2, L19_2)
      L13_2 = L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
      L12_2 = L12_2(L13_2)
      L13_2 = L6_1
      L14_2 = CreateObject
      L15_2 = GetHashKey
      L16_2 = L11_2
      L15_2 = L15_2(L16_2)
      L16_2 = L10_2.Coords
      L17_2 = 0
      L18_2 = 0
      L19_2 = 0
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
      L13_2[L12_2] = L14_2
      L13_2 = CreateSynchronizedScene
      L14_2 = L10_2.Coords
      L15_2 = L10_2.Rotation
      L16_2 = 2
      L17_2 = true
      L18_2 = false
      L19_2 = 1065353216
      L20_2 = 0
      L21_2 = 1065353216
      L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
      L14_2 = PlaySynchronizedEntityAnim
      L15_2 = L6_1
      L15_2 = L15_2[L12_2]
      L16_2 = L13_2
      L17_2 = "ver_01_with_painting_exit_ch_prop_vault_painting_01a"
      L18_2 = A2_2
      L19_2 = 1.0
      L20_2 = -1.0
      L21_2 = 0
      L22_2 = 1148846080
      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      L14_2 = ForceEntityAiAndAnimationUpdate
      L15_2 = L6_1
      L15_2 = L15_2[L12_2]
      L14_2(L15_2)
      L14_2 = SetSynchronizedScenePhase
      L15_2 = L13_2
      L16_2 = 0.99
      L14_2(L15_2, L16_2)
      L14_2 = FreezeEntityPosition
      L15_2 = L6_1
      L15_2 = L15_2[L12_2]
      L16_2 = true
      L14_2(L15_2, L16_2)
    elseif "h4_prop_h4_glass_disp_01a" == A4_2 then
      L6_2 = Config
      L6_2 = L6_2.RobberyAnimations
      L6_2 = L6_2[A4_2]
      L6_2 = L6_2.ReplaceProp
      L7_2 = LoadModel
      L8_2 = L6_2
      L7_2(L8_2)
      L7_2 = tostring
      L8_2 = A3_2
      L9_2 = "_Step:"
      L10_2 = A5_2.Stage
      L10_2 = L10_2.stepNumber
      L11_2 = "end"
      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
      L7_2 = L7_2(L8_2)
      L8_2 = L7_2
      L9_2 = "_broken_glass"
      L8_2 = L8_2 .. L9_2
      L9_2 = L6_1
      L9_2 = L9_2[L8_2]
      if L9_2 then
        L9_2 = DoesEntityExist
        L10_2 = L6_1
        L10_2 = L10_2[L8_2]
        L9_2 = L9_2(L10_2)
        if L9_2 then
          return
        end
      end
      L9_2 = L6_1
      L10_2 = CreateObject
      L11_2 = L6_2
      L12_2 = vector3
      L13_2 = A0_2.x
      L14_2 = A0_2.y
      L15_2 = A0_2.z
      L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2(L13_2, L14_2, L15_2)
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      L9_2[L8_2] = L10_2
      while true do
        L9_2 = DoesEntityExist
        L10_2 = L6_1
        L10_2 = L10_2[L8_2]
        L9_2 = L9_2(L10_2)
        if L9_2 then
          break
        end
        L9_2 = Wait
        L10_2 = 100
        L9_2(L10_2)
      end
      L9_2 = SetEntityRotation
      L10_2 = L6_1
      L10_2 = L10_2[L8_2]
      L11_2 = A1_2
      L9_2(L10_2, L11_2)
      L9_2 = FreezeEntityPosition
      L10_2 = L6_1
      L10_2 = L10_2[L8_2]
      L11_2 = true
      L9_2(L10_2, L11_2)
      L9_2 = A4_2
      L10_2 = LoadModel
      L11_2 = L9_2
      L10_2(L11_2)
      L10_2 = L7_2
      L11_2 = "_hidden_original"
      L10_2 = L10_2 .. L11_2
      L11_2 = L6_1
      L12_2 = CreateObject
      L13_2 = L9_2
      L14_2 = vector3
      L15_2 = A0_2.x
      L16_2 = A0_2.y
      L17_2 = A0_2.z
      L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L14_2(L15_2, L16_2, L17_2)
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      L11_2[L10_2] = L12_2
      while true do
        L11_2 = DoesEntityExist
        L12_2 = L6_1
        L12_2 = L12_2[L10_2]
        L11_2 = L11_2(L12_2)
        if L11_2 then
          break
        end
        L11_2 = Wait
        L12_2 = 100
        L11_2(L12_2)
      end
      L11_2 = SetEntityRotation
      L12_2 = L6_1
      L12_2 = L12_2[L10_2]
      L13_2 = A1_2
      L11_2(L12_2, L13_2)
      L11_2 = FreezeEntityPosition
      L12_2 = L6_1
      L12_2 = L12_2[L10_2]
      L13_2 = true
      L11_2(L12_2, L13_2)
      L11_2 = SetEntityVisible
      L12_2 = L6_1
      L12_2 = L12_2[L10_2]
      L13_2 = false
      L11_2(L12_2, L13_2)
    elseif "tr_prop_tr_elecbox_01a" == A4_2 then
      L6_2 = Wait
      L7_2 = 1000
      L6_2(L7_2)
      if "banktruck" == A3_2 then
        L6_2 = Config
        L6_2 = L6_2.RobberyAnimations
        L6_2 = L6_2[A4_2]
        L6_2 = L6_2.ReplaceProp
        L7_2 = LoadModel
        L8_2 = L6_2
        L7_2(L8_2)
        L7_2 = CreateObject
        L8_2 = L6_2
        L9_2 = vector3
        L10_2 = A0_2.x
        L11_2 = A0_2.y
        L12_2 = A0_2.z
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L9_2(L10_2, L11_2, L12_2)
        L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        BankTruckHackProp = L7_2
        while true do
          L7_2 = DoesEntityExist
          L8_2 = BankTruckHackProp
          L7_2 = L7_2(L8_2)
          if L7_2 then
            break
          end
          L7_2 = Wait
          L8_2 = 100
          L7_2(L8_2)
        end
        L7_2 = SetEntityRotation
        L8_2 = BankTruckHackProp
        L9_2 = A1_2
        L7_2(L8_2, L9_2)
        L7_2 = FreezeEntityPosition
        L8_2 = BankTruckHackProp
        L9_2 = true
        L7_2(L8_2, L9_2)
      else
        L6_2 = Config
        L6_2 = L6_2.RobberyAnimations
        L6_2 = L6_2[A4_2]
        L6_2 = L6_2.ReplaceProp
        L7_2 = LoadModel
        L8_2 = L6_2
        L7_2(L8_2)
        L7_2 = tostring
        L8_2 = A3_2
        L9_2 = "_Step:"
        L10_2 = A5_2.Stage
        L10_2 = L10_2.stepNumber
        L11_2 = "end"
        L12_2 = math
        L12_2 = L12_2.random
        L13_2 = 1
        L14_2 = 9999
        L12_2 = L12_2(L13_2, L14_2)
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
        L7_2 = L7_2(L8_2)
        L8_2 = L6_1
        L9_2 = CreateObject
        L10_2 = L6_2
        L11_2 = vector3
        L12_2 = A0_2.x
        L13_2 = A0_2.y
        L14_2 = A0_2.z
        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2)
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L8_2[L7_2] = L9_2
        while true do
          L8_2 = DoesEntityExist
          L9_2 = L6_1
          L9_2 = L9_2[L7_2]
          L8_2 = L8_2(L9_2)
          if L8_2 then
            break
          end
          L8_2 = Wait
          L9_2 = 100
          L8_2(L9_2)
        end
        L8_2 = SetEntityRotation
        L9_2 = L6_1
        L9_2 = L9_2[L7_2]
        L10_2 = A1_2
        L8_2(L9_2, L10_2)
        L8_2 = FreezeEntityPosition
        L9_2 = L6_1
        L9_2 = L9_2[L7_2]
        L10_2 = true
        L8_2(L9_2, L10_2)
      end
    else
      L6_2 = GetJewelryCases
      L7_2 = A4_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = Config
        L6_2 = L6_2.RobberyAnimations
        L6_2 = L6_2[A4_2]
        L6_2 = L6_2.ReplaceProp
        L7_2 = LoadModel
        L8_2 = L6_2
        L7_2(L8_2)
        L7_2 = tostring
        L8_2 = A3_2
        L9_2 = "_Step:"
        L10_2 = A5_2.Stage
        L10_2 = L10_2.stepNumber
        L11_2 = "end"
        L12_2 = math
        L12_2 = L12_2.random
        L13_2 = 1
        L14_2 = 9999
        L12_2 = L12_2(L13_2, L14_2)
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
        L7_2 = L7_2(L8_2)
        L8_2 = 0.58
        if "des_jewel_cab4_start" == A4_2 then
          L8_2 = 0.63
        end
        L9_2 = L6_1
        L10_2 = CreateObject
        L11_2 = L6_2
        L12_2 = vector3
        L13_2 = A0_2.x
        L14_2 = A0_2.y
        L15_2 = A0_2.z
        L15_2 = L15_2 - L8_2
        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2(L13_2, L14_2, L15_2)
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L9_2[L7_2] = L10_2
        while true do
          L9_2 = DoesEntityExist
          L10_2 = L6_1
          L10_2 = L10_2[L7_2]
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = Wait
          L10_2 = 100
          L9_2(L10_2)
        end
        L9_2 = SetEntityRotation
        L10_2 = L6_1
        L10_2 = L10_2[L7_2]
        L11_2 = A1_2
        L9_2(L10_2, L11_2)
        L9_2 = FreezeEntityPosition
        L10_2 = L6_1
        L10_2 = L10_2[L7_2]
        L11_2 = true
        L9_2(L10_2, L11_2)
      elseif "p_chem_vial_02b_s" == A4_2 or "h4_prop_h4_safe_01a" == A4_2 then
        L6_2 = Config
        L6_2 = L6_2.RobberyAnimations
        L6_2 = L6_2[A4_2]
        L6_2 = L6_2.ReplaceProp
        L7_2 = LoadModel
        L8_2 = L6_2
        L7_2(L8_2)
        L7_2 = 0.4
        if "h4_prop_h4_safe_01a" == A4_2 then
          L7_2 = 0.0
        end
        L8_2 = tostring
        L9_2 = A3_2
        L10_2 = "_Step:"
        L11_2 = A5_2.Stage
        L11_2 = L11_2.stepNumber
        L12_2 = "end"
        L13_2 = math
        L13_2 = L13_2.random
        L14_2 = 1
        L15_2 = 9999
        L13_2 = L13_2(L14_2, L15_2)
        L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
        L8_2 = L8_2(L9_2)
        L9_2 = L6_1
        L10_2 = CreateObject
        L11_2 = L6_2
        L12_2 = vector3
        L13_2 = A0_2.x
        L14_2 = A0_2.y
        L15_2 = A0_2.z
        L15_2 = L15_2 - L7_2
        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2(L13_2, L14_2, L15_2)
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L9_2[L8_2] = L10_2
        while true do
          L9_2 = DoesEntityExist
          L10_2 = L6_1
          L10_2 = L10_2[L8_2]
          L9_2 = L9_2(L10_2)
          if L9_2 then
            break
          end
          L9_2 = Wait
          L10_2 = 100
          L9_2(L10_2)
        end
        L9_2 = SetEntityRotation
        L10_2 = L6_1
        L10_2 = L10_2[L8_2]
        L11_2 = A1_2
        L9_2(L10_2, L11_2)
        L9_2 = FreezeEntityPosition
        L10_2 = L6_1
        L10_2 = L10_2[L8_2]
        L11_2 = true
        L9_2(L10_2, L11_2)
      elseif "xm3_prop_xm3_crate_01a" == A4_2 then
        L6_2 = Config
        L6_2 = L6_2.RobberyAnimations
        L6_2 = L6_2[A4_2]
        L6_2 = L6_2.ReplaceProp
        L7_2 = LoadModel
        L8_2 = L6_2
        L7_2(L8_2)
        L7_2 = tostring
        L8_2 = A3_2
        L9_2 = "_Step:"
        L10_2 = A5_2.Stage
        L10_2 = L10_2.stepNumber
        L11_2 = "end"
        L12_2 = math
        L12_2 = L12_2.random
        L13_2 = 1
        L14_2 = 9999
        L12_2 = L12_2(L13_2, L14_2)
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
        L7_2 = L7_2(L8_2)
        L8_2 = L6_1
        L9_2 = CreateObject
        L10_2 = L6_2
        L11_2 = vector3
        L12_2 = A0_2.x
        L13_2 = A0_2.y
        L14_2 = A0_2.z
        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2)
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L8_2[L7_2] = L9_2
        while true do
          L8_2 = DoesEntityExist
          L9_2 = L6_1
          L9_2 = L9_2[L7_2]
          L8_2 = L8_2(L9_2)
          if L8_2 then
            break
          end
          L8_2 = Wait
          L9_2 = 100
          L8_2(L9_2)
        end
        L8_2 = SetEntityRotation
        L9_2 = L6_1
        L9_2 = L9_2[L7_2]
        L10_2 = A1_2
        L8_2(L9_2, L10_2)
        L8_2 = FreezeEntityPosition
        L9_2 = L6_1
        L9_2 = L9_2[L7_2]
        L10_2 = true
        L8_2(L9_2, L10_2)
      elseif "tr_prop_tr_adv_case_01a" == A4_2 then
        L6_2 = Config
        L6_2 = L6_2.RobberyAnimations
        L6_2 = L6_2[A4_2]
        L6_2 = L6_2.ReplaceProp
        L7_2 = LoadModel
        L8_2 = L6_2
        L7_2(L8_2)
        L7_2 = tostring
        L8_2 = A3_2
        L9_2 = "_Step:"
        L10_2 = A5_2.Stage
        L10_2 = L10_2.stepNumber
        L11_2 = "end"
        L12_2 = math
        L12_2 = L12_2.random
        L13_2 = 1
        L14_2 = 9999
        L12_2 = L12_2(L13_2, L14_2)
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
        L7_2 = L7_2(L8_2)
        L8_2 = L6_1
        L9_2 = CreateObject
        L10_2 = L6_2
        L11_2 = vector3
        L12_2 = A0_2.x
        L13_2 = A0_2.y
        L14_2 = A0_2.z
        L14_2 = L14_2 - 0.3
        L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2, L14_2)
        L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L8_2[L7_2] = L9_2
        while true do
          L8_2 = DoesEntityExist
          L9_2 = L6_1
          L9_2 = L9_2[L7_2]
          L8_2 = L8_2(L9_2)
          if L8_2 then
            break
          end
          L8_2 = Wait
          L9_2 = 100
          L8_2(L9_2)
        end
        L8_2 = SetEntityRotation
        L9_2 = L6_1
        L9_2 = L9_2[L7_2]
        L10_2 = A1_2
        L8_2(L9_2, L10_2)
        L8_2 = FreezeEntityPosition
        L9_2 = L6_1
        L9_2 = L9_2[L7_2]
        L10_2 = true
        L8_2(L9_2, L10_2)
      end
    end
  end
end
L118_1(L119_1, L120_1)
L118_1 = RegisterNetEvent
L119_1 = "Pug:client:DeleteRobberiesEntity"
function L120_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  if "banktruck" == A2_2 then
    L4_2 = DoesEntityExist
    L5_2 = BankTruckHackProp
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = DeleteEntity
      L5_2 = BankTruckHackProp
      L4_2(L5_2)
    end
  else
    L4_2 = tonumber
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if not L4_2 and A1_2 then
      L5_2 = GetHashKey
      L6_2 = A1_2
      L5_2 = L5_2(L6_2)
      L4_2 = L5_2
    end
    if A3_2 then
      L5_2 = tostring
      L6_2 = A2_2
      L5_2 = L5_2(L6_2)
      L6_2 = "_Step:"
      L7_2 = tostring
      L8_2 = A3_2
      L7_2 = L7_2(L8_2)
      L8_2 = "end"
      L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
      if L5_2 then
        goto lbl_37
      end
    end
    L5_2 = nil
    ::lbl_37::
    L6_2 = L63_1
    L7_2 = A2_2
    L8_2 = A3_2
    L6_2, L7_2 = L6_2(L7_2, L8_2)
    L8_2 = GetHashKey
    L9_2 = "tr_prop_tr_container_01a"
    L8_2 = L8_2(L9_2)
    L8_2 = L4_2 == L8_2
    L9_2 = false
    if L5_2 then
      L10_2 = L7_1
      L10_2 = L10_2[L5_2]
      if L10_2 then
        L10_2 = L60_1
        L11_2 = L7_1
        L11_2 = L11_2[L5_2]
        L12_2 = L4_2
        L10_2 = L10_2(L11_2, L12_2)
        if L10_2 then
          L10_2 = L61_1
          L11_2 = L5_2
          L10_2(L11_2)
          L9_2 = true
        end
      end
    end
    if A3_2 then
      L10_2 = 0.5
      if L10_2 then
        goto lbl_72
      end
    end
    L10_2 = 0.35
    ::lbl_72::
    L11_2 = L62_1
    L12_2 = A2_2
    L13_2 = A3_2
    L14_2 = A0_2
    L15_2 = L4_2
    L16_2 = L10_2
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    if L11_2 then
      L9_2 = true
    end
    if L5_2 then
      L11_2 = L6_1
      L11_2 = L11_2[L5_2]
      if L11_2 then
        L11_2 = DoesEntityExist
        L12_2 = L6_1
        L12_2 = L12_2[L5_2]
        L11_2 = L11_2(L12_2)
        if L11_2 then
          L11_2 = GetEntityModel
          L12_2 = L6_1
          L12_2 = L12_2[L5_2]
          L11_2 = L11_2(L12_2)
          if L11_2 == L4_2 then
            L11_2 = L38_1
            L12_2 = L6_1
            L12_2 = L12_2[L5_2]
            L11_2(L12_2)
            L11_2 = L6_1
            L11_2[L5_2] = nil
            L9_2 = true
          end
        end
      end
    end
    L11_2 = pairs
    L12_2 = L6_1
    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
    for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
      L17_2 = DoesEntityExist
      L18_2 = L16_2
      L17_2 = L17_2(L18_2)
      if L17_2 then
        L17_2 = GetEntityModel
        L18_2 = L16_2
        L17_2 = L17_2(L18_2)
        if L17_2 == L4_2 and (not L8_2 or L15_2 ~= L7_2) then
          L17_2 = string
          L17_2 = L17_2.find
          L18_2 = L15_2
          L19_2 = tostring
          L20_2 = A2_2
          L19_2 = L19_2(L20_2)
          L20_2 = "_Step:"
          L19_2 = L19_2 .. L20_2
          L20_2 = 1
          L21_2 = true
          L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
          L17_2 = nil ~= L17_2
          L18_2 = not A3_2
          if L17_2 and L18_2 then
            L19_2 = Vdist
            L20_2 = GetEntityCoords
            L21_2 = L16_2
            L20_2 = L20_2(L21_2)
            L21_2 = A0_2.x
            L22_2 = A0_2.y
            L23_2 = A0_2.z
            L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2)
            if L10_2 >= L19_2 then
              L19_2 = L38_1
              L20_2 = L16_2
              L19_2(L20_2)
              L19_2 = PrintDebug
              L20_2 = "Deleted entity:"
              L21_2 = L16_2
              L19_2(L20_2, L21_2)
              L19_2 = DoesEntityExist
              L20_2 = L16_2
              L19_2 = L19_2(L20_2)
              if L19_2 then
                L19_2 = PrintDebug
                L20_2 = "Delete the entity again!"
                L19_2(L20_2)
                L19_2 = L38_1
                L20_2 = L16_2
                L19_2(L20_2)
                L19_2 = DoesEntityExist
                L20_2 = L16_2
                L19_2 = L19_2(L20_2)
                if L19_2 then
                  L19_2 = PrintDebug
                  L20_2 = "Delete the entity again 2!"
                  L19_2(L20_2)
                  L19_2 = L38_1
                  L20_2 = L16_2
                  L19_2(L20_2)
                end
              end
              L19_2 = L6_1
              L19_2[L15_2] = nil
              L9_2 = true
              break
            end
          end
        end
      end
    end
    if L9_2 then
      return
    end
  end
end
L118_1(L119_1, L120_1)
function L118_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L2_2 = TriggerEvent
  L3_2 = "Pug:client:StopRobberySceneKeepAlive"
  L2_2(L3_2)
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
  L3_2 = L2_2.NetworkedAnimations
  if L3_2 then
    L3_2 = L2_2.NetworkedAnimations
    L3_2 = #L3_2
    if 1 == L3_2 then
      L3_2 = GetJewelryCases
      L4_2 = A0_2.propName
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L3_2 = Wait
        L4_2 = 300
        L3_2(L4_2)
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
            L3_2 = PrintDebug
            L4_2 = "Is creating a synced prop  for "
            L5_2 = A0_2.propName
            L4_2 = L4_2 .. L5_2
            L3_2(L4_2)
            if A1_2 then
              L3_2 = A1_2.LocalOnly
              if L3_2 then
                L3_2 = TriggerEvent
                L4_2 = "Pug:client:CreateSyncedProps"
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
      if A1_2 then
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
            L3_2 = GetTrollyProps
            L4_2 = A0_2.propName
            L3_2 = L3_2(L4_2)
            if L3_2 then
              L3_2 = TriggerEvent
              L4_2 = "Pug:client:CreateSyncedProps"
              L5_2 = A1_2.Coords
              L6_2 = A1_2.Rotation
              L7_2 = L2_2.NetworkedAnimations
              L7_2 = L7_2[1]
              L7_2 = L7_2.AnimDict
              L8_2 = A1_2.RobberyName
              L9_2 = A0_2.propName
              L10_2 = A1_2
              L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
              L3_2 = A1_2.LocalOnly
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
            end
          end
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
        L15_2 = IsVehicleModel
        L16_2 = A0_2.propName
        L15_2 = L15_2(L16_2)
        if not L15_2 then
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
              L15_2 = CreateThread
              function L16_2()
                local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
                L0_3 = A0_2.propName
                if "h4_prop_h4_safe_01a" == L0_3 then
                  L0_3 = Wait
                  L1_3 = 2000
                  L0_3(L1_3)
                end
                L0_3 = PrintDebug
                L1_3 = "Is creating a synced prop  for "
                L2_3 = A0_2.propName
                L1_3 = L1_3 .. L2_3
                L0_3(L1_3)
                L0_3 = GetTrollyProps
                L1_3 = A0_2.propName
                L0_3 = L0_3(L1_3)
                if not L0_3 then
                  L0_3 = A1_2
                  if L0_3 then
                    L0_3 = A1_2.LocalOnly
                    if L0_3 then
                      L0_3 = TriggerEvent
                      L1_3 = "Pug:client:CreateSyncedProps"
                      L2_3 = A1_2.Coords
                      L3_3 = A1_2.Rotation
                      L4_3 = L2_2.NetworkedAnimations
                      L4_3 = L4_3[1]
                      L4_3 = L4_3.AnimDict
                      L5_3 = A1_2.RobberyName
                      L6_3 = A0_2.propName
                      L7_3 = A1_2
                      L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
                  end
                  else
                    L0_3 = TriggerServerEvent
                    L1_3 = "Pug:server:CreateSyncedProps"
                    L2_3 = A1_2.Coords
                    L3_3 = A1_2.Rotation
                    L4_3 = L2_2.NetworkedAnimations
                    L4_3 = L4_3[1]
                    L4_3 = L4_3.AnimDict
                    L5_3 = A1_2.RobberyName
                    L6_3 = A0_2.propName
                    L7_3 = A1_2
                    L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
                  end
                end
              end
              L15_2(L16_2)
            end
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
L119_1 = RegisterNetEvent
L120_1 = "Pug:client:EndMultipleNetworkAnimation"
function L121_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L118_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:client:SetFakeDoorOpen"
function L121_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = pairs
  L3_2 = AllDoorData
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.Coords
    L8_2 = L8_2 - A0_2
    L8_2 = #L8_2
    L9_2 = 1.5
    if L8_2 < L9_2 then
      L9_2 = FreezeEntityPosition
      L10_2 = L6_2
      L11_2 = false
      L9_2(L10_2, L11_2)
      L9_2 = print
      L10_2 = "Door unlocked!"
      L11_2 = "success"
      L9_2(L10_2, L11_2)
      break
    end
  end
end
L119_1(L120_1, L121_1)
function L119_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "vector3" == L1_2 then
    return A0_2
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.x
    if L1_2 then
      L1_2 = A0_2.y
      if L1_2 then
        L1_2 = A0_2.z
        if L1_2 then
          L1_2 = vector3
          L2_2 = tonumber
          L3_2 = A0_2.x
          L2_2 = L2_2(L3_2)
          L3_2 = tonumber
          L4_2 = A0_2.y
          L3_2 = L3_2(L4_2)
          L4_2 = tonumber
          L5_2 = A0_2.z
          L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2(L5_2)
          return L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
        end
      end
    end
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "string" == L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.gsub
    L3_2 = "vector3"
    L4_2 = ""
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L2_2 = L1_2
    L1_2 = L1_2.gsub
    L3_2 = "[()%s]"
    L4_2 = ""
    L1_2 = L1_2(L2_2, L3_2, L4_2)
    L3_2 = L1_2
    L2_2 = L1_2.match
    L4_2 = "([^,]+),([^,]+),([^,]+)"
    L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
    if L2_2 and L3_2 and L4_2 then
      L5_2 = vector3
      L6_2 = tonumber
      L7_2 = L2_2
      L6_2 = L6_2(L7_2)
      L7_2 = tonumber
      L8_2 = L3_2
      L7_2 = L7_2(L8_2)
      L8_2 = tonumber
      L9_2 = L4_2
      L8_2, L9_2 = L8_2(L9_2)
      return L5_2(L6_2, L7_2, L8_2, L9_2)
    end
  end
  L1_2 = nil
  return L1_2
end
function L120_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = A0_2.type
    if "robabble_object" == L1_2 then
      L1_2 = A0_2.createExplosion
      if L1_2 then
        goto lbl_11
      end
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_11::
  L1_2 = A0_2.delayRewardCheckbox
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = tonumber
  L2_2 = A0_2.rewardDelayTime
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = 0
  end
  L1_2 = L1_2 > 0
  return L1_2
end
function L121_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = L119_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  if not A0_2 then
    return
  end
  L2_2 = GetHashKey
  L3_2 = "prop_c4_final_green"
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 3.0
  end
  L4_2 = PlayerProps
  L4_2 = #L4_2
  L5_2 = 1
  L6_2 = -1
  for L7_2 = L4_2, L5_2, L6_2 do
    L8_2 = PlayerProps
    L8_2 = L8_2[L7_2]
    if L8_2 then
      L9_2 = DoesEntityExist
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        L9_2 = GetEntityModel
        L10_2 = L8_2
        L9_2 = L9_2(L10_2)
        if L9_2 == L2_2 then
          L9_2 = GetEntityCoords
          L10_2 = L8_2
          L9_2 = L9_2(L10_2)
          L9_2 = L9_2 - A0_2
          L9_2 = #L9_2
          if L3_2 >= L9_2 then
            L9_2 = TriggerEvent
            L10_2 = "FullyDeleteRobberiesEntity"
            L11_2 = L8_2
            L9_2(L10_2, L11_2)
            L9_2 = table
            L9_2 = L9_2.remove
            L10_2 = PlayerProps
            L11_2 = L7_2
            L9_2(L10_2, L11_2)
          end
        end
      end
    end
  end
  L4_2 = ipairs
  L5_2 = GetGamePool
  L6_2 = "CObject"
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L5_2(L6_2)
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    if L9_2 then
      L10_2 = DoesEntityExist
      L11_2 = L9_2
      L10_2 = L10_2(L11_2)
      if L10_2 then
        L10_2 = GetEntityModel
        L11_2 = L9_2
        L10_2 = L10_2(L11_2)
        if L10_2 == L2_2 then
          L10_2 = GetEntityCoords
          L11_2 = L9_2
          L10_2 = L10_2(L11_2)
          L10_2 = L10_2 - A0_2
          L10_2 = #L10_2
          if L3_2 >= L10_2 then
            L10_2 = TriggerEvent
            L11_2 = "FullyDeleteRobberiesEntity"
            L12_2 = L9_2
            L10_2(L11_2, L12_2)
          end
        end
      end
    end
  end
end
function L122_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L119_1
  L2_2 = A0_2 or L2_2
  if A0_2 then
    L2_2 = A0_2.targetVector
  end
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = PrintDebug
    L3_2 = "Failed to parse targetVector"
    L2_2(L3_2)
    return
  end
  L2_2 = L121_1
  L3_2 = L1_2
  L4_2 = 3.0
  L2_2(L3_2, L4_2)
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:server:triggerExplosion"
  L4_2 = {}
  L5_2 = L1_2.x
  L4_2.x = L5_2
  L5_2 = L1_2.y
  L4_2.y = L5_2
  L5_2 = L1_2.z
  L4_2.z = L5_2
  L5_2 = 0
  L6_2 = 1.0
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
function L123_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L4_2 = nil
  L5_2 = Config
  L5_2 = L5_2.RobberyAnimations
  L6_2 = A0_2.animation
  L5_2 = L5_2[L6_2]
  if L5_2 then
    L5_2 = Config
    L5_2 = L5_2.RobberyAnimations
    L6_2 = A0_2.animation
    L4_2 = L5_2[L6_2]
  else
    L5_2 = Config
    L5_2 = L5_2.Animations
    L6_2 = tonumber
    L7_2 = A0_2.animation
    L6_2 = L6_2(L7_2)
    L4_2 = L5_2[L6_2]
  end
  L5_2 = A0_2.sendAlert
  if L5_2 then
    L5_2 = L26_1
    if not L5_2 then
      L5_2 = true
      L26_1 = L5_2
      L5_2 = AlertPolice
      L6_2 = A2_2
      L5_2(L6_2)
      L5_2 = CreateThread
      function L6_2()
        local L0_3, L1_3
        L0_3 = Wait
        L1_3 = 45000
        L0_3(L1_3)
        L0_3 = false
        L26_1 = L0_3
      end
      L5_2(L6_2)
    end
  end
  L5_2 = L4_2.NetworkedAnimations
  if L5_2 then
    L5_2 = A0_2.hackType
    if "none" ~= L5_2 then
      L5_2 = A0_2.propName
      if "h4_prop_h4_safe_01a" ~= L5_2 then
        L5_2 = Wait
        L6_2 = 2500
        L5_2(L6_2)
    end
    else
      L5_2 = GetJewelryCases
      L6_2 = A0_2.propName
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L5_2 = Wait
        L6_2 = 2500
        L5_2(L6_2)
      end
    end
    L5_2 = L118_1
    L6_2 = A0_2
    L7_2 = A3_2
    L5_2(L6_2, L7_2)
  else
    L5_2 = TriggerEvent
    L6_2 = "Pug:client:DoRobberiesAnimation"
    L7_2 = tonumber
    L8_2 = A0_2.animation
    L7_2 = L7_2(L8_2)
    L8_2 = PlayerPedId
    L8_2 = L8_2()
    L9_2 = A0_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = A0_2.triggersBlackout
  if L5_2 then
    L5_2 = A0_2.blackoutDuration
    if L5_2 then
      L5_2 = TriggerServerEvent
      L6_2 = "Pug:server:TriggerCityWideBlackout"
      L7_2 = tonumber
      L8_2 = A0_2.blackoutDuration
      L7_2 = L7_2(L8_2)
      L8_2 = tostring
      L9_2 = A1_2.heist_name
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L8_2(L9_2)
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      L5_2 = Notify
      L6_2 = Config
      L6_2 = L6_2.LangT
      L6_2 = L6_2.CityBlackoutStarted
      L7_2 = "success"
      L5_2(L6_2, L7_2)
    end
  end
  L5_2 = 0
  L6_2 = 0
  L7_2 = L4_2.IsNetWorkedScene
  if L7_2 then
    L7_2 = L4_2.AnimationOptions
    if L7_2 then
      L7_2 = L4_2.AnimationOptions
      L7_2 = L7_2.AttachWaitDuration
      if L7_2 then
        L7_2 = L4_2.AnimationOptions
        L5_2 = L7_2.AttachWaitDuration
      end
      L7_2 = L4_2.AnimationOptions
      L7_2 = L7_2.TimeUntilFreezePropPosition
      if L7_2 then
        L7_2 = L4_2.AnimationOptions
        L6_2 = L7_2.TimeUntilFreezePropPosition
      end
    end
    L7_2 = GetJewelryCases
    L8_2 = A0_2.propName
    L7_2 = L7_2(L8_2)
    if not L7_2 then
      L7_2 = Wait
      L8_2 = 1500
      L7_2(L8_2)
    end
  end
  L7_2 = Wait
  L8_2 = L6_2 + L5_2
  L7_2(L8_2)
  L7_2 = A0_2.unlockTime
  if not L7_2 then
    L7_2 = 0
  end
  A0_2.unlockTime = L7_2
  L7_2 = type
  L8_2 = A0_2.unlockTime
  L7_2 = L7_2(L8_2)
  if "string" == L7_2 then
    L7_2 = tonumber
    L8_2 = A0_2.unlockTime
    L7_2 = L7_2(L8_2)
    A0_2.unlockTime = L7_2
  end
  L7_2 = Config
  L7_2 = L7_2.LangT
  L7_2 = L7_2.DoorWillOpen
  L8_2 = A0_2.createExplosion
  if L8_2 then
    L8_2 = Config
    L8_2 = L8_2.LangT
    L7_2 = L8_2.ExplosionGoingOffIn
  end
  L8_2 = A0_2.unlockTime
  if L8_2 then
    L8_2 = math
    L8_2 = L8_2.ceil
    L9_2 = A0_2.unlockTime
    L9_2 = L9_2 * 1000
    L8_2 = L8_2(L9_2)
    L9_2 = 3000
    if L8_2 > L9_2 then
      L8_2 = math
      L8_2 = L8_2.ceil
      L9_2 = A0_2.unlockTime
      L9_2 = L9_2 * 1000
      L8_2 = L8_2(L9_2)
      L8_2 = L8_2 - 3000
      A0_2.unlockTime = L8_2
      L8_2 = A0_2.unlockTime
      L9_2 = 5000
      if L8_2 >= L9_2 then
        L8_2 = A0_2.unlockTime
        L8_2 = L8_2 / 1000
        L9_2 = Notify
        L10_2 = Config
        L10_2 = L10_2.T
        L11_2 = "DoorEventInSeconds"
        L12_2 = L7_2
        L13_2 = L8_2
        L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L10_2(L11_2, L12_2, L13_2)
        L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      end
    else
      L8_2 = math
      L8_2 = L8_2.ceil
      L9_2 = A0_2.unlockTime
      L9_2 = L9_2 * 1000
      L8_2 = L8_2(L9_2)
      A0_2.unlockTime = L8_2
    end
  end
  L8_2 = L4_2.ReplaceProp
  if not L8_2 then
    L8_2 = L4_2.NetworkedAnimations
    if not L8_2 then
      L8_2 = Config
      L8_2 = L8_2.Debug
      if L8_2 then
        L8_2 = print
        L9_2 = "CLEAR TASK"
        L8_2(L9_2)
      end
      L8_2 = TriggerEvent
      L9_2 = "Pug:client:StopRobberySceneKeepAlive"
      L8_2(L9_2)
      L8_2 = ClearPedTasksImmediately
      L9_2 = PlayerPedId
      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L9_2()
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      L8_2 = ReloadSkin
      L8_2()
    end
  end
  L8_2 = Wait
  L9_2 = A0_2.unlockTime
  L8_2(L9_2)
  L8_2 = A0_2.doorId
  if L8_2 then
    L8_2 = A0_2.doorId
    if "" ~= L8_2 then
      L8_2 = A0_2.doorId
      if " " ~= L8_2 then
        goto lbl_225
      end
    end
  end
  L8_2 = A0_2.createExplosion
  ::lbl_225::
  if L8_2 then
    L8_2 = A0_2.type
    if "hackable_door" == L8_2 then
      L8_2 = A0_2.unlockTime
      L9_2 = 3000
      if L8_2 >= L9_2 then
        L8_2 = Notify
        L9_2 = Config
        L9_2 = L9_2.T
        L10_2 = "DoorCountdown"
        L11_2 = L7_2
        L12_2 = 3
        L13_2 = "..."
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        L8_2 = Wait
        L9_2 = 1000
        L8_2(L9_2)
      end
      L8_2 = A0_2.unlockTime
      L9_2 = 2000
      if L8_2 >= L9_2 then
        L8_2 = Notify
        L9_2 = Config
        L9_2 = L9_2.T
        L10_2 = "DoorCountdown"
        L11_2 = L7_2
        L12_2 = 2
        L13_2 = ".."
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        L8_2 = Wait
        L9_2 = 1000
        L8_2(L9_2)
      end
      L8_2 = A0_2.unlockTime
      L9_2 = 1000
      if L8_2 >= L9_2 then
        L8_2 = Notify
        L9_2 = Config
        L9_2 = L9_2.T
        L10_2 = "DoorCountdown"
        L11_2 = L7_2
        L12_2 = 1
        L13_2 = "."
        L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        L8_2 = Wait
        L9_2 = 1000
        L8_2(L9_2)
      end
    end
  end
  L8_2 = tostring
  L9_2 = A0_2.doorPosition
  L8_2 = L8_2(L9_2)
  L10_2 = L8_2
  L9_2 = L8_2.match
  L11_2 = "([^,]+),%s*([^,]+),%s*([^,]+)"
  L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
  L12_2 = A0_2.doorPosition
  if "" ~= L12_2 then
    L12_2 = A0_2.doorPosition
    if " " ~= L12_2 then
      L12_2 = A0_2.doorPosition
      if L12_2 then
        L12_2 = vector3
        L13_2 = tonumber
        L14_2 = L9_2
        L13_2 = L13_2(L14_2)
        L14_2 = tonumber
        L15_2 = L10_2
        L14_2 = L14_2(L15_2)
        L15_2 = tonumber
        L16_2 = L11_2
        L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L15_2(L16_2)
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        A0_2.doorPosition = L12_2
    end
  end
  else
    L12_2 = GetEntityCoords
    L13_2 = PlayerPedId
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L13_2()
    L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
    A0_2.doorPosition = L12_2
  end
  L12_2 = A0_2.lasers
  if L12_2 then
    L12_2 = A0_2.lasers
    L12_2 = #L12_2
    if L12_2 > 0 then
      L12_2 = TriggerServerEvent
      L13_2 = "Pug:server:SetLasersOffForEveryone"
      L14_2 = A1_2.heist_name
      L15_2 = tonumber
      L16_2 = A0_2.stepNumber
      L15_2 = L15_2(L16_2)
      L16_2 = A2_2.robberyCooldown
      L12_2(L13_2, L14_2, L15_2, L16_2)
      L12_2 = Notify
      L13_2 = Config
      L13_2 = L13_2.LangT
      L13_2 = L13_2.LasersTurnedOff
      L14_2 = "success"
      L12_2(L13_2, L14_2)
    end
  end
  L12_2 = A0_2.createExplosion
  if L12_2 then
    L12_2 = L120_1
    L13_2 = A0_2
    L12_2 = L12_2(L13_2)
    if not L12_2 then
      L12_2 = L122_1
      L13_2 = A0_2
      L12_2(L13_2)
    end
  end
  L12_2 = A0_2.doorId
  if L12_2 then
    L12_2 = false
    L13_2 = A0_2.doorPosition
    if L13_2 then
      L13_2 = type
      L14_2 = A0_2.doorPosition
      L13_2 = L13_2(L14_2)
      if "string" == L13_2 then
        L13_2 = A0_2.doorPosition
        L14_2 = L13_2
        L13_2 = L13_2.match
        L15_2 = "([^,]+),%s*([^,]+),%s*([^,]+)"
        L13_2, L14_2, L15_2 = L13_2(L14_2, L15_2)
        if L13_2 and L14_2 and L15_2 then
          L16_2 = vector3
          L17_2 = tonumber
          L18_2 = L13_2
          L17_2 = L17_2(L18_2)
          L18_2 = tonumber
          L19_2 = L14_2
          L18_2 = L18_2(L19_2)
          L19_2 = tonumber
          L20_2 = L15_2
          L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L19_2(L20_2)
          L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
          A0_2.doorPosition = L16_2
        else
          L16_2 = print
          L17_2 = "Invalid stage.doorPosition format"
          L16_2(L17_2)
          L16_2 = GetEntityCoords
          L17_2 = PlayerPedId
          L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2()
          L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
          A0_2.doorPosition = L16_2
        end
      end
      L13_2 = pairs
      L14_2 = AllDoorData
      L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
      for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
        L19_2 = L18_2.Coords
        L20_2 = A0_2.doorPosition
        L19_2 = L19_2 - L20_2
        L19_2 = #L19_2
        L20_2 = 1.5
        if L19_2 < L20_2 then
          L12_2 = true
          L20_2 = TriggerServerEvent
          L21_2 = "Pug:server:SetDoorLockStatus"
          L22_2 = A0_2.doorPosition
          L23_2 = L18_2.Prop
          L24_2 = true
          L20_2(L21_2, L22_2, L23_2, L24_2)
          L20_2 = TriggerServerEvent
          L21_2 = "Pug:server:SetStepOnCoolDown"
          L22_2 = A1_2.heist_name
          L23_2 = L18_2.StageNumber
          L24_2 = A2_2.robberyCooldown
          L20_2(L21_2, L22_2, L23_2, L24_2)
          break
        end
      end
      if not L12_2 then
        L13_2 = print
        L14_2 = "Door not found for stage.doorPosition"
        L13_2(L14_2)
      end
    end
    if not L12_2 then
      L13_2 = OpenBankDoor
      L14_2 = A1_2
      L15_2 = tonumber
      L16_2 = A0_2.stepNumber
      L15_2 = L15_2(L16_2)
      L16_2 = A0_2.doorPosition
      L13_2(L14_2, L15_2, L16_2)
      L13_2 = TriggerServerEvent
      L14_2 = "Pug:server:SetDoorLockStatus"
      L15_2 = tonumber
      L16_2 = A0_2.doorId
      L15_2 = L15_2(L16_2)
      L16_2 = false
      L13_2(L14_2, L15_2, L16_2)
    end
  end
  L12_2 = A0_2.xpOptions
  if L12_2 then
    L12_2 = tonumber
    L13_2 = A0_2.xpRewardAmount
    L12_2 = L12_2(L13_2)
    if not L12_2 then
      L12_2 = 0
    end
    if L12_2 > 0 then
      L13_2 = TriggerServerEvent
      L14_2 = "Pug:Server:ToggleRobberyRep"
      L15_2 = L12_2
      L13_2(L14_2, L15_2)
      L13_2 = Notify
      L14_2 = Config
      L14_2 = L14_2.T
      L15_2 = "XPReceivedAmount"
      L16_2 = L12_2
      L14_2 = L14_2(L15_2, L16_2)
      L15_2 = "success"
      L13_2(L14_2, L15_2)
    end
  end
  L12_2 = A0_2.delayRewardCheckbox
  if L12_2 then
    L12_2 = A0_2.rewardDelayTime
    if L12_2 then
      L12_2 = TriggerServerEvent
      L13_2 = "Pug:server:CreateRewardTarget"
      L14_2 = A0_2
      L15_2 = A1_2
      L12_2(L13_2, L14_2, L15_2)
  end
  else
    L12_2 = A0_2.propName
    if "ch_prop_gold_trolly_01a" ~= L12_2 then
      L12_2 = A0_2.propName
      if "ch_prop_cash_low_trolly_01a" ~= L12_2 then
        L12_2 = A0_2.propName
        if "ch_prop_diamond_trolly_01a" ~= L12_2 then
          L12_2 = A0_2.propName
          if "imp_prop_impexp_coke_trolly" ~= L12_2 then
            L12_2 = A0_2.rewardItems
            if L12_2 then
              L12_2 = type
              L13_2 = A0_2.rewardItems
              L12_2 = L12_2(L13_2)
              if "table" == L12_2 then
                L12_2 = pairs
                L13_2 = A0_2.rewardItems
                L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
                for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
                  L18_2 = L17_2.itemName
                  if L18_2 then
                    L18_2 = L17_2.minAmount
                    if L18_2 then
                      L18_2 = L17_2.maxAmount
                      if L18_2 then
                        L18_2 = L17_2.rewardChance
                        if L18_2 then
                          L18_2 = tonumber
                          L19_2 = L17_2.minAmount
                          L18_2 = L18_2(L19_2)
                          L19_2 = tonumber
                          L20_2 = L17_2.maxAmount
                          L19_2 = L19_2(L20_2)
                          L20_2 = tonumber
                          L21_2 = L17_2.rewardChance
                          L20_2 = L20_2(L21_2)
                          if L18_2 and L19_2 and L18_2 <= L19_2 and L20_2 and L20_2 >= 0 and L20_2 <= 100 then
                            L21_2 = math
                            L21_2 = L21_2.random
                            L22_2 = 1
                            L23_2 = 100
                            L21_2 = L21_2(L22_2, L23_2)
                            if L20_2 >= L21_2 then
                              L22_2 = A0_2.propName
                              if "h4_prop_h4_glass_disp_01a" ~= L22_2 then
                                L22_2 = GetPaintingProps
                                L23_2 = A0_2.propName
                                L22_2 = L22_2(L23_2)
                                if not L22_2 then
                                  goto lbl_544
                                end
                              end
                              L22_2 = Wait
                              L23_2 = 10000
                              L22_2(L23_2)
                              ::lbl_544::
                              L22_2 = math
                              L22_2 = L22_2.random
                              L23_2 = L18_2
                              L24_2 = L19_2
                              L22_2 = L22_2(L23_2, L24_2)
                              TokenIsUseable = true
                              L23_2 = HandleItems
                              L24_2 = true
                              L25_2 = tostring
                              L26_2 = L17_2.itemName
                              L25_2 = L25_2(L26_2)
                              L26_2 = L22_2
                              L27_2 = {}
                              L28_2 = A1_2.heist_name
                              L27_2.heistName = L28_2
                              L28_2 = A0_2.stepNumber
                              L27_2.stepNumber = L28_2
                              L27_2.rewardContext = "step_reward_item"
                              L23_2(L24_2, L25_2, L26_2, L27_2)
                              TokenIsUseable = false
                            else
                              L22_2 = Config
                              L22_2 = L22_2.Debug
                              if L22_2 then
                                L22_2 = Notify
                                L23_2 = Config
                                L23_2 = L23_2.T
                                L24_2 = "RewardNotGivenDueToChance"
                                L25_2 = tostring
                                L26_2 = L17_2.itemName
                                L25_2, L26_2, L27_2, L28_2 = L25_2(L26_2)
                                L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
                                L24_2 = "error"
                                L22_2(L23_2, L24_2)
                              end
                            end
                          else
                            L21_2 = Notify
                            L22_2 = Config
                            L22_2 = L22_2.T
                            L23_2 = "InvalidAmountOrChanceItem"
                            L24_2 = tostring
                            L25_2 = L17_2.itemName
                            L24_2, L25_2, L26_2, L27_2, L28_2 = L24_2(L25_2)
                            L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
                            L23_2 = "error"
                            L21_2(L22_2, L23_2)
                          end
                      end
                    end
                  end
                  else
                    L18_2 = Notify
                    L19_2 = Config
                    L19_2 = L19_2.LangT
                    L19_2 = L19_2.MissingRewardDetails
                    L20_2 = "error"
                    L18_2(L19_2, L20_2)
                  end
                end
              end
            end
          end
        end
      end
    end
    L12_2 = A0_2.rewardMoney
    if L12_2 then
      L12_2 = tonumber
      L13_2 = A0_2.rewardMoneyMin
      L12_2 = L12_2(L13_2)
      L13_2 = tonumber
      L14_2 = A0_2.rewardMoneyMax
      L13_2 = L13_2(L14_2)
      if L12_2 and L13_2 and L12_2 <= L13_2 then
        L14_2 = math
        L14_2 = L14_2.random
        L15_2 = L12_2
        L16_2 = L13_2
        L14_2 = L14_2(L15_2, L16_2)
        L15_2 = A0_2.rewardMoneyType
        TokenIsUseable = true
        L16_2 = HandleMoney
        L17_2 = L15_2
        L18_2 = L14_2
        L19_2 = A1_2.heist_name
        L20_2 = A0_2.stepNumber
        L21_2 = "step_reward_money"
        L16_2(L17_2, L18_2, L19_2, L20_2, L21_2)
        TokenIsUseable = false
      else
        L14_2 = Notify
        L15_2 = Config
        L15_2 = L15_2.T
        L16_2 = "MinGreaterThanMaxForStep"
        L17_2 = tostring
        L18_2 = A0_2.stepNumber
        L17_2 = L17_2(L18_2)
        L18_2 = A1_2.heist_name
        L15_2 = L15_2(L16_2, L17_2, L18_2)
        L16_2 = "error"
        L14_2(L15_2, L16_2)
      end
    end
  end
  L12_2 = A0_2.blackout
  if L12_2 then
    L12_2 = TriggerEvent
    L13_2 = "heist:client:triggerBlackout"
    L14_2 = A0_2.blackoutDuration
    if not L14_2 then
      L14_2 = 60
    end
    L12_2(L13_2, L14_2)
  end
  L12_2 = L113_1
  L13_2 = A0_2
  L14_2 = A1_2
  L12_2(L13_2, L14_2)
  L12_2 = tonumber
  L13_2 = A0_2.stepNumber
  L12_2 = L12_2(L13_2)
  L13_2 = L12_2 + 1
  L14_2 = false
  L15_2 = pairs
  L16_2 = json
  L16_2 = L16_2.decode
  L17_2 = A1_2.stages
  L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L16_2(L17_2)
  L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
  for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
    L21_2 = tonumber
    L22_2 = L20_2.stepNumber
    L21_2 = L21_2(L22_2)
    if L21_2 == L13_2 then
      L14_2 = true
      L22_2 = L20_2.type
      if "guards" == L22_2 then
        L22_2 = TriggerServerEvent
        L23_2 = "Pug:server:SetStepOnCoolDown"
        L24_2 = A1_2.heist_name
        L25_2 = tonumber
        L26_2 = L21_2
        L25_2 = L25_2(L26_2)
        L26_2 = A2_2.robberyCooldown
        L22_2(L23_2, L24_2, L25_2, L26_2)
        L22_2 = TriggerServerEvent
        L23_2 = "Pug:server:CreateRobberyGuards"
        L24_2 = L20_2
        L25_2 = A2_2.robberyCooldown
        L26_2 = A1_2.heist_name
        L22_2(L23_2, L24_2, L25_2, L26_2)
        break
      end
      L22_2 = L20_2.type
      if "hidden_passcode" == L22_2 then
        L22_2 = TriggerServerEvent
        L23_2 = "Pug:server:SetStepOnCoolDown"
        L24_2 = A1_2.heist_name
        L25_2 = tonumber
        L26_2 = L21_2
        L25_2 = L25_2(L26_2)
        L26_2 = A2_2.robberyCooldown
        L22_2(L23_2, L24_2, L25_2, L26_2)
        break
      end
      L22_2 = L20_2.type
      if "toxic_gas" == L22_2 then
        L22_2 = TriggerServerEvent
        L23_2 = "Pug:server:SetStepOnCoolDown"
        L24_2 = A1_2.heist_name
        L25_2 = tonumber
        L26_2 = L21_2
        L25_2 = L25_2(L26_2)
        L26_2 = A2_2.robberyCooldown
        L22_2(L23_2, L24_2, L25_2, L26_2)
        L22_2 = TriggerServerEvent
        L23_2 = "Pug:server:StartToxicGasForEveryone"
        L24_2 = L20_2
        L25_2 = A2_2.robberyCooldown
        L22_2(L23_2, L24_2, L25_2)
        break
      end
      L22_2 = L20_2.type
      if "ending_robbery" == L22_2 then
        L22_2 = TriggerServerEvent
        L23_2 = "Pug:server:SetStepOnCoolDown"
        L24_2 = A1_2.heist_name
        L25_2 = tonumber
        L26_2 = L21_2
        L25_2 = L25_2(L26_2)
        L26_2 = A2_2.robberyCooldown
        L22_2(L23_2, L24_2, L25_2, L26_2)
        L22_2 = CompleteRobberyScene
        L23_2 = L20_2
        L24_2 = A1_2.heist_name
        L22_2(L23_2, L24_2)
      end
      break
    end
  end
  if not L14_2 then
    L15_2 = TriggerServerEvent
    L16_2 = "Pug:server:TrackHeistRunCompleted"
    L17_2 = A1_2.heist_name
    L15_2(L16_2, L17_2)
  end
end
function L124_1(A0_2)
  local L1_2, L2_2
  L1_2 = RequestNamedPtfxAsset
  L2_2 = A0_2
  L1_2(L2_2)
  while true do
    L1_2 = HasNamedPtfxAssetLoaded
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
end
L125_1 = RegisterNetEvent
L126_1 = "Pug:client:RobberyRemoveTargetForEveryone"
function L127_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetResourceState
  L2_2 = "RevoInteract"
  L1_2 = L1_2(L2_2)
  if "started" ~= L1_2 then
    L1_2 = Config
    L1_2 = L1_2.Target
    if L1_2 then
      L1_2 = Config
      L1_2 = L1_2.DrawTextInsteadOfTarget
      if not L1_2 then
        goto lbl_34
      end
    end
  end
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = "%s+"
  L4_2 = ""
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = GetResourceState
  L3_2 = "RevoInteract"
  L2_2 = L2_2(L3_2)
  if "started" == L2_2 then
    L2_2 = exports
    L2_2 = L2_2.RevoInteract
    L3_2 = L2_2
    L2_2 = L2_2.CloseHelp
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
  else
    L2_2 = HideTextOption
    L2_2()
  end
  L2_2 = L13_1
  L2_2[A0_2] = nil
  goto lbl_51
  ::lbl_34::
  L1_2 = Config
  L1_2 = L1_2.Target
  if "ox_target" == L1_2 then
    L1_2 = exports
    L1_2 = L1_2.ox_target
    L2_2 = L1_2
    L1_2 = L1_2.removeZone
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  else
    L1_2 = exports
    L2_2 = Config
    L2_2 = L2_2.Target
    L1_2 = L1_2[L2_2]
    L2_2 = L1_2
    L1_2 = L1_2.RemoveZone
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
  end
  ::lbl_51::
end
L125_1(L126_1, L127_1)
L125_1 = RegisterNetEvent
L126_1 = "Pug:client:CreateRewardTarget"
function L127_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = tostring
  L4_2 = A1_2.heist_name
  L5_2 = "_reward_"
  L6_2 = tostring
  L7_2 = A0_2.stepNumber
  L6_2 = L6_2(L7_2)
  L4_2 = L4_2 .. L5_2 .. L6_2
  L3_2 = L3_2(L4_2)
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = TriggerServerEvent
    L1_3 = "Pug:server:ClaimDelayedReward"
    L2_3 = tostring
    L3_3 = A1_2.heist_name
    L2_3 = L2_3(L3_3)
    L3_3 = tonumber
    L4_3 = A0_2.stepNumber
    L3_3 = L3_3(L4_3)
    L4_3 = L3_2
    L0_3(L1_3, L2_3, L3_3, L4_3)
  end
  L5_2 = nil
  L6_2 = Config
  L6_2 = L6_2.Target
  if "ox_target" == L6_2 then
    L6_2 = {}
    L7_2 = {}
    L7_2.name = L3_2
    L7_2.icon = "fas fa-box-open"
    L7_2.label = "Grab Items"
    L7_2.onSelect = L4_2
    L6_2[1] = L7_2
    L5_2 = L6_2
    L6_2 = exports
    L6_2 = L6_2.ox_target
    L7_2 = L6_2
    L6_2 = L6_2.addSphereZone
    L8_2 = {}
    L8_2.name = L3_2
    L8_2.coords = A2_2
    L8_2.radius = 0.5
    L9_2 = Config
    L9_2 = L9_2.Debug
    L8_2.debug = L9_2
    L8_2.options = L5_2
    L6_2(L7_2, L8_2)
  else
    L6_2 = {}
    L7_2 = {}
    L7_2.name = L3_2
    L7_2.icon = "fas fa-box-open"
    L7_2.label = "Grab Items"
    L7_2.action = L4_2
    L6_2[1] = L7_2
    L5_2 = L6_2
    L6_2 = exports
    L7_2 = Config
    L7_2 = L7_2.Target
    L6_2 = L6_2[L7_2]
    L7_2 = L6_2
    L6_2 = L6_2.AddCircleZone
    L8_2 = L3_2
    L9_2 = A2_2
    L10_2 = 0.5
    L11_2 = {}
    L11_2.name = L3_2
    L12_2 = Config
    L12_2 = L12_2.Debug
    L11_2.debugPoly = L12_2
    L11_2.useZ = true
    L12_2 = {}
    L12_2.options = L5_2
    L12_2.distance = 1.5
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
end
L125_1(L126_1, L127_1)
L125_1 = RegisterNetEvent
L126_1 = "Pug:client:StartToxicGasForEveryone"
function L127_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2
  if "" == A1_2 or " " == A1_2 then
    A1_2 = 1
  end
  L2_2 = A1_2 * 60000
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  L4_2 = nil
  L5_2 = pairs
  L6_2 = A0_2.toxicGas
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = tostring
    L12_2 = L10_2.gasVector
    L11_2 = L11_2(L12_2)
    L13_2 = L11_2
    L12_2 = L11_2.match
    L14_2 = "([^,]+),%s*([^,]+),%s*([^,]+)"
    L12_2, L13_2, L14_2 = L12_2(L13_2, L14_2)
    L15_2 = vector3
    L16_2 = tonumber
    L17_2 = L12_2
    L16_2 = L16_2(L17_2)
    L17_2 = tonumber
    L18_2 = L13_2
    L17_2 = L17_2(L18_2)
    L18_2 = tonumber
    L19_2 = L14_2
    L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2 = L18_2(L19_2)
    L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
    L16_2 = tonumber
    L17_2 = L10_2.gasSize
    L16_2 = L16_2(L17_2)
    L17_2 = tonumber
    L18_2 = L10_2.gasDamage
    L17_2 = L17_2(L18_2)
    L18_2 = PrintDebug
    L19_2 = L16_2
    L20_2 = "gasSize"
    L18_2(L19_2, L20_2)
    L18_2 = L124_1
    L19_2 = "core"
    L18_2(L19_2)
    L18_2 = UseParticleFxAssetNextCall
    L19_2 = "core"
    L18_2(L19_2)
    L18_2 = StartParticleFxLoopedAtCoord
    L19_2 = "exp_grd_grenade_smoke"
    L20_2 = L15_2.x
    L21_2 = L15_2.y
    L22_2 = L15_2.z
    L23_2 = 0.0
    L24_2 = 0.0
    L25_2 = 0.0
    L26_2 = L16_2
    L27_2 = false
    L28_2 = false
    L29_2 = false
    L30_2 = false
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2)
    L19_2 = CreateThread
    function L20_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
      L0_3 = PlayerPedId
      L0_3 = L0_3()
      L1_3 = GetEntityCoords
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      L2_3 = 1000
      L3_3 = L16_2
      L3_3 = L3_3 * 2.5
      while true do
        L4_3 = Wait
        L5_3 = L2_3
        L4_3(L5_3)
        L4_3 = GetGameTimer
        L4_3 = L4_3()
        L5_3 = L3_2
        L5_3 = L4_3 - L5_3
        L6_3 = L2_2
        if L5_3 >= L6_3 then
          L5_3 = PrintDebug
          L6_3 = "Robbery cooldown has ended."
          L5_3(L6_3)
          L5_3 = StopParticleFxLooped
          L6_3 = L18_2
          L7_3 = false
          L5_3(L6_3, L7_3)
          break
        end
        L5_3 = GetEntityCoords
        L6_3 = L0_3
        L5_3 = L5_3(L6_3)
        L1_3 = L5_3
        L5_3 = vector3
        L6_3 = L15_2.x
        L7_3 = L15_2.y
        L8_3 = L15_2.z
        L5_3 = L5_3(L6_3, L7_3, L8_3)
        L5_3 = L1_3 - L5_3
        L5_3 = #L5_3
        if L3_3 >= L5_3 then
          L6_3 = L20_1
          if not L6_3 then
            L6_3 = ApplyDamageToPed
            L7_3 = L0_3
            L8_3 = L17_2
            L9_3 = false
            L6_3(L7_3, L8_3, L9_3)
            L6_3 = PrintDebug
            L7_3 = "Taking damage from toxic gas: "
            L8_3 = L17_2
            L6_3(L7_3, L8_3)
            L6_3 = loadAnimDict
            L7_3 = "timetable@gardener@smoking_joint"
            L6_3(L7_3)
            L6_3 = IsEntityPlayingAnim
            L7_3 = PlayerPedId
            L7_3 = L7_3()
            L8_3 = "timetable@gardener@smoking_joint"
            L9_3 = "idle_cough"
            L10_3 = 3
            L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3)
            if not L6_3 then
              L6_3 = TaskPlayAnim
              L7_3 = PlayerPedId
              L7_3 = L7_3()
              L8_3 = "timetable@gardener@smoking_joint"
              L9_3 = "idle_cough"
              L10_3 = 8.0
              L11_3 = -8.0
              L12_3 = -1
              L13_3 = 49
              L14_3 = 0
              L15_3 = false
              L16_3 = false
              L17_3 = false
              L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)
            end
            L6_3 = SetTimecycleModifier
            L7_3 = "dying"
            L6_3(L7_3)
            L6_3 = SetTimecycleModifierStrength
            L7_3 = 0.5
            L6_3(L7_3)
            L6_3 = L4_2
            if not L6_3 then
              L6_3 = L9_2
              L4_2 = L6_3
            end
          else
            L6_3 = GetTimecycleModifierIndex
            L6_3 = L6_3()
            if -1 ~= L6_3 then
              L6_3 = ClearTimecycleModifier
              L6_3()
            end
          end
        else
          L6_3 = L4_2
          if L6_3 then
            L6_3 = L4_2
            L7_3 = L9_2
            if L6_3 == L7_3 then
              L6_3 = false
              L4_2 = L6_3
              L6_3 = GetTimecycleModifierIndex
              L6_3 = L6_3()
              if -1 ~= L6_3 then
                L6_3 = ClearTimecycleModifier
                L6_3()
              end
            end
          end
        end
      end
    end
    L19_2(L20_2)
  end
end
L125_1(L126_1, L127_1)
L125_1 = RegisterNetEvent
L126_1 = "Pug:client:UseGasMaskItem"
function L127_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L0_2 = "v_ret_gc_gasmask"
  L1_2 = "mp_masks@on_foot"
  L2_2 = "put_on_mask"
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = GetEntityCoords
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = 0
  L6_2 = 1
  L7_2 = L20_1
  if not L7_2 then
    L7_2 = GetPedDrawableVariation
    L8_2 = L3_2
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    if 0 ~= L7_2 then
      L24_1 = L7_2
      L8_2 = GetPedTextureVariation
      L9_2 = L3_2
      L10_2 = L6_2
      L8_2 = L8_2(L9_2, L10_2)
      L25_1 = L8_2
      L8_2 = SetPedComponentVariation
      L9_2 = L3_2
      L10_2 = L6_2
      L11_2 = 0
      L12_2 = 0
      L13_2 = 2
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
      L8_2 = PrintDebug
      L9_2 = "Existing mask removed and saved."
      L8_2(L9_2)
    else
      L8_2 = nil
      L24_1 = L8_2
      L8_2 = nil
      L25_1 = L8_2
    end
    L8_2 = GetPedPropIndex
    L9_2 = L3_2
    L10_2 = L5_2
    L8_2 = L8_2(L9_2, L10_2)
    if -1 ~= L8_2 then
      L22_1 = L8_2
      L9_2 = GetPedPropTextureIndex
      L10_2 = L3_2
      L11_2 = L5_2
      L9_2 = L9_2(L10_2, L11_2)
      L23_1 = L9_2
      L9_2 = ClearPedProp
      L10_2 = L3_2
      L11_2 = L5_2
      L9_2(L10_2, L11_2)
      L9_2 = PrintDebug
      L10_2 = "Hat removed and saved."
      L9_2(L10_2)
    else
      L9_2 = nil
      L22_1 = L9_2
      L9_2 = nil
      L23_1 = L9_2
    end
    L9_2 = ClearPedTasks
    L10_2 = L3_2
    L9_2(L10_2)
    L9_2 = RequestModel
    L10_2 = L0_2
    L9_2(L10_2)
    while true do
      L9_2 = HasModelLoaded
      L10_2 = L0_2
      L9_2 = L9_2(L10_2)
      if L9_2 then
        break
      end
      L9_2 = Wait
      L10_2 = 0
      L9_2(L10_2)
    end
    L9_2 = loadAnimDict
    L10_2 = L1_2
    L9_2(L10_2)
    L9_2 = TaskPlayAnim
    L10_2 = L3_2
    L11_2 = L1_2
    L12_2 = L2_2
    L13_2 = 8.0
    L14_2 = -8.0
    L15_2 = -1
    L16_2 = 49
    L17_2 = 0
    L18_2 = false
    L19_2 = false
    L20_2 = false
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L9_2 = Wait
    L10_2 = 400
    L9_2(L10_2)
    L9_2 = CreateObject
    L10_2 = GetHashKey
    L11_2 = L0_2
    L10_2 = L10_2(L11_2)
    L11_2 = L4_2.x
    L12_2 = L4_2.y
    L13_2 = L4_2.z
    L14_2 = true
    L15_2 = true
    L16_2 = false
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    L21_1 = L9_2
    L9_2 = SetEntityCollision
    L10_2 = L21_1
    L11_2 = false
    L12_2 = false
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = AttachEntityToEntity
    L10_2 = L21_1
    L11_2 = L3_2
    L12_2 = GetPedBoneIndex
    L13_2 = L3_2
    L14_2 = 12844
    L12_2 = L12_2(L13_2, L14_2)
    L13_2 = 0.05
    L14_2 = 0.075
    L15_2 = 0.01
    L16_2 = 175.0
    L17_2 = 90.0
    L18_2 = 340.0
    L19_2 = false
    L20_2 = false
    L21_2 = false
    L22_2 = false
    L23_2 = 2
    L24_2 = true
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
    L9_2 = Wait
    L10_2 = 100
    L9_2(L10_2)
    L9_2 = ClearPedTasks
    L10_2 = L3_2
    L9_2(L10_2)
    L9_2 = true
    L20_1 = L9_2
    L9_2 = PrintDebug
    L10_2 = "Mask added."
    L9_2(L10_2)
    L9_2 = CreateThread
    function L10_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
      while true do
        L0_3 = L20_1
        if not L0_3 then
          break
        end
        L0_3 = DoesEntityExist
        L1_3 = L21_1
        L0_3 = L0_3(L1_3)
        if not L0_3 then
          L0_3 = PlayerPedId
          L0_3 = L0_3()
          L3_2 = L0_3
          L0_3 = GetEntityCoords
          L1_3 = L3_2
          L0_3 = L0_3(L1_3)
          L4_2 = L0_3
          L0_3 = CreateObject
          L1_3 = GetHashKey
          L2_3 = L0_2
          L1_3 = L1_3(L2_3)
          L2_3 = L4_2.x
          L3_3 = L4_2.y
          L4_3 = L4_2.z
          L5_3 = true
          L6_3 = true
          L7_3 = false
          L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
          L21_1 = L0_3
          L0_3 = SetEntityCollision
          L1_3 = L21_1
          L2_3 = false
          L3_3 = false
          L0_3(L1_3, L2_3, L3_3)
          L0_3 = AttachEntityToEntity
          L1_3 = L21_1
          L2_3 = L3_2
          L3_3 = GetPedBoneIndex
          L4_3 = L3_2
          L5_3 = 12844
          L3_3 = L3_3(L4_3, L5_3)
          L4_3 = 0.05
          L5_3 = 0.075
          L6_3 = 0.01
          L7_3 = 175.0
          L8_3 = 90.0
          L9_3 = 340.0
          L10_3 = false
          L11_3 = false
          L12_3 = false
          L13_3 = false
          L14_3 = 2
          L15_3 = true
          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
        end
        L0_3 = Wait
        L1_3 = 1000
        L0_3(L1_3)
      end
    end
    L9_2(L10_2)
  else
    L7_2 = TaskPlayAnim
    L8_2 = L3_2
    L9_2 = L1_2
    L10_2 = L2_2
    L11_2 = 8.0
    L12_2 = -8.0
    L13_2 = -1
    L14_2 = 49
    L15_2 = 0
    L16_2 = false
    L17_2 = false
    L18_2 = false
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
    L7_2 = Wait
    L8_2 = 400
    L7_2(L8_2)
    L7_2 = DoesEntityExist
    L8_2 = L21_1
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = DeleteObject
      L8_2 = L21_1
      L7_2(L8_2)
      L7_2 = nil
      L21_1 = L7_2
    end
    L7_2 = ClearPedTasks
    L8_2 = L3_2
    L7_2(L8_2)
    L7_2 = L22_1
    if nil ~= L7_2 then
      L7_2 = SetPedPropIndex
      L8_2 = L3_2
      L9_2 = L5_2
      L10_2 = L22_1
      L11_2 = L23_1
      if not L11_2 then
        L11_2 = 0
      end
      L12_2 = true
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      L7_2 = PrintDebug
      L8_2 = "Hat restored."
      L7_2(L8_2)
      L7_2 = nil
      L22_1 = L7_2
      L7_2 = nil
      L23_1 = L7_2
    end
    L7_2 = L24_1
    if nil ~= L7_2 then
      L7_2 = SetPedComponentVariation
      L8_2 = L3_2
      L9_2 = L6_2
      L10_2 = L24_1
      L11_2 = L25_1
      if not L11_2 then
        L11_2 = 0
      end
      L12_2 = 2
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      L7_2 = PrintDebug
      L8_2 = "Original mask restored."
      L7_2(L8_2)
      L7_2 = nil
      L24_1 = L7_2
      L7_2 = nil
      L25_1 = L7_2
    end
    L7_2 = false
    L20_1 = L7_2
    L7_2 = PrintDebug
    L8_2 = "Mask removed."
    L7_2(L8_2)
  end
end
L128_1 = false
L125_1(L126_1, L127_1, L128_1)
L125_1 = AddEventHandler
L126_1 = "onResourceStop"
function L127_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if L1_2 == A0_2 then
    L1_2 = L73_1
    L1_2()
    L1_2 = L78_1
    L1_2()
    L1_2 = DoesEntityExist
    L2_2 = L21_1
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = DeleteObject
      L2_2 = L21_1
      L1_2(L2_2)
    end
    L1_2 = DoesEntityExist
    L2_2 = WalletOnGround
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = WalletOnGround
      L1_2(L2_2)
    end
  end
end
L125_1(L126_1, L127_1)
L125_1 = _Pug_TargetAddedToGuard
if not L125_1 then
  L125_1 = {}
end
L126_1 = _Pug_guardLives
if not L126_1 then
  L126_1 = {}
end
L127_1 = _Pug_GuardSeenMe
if not L127_1 then
  L127_1 = {}
end
L128_1 = _Pug_ActiveGuardLoops
if not L128_1 then
  L128_1 = {}
end
L129_1 = _Pug_SyncEpoch
if not L129_1 then
  L129_1 = 0
end
_Pug_SyncEpoch = L129_1
L129_1 = _Pug_GuardBlips
if not L129_1 then
  L129_1 = {}
end
function L130_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = type
  L2_2 = A0_2.lootableItems
  L1_2 = L1_2(L2_2)
  L1_2 = "table" == L1_2
  L2_2 = A0_2.dropWalletWithPasscode
  if L2_2 then
    L2_2 = A0_2.walletDropChance
    L2_2 = nil ~= L2_2
  end
  L3_2 = L1_2 or L3_2
  if not L1_2 then
    L3_2 = L2_2
  end
  return L3_2
end
function L131_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.Target
  if not L2_2 then
    return
  end
  L2_2 = Config
  L2_2 = L2_2.Target
  if "ox_target" == L2_2 then
    L2_2 = pcall
    function L3_2()
      local L0_3, L1_3, L2_3
      L0_3 = exports
      L0_3 = L0_3.ox_target
      L1_3 = L0_3
      L0_3 = L0_3.removeEntity
      L2_3 = A0_2
      L0_3(L1_3, L2_3)
    end
    L2_2 = L2_2(L3_2)
    if not L2_2 and A1_2 then
      L3_2 = DoesEntityExist
      L4_2 = A1_2
      L3_2 = L3_2(L4_2)
      if L3_2 then
        L3_2 = pcall
        function L4_2()
          local L0_3, L1_3, L2_3
          L0_3 = exports
          L0_3 = L0_3.ox_target
          L1_3 = L0_3
          L0_3 = L0_3.removeLocalEntity
          L2_3 = A1_2
          L0_3(L1_3, L2_3)
        end
        L3_2(L4_2)
      end
    end
    return
  end
  if A1_2 then
    L2_2 = DoesEntityExist
    L3_2 = A1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = pcall
      function L3_2()
        local L0_3, L1_3, L2_3
        L0_3 = exports
        L1_3 = Config
        L1_3 = L1_3.Target
        L0_3 = L0_3[L1_3]
        L1_3 = L0_3
        L0_3 = L0_3.RemoveTargetEntity
        L2_3 = A1_2
        L0_3(L1_3, L2_3)
      end
      L2_2(L3_2)
    end
  end
end
function L132_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = Config
  L4_2 = L4_2.Target
  if L4_2 then
    L4_2 = DoesEntityExist
    L5_2 = A1_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_12
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_12::
  L4_2 = Config
  L4_2 = L4_2.LangT
  L4_2 = L4_2.LootGuard
  L5_2 = {}
  L5_2.guardPed = A1_2
  L6_2 = A2_2.lootableItems
  L5_2.lootableItems = L6_2
  L5_2.stageData = A2_2
  L5_2.HeistName = A3_2
  L6_2 = Config
  L6_2 = L6_2.Target
  if "ox_target" == L6_2 then
    L6_2 = {}
    L7_2 = {}
    L8_2 = "pug_lootGuard_%s_%s"
    L9_2 = L8_2
    L8_2 = L8_2.format
    L10_2 = tostring
    L11_2 = A3_2 or L11_2
    if not A3_2 then
      L11_2 = "heist"
    end
    L10_2 = L10_2(L11_2)
    L11_2 = tostring
    L12_2 = A0_2 or L12_2
    if not A0_2 then
      L12_2 = A1_2
    end
    L11_2, L12_2 = L11_2(L12_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
    L7_2.name = L8_2
    L7_2.event = "Pug:client:LootGuard"
    L7_2.icon = "fas fa-box-open"
    L7_2.label = L4_2
    L7_2.args = L5_2
    L7_2.distance = 1.5
    L6_2[1] = L7_2
    L7_2 = pcall
    function L8_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = exports
      L0_3 = L0_3.ox_target
      L1_3 = L0_3
      L0_3 = L0_3.addEntity
      L2_3 = A0_2
      L3_3 = L6_2
      L0_3(L1_3, L2_3, L3_3)
    end
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L8_2 = true
      return L8_2
    end
    L8_2 = pcall
    function L9_2()
      local L0_3, L1_3, L2_3, L3_3
      L0_3 = exports
      L0_3 = L0_3.ox_target
      L1_3 = L0_3
      L0_3 = L0_3.addLocalEntity
      L2_3 = A1_2
      L3_3 = L6_2
      L0_3(L1_3, L2_3, L3_3)
    end
    L8_2 = L8_2(L9_2)
    L7_2 = L8_2
    if not L7_2 then
      L8_2 = PrintDebug
      L9_2 = "Failed to add ox_target loot option to guard"
      L10_2 = A0_2
      L8_2(L9_2, L10_2)
    end
    return L7_2
  end
  L6_2 = pcall
  function L7_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
    L0_3 = exports
    L1_3 = Config
    L1_3 = L1_3.Target
    L0_3 = L0_3[L1_3]
    L1_3 = L0_3
    L0_3 = L0_3.AddTargetEntity
    L2_3 = A1_2
    L3_3 = {}
    L4_3 = {}
    L5_3 = {}
    L5_3.type = "client"
    L5_3.icon = "fas fa-box-open"
    L6_3 = L4_2
    L5_3.label = L6_3
    function L6_3()
      local L0_4, L1_4, L2_4, L3_4
      L0_4 = TriggerEvent
      L1_4 = "Pug:client:LootGuard"
      L2_4 = {}
      L3_4 = L5_2
      L2_4.args = L3_4
      L0_4(L1_4, L2_4)
    end
    L5_3.action = L6_3
    L4_3[1] = L5_3
    L3_3.options = L4_3
    L3_3.distance = 1.5
    L0_3(L1_3, L2_3, L3_3)
  end
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L7_2 = PrintDebug
    L8_2 = "Failed to add target loot option to guard"
    L9_2 = A0_2
    L7_2(L8_2, L9_2)
  end
  return L6_2
end
function L133_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = L130_1
  L6_2 = A3_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L5_2 = DoesEntityExist
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L5_2 = A0_2[A1_2]
  if nil ~= L5_2 then
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if not L6_2 or L5_2 ~= A2_2 then
      L6_2 = L131_1
      L7_2 = A1_2
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
      A0_2[A1_2] = nil
      L5_2 = nil
    end
  end
  if L5_2 == A2_2 then
    return
  end
  L6_2 = L132_1
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L10_2 = A4_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  if L6_2 then
    A0_2[A1_2] = A2_2
  else
    A0_2[A1_2] = nil
  end
end
L134_1 = RegisterNetEvent
L135_1 = "Pug:client:SyncAllGuards"
function L136_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = _Pug_SyncEpoch
  L3_2 = L3_2 + 1
  _Pug_SyncEpoch = L3_2
  L3_2 = _Pug_SyncEpoch
  L4_2 = L125_1
  L5_2 = L126_1
  L6_2 = ipairs
  L7_2 = A0_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = L11_2.guardNetId
    L13_2 = L11_2.guardData
    L14_2 = L11_2.stageData
    L15_2 = vector3
    L16_2 = L13_2.guardPosition
    L16_2 = L16_2[1]
    L17_2 = L13_2.guardPosition
    L17_2 = L17_2[2]
    L18_2 = L13_2.guardPosition
    L18_2 = L18_2[3]
    L15_2 = L15_2(L16_2, L17_2, L18_2)
    L16_2 = L127_1
    L17_2 = L128_1
    L17_2 = L17_2[L12_2]
    if L17_2 then
    else
      L17_2 = L128_1
      L17_2[L12_2] = true
      L17_2 = CreateThread
      function L18_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3
        L0_3 = L3_2
        L1_3 = A1_2
        L1_3 = L1_3 * 60
        L2_3 = GetGameTimer
        L2_3 = L2_3()
        L3_3 = L1_3 * 1000
        L2_3 = L2_3 + L3_3
        L3_3 = 1000
        L4_3 = false
        while true do
          L5_3 = GetGameTimer
          L5_3 = L5_3()
          if not (L2_3 > L5_3) then
            break
          end
          L5_3 = GetEntityCoords
          L6_3 = PlayerPedId
          L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L6_3()
          L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
          L6_3 = L15_2
          L5_3 = L5_3 - L6_3
          L5_3 = #L5_3
          if L5_3 <= 100 then
            L5_3 = NetworkGetEntityFromNetworkId
            L6_3 = L12_2
            L5_3 = L5_3(L6_3)
            L6_3 = PlayerPedId
            L6_3 = L6_3()
            L7_3 = 0
            L8_3 = 10
            while true do
              L9_3 = DoesEntityExist
              L10_3 = L5_3
              L9_3 = L9_3(L10_3)
              if not (not L9_3 and L7_3 < L8_3) then
                break
              end
              L9_3 = Wait
              L10_3 = 100
              L9_3(L10_3)
              L9_3 = NetworkGetEntityFromNetworkId
              L10_3 = L12_2
              L9_3 = L9_3(L10_3)
              L5_3 = L9_3
              L7_3 = L7_3 + 1
            end
            L9_3 = DoesEntityExist
            L10_3 = L5_3
            L9_3 = L9_3(L10_3)
            if L9_3 then
              L10_3 = L12_2
              L9_3 = L5_2
              L9_3 = L9_3[L10_3]
              if nil == L9_3 then
                L10_3 = L12_2
                L9_3 = L5_2
                L11_3 = tonumber
                L12_3 = L14_2.guardDifficulty
                L11_3 = L11_3(L12_3)
                if not L11_3 then
                  L11_3 = 0
                end
                L9_3[L10_3] = L11_3
                L9_3 = SetPedArmour
                L10_3 = L5_3
                L11_3 = 100
                L9_3(L10_3, L11_3)
                L9_3 = SetEntityMaxHealth
                L10_3 = L5_3
                L11_3 = 200
                L9_3(L10_3, L11_3)
                L9_3 = SetEntityHealth
                L10_3 = L5_3
                L11_3 = 200
                L9_3(L10_3, L11_3)
              end
              L9_3 = L14_2.showEnemyBlip
              if L9_3 then
                L10_3 = L12_2
                L9_3 = L129_1
                L9_3 = L9_3[L10_3]
                if not L9_3 then
                  L9_3 = AddBlipForEntity
                  L10_3 = L5_3
                  L9_3(L10_3)
                  L10_3 = L12_2
                  L9_3 = L129_1
                  L9_3[L10_3] = true
                end
              end
              L9_3 = L133_1
              L10_3 = L4_2
              L11_3 = L12_2
              L12_3 = L5_3
              L13_3 = L14_2
              L14_3 = A2_2
              L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
              L9_3 = IsPedDeadOrDying
              L10_3 = L5_3
              L11_3 = true
              L9_3 = L9_3(L10_3, L11_3)
              if L9_3 then
                L10_3 = L12_2
                L9_3 = L5_2
                L9_3 = L9_3[L10_3]
                if L9_3 > 0 then
                  L9_3 = AnimpostfxIsRunning
                  L10_3 = "DeathFailOut"
                  L9_3 = L9_3(L10_3)
                  if L9_3 then
                    L9_3 = AnimpostfxStop
                    L10_3 = "DeathFailOut"
                    L9_3(L10_3)
                  end
                  L9_3 = AnimpostfxIsRunning
                  L10_3 = "KillCam"
                  L9_3 = L9_3(L10_3)
                  if L9_3 then
                    L9_3 = AnimpostfxStop
                    L10_3 = "KillCam"
                    L9_3(L10_3)
                  end
                  L10_3 = L12_2
                  L9_3 = L5_2
                  L12_3 = L12_2
                  L11_3 = L5_2
                  L11_3 = L11_3[L12_3]
                  L11_3 = L11_3 - 1
                  L9_3[L10_3] = L11_3
                  L9_3 = ResurrectPed
                  L10_3 = L5_3
                  L9_3(L10_3)
                  L9_3 = ClearPedTasksImmediately
                  L10_3 = L5_3
                  L9_3(L10_3)
                  L9_3 = SetEntityHealth
                  L10_3 = L5_3
                  L11_3 = GetEntityMaxHealth
                  L12_3 = L5_3
                  L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L11_3(L12_3)
                  L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                  L9_3 = SetPedArmour
                  L10_3 = L5_3
                  L11_3 = 100
                  L9_3(L10_3, L11_3)
                  L9_3 = SetPedHeadingToFaceVector
                  L10_3 = L5_3
                  L11_3 = GetEntityCoords
                  L12_3 = PlayerPedId
                  L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L12_3()
                  L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L11_3(L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                  L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                else
                  L9_3 = PrintDebug
                  L10_3 = "Guard is dead, stopping control checks"
                  L9_3(L10_3)
                  L9_3 = Wait
                  L10_3 = 4000
                  L9_3(L10_3)
                  L9_3 = L14_2.lootableItems
                  if L9_3 then
                    L9_3 = L14_2.lootableItems
                    L9_3 = #L9_3
                    if L9_3 > 0 then
                      break
                    end
                  end
                  L9_3 = L14_2.dropWalletWithPasscode
                  if L9_3 then
                    L9_3 = L14_2.walletDropChance
                    if L9_3 then
                      break
                    end
                  end
                  L9_3 = TriggerEvent
                  L10_3 = "FullyDeleteRobberiesEntity"
                  L11_3 = L5_3
                  L9_3(L10_3, L11_3)
                  break
                end
              end
              L9_3 = GetEntityCoords
              L10_3 = L5_3
              L9_3 = L9_3(L10_3)
              L10_3 = GetEntityCoords
              L11_3 = L6_3
              L10_3 = L10_3(L11_3)
              L11_3 = L10_3 - L9_3
              L11_3 = #L11_3
              if L11_3 < 50.0 then
                L12_3 = NetworkHasControlOfEntity
                L13_3 = L5_3
                L12_3 = L12_3(L13_3)
                if not L12_3 then
                  L12_3 = NetworkGetEntityOwner
                  L13_3 = L5_3
                  L12_3 = L12_3(L13_3)
                  if -1 ~= L12_3 then
                    L13_3 = PlayerId
                    L13_3 = L13_3()
                    if L12_3 ~= L13_3 then
                  end
                  else
                    L13_3 = NetworkRequestControlOfEntity
                    L14_3 = L5_3
                    L13_3(L14_3)
                    L13_3 = 2000
                    L14_3 = GetGameTimer
                    L14_3 = L14_3()
                    while true do
                      L15_3 = NetworkHasControlOfEntity
                      L16_3 = L5_3
                      L15_3 = L15_3(L16_3)
                      if L15_3 then
                        break
                      end
                      L15_3 = GetGameTimer
                      L15_3 = L15_3()
                      L15_3 = L15_3 - L14_3
                      if not (L13_3 > L15_3) then
                        break
                      end
                      L15_3 = Wait
                      L16_3 = 100
                      L15_3(L16_3)
                    end
                  end
                end
                L12_3 = NetworkHasControlOfEntity
                L13_3 = L5_3
                L12_3 = L12_3(L13_3)
                if L12_3 then
                  L12_3 = L14_2.removeOneShotHeadshots
                  if L12_3 then
                    L12_3 = SetPedSuffersCriticalHits
                    L13_3 = L5_3
                    L14_3 = false
                    L12_3(L13_3, L14_3)
                  end
                  L12_3 = SetPedCanRagdoll
                  L13_3 = L5_3
                  L14_3 = false
                  L12_3(L13_3, L14_3)
                  L12_3 = SetPedFleeAttributes
                  L13_3 = L5_3
                  L14_3 = 0
                  L15_3 = false
                  L12_3(L13_3, L14_3, L15_3)
                  L12_3 = SetPedCombatAttributes
                  L13_3 = L5_3
                  L14_3 = 46
                  L15_3 = true
                  L12_3(L13_3, L14_3, L15_3)
                  L12_3 = SetPedCombatAttributes
                  L13_3 = L5_3
                  L14_3 = 5
                  L15_3 = true
                  L12_3(L13_3, L14_3, L15_3)
                  L12_3 = SetPedCombatAttributes
                  L13_3 = L5_3
                  L14_3 = 0
                  L15_3 = true
                  L12_3(L13_3, L14_3, L15_3)
                  L12_3 = SetPedCombatAbility
                  L13_3 = L5_3
                  L14_3 = 100
                  L12_3(L13_3, L14_3)
                  L12_3 = SetPedCombatMovement
                  L13_3 = L5_3
                  L14_3 = 2
                  L12_3(L13_3, L14_3)
                  L12_3 = SetPedAlertness
                  L13_3 = L5_3
                  L14_3 = 3
                  L12_3(L13_3, L14_3)
                  L12_3 = SetPedSeeingRange
                  L13_3 = L5_3
                  L14_3 = 100.0
                  L12_3(L13_3, L14_3)
                  L12_3 = SetPedHearingRange
                  L13_3 = L5_3
                  L14_3 = 100.0
                  L12_3(L13_3, L14_3)
                  L12_3 = PrintDebug
                  L13_3 = "Client has control over guard"
                  L12_3(L13_3)
                  L12_3 = GetHashKey
                  L13_3 = "GUARDS"
                  L12_3 = L12_3(L13_3)
                  L13_3 = AddRelationshipGroup
                  L14_3 = "GUARDS"
                  L13_3(L14_3)
                  L13_3 = SetPedRelationshipGroupHash
                  L14_3 = L5_3
                  L15_3 = L12_3
                  L13_3(L14_3, L15_3)
                  L13_3 = SetRelationshipBetweenGroups
                  L14_3 = 1
                  L15_3 = L12_3
                  L16_3 = L12_3
                  L13_3(L14_3, L15_3, L16_3)
                  L13_3 = SetRelationshipBetweenGroups
                  L14_3 = 5
                  L15_3 = L12_3
                  L16_3 = GetHashKey
                  L17_3 = "PLAYER"
                  L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L16_3(L17_3)
                  L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                  L13_3 = SetRelationshipBetweenGroups
                  L14_3 = 5
                  L15_3 = GetHashKey
                  L16_3 = "PLAYER"
                  L15_3 = L15_3(L16_3)
                  L16_3 = L12_3
                  L13_3(L14_3, L15_3, L16_3)
                  L13_3 = GetEntityCoords
                  L14_3 = PlayerPedId
                  L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L14_3()
                  L13_3 = L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                  L15_3 = L12_2
                  L14_3 = L16_2
                  L14_3 = L14_3[L15_3]
                  if L14_3 then
                    L15_3 = L12_2
                    L14_3 = L16_2
                    L14_3 = L14_3[L15_3]
                    if L14_3 == L0_3 then
                      goto lbl_534
                    end
                  end
                  L14_3 = Entity
                  L15_3 = L5_3
                  L14_3 = L14_3(L15_3)
                  if L14_3 then
                    L15_3 = L14_3.state
                    if L15_3 then
                      L15_3 = L14_3.state
                      L15_3 = L15_3.pug_seen_epoch
                      if L15_3 then
                        goto lbl_349
                      end
                    end
                  end
                  L15_3 = nil
                  ::lbl_349::
                  if L15_3 ~= L0_3 then
                    L17_3 = L12_2
                    L16_3 = L16_2
                    L16_3[L17_3] = L0_3
                    if L14_3 then
                      L16_3 = L14_3.state
                      if L16_3 then
                        L16_3 = L14_3.state
                        L17_3 = L16_3
                        L16_3 = L16_3.set
                        L18_3 = "pug_seen_epoch"
                        L19_3 = L0_3
                        L20_3 = true
                        L16_3(L17_3, L18_3, L19_3, L20_3)
                      end
                    end
                    L16_3 = GetEntityCoords
                    L17_3 = L5_3
                    L16_3 = L16_3(L17_3)
                    L17_3 = GetEntityCoords
                    L18_3 = PlayerPedId
                    L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L18_3()
                    L17_3 = L17_3(L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                    L18_3 = GetEntityForwardVector
                    L19_3 = PlayerPedId
                    L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L19_3()
                    L18_3 = L18_3(L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                    L19_3 = table
                    L19_3 = L19_3.unpack
                    L20_3 = L18_3 * 1.0
                    L20_3 = L17_3 + L20_3
                    L19_3, L20_3, L21_3 = L19_3(L20_3)
                    L22_3 = SetEntityVisible
                    L23_3 = L5_3
                    L24_3 = false
                    L22_3(L23_3, L24_3)
                    L22_3 = SetEntityCoords
                    L23_3 = L5_3
                    L24_3 = vector3
                    L25_3 = L19_3
                    L26_3 = L20_3
                    L27_3 = L21_3
                    L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3 = L24_3(L25_3, L26_3, L27_3)
                    L22_3(L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3)
                    L22_3 = print
                    L23_3 = "TP TO PLAYER HERE"
                    L22_3(L23_3)
                    L22_3 = SetEntityCollision
                    L23_3 = L5_3
                    L24_3 = false
                    L25_3 = false
                    L22_3(L23_3, L24_3, L25_3)
                    L22_3 = Wait
                    L23_3 = 100
                    L22_3(L23_3)
                    L22_3 = SetPedHeadingToFaceVector
                    L23_3 = L5_3
                    L24_3 = L17_3
                    L22_3(L23_3, L24_3)
                    L22_3 = GetGameTimer
                    L22_3 = L22_3()
                    L23_3 = GetCoordsInfrontOfEntityWithDistance
                    L24_3 = PlayerPedId
                    L24_3 = L24_3()
                    L25_3 = 1.0
                    L26_3 = 90.0
                    L23_3 = L23_3(L24_3, L25_3, L26_3)
                    L24_3 = GetCoordsInfrontOfEntityWithDistance
                    L25_3 = PlayerPedId
                    L25_3 = L25_3()
                    L26_3 = -1.0
                    L27_3 = 90.0
                    L24_3 = L24_3(L25_3, L26_3, L27_3)
                    while true do
                      L25_3 = IsPedInCombat
                      L26_3 = L5_3
                      L27_3 = 0
                      L25_3 = L25_3(L26_3, L27_3)
                      if L25_3 then
                        break
                      end
                      L25_3 = IsPedAimingFromCover
                      L26_3 = L5_3
                      L25_3 = L25_3(L26_3)
                      if L25_3 then
                        break
                      end
                      L25_3 = IsPedShooting
                      L26_3 = L5_3
                      L25_3 = L25_3(L26_3)
                      if L25_3 then
                        break
                      end
                      L25_3 = GetGameTimer
                      L25_3 = L25_3()
                      L25_3 = L25_3 - L22_3
                      L26_3 = 4000
                      if not (L25_3 < L26_3) then
                        break
                      end
                      L25_3 = Wait
                      L26_3 = 100
                      L25_3(L26_3)
                      L25_3 = GetGameTimer
                      L25_3 = L25_3()
                      L25_3 = L25_3 - L22_3
                      L26_3 = 1000
                      if L25_3 >= L26_3 then
                        L25_3 = GetGameTimer
                        L25_3 = L25_3()
                        L25_3 = L25_3 - L22_3
                        L26_3 = 3000
                        if L25_3 <= L26_3 then
                          L25_3 = print
                          L26_3 = "SET TO LEFT"
                          L25_3(L26_3)
                          L25_3 = SetEntityCoords
                          L26_3 = L5_3
                          L27_3 = vector3
                          L28_3 = L23_3.x
                          L29_3 = L23_3.y
                          L30_3 = L23_3.z
                          L27_3, L28_3, L29_3, L30_3 = L27_3(L28_3, L29_3, L30_3)
                          L25_3(L26_3, L27_3, L28_3, L29_3, L30_3)
                          L25_3 = SetPedHeadingToFaceVector
                          L26_3 = L5_3
                          L27_3 = GetEntityCoords
                          L28_3 = PlayerPedId
                          L28_3, L29_3, L30_3 = L28_3()
                          L27_3, L28_3, L29_3, L30_3 = L27_3(L28_3, L29_3, L30_3)
                          L25_3(L26_3, L27_3, L28_3, L29_3, L30_3)
                      end
                      else
                        L25_3 = GetGameTimer
                        L25_3 = L25_3()
                        L25_3 = L25_3 - L22_3
                        L26_3 = 3000
                        if L25_3 > L26_3 then
                          L25_3 = print
                          L26_3 = "SET TO LEFT2"
                          L25_3(L26_3)
                          L25_3 = SetEntityCoords
                          L26_3 = L5_3
                          L27_3 = vector3
                          L28_3 = L24_3.x
                          L29_3 = L24_3.y
                          L30_3 = L24_3.z
                          L27_3, L28_3, L29_3, L30_3 = L27_3(L28_3, L29_3, L30_3)
                          L25_3(L26_3, L27_3, L28_3, L29_3, L30_3)
                          L25_3 = SetPedHeadingToFaceVector
                          L26_3 = L5_3
                          L27_3 = GetEntityCoords
                          L28_3 = PlayerPedId
                          L28_3, L29_3, L30_3 = L28_3()
                          L27_3, L28_3, L29_3, L30_3 = L27_3(L28_3, L29_3, L30_3)
                          L25_3(L26_3, L27_3, L28_3, L29_3, L30_3)
                        end
                      end
                    end
                    L25_3 = Wait
                    L26_3 = 100
                    L25_3(L26_3)
                    L25_3 = SetEntityCollision
                    L26_3 = L5_3
                    L27_3 = true
                    L28_3 = true
                    L25_3(L26_3, L27_3, L28_3)
                    L25_3 = print
                    L26_3 = "PUT BACK HERE"
                    L25_3(L26_3)
                    L25_3 = SetEntityCoords
                    L26_3 = L5_3
                    L27_3 = vector3
                    L28_3 = L16_3.x
                    L29_3 = L16_3.y
                    L30_3 = L16_3.z
                    L30_3 = L30_3 - 0.8
                    L27_3, L28_3, L29_3, L30_3 = L27_3(L28_3, L29_3, L30_3)
                    L25_3(L26_3, L27_3, L28_3, L29_3, L30_3)
                    L25_3 = SetEntityVisible
                    L26_3 = L5_3
                    L27_3 = true
                    L25_3(L26_3, L27_3)
                  end
                  ::lbl_534::
                  L15_3 = L12_2
                  L14_3 = L5_2
                  L14_3 = L14_3[L15_3]
                  if L14_3 > 0 then
                    L14_3 = GetPedArmour
                    L15_3 = L5_3
                    L14_3 = L14_3(L15_3)
                    if L14_3 <= 0 then
                      L16_3 = L12_2
                      L15_3 = L5_2
                      L18_3 = L12_2
                      L17_3 = L5_2
                      L17_3 = L17_3[L18_3]
                      L17_3 = L17_3 - 1
                      L15_3[L16_3] = L17_3
                      L16_3 = L12_2
                      L15_3 = L5_2
                      L15_3 = L15_3[L16_3]
                      if L15_3 > 0 then
                        L15_3 = SetPedArmour
                        L16_3 = L5_3
                        L17_3 = 100
                        L15_3(L16_3, L17_3)
                      end
                    end
                  end
                else
                  L12_3 = PrintDebug
                  L13_3 = "Failed to get control of the guard"
                  L12_3(L13_3)
                end
              else
                L12_3 = PrintDebug
                L13_3 = "Player too far from guard to request control"
                L12_3(L13_3)
              end
            else
              L9_3 = PrintDebug
              L10_3 = "Failed to find guard after"
              L11_3 = L7_3
              L12_3 = "attempts"
              L9_3(L10_3, L11_3, L12_3)
            end
          end
          L5_3 = Wait
          L6_3 = L3_3
          L5_3(L6_3)
        end
        L6_3 = L12_2
        L5_3 = L4_2
        L5_3[L6_3] = nil
        L6_3 = L12_2
        L5_3 = L5_2
        L5_3[L6_3] = nil
        L6_3 = L12_2
        L5_3 = L16_2
        L5_3[L6_3] = nil
        L6_3 = L12_2
        L5_3 = L129_1
        L5_3[L6_3] = nil
        L6_3 = L12_2
        L5_3 = L128_1
        L5_3[L6_3] = nil
      end
      L17_2(L18_2)
    end
  end
end
L134_1(L135_1, L136_1)
function L134_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = 4000
  end
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    while true do
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L2_2
      L0_3 = L0_3 - L1_3
      L1_3 = L3_2
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = SetTextFont
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = SetTextProportional
      L1_3 = 1
      L0_3(L1_3)
      L0_3 = SetTextScale
      L1_3 = 0.3
      L2_3 = 0.3
      L0_3(L1_3, L2_3)
      L0_3 = SetTextColour
      L1_3 = 10
      L2_3 = 10
      L3_3 = 10
      L4_3 = 150
      L0_3(L1_3, L2_3, L3_3, L4_3)
      L0_3 = SetTextCentre
      L1_3 = true
      L0_3(L1_3)
      L0_3 = SetTextEntry
      L1_3 = "STRING"
      L0_3(L1_3)
      L0_3 = AddTextComponentString
      L1_3 = A0_2
      L0_3(L1_3)
      L0_3 = DrawText
      L1_3 = 0.55
      L2_3 = 0.385
      L0_3(L1_3, L2_3)
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
    end
  end
  L4_2(L5_2)
end
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:LootGuard"
function L137_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L1_2 = A0_2.args
  L1_2 = L1_2.guardPed
  L2_2 = A0_2.args
  L2_2 = L2_2.lootableItems
  L3_2 = A0_2.args
  L3_2 = L3_2.stageData
  L4_2 = A0_2.args
  L4_2 = L4_2.HeistName
  L5_2 = GetEntityCoords
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetEntityHeading
  L7_2 = L1_2
  L6_2 = L6_2(L7_2)
  L7_2 = GetEntityModel
  L8_2 = L1_2
  L7_2 = L7_2(L8_2)
  L8_2 = vector3
  L9_2 = L5_2.x
  L10_2 = L5_2.y
  L11_2 = L5_2.z
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = PrintDebug
  L10_2 = L5_2
  L11_2 = "guardCoords"
  L10_2 = L10_2 .. L11_2
  L9_2(L10_2)
  L9_2 = TriggerEvent
  L10_2 = "FullyDeleteRobberiesEntity"
  L11_2 = L1_2
  L9_2(L10_2, L11_2)
  L9_2 = SetPedHeadingToFaceVector
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = L5_2
  L9_2(L10_2, L11_2)
  L9_2 = RequestModel
  L10_2 = L7_2
  L9_2(L10_2)
  while true do
    L9_2 = HasModelLoaded
    L10_2 = L7_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      break
    end
    L9_2 = Wait
    L10_2 = 10
    L9_2(L10_2)
  end
  L9_2 = L8_2.z
  L10_2 = GetGroundZ
  L11_2 = L8_2.x
  L12_2 = L8_2.y
  L13_2 = L8_2.z
  L13_2 = L13_2 + 1
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L9_2 = L10_2
  L10_2 = CreatePed
  L11_2 = 4
  L12_2 = L7_2
  L13_2 = L8_2.x
  L14_2 = L8_2.y
  L15_2 = L9_2
  L16_2 = L6_2
  L17_2 = false
  L18_2 = true
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L11_2 = FreezeEntityPosition
  L12_2 = L10_2
  L13_2 = true
  L11_2(L12_2, L13_2)
  L11_2 = SetEntityInvincible
  L12_2 = L10_2
  L13_2 = true
  L11_2(L12_2, L13_2)
  L11_2 = SetEntityHealth
  L12_2 = L10_2
  L13_2 = 0
  L11_2(L12_2, L13_2)
  L11_2 = ClearPedTasksImmediately
  L12_2 = L10_2
  L11_2(L12_2)
  L11_2 = 1
  L12_2 = ApplyPedDamagePack
  L13_2 = L10_2
  L14_2 = "BigHitByVehicle"
  L15_2 = 0.0
  L16_2 = 1.0
  L12_2(L13_2, L14_2, L15_2, L16_2)
  L12_2 = SetPedSuffersCriticalHits
  L13_2 = L10_2
  L14_2 = true
  L12_2(L13_2, L14_2)
  L12_2 = SetEntityVisible
  L13_2 = L10_2
  L14_2 = true
  L15_2 = false
  L12_2(L13_2, L14_2, L15_2)
  L12_2 = PlayerPedId
  L12_2 = L12_2()
  L13_2 = RequestAnimDict
  L14_2 = "amb@medic@standing@tendtodead@idle_a"
  L13_2(L14_2)
  while true do
    L13_2 = HasAnimDictLoaded
    L14_2 = "amb@medic@standing@tendtodead@idle_a"
    L13_2 = L13_2(L14_2)
    if L13_2 then
      break
    end
    L13_2 = Wait
    L14_2 = 10
    L13_2(L14_2)
  end
  L13_2 = TaskPlayAnim
  L14_2 = L12_2
  L15_2 = "amb@medic@standing@tendtodead@idle_a"
  L16_2 = "idle_a"
  L17_2 = 8.0
  L18_2 = 8.0
  L19_2 = -1
  L20_2 = 1
  L21_2 = 0
  L22_2 = false
  L23_2 = false
  L24_2 = false
  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
  L13_2 = L3_2.dropWalletWithPasscode
  if L13_2 then
    L13_2 = L3_2.walletDropChance
    if L13_2 then
      L13_2 = math
      L13_2 = L13_2.random
      L14_2 = 1
      L15_2 = 100
      L13_2 = L13_2(L14_2, L15_2)
      L14_2 = tonumber
      L15_2 = L3_2.walletDropChance
      L14_2 = L14_2(L15_2)
      if L13_2 <= L14_2 then
        L13_2 = DoesEntityExist
        L14_2 = WalletOnGround
        L13_2 = L13_2(L14_2)
        if L13_2 then
          L13_2 = DeleteEntity
          L14_2 = WalletOnGround
          L13_2(L14_2)
        end
        L13_2 = CreateObject
        L14_2 = GetHashKey
        L15_2 = "prop_ld_wallet_pickup"
        L14_2 = L14_2(L15_2)
        L15_2 = GetEntityCoords
        L16_2 = L10_2
        L15_2 = L15_2(L16_2)
        L16_2 = true
        L17_2 = true
        L18_2 = false
        L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
        WalletOnGround = L13_2
        L13_2 = GetCoordsInfrontOfEntityWithDistance
        L14_2 = L10_2
        L15_2 = 0.5
        L16_2 = 90.0
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        L14_2 = GetEntityHeading
        L15_2 = L10_2
        L14_2 = L14_2(L15_2)
        L15_2 = GetGroundZ
        L16_2 = L13_2.x
        L17_2 = L13_2.y
        L18_2 = L13_2.z
        L15_2 = L15_2(L16_2, L17_2, L18_2)
        L13_2.z = L15_2
        L15_2 = SetEntityCoords
        L16_2 = WalletOnGround
        L17_2 = L13_2.x
        L18_2 = L13_2.y
        L19_2 = L13_2.z
        L19_2 = L19_2 + 0.05
        L15_2(L16_2, L17_2, L18_2, L19_2)
        L15_2 = SetEntityRotation
        L16_2 = WalletOnGround
        L17_2 = -85.0
        L18_2 = 0.0
        L19_2 = -5.0
        L15_2(L16_2, L17_2, L18_2, L19_2)
        L15_2 = {}
        L16_2 = {}
        L17_2 = "LookAtGuardWallet"
        L18_2 = L5_2.x
        L17_2 = L17_2 .. L18_2
        L16_2.name = L17_2
        L16_2.icon = "fa-solid fa-wallet"
        L17_2 = Config
        L17_2 = L17_2.LangT
        L17_2 = L17_2.LookAtWallet
        L16_2.label = L17_2
        L16_2.distance = 1.5
        function L17_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
          L0_3 = GetClosestObjectOfType
          L1_3 = L13_2.x
          L2_3 = L13_2.y
          L3_3 = L13_2.z
          L4_3 = 1.5
          L5_3 = GetHashKey
          L6_3 = "prop_ld_wallet_pickup"
          L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L5_3(L6_3)
          L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
          if 0 ~= L0_3 then
            L1_3 = GetEntityModel
            L2_3 = L0_3
            L1_3 = L1_3(L2_3)
            L2_3 = GetHashKey
            L3_3 = "prop_ld_wallet_pickup"
            L2_3 = L2_3(L3_3)
            if L1_3 ~= L2_3 then
              L1_3 = Notify
              L2_3 = Config
              L2_3 = L2_3.LangT
              L2_3 = L2_3.WalletNotFound
              L3_3 = "error"
              L1_3(L2_3, L3_3)
            end
            L1_3 = 1000
            L2_3 = "DEFAULT_SCRIPTED_CAMERA"
            L3_3 = CreateCam
            L4_3 = L2_3
            L5_3 = 1
            L3_3 = L3_3(L4_3, L5_3)
            L4_3 = GetEntityForwardVector
            L5_3 = L0_3
            L4_3 = L4_3(L5_3)
            L5_3 = table
            L5_3 = L5_3.unpack
            L6_3 = vector3
            L7_3 = L13_2.x
            L8_3 = L13_2.y
            L9_3 = L13_2.z
            L6_3 = L6_3(L7_3, L8_3, L9_3)
            L7_3 = L4_3 * -0.21
            L6_3 = L6_3 + L7_3
            L5_3, L6_3, L7_3 = L5_3(L6_3)
            L8_3 = SetCamCoord
            L9_3 = L3_3
            L10_3 = vector3
            L11_3 = L5_3
            L12_3 = L6_3
            L13_3 = L7_3 + 0.13
            L10_3, L11_3, L12_3, L13_3 = L10_3(L11_3, L12_3, L13_3)
            L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
            L8_3 = PointCamAtEntity
            L9_3 = L3_3
            L10_3 = L0_3
            L8_3(L9_3, L10_3)
            if L1_3 then
              L8_3 = RenderScriptCams
              L9_3 = true
              L10_3 = 1
              L11_3 = L1_3
              L12_3 = 300
              L13_3 = 0
              L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
            end
            L8_3 = Wait
            L9_3 = 1000
            L8_3(L9_3)
            L8_3 = L134_1
            L10_3 = L4_2
            L9_3 = L17_1
            L9_3 = L9_3[L10_3]
            L10_3 = 5000
            L8_3(L9_3, L10_3)
            L8_3 = Wait
            L9_3 = 5000
            L8_3(L9_3)
            L8_3 = RenderScriptCams
            L9_3 = 0
            L10_3 = 0
            L11_3 = 1
            L12_3 = 1
            L13_3 = 1
            L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
            L8_3 = DestroyCam
            L9_3 = L3_3
            L10_3 = 0
            L8_3(L9_3, L10_3)
          end
        end
        L16_2.action = L17_2
        L15_2[1] = L16_2
        L16_2 = Config
        L16_2 = L16_2.Target
        if "ox_target" == L16_2 then
          L16_2 = exports
          L16_2 = L16_2.ox_target
          L17_2 = L16_2
          L16_2 = L16_2.addLocalEntity
          L18_2 = WalletOnGround
          L19_2 = {}
          L20_2 = {}
          L21_2 = "LookAtGuardWallet"
          L22_2 = L5_2.x
          L21_2 = L21_2 .. L22_2
          L20_2.name = L21_2
          L20_2.icon = "fa-solid fa-wallet"
          L21_2 = Config
          L21_2 = L21_2.LangT
          L21_2 = L21_2.LookAtWallet
          L20_2.label = L21_2
          L20_2.distance = 1.5
          function L21_2()
            local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
            L0_3 = GetClosestObjectOfType
            L1_3 = L13_2.x
            L2_3 = L13_2.y
            L3_3 = L13_2.z
            L4_3 = 1.5
            L5_3 = GetHashKey
            L6_3 = "prop_ld_wallet_pickup"
            L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L5_3(L6_3)
            L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
            if 0 ~= L0_3 then
              L1_3 = GetEntityModel
              L2_3 = L0_3
              L1_3 = L1_3(L2_3)
              L2_3 = GetHashKey
              L3_3 = "prop_ld_wallet_pickup"
              L2_3 = L2_3(L3_3)
              if L1_3 ~= L2_3 then
                L1_3 = Notify
                L2_3 = Config
                L2_3 = L2_3.LangT
                L2_3 = L2_3.WalletNotFound
                L3_3 = "error"
                L1_3(L2_3, L3_3)
              end
              L1_3 = 1000
              L2_3 = "DEFAULT_SCRIPTED_CAMERA"
              L3_3 = CreateCam
              L4_3 = L2_3
              L5_3 = 1
              L3_3 = L3_3(L4_3, L5_3)
              L4_3 = GetEntityForwardVector
              L5_3 = L0_3
              L4_3 = L4_3(L5_3)
              L5_3 = table
              L5_3 = L5_3.unpack
              L6_3 = vector3
              L7_3 = L13_2.x
              L8_3 = L13_2.y
              L9_3 = L13_2.z
              L6_3 = L6_3(L7_3, L8_3, L9_3)
              L7_3 = L4_3 * -0.21
              L6_3 = L6_3 + L7_3
              L5_3, L6_3, L7_3 = L5_3(L6_3)
              L8_3 = SetCamCoord
              L9_3 = L3_3
              L10_3 = vector3
              L11_3 = L5_3
              L12_3 = L6_3
              L13_3 = L7_3 + 0.13
              L10_3, L11_3, L12_3, L13_3 = L10_3(L11_3, L12_3, L13_3)
              L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
              L8_3 = PointCamAtEntity
              L9_3 = L3_3
              L10_3 = L0_3
              L8_3(L9_3, L10_3)
              if L1_3 then
                L8_3 = RenderScriptCams
                L9_3 = true
                L10_3 = 1
                L11_3 = L1_3
                L12_3 = 300
                L13_3 = 0
                L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
              end
              L8_3 = Wait
              L9_3 = 1000
              L8_3(L9_3)
              L8_3 = L134_1
              L10_3 = L4_2
              L9_3 = L17_1
              L9_3 = L9_3[L10_3]
              L10_3 = 5000
              L8_3(L9_3, L10_3)
              L8_3 = Wait
              L9_3 = 5000
              L8_3(L9_3)
              L8_3 = RenderScriptCams
              L9_3 = 0
              L10_3 = 0
              L11_3 = 1
              L12_3 = 1
              L13_3 = 1
              L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
              L8_3 = DestroyCam
              L9_3 = L3_3
              L10_3 = 0
              L8_3(L9_3, L10_3)
            end
          end
          L20_2.onSelect = L21_2
          L19_2[1] = L20_2
          L16_2(L17_2, L18_2, L19_2)
        else
          L16_2 = exports
          L17_2 = Config
          L17_2 = L17_2.Target
          L16_2 = L16_2[L17_2]
          L17_2 = L16_2
          L16_2 = L16_2.AddTargetEntity
          L18_2 = WalletOnGround
          L19_2 = {}
          L19_2.options = L15_2
          L19_2.distance = 1.5
          L16_2(L17_2, L18_2, L19_2)
        end
      end
    end
  end
  L13_2 = Wait
  L14_2 = 5000
  L13_2(L14_2)
  L13_2 = ClearPedTasks
  L14_2 = L12_2
  L13_2(L14_2)
  L13_2 = ipairs
  L14_2 = L2_2
  L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
  for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
    L19_2 = L18_2.name
    L20_2 = L18_2.minAmount
    L21_2 = L18_2.maxAmount
    L22_2 = math
    L22_2 = L22_2.random
    L23_2 = L20_2
    L24_2 = L21_2
    L22_2 = L22_2(L23_2, L24_2)
    L23_2 = tonumber
    L24_2 = L18_2.chance
    L23_2 = L23_2(L24_2)
    L24_2 = math
    L24_2 = L24_2.random
    L25_2 = 1
    L26_2 = 100
    L24_2 = L24_2(L25_2, L26_2)
    if L23_2 >= L24_2 then
      TokenIsUseable = true
      L24_2 = HandleItems
      L25_2 = true
      L26_2 = L19_2
      L27_2 = L22_2
      L28_2 = {}
      L28_2.heistName = L4_2
      L28_2.rewardContext = "guard_loot_item"
      L24_2(L25_2, L26_2, L27_2, L28_2)
      TokenIsUseable = false
      L24_2 = Notify
      L25_2 = Config
      L25_2 = L25_2.T
      L26_2 = "LootedAmountItem"
      L27_2 = L22_2
      L28_2 = L19_2
      L25_2 = L25_2(L26_2, L27_2, L28_2)
      L26_2 = "success"
      L24_2(L25_2, L26_2)
    else
      L24_2 = Config
      L24_2 = L24_2.Debug
      if L24_2 then
        L24_2 = Notify
        L25_2 = Config
        L25_2 = L25_2.LangT
        L25_2 = L25_2.NotLucky
        L26_2 = "error"
        L24_2(L25_2, L26_2)
      end
    end
  end
  L13_2 = DeleteEntity
  L14_2 = L10_2
  L13_2(L14_2)
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:DoGlassCaseAnimation"
function L137_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2
  L4_2 = 0.5
  L5_2 = GetEntityHeading
  L6_2 = A3_2.DataObject
  L5_2 = L5_2(L6_2)
  A3_2.Heading = L5_2
  L6_2 = math
  L6_2 = L6_2.rad
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = math
  L7_2 = L7_2.sin
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L7_2 = -L7_2
  L7_2 = L7_2 * L4_2
  L8_2 = math
  L8_2 = L8_2.cos
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L8_2 = L8_2 * L4_2
  L9_2 = {}
  L10_2 = vector3
  L11_2 = A3_2.Coords
  L11_2 = L11_2.x
  L12_2 = A3_2.Coords
  L12_2 = L12_2.y
  L13_2 = A3_2.Coords
  L13_2 = L13_2.z
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L9_2.Coords = L10_2
  L10_2 = A3_2.Rotation
  L9_2.Rotation = L10_2
  L10_2 = A3_2.PropName
  L9_2.PropName = L10_2
  L10_2 = A3_2.RobberyName
  L9_2.RobberyName = L10_2
  L10_2 = A3_2.Stage
  L9_2.Stage = L10_2
  L10_2 = L9_2.Coords
  L11_2 = L9_2.Rotation
  L12_2 = L9_2.Coords
  L13_2 = A1_2
  L14_2 = L10_2
  L15_2 = vector3
  L16_2 = L14_2.x
  L17_2 = L14_2.y
  L18_2 = L14_2.z
  L15_2 = L15_2(L16_2, L17_2, L18_2)
  L16_2 = L11_2
  L17_2 = "anim@scripted@heist@ig16_glass_cut@male@"
  if A3_2 then
    L18_2 = A3_2.LocalOnly
    if L18_2 then
      L18_2 = A3_2.DataObject
      if L18_2 then
        L18_2 = DoesEntityExist
        L19_2 = A3_2.DataObject
        L18_2 = L18_2(L19_2)
        if L18_2 then
          L18_2 = TriggerEvent
          L19_2 = "FullyDeleteRobberiesEntity"
          L20_2 = A3_2.DataObject
          L18_2(L19_2, L20_2)
        end
      end
  end
  else
    L18_2 = TriggerServerEvent
    L19_2 = "Pug:server:DeleteRobberiesEntity"
    L20_2 = A3_2.Coords
    L21_2 = A3_2.PropName
    L22_2 = A3_2.Heist
    L22_2 = L22_2.heist_name
    L23_2 = A3_2.Stage
    if L23_2 then
      L23_2 = A3_2.Stage
      L23_2 = L23_2.stepNumber
    end
    L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
    L18_2 = TriggerServerEvent
    L19_2 = "Pug:server:DeleteRobberiesEntity"
    L20_2 = vector3
    L21_2 = A3_2.Coords
    L21_2 = L21_2.x
    L22_2 = A3_2.Coords
    L22_2 = L22_2.y
    L23_2 = A3_2.Coords
    L23_2 = L23_2.z
    L23_2 = L23_2 + 1
    L20_2 = L20_2(L21_2, L22_2, L23_2)
    L21_2 = GetHashKey
    L22_2 = "h4_prop_h4_necklace_01a"
    L21_2 = L21_2(L22_2)
    L22_2 = A3_2.Heist
    L22_2 = L22_2.heist_name
    L23_2 = A3_2.Stage
    if L23_2 then
      L23_2 = A3_2.Stage
      L23_2 = L23_2.stepNumber
    end
    L18_2(L19_2, L20_2, L21_2, L22_2, L23_2)
  end
  L18_2 = RequestAnimDict
  L19_2 = L17_2
  L18_2(L19_2)
  while true do
    L18_2 = HasAnimDictLoaded
    L19_2 = L17_2
    L18_2 = L18_2(L19_2)
    if L18_2 then
      break
    end
    L18_2 = Wait
    L19_2 = 1
    L18_2(L19_2)
  end
  L18_2 = {}
  L19_2 = "hei_p_m_bag_var22_arm_s"
  L20_2 = "h4_prop_h4_cutter_01a"
  L21_2 = "h4_prop_h4_glass_disp_01a"
  L22_2 = "h4_prop_h4_glass_disp_01b"
  L23_2 = "h4_prop_h4_necklace_01a"
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L18_2[4] = L22_2
  L18_2[5] = L23_2
  L19_2 = ipairs
  L20_2 = L18_2
  L19_2, L20_2, L21_2, L22_2 = L19_2(L20_2)
  for L23_2, L24_2 in L19_2, L20_2, L21_2, L22_2 do
    L25_2 = GetHashKey
    L26_2 = L24_2
    L25_2 = L25_2(L26_2)
    L26_2 = RequestModel
    L27_2 = L25_2
    L26_2(L27_2)
    while true do
      L26_2 = HasModelLoaded
      L27_2 = L25_2
      L26_2 = L26_2(L27_2)
      if L26_2 then
        break
      end
      L26_2 = Wait
      L27_2 = 1
      L26_2(L27_2)
    end
  end
  L19_2 = "scr_ih_fin"
  L20_2 = RequestNamedPtfxAsset
  L21_2 = L19_2
  L20_2(L21_2)
  while true do
    L20_2 = HasNamedPtfxAssetLoaded
    L21_2 = L19_2
    L20_2 = L20_2(L21_2)
    if L20_2 then
      break
    end
    L20_2 = Wait
    L21_2 = 1
    L20_2(L21_2)
  end
  L20_2 = RequestScriptAudioBank
  L21_2 = "DLC_HEI4/DLCHEI4_GENERIC_01"
  L22_2 = false
  L20_2(L21_2, L22_2)
  L20_2 = CreateObject
  L21_2 = GetHashKey
  L22_2 = "hei_p_m_bag_var22_arm_s"
  L21_2 = L21_2(L22_2)
  L22_2 = L14_2
  L23_2 = false
  L24_2 = false
  L25_2 = false
  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2, L25_2)
  L21_2 = CreateObject
  L22_2 = GetHashKey
  L23_2 = "h4_prop_h4_cutter_01a"
  L22_2 = L22_2(L23_2)
  L23_2 = L14_2
  L24_2 = false
  L25_2 = false
  L26_2 = false
  L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
  L22_2 = CreateObject
  L23_2 = GetHashKey
  L24_2 = "h4_prop_h4_glass_disp_01a"
  L23_2 = L23_2(L24_2)
  L24_2 = L15_2
  L25_2 = false
  L26_2 = false
  L27_2 = false
  L22_2 = L22_2(L23_2, L24_2, L25_2, L26_2, L27_2)
  L23_2 = SetEntityHeading
  L24_2 = L22_2
  L25_2 = L5_2
  L23_2(L24_2, L25_2)
  L23_2 = CreateObject
  L24_2 = GetHashKey
  L25_2 = "h4_prop_h4_necklace_01a"
  L24_2 = L24_2(L25_2)
  L25_2 = L15_2
  L26_2 = false
  L27_2 = false
  L28_2 = false
  L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
  L24_2 = SetEntityHeading
  L25_2 = L23_2
  L26_2 = L5_2
  L24_2(L25_2, L26_2)
  L24_2 = SetEntityCoords
  L25_2 = L23_2
  L26_2 = L15_2.x
  L27_2 = L15_2.y
  L28_2 = L15_2.z
  L28_2 = L28_2 + 1.0
  L24_2(L25_2, L26_2, L27_2, L28_2)
  L24_2 = FreezeEntityPosition
  L25_2 = L13_2
  L26_2 = true
  L24_2(L25_2, L26_2)
  L24_2 = CreateCam
  L25_2 = "DEFAULT_ANIMATED_CAMERA"
  L26_2 = true
  L24_2 = L24_2(L25_2, L26_2)
  L25_2 = SetCamActive
  L26_2 = L24_2
  L27_2 = true
  L25_2(L26_2, L27_2)
  L25_2 = RenderScriptCams
  L26_2 = true
  L27_2 = false
  L28_2 = 3000
  L29_2 = true
  L30_2 = false
  L25_2(L26_2, L27_2, L28_2, L29_2, L30_2)
  function L25_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L2_3 = NetworkCreateSynchronisedScene
    L3_3 = L15_2
    L4_3 = L16_2
    L5_3 = 2
    L6_3 = true
    L7_3 = false
    L8_3 = 1.0
    L9_3 = 0
    L10_3 = 1.0
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = NetworkAddPedToSynchronisedScene
    L4_3 = L13_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = 1.5
    L9_3 = -4.0
    L10_3 = 1
    L11_3 = 9
    L12_3 = 1148846080
    L13_3 = 0
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
    L3_3 = NetworkAddEntityToSynchronisedScene
    L4_3 = L20_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = "_bag"
    L7_3 = L7_3 .. L8_3
    L8_3 = 1.0
    L9_3 = -1.0
    L10_3 = 1
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = NetworkAddEntityToSynchronisedScene
    L4_3 = L21_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = "_cutter"
    L7_3 = L7_3 .. L8_3
    L8_3 = 1.0
    L9_3 = -1.0
    L10_3 = 1
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = NetworkAddEntityToSynchronisedScene
    L4_3 = L22_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = "_glass_display"
    L7_3 = L7_3 .. L8_3
    L8_3 = 1.0
    L9_3 = -1.0
    L10_3 = 1
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = NetworkAddEntityToSynchronisedScene
    L4_3 = L23_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = "_necklace"
    L7_3 = L7_3 .. L8_3
    L8_3 = 1.0
    L9_3 = -1.0
    L10_3 = 1
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = SetSynchronizedSceneHoldLastFrame
    L4_3 = L2_3
    L5_3 = true
    L3_3(L4_3, L5_3)
    L3_3 = NetworkStartSynchronisedScene
    L4_3 = L2_3
    L3_3(L4_3)
    if A1_3 then
      L3_3 = PlayCamAnim
      L4_3 = L24_2
      L5_3 = A1_3
      L6_3 = L17_2
      L7_3 = L15_2
      L8_3 = L16_2
      L9_3 = 0
      L10_3 = 2
      L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    end
    return L2_3
  end
  L26_2 = L25_2
  L27_2 = "enter"
  L28_2 = "enter_cam"
  L26_2 = L26_2(L27_2, L28_2)
  L27_2 = Wait
  L28_2 = GetAnimDuration
  L29_2 = L17_2
  L30_2 = "enter"
  L28_2 = L28_2(L29_2, L30_2)
  L28_2 = L28_2 * 1000
  L27_2(L28_2)
  L27_2 = L25_2
  L28_2 = "idle"
  L29_2 = "idle_cam"
  L27_2 = L27_2(L28_2, L29_2)
  L28_2 = L25_2
  L29_2 = "cutting_loop"
  L30_2 = "cutting_loop_cam"
  L28_2 = L28_2(L29_2, L30_2)
  L29_2 = UseParticleFxAssetNextCall
  L30_2 = L19_2
  L29_2(L30_2)
  L29_2 = StartParticleFxLoopedOnEntity
  L30_2 = "scr_ih_fin_glass_cutter_cut"
  L31_2 = L21_2
  L32_2 = 0.0
  L33_2 = 0.0
  L34_2 = 0.0
  L35_2 = 0.0
  L36_2 = 0.0
  L37_2 = 0.0
  L38_2 = 1.0
  L39_2 = false
  L40_2 = false
  L41_2 = false
  L29_2 = L29_2(L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2)
  L30_2 = GetSoundId
  L30_2 = L30_2()
  L31_2 = PlaySoundFromEntity
  L32_2 = L30_2
  L33_2 = "StartCutting"
  L34_2 = L21_2
  L35_2 = "DLC_H4_anims_glass_cutter_Sounds"
  L36_2 = false
  L37_2 = 0
  L31_2(L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
  L31_2 = Wait
  L32_2 = 5000
  L31_2(L32_2)
  L31_2 = L25_2
  L32_2 = "overheat_react_01"
  L33_2 = "overheat_react_01_cam"
  L31_2 = L31_2(L32_2, L33_2)
  L32_2 = UseParticleFxAssetNextCall
  L33_2 = L19_2
  L32_2(L33_2)
  L32_2 = StartParticleFxLoopedOnEntity
  L33_2 = "scr_ih_fin_glass_cutter_overheat"
  L34_2 = L21_2
  L35_2 = 0.0
  L36_2 = 0.0
  L37_2 = 0.0
  L38_2 = 0.0
  L39_2 = 0.0
  L40_2 = 0.0
  L41_2 = 1.0
  L42_2 = false
  L43_2 = false
  L44_2 = false
  L32_2 = L32_2(L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2, L44_2)
  L33_2 = GetSoundId
  L33_2 = L33_2()
  L34_2 = PlaySoundFromEntity
  L35_2 = L33_2
  L36_2 = "Overheated"
  L37_2 = L21_2
  L38_2 = "DLC_H4_ANIMS_GLASS_CUTTER_SOUNDS"
  L39_2 = true
  L40_2 = 0
  L34_2(L35_2, L36_2, L37_2, L38_2, L39_2, L40_2)
  L34_2 = Wait
  L35_2 = GetAnimDuration
  L36_2 = L17_2
  L37_2 = "overheat_react_01"
  L35_2 = L35_2(L36_2, L37_2)
  L35_2 = L35_2 * 1000
  L34_2(L35_2)
  L34_2 = StopParticleFxLooped
  L35_2 = L32_2
  L36_2 = 0
  L34_2(L35_2, L36_2)
  L34_2 = StopSound
  L35_2 = L33_2
  L34_2(L35_2)
  L34_2 = ReleaseSoundId
  L35_2 = L33_2
  L34_2(L35_2)
  L34_2 = StopParticleFxLooped
  L35_2 = L29_2
  L36_2 = 0
  L34_2(L35_2, L36_2)
  L34_2 = StopSound
  L35_2 = L30_2
  L34_2(L35_2)
  L34_2 = ReleaseSoundId
  L35_2 = L30_2
  L34_2(L35_2)
  L34_2 = DeleteObject
  L35_2 = L22_2
  L34_2(L35_2)
  L34_2 = CreateObject
  L35_2 = GetHashKey
  L36_2 = "h4_prop_h4_glass_disp_01b"
  L35_2 = L35_2(L36_2)
  L36_2 = L15_2
  L37_2 = false
  L38_2 = false
  L39_2 = false
  L34_2 = L34_2(L35_2, L36_2, L37_2, L38_2, L39_2)
  L22_2 = L34_2
  L34_2 = SetEntityHeading
  L35_2 = L22_2
  L36_2 = L5_2
  L34_2(L35_2, L36_2)
  L34_2 = L25_2
  L35_2 = "success"
  L36_2 = "success_cam"
  L34_2 = L34_2(L35_2, L36_2)
  L35_2 = Wait
  L36_2 = 2000
  L35_2(L36_2)
  L35_2 = SetEntityVisible
  L36_2 = L23_2
  L37_2 = false
  L38_2 = false
  L35_2(L36_2, L37_2, L38_2)
  L35_2 = Wait
  L36_2 = GetAnimDuration
  L37_2 = L17_2
  L38_2 = "success"
  L36_2 = L36_2(L37_2, L38_2)
  L36_2 = L36_2 * 1000
  L36_2 = L36_2 - 2000
  L35_2(L36_2)
  L35_2 = RenderScriptCams
  L36_2 = false
  L37_2 = false
  L38_2 = 0
  L39_2 = true
  L40_2 = false
  L35_2(L36_2, L37_2, L38_2, L39_2, L40_2)
  L35_2 = DestroyCam
  L36_2 = L24_2
  L37_2 = false
  L35_2(L36_2, L37_2)
  if A3_2 then
    L35_2 = A3_2.LocalOnly
    if L35_2 then
      L35_2 = TriggerEvent
      L36_2 = "Pug:client:CreateSyncedProps"
      L37_2 = A3_2.Coords
      L38_2 = A3_2.Rotation
      L39_2 = false
      L40_2 = A3_2.RobberyName
      L41_2 = A3_2.PropName
      L42_2 = A3_2
      L35_2(L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2)
  end
  else
    L35_2 = TriggerServerEvent
    L36_2 = "Pug:server:CreateSyncedProps"
    L37_2 = A3_2.Coords
    L38_2 = A3_2.Rotation
    L39_2 = false
    L40_2 = A3_2.RobberyName
    L41_2 = A3_2.PropName
    L42_2 = A3_2
    L35_2(L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2)
  end
  L35_2 = TriggerEvent
  L36_2 = "FullyDeleteRobberiesEntity"
  L37_2 = L23_2
  L35_2(L36_2, L37_2)
  L35_2 = TriggerEvent
  L36_2 = "FullyDeleteRobberiesEntity"
  L37_2 = L20_2
  L35_2(L36_2, L37_2)
  L35_2 = TriggerEvent
  L36_2 = "FullyDeleteRobberiesEntity"
  L37_2 = L21_2
  L35_2(L36_2, L37_2)
  L35_2 = TriggerEvent
  L36_2 = "FullyDeleteRobberiesEntity"
  L37_2 = L22_2
  L35_2(L36_2, L37_2)
  L35_2 = TriggerEvent
  L36_2 = "FullyDeleteRobberiesEntity"
  L37_2 = L1_1
  L35_2(L36_2, L37_2)
  L35_2 = RemoveAnimDict
  L36_2 = L17_2
  L35_2(L36_2)
  L35_2 = ipairs
  L36_2 = L18_2
  L35_2, L36_2, L37_2, L38_2 = L35_2(L36_2)
  for L39_2, L40_2 in L35_2, L36_2, L37_2, L38_2 do
    L41_2 = GetHashKey
    L42_2 = L40_2
    L41_2 = L41_2(L42_2)
    L42_2 = SetModelAsNoLongerNeeded
    L43_2 = L41_2
    L42_2(L43_2)
  end
  L35_2 = RemoveNamedPtfxAsset
  L36_2 = L19_2
  L35_2(L36_2)
  L35_2 = FreezeEntityPosition
  L36_2 = L13_2
  L37_2 = false
  L35_2(L36_2, L37_2)
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:DoPaintingAnimation"
function L137_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2, L43_2
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = GetEntityCoords
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  L6_2 = GetEntityHeading
  L7_2 = A3_2.DataObject
  L6_2 = L6_2(L7_2)
  A3_2.Heading = L6_2
  L7_2 = -0.43
  L8_2 = math
  L8_2 = L8_2.rad
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L9_2 = math
  L9_2 = L9_2.sin
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  L9_2 = -L9_2
  L9_2 = L9_2 * L7_2
  L10_2 = math
  L10_2 = L10_2.cos
  L11_2 = L8_2
  L10_2 = L10_2(L11_2)
  L10_2 = L10_2 * L7_2
  L11_2 = {}
  L12_2 = vector3
  L13_2 = A3_2.Coords
  L13_2 = L13_2.x
  L13_2 = L13_2 + L9_2
  L14_2 = A3_2.Coords
  L14_2 = L14_2.y
  L14_2 = L14_2 + L10_2
  L15_2 = A3_2.Coords
  L15_2 = L15_2.z
  L15_2 = L15_2 - 1.163
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L11_2.Coords = L12_2
  L12_2 = A3_2.Rotation
  L11_2.Rotation = L12_2
  L12_2 = A3_2.PropName
  L11_2.PropName = L12_2
  L12_2 = A3_2.RobberyName
  L11_2.RobberyName = L12_2
  L12_2 = A3_2.Stage
  L11_2.Stage = L12_2
  L12_2 = A1_2
  L13_2 = L11_2.Coords
  L14_2 = L11_2.Rotation
  L15_2 = L11_2.Coords
  L16_2 = L14_2
  L17_2 = "anim_heist@hs3f@ig11_steal_painting@male@"
  L18_2 = RequestAnimDict
  L19_2 = L17_2
  L18_2(L19_2)
  while true do
    L18_2 = HasAnimDictLoaded
    L19_2 = L17_2
    L18_2 = L18_2(L19_2)
    if L18_2 then
      break
    end
    L18_2 = Wait
    L19_2 = 1
    L18_2(L19_2)
  end
  L18_2 = {}
  L19_2 = "hei_p_m_bag_var22_arm_s"
  L20_2 = "w_me_switchblade"
  L21_2 = L11_2.PropName
  L18_2[1] = L19_2
  L18_2[2] = L20_2
  L18_2[3] = L21_2
  L19_2 = ipairs
  L20_2 = L18_2
  L19_2, L20_2, L21_2, L22_2 = L19_2(L20_2)
  for L23_2, L24_2 in L19_2, L20_2, L21_2, L22_2 do
    L25_2 = GetHashKey
    L26_2 = L24_2
    L25_2 = L25_2(L26_2)
    L26_2 = RequestModel
    L27_2 = L25_2
    L26_2(L27_2)
    while true do
      L26_2 = HasModelLoaded
      L27_2 = L25_2
      L26_2 = L26_2(L27_2)
      if L26_2 then
        break
      end
      L26_2 = Wait
      L27_2 = 1
      L26_2(L27_2)
    end
  end
  if A3_2 then
    L19_2 = A3_2.LocalOnly
    if L19_2 then
      L19_2 = A3_2.DataObject
      if L19_2 then
        L19_2 = DoesEntityExist
        L20_2 = A3_2.DataObject
        L19_2 = L19_2(L20_2)
        if L19_2 then
          L19_2 = TriggerEvent
          L20_2 = "FullyDeleteRobberiesEntity"
          L21_2 = A3_2.DataObject
          L19_2(L20_2, L21_2)
        end
      end
  end
  else
    L19_2 = TriggerServerEvent
    L20_2 = "Pug:server:DeleteRobberiesEntity"
    L21_2 = A3_2.Coords
    L22_2 = A3_2.PropName
    L23_2 = A3_2.Heist
    L23_2 = L23_2.heist_name
    L24_2 = A3_2.Stage
    if L24_2 then
      L24_2 = A3_2.Stage
      L24_2 = L24_2.stepNumber
    end
    L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
  end
  L19_2 = CreateObject
  L20_2 = GetHashKey
  L21_2 = "hei_p_m_bag_var22_arm_s"
  L20_2 = L20_2(L21_2)
  L21_2 = L13_2
  L22_2 = true
  L23_2 = true
  L24_2 = false
  L19_2 = L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
  L20_2 = CreateObject
  L21_2 = GetHashKey
  L22_2 = "w_me_switchblade"
  L21_2 = L21_2(L22_2)
  L22_2 = L13_2
  L23_2 = true
  L24_2 = true
  L25_2 = false
  L20_2 = L20_2(L21_2, L22_2, L23_2, L24_2, L25_2)
  L21_2 = CreateObject
  L22_2 = GetHashKey
  L23_2 = L11_2.PropName
  L22_2 = L22_2(L23_2)
  L23_2 = L13_2
  L24_2 = true
  L25_2 = true
  L26_2 = false
  L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)
  L22_2 = FreezeEntityPosition
  L23_2 = L12_2
  L24_2 = true
  L22_2(L23_2, L24_2)
  L22_2 = CreateCam
  L23_2 = "DEFAULT_ANIMATED_CAMERA"
  L24_2 = true
  L22_2 = L22_2(L23_2, L24_2)
  L23_2 = SetCamActive
  L24_2 = L22_2
  L25_2 = true
  L23_2(L24_2, L25_2)
  L23_2 = RenderScriptCams
  L24_2 = true
  L25_2 = false
  L26_2 = 3000
  L27_2 = true
  L28_2 = false
  L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
  function L23_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3
    L2_3 = NetworkCreateSynchronisedScene
    L3_3 = L15_2
    L4_3 = L16_2
    L5_3 = 2
    L6_3 = true
    L7_3 = false
    L8_3 = 1.0
    L9_3 = 0
    L10_3 = 1.0
    L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = NetworkAddPedToSynchronisedScene
    L4_3 = L12_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = 1.5
    L9_3 = -4.0
    L10_3 = 1
    L11_3 = 9
    L12_3 = 1148846080
    L13_3 = 0
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)
    L3_3 = NetworkAddEntityToSynchronisedScene
    L4_3 = L19_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = "_hei_p_m_bag_var22_arm_s"
    L7_3 = L7_3 .. L8_3
    L8_3 = 1.0
    L9_3 = -1.0
    L10_3 = 1
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = NetworkAddEntityToSynchronisedScene
    L4_3 = L20_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = "_w_me_switchblade"
    L7_3 = L7_3 .. L8_3
    L8_3 = 1.0
    L9_3 = -1.0
    L10_3 = 1
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = NetworkAddEntityToSynchronisedScene
    L4_3 = L21_2
    L5_3 = L2_3
    L6_3 = L17_2
    L7_3 = A0_3
    L8_3 = "_ch_prop_vault_painting_01a"
    L7_3 = L7_3 .. L8_3
    L8_3 = 1.0
    L9_3 = -1.0
    L10_3 = 1
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    L3_3 = SetSynchronizedSceneHoldLastFrame
    L4_3 = L2_3
    L5_3 = true
    L3_3(L4_3, L5_3)
    L3_3 = NetworkStartSynchronisedScene
    L4_3 = L2_3
    L3_3(L4_3)
    L3_3 = PlayCamAnim
    L4_3 = L22_2
    L5_3 = A1_3
    L6_3 = L17_2
    L7_3 = L15_2
    L8_3 = L16_2
    L9_3 = 0
    L10_3 = 2
    L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)
    return L2_3
  end
  L24_2 = L23_2
  L25_2 = "ver_01_top_left_enter"
  L26_2 = "ver_01_top_left_enter_cam_ble"
  L24_2 = L24_2(L25_2, L26_2)
  L25_2 = Wait
  L26_2 = GetAnimDuration
  L27_2 = L17_2
  L28_2 = "ver_01_top_left_enter"
  L26_2 = L26_2(L27_2, L28_2)
  L26_2 = L26_2 * 1000
  L25_2(L26_2)
  L25_2 = L23_2
  L26_2 = "ver_01_cutting_top_left_idle"
  L27_2 = "ver_01_cutting_top_left_idle_cam"
  L25_2 = L25_2(L26_2, L27_2)
  L26_2 = false
  while not L26_2 do
    L27_2 = Wait
    L28_2 = 1
    L27_2(L28_2)
    L27_2 = SetTextComponentFormat
    L28_2 = "STRING"
    L27_2(L28_2)
    L27_2 = AddTextComponentString
    L28_2 = "Press ~INPUT_CONTEXT~ SLICE RIGHT"
    L27_2(L28_2)
    L27_2 = DisplayHelpTextFromStringLabel
    L28_2 = 0
    L29_2 = 0
    L30_2 = 1
    L31_2 = -1
    L27_2(L28_2, L29_2, L30_2, L31_2)
    L27_2 = IsControlJustPressed
    L28_2 = 0
    L29_2 = 51
    L27_2 = L27_2(L28_2, L29_2)
    if L27_2 then
      L26_2 = true
    end
  end
  L27_2 = L23_2
  L28_2 = "ver_01_cutting_top_left_to_right"
  L29_2 = "ver_01_cutting_top_left_to_right_cam"
  L27_2 = L27_2(L28_2, L29_2)
  L28_2 = Wait
  L29_2 = GetAnimDuration
  L30_2 = L17_2
  L31_2 = "ver_01_cutting_top_left_to_right"
  L29_2 = L29_2(L30_2, L31_2)
  L29_2 = L29_2 * 1000
  L28_2(L29_2)
  L28_2 = L23_2
  L29_2 = "ver_01_cutting_top_right_idle"
  L30_2 = "ver_01_cutting_top_right_idle_cam"
  L28_2 = L28_2(L29_2, L30_2)
  L26_2 = false
  while not L26_2 do
    L29_2 = Wait
    L30_2 = 1
    L29_2(L30_2)
    L29_2 = SetTextComponentFormat
    L30_2 = "STRING"
    L29_2(L30_2)
    L29_2 = AddTextComponentString
    L30_2 = "Press ~INPUT_CONTEXT~ SLICE DOWN"
    L29_2(L30_2)
    L29_2 = DisplayHelpTextFromStringLabel
    L30_2 = 0
    L31_2 = 0
    L32_2 = 1
    L33_2 = -1
    L29_2(L30_2, L31_2, L32_2, L33_2)
    L29_2 = IsControlJustPressed
    L30_2 = 0
    L31_2 = 51
    L29_2 = L29_2(L30_2, L31_2)
    if L29_2 then
      L26_2 = true
    end
  end
  L29_2 = L23_2
  L30_2 = "ver_01_cutting_right_top_to_bottom"
  L31_2 = "ver_01_cutting_right_top_to_bottom_cam"
  L29_2 = L29_2(L30_2, L31_2)
  L30_2 = Wait
  L31_2 = GetAnimDuration
  L32_2 = L17_2
  L33_2 = "ver_01_cutting_right_top_to_bottom"
  L31_2 = L31_2(L32_2, L33_2)
  L31_2 = L31_2 * 1000
  L30_2(L31_2)
  L30_2 = L23_2
  L31_2 = "ver_01_cutting_bottom_right_idle"
  L32_2 = "ver_01_cutting_bottom_right_idle_cam"
  L30_2 = L30_2(L31_2, L32_2)
  L26_2 = false
  while not L26_2 do
    L31_2 = Wait
    L32_2 = 1
    L31_2(L32_2)
    L31_2 = SetTextComponentFormat
    L32_2 = "STRING"
    L31_2(L32_2)
    L31_2 = AddTextComponentString
    L32_2 = "Press ~INPUT_CONTEXT~ SLICE LEFT"
    L31_2(L32_2)
    L31_2 = DisplayHelpTextFromStringLabel
    L32_2 = 0
    L33_2 = 0
    L34_2 = 1
    L35_2 = -1
    L31_2(L32_2, L33_2, L34_2, L35_2)
    L31_2 = IsControlJustPressed
    L32_2 = 0
    L33_2 = 51
    L31_2 = L31_2(L32_2, L33_2)
    if L31_2 then
      L26_2 = true
    end
  end
  L31_2 = L23_2
  L32_2 = "ver_01_cutting_bottom_right_to_left"
  L33_2 = "ver_01_cutting_bottom_right_to_left_cam"
  L31_2 = L31_2(L32_2, L33_2)
  L32_2 = Wait
  L33_2 = GetAnimDuration
  L34_2 = L17_2
  L35_2 = "ver_01_cutting_bottom_right_to_left"
  L33_2 = L33_2(L34_2, L35_2)
  L33_2 = L33_2 * 1000
  L32_2(L33_2)
  L32_2 = L23_2
  L33_2 = "ver_01_cutting_bottom_left_idle"
  L34_2 = "ver_01_cutting_bottom_left_idle_cam"
  L32_2 = L32_2(L33_2, L34_2)
  L33_2 = L23_2
  L34_2 = "ver_01_cutting_left_top_to_bottom"
  L35_2 = "ver_01_cutting_left_top_to_bottom_cam"
  L33_2 = L33_2(L34_2, L35_2)
  L34_2 = Wait
  L35_2 = GetAnimDuration
  L36_2 = L17_2
  L37_2 = "ver_01_cutting_left_top_to_bottom"
  L35_2 = L35_2(L36_2, L37_2)
  L35_2 = L35_2 * 1000
  L34_2(L35_2)
  L34_2 = L23_2
  L35_2 = "ver_01_with_painting_exit"
  L36_2 = "ver_01_with_painting_exit_cam"
  L34_2 = L34_2(L35_2, L36_2)
  L35_2 = RenderScriptCams
  L36_2 = false
  L37_2 = false
  L38_2 = 0
  L39_2 = true
  L40_2 = false
  L35_2(L36_2, L37_2, L38_2, L39_2, L40_2)
  L35_2 = DestroyCam
  L36_2 = L22_2
  L37_2 = false
  L35_2(L36_2, L37_2)
  L35_2 = Wait
  L36_2 = GetAnimDuration
  L37_2 = L17_2
  L38_2 = "ver_01_with_painting_exit"
  L36_2 = L36_2(L37_2, L38_2)
  L36_2 = L36_2 * 1000
  L35_2(L36_2)
  L35_2 = NetworkStopSynchronisedScene
  L36_2 = L34_2
  L35_2(L36_2)
  L35_2 = DeleteObject
  L36_2 = L19_2
  L35_2(L36_2)
  L35_2 = DeleteObject
  L36_2 = L21_2
  L35_2(L36_2)
  L35_2 = DeleteObject
  L36_2 = L20_2
  L35_2(L36_2)
  L35_2 = RemoveAnimDict
  L36_2 = L17_2
  L35_2(L36_2)
  L35_2 = ipairs
  L36_2 = L18_2
  L35_2, L36_2, L37_2, L38_2 = L35_2(L36_2)
  for L39_2, L40_2 in L35_2, L36_2, L37_2, L38_2 do
    L41_2 = GetHashKey
    L42_2 = L40_2
    L41_2 = L41_2(L42_2)
    L42_2 = SetModelAsNoLongerNeeded
    L43_2 = L41_2
    L42_2(L43_2)
  end
  if A3_2 then
    L35_2 = A3_2.LocalOnly
    if L35_2 then
      L35_2 = TriggerEvent
      L36_2 = "Pug:client:CreateSyncedProps"
      L37_2 = A3_2.Coords
      L38_2 = A3_2.Rotation
      L39_2 = "anim_heist@hs3f@ig11_steal_painting@male@"
      L40_2 = A3_2.RobberyName
      L41_2 = A3_2.PropName
      L42_2 = A3_2
      L35_2(L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2)
  end
  else
    L35_2 = TriggerServerEvent
    L36_2 = "Pug:server:CreateSyncedProps"
    L37_2 = A3_2.Coords
    L38_2 = A3_2.Rotation
    L39_2 = "anim_heist@hs3f@ig11_steal_painting@male@"
    L40_2 = A3_2.RobberyName
    L41_2 = A3_2.PropName
    L42_2 = A3_2
    L35_2(L36_2, L37_2, L38_2, L39_2, L40_2, L41_2, L42_2)
  end
  L35_2 = FreezeEntityPosition
  L36_2 = L12_2
  L37_2 = false
  L35_2(L36_2, L37_2)
end
L135_1(L136_1, L137_1)
function L135_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = GetEntityCoords
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = A1_2.x
  L4_2 = L2_2.x
  L3_2 = L3_2 - L4_2
  L4_2 = A1_2.y
  L5_2 = L2_2.y
  L4_2 = L4_2 - L5_2
  L5_2 = GetHeadingFromVector_2d
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = SetEntityHeading
  L7_2 = A0_2
  L8_2 = L5_2
  L6_2(L7_2, L8_2)
end
SetPedHeadingToFaceVector = L135_1
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:RobberyTargetHackableDoor"
function L137_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2
  L2_2 = Config
  L2_2 = L2_2.Target
  if "ox_target" == L2_2 then
    L2_2 = A0_2.args
    A1_2 = L2_2.heist
    L2_2 = A0_2.args
    A0_2 = L2_2.stage
  end
  L2_2 = TryingHack
  if L2_2 then
    return
  end
  L2_2 = A1_2 or L2_2
  if A1_2 then
    L2_2 = A1_2.heist_name
  end
  L3_2 = tonumber
  L4_2 = A0_2 or L4_2
  if A0_2 then
    L4_2 = A0_2.stepNumber
  end
  L3_2 = L3_2(L4_2)
  if L2_2 and L3_2 then
    L4_2 = L14_1
    L4_2 = L4_2[L2_2]
    if L4_2 then
      L4_2 = L14_1
      L4_2 = L4_2[L2_2]
      L4_2 = L4_2[L3_2]
      if L4_2 then
        return
      end
    end
  end
  L4_2 = Config
  L4_2 = L4_2.DontAllowPoliceToDoRobbery
  if L4_2 then
    L4_2 = PugIsRobberyCreatorPoliceJob
    L4_2 = L4_2()
    if L4_2 then
      L4_2 = Notify
      L5_2 = Config
      L5_2 = L5_2.LangT
      L5_2 = L5_2.PoliceCannotDoRobberies
      L6_2 = "error"
      L4_2(L5_2, L6_2)
      return
    end
  end
  L4_2 = json
  L4_2 = L4_2.decode
  L5_2 = A1_2.settings
  L4_2 = L4_2(L5_2)
  L5_2 = L4_2.robberyCooldown
  if "" ~= L5_2 then
    L5_2 = L4_2.robberyCooldown
    if " " ~= L5_2 then
      L5_2 = L4_2.robberyCooldown
      if L5_2 then
        goto lbl_64
      end
    end
  end
  L4_2.robberyCooldown = 0.1
  ::lbl_64::
  L5_2 = IsRobberyOnCooldown
  L6_2 = A1_2.heist_name
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = Notify
    L7_2 = Config
    L7_2 = L7_2.LangT
    L7_2 = L7_2.GlobalCooldown
    L8_2 = "error"
    L6_2(L7_2, L8_2)
    return
  end
  L6_2 = A0_2.requireBlackout
  if L6_2 then
    L6_2 = "none"
    L7_2 = Config
    L7_2 = L7_2.FrameworkFunctions
    L7_2 = L7_2.TriggerCallback
    L8_2 = "Pug:serverCB:IsCityWideBlackout"
    function L9_2(A0_3)
      local L1_3
      if A0_3 then
        L1_3 = true
        L6_2 = L1_3
      else
        L1_3 = false
        L6_2 = L1_3
      end
    end
    L7_2(L8_2, L9_2)
    while "none" == L6_2 do
      L7_2 = Wait
      L8_2 = 50
      L7_2(L8_2)
    end
    if not L6_2 then
      L7_2 = L34_1
      L8_2 = A1_2.heist_name
      L9_2 = A0_2
      L10_2 = "blackout_required"
      L11_2 = Config
      L11_2 = L11_2.LangT
      L11_2 = L11_2.LightsNeedToBeOut
      L7_2(L8_2, L9_2, L10_2, L11_2)
      L7_2 = Notify
      L8_2 = Config
      L8_2 = L8_2.LangT
      L8_2 = L8_2.LightsNeedToBeOut
      L9_2 = "error"
      L7_2(L8_2, L9_2)
      return
    end
  end
  L6_2 = true
  L7_2 = false
  L8_2 = {}
  L9_2 = {}
  L10_2 = type
  L11_2 = A0_2.requiredStepNumbers
  L10_2 = L10_2(L11_2)
  if "table" == L10_2 then
    L10_2 = ipairs
    L11_2 = A0_2.requiredStepNumbers
    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
    for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do
      L16_2 = tonumber
      L17_2 = L15_2
      L16_2 = L16_2(L17_2)
      if L16_2 and L16_2 > 0 then
        L17_2 = tonumber
        L18_2 = A0_2.stepNumber
        L17_2 = L17_2(L18_2)
        if L16_2 ~= L17_2 then
          L8_2[L16_2] = true
        end
      end
    end
  end
  L10_2 = next
  L11_2 = L8_2
  L10_2 = L10_2(L11_2)
  if nil == L10_2 then
    L10_2 = A0_2.isRequiredNextStage
    if L10_2 then
      L10_2 = tonumber
      L11_2 = A0_2.stepNumber
      L10_2 = L10_2(L11_2)
      L10_2 = L10_2 - 1
      if L10_2 and L10_2 > 0 then
        L8_2[L10_2] = true
      end
    end
  end
  L10_2 = {}
  L11_2 = pairs
  L12_2 = L8_2
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2 in L11_2, L12_2, L13_2, L14_2 do
    L16_2 = table
    L16_2 = L16_2.insert
    L17_2 = L10_2
    L18_2 = L15_2
    L16_2(L17_2, L18_2)
  end
  L11_2 = table
  L11_2 = L11_2.sort
  L12_2 = L10_2
  L11_2(L12_2)
  L11_2 = #L10_2
  if L11_2 > 0 then
    L11_2 = #L10_2
    L12_2 = ipairs
    L13_2 = L10_2
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
      L18_2 = Config
      L18_2 = L18_2.FrameworkFunctions
      L18_2 = L18_2.TriggerCallback
      L19_2 = "Pug:server:hasStepBeenCompleted"
      function L20_2(A0_3)
        local L1_3, L2_3, L3_3
        if not A0_3 then
          L1_3 = table
          L1_3 = L1_3.insert
          L2_3 = L9_2
          L3_3 = L17_2
          L1_3(L2_3, L3_3)
        end
        L1_3 = L11_2
        L1_3 = L1_3 - 1
        L11_2 = L1_3
        L1_3 = L11_2
        if L1_3 <= 0 then
          L1_3 = true
          L7_2 = L1_3
        end
      end
      L21_2 = A1_2.heist_name
      L22_2 = L17_2
      L18_2(L19_2, L20_2, L21_2, L22_2)
    end
  else
    L7_2 = true
  end
  while not L7_2 do
    L11_2 = Wait
    L12_2 = 50
    L11_2(L12_2)
  end
  L11_2 = #L9_2
  if L11_2 > 0 then
    L11_2 = table
    L11_2 = L11_2.sort
    L12_2 = L9_2
    L11_2(L12_2)
    L6_2 = false
    L11_2 = Config
    L11_2 = L11_2.T
    L12_2 = "CompleteRequiredStepsFirst"
    L13_2 = table
    L13_2 = L13_2.concat
    L14_2 = L9_2
    L15_2 = ", "
    L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L13_2(L14_2, L15_2)
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
    L12_2 = L34_1
    L13_2 = A1_2.heist_name
    L14_2 = A0_2
    L15_2 = "required_steps_missing"
    L16_2 = L11_2
    L12_2(L13_2, L14_2, L15_2, L16_2)
    L12_2 = Notify
    L13_2 = L11_2
    L14_2 = "error"
    L12_2(L13_2, L14_2)
  end
  if not L6_2 then
    return
  end
  L11_2 = true
  L12_2 = false
  L13_2 = 0
  L14_2 = Config
  L14_2 = L14_2.FrameworkFunctions
  L14_2 = L14_2.TriggerCallback
  L15_2 = "Pug:serverCB:getPoliceCount"
  function L16_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = tonumber
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      L1_3 = 0
    end
    L13_2 = L1_3
    L1_3 = tonumber
    L2_3 = L4_2.policeRequired
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      L1_3 = 0
    end
    if A0_3 < L1_3 then
      L2_3 = false
      L11_2 = L2_3
      L2_3 = Notify
      L3_3 = Config
      L3_3 = L3_3.T
      L4_3 = "NotEnoughPoliceRequired"
      L5_3 = L1_3
      L3_3 = L3_3(L4_3, L5_3)
      L4_3 = "error"
      L2_3(L3_3, L4_3)
    end
    L2_3 = true
    L12_2 = L2_3
  end
  L17_2 = L4_2.policeJobs
  L14_2(L15_2, L16_2, L17_2)
  while not L12_2 do
    L14_2 = Wait
    L15_2 = 50
    L14_2(L15_2)
  end
  if not L11_2 then
    L14_2 = L34_1
    L15_2 = A1_2.heist_name
    L16_2 = A0_2
    L17_2 = "not_enough_police"
    L18_2 = "Not enough police on duty. Required: %s, current: %s."
    L19_2 = L18_2
    L18_2 = L18_2.format
    L20_2 = tonumber
    L21_2 = L4_2.policeRequired
    L20_2 = L20_2(L21_2)
    if not L20_2 then
      L20_2 = 0
    end
    L21_2 = L13_2
    L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L18_2(L19_2, L20_2, L21_2)
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
    return
  end
  L14_2 = true
  L15_2 = false
  L16_2 = nil
  L17_2 = A0_2.xpOptions
  if L17_2 then
    L17_2 = tonumber
    L18_2 = A0_2.xpNeededAmount
    L17_2 = L17_2(L18_2)
    if not L17_2 then
      L17_2 = 0
    end
    L18_2 = A0_2.removeXpOnHit
    if L18_2 then
      L18_2 = tonumber
      L19_2 = A0_2.xpRemoveAmount
      L18_2 = L18_2(L19_2)
      if L18_2 then
        goto lbl_294
      end
      L18_2 = 0
      if L18_2 then
        goto lbl_294
      end
    end
    L18_2 = 0
    ::lbl_294::
    L19_2 = Config
    L19_2 = L19_2.FrameworkFunctions
    L19_2 = L19_2.TriggerCallback
    L20_2 = "Pug:serverCB:GetRobberyRep"
    function L21_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
      L1_3 = L17_2
      if L1_3 > 0 then
        L1_3 = L17_2
        if A0_3 < L1_3 then
          L1_3 = Config
          L1_3 = L1_3.T
          L2_3 = "NeedXP"
          L3_3 = L17_2
          L1_3 = L1_3(L2_3, L3_3)
          L2_3 = L34_1
          L3_3 = A1_2.heist_name
          L4_3 = A0_2
          L5_3 = "not_enough_xp"
          L6_3 = L1_3
          L2_3(L3_3, L4_3, L5_3, L6_3)
          L2_3 = Notify
          L3_3 = L1_3
          L4_3 = "error"
          L2_3(L3_3, L4_3)
          L2_3 = false
          L14_2 = L2_3
        end
      end
      L1_3 = L18_2
      if L1_3 > 0 then
        L1_3 = L18_2
        L16_2 = L1_3
      end
      L1_3 = true
      L15_2 = L1_3
    end
    L19_2(L20_2, L21_2)
  else
    L15_2 = true
  end
  while not L15_2 do
    L17_2 = Wait
    L18_2 = 50
    L17_2(L18_2)
  end
  if not L14_2 then
    return
  end
  L17_2 = true
  L18_2 = false
  L19_2 = Config
  L19_2 = L19_2.FrameworkFunctions
  L19_2 = L19_2.TriggerCallback
  L20_2 = "Pug:serverCB:CustomCanDoRobberyStepCheck"
  function L21_2(A0_3)
    local L1_3
    L17_2 = A0_3
    L1_3 = true
    L18_2 = L1_3
  end
  L19_2(L20_2, L21_2)
  while not L18_2 do
    L19_2 = Wait
    L20_2 = 50
    L19_2(L20_2)
  end
  if not L17_2 then
    L19_2 = L34_1
    L20_2 = A1_2.heist_name
    L21_2 = A0_2
    L22_2 = "custom_check_failed"
    L23_2 = "A custom robbery step check prevented this interaction from starting."
    L19_2(L20_2, L21_2, L22_2, L23_2)
    return
  end
  L19_2 = A0_2.requireWeaponInHand
  if L19_2 then
    L19_2 = A0_2.requiredWeapons
    if L19_2 then
      L19_2 = PlayerPedId
      L19_2 = L19_2()
      L20_2 = GetSelectedPedWeapon
      L21_2 = L19_2
      L20_2 = L20_2(L21_2)
      L21_2 = false
      L22_2 = ipairs
      L23_2 = A0_2.requiredWeapons
      L22_2, L23_2, L24_2, L25_2 = L22_2(L23_2)
      for L26_2, L27_2 in L22_2, L23_2, L24_2, L25_2 do
        L28_2 = GetHashKey
        L29_2 = L27_2
        L28_2 = L28_2(L29_2)
        if L20_2 == L28_2 then
          L21_2 = true
          break
        end
      end
      if not L21_2 then
        L22_2 = table
        L22_2 = L22_2.concat
        L23_2 = A0_2.requiredWeapons
        L24_2 = ", "
        L22_2 = L22_2(L23_2, L24_2)
        L23_2 = Config
        L23_2 = L23_2.LangT
        L23_2 = L23_2.IncorrectWeapon
        if "" ~= L22_2 then
          L24_2 = L23_2
          L25_2 = " Required: "
          L26_2 = L22_2
          L24_2 = L24_2 .. L25_2 .. L26_2
          L23_2 = L24_2
        end
        L24_2 = L34_1
        L25_2 = A1_2.heist_name
        L26_2 = A0_2
        L27_2 = "incorrect_weapon"
        L28_2 = L23_2
        L24_2(L25_2, L26_2, L27_2, L28_2)
        L24_2 = Notify
        L25_2 = Config
        L25_2 = L25_2.LangT
        L25_2 = L25_2.IncorrectWeapon
        L26_2 = "error"
        L24_2(L25_2, L26_2)
        return
      end
    end
  end
  L19_2 = A0_2.pedCoords
  if L19_2 then
    L19_2 = Config
    L19_2 = L19_2.FrameworkFunctions
    L19_2 = L19_2.TriggerCallback
    L20_2 = "Pug:server:isStepOnCooldown"
    function L21_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3
      if not A0_3 then
        L1_3 = A0_2.requiresItem
        if L1_3 then
          L1_3 = A0_2.items
          if L1_3 then
            L1_3 = A0_2.items
            L1_3 = #L1_3
            if L1_3 > 0 then
              L1_3 = ipairs
              L2_3 = A0_2.items
              L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
              for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
                L7_3 = HasItem
                L8_3 = L6_3.itemName
                L9_3 = tonumber
                L10_3 = L6_3.itemQuantity
                L9_3 = L9_3(L10_3)
                if not L9_3 then
                  L9_3 = 1
                end
                L7_3 = L7_3(L8_3, L9_3)
                if not L7_3 then
                  L8_3 = L33_1
                  L9_3 = A0_2.items
                  L8_3 = L8_3(L9_3)
                  L9_3 = Config
                  L9_3 = L9_3.LangT
                  L9_3 = L9_3.MissingItems
                  if "" ~= L8_3 then
                    L10_3 = L9_3
                    L11_3 = " Required: "
                    L12_3 = L8_3
                    L10_3 = L10_3 .. L11_3 .. L12_3
                    L9_3 = L10_3
                  end
                  L10_3 = L34_1
                  L11_3 = A1_2.heist_name
                  L12_3 = A0_2
                  L13_3 = "missing_items"
                  L14_3 = L9_3
                  L10_3(L11_3, L12_3, L13_3, L14_3)
                  L10_3 = Notify
                  L11_3 = Config
                  L11_3 = L11_3.LangT
                  L11_3 = L11_3.MissingItems
                  L12_3 = "error"
                  L10_3(L11_3, L12_3)
                  return
                end
              end
              L1_3 = ipairs
              L2_3 = A0_2.items
              L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
              for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
                L7_3 = L6_3.loseChance
                if L7_3 then
                  L7_3 = math
                  L7_3 = L7_3.random
                  L8_3 = 1
                  L9_3 = 100
                  L7_3 = L7_3(L8_3, L9_3)
                  L8_3 = tonumber
                  L9_3 = L6_3.loseChance
                  L8_3 = L8_3(L9_3)
                  if L7_3 <= L8_3 then
                    TokenIsUseable = true
                    L7_3 = HandleItems
                    L8_3 = false
                    L9_3 = tostring
                    L10_3 = L6_3.itemName
                    L9_3 = L9_3(L10_3)
                    L10_3 = tonumber
                    L11_3 = L6_3.itemQuantity
                    L10_3 = L10_3(L11_3)
                    if not L10_3 then
                      L10_3 = 1
                    end
                    L7_3(L8_3, L9_3, L10_3)
                    TokenIsUseable = false
                  end
                end
              end
            end
          end
        end
        L1_3 = TriggerServerEvent
        L2_3 = "Pug:server:SetStepOnCoolDown"
        L3_3 = A1_2.heist_name
        L4_3 = tonumber
        L5_3 = A0_2.stepNumber
        L4_3 = L4_3(L5_3)
        L5_3 = L4_2.robberyCooldown
        L1_3(L2_3, L3_3, L4_3, L5_3)
        L1_3 = TriggerServerEvent
        L2_3 = "Pug:server:TrackHeistRunStarted"
        L3_3 = A1_2.heist_name
        L1_3(L2_3, L3_3)
        TryingHack = true
        L1_3 = CreateThread
        function L2_3()
          local L0_4, L1_4, L2_4, L3_4, L4_4
          while true do
            L0_4 = TryingHack
            if not L0_4 then
              break
            end
            L0_4 = Wait
            L1_4 = 0
            L0_4(L1_4)
            L0_4 = TryingHack
            if not L0_4 then
              break
            end
            L0_4 = IsNuiFocused
            L0_4 = L0_4()
            if L0_4 then
              L1_4 = DisablePlayerFiring
              L2_4 = PlayerId
              L2_4 = L2_4()
              L3_4 = true
              L1_4(L2_4, L3_4)
            else
              L1_4 = DisableControlAction
              L2_4 = 0
              L3_4 = 24
              L4_4 = true
              L1_4(L2_4, L3_4, L4_4)
              L1_4 = DisableControlAction
              L2_4 = 0
              L3_4 = 257
              L4_4 = true
              L1_4(L2_4, L3_4, L4_4)
              L1_4 = DisableControlAction
              L2_4 = 0
              L3_4 = 25
              L4_4 = true
              L1_4(L2_4, L3_4, L4_4)
              L1_4 = DisableControlAction
              L2_4 = 0
              L3_4 = 263
              L4_4 = true
              L1_4(L2_4, L3_4, L4_4)
            end
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 188
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 187
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 21
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 30
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 31
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 19
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 45
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 22
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 44
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 37
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 23
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 288
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 289
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 170
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 167
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 26
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 73
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 71
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 2
            L3_4 = 36
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 264
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 140
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 141
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 142
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
            L1_4 = DisableControlAction
            L2_4 = 0
            L3_4 = 143
            L4_4 = true
            L1_4(L2_4, L3_4, L4_4)
          end
        end
        L1_3(L2_3)
        L1_3 = A0_2.propName
        if "p_chem_vial_02b_s" == L1_3 then
          L1_3 = GetClosestObjectOfType
          L2_3 = A0_2.targetVector
          L3_3 = 1.0
          L4_3 = GetHashKey
          L5_3 = A0_2.propName
          L4_3 = L4_3(L5_3)
          L5_3 = 0
          L6_3 = 0
          L7_3 = 0
          L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)
          if 0 ~= L1_3 then
            L2_3 = GetEntityForwardVector
            L3_3 = L1_3
            L2_3 = L2_3(L3_3)
            L3_3 = table
            L3_3 = L3_3.unpack
            L4_3 = vector3
            L5_3 = A0_2.targetVector
            L5_3 = L5_3.x
            L6_3 = A0_2.targetVector
            L6_3 = L6_3.y
            L7_3 = A0_2.targetVector
            L7_3 = L7_3.z
            L4_3 = L4_3(L5_3, L6_3, L7_3)
            L5_3 = L2_3 * 1.3
            L4_3 = L4_3 + L5_3
            L3_3, L4_3, L5_3 = L3_3(L4_3)
            L6_3 = SetEntityCoords
            L7_3 = PlayerPedId
            L7_3 = L7_3()
            L8_3 = vector3
            L9_3 = L3_3
            L10_3 = L4_3
            L11_3 = L5_3 - 1
            L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L8_3(L9_3, L10_3, L11_3)
            L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
          end
          L2_3 = SetPedHeadingToFaceVector
          L3_3 = PlayerPedId
          L3_3 = L3_3()
          L4_3 = A0_2.targetVector
          L2_3(L3_3, L4_3)
        end
        L1_3 = GetJewelryCases
        L2_3 = A0_2.propName
        L1_3 = L1_3(L2_3)
        if not L1_3 then
          L1_3 = A0_2.requireWeaponInHand
          if not L1_3 then
            L1_3 = TriggerEvent
            L2_3 = "ox_inventory:disarm"
            L3_3 = GetPlayerServerId
            L4_3 = PlayerId
            L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L4_3()
            L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
            L4_3 = true
            L1_3(L2_3, L3_3, L4_3)
            L1_3 = SetCurrentPedWeapon
            L2_3 = PlayerPedId
            L2_3 = L2_3()
            L3_3 = GetHashKey
            L4_3 = "WEAPON_UNARMED"
            L3_3 = L3_3(L4_3)
            L4_3 = true
            L1_3(L2_3, L3_3, L4_3)
          end
        end
        L1_3 = L75_1
        L2_3 = A1_2.heist_name
        L3_3 = tonumber
        L4_3 = A0_2.stepNumber
        L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L3_3(L4_3)
        L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
        L1_3 = tostring
        L2_3 = A0_2.pedCoords
        L1_3 = L1_3(L2_3)
        L3_3 = L1_3
        L2_3 = L1_3.match
        L4_3 = "([^,]+),%s*([^,]+),%s*([^,]+)"
        L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
        L5_3 = vector3
        L6_3 = tonumber
        L7_3 = L2_3
        L6_3 = L6_3(L7_3)
        L7_3 = tonumber
        L8_3 = L3_3
        L7_3 = L7_3(L8_3)
        L8_3 = tonumber
        L9_3 = L4_3
        L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L8_3(L9_3)
        L5_3 = L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
        A0_2.pedCoords = L5_3
        L5_3 = Config
        L5_3 = L5_3.RobberyAnimations
        L6_3 = A0_2.animation
        L5_3 = L5_3[L6_3]
        if not L5_3 then
          L5_3 = SetEntityCoords
          L6_3 = PlayerPedId
          L6_3 = L6_3()
          L7_3 = A0_2.pedCoords
          L5_3(L6_3, L7_3)
          L5_3 = SetEntityHeading
          L6_3 = PlayerPedId
          L6_3 = L6_3()
          L7_3 = tonumber
          L8_3 = A0_2.heading
          L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L7_3(L8_3)
          L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
        end
        L5_3 = nil
        L6_3 = nil
        L7_3 = L16_2
        if L7_3 then
          L7_3 = TriggerServerEvent
          L8_3 = "Pug:Server:ToggleRobberyRep"
          L9_3 = L16_2
          L10_3 = true
          L7_3(L8_3, L9_3, L10_3)
          L7_3 = Notify
          L8_3 = Config
          L8_3 = L8_3.T
          L9_3 = "LostXPAmount"
          L10_3 = L16_2
          L8_3 = L8_3(L9_3, L10_3)
          L9_3 = "error"
          L7_3(L8_3, L9_3)
        end
        L7_3 = A0_2.propName
        if "prop_ld_keypad_01b" == L7_3 then
          A0_2.hackType = "numberpad"
        end
        L7_3 = nil
        L8_3 = Config
        L8_3 = L8_3.RobberyAnimations
        L9_3 = A0_2.animation
        L8_3 = L8_3[L9_3]
        if L8_3 then
          L8_3 = Config
          L8_3 = L8_3.RobberyAnimations
          L9_3 = A0_2.animation
          L7_3 = L8_3[L9_3]
          L8_3 = A0_2.propName
          L9_3 = 1.5
          L10_3 = A0_2.propName
          if "tr_prop_tr_container_01a" == L10_3 then
            L9_3 = 2.5
          end
          L10_3 = L47_1
          L11_3 = A1_2.heist_name
          L12_3 = A0_2
          L13_3 = L8_3
          L10_3 = L10_3(L11_3, L12_3, L13_3)
          L5_3 = L10_3
          if not L5_3 then
            L10_3 = GetClosestObjectOfType
            L11_3 = A0_2.targetVector
            L12_3 = L9_3
            L13_3 = GetHashKey
            L14_3 = L8_3
            L13_3 = L13_3(L14_3)
            L14_3 = 0
            L15_3 = 0
            L16_3 = 0
            L10_3 = L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)
            L5_3 = L10_3
          end
          if L5_3 and 0 ~= L5_3 then
            L10_3 = DoesEntityExist
            L11_3 = L5_3
            L10_3 = L10_3(L11_3)
            if L10_3 then
              L10_3 = {}
              L11_3 = GetEntityCoords
              L12_3 = L5_3
              L11_3 = L11_3(L12_3)
              L10_3.Coords = L11_3
              L11_3 = GetEntityRotation
              L12_3 = L5_3
              L11_3 = L11_3(L12_3)
              L10_3.Rotation = L11_3
              L11_3 = A0_2.propName
              L10_3.PropName = L11_3
              L11_3 = A1_2.heist_name
              L10_3.RobberyName = L11_3
              L11_3 = A0_2
              L10_3.Stage = L11_3
              L10_3.DataObject = L5_3
              L11_3 = A1_2
              L10_3.Heist = L11_3
              L11_3 = GetEntityHeading
              L12_3 = L5_3
              L11_3 = L11_3(L12_3)
              L10_3.Heading = L11_3
              L6_3 = L10_3
            end
          end
          if L6_3 then
            L10_3 = GetStackProps
            L11_3 = A0_2.propName
            L10_3 = L10_3(L11_3)
            if not L10_3 then
              L10_3 = A0_2.propName
              if "tr_prop_tr_elecbox_01a" ~= L10_3 then
                L10_3 = GetJewelryCases
                L11_3 = A0_2.propName
                L10_3 = L10_3(L11_3)
                if L10_3 then
                  L10_3 = A0_2.hackType
                  if "none" == L10_3 then
                    goto lbl_332
                  end
                end
                L10_3 = A0_2.propName
                if "p_chem_vial_02b_s" ~= L10_3 then
                  goto lbl_344
                end
              end
            end
            ::lbl_332::
            L10_3 = PrintDebug
            L11_3 = "SEND DELETE1"
            L10_3(L11_3)
            L10_3 = TriggerServerEvent
            L11_3 = "Pug:server:DeleteRobberiesEntity"
            L12_3 = L6_3.Coords
            L13_3 = GetHashKey
            L14_3 = L8_3
            L13_3 = L13_3(L14_3)
            L14_3 = A1_2.heist_name
            L15_3 = A0_2.stepNumber
            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
          end
          ::lbl_344::
          L10_3 = Config
          L10_3 = L10_3.RobberyAnimations
          L11_3 = A0_2.animation
          L10_3 = L10_3[L11_3]
          L10_3 = L10_3.ReplaceProp
          if L10_3 then
            L10_3 = A0_2.propName
            if "tr_prop_tr_elecbox_01a" ~= L10_3 then
              L10_3 = A0_2.propName
              if "h4_prop_h4_safe_01a" ~= L10_3 then
                goto lbl_477
              end
            end
          end
          L10_3 = TriggerEvent
          L11_3 = "Pug:client:DoRobberiesAnimation"
          L12_3 = A0_2.animation
          L13_3 = PlayerPedId
          L13_3 = L13_3()
          L14_3 = false
          L15_3 = L6_3
          L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
          L10_3 = A0_2.propName
          if "xm_base_cia_server_01" == L10_3 then
            L10_3 = Wait
            L11_3 = 2800
            L10_3(L11_3)
          end
          L10_3 = A0_2.propName
          if "xm_base_cia_server_01" ~= L10_3 then
            L10_3 = A0_2.propName
            if "tr_prop_tr_elecbox_01a" ~= L10_3 then
              L10_3 = A0_2.propName
              if "h4_prop_h4_safe_01a" ~= L10_3 then
                L10_3 = Config
                L10_3 = L10_3.Debug
                if L10_3 then
                  L10_3 = PrintDebug
                  L11_3 = "THIS1"
                  L10_3(L11_3)
                end
                L10_3 = Wait
                L11_3 = 5000
                L10_3(L11_3)
              end
            end
          end
          L10_3 = A0_2.hackType
          if "none" == L10_3 then
            L10_3 = A0_2.propName
            if "xm_base_cia_server_01" ~= L10_3 then
              goto lbl_399
            end
          end
          L10_3 = A0_2.propName
          ::lbl_399::
          if "tr_prop_tr_elecbox_01a" == L10_3 then
            L10_3 = PrintDebug
            L11_3 = "THIS2"
            L10_3(L11_3)
            L10_3 = Wait
            L11_3 = 3000
            L10_3(L11_3)
            L10_3 = A0_2.propName
            if "h4_prop_h4_cash_stack_01a" ~= L10_3 then
              L10_3 = A0_2.propName
              if "h4_prop_h4_weed_stack_01a" ~= L10_3 then
                L10_3 = A0_2.propName
              end
            end
            if "h4_prop_h4_coke_stack_01a" == L10_3 then
              L10_3 = Wait
              L11_3 = 2300
              L10_3(L11_3)
            end
          end
        else
          L8_3 = Config
          L8_3 = L8_3.Animations
          L9_3 = tonumber
          L10_3 = A0_2.animation
          L9_3 = L9_3(L10_3)
          L7_3 = L8_3[L9_3]
          L8_3 = L7_3.IsNetWorkedScene
          if not L8_3 then
            L8_3 = TriggerEvent
            L9_3 = "Pug:client:DoRobberiesAnimation"
            L10_3 = A0_2.animation
            L11_3 = PlayerPedId
            L11_3 = L11_3()
            L12_3 = false
            L13_3 = L6_3
            L8_3(L9_3, L10_3, L11_3, L12_3, L13_3)
            L8_3 = A0_2.hackType
            if "numberpad" ~= L8_3 then
              L8_3 = L7_3.SkipWaitTime
              if not L8_3 then
                L8_3 = Config
                L8_3 = L8_3.Debug
                if L8_3 then
                  L8_3 = PrintDebug
                  L9_3 = "THIS3"
                  L8_3(L9_3)
                end
                L8_3 = Wait
                L9_3 = 5000
                L8_3(L9_3)
              end
            end
            L8_3 = A0_2.hackType
            if "none" == L8_3 then
              L8_3 = A0_2.propName
              if "xm_base_cia_server_01" ~= L8_3 then
                L8_3 = L7_3.AnimAction
                if "shoplift_mid" ~= L8_3 then
                  L8_3 = Config
                  L8_3 = L8_3.Debug
                  if L8_3 then
                    L8_3 = PrintDebug
                    L9_3 = "THIS4"
                    L8_3(L9_3)
                  end
                  L8_3 = Wait
                  L9_3 = 3000
                  L8_3(L9_3)
              end
            end
            else
              L8_3 = L7_3.AnimAction
              if "shoplift_mid" == L8_3 then
                L8_3 = Wait
                L9_3 = 1400
                L8_3(L9_3)
              end
            end
          end
        end
        ::lbl_477::
        L8_3 = A0_2.hackType
        if "numberpad" == L8_3 then
          L8_3 = Notify
          L9_3 = Config
          L9_3 = L9_3.LangT
          L9_3 = L9_3.InitiatingNumberPad
          L10_3 = "success"
          L8_3(L9_3, L10_3)
        end
        L8_3 = A0_2.hackType
        if "" ~= L8_3 then
          L8_3 = A0_2.hackType
          if " " ~= L8_3 then
            goto lbl_493
          end
        end
        A0_2.hackType = "none"
        ::lbl_493::
        L8_3 = Config
        L8_3 = L8_3.MiniGames
        L9_3 = A0_2.hackType
        L8_3 = L8_3[L9_3]
        L8_3 = L8_3.Game
        L9_3 = A0_2
        L10_3 = A1_2
        L8_3 = L8_3(L9_3, L10_3)
        if L8_3 then
          L9_3 = TriggerServerEvent
          L10_3 = "Pug:server:TrackHeistStepCompleted"
          L11_3 = A1_2.heist_name
          L12_3 = tonumber
          L13_3 = A0_2.stepNumber
          L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L12_3(L13_3)
          L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
          L9_3 = L7_3.ReplacePropMini
          if L9_3 then
            L9_3 = GetClosestObjectOfType
            L10_3 = A0_2.targetVector
            L11_3 = 1.0
            L12_3 = GetHashKey
            L13_3 = A0_2.propName
            L12_3 = L12_3(L13_3)
            L13_3 = 0
            L14_3 = 0
            L15_3 = 0
            L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
            L10_3 = TriggerServerEvent
            L11_3 = "Pug:server:DeleteRobberiesEntity"
            L12_3 = A0_2.targetVector
            L13_3 = GetHashKey
            L14_3 = A0_2.propName
            L13_3 = L13_3(L14_3)
            L14_3 = A1_2.heist_name
            L15_3 = A0_2.stepNumber
            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
          end
          L9_3 = L4_2.cooldownHeists
          if L9_3 then
            L9_3 = L4_2.cooldownHeists
            L9_3 = #L9_3
            if L9_3 > 0 then
              L9_3 = tonumber
              L10_3 = A0_2.stepNumber
              L9_3 = L9_3(L10_3)
              if L9_3 <= 4 then
                L9_3 = tonumber
                L10_3 = L4_2.cooldownMinutes
                L9_3 = L9_3(L10_3)
                if not L9_3 or L9_3 <= 0 then
                  L10_3 = tonumber
                  L11_3 = L4_2.robberyCooldown
                  L10_3 = L10_3(L11_3)
                  L9_3 = L10_3
                end
                if L9_3 and L9_3 > 0 then
                  L10_3 = TriggerServerEvent
                  L11_3 = "Pug:server:SetRobberiesOnCooldown"
                  L12_3 = L4_2.cooldownHeists
                  L13_3 = L9_3
                  L10_3(L11_3, L12_3, L13_3)
                end
              end
            end
          end
          L9_3 = A0_2.hackType
          if "none" ~= L9_3 then
            L9_3 = Notify
            L10_3 = Config
            L10_3 = L10_3.LangT
            L10_3 = L10_3.Success
            L11_3 = "success"
            L9_3(L10_3, L11_3)
          end
          L9_3 = IsVehicleModel
          L10_3 = A0_2.propName
          L9_3 = L9_3(L10_3)
          if L9_3 then
            L9_3 = A0_2.targetVector
            L10_3 = GetGamePool
            L11_3 = "CVehicle"
            L10_3 = L10_3(L11_3)
            L11_3 = nil
            L12_3 = 4.5
            L13_3 = ipairs
            L14_3 = L10_3
            L13_3, L14_3, L15_3, L16_3 = L13_3(L14_3)
            for L17_3, L18_3 in L13_3, L14_3, L15_3, L16_3 do
              L19_3 = GetEntityCoords
              L20_3 = L18_3
              L19_3 = L19_3(L20_3)
              L20_3 = L9_3 - L19_3
              L20_3 = #L20_3
              if L12_3 > L20_3 then
                L21_3 = GetEntityModel
                L22_3 = L18_3
                L21_3 = L21_3(L22_3)
                L22_3 = GetHashKey
                L23_3 = A0_2.propName
                L22_3 = L22_3(L23_3)
                if L21_3 == L22_3 then
                  L11_3 = L18_3
                  L12_3 = L20_3
                end
              end
            end
            if L11_3 then
              L13_3 = {}
              L14_3 = GetEntityCoords
              L15_3 = L11_3
              L14_3 = L14_3(L15_3)
              L13_3.Coords = L14_3
              L14_3 = GetEntityRotation
              L15_3 = L11_3
              L14_3 = L14_3(L15_3)
              L13_3.Rotation = L14_3
              L14_3 = A0_2.propName
              L13_3.PropName = L14_3
              L14_3 = A1_2.heist_name
              L13_3.RobberyName = L14_3
              L14_3 = A0_2
              L13_3.Stage = L14_3
              L13_3.DataObject = L11_3
              L14_3 = A1_2
              L13_3.Heist = L14_3
              L14_3 = GetEntityHeading
              L15_3 = L11_3
              L14_3 = L14_3(L15_3)
              L13_3.Heading = L14_3
              L6_3 = L13_3
              L13_3 = GetVehicleColours
              L14_3 = L11_3
              L13_3, L14_3 = L13_3(L14_3)
              L15_3 = TriggerServerEvent
              L16_3 = "Pug:server:DeleteRobberiesEntity"
              L17_3 = L6_3.Coords
              L18_3 = GetHashKey
              L19_3 = A0_2.propName
              L18_3 = L18_3(L19_3)
              L19_3 = A1_2.heist_name
              L20_3 = A0_2.stepNumber
              L15_3(L16_3, L17_3, L18_3, L19_3, L20_3)
              L15_3 = 7000
              L16_3 = GetGameTimer
              L16_3 = L16_3()
              while true do
                L17_3 = DoesEntityExist
                L18_3 = L11_3
                L17_3 = L17_3(L18_3)
                if not L17_3 then
                  break
                end
                L17_3 = GetGameTimer
                L17_3 = L17_3()
                L17_3 = L17_3 - L16_3
                if not (L15_3 >= L17_3) then
                  break
                end
                L17_3 = Wait
                L18_3 = 1
                L17_3(L18_3)
              end
              L17_3 = nil
              L18_3 = PugSpawnVehicle
              L19_3 = A0_2.propName
              function L20_3(A0_4)
                local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4
                L1_4 = SetEntityHeading
                L2_4 = A0_4
                L3_4 = L6_3.Heading
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
                L3_4 = "AUTO"
                L4_4 = tostring
                L5_4 = math
                L5_4 = L5_4.random
                L6_4 = 1000
                L7_4 = 9999
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
                L1_4 = SetVehicleColours
                L2_4 = A0_4
                L3_4 = L13_3
                L4_4 = L14_3
                L1_4(L2_4, L3_4, L4_4)
                L1_4 = HandleVehicleKeys
                L2_4 = A0_4
                L3_4 = string
                L3_4 = L3_4.gsub
                L4_4 = GetVehicleNumberPlateText
                L5_4 = A0_4
                L4_4 = L4_4(L5_4)
                L5_4 = "^%s*(.-)%s*$"
                L6_4 = "%1"
                L3_4, L4_4, L5_4, L6_4, L7_4 = L3_4(L4_4, L5_4, L6_4)
                L1_4(L2_4, L3_4, L4_4, L5_4, L6_4, L7_4)
                L17_3 = A0_4
              end
              L21_3 = L6_3.Coords
              L22_3 = true
              L18_3(L19_3, L20_3, L21_3, L22_3)
              L18_3 = 7000
              L19_3 = GetGameTimer
              L19_3 = L19_3()
              while not L17_3 do
                L20_3 = GetGameTimer
                L20_3 = L20_3()
                L20_3 = L20_3 - L19_3
                if not (L18_3 >= L20_3) then
                  break
                end
                L20_3 = Wait
                L21_3 = 50
                L20_3(L21_3)
              end
              L20_3 = Config
              L20_3 = L20_3.AddStolenVehicleToPlayersGarage
              if L20_3 then
                L20_3 = PugGetVehicleProperties
                L21_3 = L17_3
                L20_3 = L20_3(L21_3)
                L21_3 = TriggerServerEvent
                L22_3 = "Pug:server:RobberySaveVehicleToDatabase"
                L23_3 = L20_3
                L24_3 = A0_2.propName
                L21_3(L22_3, L23_3, L24_3)
              end
            else
              L13_3 = PrintDebug
              L14_3 = "No vehicle found"
              L13_3(L14_3)
            end
          end
          L9_3 = TriggerServerEvent
          L10_3 = "Pug:server:RefreshCoolDoownToStartNow"
          L11_3 = A1_2.heist_name
          L12_3 = tonumber
          L13_3 = A0_2.stepNumber
          L12_3 = L12_3(L13_3)
          L13_3 = L4_2.robberyCooldown
          L14_3 = true
          L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
          L9_3 = L7_3.ReplaceProp
          if L9_3 then
            L9_3 = A0_2.propName
            if "tr_prop_tr_elecbox_01a" ~= L9_3 then
              L9_3 = A0_2.propName
              if "h4_prop_h4_safe_01a" ~= L9_3 then
                L9_3 = TriggerEvent
                L10_3 = "Pug:client:DoRobberiesAnimation"
                L11_3 = A0_2.animation
                L12_3 = PlayerPedId
                L12_3 = L12_3()
                L13_3 = false
                L14_3 = L6_3
                L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
              end
            end
            L9_3 = Wait
            L10_3 = 200
            L9_3(L10_3)
            L9_3 = A0_2.propName
            if L6_3 and L5_3 and 0 ~= L5_3 then
              L10_3 = Config
              L10_3 = L10_3.RobberyAnimations
              L11_3 = A0_2.animation
              L10_3 = L10_3[L11_3]
              if L10_3 then
                L10_3 = Config
                L10_3 = L10_3.RobberyAnimations
                L11_3 = A0_2.animation
                L10_3 = L10_3[L11_3]
                L10_3 = L10_3.ReplaceProp
                if L10_3 then
                  L10_3 = A0_2.propName
                  if "tr_prop_tr_elecbox_01a" ~= L10_3 then
                    L10_3 = GetJewelryCases
                    L11_3 = A0_2.propName
                    L10_3 = L10_3(L11_3)
                    if L10_3 then
                      L10_3 = A0_2.hackType
                      if "none" == L10_3 then
                        goto lbl_779
                      end
                    end
                    L10_3 = A0_2.propName
                    if "p_chem_vial_02b_s" ~= L10_3 then
                      L10_3 = PrintDebug
                      L11_3 = "SEND DELETE2"
                      L10_3(L11_3)
                      L10_3 = TriggerServerEvent
                      L11_3 = "Pug:server:DeleteRobberiesEntity"
                      L12_3 = L6_3.Coords
                      L13_3 = GetHashKey
                      L14_3 = L9_3
                      L13_3 = L13_3(L14_3)
                      L14_3 = A1_2.heist_name
                      L15_3 = A0_2.stepNumber
                      L10_3(L11_3, L12_3, L13_3, L14_3, L15_3)
                    end
                  end
                end
              end
            end
            ::lbl_779::
            L10_3 = A0_2.propName
            if "tr_prop_tr_elecbox_01a" ~= L10_3 then
              L10_3 = GetJewelryCases
              L11_3 = A0_2.propName
              L10_3 = L10_3(L11_3)
              if not L10_3 then
                L10_3 = A0_2.propName
                if "h4_prop_h4_safe_01a" ~= L10_3 then
                  L10_3 = A0_2.propName
                  if "xm3_prop_xm3_crate_01a" ~= L10_3 then
                    L10_3 = A0_2.propName
                    if "tr_prop_tr_adv_case_01a" ~= L10_3 then
                      L10_3 = Wait
                      L11_3 = 4600
                      L10_3(L11_3)
                    end
                  end
                end
              end
            end
            L10_3 = A0_2.propName
            if "xm3_prop_xm3_crate_01a" ~= L10_3 then
              L10_3 = A0_2.propName
              if "tr_prop_tr_adv_case_01a" ~= L10_3 then
                goto lbl_816
              end
            end
            L10_3 = A0_2.hackType
            if "none" == L10_3 then
              L10_3 = Wait
              L11_3 = 4800
              L10_3(L11_3)
            else
              L10_3 = Wait
              L11_3 = 3000
              L10_3(L11_3)
              goto lbl_822
              ::lbl_816::
              L10_3 = A0_2.propName
              if "p_chem_vial_02b_s" == L10_3 then
                L10_3 = Wait
                L11_3 = 5000
                L10_3(L11_3)
              end
            end
            ::lbl_822::
            L10_3 = A0_2.propName
            if "ch_prop_gold_trolly_01a" ~= L10_3 then
              L10_3 = A0_2.propName
              if "ch_prop_cash_low_trolly_01a" ~= L10_3 then
                L10_3 = A0_2.propName
                if "ch_prop_diamond_trolly_01a" ~= L10_3 then
                  L10_3 = A0_2.propName
                  if "imp_prop_impexp_coke_trolly" ~= L10_3 then
                    goto lbl_837
                  end
                end
              end
            end
            L10_3 = Wait
            L11_3 = 32000
            L10_3(L11_3)
          end
          ::lbl_837::
          TryingHack = false
          L9_3 = A0_2.requireSimultaneous
          if L9_3 then
            L9_3 = A0_2.simultaneousStepNumber
            if L9_3 then
              L9_3 = L77_1
              L10_3 = A1_2.heist_name
              L11_3 = tonumber
              L12_3 = A0_2.stepNumber
              L11_3 = L11_3(L12_3)
              function L12_3(A0_4)
                local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4
                if A0_4 then
                  L1_4 = L123_1
                  L2_4 = A0_2
                  L3_4 = A1_2
                  L4_4 = L4_2
                  L5_4 = L6_3
                  L1_4(L2_4, L3_4, L4_4, L5_4)
                else
                  L1_4 = L34_1
                  L2_4 = A1_2.heist_name
                  L3_4 = A0_2
                  L4_4 = "simultaneous_step_missing"
                  L5_4 = Config
                  L5_4 = L5_4.LangT
                  L5_4 = L5_4.SimultaneousStepMissing
                  L1_4(L2_4, L3_4, L4_4, L5_4)
                  L1_4 = Notify
                  L2_4 = Config
                  L2_4 = L2_4.LangT
                  L2_4 = L2_4.SimultaneousStepMissing
                  L3_4 = "error"
                  L1_4(L2_4, L3_4)
                  L1_4 = TriggerServerEvent
                  L2_4 = "Pug:server:SetStepOnCoolDown"
                  L3_4 = A1_2.heist_name
                  L4_4 = tonumber
                  L5_4 = A0_2.stepNumber
                  L4_4 = L4_4(L5_4)
                  L5_4 = L4_2.robberyCooldown
                  L6_4 = true
                  L1_4(L2_4, L3_4, L4_4, L5_4, L6_4)
                  L1_4 = L7_3.NetworkedAnimations
                  L1_4 = #L1_4
                  if L1_4 > 1 then
                    L1_4 = L118_1
                    L2_4 = A0_2
                    L3_4 = L6_3
                    L1_4(L2_4, L3_4)
                  end
                  L1_4 = L76_1
                  L2_4 = A1_2.heist_name
                  L3_4 = tonumber
                  L4_4 = A0_2.stepNumber
                  L3_4, L4_4, L5_4, L6_4 = L3_4(L4_4)
                  L1_4(L2_4, L3_4, L4_4, L5_4, L6_4)
                end
              end
              L9_3(L10_3, L11_3, L12_3)
          end
          else
            L9_3 = L123_1
            L10_3 = A0_2
            L11_3 = A1_2
            L12_3 = L4_2
            L13_3 = L6_3
            L9_3(L10_3, L11_3, L12_3, L13_3)
            L9_3 = L76_1
            L10_3 = A1_2.heist_name
            L11_3 = tonumber
            L12_3 = A0_2.stepNumber
            L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L11_3(L12_3)
            L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
          end
        else
          TryingHack = false
          L9_3 = TriggerServerEvent
          L10_3 = "Pug:server:TrackHeistFailedHack"
          L11_3 = A1_2.heist_name
          L9_3(L10_3, L11_3)
          L9_3 = TriggerServerEvent
          L10_3 = "Pug:server:SetStepOnCoolDown"
          L11_3 = A1_2.heist_name
          L12_3 = tonumber
          L13_3 = A0_2.stepNumber
          L12_3 = L12_3(L13_3)
          L13_3 = L4_2.robberyCooldown
          L14_3 = true
          L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)
          L9_3 = L7_3.NetworkedAnimations
          if L9_3 then
            L9_3 = L7_3.NetworkedAnimations
            L9_3 = #L9_3
            if L9_3 > 1 then
              L9_3 = A0_2.propName
              if "h4_prop_h4_safe_01a" == L9_3 then
                L9_3 = TriggerEvent
                L10_3 = "Pug:client:StopRobberySceneKeepAlive"
                L9_3(L10_3)
                L9_3 = ClearPedTasks
                L10_3 = PlayerPedId
                L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L10_3()
                L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
              else
                L9_3 = L118_1
                L10_3 = A0_2
                L11_3 = L6_3
                L9_3(L10_3, L11_3)
              end
            end
          else
            L9_3 = L118_1
            L10_3 = A0_2
            L11_3 = L6_3
            L9_3(L10_3, L11_3)
          end
          L9_3 = L76_1
          L10_3 = A1_2.heist_name
          L11_3 = tonumber
          L12_3 = A0_2.stepNumber
          L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L11_3(L12_3)
          L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
          L9_3 = Notify
          L10_3 = Config
          L10_3 = L10_3.LangT
          L10_3 = L10_3.Failed
          L11_3 = "error"
          L9_3(L10_3, L11_3)
          L9_3 = L7_3.NetworkedAnimations
          if not L9_3 then
            L9_3 = ClearPedTasks
            L10_3 = PlayerPedId
            L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L10_3()
            L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
          end
          L9_3 = A0_2.penaltyForFailing
          if L9_3 then
            L9_3 = A0_2.penaltyType
            if L9_3 then
              L9_3 = A0_2.penaltyType
              if "" ~= L9_3 then
                L9_3 = A0_2.penaltyChance
                if L9_3 then
                  L9_3 = A0_2.penaltyChance
                  if "" ~= L9_3 then
                    L9_3 = tonumber
                    L10_3 = A0_2.penaltyChance
                    L9_3 = L9_3(L10_3)
                    L10_3 = math
                    L10_3 = L10_3.random
                    L11_3 = 1
                    L12_3 = 100
                    L10_3 = L10_3(L11_3, L12_3)
                    if L9_3 >= L10_3 then
                      L10_3 = tostring
                      L11_3 = A0_2.penaltyType
                      L10_3 = L10_3(L11_3)
                      if "fire" == L10_3 then
                        L10_3 = StartEntityFire
                        L11_3 = PlayerPedId
                        L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L11_3()
                        L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
                        L10_3 = Wait
                        L11_3 = 1000
                        L10_3(L11_3)
                        L10_3 = StopEntityFire
                        L11_3 = PlayerPedId
                        L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L11_3()
                        L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
                      else
                        L10_3 = tostring
                        L11_3 = A0_2.penaltyType
                        L10_3 = L10_3(L11_3)
                        if "explode" == L10_3 then
                          L10_3 = TriggerServerEvent
                          L11_3 = "Pug:server:triggerExplosion"
                          L12_3 = GetEntityCoords
                          L13_3 = PlayerPedId
                          L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L13_3()
                          L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
                          L13_3 = 0
                          L14_3 = 1.0
                          L10_3(L11_3, L12_3, L13_3, L14_3)
                        else
                          L10_3 = tostring
                          L11_3 = A0_2.penaltyType
                          L10_3 = L10_3(L11_3)
                          if "electrocute" == L10_3 then
                            L10_3 = PlayerPedId
                            L10_3 = L10_3()
                            L11_3 = GetEntityCoords
                            L12_3 = L10_3
                            L11_3 = L11_3(L12_3)
                            L12_3 = RequestAnimDict
                            L13_3 = "stungun@standing"
                            L12_3(L13_3)
                            while true do
                              L12_3 = HasAnimDictLoaded
                              L13_3 = "stungun@standing"
                              L12_3 = L12_3(L13_3)
                              if L12_3 then
                                break
                              end
                              L12_3 = Wait
                              L13_3 = 1
                              L12_3(L13_3)
                            end
                            L12_3 = TaskPlayAnim
                            L13_3 = L10_3
                            L14_3 = "stungun@standing"
                            L15_3 = "damage"
                            L16_3 = 8.0
                            L17_3 = -8.0
                            L18_3 = 2000
                            L19_3 = 49
                            L20_3 = 0
                            L21_3 = false
                            L22_3 = false
                            L23_3 = false
                            L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3)
                            L12_3 = RequestNamedPtfxAsset
                            L13_3 = "core"
                            L12_3(L13_3)
                            while true do
                              L12_3 = HasNamedPtfxAssetLoaded
                              L13_3 = "core"
                              L12_3 = L12_3(L13_3)
                              if L12_3 then
                                break
                              end
                              L12_3 = Wait
                              L13_3 = 1
                              L12_3(L13_3)
                            end
                            L12_3 = UseParticleFxAssetNextCall
                            L13_3 = "core"
                            L12_3(L13_3)
                            L12_3 = StartNetworkedParticleFxNonLoopedAtCoord
                            L13_3 = "muz_railgun"
                            L14_3 = L11_3.x
                            L15_3 = L11_3.y
                            L16_3 = L11_3.z
                            L16_3 = L16_3 + 0.2
                            L17_3 = 0.0
                            L18_3 = 0.0
                            L19_3 = 0.0
                            L20_3 = 2.0
                            L21_3 = false
                            L22_3 = false
                            L23_3 = false
                            L24_3 = false
                            L12_3 = L12_3(L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)
                            L13_3 = PlayDrillSound
                            L14_3 = "EMP_Vehicle_Hum"
                            L15_3 = "DLC_HEIST_BIOLAB_DELIVER_EMP_SOUNDS"
                            L13_3(L14_3, L15_3)
                            L13_3 = ApplyDamageToPed
                            L14_3 = L10_3
                            L15_3 = 25
                            L16_3 = false
                            L13_3(L14_3, L15_3, L16_3)
                            L13_3 = Wait
                            L14_3 = 2000
                            L13_3(L14_3)
                            L13_3 = ApplyDamageToPed
                            L14_3 = L10_3
                            L15_3 = 25
                            L16_3 = false
                            L13_3(L14_3, L15_3, L16_3)
                            L13_3 = SetPedToRagdoll
                            L14_3 = L10_3
                            L15_3 = 3500
                            L16_3 = 4000
                            L17_3 = 0
                            L18_3 = false
                            L19_3 = false
                            L20_3 = false
                            L13_3(L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      else
        L1_3 = L34_1
        L2_3 = A1_2.heist_name
        L3_3 = A0_2
        L4_3 = "step_on_cooldown"
        L5_3 = Config
        L5_3 = L5_3.LangT
        L5_3 = L5_3.StepOnCooldown
        L1_3(L2_3, L3_3, L4_3, L5_3)
        L1_3 = Notify
        L2_3 = Config
        L2_3 = L2_3.LangT
        L2_3 = L2_3.StepOnCooldown
        L3_3 = "error"
        L1_3(L2_3, L3_3)
      end
    end
    L22_2 = A1_2.heist_name
    L23_2 = tonumber
    L24_2 = A0_2.stepNumber
    L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2 = L23_2(L24_2)
    L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2)
  end
end
L135_1(L136_1, L137_1)
function L135_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = RequestAmbientAudioBank
  L4_2 = A1_2
  L5_2 = 0
  L3_2(L4_2, L5_2)
  L3_2 = PlaySoundFromEntity
  L4_2 = soundIdGolbal
  L5_2 = A0_2
  L6_2 = L2_2
  L7_2 = A1_2
  L8_2 = 1
  L9_2 = 0
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3
    L0_3 = Wait
    L1_3 = 1000
    L0_3(L1_3)
    L0_3 = StopSound
    L1_3 = soundIdGolbal
    L0_3(L1_3)
  end
  L3_2(L4_2)
end
PlayDrillSound = L135_1
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:RemoveLasersForEveryone"
function L137_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = pairs
  L3_2 = LaserTable
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.Heist
    if L8_2 == A0_2 then
      L8_2 = L7_2.stepId
      if L8_2 == A1_2 then
        L8_2 = LaserTable
        L8_2[L6_2] = nil
      end
    end
  end
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:AddLasersForEveryone"
function L137_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = pairs
  L3_2 = L5_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.heist_name
    if L8_2 == A0_2 then
      L8_2 = pairs
      L9_2 = json
      L9_2 = L9_2.decode
      L10_2 = L7_2.stages
      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2(L10_2)
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
        L14_2 = L13_2.stepNumber
        if L14_2 == A1_2 then
          L14_2 = L13_2.lasers
          if L14_2 then
            L14_2 = L13_2.lasers
            L14_2 = #L14_2
            if L14_2 > 0 then
              L14_2 = L115_1
              L15_2 = L13_2
              L16_2 = L7_2.heist_name
              L14_2(L15_2, L16_2)
            end
          end
        end
      end
    end
  end
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:createExplosion"
function L137_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 then
    L3_2 = A0_2.x
    if L3_2 then
      L3_2 = A0_2.y
      if L3_2 then
        L3_2 = A0_2.z
        if L3_2 then
          L3_2 = L121_1
          L4_2 = A0_2
          L5_2 = 3.0
          L3_2(L4_2, L5_2)
          L3_2 = vector3
          L4_2 = A0_2.x
          L5_2 = A0_2.y
          L6_2 = A0_2.z
          L3_2 = L3_2(L4_2, L5_2, L6_2)
          L4_2 = vector3
          L5_2 = 888.14
          L6_2 = -2130.81
          L7_2 = 31.23
          L4_2 = L4_2(L5_2, L6_2, L7_2)
          L3_2 = L3_2 - L4_2
          L3_2 = #L3_2
          if L3_2 <= 2.0 then
            bobcatVaultdooropen = true
            L3_2 = {}
            L3_2.x = 888.12
            L3_2.y = -2130.54
            L3_2.z = 31.24
            L4_2 = false
            L5_2 = false
            L6_2 = CreateThread
            function L7_2()
              local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
              while true do
                L0_3 = bobcatVaultdooropen
                if not L0_3 then
                  break
                end
                L0_3 = GetEntityCoords
                L1_3 = PlayerPedId
                L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L1_3()
                L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
                L1_3 = vector3
                L2_3 = L3_2.x
                L3_3 = L3_2.y
                L4_3 = L3_2.z
                L1_3 = L1_3(L2_3, L3_3, L4_3)
                L1_3 = L0_3 - L1_3
                L1_3 = #L1_3
                if L1_3 < 70 then
                  L2_3 = GetRayfireMapObject
                  L3_3 = L3_2.x
                  L4_3 = L3_2.y
                  L5_3 = L3_2.z
                  L6_3 = 10.0
                  L7_3 = "DES_VaultDoor001"
                  L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)
                  L3_3 = DoesRayfireMapObjectExist
                  L4_3 = L2_3
                  L3_3 = L3_3(L4_3)
                  if L3_3 then
                    L3_3 = L4_2
                    if not L3_3 then
                      L3_3 = print
                      L4_3 = "Initial explosion & door opening sequence triggered."
                      L3_3(L4_3)
                      L3_3 = Wait
                      L4_3 = 100
                      L3_3(L4_3)
                      L3_3 = SetStateOfRayfireMapObject
                      L4_3 = L2_3
                      L5_3 = 4
                      L3_3(L4_3, L5_3)
                      L3_3 = Wait
                      L4_3 = 100
                      L3_3(L4_3)
                      L3_3 = SetStateOfRayfireMapObject
                      L4_3 = L2_3
                      L5_3 = 5
                      L3_3(L4_3, L5_3)
                      L3_3 = Wait
                      L4_3 = 100
                      L3_3(L4_3)
                      L3_3 = SetStateOfRayfireMapObject
                      L4_3 = L2_3
                      L5_3 = 6
                      L3_3(L4_3, L5_3)
                      L3_3 = Wait
                      L4_3 = 100
                      L3_3(L4_3)
                      L3_3 = SetStateOfRayfireMapObject
                      L4_3 = L2_3
                      L5_3 = 7
                      L3_3(L4_3, L5_3)
                      L3_3 = Wait
                      L4_3 = 100
                      L3_3(L4_3)
                      L3_3 = SetStateOfRayfireMapObject
                      L4_3 = L2_3
                      L5_3 = 8
                      L3_3(L4_3, L5_3)
                      L3_3 = AddExplosion
                      L4_3 = L3_2.x
                      L5_3 = L3_2.y
                      L6_3 = L3_2.z
                      L7_3 = 2
                      L8_3 = 0.0
                      L9_3 = true
                      L10_3 = true
                      L11_3 = true
                      L12_3 = true
                      L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
                      L3_3 = Wait
                      L4_3 = 100
                      L3_3(L4_3)
                      L3_3 = SetStateOfRayfireMapObject
                      L4_3 = L2_3
                      L5_3 = 9
                      L3_3(L4_3, L5_3)
                      L3_3 = true
                      L4_2 = L3_3
                      L3_3 = true
                      L5_2 = L3_3
                    else
                      L3_3 = L5_2
                      if not L3_3 then
                        L3_3 = print
                        L4_3 = "Reopening door (no explosion) after reentering range."
                        L3_3(L4_3)
                        L3_3 = Wait
                        L4_3 = 100
                        L3_3(L4_3)
                        L3_3 = SetStateOfRayfireMapObject
                        L4_3 = L2_3
                        L5_3 = 4
                        L3_3(L4_3, L5_3)
                        L3_3 = Wait
                        L4_3 = 100
                        L3_3(L4_3)
                        L3_3 = SetStateOfRayfireMapObject
                        L4_3 = L2_3
                        L5_3 = 5
                        L3_3(L4_3, L5_3)
                        L3_3 = Wait
                        L4_3 = 100
                        L3_3(L4_3)
                        L3_3 = SetStateOfRayfireMapObject
                        L4_3 = L2_3
                        L5_3 = 6
                        L3_3(L4_3, L5_3)
                        L3_3 = Wait
                        L4_3 = 100
                        L3_3(L4_3)
                        L3_3 = SetStateOfRayfireMapObject
                        L4_3 = L2_3
                        L5_3 = 7
                        L3_3(L4_3, L5_3)
                        L3_3 = Wait
                        L4_3 = 100
                        L3_3(L4_3)
                        L3_3 = SetStateOfRayfireMapObject
                        L4_3 = L2_3
                        L5_3 = 8
                        L3_3(L4_3, L5_3)
                        L3_3 = Wait
                        L4_3 = 100
                        L3_3(L4_3)
                        L3_3 = SetStateOfRayfireMapObject
                        L4_3 = L2_3
                        L5_3 = 9
                        L3_3(L4_3, L5_3)
                        L3_3 = true
                        L5_2 = L3_3
                      end
                    end
                  end
                else
                  L2_3 = L5_2
                  if L2_3 then
                    L2_3 = print
                    L3_3 = "Player left 70m range; door will reopen on return."
                    L2_3(L3_3)
                  end
                  L2_3 = false
                  L5_2 = L2_3
                end
                L2_3 = Wait
                L3_3 = 1000
                L2_3(L3_3)
              end
            end
            L6_2(L7_2)
          else
            L3_2 = AddExplosion
            L4_2 = A0_2.x
            L5_2 = A0_2.y
            L6_2 = A0_2.z
            L7_2 = A1_2
            L8_2 = A2_2
            L9_2 = true
            L10_2 = false
            L11_2 = 1.0
            L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
          end
      end
    end
  end
  else
    L3_2 = PrintDebug
    L4_2 = "Invalid coordinates received for explosion."
    L3_2(L4_2)
  end
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:RemoveAllHeistData"
function L137_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L48_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = L114_1
    L3_2 = L1_2
    L2_2(L3_2)
  else
    L2_2 = L68_1
    L3_2 = A0_2
    L2_2(L3_2)
    L2_2 = L69_1
    L3_2 = A0_2
    L2_2(L3_2)
  end
  L2_2 = L116_1
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = L74_1
  L3_2 = A0_2
  L2_2(L3_2)
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:RemoveEveryRobberyData"
function L137_1()
  local L0_2, L1_2
  L0_2 = L72_1
  L0_2()
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:SyncAllRobberyPasscodes"
function L137_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2 or nil
  if not A0_2 then
    L2_2 = {}
  end
  L17_1 = L2_2
  L2_2 = A1_2 or L2_2
  if not A1_2 then
    L2_2 = {}
  end
  L18_1 = L2_2
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:UpdateSingleRobberySave"
function L137_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 then
    L3_2 = #A0_2
    if 0 ~= L3_2 then
      goto lbl_10
    end
  end
  L3_2 = PrintDebug
  L4_2 = "No heist data found"
  L3_2(L4_2)
  do return end
  ::lbl_10::
  L3_2 = L48_1
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = L116_1
  L5_2 = A1_2
  L4_2(L5_2)
  L4_2 = L114_1
  L5_2 = L3_2
  L4_2(L5_2)
  L5_1 = A0_2
  L4_2 = L78_1
  L4_2()
  if A2_2 then
    L4_2 = pairs
    L5_2 = A2_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
      L10_2 = L18_1
      L10_2[L8_2] = L9_2
    end
  end
  L4_2 = L48_1
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  L5_2 = L117_1
  L6_2 = L4_2
  L5_2(L6_2)
end
L135_1(L136_1, L137_1)
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:HandleAllRobberyTargets"
function L137_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 then
    L2_2 = #A0_2
    if 0 ~= L2_2 then
      goto lbl_10
    end
  end
  L2_2 = PrintDebug
  L3_2 = "No heist data found"
  L2_2(L3_2)
  do return end
  ::lbl_10::
  L5_1 = A0_2
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L116_1
    L9_2 = L7_2.heist_name
    L8_2(L9_2)
    L8_2 = L114_1
    L9_2 = L7_2
    L10_2 = A1_2
    L8_2(L9_2, L10_2)
    L8_2 = L117_1
    L9_2 = L7_2
    L8_2(L9_2)
  end
end
L135_1(L136_1, L137_1)
function L135_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  if "ch_prop_diamond_trolly_01a" == A0_2 then
    A0_2 = "ch_prop_vault_dimaondbox_01a"
  elseif "ch_prop_gold_trolly_01a" == A0_2 then
    A0_2 = "ch_prop_gold_bar_01a"
  elseif "imp_prop_impexp_coke_trolly" == A0_2 then
    A0_2 = "prop_coke_block_half_a"
  else
    A0_2 = "hei_prop_heist_cash_pile"
  end
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = GetEntityCoords
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetHashKey
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = LoadModel
  L7_2 = L5_2
  L6_2(L7_2)
  L6_2 = CreateObject
  L7_2 = L5_2
  L8_2 = L4_2
  L9_2 = true
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L7_2 = FreezeEntityPosition
  L8_2 = L6_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = SetEntityInvincible
  L8_2 = L6_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = SetEntityNoCollisionEntity
  L8_2 = L6_2
  L9_2 = L3_2
  L7_2(L8_2, L9_2)
  L7_2 = SetEntityVisible
  L8_2 = L6_2
  L9_2 = false
  L10_2 = false
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = AttachEntityToEntity
  L8_2 = L6_2
  L9_2 = L3_2
  L10_2 = GetPedBoneIndex
  L11_2 = L3_2
  L12_2 = 60309
  L10_2 = L10_2(L11_2, L12_2)
  L11_2 = 0.0
  L12_2 = 0.0
  L13_2 = 0.0
  L14_2 = 0.0
  L15_2 = 0.0
  L16_2 = 0.0
  L17_2 = false
  L18_2 = false
  L19_2 = false
  L20_2 = false
  L21_2 = 0
  L22_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  L7_2 = GetGameTimer
  L7_2 = L7_2()
  L8_2 = {}
  L9_2 = A1_2.rewardItems
  if L9_2 then
    L9_2 = type
    L10_2 = A1_2.rewardItems
    L9_2 = L9_2(L10_2)
    if "table" == L9_2 then
      L9_2 = pairs
      L10_2 = A1_2.rewardItems
      L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
      for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
        L15_2 = L14_2.itemName
        if L15_2 then
          L15_2 = L14_2.minAmount
          if L15_2 then
            L15_2 = L14_2.maxAmount
            if L15_2 then
              L15_2 = L14_2.rewardChance
              if L15_2 then
                L15_2 = tonumber
                L16_2 = L14_2.minAmount
                L15_2 = L15_2(L16_2)
                L16_2 = tonumber
                L17_2 = L14_2.maxAmount
                L16_2 = L16_2(L17_2)
                L17_2 = tonumber
                L18_2 = L14_2.rewardChance
                L17_2 = L17_2(L18_2)
                if L15_2 and L16_2 and L15_2 <= L16_2 and L17_2 and L17_2 >= 0 and L17_2 <= 100 then
                  L18_2 = math
                  L18_2 = L18_2.random
                  L19_2 = L15_2
                  L20_2 = L16_2
                  L18_2 = L18_2(L19_2, L20_2)
                  L19_2 = L14_2.itemName
                  L20_2 = {}
                  L20_2.total = L18_2
                  L20_2.given = 0
                  L20_2.rewardChance = L17_2
                  L8_2[L19_2] = L20_2
                else
                  L18_2 = Notify
                  L19_2 = Config
                  L19_2 = L19_2.T
                  L20_2 = "InvalidAmountOrChanceItem"
                  L21_2 = tostring
                  L22_2 = L14_2.itemName
                  L21_2, L22_2 = L21_2(L22_2)
                  L19_2 = L19_2(L20_2, L21_2, L22_2)
                  L20_2 = "error"
                  L18_2(L19_2, L20_2)
                end
            end
          end
        end
        else
          L15_2 = Notify
          L16_2 = Config
          L16_2 = L16_2.LangT
          L16_2 = L16_2.MissingRewardDetails
          L17_2 = "error"
          L15_2(L16_2, L17_2)
        end
      end
    end
  end
  L9_2 = 37000
  L10_2 = 1000
  L11_2 = GetGameTimer
  L11_2 = L11_2()
  L12_2 = CreateThread
  function L13_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    while true do
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = L7_2
      L0_3 = L0_3 - L1_3
      L1_3 = L9_2
      if not (L0_3 < L1_3) then
        break
      end
      L0_3 = Wait
      L1_3 = 1
      L0_3(L1_3)
      L0_3 = DisableControlAction
      L1_3 = 0
      L2_3 = 73
      L3_3 = true
      L0_3(L1_3, L2_3, L3_3)
      L0_3 = GetGameTimer
      L0_3 = L0_3()
      L1_3 = HasAnimEventFired
      L2_3 = L3_2
      L3_3 = GetHashKey
      L4_3 = "CASH_APPEAR"
      L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3 = L3_3(L4_3)
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
      if L1_3 then
        L1_3 = IsEntityVisible
        L2_3 = L6_2
        L1_3 = L1_3(L2_3)
        if not L1_3 then
          L1_3 = SetEntityVisible
          L2_3 = L6_2
          L3_3 = true
          L4_3 = false
          L1_3(L2_3, L3_3, L4_3)
        end
      end
      L1_3 = HasAnimEventFired
      L2_3 = L3_2
      L3_3 = GetHashKey
      L4_3 = "RELEASE_CASH_DESTROY"
      L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3 = L3_3(L4_3)
      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
      if L1_3 then
        L1_3 = IsEntityVisible
        L2_3 = L6_2
        L1_3 = L1_3(L2_3)
        if L1_3 then
          L1_3 = SetEntityVisible
          L2_3 = L6_2
          L3_3 = false
          L4_3 = false
          L1_3(L2_3, L3_3, L4_3)
        end
      end
      L1_3 = L11_2
      L1_3 = L0_3 - L1_3
      L2_3 = L10_2
      if L1_3 >= L2_3 then
        L11_2 = L0_3
        L1_3 = pairs
        L2_3 = L8_2
        L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
        for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
          L7_3 = L6_3.given
          L8_3 = L6_3.total
          if L7_3 < L8_3 then
            L7_3 = math
            L7_3 = L7_3.random
            L8_3 = 1
            L9_3 = 100
            L7_3 = L7_3(L8_3, L9_3)
            L8_3 = L6_3.rewardChance
            if L7_3 <= L8_3 then
              L8_3 = L6_3.total
              L9_3 = L6_3.given
              L8_3 = L8_3 - L9_3
              L9_3 = math
              L9_3 = L9_3.max
              L10_3 = math
              L10_3 = L10_3.floor
              L11_3 = L8_3 * 0.1
              L10_3 = L10_3(L11_3)
              L11_3 = 1
              L9_3 = L9_3(L10_3, L11_3)
              L10_3 = math
              L10_3 = L10_3.min
              L11_3 = L9_3
              L12_3 = L8_3
              L10_3 = L10_3(L11_3, L12_3)
              L9_3 = L10_3
              L10_3 = L6_3.given
              L10_3 = L10_3 + L9_3
              L6_3.given = L10_3
              TokenIsUseable = true
              L10_3 = HandleItems
              L11_3 = true
              L12_3 = tostring
              L13_3 = L5_3
              L12_3 = L12_3(L13_3)
              L13_3 = L9_3
              L14_3 = {}
              L15_3 = A2_2
              L14_3.heistName = L15_3
              L15_3 = A1_2.stepNumber
              L14_3.stepNumber = L15_3
              L14_3.rewardContext = "trolly_reward_item"
              L10_3(L11_3, L12_3, L13_3, L14_3)
              TokenIsUseable = false
            else
            end
          end
        end
      end
    end
    L0_3 = TriggerEvent
    L1_3 = "FullyDeleteRobberiesEntity"
    L2_3 = L6_2
    L0_3(L1_3, L2_3)
  end
  L12_2(L13_2)
end
PutCashInGand = L135_1
L135_1 = RegisterNetEvent
L136_1 = "Pug:client:SetAllPlayersBlackout"
function L137_1(A0_2)
  local L1_2, L2_2
  L1_2 = SetArtificialLightsState
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = SetArtificialLightsStateAffectsVehicles
  L2_2 = A0_2
  L1_2(L2_2)
end
L135_1(L136_1, L137_1)
