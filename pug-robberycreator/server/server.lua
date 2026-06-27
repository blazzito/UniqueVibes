local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1, L63_1, L64_1, L65_1, L66_1, L67_1, L68_1, L69_1, L70_1, L71_1, L72_1, L73_1, L74_1, L75_1, L76_1, L77_1, L78_1, L79_1, L80_1, L81_1, L82_1, L83_1, L84_1, L85_1, L86_1, L87_1, L88_1, L89_1, L90_1, L91_1, L92_1, L93_1, L94_1, L95_1, L96_1, L97_1, L98_1, L99_1, L100_1, L101_1, L102_1, L103_1, L104_1, L105_1, L106_1, L107_1, L108_1, L109_1, L110_1, L111_1, L112_1, L113_1, L114_1, L115_1, L116_1, L117_1, L118_1, L119_1, L120_1, L121_1, L122_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = {}
L5_1 = {}
L6_1 = {}
L7_1 = {}
L8_1 = nil
L9_1 = {}
AllRobberysCooldDownTable = L9_1
L9_1 = {}
heistPasscodesLocation = L9_1
L9_1 = {}
heistPasscodes = L9_1
L9_1 = {}
tokens = L9_1
L9_1 = {}
L10_1 = 21600
L11_1 = 2500
L12_1 = {}
L13_1 = "preset-info/mainrobbery-presets"
L14_1 = "preset-info"
L15_1 = L13_1
L16_1 = "/presets.json"
L15_1 = L15_1 .. L16_1
L16_1 = L13_1
L17_1 = "/ox_doorlocks.json"
L16_1 = L16_1 .. L17_1
L17_1 = L13_1
L18_1 = "/mainrobbery-preset-index.json"
L17_1 = L17_1 .. L18_1
L18_1 = L14_1
L19_1 = "/presets.json"
L18_1 = L18_1 .. L19_1
L19_1 = L14_1
L20_1 = "/ox_doorlocks.json"
L19_1 = L19_1 .. L20_1
L20_1 = L14_1
L21_1 = "/preset-index.json"
L20_1 = L20_1 .. L21_1
L21_1 = {}
L22_1 = 400.0
function L23_1(...)
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
    L1_2 = 1
    L2_2 = #L0_2
    L3_2 = 1
    for L4_2 = L1_2, L2_2, L3_2 do
      L5_2 = tostring
      L6_2 = L0_2[L4_2]
      L5_2 = L5_2(L6_2)
      L0_2[L4_2] = L5_2
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
    L5_2 = L4_2
    L4_2 = L4_2.gsub
    L6_2 = "^@"
    L7_2 = ""
    L4_2 = L4_2(L5_2, L6_2, L7_2)
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
PrintDebug = L23_1
function L23_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = GetPlayers
  L2_2 = L2_2()
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = FWork
    L9_2 = L9_2.GetIdentifier
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L9_2 == A0_2 then
      L10_2 = PrintDebug
      L11_2 = "player found:"
      L12_2 = L8_2
      L10_2(L11_2, L12_2)
      if A1_2 then
        return L8_2
      else
        L10_2 = FWork
        L10_2 = L10_2.GetPlayerFromId
        L11_2 = L8_2
        L10_2, L11_2, L12_2 = L10_2(L11_2)
        return L10_2, L11_2, L12_2
      end
    end
  end
end
PugFindPlayersByItentifier = L23_1
function L23_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = promise
  L1_2 = L0_2
  L0_2 = L0_2.new
  L0_2 = L0_2(L1_2)
  L1_2 = MySQL
  L1_2 = L1_2.Async
  L1_2 = L1_2.fetchAll
  L2_2 = "SELECT * FROM pug_heist"
  L3_2 = {}
  function L4_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L0_2
    L2_3 = L1_3
    L1_3 = L1_3.resolve
    L3_3 = A0_3
    L1_3(L2_3, L3_3)
  end
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = Citizen
  L1_2 = L1_2.Await
  L2_2 = L0_2
  return L1_2(L2_2)
end
getHeists = L23_1
function L23_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tostring
  L2_2 = math
  L2_2 = L2_2.random
  L3_2 = 10000000
  L4_2 = 99999999
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = ":"
  L3_2 = tostring
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L3_2 = L3_2(L4_2)
  L1_2 = L1_2 .. L2_2 .. L3_2
  return L1_2
end
function L24_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = tokens
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = tokens
    L2_2 = L23_1
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    L1_2[A0_2] = L2_2
  end
  L1_2 = tokens
  L1_2 = L1_2[A0_2]
  return L1_2
end
function L25_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = L24_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = print
  L4_2 = "[ROBBERY PROTECTION] Rejected %s from player %s because their token was stale or invalid. Resyncing token instead of kicking."
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = tostring
  L7_2 = A1_2 or L7_2
  if not A1_2 then
    L7_2 = "protected event"
  end
  L6_2 = L6_2(L7_2)
  L7_2 = tostring
  L8_2 = A0_2
  L7_2, L8_2 = L7_2(L8_2)
  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = TriggerClientEvent
  L4_2 = "Pug:client:UpdateRobberyToken"
  L5_2 = A0_2
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
function L26_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2 or A0_2
  if not L1_2 then
    A0_2 = 0.0
  end
  L1_2 = tostring
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = A0_2 * 100.0
  L3_2 = L3_2 + 0.5
  L2_2, L3_2 = L2_2(L3_2)
  return L1_2(L2_2, L3_2)
end
function L27_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 and "vector3" ~= L1_2 then
    L2_2 = "0:0:0"
    return L2_2
  end
  L2_2 = "%s:%s:%s"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = L26_1
  L5_2 = A0_2.x
  L4_2 = L4_2(L5_2)
  L5_2 = L26_1
  L6_2 = A0_2.y
  L5_2 = L5_2(L6_2)
  L6_2 = L26_1
  L7_2 = A0_2.z
  L6_2, L7_2 = L6_2(L7_2)
  return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
function L28_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = GetGameTimer
  L5_2 = L5_2()
  L6_2 = L12_1.__nextCleanup
  if L6_2 then
    L6_2 = L12_1.__nextCleanup
    if not (L5_2 >= L6_2) then
      goto lbl_33
    end
  end
  L6_2 = pairs
  L7_2 = L12_1
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    if "__nextCleanup" ~= L10_2 then
      L12_2 = type
      L13_2 = L11_2
      L12_2 = L12_2(L13_2)
      if "number" == L12_2 then
        L12_2 = L5_2 - L11_2
        L13_2 = 60000
        if L12_2 > L13_2 then
          L12_2 = L12_1
          L12_2[L10_2] = nil
        end
      end
    end
  end
  L6_2 = L5_2 + 60000
  L12_1.__nextCleanup = L6_2
  ::lbl_33::
  L6_2 = "%s|%s|%s|%s|%s"
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = tostring
  L9_2 = A0_2 or L9_2
  if not A0_2 then
    L9_2 = ""
  end
  L8_2 = L8_2(L9_2)
  L9_2 = tostring
  L10_2 = A1_2 or L10_2
  if not A1_2 then
    L10_2 = ""
  end
  L9_2 = L9_2(L10_2)
  L10_2 = tostring
  L11_2 = A2_2 or L11_2
  if not A2_2 then
    L11_2 = ""
  end
  L10_2 = L10_2(L11_2)
  L11_2 = tostring
  L12_2 = A3_2 or L12_2
  if not A3_2 then
    L12_2 = ""
  end
  L11_2 = L11_2(L12_2)
  L12_2 = L27_1
  L13_2 = A4_2
  L12_2, L13_2 = L12_2(L13_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2 = L12_1
  L7_2 = L7_2[L6_2]
  if L7_2 then
    L8_2 = L5_2 - L7_2
    L9_2 = L11_1
    if L8_2 < L9_2 then
      L8_2 = true
      return L8_2
    end
  end
  L8_2 = L12_1
  L8_2[L6_2] = L5_2
  L8_2 = false
  return L8_2
end
function L29_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = getHeists
  L1_2 = L1_2()
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L7_2.heist_name
    if L8_2 == A0_2 then
      return L7_2
    end
  end
  L2_2 = nil
  return L2_2
end
function L30_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = pcall
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "SELECT * FROM pug_heist_statistics"
  L3_2 = {}
  L0_2, L1_2 = L0_2(L1_2, L2_2, L3_2)
  if not L0_2 then
    L2_2 = {}
    return L2_2
  end
  if not L1_2 then
    L2_2 = {}
    L1_2 = L2_2
  end
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.heist_name
    L2_2[L9_2] = L8_2
  end
  return L2_2
end
getHeistStatistics = L30_1
function L30_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
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
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = [[
        INSERT INTO pug_heist_statistics (heist_name)
        VALUES (?)
        ON DUPLICATE KEY UPDATE heist_name = VALUES(heist_name)
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2(L2_2, L3_2)
end
function L31_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tostring
  L2_2 = GetPlayerName
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = "Player "
    L3_2 = tostring
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L2_2 = L2_2 .. L3_2
  end
  return L1_2(L2_2)
end
function L32_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L9_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L9_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L4_2 = L2_2.lastTouched
  if L4_2 then
    L4_2 = L2_2.lastTouched
    L4_2 = L3_2 - L4_2
    L5_2 = L10_1
    if L4_2 > L5_2 then
      L4_2 = L9_1
      L4_2 = L4_2[A0_2]
      L4_2[A1_2] = nil
      L4_2 = nil
      return L4_2
    end
  end
  return L2_2
end
function L33_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = tostring
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if "" == A1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L32_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = os
    L3_2 = L3_2.time
    L3_2 = L3_2()
    L2_2.lastTouched = L3_2
    return L2_2
  end
  L3_2 = L30_1
  L4_2 = A1_2
  L3_2(L4_2)
  L3_2 = L31_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = MySQL
  L4_2 = L4_2.query
  L4_2 = L4_2.await
  L5_2 = [[
        INSERT INTO pug_heist_statistics (heist_name, started_count, last_started_at, last_started_by)
        VALUES (?, 1, NOW(), ?)
        ON DUPLICATE KEY UPDATE
            started_count = started_count + 1,
            last_started_at = NOW(),
            last_started_by = VALUES(last_started_by)
    ]]
  L6_2 = {}
  L7_2 = A1_2
  L8_2 = L3_2
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L4_2(L5_2, L6_2)
  L4_2 = L9_1
  L5_2 = L9_1
  L5_2 = L5_2[A0_2]
  if not L5_2 then
    L5_2 = {}
  end
  L4_2[A0_2] = L5_2
  L4_2 = L9_1
  L4_2 = L4_2[A0_2]
  L5_2 = {}
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L5_2.startedAt = L6_2
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L5_2.lastTouched = L6_2
  L4_2[A1_2] = L5_2
  L4_2 = L9_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  return L4_2
end
function L34_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L32_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L3_2 = os
    L3_2 = L3_2.time
    L3_2 = L3_2()
    L2_2.lastTouched = L3_2
  end
  return L2_2
end
function L35_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L30_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = [[
        INSERT INTO pug_heist_statistics (heist_name, completed_steps)
        VALUES (?, 1)
        ON DUPLICATE KEY UPDATE
            completed_steps = completed_steps + 1
    ]]
  L3_2 = {}
  L4_2 = A0_2
  L3_2[1] = L4_2
  L1_2(L2_2, L3_2)
end
function L36_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L30_1
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = [[
        INSERT INTO pug_heist_statistics (heist_name, failed_hacks, last_failed_at, last_failed_by)
        VALUES (?, 1, NOW(), ?)
        ON DUPLICATE KEY UPDATE
            failed_hacks = failed_hacks + 1,
            last_failed_at = NOW(),
            last_failed_by = VALUES(last_failed_by)
    ]]
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2(L3_2, L4_2)
end
function L37_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = math
  L2_2 = L2_2.floor
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0
  end
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if A1_2 <= 0 then
    return
  end
  L2_2 = L30_1
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = [[
        INSERT INTO pug_heist_statistics (heist_name, total_reward_money, best_single_reward)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE
            total_reward_money = total_reward_money + VALUES(total_reward_money),
            best_single_reward = GREATEST(best_single_reward, VALUES(best_single_reward))
    ]]
  L4_2 = {}
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A1_2
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L2_2(L3_2, L4_2)
end
function L38_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = tostring
  L4_2 = A1_2 or L4_2
  if not A1_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  A1_2 = L3_2
  if "" == A1_2 then
    return
  end
  L3_2 = L33_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = 0
  if L3_2 then
    L5_2 = L3_2.startedAt
    if L5_2 then
      L5_2 = math
      L5_2 = L5_2.max
      L6_2 = 0
      L7_2 = os
      L7_2 = L7_2.time
      L7_2 = L7_2()
      L8_2 = L3_2.startedAt
      L7_2 = L7_2 - L8_2
      L5_2 = L5_2(L6_2, L7_2)
      L4_2 = L5_2
    end
  end
  L5_2 = tostring
  L6_2 = A2_2 or L6_2
  if not A2_2 then
    L6_2 = L31_1
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
  end
  L5_2 = L5_2(L6_2)
  A2_2 = L5_2
  L5_2 = L30_1
  L6_2 = A1_2
  L5_2(L6_2)
  L5_2 = MySQL
  L5_2 = L5_2.query
  L5_2 = L5_2.await
  L6_2 = [[
        INSERT INTO pug_heist_statistics (heist_name, completed_runs, total_completion_seconds, last_completed_at, last_completed_by)
        VALUES (?, 1, ?, NOW(), ?)
        ON DUPLICATE KEY UPDATE
            completed_runs = completed_runs + 1,
            total_completion_seconds = total_completion_seconds + VALUES(total_completion_seconds),
            last_completed_at = NOW(),
            last_completed_by = VALUES(last_completed_by)
    ]]
  L7_2 = {}
  L8_2 = A1_2
  L9_2 = L4_2
  L10_2 = A2_2
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L5_2(L6_2, L7_2)
  L5_2 = L9_1
  L5_2 = L5_2[A0_2]
  if L5_2 then
    L5_2 = L9_1
    L5_2 = L5_2[A0_2]
    L5_2[A1_2] = nil
    L5_2 = next
    L6_2 = L9_1
    L6_2 = L6_2[A0_2]
    L5_2 = L5_2(L6_2)
    if nil == L5_2 then
      L5_2 = L9_1
      L5_2[A0_2] = nil
    end
  end
end
function L39_1(A0_2)
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
function L40_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0
  end
  L1_2.source = L2_2
  L2_2 = GetPlayerName
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = "Player %s"
    L3_2 = L2_2
    L2_2 = L2_2.format
    L4_2 = A0_2
    L2_2 = L2_2(L3_2, L4_2)
  end
  L1_2.playerName = L2_2
  L1_2.citizenId = ""
  L2_2 = Framework
  if "QBCore" == L2_2 then
    L2_2 = Config
    L2_2 = L2_2.FrameworkFunctions
    L2_2 = L2_2.GetPlayer
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L3_2 = L2_2.PlayerData
      if L3_2 then
        L3_2 = L2_2.PlayerData
        L3_2 = L3_2.citizenid
        if L3_2 then
          L3_2 = tostring
          L4_2 = L2_2.PlayerData
          L4_2 = L4_2.citizenid
          L3_2 = L3_2(L4_2)
          L1_2.citizenId = L3_2
        end
        L3_2 = L2_2.PlayerData
        L3_2 = L3_2.charinfo
        if L3_2 then
          L3_2 = L39_1
          L4_2 = L2_2.PlayerData
          L4_2 = L4_2.charinfo
          L4_2 = L4_2.firstname
          L3_2 = L3_2(L4_2)
          L4_2 = L39_1
          L5_2 = L2_2.PlayerData
          L5_2 = L5_2.charinfo
          L5_2 = L5_2.lastname
          L4_2 = L4_2(L5_2)
          L5_2 = L39_1
          L6_2 = L3_2
          L7_2 = " "
          L8_2 = L4_2
          L6_2 = L6_2 .. L7_2 .. L8_2
          L5_2 = L5_2(L6_2)
          if "" ~= L5_2 then
            L1_2.playerName = L5_2
          end
        end
      end
    end
  else
    L2_2 = FWork
    L2_2 = L2_2.GetPlayerFromId
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L3_2 = L2_2.identifier
      if L3_2 then
        L3_2 = tostring
        L4_2 = L2_2.identifier
        L3_2 = L3_2(L4_2)
        L1_2.citizenId = L3_2
      else
        L3_2 = type
        L4_2 = L2_2.getIdentifier
        L3_2 = L3_2(L4_2)
        if "function" == L3_2 then
          L3_2 = tostring
          L4_2 = L2_2.getIdentifier
          L4_2 = L4_2()
          if not L4_2 then
            L4_2 = ""
          end
          L3_2 = L3_2(L4_2)
          L1_2.citizenId = L3_2
        end
      end
      L3_2 = type
      L4_2 = L2_2.getName
      L3_2 = L3_2(L4_2)
      if "function" == L3_2 then
        L3_2 = L39_1
        L4_2 = L2_2.getName
        L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2()
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
        if "" ~= L3_2 then
          L1_2.playerName = L3_2
        end
      else
        L3_2 = L2_2.name
        if L3_2 then
          L3_2 = L39_1
          L4_2 = L2_2.name
          L3_2 = L3_2(L4_2)
          if "" ~= L3_2 then
            L1_2.playerName = L3_2
          end
        end
      end
    end
  end
  return L1_2
end
function L41_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = L39_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tonumber
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  L2_2 = {}
  L2_2.stepNumber = A1_2
  L2_2.stepName = ""
  if "" == A0_2 or not A1_2 then
    return L2_2
  end
  L3_2 = L29_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return L2_2
  end
  L4_2 = L3_2.stages
  L5_2 = type
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if "string" == L5_2 and "" ~= L4_2 then
    L5_2 = pcall
    L6_2 = json
    L6_2 = L6_2.decode
    L7_2 = L4_2
    L5_2, L6_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L7_2 = type
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      L4_2 = L6_2 or L4_2
    end
    if "table" ~= L7_2 or not L6_2 then
      L7_2 = {}
      L4_2 = L7_2
    end
  else
    L5_2 = type
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if "table" ~= L5_2 then
      L5_2 = {}
      L4_2 = L5_2
    end
  end
  L5_2 = ipairs
  L6_2 = L4_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = tonumber
    L12_2 = L10_2.stepNumber
    L11_2 = L11_2(L12_2)
    if L11_2 == A1_2 then
      L11_2 = L39_1
      L12_2 = L10_2.stepName
      if not L12_2 then
        L12_2 = L10_2.interactionLabel
        if not L12_2 then
          L12_2 = L10_2.label
          if not L12_2 then
            L12_2 = L10_2.type
          end
        end
      end
      L11_2 = L11_2(L12_2)
      L2_2.stepName = L11_2
      break
    end
  end
  return L2_2
end
function L42_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = type
  L3_2 = AddRobberyActionLog
  L2_2 = L2_2(L3_2)
  if "function" ~= L2_2 then
    return
  end
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = L39_1
  L3_2 = A1_2.robberyName
  if not L3_2 then
    L3_2 = A1_2.heistName
  end
  L2_2 = L2_2(L3_2)
  L3_2 = L39_1
  L4_2 = A1_2.action
  L3_2 = L3_2(L4_2)
  if "" == L2_2 or "" == L3_2 then
    return
  end
  L4_2 = L40_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = L41_1
  L6_2 = L2_2
  L7_2 = A1_2.stepNumber
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L39_1
  L7_2 = A1_2.stepName
  L6_2 = L6_2(L7_2)
  L7_2 = AddRobberyActionLog
  L8_2 = {}
  L8_2.robberyName = L2_2
  L8_2.action = L3_2
  L9_2 = L39_1
  L10_2 = A1_2.actionLabel
  L9_2 = L9_2(L10_2)
  L8_2.actionLabel = L9_2
  L9_2 = L4_2.playerName
  L8_2.playerName = L9_2
  L9_2 = L4_2.citizenId
  L8_2.citizenId = L9_2
  L9_2 = L4_2.source
  L8_2.source = L9_2
  L9_2 = L5_2.stepNumber
  L8_2.stepNumber = L9_2
  L9_2 = L6_2 or L9_2
  if "" == L6_2 or not L6_2 then
    L9_2 = L5_2.stepName
  end
  L8_2.stepName = L9_2
  L9_2 = tonumber
  L10_2 = A1_2.rewardAmount
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 0
  end
  L8_2.rewardAmount = L9_2
  L9_2 = L39_1
  L10_2 = A1_2.rewardType
  L9_2 = L9_2(L10_2)
  L8_2.rewardType = L9_2
  L9_2 = L39_1
  L10_2 = A1_2.rewardSummary
  L9_2 = L9_2(L10_2)
  L8_2.rewardSummary = L9_2
  L9_2 = L39_1
  L10_2 = A1_2.details
  L9_2 = L9_2(L10_2)
  L8_2.details = L9_2
  L9_2 = os
  L9_2 = L9_2.time
  L9_2 = L9_2()
  L8_2.timestamp = L9_2
  L7_2(L8_2)
end
function L43_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = L39_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  if "step_reward_item" == A0_2 then
    L2_2 = "Awarded an item reward for a completed robbery step."
    return L2_2
  elseif "step_reward_money" == A0_2 then
    L2_2 = "Awarded direct robbery money for a completed step."
    return L2_2
  elseif "trolly_reward_item" == A0_2 then
    L2_2 = "Awarded an item while grabbing loot from a robbery trolley."
    return L2_2
  elseif "guard_loot_item" == A0_2 then
    L2_2 = "Awarded an item from robbery guard loot."
    return L2_2
  end
  L2_2 = L39_1
  L3_2 = A1_2
  return L2_2(L3_2)
end
function L44_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = heistPasscodes
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = math
    L1_2 = L1_2.random
    L2_2 = 1000
    L3_2 = 9999
    L1_2 = L1_2(L2_2, L3_2)
    L2_2 = heistPasscodes
    L2_2[A0_2] = L1_2
  end
end
generateUniquePasscode = L44_1
function L44_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = ipairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.heist_name
    L8_2 = L6_2.stages
    L9_2 = type
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if "string" == L9_2 then
      L9_2 = json
      L9_2 = L9_2.decode
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      L8_2 = L9_2
    end
    L9_2 = type
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if "table" ~= L9_2 then
      L9_2 = {}
      L8_2 = L9_2
    end
    L9_2 = ipairs
    L10_2 = L8_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = L14_2.passcodes
      if L15_2 then
        L15_2 = heistPasscodes
        L15_2 = L15_2[L7_2]
        if L15_2 then
          L15_2 = heistPasscodesLocation
          L16_2 = L7_2
          L17_2 = L14_2.stepNumber
          L16_2 = L16_2 .. L17_2
          L17_2 = math
          L17_2 = L17_2.random
          L18_2 = 1
          L19_2 = L14_2.passcodes
          L19_2 = #L19_2
          L17_2 = L17_2(L18_2, L19_2)
          L15_2[L16_2] = L17_2
        end
      end
    end
  end
end
function L45_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = L3_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = pairs
    L2_2 = L3_1
    L2_2 = L2_2[A0_2]
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L3_1
      L7_2 = L7_2[A0_2]
      L7_2[L5_2] = nil
      L7_2 = L3_1
      L7_2 = L7_2[A0_2]
      L7_2 = L7_2.OWNER
      if L7_2 then
        L7_2 = L3_1
        L7_2 = L7_2[A0_2]
        L7_2 = L7_2.OWNER
        L7_2 = L7_2[L5_2]
        if L7_2 then
          L7_2 = L3_1
          L7_2 = L7_2[A0_2]
          L7_2 = L7_2.OWNER
          L7_2[L5_2] = nil
        end
      end
    end
    L1_2 = L3_1
    L1_2[A0_2] = nil
    L1_2 = PrintDebug
    L2_2 = "Removed all step cooldowns for heist: "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
  end
  L1_2 = L4_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L4_1
    L1_2[A0_2] = nil
    L1_2 = PrintDebug
    L2_2 = "Removed all completed step states for heist: "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
  end
  L1_2 = L5_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = L5_1
    L1_2[A0_2] = nil
  end
  L1_2 = L1_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = pairs
    L2_2 = L1_1
    L2_2 = L2_2[A0_2]
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L1_1
      L7_2 = L7_2[A0_2]
      L7_2[L5_2] = nil
    end
    L1_2 = L1_1
    L1_2[A0_2] = nil
    L1_2 = PrintDebug
    L2_2 = "Removed all laser states for heist: "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
  end
  L1_2 = L2_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = pairs
    L2_2 = L2_1
    L2_2 = L2_2[A0_2]
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L2_1
      L7_2 = L7_2[A0_2]
      L7_2[L5_2] = nil
    end
    L1_2 = L2_1
    L1_2[A0_2] = nil
    L1_2 = PrintDebug
    L2_2 = "Removed all executing steps for heist: "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
  end
  L1_2 = L6_1
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = pairs
    L2_2 = L6_1
    L2_2 = L2_2[A0_2]
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L6_1
      L7_2 = L7_2[A0_2]
      L7_2[L5_2] = nil
    end
    L1_2 = L6_1
    L1_2[A0_2] = nil
    L1_2 = PrintDebug
    L2_2 = "Removed all door states for heist: "
    L3_2 = A0_2
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
  end
  L1_2 = AllRobberysCooldDownTable
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = AllRobberysCooldDownTable
    L1_2[A0_2] = nil
  end
  L1_2 = L29_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = json
    L2_2 = L2_2.decode
    L3_2 = L1_2.settings
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L3_2 = L2_2.cooldownHeists
      if L3_2 then
        L3_2 = L2_2.cooldownHeists
        L3_2 = #L3_2
        if L3_2 > 0 then
          L3_2 = ipairs
          L4_2 = L2_2.cooldownHeists
          L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
          for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
            L9_2 = AllRobberysCooldDownTable
            L9_2 = L9_2[L8_2]
            if L9_2 then
              L9_2 = AllRobberysCooldDownTable
              L9_2[L8_2] = nil
              L9_2 = PrintDebug
              L10_2 = "Removed global cooldown for related heist: "
              L11_2 = L8_2
              L10_2 = L10_2 .. L11_2
              L9_2(L10_2)
            end
          end
        end
      end
    end
  else
    L2_2 = PrintDebug
    L3_2 = "Heist data not found for heist: "
    L4_2 = A0_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
  end
  L2_2 = PrintDebug
  L3_2 = "All cooldowns and related data removed for heist: "
  L4_2 = A0_2
  L3_2 = L3_2 .. L4_2
  L2_2(L3_2)
end
function L46_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tonumber
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if "" == A0_2 or not A1_2 then
    return
  end
  L2_2 = L4_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = L4_1
    L3_2 = {}
    L2_2[A0_2] = L3_2
  end
  L2_2 = L4_1
  L2_2 = L2_2[A0_2]
  L2_2[A1_2] = true
end
function L47_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tonumber
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if "" == A0_2 or not A1_2 then
    return
  end
  L2_2 = L5_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L2_2 = L5_1
    L3_2 = {}
    L2_2[A0_2] = L3_2
  end
  L2_2 = L5_1
  L2_2 = L2_2[A0_2]
  L2_2[A1_2] = true
end
function L48_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tonumber
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if "" ~= A0_2 and A1_2 then
    L2_2 = L4_1
    L2_2 = L2_2[A0_2]
    if L2_2 then
      goto lbl_20
    end
  end
  do return end
  ::lbl_20::
  L2_2 = L4_1
  L2_2 = L2_2[A0_2]
  L2_2[A1_2] = nil
  L2_2 = next
  L3_2 = L4_1
  L3_2 = L3_2[A0_2]
  L2_2 = L2_2(L3_2)
  if nil == L2_2 then
    L2_2 = L4_1
    L2_2[A0_2] = nil
  end
end
function L49_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tonumber
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if "" ~= A0_2 and A1_2 then
    L2_2 = L5_1
    L2_2 = L2_2[A0_2]
    if L2_2 then
      goto lbl_20
    end
  end
  do return end
  ::lbl_20::
  L2_2 = L5_1
  L2_2 = L2_2[A0_2]
  L2_2[A1_2] = nil
  L2_2 = next
  L3_2 = L5_1
  L3_2 = L3_2[A0_2]
  L2_2 = L2_2(L3_2)
  if nil == L2_2 then
    L2_2 = L5_1
    L2_2[A0_2] = nil
  end
end
function L50_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tonumber
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if "" ~= A0_2 and A1_2 then
    L2_2 = L4_1
    L2_2 = L2_2[A0_2]
    if L2_2 then
      goto lbl_21
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_21::
  L2_2 = L4_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2[A1_2]
  L2_2 = true == L2_2
  return L2_2
end
function L51_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = tostring
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = ""
  end
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = tonumber
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  if "" ~= A0_2 and A1_2 then
    L2_2 = L5_1
    L2_2 = L2_2[A0_2]
    if L2_2 then
      goto lbl_21
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_21::
  L2_2 = L5_1
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2[A1_2]
  L2_2 = true == L2_2
  return L2_2
end
function L52_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L0_2 = next
  L1_2 = L7_1
  L0_2 = L0_2(L1_2)
  if nil ~= L0_2 then
    L0_2 = pairs
    L1_2 = L7_1
    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
      L6_2 = ipairs
      L7_2 = L5_2
      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
        L12_2 = NetworkGetEntityFromNetworkId
        L13_2 = L11_2.guardNetId
        L12_2 = L12_2(L13_2)
        L13_2 = DoesEntityExist
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          L13_2 = DeleteEntity
          L14_2 = L12_2
          L13_2(L14_2)
          L13_2 = PrintDebug
          L14_2 = "Deleted guard entity with network ID:"
          L15_2 = L11_2.guardNetId
          L13_2(L14_2, L15_2)
        else
          L13_2 = PrintDebug
          L14_2 = "Guard entity not found or already deleted:"
          L15_2 = L11_2.guardNetId
          L13_2(L14_2, L15_2)
        end
      end
      L6_2 = L7_1
      L6_2[L4_2] = nil
    end
    L0_2 = PrintDebug
    L1_2 = "All guards have been deleted."
    L0_2(L1_2)
  else
    L0_2 = PrintDebug
    L1_2 = "No guards to delete."
    L0_2(L1_2)
  end
end
function L53_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetResourceState
  L2_2 = "cd_easytime"
  L1_2 = L1_2(L2_2)
  if "started" == L1_2 then
    L1_2 = GetResourceState
    L2_2 = "Renewed-Weathersync"
    L1_2 = L1_2(L2_2)
    if "started" == L1_2 then
      L1_2 = exports
      L1_2 = L1_2["qb-weathersync"]
      L2_2 = L1_2
      L1_2 = L1_2.setBlackout
      L3_2 = true
      L1_2(L2_2, L3_2)
    else
      L1_2 = TriggerClientEvent
      L2_2 = "cd_easytime:ForceUpdate"
      L3_2 = -1
      L4_2 = {}
      L4_2.blackout = true
      L1_2(L2_2, L3_2, L4_2)
    end
  else
    L1_2 = GetResourceState
    L2_2 = "qb-weathersync"
    L1_2 = L1_2(L2_2)
    if "started" == L1_2 then
      L1_2 = exports
      L1_2 = L1_2["qb-weathersync"]
      L2_2 = L1_2
      L1_2 = L1_2.setBlackout
      L3_2 = true
      L1_2(L2_2, L3_2)
    else
      L1_2 = TriggerClientEvent
      L2_2 = "Pug:client:SetAllPlayersBlackout"
      L3_2 = -1
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
    end
  end
  L8_1 = A0_2
end
function L54_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = GetResourceState
  L1_2 = "cd_easytime"
  L0_2 = L0_2(L1_2)
  if "started" == L0_2 then
    L0_2 = GetResourceState
    L1_2 = "Renewed-Weathersync"
    L0_2 = L0_2(L1_2)
    if "started" == L0_2 then
      L0_2 = exports
      L0_2 = L0_2["qb-weathersync"]
      L1_2 = L0_2
      L0_2 = L0_2.setBlackout
      L2_2 = false
      L0_2(L1_2, L2_2)
    else
      L0_2 = TriggerClientEvent
      L1_2 = "cd_easytime:ForceUpdate"
      L2_2 = -1
      L3_2 = {}
      L3_2.blackout = false
      L0_2(L1_2, L2_2, L3_2)
    end
  else
    L0_2 = GetResourceState
    L1_2 = "qb-weathersync"
    L0_2 = L0_2(L1_2)
    if "started" == L0_2 then
      L0_2 = exports
      L0_2 = L0_2["qb-weathersync"]
      L1_2 = L0_2
      L0_2 = L0_2.setBlackout
      L2_2 = false
      L0_2(L1_2, L2_2)
    else
      L0_2 = TriggerClientEvent
      L1_2 = "Pug:client:SetAllPlayersBlackout"
      L2_2 = -1
      L3_2 = false
      L0_2(L1_2, L2_2, L3_2)
    end
  end
  L0_2 = false
  L8_1 = L0_2
end
SetCityWideBlackOutOff = L54_1
function L54_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    return A0_2
  end
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "string" ~= L2_2 or "" == A0_2 then
    return A1_2
  end
  L2_2 = json
  L2_2 = L2_2.decode
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = type
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    return L2_2
  end
  return A1_2
end
function L55_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
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
          L1_2 = tonumber
          L2_2 = A0_2.x
          L1_2 = L1_2(L2_2)
          L2_2 = tonumber
          L3_2 = A0_2.y
          L2_2 = L2_2(L3_2)
          L3_2 = tonumber
          L4_2 = A0_2.z
          L3_2 = L3_2(L4_2)
          if L1_2 and L2_2 and L3_2 then
            L4_2 = vector3
            L5_2 = L1_2
            L6_2 = L2_2
            L7_2 = L3_2
            return L4_2(L5_2, L6_2, L7_2)
          end
          L4_2 = nil
          return L4_2
        end
      end
    end
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "string" == L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.match
    L3_2 = "([^,]+),%s*([^,]+),%s*([^,]+)"
    L1_2, L2_2, L3_2 = L1_2(L2_2, L3_2)
    if L1_2 and L2_2 and L3_2 then
      L4_2 = tonumber
      L5_2 = L1_2
      L4_2 = L4_2(L5_2)
      L5_2 = tonumber
      L6_2 = L2_2
      L5_2 = L5_2(L6_2)
      L6_2 = tonumber
      L7_2 = L3_2
      L6_2 = L6_2(L7_2)
      L3_2 = L6_2
      L2_2 = L5_2
      L1_2 = L4_2
      if L1_2 and L2_2 and L3_2 then
        L4_2 = vector3
        L5_2 = L1_2
        L6_2 = L2_2
        L7_2 = L3_2
        return L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
  L1_2 = nil
  return L1_2
end
function L56_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = tostring
    L2_2 = A0_2.type
    if not L2_2 then
      L2_2 = ""
    end
    L1_2 = L1_2(L2_2)
    L2_2 = L1_2
    L1_2 = L1_2.lower
    L1_2 = L1_2(L2_2)
    if "hackable_door" == L1_2 then
      goto lbl_19
    end
  end
  L1_2 = false
  L2_2 = nil
  do return L1_2, L2_2 end
  ::lbl_19::
  L1_2 = L55_1
  L2_2 = A0_2.doorPosition
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = false
    L3_2 = nil
    return L2_2, L3_2
  end
  L2_2 = L55_1
  L3_2 = A0_2.targetVector
  L2_2 = L2_2(L3_2)
  L3_2 = L55_1
  L4_2 = A0_2.pedCoords
  L3_2 = L3_2(L4_2)
  if L2_2 then
    L4_2 = L1_2 - L2_2
    L4_2 = #L4_2
    L5_2 = L22_1
  end
  L4_2 = L4_2 > L5_2 or L4_2
  if L3_2 then
    L5_2 = L1_2 - L3_2
    L5_2 = #L5_2
    L6_2 = L22_1
  end
  L5_2 = L5_2 > L6_2 or L5_2
  if not L4_2 and not L5_2 then
    L6_2 = false
    L7_2 = nil
    return L6_2, L7_2
  end
  A0_2.targetVector = ""
  A0_2.pedCoords = ""
  A0_2.propName = ""
  A0_2.propHeading = ""
  A0_2.heading = ""
  L6_2 = true
  L7_2 = {}
  L8_2 = tonumber
  L9_2 = A0_2.stepNumber
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = 0
  end
  L7_2.stepNumber = L8_2
  L8_2 = tostring
  L9_2 = A0_2.stepName
  if not L9_2 then
    L9_2 = ""
  end
  L8_2 = L8_2(L9_2)
  L7_2.stepName = L8_2
  return L6_2, L7_2
end
function L57_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = L54_1
  L3_2 = A0_2
  L4_2 = {}
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = type
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if "table" ~= L3_2 then
    L3_2 = {}
    L4_2 = 0
    L5_2 = {}
    return L3_2, L4_2, L5_2
  end
  L3_2 = 0
  L4_2 = {}
  L5_2 = ipairs
  L6_2 = L2_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L56_1
    L12_2 = L10_2
    L11_2, L12_2 = L11_2(L12_2)
    if L11_2 then
      L3_2 = L3_2 + 1
      L13_2 = table
      L13_2 = L13_2.insert
      L14_2 = L4_2
      L15_2 = {}
      L16_2 = tostring
      L17_2 = A1_2 or L17_2
      if not A1_2 then
        L17_2 = ""
      end
      L16_2 = L16_2(L17_2)
      L15_2.heistName = L16_2
      if L12_2 then
        L16_2 = L12_2.stepNumber
        if L16_2 then
          goto lbl_53
        end
      end
      L16_2 = tonumber
      L17_2 = L10_2.stepNumber
      L16_2 = L16_2(L17_2)
      if not L16_2 then
        L16_2 = 0
      end
      ::lbl_53::
      L15_2.stepNumber = L16_2
      if L12_2 then
        L16_2 = L12_2.stepName
        if L16_2 then
          goto lbl_65
        end
      end
      L16_2 = tostring
      L17_2 = L10_2.stepName
      if not L17_2 then
        L17_2 = ""
      end
      L16_2 = L16_2(L17_2)
      ::lbl_65::
      L15_2.stepName = L16_2
      L13_2(L14_2, L15_2)
    end
  end
  L5_2 = L2_2
  L6_2 = L3_2
  L7_2 = L4_2
  return L5_2, L6_2, L7_2
end
function L58_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = ipairs
  L3_2 = A1_2 or L3_2
  if not A1_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = A0_2
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
end
function L59_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = tostring
  L2_2 = A0_2.heistName
  if not L2_2 then
    L2_2 = Config
    L2_2 = L2_2.T
    L3_2 = "SanitizedUnknownRobbery"
    L2_2 = L2_2(L3_2)
  end
  L1_2 = L1_2(L2_2)
  L2_2 = tonumber
  L3_2 = A0_2.stepNumber
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0
  end
  L3_2 = tostring
  L4_2 = A0_2.stepName
  if not L4_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  if "" ~= L3_2 then
    L4_2 = Config
    L4_2 = L4_2.T
    L5_2 = "SanitizedDetailWithStepName"
    L6_2 = L1_2
    L7_2 = L2_2
    L8_2 = L3_2
    return L4_2(L5_2, L6_2, L7_2, L8_2)
  end
  L4_2 = Config
  L4_2 = L4_2.T
  L5_2 = "SanitizedDetail"
  L6_2 = L1_2
  L7_2 = L2_2
  return L4_2(L5_2, L6_2, L7_2)
end
function L60_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = {}
  L5_2 = 1
  L6_2 = math
  L6_2 = L6_2.min
  L7_2 = A1_2 or L7_2
  if not A1_2 then
    L7_2 = 0
  end
  L8_2 = 3
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = A2_2 or L9_2
    if A2_2 then
      L9_2 = A2_2[L8_2]
    end
    if L9_2 then
      L10_2 = table
      L10_2 = L10_2.insert
      L11_2 = L4_2
      L12_2 = L59_1
      L13_2 = L9_2
      L12_2, L13_2 = L12_2(L13_2)
      L10_2(L11_2, L12_2, L13_2)
    end
  end
  L6_2 = A0_2
  L5_2 = A0_2.format
  L7_2 = A1_2 or L7_2
  if not A1_2 then
    L7_2 = 0
  end
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = #L4_2
  if L6_2 > 0 then
    L6_2 = L5_2
    L7_2 = " "
    L8_2 = table
    L8_2 = L8_2.concat
    L9_2 = L4_2
    L10_2 = "; "
    L8_2 = L8_2(L9_2, L10_2)
    L6_2 = L6_2 .. L7_2 .. L8_2
    L5_2 = L6_2
    L6_2 = A1_2 or L6_2
    if not A1_2 then
      L6_2 = 0
    end
    L7_2 = #L4_2
    if L6_2 > L7_2 then
      L6_2 = L5_2
      L7_2 = Config
      L7_2 = L7_2.T
      L8_2 = "SanitizedAndMore"
      L9_2 = A1_2 or L9_2
      if not A1_2 then
        L9_2 = 0
      end
      L10_2 = #L4_2
      L9_2 = L9_2 - L10_2
      L7_2 = L7_2(L8_2, L9_2)
      L6_2 = L6_2 .. L7_2
      L5_2 = L6_2
    else
      L6_2 = L5_2
      L7_2 = "."
      L6_2 = L6_2 .. L7_2
      L5_2 = L6_2
    end
  elseif A3_2 then
    L6_2 = L5_2
    L7_2 = " "
    L8_2 = A3_2
    L6_2 = L6_2 .. L7_2 .. L8_2
    L5_2 = L6_2
  end
  if A3_2 then
    L6_2 = #L4_2
    if L6_2 > 0 then
      L6_2 = L5_2
      L7_2 = " "
      L8_2 = A3_2
      L6_2 = L6_2 .. L7_2 .. L8_2
      L5_2 = L6_2
    end
  end
  return L5_2
end
function L61_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = {}
  L2_2 = 0
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = A0_2 or L5_2
  if not A0_2 then
    L5_2 = {}
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = tostring
    L11_2 = L9_2.heist_name
    if not L11_2 then
      L11_2 = ""
    end
    L10_2 = L10_2(L11_2)
    if "" ~= L10_2 then
      L11_2 = L57_1
      L12_2 = L9_2.stages
      L13_2 = L10_2
      L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
      L2_2 = L2_2 + L12_2
      L14_2 = L58_1
      L15_2 = L3_2
      L16_2 = L13_2
      L14_2(L15_2, L16_2)
      L14_2 = table
      L14_2 = L14_2.insert
      L15_2 = L1_2
      L16_2 = {}
      L16_2.heist_name = L10_2
      L16_2.stages = L11_2
      L17_2 = L54_1
      L18_2 = L9_2.settings
      L19_2 = {}
      L17_2 = L17_2(L18_2, L19_2)
      L16_2.settings = L17_2
      L14_2(L15_2, L16_2)
    end
  end
  L4_2 = L1_2
  L5_2 = L2_2
  L6_2 = L3_2
  return L4_2, L5_2, L6_2
end
function L62_1(A0_2)
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
  L4_2 = "_[Dd][Oo][Oo][Rr][Ll][Oo][Cc][Kk][Ss]$"
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
function L63_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L62_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L1_2 = "presets"
  end
  L2_2 = "%s/%s.json"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = L13_1
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L1_2
  return L2_2, L3_2
end
function L64_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L62_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L1_2 = "presets"
  end
  L2_2 = "%s/%s.json"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = L14_1
  L5_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L3_2 = L1_2
  return L2_2, L3_2
end
function L65_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L63_1
  L2_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2)
  L3_2 = "%s/%s_doorlocks.json"
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L13_1
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = L2_2
  return L3_2, L4_2
end
function L66_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L64_1
  L2_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2)
  L3_2 = "%s/%s_doorlocks.json"
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L14_1
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = L2_2
  return L3_2, L4_2
end
function L67_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L63_1
  L2_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2)
  L3_2 = LoadResourceFile
  L4_2 = GetCurrentResourceName
  L4_2 = L4_2()
  L5_2 = L1_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L3_2 = L1_2
    L4_2 = L2_2
    L5_2 = false
    return L3_2, L4_2, L5_2
  end
  L3_2 = "%s/%s.json"
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = L14_1
  L6_2 = L2_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  L4_2 = LoadResourceFile
  L5_2 = GetCurrentResourceName
  L5_2 = L5_2()
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = L3_2
    L5_2 = L2_2
    L6_2 = true
    return L4_2, L5_2, L6_2
  end
  L4_2 = L1_2
  L5_2 = L2_2
  L6_2 = false
  return L4_2, L5_2, L6_2
end
function L68_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L65_1
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  L4_2 = "%s/%s_doorlocks.json"
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = L14_1
  L7_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if A1_2 then
    L5_2 = LoadResourceFile
    L6_2 = GetCurrentResourceName
    L6_2 = L6_2()
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    if L5_2 then
      L5_2 = L4_2
      L6_2 = L3_2
      L7_2 = true
      return L5_2, L6_2, L7_2
    end
  end
  L5_2 = LoadResourceFile
  L6_2 = GetCurrentResourceName
  L6_2 = L6_2()
  L7_2 = L2_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = L2_2
    L6_2 = L3_2
    L7_2 = false
    return L5_2, L6_2, L7_2
  end
  L5_2 = LoadResourceFile
  L6_2 = GetCurrentResourceName
  L6_2 = L6_2()
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = L4_2
    L6_2 = L3_2
    L7_2 = true
    return L5_2, L6_2, L7_2
  end
  L5_2 = L2_2
  L6_2 = L3_2
  L7_2 = false
  return L5_2, L6_2, L7_2
end
function L69_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L63_1
  L2_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2)
  if "" ~= L2_2 then
    L3_2 = "%s.json"
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = L2_2
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = L21_1
    L4_2[L3_2] = true
  end
end
function L70_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = LoadResourceFile
  L2_2 = GetCurrentResourceName
  L2_2 = L2_2()
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 or "" == L1_2 then
    L2_2 = {}
    return L2_2
  end
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
      goto lbl_28
    end
  end
  L4_2 = {}
  do return L4_2 end
  ::lbl_28::
  L4_2 = {}
  L5_2 = ipairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = type
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    if "string" == L11_2 and "" ~= L10_2 then
      L11_2 = table
      L11_2 = L11_2.insert
      L12_2 = L4_2
      L13_2 = L10_2
      L11_2(L12_2, L13_2)
    end
  end
  return L4_2
end
function L71_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = {}
  L1_2 = {}
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = L63_1
    L2_3 = A0_3
    L1_3, L2_3 = L1_3(L2_3)
    L3_3 = "%s.json"
    L4_3 = L3_3
    L3_3 = L3_3.format
    L5_3 = L2_3
    L3_3 = L3_3(L4_3, L5_3)
    if ".json" ~= L3_3 then
      L4_3 = L0_2
      L4_3 = L4_3[L3_3]
      if not L4_3 then
        L4_3 = L0_2
        L4_3[L3_3] = true
        L4_3 = L1_2
        L4_3 = #L4_3
        L5_3 = L4_3 + 1
        L4_3 = L1_2
        L4_3[L5_3] = L3_3
      end
    end
  end
  L3_2 = ipairs
  L4_2 = L70_1
  L5_2 = L17_1
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L4_2(L5_2)
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L2_2
    L10_2 = L8_2
    L9_2(L10_2)
  end
  L3_2 = ipairs
  L4_2 = L70_1
  L5_2 = L20_1
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L4_2(L5_2)
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L2_2
    L10_2 = L8_2
    L9_2(L10_2)
  end
  return L1_2
end
function L72_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
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
      L8_2 = L63_1
      L9_2 = L7_2
      L8_2, L9_2 = L8_2(L9_2)
      L10_2 = "%s.json"
      L11_2 = L10_2
      L10_2 = L10_2.format
      L12_2 = L9_2
      L10_2 = L10_2(L11_2, L12_2)
      L1_2[L10_2] = true
    end
  end
  L2_2 = {}
  L3_2 = pairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2 in L3_2, L4_2, L5_2, L6_2 do
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = L2_2
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  L3_2 = table
  L3_2 = L3_2.sort
  L4_2 = L2_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    if "presets.json" == A0_3 then
      L2_3 = true
      return L2_3
    end
    if "presets.json" == A1_3 then
      L2_3 = false
      return L2_3
    end
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
  L6_2 = L17_1
  L7_2 = L3_2
  L8_2 = -1
  return L4_2(L5_2, L6_2, L7_2, L8_2)
end
function L73_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L66_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = LoadResourceFile
  L3_2 = GetCurrentResourceName
  L3_2 = L3_2()
  L4_2 = L1_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    return L1_2
  end
  L2_2 = nil
  return L2_2
end
function L74_1()
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
  L6_2 = "mainrobbery-presets"
  L2_2 = L2_2 .. L3_2 .. L4_2 .. L5_2 .. L6_2
  return L2_2
end
function L75_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = GetResourcePath
  L1_2 = GetCurrentResourceName
  L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)
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
  L2_2 = L2_2 .. L3_2 .. L4_2
  return L2_2
end
function L76_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = "string" == L1_2
  return L1_2
end
function L77_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  L1_2 = L76_1
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
function L78_1(A0_2)
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
function L79_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = {}
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L1_3 = tostring
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = ""
    end
    L1_3 = L1_3(L2_3)
    L2_3 = L1_3
    L1_3 = L1_3.gsub
    L3_3 = "\\"
    L4_3 = "/"
    L1_3 = L1_3(L2_3, L3_3, L4_3)
    A0_3 = L1_3
    L2_3 = A0_3
    L1_3 = A0_3.match
    L3_3 = "^preset%-info/mainrobbery%-presets/(.+)$"
    L1_3 = L1_3(L2_3, L3_3)
    if not L1_3 then
      L2_3 = A0_3
      L1_3 = A0_3.match
      L3_3 = "^preset%-info/([^/]+)$"
      L1_3 = L1_3(L2_3, L3_3)
    end
    if L1_3 then
      L3_3 = L1_3
      L2_3 = L1_3.lower
      L2_3 = L2_3(L3_3)
      if L2_3 then
        goto lbl_26
      end
    end
    L2_3 = ""
    ::lbl_26::
    if L1_3 then
      L4_3 = L1_3
      L3_3 = L1_3.find
      L5_3 = "*"
      L6_3 = 1
      L7_3 = true
      L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
      if not L3_3 then
        L4_3 = L1_3
        L3_3 = L1_3.find
        L5_3 = "?"
        L6_3 = 1
        L7_3 = true
        L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)
        if not L3_3 then
          L4_3 = L2_3
          L3_3 = L2_3.match
          L5_3 = "%.json$"
          L3_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            L4_3 = L2_3
            L3_3 = L2_3.match
            L5_3 = "_doorlocks%.json$"
            L3_3 = L3_3(L4_3, L5_3)
            if not L3_3 then
              L4_3 = L2_3
              L3_3 = L2_3.match
              L5_3 = "%.bak$"
              L3_3 = L3_3(L4_3, L5_3)
              if not L3_3 and "preset-index.json" ~= L2_3 and "mainrobbery-preset-index.json" ~= L2_3 then
                L3_3 = L0_2
                L3_3[L1_3] = true
              end
            end
          end
        end
      end
    end
  end
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    L1_3 = GetNumResourceMetadata
    L2_3 = L1_2
    L3_3 = A0_3
    L1_3 = L1_3(L2_3, L3_3)
    if not L1_3 then
      L1_3 = 0
    end
    L2_3 = 0
    L3_3 = L1_3 - 1
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = GetResourceMetadata
      L7_3 = L1_2
      L8_3 = A0_3
      L9_3 = L5_3
      L6_3 = L6_3(L7_3, L8_3, L9_3)
      L7_3 = type
      L8_3 = L6_3
      L7_3 = L7_3(L8_3)
      if "string" == L7_3 and "" ~= L6_3 then
        L7_3 = L2_2
        L8_3 = L6_3
        L7_3(L8_3)
      end
    end
  end
  L4_2 = L3_2
  L5_2 = "files"
  L4_2(L5_2)
  L4_2 = L3_2
  L5_2 = "file"
  L4_2(L5_2)
  return L0_2
end
function L80_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = {}
  L1_2 = L79_1
  L1_2 = L1_2()
  L2_2 = L74_1
  L2_2 = L2_2()
  L3_2 = L75_1
  L3_2 = L3_2()
  function L4_2(A0_3)
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
    L3_3 = "^preset%-info/mainrobbery%-presets/(.+)$"
    L1_3 = L1_3(L2_3, L3_3)
    if not L1_3 then
      L2_3 = A0_3
      L1_3 = A0_3.gsub
      L3_3 = "\\"
      L4_3 = "/"
      L1_3 = L1_3(L2_3, L3_3, L4_3)
      L2_3 = L1_3
      L1_3 = L1_3.match
      L3_3 = "^preset%-info/([^/]+)$"
      L1_3 = L1_3(L2_3, L3_3)
      if not L1_3 then
        L2_3 = A0_3
        L1_3 = A0_3.gsub
        L3_3 = "\\"
        L4_3 = "/"
        L1_3 = L1_3(L2_3, L3_3, L4_3)
      end
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
      L5_3 = "_doorlocks%.json$"
      L3_3 = L3_3(L4_3, L5_3)
      if not L3_3 then
        L4_3 = L2_3
        L3_3 = L2_3.match
        L5_3 = "%.bak$"
        L3_3 = L3_3(L4_3, L5_3)
        if not L3_3 and "preset-index.json" ~= L2_3 and "mainrobbery-preset-index.json" ~= L2_3 then
          L3_3 = L1_2
          L3_3[L1_3] = true
        end
      end
    end
  end
  L5_2 = ipairs
  L6_2 = L71_1
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L6_2()
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L4_2
    L12_2 = L10_2
    L11_2(L12_2)
  end
  L5_2 = pairs
  L6_2 = L21_1
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2 in L5_2, L6_2, L7_2, L8_2 do
    L10_2 = L4_2
    L11_2 = L9_2
    L10_2(L11_2)
  end
  if L2_2 then
    L5_2 = nil
    L6_2 = L76_1
    L7_2 = L2_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = "powershell -NoProfile -Command \"& { Get-ChildItem -LiteralPath %s -File | Select-Object -ExpandProperty Name }\""
      L7_2 = L6_2
      L6_2 = L6_2.format
      L8_2 = L78_1
      L9_2 = L2_2
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L5_2 = L6_2
    else
      L6_2 = "ls -1 %s"
      L7_2 = L6_2
      L6_2 = L6_2.format
      L8_2 = L77_1
      L9_2 = L2_2
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L5_2 = L6_2
    end
    L6_2 = io
    L6_2 = L6_2.popen
    if L6_2 then
      L6_2 = io
      L6_2 = L6_2.popen
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        goto lbl_65
      end
    end
    L6_2 = nil
    ::lbl_65::
    if L6_2 then
      L8_2 = L6_2
      L7_2 = L6_2.lines
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2 in L7_2, L8_2, L9_2, L10_2 do
        L12_2 = L4_2
        L13_2 = L11_2
        L12_2(L13_2)
      end
      L8_2 = L6_2
      L7_2 = L6_2.close
      L7_2(L8_2)
    end
  end
  if L3_2 then
    L5_2 = nil
    L6_2 = L76_1
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = "powershell -NoProfile -Command \"& { Get-ChildItem -LiteralPath %s -File | Select-Object -ExpandProperty Name }\""
      L7_2 = L6_2
      L6_2 = L6_2.format
      L8_2 = L78_1
      L9_2 = L3_2
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L5_2 = L6_2
    else
      L6_2 = "ls -1 %s"
      L7_2 = L6_2
      L6_2 = L6_2.format
      L8_2 = L77_1
      L9_2 = L3_2
      L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L5_2 = L6_2
    end
    L6_2 = io
    L6_2 = L6_2.popen
    if L6_2 then
      L6_2 = io
      L6_2 = L6_2.popen
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        goto lbl_112
      end
    end
    L6_2 = nil
    ::lbl_112::
    if L6_2 then
      L8_2 = L6_2
      L7_2 = L6_2.lines
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2 in L7_2, L8_2, L9_2, L10_2 do
        L12_2 = L4_2
        L13_2 = L11_2
        L12_2(L13_2)
      end
      L8_2 = L6_2
      L7_2 = L6_2.close
      L7_2(L8_2)
    end
  end
  L5_2 = LoadResourceFile
  L6_2 = GetCurrentResourceName
  L6_2 = L6_2()
  L7_2 = L15_1
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = L4_2
    L6_2 = "presets.json"
    L5_2(L6_2)
  end
  L5_2 = LoadResourceFile
  L6_2 = GetCurrentResourceName
  L6_2 = L6_2()
  L7_2 = L18_1
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L5_2 = L4_2
    L6_2 = "presets.json"
    L5_2(L6_2)
  end
  L5_2 = pairs
  L6_2 = L1_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2 in L5_2, L6_2, L7_2, L8_2 do
    L10_2 = table
    L10_2 = L10_2.insert
    L11_2 = L0_2
    L12_2 = L9_2
    L10_2(L11_2, L12_2)
  end
  L5_2 = table
  L5_2 = L5_2.sort
  L6_2 = L0_2
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    if "presets.json" == A0_3 then
      L2_3 = true
      return L2_3
    end
    if "presets.json" == A1_3 then
      L2_3 = false
      return L2_3
    end
    L3_3 = A0_3
    L2_3 = A0_3.lower
    L2_3 = L2_3(L3_3)
    L4_3 = A1_3
    L3_3 = A1_3.lower
    L3_3 = L3_3(L4_3)
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  L5_2(L6_2, L7_2)
  return L0_2
end
function L81_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if not A0_2 then
    A0_2 = L15_1
  end
  L1_2 = LoadResourceFile
  L2_2 = GetCurrentResourceName
  L2_2 = L2_2()
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 or "" == L1_2 then
    L2_2 = nil
    L3_2 = "Unable to load "
    L4_2 = A0_2
    L5_2 = "."
    L3_2 = L3_2 .. L4_2 .. L5_2
    return L2_2, L3_2
  end
  L2_2 = json
  L2_2 = L2_2.decode
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = type
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if "table" ~= L3_2 then
    L3_2 = nil
    L4_2 = A0_2
    L5_2 = " is not valid JSON robbery data."
    L4_2 = L4_2 .. L5_2
    return L3_2, L4_2
  end
  return L2_2
end
function L82_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A0_2 then
    A0_2 = L15_1
  end
  L2_2 = GetCurrentResourceName
  L2_2 = L2_2()
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = A1_2 or L4_2
  if not A1_2 then
    L4_2 = {}
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 or "" == L3_2 then
    L4_2 = false
    L5_2 = "Failed to encode the preset robbery data."
    return L4_2, L5_2
  end
  L4_2 = LoadResourceFile
  L5_2 = L2_2
  L6_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 and "" ~= L4_2 then
    L5_2 = SaveResourceFile
    L6_2 = L2_2
    L7_2 = A0_2
    L8_2 = ".bak"
    L7_2 = L7_2 .. L8_2
    L8_2 = L4_2
    L9_2 = -1
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = SaveResourceFile
  L6_2 = L2_2
  L7_2 = A0_2
  L8_2 = L3_2
  L9_2 = -1
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L6_2 = false
    L7_2 = "Failed to write "
    L8_2 = A0_2
    L9_2 = "."
    L7_2 = L7_2 .. L8_2 .. L9_2
    return L6_2, L7_2
  end
  L6_2 = true
  return L6_2
end
function L83_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if not A0_2 or "" == A0_2 then
    L1_2 = nil
    L2_2 = "No doorlock preset file was provided."
    return L1_2, L2_2
  end
  L1_2 = LoadResourceFile
  L2_2 = GetCurrentResourceName
  L2_2 = L2_2()
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 or "" == L1_2 then
    L2_2 = nil
    L3_2 = "Unable to load "
    L4_2 = A0_2
    L5_2 = "."
    L3_2 = L3_2 .. L4_2 .. L5_2
    return L2_2, L3_2
  end
  L2_2 = json
  L2_2 = L2_2.decode
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = type
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if "table" ~= L3_2 then
    L3_2 = nil
    L4_2 = A0_2
    L5_2 = " is not valid JSON doorlock data."
    L4_2 = L4_2 .. L5_2
    return L3_2, L4_2
  end
  return L2_2
end
function L84_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if not A0_2 or "" == A0_2 then
    L2_2 = false
    L3_2 = "No doorlock preset file was provided."
    return L2_2, L3_2
  end
  L2_2 = GetCurrentResourceName
  L2_2 = L2_2()
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = A1_2 or L4_2
  if not A1_2 then
    L4_2 = {}
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 or "" == L3_2 then
    L4_2 = false
    L5_2 = "Failed to encode the doorlock preset data."
    return L4_2, L5_2
  end
  L4_2 = LoadResourceFile
  L5_2 = L2_2
  L6_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 and "" ~= L4_2 then
    L5_2 = SaveResourceFile
    L6_2 = L2_2
    L7_2 = A0_2
    L8_2 = ".bak"
    L7_2 = L7_2 .. L8_2
    L8_2 = L4_2
    L9_2 = -1
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  L5_2 = SaveResourceFile
  L6_2 = L2_2
  L7_2 = A0_2
  L8_2 = L3_2
  L9_2 = -1
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  if not L5_2 then
    L6_2 = false
    L7_2 = "Failed to write "
    L8_2 = A0_2
    L9_2 = "."
    L7_2 = L7_2 .. L8_2 .. L9_2
    return L6_2, L7_2
  end
  L6_2 = true
  return L6_2
end
function L85_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = {}
  L2_2 = ipairs
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L54_1
    L9_2 = L7_2.stages
    L10_2 = {}
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = ipairs
    L10_2 = L8_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
      L15_2 = tonumber
      L16_2 = L14_2 or L16_2
      if L14_2 then
        L16_2 = L14_2.doorId
      end
      L15_2 = L15_2(L16_2)
      if L15_2 then
        L1_2[L15_2] = true
      end
    end
  end
  return L1_2
end
function L86_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = GetResourceState
  L2_2 = "ox_doorlock"
  L1_2 = L1_2(L2_2)
  if "started" ~= L1_2 then
    L1_2 = {}
    return L1_2
  end
  L1_2 = L85_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = next
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if nil == L2_2 then
    L2_2 = {}
    return L2_2
  end
  L2_2 = MySQL
  L2_2 = L2_2.query
  L2_2 = L2_2.await
  L3_2 = "SELECT id, name, data FROM ox_doorlock"
  L4_2 = {}
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = L2_2 or L5_2
  if not L2_2 then
    L5_2 = {}
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = tonumber
    L11_2 = L9_2.id
    L10_2 = L10_2(L11_2)
    if L10_2 then
      L11_2 = L1_2[L10_2]
      if L11_2 then
        L11_2 = table
        L11_2 = L11_2.insert
        L12_2 = L3_2
        L13_2 = {}
        L13_2.id = L10_2
        L14_2 = L9_2.name
        L13_2.name = L14_2
        L14_2 = L54_1
        L15_2 = L9_2.data
        L16_2 = {}
        L14_2 = L14_2(L15_2, L16_2)
        L13_2.data = L14_2
        L11_2(L12_2, L13_2)
      end
    end
  end
  L4_2 = table
  L4_2 = L4_2.sort
  L5_2 = L3_2
  function L6_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = tonumber
    L3_3 = A0_3.id
    L2_3 = L2_3(L3_3)
    if not L2_3 then
      L2_3 = 0
    end
    L3_3 = tonumber
    L4_3 = A1_3.id
    L3_3 = L3_3(L4_3)
    if not L3_3 then
      L3_3 = 0
    end
    L2_3 = L2_3 < L3_3
    return L2_3
  end
  L4_2(L5_2, L6_2)
  return L3_2
end
function L87_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = pairs
  L2_2 = L9_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L6_2[A0_2] = nil
    L7_2 = next
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if nil == L7_2 then
      L7_2 = L9_1
      L7_2[L5_2] = nil
    end
  end
end
function L88_1()
  local L0_2, L1_2
  L0_2 = {}
  heistPasscodes = L0_2
  L0_2 = {}
  heistPasscodesLocation = L0_2
end
function L89_1(A0_2)
  local L1_2, L2_2
  L1_2 = L45_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = L87_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = heistPasscodes
  L1_2[A0_2] = nil
  L1_2 = L8_1
  if L1_2 == A0_2 then
    L1_2 = SetCityWideBlackOutOff
    L1_2()
  end
end
function L90_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = L88_1
  L0_2()
  L0_2 = getHeists
  L0_2 = L0_2()
  L1_2 = ipairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L6_2.heist_name
    if L7_2 then
      L7_2 = L6_2.heist_name
      if "" ~= L7_2 then
        L7_2 = generateUniquePasscode
        L8_2 = L6_2.heist_name
        L7_2(L8_2)
      end
    end
  end
  L1_2 = L44_1
  L2_2 = L0_2
  L1_2(L2_2)
  return L0_2
end
function L91_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = TriggerClientEvent
  L2_2 = "heist:showHeistUI"
  L3_2 = A0_2
  L4_2 = getHeists
  L4_2 = L4_2()
  L5_2 = getBankTruckSettings
  L5_2 = L5_2()
  L6_2 = getSellItemsSettings
  L6_2 = L6_2()
  L7_2 = getAtmRobberySettings
  L7_2 = L7_2()
  L8_2 = getPettyCrimeSettings
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  L9_2 = getHouseRobberySettings
  L9_2 = L9_2()
  L10_2 = getRobberyIntelConfig
  L10_2 = L10_2()
  L11_2 = getHeistStatistics
  L11_2 = L11_2()
  L12_2 = GetRobberyActionLogsSummary
  L12_2 = L12_2()
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
end
function L92_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = TriggerClientEvent
  L2_2 = "Pug:client:SyncAllRobberyPasscodes"
  L3_2 = -1
  L4_2 = heistPasscodes
  L5_2 = heistPasscodesLocation
  L1_2(L2_2, L3_2, L4_2, L5_2)
  if A0_2 then
    L1_2 = #A0_2
    if L1_2 > 0 then
      L1_2 = TriggerClientEvent
      L2_2 = "Pug:client:HandleAllRobberyTargets"
      L3_2 = -1
      L4_2 = A0_2
      L5_2 = true
      L1_2(L2_2, L3_2, L4_2, L5_2)
    end
  end
end
L93_1 = {}
L94_1 = {}
L94_1.dir = "banktruck-presets"
L94_1.indexFile = "banktruck-preset-index.json"
L94_1.defaultBase = "banktruck_preset"
L94_1.typeName = "bank_truck_setup_preset"
L94_1.label = "bank truck"
L93_1.banktruck = L94_1
L94_1 = {}
L94_1.dir = "atm-presets"
L94_1.indexFile = "atm-preset-index.json"
L94_1.defaultBase = "atm_preset"
L94_1.typeName = "atm_setup_preset"
L94_1.label = "ATM"
L93_1.atm = L94_1
L94_1 = {}
L94_1.dir = "sellitem-presets"
L94_1.indexFile = "sellitem-preset-index.json"
L94_1.defaultBase = "sell_trader_preset"
L94_1.typeName = "sell_item_setup_preset"
L94_1.label = "item sell/trader"
L93_1.sellitem = L94_1
L94_1 = {}
L95_1 = {}
L94_1.banktruck = L95_1
L95_1 = {}
L94_1.atm = L95_1
L95_1 = {}
L94_1.sellitem = L95_1
function L95_1(A0_2)
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
function L96_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L95_1
  L2_2 = A0_2
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
function L97_1(A0_2)
  local L1_2
  L1_2 = L93_1
  L1_2 = L1_2[A0_2]
  return L1_2
end
function L98_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = "preset-info/%s/%s"
  L2_2 = L1_2
  L1_2 = L1_2.format
  L3_2 = A0_2.dir
  L4_2 = A0_2.indexFile
  return L1_2(L2_2, L3_2, L4_2)
end
function L99_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L97_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = nil
    L4_2 = nil
    L5_2 = nil
    return L3_2, L4_2, L5_2
  end
  L3_2 = L96_1
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if "" == L3_2 then
    L3_2 = L2_2.defaultBase
  end
  L4_2 = "preset-info/%s/%s.json"
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = L2_2.dir
  L7_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = "%s.json"
  L6_2 = L5_2
  L5_2 = L5_2.format
  L7_2 = L3_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L2_2
  return L4_2, L5_2, L6_2
end
function L100_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = GetResourcePath
  L2_2 = GetCurrentResourceName
  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)
  if not L1_2 or "" == L1_2 then
    L2_2 = nil
    return L2_2
  end
  L3_2 = L1_2
  L2_2 = L1_2.find
  L4_2 = "\\"
  L5_2 = 1
  L6_2 = true
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  if L2_2 then
    L2_2 = "\\"
    if L2_2 then
      goto lbl_22
    end
  end
  L2_2 = "/"
  ::lbl_22::
  L3_2 = L1_2
  L4_2 = L2_2
  L5_2 = "preset-info"
  L6_2 = L2_2
  L7_2 = A0_2.dir
  L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2
  return L3_2
end
function L101_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = L97_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = {}
    return L2_2
  end
  L2_2 = LoadResourceFile
  L3_2 = GetCurrentResourceName
  L3_2 = L3_2()
  L4_2 = L98_1
  L5_2 = L1_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L4_2(L5_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if not L2_2 or "" == L2_2 then
    L3_2 = {}
    return L3_2
  end
  L3_2 = pcall
  L4_2 = json
  L4_2 = L4_2.decode
  L5_2 = L2_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L5_2 = type
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if "table" == L5_2 then
      goto lbl_38
    end
  end
  L5_2 = {}
  do return L5_2 end
  ::lbl_38::
  L5_2 = {}
  L6_2 = ipairs
  L7_2 = L4_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do
    L12_2 = type
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if "string" == L12_2 and "" ~= L11_2 then
      L12_2 = #L5_2
      L12_2 = L12_2 + 1
      L5_2[L12_2] = L11_2
    end
  end
  return L5_2
end
function L102_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = L97_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = false
    return L3_2
  end
  L3_2 = {}
  L4_2 = ipairs
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = {}
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = type
    L11_2 = L9_2
    L10_2 = L10_2(L11_2)
    if "string" == L10_2 and "" ~= L9_2 then
      L10_2 = L99_1
      L11_2 = A0_2
      L12_2 = L9_2
      L10_2, L11_2 = L10_2(L11_2, L12_2)
      if L11_2 and "" ~= L11_2 then
        L3_2[L11_2] = true
      end
    end
  end
  L4_2 = {}
  L5_2 = pairs
  L6_2 = L3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2 in L5_2, L6_2, L7_2, L8_2 do
    L10_2 = #L4_2
    L10_2 = L10_2 + 1
    L4_2[L10_2] = L9_2
  end
  L5_2 = table
  L5_2 = L5_2.sort
  L6_2 = L4_2
  function L7_2(A0_3, A1_3)
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
  L5_2(L6_2, L7_2)
  L5_2 = json
  L5_2 = L5_2.encode
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if not L5_2 or "" == L5_2 then
    L6_2 = false
    return L6_2
  end
  L6_2 = SaveResourceFile
  L7_2 = GetCurrentResourceName
  L7_2 = L7_2()
  L8_2 = L98_1
  L9_2 = L2_2
  L8_2 = L8_2(L9_2)
  L9_2 = L5_2
  L10_2 = -1
  return L6_2(L7_2, L8_2, L9_2, L10_2)
end
function L103_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L94_1
  L3_2 = L94_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = {}
  end
  L2_2[A0_2] = L3_2
  L2_2 = L94_1
  L2_2 = L2_2[A0_2]
  L2_2[A1_2] = true
  L2_2 = L101_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = #L2_2
  L3_2 = L3_2 + 1
  L2_2[L3_2] = A1_2
  L3_2 = L102_1
  L4_2 = A0_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end
function L104_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tostring
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = ""
  end
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.gsub
  L3_2 = "([^%w])"
  L4_2 = "%%%1"
  return L1_2(L2_2, L3_2, L4_2)
end
function L105_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = L97_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = {}
    return L2_2
  end
  L2_2 = {}
  L3_2 = "^preset%-info/"
  L4_2 = L104_1
  L5_2 = L1_2.dir
  L4_2 = L4_2(L5_2)
  L5_2 = "/(.+)$"
  L3_2 = L3_2 .. L4_2 .. L5_2
  function L4_2(A0_3)
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
    L3_3 = L3_2
    L1_3 = L1_3(L2_3, L3_3)
    if not L1_3 then
      L2_3 = A0_3
      L1_3 = A0_3.gsub
      L3_3 = "\\"
      L4_3 = "/"
      L1_3 = L1_3(L2_3, L3_3, L4_3)
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
      if not L3_3 then
        L3_3 = L1_2.indexFile
        L4_3 = L3_3
        L3_3 = L3_3.lower
        L3_3 = L3_3(L4_3)
        if L2_3 ~= L3_3 then
          L3_3 = L2_2
          L3_3[L1_3] = true
        end
      end
    end
  end
  L5_2 = ipairs
  L6_2 = L101_1
  L7_2 = A0_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2)
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L99_1
    L12_2 = A0_2
    L13_2 = L10_2
    L11_2, L12_2 = L11_2(L12_2, L13_2)
    if L11_2 then
      L13_2 = LoadResourceFile
      L14_2 = GetCurrentResourceName
      L14_2 = L14_2()
      L15_2 = L11_2
      L13_2 = L13_2(L14_2, L15_2)
      if L13_2 then
        L13_2 = L4_2
        L14_2 = L12_2
        L13_2(L14_2)
      end
    end
  end
  L5_2 = pairs
  L6_2 = L94_1
  L6_2 = L6_2[A0_2]
  if not L6_2 then
    L6_2 = {}
  end
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2 in L5_2, L6_2, L7_2, L8_2 do
    L10_2 = L4_2
    L11_2 = L9_2
    L10_2(L11_2)
  end
  L5_2 = L100_1
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L6_2 = nil
    L7_2 = L76_1
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = "powershell -NoProfile -Command \"& { Get-ChildItem -LiteralPath %s -File | Select-Object -ExpandProperty Name }\""
      L8_2 = L7_2
      L7_2 = L7_2.format
      L9_2 = L78_1
      L10_2 = L5_2
      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2)
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      L6_2 = L7_2
    else
      L7_2 = "ls -1 %s"
      L8_2 = L7_2
      L7_2 = L7_2.format
      L9_2 = L77_1
      L10_2 = L5_2
      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L9_2(L10_2)
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      L6_2 = L7_2
    end
    L7_2 = io
    L7_2 = L7_2.popen
    if L7_2 then
      L7_2 = io
      L7_2 = L7_2.popen
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 then
        goto lbl_95
      end
    end
    L7_2 = nil
    ::lbl_95::
    if L7_2 then
      L9_2 = L7_2
      L8_2 = L7_2.lines
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      for L12_2 in L8_2, L9_2, L10_2, L11_2 do
        L13_2 = L4_2
        L14_2 = L12_2
        L13_2(L14_2)
      end
      L9_2 = L7_2
      L8_2 = L7_2.close
      L8_2(L9_2)
    end
  end
  L6_2 = {}
  L7_2 = pairs
  L8_2 = L2_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2 in L7_2, L8_2, L9_2, L10_2 do
    L12_2 = #L6_2
    L12_2 = L12_2 + 1
    L6_2[L12_2] = L11_2
  end
  L7_2 = table
  L7_2 = L7_2.sort
  L8_2 = L6_2
  function L9_2(A0_3, A1_3)
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
  L7_2(L8_2, L9_2)
  return L6_2
end
function L106_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
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
  L6_2 = " is not valid JSON preset data."
  L5_2 = L5_2 .. L6_2
  do return L4_2, L5_2 end
  ::lbl_28::
  L4_2 = type
  L5_2 = L3_2.settings
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = L3_2.settings
    if L4_2 then
      goto lbl_37
    end
  end
  L4_2 = L3_2
  ::lbl_37::
  L5_2 = type
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if "table" ~= L5_2 then
    L5_2 = nil
    L6_2 = A1_2
    L7_2 = " does not contain setup preset settings."
    L6_2 = L6_2 .. L7_2
    return L5_2, L6_2
  end
  return L4_2
end
function L107_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L97_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    return
  end
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.CreateCallback
  L4_2 = "Pug:server:Get"
  L5_2 = A1_2
  L6_2 = "PresetFiles"
  L4_2 = L4_2 .. L5_2 .. L6_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = A1_3
    L3_3 = {}
    L3_3.success = true
    L4_3 = L105_1
    L5_3 = A0_2
    L4_3 = L4_3(L5_3)
    L3_3.files = L4_3
    L2_3(L3_3)
  end
  L3_2(L4_2, L5_2)
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.CreateCallback
  L4_2 = "Pug:server:Save"
  L5_2 = A1_2
  L6_2 = "Preset"
  L4_2 = L4_2 .. L5_2 .. L6_2
  function L5_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3
    L4_3 = A0_3
    L5_3 = L99_1
    L6_3 = A0_2
    L7_3 = A2_3
    L5_3, L6_3 = L5_3(L6_3, L7_3)
    if L5_3 then
      L7_3 = type
      L8_3 = A3_3
      L7_3 = L7_3(L8_3)
      if "table" == L7_3 then
        goto lbl_24
      end
    end
    L7_3 = A1_3
    L8_3 = {}
    L8_3.success = false
    L9_3 = "Invalid "
    L10_3 = L2_2.label
    L11_3 = " preset data."
    L9_3 = L9_3 .. L10_3 .. L11_3
    L8_3.error = L9_3
    L7_3(L8_3)
    do return end
    ::lbl_24::
    L7_3 = {}
    L8_3 = L2_2.typeName
    L7_3.type = L8_3
    L7_3.version = 1
    L7_3.settings = A3_3
    L8_3 = json
    L8_3 = L8_3.encode
    L9_3 = L7_3
    L8_3 = L8_3(L9_3)
    if not L8_3 or "" == L8_3 then
      L9_3 = A1_3
      L10_3 = {}
      L10_3.success = false
      L11_3 = "Failed to encode "
      L12_3 = L2_2.label
      L13_3 = " preset data."
      L11_3 = L11_3 .. L12_3 .. L13_3
      L10_3.error = L11_3
      L9_3(L10_3)
      return
    end
    L9_3 = LoadResourceFile
    L10_3 = GetCurrentResourceName
    L10_3 = L10_3()
    L11_3 = L5_3
    L9_3 = L9_3(L10_3, L11_3)
    if L9_3 and "" ~= L9_3 then
      L10_3 = SaveResourceFile
      L11_3 = GetCurrentResourceName
      L11_3 = L11_3()
      L12_3 = L5_3
      L13_3 = ".bak"
      L12_3 = L12_3 .. L13_3
      L13_3 = L9_3
      L14_3 = -1
      L10_3(L11_3, L12_3, L13_3, L14_3)
    end
    L10_3 = SaveResourceFile
    L11_3 = GetCurrentResourceName
    L11_3 = L11_3()
    L12_3 = L5_3
    L13_3 = L8_3
    L14_3 = -1
    L10_3 = L10_3(L11_3, L12_3, L13_3, L14_3)
    if not L10_3 then
      L11_3 = A1_3
      L12_3 = {}
      L12_3.success = false
      L13_3 = "Failed to write "
      L14_3 = L5_3
      L15_3 = "."
      L13_3 = L13_3 .. L14_3 .. L15_3
      L12_3.error = L13_3
      L11_3(L12_3)
      L11_3 = TriggerClientEvent
      L12_3 = "Pug:client:ShowHeistNotify"
      L13_3 = L4_3
      L14_3 = Config
      L14_3 = L14_3.T
      L15_3 = "PresetSaveFailed"
      L16_3 = L2_2.label
      L14_3 = L14_3(L15_3, L16_3)
      L15_3 = "error"
      L11_3(L12_3, L13_3, L14_3, L15_3)
      return
    end
    L11_3 = L103_1
    L12_3 = A0_2
    L13_3 = L6_3
    L11_3(L12_3, L13_3)
    L11_3 = TriggerClientEvent
    L12_3 = "Pug:client:ShowHeistNotify"
    L13_3 = L4_3
    L14_3 = Config
    L14_3 = L14_3.T
    L15_3 = "PresetSavedTo"
    L16_3 = L2_2.label
    L17_3 = L5_3
    L14_3 = L14_3(L15_3, L16_3, L17_3)
    L15_3 = "success"
    L11_3(L12_3, L13_3, L14_3, L15_3)
    L11_3 = A1_3
    L12_3 = {}
    L12_3.success = true
    L12_3.fileName = L6_3
    L12_3.path = L5_3
    L11_3(L12_3)
  end
  L3_2(L4_2, L5_2)
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.CreateCallback
  L4_2 = "Pug:server:Load"
  L5_2 = A1_2
  L6_2 = "Preset"
  L4_2 = L4_2 .. L5_2 .. L6_2
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    L3_3 = A0_3
    L4_3 = L99_1
    L5_3 = A0_2
    L6_3 = A2_3
    L4_3, L5_3 = L4_3(L5_3, L6_3)
    if not L4_3 then
      L6_3 = A1_3
      L7_3 = {}
      L7_3.success = false
      L7_3.error = "Invalid preset type."
      L6_3(L7_3)
      return
    end
    L6_3 = LoadResourceFile
    L7_3 = GetCurrentResourceName
    L7_3 = L7_3()
    L8_3 = L4_3
    L6_3 = L6_3(L7_3, L8_3)
    L7_3 = L106_1
    L8_3 = L6_3
    L9_3 = L4_3
    L7_3, L8_3 = L7_3(L8_3, L9_3)
    if not L7_3 then
      L9_3 = A1_3
      L10_3 = {}
      L10_3.success = false
      L11_3 = L8_3 or L11_3
      if not L8_3 then
        L11_3 = "Failed to load "
        L12_3 = L2_2.label
        L13_3 = " preset."
        L11_3 = L11_3 .. L12_3 .. L13_3
      end
      L10_3.error = L11_3
      L9_3(L10_3)
      L9_3 = TriggerClientEvent
      L10_3 = "Pug:client:ShowHeistNotify"
      L11_3 = L3_3
      L12_3 = L8_3 or L12_3
      if not L8_3 then
        L12_3 = Config
        L12_3 = L12_3.T
        L13_3 = "PresetLoadFailed"
        L14_3 = L2_2.label
        L12_3 = L12_3(L13_3, L14_3)
      end
      L13_3 = "error"
      L9_3(L10_3, L11_3, L12_3, L13_3)
      return
    end
    L9_3 = L103_1
    L10_3 = A0_2
    L11_3 = L5_3
    L9_3(L10_3, L11_3)
    L9_3 = TriggerClientEvent
    L10_3 = "Pug:client:ShowHeistNotify"
    L11_3 = L3_3
    L12_3 = Config
    L12_3 = L12_3.T
    L13_3 = "PresetLoadedFrom"
    L14_3 = L2_2.label
    L15_3 = L4_3
    L12_3 = L12_3(L13_3, L14_3, L15_3)
    L13_3 = "success"
    L9_3(L10_3, L11_3, L12_3, L13_3)
    L9_3 = A1_3
    L10_3 = {}
    L10_3.success = true
    L10_3.fileName = L5_3
    L10_3.path = L4_3
    L10_3.data = L7_3
    L9_3(L10_3)
  end
  L3_2(L4_2, L5_2)
end
L108_1 = L107_1
L109_1 = "banktruck"
L110_1 = "BankTruck"
L108_1(L109_1, L110_1)
L108_1 = L107_1
L109_1 = "atm"
L110_1 = "Atm"
L108_1(L109_1, L110_1)
L108_1 = L107_1
L109_1 = "sellitem"
L110_1 = "SellLocation"
L108_1(L109_1, L110_1)
L108_1 = Config
L108_1 = L108_1.FrameworkFunctions
L108_1 = L108_1.CreateCallback
L109_1 = "Pug:server:GetPresetFiles"
function L110_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L4_2 = L80_1
  L4_2 = L4_2()
  L3_2.files = L4_2
  L2_2(L3_2)
end
L108_1(L109_1, L110_1)
function L108_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = getHeists
  L0_2 = L0_2()
  L1_2 = ipairs
  L2_2 = L0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = tostring
    L8_2 = L6_2.heist_name
    if not L8_2 then
      L8_2 = ""
    end
    L7_2 = L7_2(L8_2)
    if "" ~= L7_2 then
      L8_2 = TriggerClientEvent
      L9_2 = "Pug:client:RemoveAllHeistData"
      L10_2 = -1
      L11_2 = L7_2
      L8_2(L9_2, L10_2, L11_2)
      L8_2 = L89_1
      L9_2 = L7_2
      L8_2(L9_2)
    end
  end
  L1_2 = TriggerClientEvent
  L2_2 = "Pug:client:RemoveEveryRobberyData"
  L3_2 = -1
  L1_2(L2_2, L3_2)
  L1_2 = Wait
  L2_2 = 750
  L1_2(L2_2)
  L1_2 = L52_1
  L1_2()
  L1_2 = L88_1
  L1_2()
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "DELETE FROM pug_heist"
  L3_2 = {}
  L1_2(L2_2, L3_2)
  L1_2 = MySQL
  L1_2 = L1_2.query
  L1_2 = L1_2.await
  L2_2 = "DELETE FROM pug_heist_statistics"
  L3_2 = {}
  L1_2(L2_2, L3_2)
  L1_2 = TriggerClientEvent
  L2_2 = "Pug:client:SyncAllRobberyPasscodes"
  L3_2 = -1
  L4_2 = heistPasscodes
  L5_2 = heistPasscodesLocation
  L1_2(L2_2, L3_2, L4_2, L5_2)
  return L0_2
end
function L109_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L1_2 = 0
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2 or L4_2
  if not A0_2 then
    L4_2 = {}
  end
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = tostring
    L10_2 = L8_2.heist_name
    if not L10_2 then
      L10_2 = ""
    end
    L9_2 = L9_2(L10_2)
    if "" ~= L9_2 then
      L10_2 = L57_1
      L11_2 = L8_2.stages
      L12_2 = L9_2
      L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
      L1_2 = L1_2 + L11_2
      L13_2 = L58_1
      L14_2 = L2_2
      L15_2 = L12_2
      L13_2(L14_2, L15_2)
      L13_2 = MySQL
      L13_2 = L13_2.query
      L13_2 = L13_2.await
      L14_2 = [[
                INSERT INTO pug_heist (heist_name, stages, settings)
                VALUES (?, ?, ?)
                ON DUPLICATE KEY UPDATE
                    stages = VALUES(stages),
                    settings = VALUES(settings)
            ]]
      L15_2 = {}
      L16_2 = L9_2
      L17_2 = json
      L17_2 = L17_2.encode
      L18_2 = L10_2
      L17_2 = L17_2(L18_2)
      L18_2 = json
      L18_2 = L18_2.encode
      L19_2 = L54_1
      L20_2 = L8_2.settings
      L21_2 = {}
      L19_2, L20_2, L21_2 = L19_2(L20_2, L21_2)
      L18_2, L19_2, L20_2, L21_2 = L18_2(L19_2, L20_2, L21_2)
      L15_2[1] = L16_2
      L15_2[2] = L17_2
      L15_2[3] = L18_2
      L15_2[4] = L19_2
      L15_2[5] = L20_2
      L15_2[6] = L21_2
      L13_2(L14_2, L15_2)
    end
  end
  L3_2 = L1_2
  L4_2 = L2_2
  return L3_2, L4_2
end
L110_1 = RegisterNetEvent
L111_1 = "Pug:server:CheckCityWideBlackoutOnLoad"
function L112_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = source
  L1_2 = L8_1
  if L1_2 then
    L1_2 = GetResourceState
    L2_2 = "qb-weathersync"
    L1_2 = L1_2(L2_2)
    if "started" == L1_2 then
    else
      L1_2 = GetResourceState
      L2_2 = "Renewed-Weathersync"
      L1_2 = L1_2(L2_2)
      if "started" == L1_2 then
        L1_2 = TriggerClientEvent
        L2_2 = "Pug:client:SetAllPlayersBlackout"
        L3_2 = L0_2
        L4_2 = true
        L1_2(L2_2, L3_2, L4_2)
      else
        L1_2 = GetResourceState
        L2_2 = "cd_easytime"
        L1_2 = L1_2(L2_2)
        if "started" == L1_2 then
          L1_2 = TriggerClientEvent
          L2_2 = "cd_easytime:ForceUpdate"
          L3_2 = L0_2
          L4_2 = {}
          L4_2.blackout = true
          L1_2(L2_2, L3_2, L4_2)
        else
          L1_2 = TriggerClientEvent
          L2_2 = "Pug:client:SetAllPlayersBlackout"
          L3_2 = L0_2
          L4_2 = true
          L1_2(L2_2, L3_2, L4_2)
        end
      end
    end
  end
end
L110_1(L111_1, L112_1)
L110_1 = RegisterNetEvent
L111_1 = "Pug:server:GiveRewardForEndingHeist"
function L112_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  L4_2 = source
  L5_2 = nil
  L6_2 = tokens
  L6_2 = L6_2[L4_2]
  if L6_2 ~= A3_2 then
    L6_2 = L25_1
    L7_2 = L4_2
    L8_2 = "Pug:server:GiveRewardForEndingHeist"
    L6_2(L7_2, L8_2)
    return
  end
  L6_2 = Framework
  if "QBCore" == L6_2 then
    L6_2 = Config
    L6_2 = L6_2.FrameworkFunctions
    L6_2 = L6_2.GetPlayer
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    L5_2 = L6_2
  else
    L6_2 = FWork
    L6_2 = L6_2.GetPlayerFromId
    L7_2 = L4_2
    L6_2 = L6_2(L7_2)
    L5_2 = L6_2
  end
  L6_2 = L23_1
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  L7_2 = tokens
  L7_2[L4_2] = L6_2
  L7_2 = TriggerClientEvent
  L8_2 = "Pug:client:UpdateRobberyToken"
  L9_2 = L4_2
  L10_2 = L6_2
  L7_2(L8_2, L9_2, L10_2)
  if not L5_2 then
    L7_2 = PrintDebug
    L8_2 = "Invalid player."
    L7_2(L8_2)
    return
  end
  L7_2 = L29_1
  L8_2 = A0_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L8_2 = PrintDebug
    L9_2 = "Heist not found."
    L8_2(L9_2)
    return
  end
  L8_2 = 0
  L9_2 = {}
  L10_2 = json
  L10_2 = L10_2.decode
  L11_2 = L7_2.stages
  L10_2 = L10_2(L11_2)
  L11_2 = ipairs
  L12_2 = L10_2
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = L16_2.rewardItems
    if L17_2 then
      L17_2 = pairs
      L18_2 = L16_2.rewardItems
      L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2)
      for L21_2, L22_2 in L17_2, L18_2, L19_2, L20_2 do
        L23_2 = L22_2.itemName
        if not L23_2 then
          L23_2 = L22_2.name
        end
        L24_2 = 0
        L25_2 = Framework
        if "QBCore" == L25_2 then
          L25_2 = Config
          L25_2 = L25_2.InventoryType
          if "ox_inventory" == L25_2 then
            L25_2 = exports
            L25_2 = L25_2.ox_inventory
            L26_2 = L25_2
            L25_2 = L25_2.GetItem
            L27_2 = L4_2
            L28_2 = L23_2
            L29_2 = false
            L30_2 = true
            L25_2 = L25_2(L26_2, L27_2, L28_2, L29_2, L30_2)
            L24_2 = L25_2
          else
            L25_2 = Config
            L25_2 = L25_2.InventoryType
            if "codem-inventory" == L25_2 then
              L25_2 = exports
              L25_2 = L25_2["codem-inventory"]
              L26_2 = L25_2
              L25_2 = L25_2.GetItemsTotalAmount
              L27_2 = L4_2
              L28_2 = L23_2
              L25_2 = L25_2(L26_2, L27_2, L28_2)
              L24_2 = L25_2
            else
              L25_2 = Config
              L25_2 = L25_2.InventoryType
              if "qs-inventory" == L25_2 then
                L25_2 = exports
                L25_2 = L25_2["qs-inventory"]
                L26_2 = L25_2
                L25_2 = L25_2.GetItemTotalAmount
                L27_2 = L4_2
                L28_2 = L23_2
                L25_2 = L25_2(L26_2, L27_2, L28_2)
                L24_2 = L25_2
              else
                L25_2 = GetItemByName
                L26_2 = L4_2
                L27_2 = L23_2
                L25_2 = L25_2(L26_2, L27_2)
                if L25_2 then
                  L24_2 = L25_2.amount
                end
              end
            end
          end
        else
          L25_2 = Framework
          if "ESX" == L25_2 then
            L25_2 = L5_2.getInventoryItem
            L26_2 = L23_2
            L25_2 = L25_2(L26_2)
            if L25_2 then
              L26_2 = L25_2.count
              if nil ~= L26_2 then
                L26_2 = tonumber
                L27_2 = L25_2.count
                L26_2 = L26_2(L27_2)
                L24_2 = L26_2
              end
            end
          end
        end
        if L24_2 > 0 then
          L25_2 = math
          L25_2 = L25_2.random
          L26_2 = A1_2
          L27_2 = A2_2
          L25_2 = L25_2(L26_2, L27_2)
          L26_2 = L24_2 * L25_2
          L8_2 = L8_2 + L26_2
          L27_2 = #L9_2
          L27_2 = L27_2 + 1
          L28_2 = "%sx %s"
          L29_2 = L28_2
          L28_2 = L28_2.format
          L30_2 = L24_2
          L31_2 = L23_2
          L28_2 = L28_2(L29_2, L30_2, L31_2)
          L9_2[L27_2] = L28_2
          L27_2 = GetResourceState
          L28_2 = "tgiann-inventory"
          L27_2 = L27_2(L28_2)
          if "started" == L27_2 then
            L27_2 = exports
            L27_2 = L27_2["tgiann-inventory"]
            L28_2 = L27_2
            L27_2 = L27_2.RemoveItem
            L29_2 = L4_2
            L30_2 = item
            L31_2 = amount
            if not L31_2 then
              L31_2 = 1
            end
            L27_2(L28_2, L29_2, L30_2, L31_2)
          else
            L27_2 = Framework
            if "QBCore" == L27_2 then
              L27_2 = L5_2.RemoveItem
              L28_2 = L23_2
              L29_2 = L24_2
              L27_2(L28_2, L29_2)
            else
              L27_2 = Framework
              if "ESX" == L27_2 then
                L27_2 = L5_2.removeInventoryItem
                L28_2 = L23_2
                L29_2 = L24_2
                L27_2(L28_2, L29_2)
              end
            end
          end
        end
      end
    end
  end
  if L8_2 > 0 then
    L11_2 = Framework
    if "QBCore" == L11_2 then
      L11_2 = L5_2.AddMoney
      L12_2 = "cash"
      L13_2 = L8_2
      L11_2(L12_2, L13_2)
    else
      L11_2 = Framework
      if "ESX" == L11_2 then
        L11_2 = L5_2.addMoney
        L12_2 = L8_2
        L11_2(L12_2)
      end
    end
    L11_2 = L37_1
    L12_2 = A0_2
    L13_2 = L8_2
    L11_2(L12_2, L13_2)
    L11_2 = L42_1
    L12_2 = L4_2
    L13_2 = {}
    L13_2.robberyName = A0_2
    L13_2.action = "robbery_completed"
    L13_2.actionLabel = "Robbery Completed"
    L13_2.rewardAmount = L8_2
    L13_2.rewardType = "cash"
    L14_2 = "$%s cash from final robbery payout"
    L15_2 = L14_2
    L14_2 = L14_2.format
    L16_2 = L8_2
    L14_2 = L14_2(L15_2, L16_2)
    L13_2.rewardSummary = L14_2
    L14_2 = #L9_2
    if L14_2 > 0 then
      L14_2 = "Converted staged rewards into the final robbery payout: %s."
      L15_2 = L14_2
      L14_2 = L14_2.format
      L16_2 = table
      L16_2 = L16_2.concat
      L17_2 = L9_2
      L18_2 = ", "
      L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L16_2(L17_2, L18_2)
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
      if L14_2 then
        goto lbl_244
      end
    end
    L14_2 = "Converted staged rewards into the final robbery payout."
    ::lbl_244::
    L13_2.details = L14_2
    L11_2(L12_2, L13_2)
    L11_2 = TriggerClientEvent
    L12_2 = "Pug:client:ShowHeistNotify"
    L13_2 = L4_2
    L14_2 = Config
    L14_2 = L14_2.T
    L15_2 = "HeistRewardComplete"
    L16_2 = L8_2
    L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L14_2(L15_2, L16_2)
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
  else
    L11_2 = L42_1
    L12_2 = L4_2
    L13_2 = {}
    L13_2.robberyName = A0_2
    L13_2.action = "robbery_completed"
    L13_2.actionLabel = "Robbery Completed"
    L13_2.details = "Finished the robbery but had no staged items to convert into a final payout."
    L11_2(L12_2, L13_2)
    L11_2 = TriggerClientEvent
    L12_2 = "Pug:client:ShowHeistNotify"
    L13_2 = L4_2
    L14_2 = Config
    L14_2 = L14_2.LangT
    L14_2 = L14_2.NoItemsForRewards
    L11_2(L12_2, L13_2, L14_2)
  end
  L11_2 = L38_1
  L12_2 = L4_2
  L13_2 = A0_2
  L14_2 = L31_1
  L15_2 = L4_2
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L14_2(L15_2)
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
end
L110_1(L111_1, L112_1)
L110_1 = {}
function L111_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.type
    if "robabble_object" == L1_2 then
      L1_2 = A0_2.createExplosion
      if L1_2 then
        goto lbl_14
      end
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_14::
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
L112_1 = RegisterNetEvent
L113_1 = "Pug:server:CreateRewardTarget"
function L114_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = source
  L3_2 = A0_2.targetVector
  L4_2 = type
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if "string" == L4_2 then
    L5_2 = L3_2
    L4_2 = L3_2.match
    L6_2 = "([^,]+),([^,]+),([^,]+)"
    L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
    if L4_2 and L5_2 and L6_2 then
      L7_2 = vector3
      L8_2 = tonumber
      L9_2 = L4_2
      L8_2 = L8_2(L9_2)
      L9_2 = tonumber
      L10_2 = L5_2
      L9_2 = L9_2(L10_2)
      L10_2 = tonumber
      L11_2 = L6_2
      L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2)
      L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      L3_2 = L7_2
    else
      L7_2 = PrintDebug
      L8_2 = "Invalid delayed reward target coords: "
      L9_2 = tostring
      L10_2 = A0_2.targetVector
      L9_2 = L9_2(L10_2)
      L8_2 = L8_2 .. L9_2
      L7_2(L8_2)
      return
    end
  end
  L4_2 = math
  L4_2 = L4_2.ceil
  L5_2 = tonumber
  L6_2 = A0_2.rewardDelayTime
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L4_2 = L4_2(L5_2)
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = L4_2 / 60
  L5_2 = L5_2(L6_2)
  L6_2 = L4_2 % 60
  L7_2 = nil
  if L5_2 > 0 then
    L8_2 = Config
    L8_2 = L8_2.T
    L9_2 = "DelayedRewardMinutesSeconds"
    L10_2 = L5_2
    if L5_2 > 1 then
      L11_2 = "s"
      if L11_2 then
        goto lbl_67
      end
    end
    L11_2 = ""
    ::lbl_67::
    L12_2 = L6_2
    if L6_2 > 1 then
      L13_2 = "s"
      if L13_2 then
        goto lbl_74
      end
    end
    L13_2 = ""
    ::lbl_74::
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    L7_2 = L8_2
  else
    L8_2 = Config
    L8_2 = L8_2.T
    L9_2 = "DelayedRewardSeconds"
    L10_2 = L6_2
    if L6_2 > 1 then
      L11_2 = "s"
      if L11_2 then
        goto lbl_87
      end
    end
    L11_2 = ""
    ::lbl_87::
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2 = L8_2
  end
  L8_2 = TriggerClientEvent
  L9_2 = "Pug:client:ShowHeistNotify"
  L10_2 = L2_2
  L11_2 = L7_2
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = Wait
  L9_2 = L4_2 * 1000
  L8_2(L9_2)
  L8_2 = A1_2.heist_name
  L9_2 = L110_1
  L10_2 = L110_1
  L10_2 = L10_2[L8_2]
  if not L10_2 then
    L10_2 = {}
  end
  L9_2[L8_2] = L10_2
  L9_2 = L110_1
  L9_2 = L9_2[L8_2]
  L10_2 = tonumber
  L11_2 = A0_2.stepNumber
  L10_2 = L10_2(L11_2)
  L11_2 = {}
  L11_2.coords = L3_2
  L9_2[L10_2] = L11_2
  L9_2 = L111_1
  L10_2 = A0_2
  L9_2 = L9_2(L10_2)
  if L9_2 and L3_2 then
    L9_2 = TriggerClientEvent
    L10_2 = "Pug:client:createExplosion"
    L11_2 = -1
    L12_2 = {}
    L13_2 = L3_2.x
    L12_2.x = L13_2
    L13_2 = L3_2.y
    L12_2.y = L13_2
    L13_2 = L3_2.z
    L12_2.z = L13_2
    L13_2 = 0
    L14_2 = 1.0
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L9_2 = L42_1
  L10_2 = L2_2
  L11_2 = {}
  L11_2.robberyName = L8_2
  L11_2.action = "delayed_reward_ready"
  L11_2.actionLabel = "Delayed Reward Ready"
  L12_2 = A0_2.stepNumber
  L11_2.stepNumber = L12_2
  L11_2.details = "A delayed reward target became claimable for this robbery step."
  L9_2(L10_2, L11_2)
  L9_2 = TriggerClientEvent
  L10_2 = "Pug:client:CreateRewardTarget"
  L11_2 = -1
  L12_2 = A0_2
  L13_2 = A1_2
  L14_2 = L3_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = TriggerClientEvent
  L10_2 = "Pug:client:ShowHeistNotify"
  L11_2 = L2_2
  L12_2 = Config
  L12_2 = L12_2.LangT
  L12_2 = L12_2.ItemsReadyToGrab
  L9_2(L10_2, L11_2, L12_2)
end
L112_1(L113_1, L114_1)
function L112_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
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
          L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
          return L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
        end
      end
    end
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "string" == L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.match
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
  L1_2 = nil
  return L1_2
end
function L113_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = Config
  L4_2 = L4_2.FrameworkFunctions
  L4_2 = L4_2.GetPlayer
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = string
  L5_2 = L5_2.lower
  L6_2 = tostring
  L7_2 = A1_2 or L7_2
  if not A1_2 then
    L7_2 = ""
  end
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  A1_2 = L5_2
  L5_2 = math
  L5_2 = L5_2.floor
  L6_2 = tonumber
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 0
  end
  L5_2 = L5_2(L6_2)
  A2_2 = L5_2
  if "" == A1_2 or A2_2 <= 0 then
    L5_2 = false
    return L5_2
  end
  L5_2 = GetResourceState
  L6_2 = "tgiann-inventory"
  L5_2 = L5_2(L6_2)
  if "started" == L5_2 then
    L5_2 = exports
    L5_2 = L5_2["tgiann-inventory"]
    L6_2 = L5_2
    L5_2 = L5_2.AddItem
    L7_2 = A0_2
    L8_2 = A1_2
    L9_2 = A2_2
    L5_2(L6_2, L7_2, L8_2, L9_2)
  else
    L5_2 = GetResourceState
    L6_2 = "ox_inventory"
    L5_2 = L5_2(L6_2)
    if "started" == L5_2 then
      L5_2 = exports
      L5_2 = L5_2.ox_inventory
      L6_2 = L5_2
      L5_2 = L5_2.CanCarryItem
      L7_2 = A0_2
      L8_2 = A1_2
      L9_2 = A2_2
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
      if L5_2 then
        L5_2 = exports
        L5_2 = L5_2.ox_inventory
        L6_2 = L5_2
        L5_2 = L5_2.AddItem
        L7_2 = A0_2
        L8_2 = A1_2
        L9_2 = A2_2
        L10_2 = A3_2
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
      else
        L5_2 = exports
        L5_2 = L5_2.ox_inventory
        L6_2 = L5_2
        L5_2 = L5_2.CustomDrop
        L7_2 = "ItemDropOx"
        L8_2 = {}
        L9_2 = {}
        L10_2 = A1_2
        L11_2 = A2_2
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L8_2[1] = L9_2
        L9_2 = GetEntityCoords
        L10_2 = GetPlayerPed
        L11_2 = A0_2
        L10_2, L11_2 = L10_2(L11_2)
        L9_2 = L9_2(L10_2, L11_2)
        L10_2 = 20
        L11_2 = 1000000
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
        L5_2 = TriggerClientEvent
        L6_2 = "Pug:client:ShowHeistNotify"
        L7_2 = A0_2
        L8_2 = Config
        L8_2 = L8_2.LangT
        L8_2 = L8_2.ItemsFellOnGround
        L9_2 = "error"
        L5_2(L6_2, L7_2, L8_2, L9_2)
        L5_2 = false
        return L5_2
      end
    else
      L5_2 = L4_2.AddItem
      L6_2 = A1_2
      L7_2 = A2_2
      L8_2 = false
      L9_2 = A3_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
    end
  end
  L5_2 = Framework
  if "QBCore" == L5_2 then
    L5_2 = TriggerClientEvent
    L6_2 = "inventory:client:ItemBox"
    L7_2 = A0_2
    L8_2 = FWork
    L8_2 = L8_2.Shared
    L8_2 = L8_2.Items
    L8_2 = L8_2[A1_2]
    L9_2 = "add"
    L10_2 = A2_2
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  end
  L5_2 = true
  return L5_2
end
function L114_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.GetPlayer
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = false
    return L4_2
  end
  L4_2 = math
  L4_2 = L4_2.floor
  L5_2 = tonumber
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0
  end
  L4_2 = L4_2(L5_2)
  A2_2 = L4_2
  if A2_2 <= 0 then
    L4_2 = false
    return L4_2
  end
  L4_2 = tostring
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = "cash"
  end
  L4_2 = L4_2(L5_2)
  A1_2 = L4_2
  L4_2 = Framework
  if "ESX" == L4_2 and "cash" == A1_2 then
    A1_2 = "money"
  end
  L4_2 = L3_2.AddMoney
  L5_2 = A1_2
  L6_2 = A2_2
  L4_2(L5_2, L6_2)
  L4_2 = true
  return L4_2
end
L115_1 = RegisterNetEvent
L116_1 = "Pug:server:ClaimDelayedReward"
function L117_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  L3_2 = source
  L4_2 = tostring
  L5_2 = A0_2 or L5_2
  if not A0_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  A0_2 = L4_2
  L4_2 = tonumber
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  A1_2 = L4_2
  L4_2 = tostring
  L5_2 = A2_2 or L5_2
  if not A2_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  A2_2 = L4_2
  if not ("" ~= A0_2 and A1_2) or "" == A2_2 then
    return
  end
  L4_2 = L110_1
  L4_2 = L4_2[A0_2]
  if L4_2 then
    L4_2 = L110_1
    L4_2 = L4_2[A0_2]
    L4_2 = L4_2[A1_2]
    if L4_2 then
      goto lbl_35
    end
  end
  do return end
  ::lbl_35::
  L4_2 = L110_1
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2[A1_2]
  L5_2 = L112_1
  L6_2 = L4_2.coords
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L6_2 = GetPlayerPed
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  if not L6_2 or 0 == L6_2 then
    return
  end
  L7_2 = GetEntityCoords
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = vector3
  L9_2 = L7_2.x
  L10_2 = L7_2.y
  L11_2 = L7_2.z
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L8_2 = L8_2 - L5_2
  L8_2 = #L8_2
  if L8_2 > 3.0 then
    return
  end
  L8_2 = L29_1
  L9_2 = A0_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    return
  end
  L9_2 = json
  L9_2 = L9_2.decode
  L10_2 = L8_2.stages
  if not L10_2 then
    L10_2 = "[]"
  end
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = {}
  end
  L10_2 = nil
  L11_2 = ipairs
  L12_2 = L9_2
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = tonumber
    L18_2 = L16_2.stepNumber
    L17_2 = L17_2(L18_2)
    if L17_2 == A1_2 then
      L10_2 = L16_2
      break
    end
  end
  if not L10_2 then
    return
  end
  L11_2 = tonumber
  L12_2 = L10_2.rewardDelayTime
  L11_2 = L11_2(L12_2)
  if not L11_2 then
    L11_2 = 0
  end
  if L11_2 <= 0 then
    return
  end
  L12_2 = L110_1
  L12_2 = L12_2[A0_2]
  L12_2[A1_2] = nil
  L12_2 = next
  L13_2 = L110_1
  L13_2 = L13_2[A0_2]
  L12_2 = L12_2(L13_2)
  if nil == L12_2 then
    L12_2 = L110_1
    L12_2[A0_2] = nil
  end
  L12_2 = TriggerClientEvent
  L13_2 = "Pug:client:RobberyRemoveTargetForEveryone"
  L14_2 = -1
  L15_2 = A2_2
  L12_2(L13_2, L14_2, L15_2)
  L12_2 = tostring
  L13_2 = L10_2.propName
  if not L13_2 then
    L13_2 = ""
  end
  L12_2 = L12_2(L13_2)
  L13_2 = "ch_prop_gold_trolly_01a" == L12_2 or "ch_prop_cash_low_trolly_01a" == L12_2 or "ch_prop_diamond_trolly_01a" == L12_2 or "imp_prop_impexp_coke_trolly" == L12_2
  L14_2 = {}
  L15_2 = 0
  L16_2 = tostring
  L17_2 = L10_2.rewardMoneyType
  if not L17_2 then
    L17_2 = "cash"
  end
  L16_2 = L16_2(L17_2)
  if not L13_2 then
    L17_2 = type
    L18_2 = L10_2.rewardItems
    L17_2 = L17_2(L18_2)
    if "table" == L17_2 then
      L17_2 = pairs
      L18_2 = L10_2.rewardItems
      L17_2, L18_2, L19_2, L20_2 = L17_2(L18_2)
      for L21_2, L22_2 in L17_2, L18_2, L19_2, L20_2 do
        L23_2 = L22_2.itemName
        L24_2 = tonumber
        L25_2 = L22_2.minAmount
        L24_2 = L24_2(L25_2)
        L25_2 = tonumber
        L26_2 = L22_2.maxAmount
        L25_2 = L25_2(L26_2)
        L26_2 = tonumber
        L27_2 = L22_2.rewardChance
        L26_2 = L26_2(L27_2)
        if L23_2 and L24_2 and L25_2 and L26_2 and L24_2 <= L25_2 and L26_2 >= 0 and L26_2 <= 100 then
          L27_2 = math
          L27_2 = L27_2.random
          L28_2 = 1
          L29_2 = 100
          L27_2 = L27_2(L28_2, L29_2)
          if L26_2 >= L27_2 then
            L27_2 = math
            L27_2 = L27_2.random
            L28_2 = L24_2
            L29_2 = L25_2
            L27_2 = L27_2(L28_2, L29_2)
            L28_2 = L113_1
            L29_2 = L3_2
            L30_2 = L23_2
            L31_2 = L27_2
            L32_2 = nil
            L28_2 = L28_2(L29_2, L30_2, L31_2, L32_2)
            if L28_2 then
              L28_2 = #L14_2
              L28_2 = L28_2 + 1
              L29_2 = "%s x%s"
              L30_2 = L29_2
              L29_2 = L29_2.format
              L31_2 = L23_2
              L32_2 = L27_2
              L29_2 = L29_2(L30_2, L31_2, L32_2)
              L14_2[L28_2] = L29_2
            end
          end
        end
      end
    end
  end
  L17_2 = L10_2.rewardMoney
  if L17_2 then
    L17_2 = tonumber
    L18_2 = L10_2.rewardMoneyMin
    L17_2 = L17_2(L18_2)
    L18_2 = tonumber
    L19_2 = L10_2.rewardMoneyMax
    L18_2 = L18_2(L19_2)
    if L17_2 and L18_2 and L17_2 <= L18_2 then
      L19_2 = math
      L19_2 = L19_2.random
      L20_2 = L17_2
      L21_2 = L18_2
      L19_2 = L19_2(L20_2, L21_2)
      L20_2 = L114_1
      L21_2 = L3_2
      L22_2 = L10_2.rewardMoneyType
      L23_2 = L19_2
      L20_2(L21_2, L22_2, L23_2)
      L20_2 = L37_1
      L21_2 = A0_2
      L22_2 = L19_2
      L20_2(L21_2, L22_2)
      L15_2 = L19_2
    end
  end
  L17_2 = {}
  L18_2 = #L14_2
  if L18_2 > 0 then
    L18_2 = #L17_2
    L18_2 = L18_2 + 1
    L19_2 = "Items: "
    L20_2 = table
    L20_2 = L20_2.concat
    L21_2 = L14_2
    L22_2 = ", "
    L20_2 = L20_2(L21_2, L22_2)
    L19_2 = L19_2 .. L20_2
    L17_2[L18_2] = L19_2
  end
  if L15_2 > 0 then
    L18_2 = #L17_2
    L18_2 = L18_2 + 1
    L19_2 = "$%s %s"
    L20_2 = L19_2
    L19_2 = L19_2.format
    L21_2 = L15_2
    L22_2 = L16_2
    L19_2 = L19_2(L20_2, L21_2, L22_2)
    L17_2[L18_2] = L19_2
  end
  L18_2 = L42_1
  L19_2 = L3_2
  L20_2 = {}
  L20_2.robberyName = A0_2
  L20_2.action = "delayed_reward_claimed"
  L20_2.actionLabel = "Delayed Reward Claimed"
  L20_2.stepNumber = A1_2
  L20_2.rewardAmount = L15_2
  L20_2.rewardType = L16_2
  L21_2 = table
  L21_2 = L21_2.concat
  L22_2 = L17_2
  L23_2 = " | "
  L21_2 = L21_2(L22_2, L23_2)
  L20_2.rewardSummary = L21_2
  L21_2 = "Claimed delayed reward target \"%s\"."
  L22_2 = L21_2
  L21_2 = L21_2.format
  L23_2 = A2_2
  L21_2 = L21_2(L22_2, L23_2)
  L20_2.details = L21_2
  L18_2(L19_2, L20_2)
end
L115_1(L116_1, L117_1)
L115_1 = RegisterNetEvent
L116_1 = "Pug:server:RobberyRemoveTargetForEveryone"
function L117_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = TriggerClientEvent
  L2_2 = "Pug:client:RobberyRemoveTargetForEveryone"
  L3_2 = -1
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
end
L115_1(L116_1, L117_1)
function L115_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L2_2 = getHeists
  L2_2 = L2_2()
  L3_2 = nil
  L4_2 = math
  L4_2 = L4_2.huge
  L5_2 = ipairs
  L6_2 = L2_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = L10_2.heist_name
    L12_2 = json
    L12_2 = L12_2.decode
    L13_2 = L10_2.stages
    L12_2 = L12_2(L13_2)
    L13_2 = ipairs
    L14_2 = L12_2
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
    for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
      L19_2 = L18_2.passcodes
      if L19_2 then
        L19_2 = math
        L19_2 = L19_2.abs
        L20_2 = tonumber
        L21_2 = A1_2.stepNumber
        L20_2 = L20_2(L21_2)
        L21_2 = tonumber
        L22_2 = L18_2.stepNumber
        L21_2 = L21_2(L22_2)
        L20_2 = L20_2 - L21_2
        L19_2 = L19_2(L20_2)
        if L4_2 > L19_2 then
          L4_2 = L19_2
          L3_2 = L18_2.stepNumber
        end
      end
    end
    if L3_2 then
      L13_2 = L12_2[L3_2]
      if L13_2 then
        L14_2 = L13_2.passcodes
        if L14_2 then
          L14_2 = heistPasscodesLocation
          L15_2 = L11_2
          L16_2 = L3_2
          L15_2 = L15_2 .. L16_2
          L16_2 = math
          L16_2 = L16_2.random
          L17_2 = 1
          L18_2 = L13_2.passcodes
          L18_2 = #L18_2
          L16_2 = L16_2(L17_2, L18_2)
          L14_2[L15_2] = L16_2
          L14_2 = PrintDebug
          L15_2 = "New location chosen "
          L16_2 = heistPasscodesLocation
          L17_2 = L11_2
          L18_2 = L3_2
          L17_2 = L17_2 .. L18_2
          L16_2 = L16_2[L17_2]
          L17_2 = " for step "
          L18_2 = L13_2.stepNumber
          L14_2(L15_2, L16_2, L17_2, L18_2)
        end
      end
    end
  end
end
GenerateRobberyStickyNoteLocation = L115_1
L115_1 = AddEventHandler
L116_1 = "onResourceStop"
function L117_1(A0_2)
  local L1_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 == L1_2 then
    L1_2 = L52_1
    L1_2()
  end
end
L115_1(L116_1, L117_1)
L115_1 = RegisterNetEvent
L116_1 = "Pug:server:ChangeRobberyPasscode"
function L117_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = heistPasscodes
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = GenerateRobberyStickyNoteLocation
    L3_2 = A0_2
    L4_2 = A1_2
    L2_2(L3_2, L4_2)
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1000
    L4_2 = 9999
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = heistPasscodes
    L3_2[A0_2] = L2_2
    L3_2 = TriggerClientEvent
    L4_2 = "Pug:client:ChangeRobberyPasscode"
    L5_2 = -1
    L6_2 = A0_2
    L7_2 = L2_2
    L8_2 = heistPasscodesLocation
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  end
end
L115_1(L116_1, L117_1)
L115_1 = RegisterNetEvent
L116_1 = "Pug:Server:ToggleRobberyRep"
function L117_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = source
  L3_2 = nil
  L4_2 = Framework
  if "QBCore" == L4_2 then
    L4_2 = FWork
    L4_2 = L4_2.Functions
    L4_2 = L4_2.GetPlayer
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
  else
    L4_2 = Config
    L4_2 = L4_2.FrameworkFunctions
    L4_2 = L4_2.GetPlayer
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
  end
  L4_2 = "+"
  L5_2 = GetRobberyRep
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L5_2 = L5_2 + A0_2
  if A1_2 then
    L6_2 = GetRobberyRep
    L7_2 = L3_2
    L6_2 = L6_2(L7_2)
    L5_2 = L6_2 - A0_2
    L4_2 = "-"
  end
  L6_2 = SetNewRobberyRep
  L7_2 = L3_2
  L8_2 = L5_2
  L6_2(L7_2, L8_2)
  L6_2 = TriggerClientEvent
  L7_2 = "Pug:client:ShowHeistNotify"
  L8_2 = L2_2
  L9_2 = Config
  L9_2 = L9_2.T
  L10_2 = "RobberyRepChanged"
  L11_2 = L4_2
  L12_2 = A0_2
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = "success"
  L6_2(L7_2, L8_2, L9_2, L10_2)
end
L115_1(L116_1, L117_1)
function L115_1(A0_2)
  local L1_2, L2_2
  L1_2 = Framework
  if "QBCore" == L1_2 then
    L1_2 = FWork
    if L1_2 then
      L1_2 = FWork
      L1_2 = L1_2.Functions
      if L1_2 then
        L1_2 = FWork
        L1_2 = L1_2.Functions
        L1_2 = L1_2.GetPlayer
        if L1_2 then
          L1_2 = FWork
          L1_2 = L1_2.Functions
          L1_2 = L1_2.GetPlayer
          L2_2 = A0_2
          return L1_2(L2_2)
        end
      end
    end
    L1_2 = Config
    L1_2 = L1_2.FrameworkFunctions
    L1_2 = L1_2.GetPlayer
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  L1_2 = Config
  L1_2 = L1_2.FrameworkFunctions
  if L1_2 then
    L1_2 = Config
    L1_2 = L1_2.FrameworkFunctions
    L1_2 = L1_2.GetPlayer
    if L1_2 then
      L1_2 = Config
      L1_2 = L1_2.FrameworkFunctions
      L1_2 = L1_2.GetPlayer
      L2_2 = A0_2
      return L1_2(L2_2)
    end
  end
  L1_2 = FWork
  if L1_2 then
    L1_2 = FWork
    L1_2 = L1_2.GetPlayerFromId
    if L1_2 then
      L1_2 = FWork
      L1_2 = L1_2.GetPlayerFromId
      L2_2 = A0_2
      return L1_2(L2_2)
    end
  end
end
L116_1 = RegisterCommand
L117_1 = "houserep"
function L118_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = A0_2
  if 0 == L1_2 then
    L2_2 = print
    L3_2 = "The /houserep command can only be used in-game."
    L2_2(L3_2)
    return
  end
  L2_2 = L115_1
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = TriggerClientEvent
    L4_2 = "Pug:client:ShowHeistNotify"
    L5_2 = L1_2
    L6_2 = Config
    L6_2 = L6_2.T
    L7_2 = "HouseRepUnavailable"
    L6_2 = L6_2(L7_2)
    L7_2 = "error"
    L3_2(L4_2, L5_2, L6_2, L7_2)
    return
  end
  L3_2 = tonumber
  L4_2 = GetHouseRobberyRep
  L5_2 = L2_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  if not L3_2 then
    L3_2 = 0
  end
  L4_2 = TriggerClientEvent
  L5_2 = "Pug:client:ShowHeistNotify"
  L6_2 = L1_2
  L7_2 = Config
  L7_2 = L7_2.T
  L8_2 = "HouseRepCurrent"
  L9_2 = L3_2
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = "primary"
  L4_2(L5_2, L6_2, L7_2, L8_2)
end
L119_1 = false
L116_1(L117_1, L118_1, L119_1)
L116_1 = RegisterNetEvent
L117_1 = "Pug:Server:ToggleHouseRobberyRep"
function L118_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = source
  L3_2 = L115_1
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    return
  end
  L4_2 = tonumber
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  A0_2 = L4_2 or A0_2
  if not L4_2 then
    A0_2 = 0
  end
  L4_2 = "+"
  L5_2 = tonumber
  L6_2 = GetHouseRobberyRep
  L7_2 = L3_2
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L6_2(L7_2)
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  if not L5_2 then
    L5_2 = 0
  end
  L6_2 = L5_2 + A0_2
  if A1_2 then
    L6_2 = L5_2 - A0_2
    L4_2 = "-"
  end
  L7_2 = SetNewHouseRobberyRep
  L8_2 = L3_2
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = TriggerClientEvent
  L8_2 = "Pug:client:ShowHeistNotify"
  L9_2 = L2_2
  L10_2 = Config
  L10_2 = L10_2.T
  L11_2 = "HouseRepChanged"
  L12_2 = L4_2
  L13_2 = A0_2
  L14_2 = L6_2
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
  L11_2 = "success"
  L7_2(L8_2, L9_2, L10_2, L11_2)
end
L116_1(L117_1, L118_1)
L116_1 = AddEventHandler
L117_1 = "playerDropped"
function L118_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L1_2 = source
  L2_2 = pairs
  L3_2 = L2_1
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = pairs
    L9_2 = L7_2
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = L13_2[L1_2]
      if L14_2 then
        L13_2[L1_2] = nil
        L14_2 = true
        L15_2 = pairs
        L16_2 = L13_2
        L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)
        for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do
          L14_2 = false
          break
        end
        if L14_2 then
          L15_2 = L2_1
          L15_2 = L15_2[L6_2]
          L15_2[L12_2] = nil
        end
      end
    end
  end
end
L116_1(L117_1, L118_1)
L116_1 = RegisterNetEvent
L117_1 = "heist:server:startExecutingStep"
function L118_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = source
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  if not L3_2 then
    L3_2 = L2_1
    L4_2 = {}
    L3_2[A0_2] = L4_2
  end
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A1_2]
  if not L3_2 then
    L3_2 = L2_1
    L3_2 = L3_2[A0_2]
    L4_2 = {}
    L3_2[A1_2] = L4_2
  end
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  L3_2 = L3_2[A1_2]
  L3_2[L2_2] = true
  L3_2 = L42_1
  L4_2 = L2_2
  L5_2 = {}
  L5_2.robberyName = A0_2
  L5_2.action = "step_started"
  L5_2.actionLabel = "Step Started"
  L5_2.stepNumber = A1_2
  L5_2.details = "Began interacting with a robbery step."
  L3_2(L4_2, L5_2)
end
L116_1(L117_1, L118_1)
L116_1 = RegisterNetEvent
L117_1 = "heist:server:stopExecutingStep"
function L118_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = source
  L3_2 = Wait
  L4_2 = 4000
  L3_2(L4_2)
  L3_2 = L2_1
  L3_2 = L3_2[A0_2]
  if L3_2 then
    L3_2 = L2_1
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2[A1_2]
    if L3_2 then
      L3_2 = L2_1
      L3_2 = L3_2[A0_2]
      L3_2 = L3_2[A1_2]
      L3_2[L2_2] = nil
      L3_2 = true
      L4_2 = pairs
      L5_2 = L2_1
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2[A1_2]
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L3_2 = false
        break
      end
      if L3_2 then
        L4_2 = L2_1
        L4_2 = L4_2[A0_2]
        L4_2[A1_2] = nil
      end
    end
  end
end
L116_1(L117_1, L118_1)
L116_1 = RegisterNetEvent
L117_1 = "Pug:server:TrackHeistRunStarted"
function L118_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = source
  L2_2 = L33_1
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = L42_1
  L3_2 = L1_2
  L4_2 = {}
  L4_2.robberyName = A0_2
  L4_2.action = "robbery_started"
  L4_2.actionLabel = "Robbery Started"
  L4_2.details = "Started a main robbery run."
  L2_2(L3_2, L4_2)
end
L116_1(L117_1, L118_1)
L116_1 = RegisterNetEvent
L117_1 = "Pug:server:TrackHeistStepCompleted"
function L118_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = source
  L3_2 = L34_1
  L4_2 = L2_2
  L5_2 = A0_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = L33_1
    L4_2 = L2_2
    L5_2 = A0_2
    L3_2(L4_2, L5_2)
  end
  L3_2 = L46_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
  L3_2 = L35_1
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = L42_1
  L4_2 = L2_2
  L5_2 = {}
  L5_2.robberyName = A0_2
  L5_2.action = "step_completed"
  L5_2.actionLabel = "Step Completed"
  L5_2.stepNumber = A1_2
  L5_2.details = "Completed a robbery step."
  L3_2(L4_2, L5_2)
end
L116_1(L117_1, L118_1)
L116_1 = RegisterNetEvent
L117_1 = "Pug:server:TrackHeistStepBlocked"
function L118_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = source
  L5_2 = L39_1
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  A0_2 = L5_2
  if "" == A0_2 then
    return
  end
  L5_2 = L42_1
  L6_2 = L4_2
  L7_2 = {}
  L7_2.robberyName = A0_2
  L7_2.action = "step_blocked"
  L7_2.actionLabel = "Step Blocked"
  L8_2 = tonumber
  L9_2 = A1_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = 0
  end
  L7_2.stepNumber = L8_2
  L8_2 = L39_1
  L9_2 = A3_2
  L8_2 = L8_2(L9_2)
  if "" ~= L8_2 then
    L8_2 = L39_1
    L9_2 = A3_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      goto lbl_39
    end
  end
  L8_2 = "Step start was blocked: %s"
  L9_2 = L8_2
  L8_2 = L8_2.format
  L10_2 = L39_1
  L11_2 = A2_2
  L10_2, L11_2 = L10_2(L11_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  ::lbl_39::
  L7_2.details = L8_2
  L5_2(L6_2, L7_2)
end
L116_1(L117_1, L118_1)
L116_1 = RegisterNetEvent
L117_1 = "Pug:server:TrackHeistFailedHack"
function L118_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = source
  L2_2 = L34_1
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = L33_1
    L3_2 = L1_2
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
  end
  L2_2 = L36_1
  L3_2 = A0_2
  L4_2 = L31_1
  L5_2 = L1_2
  L4_2, L5_2 = L4_2(L5_2)
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L42_1
  L3_2 = L1_2
  L4_2 = {}
  L4_2.robberyName = A0_2
  L4_2.action = "hack_failed"
  L4_2.actionLabel = "Hack Failed"
  L4_2.details = "Failed a robbery hack or minigame check."
  L2_2(L3_2, L4_2)
end
L116_1(L117_1, L118_1)
L116_1 = RegisterNetEvent
L117_1 = "Pug:server:TrackHeistRunCompleted"
function L118_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = source
  L2_2 = L38_1
  L3_2 = L1_2
  L4_2 = A0_2
  L5_2 = L31_1
  L6_2 = L1_2
  L5_2, L6_2 = L5_2(L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L116_1(L117_1, L118_1)
L116_1 = "config/config-minigames.lua"
L117_1 = 10000
function L118_1()
  local L0_2, L1_2, L2_2
  L0_2 = LoadResourceFile
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  L2_2 = L116_1
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
L119_1 = Config
L119_1 = L119_1.FrameworkFunctions
L119_1 = L119_1.CreateCallback
L120_1 = "Pug:server:GetMiniGameConfig"
function L121_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L118_1
  L2_2 = L2_2()
  if not L2_2 or "" == L2_2 then
    L3_2 = A1_2
    L4_2 = false
    L5_2 = "Unable to load "
    L6_2 = L116_1
    L7_2 = "."
    L5_2 = L5_2 .. L6_2 .. L7_2
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = PrintDebug
  L4_2 = "Loaded mini game config for editor server callback. Bytes:"
  L5_2 = #L2_2
  L3_2(L4_2, L5_2)
  L3_2 = A1_2
  L4_2 = true
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end
L119_1(L120_1, L121_1)
L119_1 = Config
L119_1 = L119_1.FrameworkFunctions
L119_1 = L119_1.CreateCallback
L120_1 = "Pug:server:GetMiniGameConfigMeta"
function L121_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = L118_1
  L2_2 = L2_2()
  if not L2_2 then
    L3_2 = A1_2
    L4_2 = false
    L5_2 = "Unable to load "
    L6_2 = L116_1
    L7_2 = "."
    L5_2 = L5_2 .. L6_2 .. L7_2
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = A1_2
  L4_2 = true
  L5_2 = {}
  L6_2 = #L2_2
  L5_2.length = L6_2
  L6_2 = math
  L6_2 = L6_2.ceil
  L7_2 = #L2_2
  L8_2 = L117_1
  L7_2 = L7_2 / L8_2
  L6_2 = L6_2(L7_2)
  L5_2.chunks = L6_2
  L6_2 = L117_1
  L5_2.chunkSize = L6_2
  L3_2(L4_2, L5_2)
end
L119_1(L120_1, L121_1)
L119_1 = Config
L119_1 = L119_1.FrameworkFunctions
L119_1 = L119_1.CreateCallback
L120_1 = "Pug:server:GetMiniGameConfigChunk"
function L121_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = L118_1
  L3_2 = L3_2()
  if not L3_2 then
    L4_2 = A1_2
    L5_2 = false
    L6_2 = "Unable to load "
    L7_2 = L116_1
    L8_2 = "."
    L6_2 = L6_2 .. L7_2 .. L8_2
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = tonumber
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  A2_2 = L4_2 or A2_2
  if not L4_2 then
    A2_2 = 0
  end
  L4_2 = math
  L4_2 = L4_2.ceil
  L5_2 = #L3_2
  L6_2 = L117_1
  L5_2 = L5_2 / L6_2
  L4_2 = L4_2(L5_2)
  if A2_2 < 1 or A2_2 > L4_2 then
    L5_2 = A1_2
    L6_2 = false
    L7_2 = "Invalid mini game config chunk requested."
    L5_2(L6_2, L7_2)
    return
  end
  L5_2 = A2_2 - 1
  L6_2 = L117_1
  L5_2 = L5_2 * L6_2
  L5_2 = L5_2 + 1
  L6_2 = math
  L6_2 = L6_2.min
  L7_2 = L117_1
  L7_2 = L5_2 + L7_2
  L7_2 = L7_2 - 1
  L8_2 = #L3_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = A1_2
  L8_2 = true
  L9_2 = string
  L9_2 = L9_2.sub
  L10_2 = L3_2
  L11_2 = L5_2
  L12_2 = L6_2
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L10_2 = A2_2
  L7_2(L8_2, L9_2, L10_2)
end
L119_1(L120_1, L121_1)
L119_1 = Config
L119_1 = L119_1.FrameworkFunctions
L119_1 = L119_1.CreateCallback
L120_1 = "Pug:server:SaveMiniGameConfig"
function L121_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = tostring
  L4_2 = A2_2 or L4_2
  if not A2_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  A2_2 = L3_2
  if "" == A2_2 then
    L3_2 = A1_2
    L4_2 = false
    L5_2 = "Mini game config data was empty."
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = string
  L3_2 = L3_2.find
  L4_2 = A2_2
  L5_2 = "Config%.MiniGames%s*%[%s*[\"']"
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L3_2 = A1_2
    L4_2 = false
    L5_2 = "Mini game config data did not look valid."
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = GetCurrentResourceName
  L3_2 = L3_2()
  L4_2 = L116_1
  L5_2 = LoadResourceFile
  L6_2 = L3_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 or "" == L5_2 then
    L6_2 = A1_2
    L7_2 = false
    L8_2 = "Unable to load the current mini game config file."
    L6_2(L7_2, L8_2)
    return
  end
  L6_2 = SaveResourceFile
  L7_2 = L3_2
  L8_2 = L4_2
  L9_2 = ".bak"
  L8_2 = L8_2 .. L9_2
  L9_2 = L5_2
  L10_2 = -1
  L6_2(L7_2, L8_2, L9_2, L10_2)
  L6_2 = SaveResourceFile
  L7_2 = L3_2
  L8_2 = L4_2
  L9_2 = A2_2
  L10_2 = -1
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  if not L6_2 then
    L7_2 = A1_2
    L8_2 = false
    L9_2 = "Failed to write config/config-minigames.lua."
    L7_2(L8_2, L9_2)
    return
  end
  L7_2 = A1_2
  L8_2 = true
  L9_2 = "Mini game config saved. A backup was also written to config/config-minigames.lua.bak."
  L7_2(L8_2, L9_2)
end
L119_1(L120_1, L121_1)
L119_1 = Config
L119_1 = L119_1.FrameworkFunctions
L119_1 = L119_1.CreateCallback
L120_1 = "Pug:server:RetrieveTokenRobbery"
function L121_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = tokens
  L2_2 = L2_2[A0_2]
  if L2_2 then
    L2_2 = A1_2
    L3_2 = tokens
    L3_2 = L3_2[A0_2]
    L2_2(L3_2)
    return
  end
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = ""
    L1_3 = 1
    L2_3 = 32
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = math
      L5_3 = L5_3.random
      L6_3 = 1
      L7_3 = 36
      L5_3 = L5_3(L6_3, L7_3)
      if L5_3 <= 26 then
        L6_3 = L0_3
        L7_3 = string
        L7_3 = L7_3.char
        L8_3 = 64 + L5_3
        L7_3 = L7_3(L8_3)
        L6_3 = L6_3 .. L7_3
        L0_3 = L6_3
      else
        L6_3 = L0_3
        L7_3 = string
        L7_3 = L7_3.char
        L8_3 = L5_3 - 27
        L8_3 = 48 + L8_3
        L7_3 = L7_3(L8_3)
        L6_3 = L6_3 .. L7_3
        L0_3 = L6_3
      end
    end
    return L0_3
  end
  L3_2 = tokens
  L4_2 = L2_2
  L4_2 = L4_2()
  L3_2[A0_2] = L4_2
  L3_2 = A1_2
  L4_2 = tokens
  L4_2 = L4_2[A0_2]
  L3_2(L4_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "heist:server:giveRewardMoney"
function L121_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L6_2 = source
  L7_2 = Config
  L7_2 = L7_2.FrameworkFunctions
  L7_2 = L7_2.GetPlayer
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = tokens
  L8_2 = L8_2[L6_2]
  if L8_2 ~= A5_2 then
    L8_2 = L25_1
    L9_2 = L6_2
    L10_2 = "heist:server:giveRewardMoney"
    L8_2(L9_2, L10_2)
    return
  end
  L8_2 = Framework
  if "ESX" == L8_2 and "cash" == A0_2 then
    A0_2 = "money"
  end
  L8_2 = PrintDebug
  L9_2 = A0_2
  L10_2 = A1_2
  L11_2 = "MoneyType, RewardAmount"
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = L7_2.AddMoney
  L9_2 = A0_2
  L10_2 = A1_2
  L8_2(L9_2, L10_2)
  if A2_2 and "" ~= A2_2 and " " ~= A2_2 then
    L8_2 = L37_1
    L9_2 = A2_2
    L10_2 = A1_2
    L8_2(L9_2, L10_2)
    L8_2 = L42_1
    L9_2 = L6_2
    L10_2 = {}
    L10_2.robberyName = A2_2
    L10_2.action = "step_reward_paid"
    L10_2.actionLabel = "Step Reward Paid"
    L11_2 = tonumber
    L12_2 = A3_2
    L11_2 = L11_2(L12_2)
    if not L11_2 then
      L11_2 = 0
    end
    L10_2.stepNumber = L11_2
    L10_2.rewardAmount = A1_2
    L10_2.rewardType = A0_2
    L11_2 = "$%s %s"
    L12_2 = L11_2
    L11_2 = L11_2.format
    L13_2 = math
    L13_2 = L13_2.floor
    L14_2 = tonumber
    L15_2 = A1_2
    L14_2 = L14_2(L15_2)
    if not L14_2 then
      L14_2 = 0
    end
    L13_2 = L13_2(L14_2)
    L14_2 = tostring
    L15_2 = A0_2 or L15_2
    if not A0_2 then
      L15_2 = "cash"
    end
    L14_2, L15_2 = L14_2(L15_2)
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
    L10_2.rewardSummary = L11_2
    L11_2 = L43_1
    L12_2 = A4_2
    L13_2 = "Awarded direct robbery money for a completed step."
    L11_2 = L11_2(L12_2, L13_2)
    L10_2.details = L11_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = L23_1
  L9_2 = L6_2
  L8_2 = L8_2(L9_2)
  L9_2 = tokens
  L9_2[L6_2] = L8_2
  L9_2 = TriggerClientEvent
  L10_2 = "Pug:client:UpdateRobberyToken"
  L11_2 = L6_2
  L12_2 = L8_2
  L9_2(L10_2, L11_2, L12_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "heist:createNewHeist"
function L121_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = source
  L2_2 = MySQL
  L2_2 = L2_2.Async
  L2_2 = L2_2.execute
  L3_2 = "INSERT INTO pug_heist (heist_name) VALUES (@heist_name)"
  L4_2 = {}
  L4_2["@heist_name"] = A0_2
  function L5_2(A0_3)
    local L1_3, L2_3
    if A0_3 > 0 then
      L1_3 = L91_1
      L2_3 = L1_2
      L1_3(L2_3)
      L1_3 = generateUniquePasscode
      L2_3 = A0_2
      L1_3(L2_3)
    end
  end
  L2_2(L3_2, L4_2, L5_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "heist:deleteHeist"
function L121_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = source
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.GetPlayer
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = TriggerClientEvent
  L4_2 = "Pug:client:RemoveAllHeistData"
  L5_2 = -1
  L6_2 = A0_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = L89_1
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = L52_1
  L3_2()
  L3_2 = Wait
  L4_2 = 1000
  L3_2(L4_2)
  L3_2 = MySQL
  L3_2 = L3_2.Async
  L3_2 = L3_2.execute
  L4_2 = "DELETE FROM pug_heist WHERE heist_name = @heist_name"
  L5_2 = {}
  L5_2["@heist_name"] = A0_2
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    if A0_3 > 0 then
      L1_3 = MySQL
      L1_3 = L1_3.Async
      L1_3 = L1_3.execute
      L2_3 = "DELETE FROM pug_heist_statistics WHERE heist_name = @heist_name"
      L3_3 = {}
      L4_3 = A0_2
      L3_3["@heist_name"] = L4_3
      function L4_3()
        local L0_4, L1_4, L2_4
        L0_4 = L90_1
        L0_4 = L0_4()
        L1_4 = L92_1
        L2_4 = L0_4
        L1_4(L2_4)
        L1_4 = L91_1
        L2_4 = L1_2
        L1_4(L2_4)
      end
      L1_3(L2_3, L3_3, L4_3)
    end
  end
  L3_2(L4_2, L5_2, L6_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:DeleteAllHeists"
function L121_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = source
  L1_2 = getHeists
  L1_2 = L1_2()
  if L1_2 then
    L2_2 = #L1_2
    if 0 ~= L2_2 then
      goto lbl_22
    end
  end
  L2_2 = TriggerClientEvent
  L3_2 = "Pug:client:ShowHeistNotify"
  L4_2 = L0_2
  L5_2 = Config
  L5_2 = L5_2.T
  L6_2 = "NoMainRobberiesToDelete"
  L5_2 = L5_2(L6_2)
  L6_2 = "error"
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L91_1
  L3_2 = L0_2
  L2_2(L3_2)
  do return end
  ::lbl_22::
  L2_2 = L108_1
  L2_2()
  L2_2 = L91_1
  L3_2 = L0_2
  L2_2(L3_2)
  L2_2 = TriggerClientEvent
  L3_2 = "Pug:client:ShowHeistNotify"
  L4_2 = L0_2
  L5_2 = Config
  L5_2 = L5_2.T
  L6_2 = "DeletedMainRobberies"
  L7_2 = #L1_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = "success"
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:LoadPresetRobberies"
function L121_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L1_2 = source
  L2_2 = L67_1
  L3_2 = A0_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  L5_2 = L68_1
  L6_2 = A0_2
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L81_1
  L7_2 = L2_2
  L6_2, L7_2 = L6_2(L7_2)
  if not L6_2 then
    L8_2 = TriggerClientEvent
    L9_2 = "Pug:client:ShowHeistNotify"
    L10_2 = L1_2
    L11_2 = L7_2 or L11_2
    if not L7_2 then
      L11_2 = Config
      L11_2 = L11_2.T
      L12_2 = "FailedToLoadPresetRobberies"
      L11_2 = L11_2(L12_2)
    end
    L12_2 = "error"
    L8_2(L9_2, L10_2, L11_2, L12_2)
    return
  end
  L8_2 = L69_1
  L9_2 = "%s.json"
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = L3_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L9_2(L10_2, L11_2)
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L8_2 = L108_1
  L8_2()
  L8_2 = L109_1
  L9_2 = L6_2
  L8_2, L9_2 = L8_2(L9_2)
  L10_2 = nil
  L11_2 = "success"
  L12_2 = GetResourceState
  L13_2 = "ox_doorlock"
  L12_2 = L12_2(L13_2)
  if "started" == L12_2 then
    L12_2 = L5_2
    L13_2 = nil
    L14_2 = nil
    L15_2 = L83_1
    L16_2 = L5_2
    L15_2, L16_2 = L15_2(L16_2)
    L14_2 = L16_2
    L13_2 = L15_2
    if not L13_2 then
      L15_2 = L73_1
      L16_2 = A0_2
      L15_2 = L15_2(L16_2)
      if L15_2 and L15_2 ~= L5_2 then
        L16_2 = L83_1
        L17_2 = L15_2
        L16_2, L17_2 = L16_2(L17_2)
        L14_2 = L17_2
        L13_2 = L16_2
        if L13_2 then
          L12_2 = L15_2
        end
      end
    end
    if L13_2 then
      L15_2 = type
      L16_2 = _G
      L16_2 = L16_2.PugInsertDoorLockData
      L15_2 = L15_2(L16_2)
      if "function" == L15_2 then
        L15_2 = _G
        L15_2 = L15_2.PugInsertDoorLockData
        L16_2 = L13_2
        L15_2(L16_2)
        L15_2 = Config
        L15_2 = L15_2.T
        L16_2 = "LoadedPairedDoorlocks"
        L17_2 = #L13_2
        L18_2 = L12_2
        L15_2 = L15_2(L16_2, L17_2, L18_2)
        L10_2 = L15_2
      else
        L15_2 = Config
        L15_2 = L15_2.T
        L16_2 = "DoorlockImporterUnavailable"
        L15_2 = L15_2(L16_2)
        L10_2 = L15_2
        L11_2 = "error"
      end
    elseif L14_2 then
      L15_2 = Config
      L15_2 = L15_2.T
      L16_2 = "NoDoorlockPresetFile"
      L17_2 = L2_2
      L15_2 = L15_2(L16_2, L17_2)
      L10_2 = L15_2
      L11_2 = "error"
    end
  end
  L12_2 = L90_1
  L12_2 = L12_2()
  L13_2 = L92_1
  L14_2 = L12_2
  L13_2(L14_2)
  L13_2 = L91_1
  L14_2 = L1_2
  L13_2(L14_2)
  L13_2 = TriggerClientEvent
  L14_2 = "Pug:client:ShowHeistNotify"
  L15_2 = L1_2
  L16_2 = Config
  L16_2 = L16_2.T
  L17_2 = "LoadedPresetRobberies"
  L18_2 = #L12_2
  L19_2 = L2_2
  L16_2 = L16_2(L17_2, L18_2, L19_2)
  L17_2 = "success"
  L13_2(L14_2, L15_2, L16_2, L17_2)
  if L8_2 > 0 then
    L13_2 = TriggerClientEvent
    L14_2 = "Pug:client:ShowHeistNotify"
    L15_2 = L1_2
    L16_2 = L60_1
    L17_2 = Config
    L17_2 = L17_2.T
    L18_2 = "ClearedStaleHackableTargetsOnLoad"
    L17_2 = L17_2(L18_2)
    L18_2 = L8_2
    L19_2 = L9_2
    L20_2 = nil
    L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
    L17_2 = "error"
    L13_2(L14_2, L15_2, L16_2, L17_2)
  end
  if L10_2 then
    L13_2 = TriggerClientEvent
    L14_2 = "Pug:client:ShowHeistNotify"
    L15_2 = L1_2
    L16_2 = L10_2
    L17_2 = L11_2
    L13_2(L14_2, L15_2, L16_2, L17_2)
  end
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:SavePresetRobberies"
function L121_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L1_2 = source
  L2_2 = getHeists
  L2_2 = L2_2()
  L3_2 = L63_1
  L4_2 = A0_2
  L3_2, L4_2 = L3_2(L4_2)
  L5_2 = L65_1
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = L61_1
  L7_2 = L2_2
  L6_2, L7_2, L8_2 = L6_2(L7_2)
  L9_2 = L82_1
  L10_2 = L3_2
  L11_2 = L6_2
  L9_2, L10_2 = L9_2(L10_2, L11_2)
  if not L9_2 then
    L11_2 = TriggerClientEvent
    L12_2 = "Pug:client:ShowHeistNotify"
    L13_2 = L1_2
    L14_2 = L10_2 or L14_2
    if not L10_2 then
      L14_2 = Config
      L14_2 = L14_2.T
      L15_2 = "FailedToSavePresetRobberies"
      L14_2 = L14_2(L15_2)
    end
    L15_2 = "error"
    L11_2(L12_2, L13_2, L14_2, L15_2)
    return
  end
  L11_2 = L86_1
  L12_2 = L2_2
  L11_2 = L11_2(L12_2)
  L12_2 = L84_1
  L13_2 = L5_2
  L14_2 = L11_2
  L12_2, L13_2 = L12_2(L13_2, L14_2)
  if not L12_2 then
    L14_2 = TriggerClientEvent
    L15_2 = "Pug:client:ShowHeistNotify"
    L16_2 = L1_2
    L17_2 = L13_2 or L17_2
    if not L13_2 then
      L17_2 = Config
      L17_2 = L17_2.T
      L18_2 = "FailedToSaveDoorlockPreset"
      L17_2 = L17_2(L18_2)
    end
    L18_2 = "error"
    L14_2(L15_2, L16_2, L17_2, L18_2)
    return
  end
  L14_2 = L69_1
  L15_2 = A0_2
  L14_2(L15_2)
  L14_2 = L71_1
  L14_2 = L14_2()
  L15_2 = table
  L15_2 = L15_2.insert
  L16_2 = L14_2
  L17_2 = "%s.json"
  L18_2 = L17_2
  L17_2 = L17_2.format
  L19_2 = L4_2
  L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L17_2(L18_2, L19_2)
  L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  L15_2 = L72_1
  L16_2 = L14_2
  L15_2(L16_2)
  L15_2 = L91_1
  L16_2 = L1_2
  L15_2(L16_2)
  L15_2 = TriggerClientEvent
  L16_2 = "Pug:client:ShowHeistNotify"
  L17_2 = L1_2
  L18_2 = Config
  L18_2 = L18_2.T
  L19_2 = "SavedMainRobberies"
  L20_2 = #L2_2
  L21_2 = L3_2
  L22_2 = L5_2
  L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
  L19_2 = "success"
  L15_2(L16_2, L17_2, L18_2, L19_2)
  if L7_2 > 0 then
    L15_2 = TriggerClientEvent
    L16_2 = "Pug:client:ShowHeistNotify"
    L17_2 = L1_2
    L18_2 = L60_1
    L19_2 = Config
    L19_2 = L19_2.T
    L20_2 = "SkippedStaleHackableTargetsOnBuild"
    L19_2 = L19_2(L20_2)
    L20_2 = L7_2
    L21_2 = L8_2
    L22_2 = nil
    L18_2 = L18_2(L19_2, L20_2, L21_2, L22_2)
    L19_2 = "error"
    L15_2(L16_2, L17_2, L18_2, L19_2)
  end
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:SaveHeistData"
function L121_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = source
  L2_2 = A0_2.heist_name
  if L2_2 then
    L3_2 = L57_1
    L4_2 = A0_2.stages
    L5_2 = L2_2
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    A0_2.stages = L3_2
    L6_2 = json
    L6_2 = L6_2.encode
    L7_2 = A0_2.settings
    L6_2 = L6_2(L7_2)
    L7_2 = json
    L7_2 = L7_2.encode
    L8_2 = L3_2
    L7_2 = L7_2(L8_2)
    L8_2 = L45_1
    L9_2 = L2_2
    L8_2(L9_2)
    L8_2 = L52_1
    L8_2()
    L8_2 = L8_1
    if L8_2 == L2_2 then
      L8_2 = SetCityWideBlackOutOff
      L8_2()
    end
    L8_2 = Wait
    L9_2 = 100
    L8_2(L9_2)
    L8_2 = MySQL
    L8_2 = L8_2.Async
    L8_2 = L8_2.execute
    L9_2 = "INSERT INTO pug_heist (heist_name, settings, stages) VALUES (@heistName, @settings, @stages) ON DUPLICATE KEY UPDATE settings = @settings, stages = @stages"
    L10_2 = {}
    L10_2["@heistName"] = L2_2
    L10_2["@settings"] = L6_2
    L10_2["@stages"] = L7_2
    function L11_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3
      if A0_3 > 0 then
        L1_3 = A0_2.settings
        L1_3 = L1_3.minutesUntilRobbery
        if L1_3 then
          L1_3 = A0_2.settings
          L1_3 = L1_3.minutesUntilRobbery
          if "" ~= L1_3 then
            L1_3 = A0_2.settings
            L1_3 = L1_3.minutesUntilRobbery
            if " " ~= L1_3 then
              L1_3 = A0_2.settings
              if L1_3 then
                L1_3 = A0_2.settings
                L1_3 = L1_3.minutesUntilRobbery
                if L1_3 then
                  L1_3 = tonumber
                  L2_3 = A0_2.settings
                  L2_3 = L2_3.minutesUntilRobbery
                  L1_3 = L1_3(L2_3)
                  if L1_3 > 0 then
                    L1_3 = tonumber
                    L2_3 = A0_2.settings
                    L2_3 = L2_3.minutesUntilRobbery
                    L1_3 = L1_3(L2_3)
                    L2_3 = {}
                    L3_3 = L2_2
                    L2_3[1] = L3_3
                    L3_3 = TriggerEvent
                    L4_3 = "Pug:server:SetRobberiesOnCooldown"
                    L5_3 = L2_3
                    L6_3 = L1_3
                    L3_3(L4_3, L5_3, L6_3)
                  end
                end
              end
            end
          end
        end
      else
        L1_3 = TriggerClientEvent
        L2_3 = "Pug:client:ShowHeistNotify"
        L3_3 = L1_2
        L4_3 = Config
        L4_3 = L4_3.LangT
        L4_3 = L4_3.FailedToSaveHeistData
        L1_3(L2_3, L3_3, L4_3)
      end
    end
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = Wait
    L9_2 = 500
    L8_2(L9_2)
    L8_2 = getHeists
    L8_2 = L8_2()
    L9_2 = L44_1
    L10_2 = L8_2
    L9_2(L10_2)
    L9_2 = TriggerClientEvent
    L10_2 = "Pug:client:UpdateSingleRobberySave"
    L11_2 = -1
    L12_2 = L8_2
    L13_2 = L2_2
    L14_2 = heistPasscodesLocation
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L9_2 = TriggerClientEvent
    L10_2 = "Pug:client:ChangeRobberyPasscode"
    L11_2 = -1
    L12_2 = L2_2
    L13_2 = heistPasscodes
    L13_2 = L13_2[L2_2]
    L14_2 = heistPasscodesLocation
    L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
    L9_2 = Wait
    L10_2 = 400
    L9_2(L10_2)
    if L4_2 > 0 then
      L9_2 = TriggerClientEvent
      L10_2 = "Pug:client:ShowHeistNotify"
      L11_2 = L1_2
      L12_2 = L60_1
      L13_2 = Config
      L13_2 = L13_2.T
      L14_2 = "ResetStaleHackableTargets"
      L13_2 = L13_2(L14_2)
      L14_2 = L4_2
      L15_2 = L5_2
      L16_2 = Config
      L16_2 = L16_2.T
      L17_2 = "ReplaceKeypadTargets"
      L16_2, L17_2 = L16_2(L17_2)
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
      L13_2 = "error"
      L9_2(L10_2, L11_2, L12_2, L13_2)
    end
    L9_2 = TriggerClientEvent
    L10_2 = "Pug:client:ShowHeistNotify"
    L11_2 = L1_2
    L12_2 = Config
    L12_2 = L12_2.LangT
    L12_2 = L12_2.HeistDataSaved
    L9_2(L10_2, L11_2, L12_2)
  else
    L3_2 = PrintDebug
    L4_2 = "Error: heistName is nil"
    L3_2(L4_2)
    L3_2 = TriggerClientEvent
    L4_2 = "Pug:client:ShowHeistNotify"
    L5_2 = L1_2
    L6_2 = Config
    L6_2 = L6_2.LangT
    L6_2 = L6_2.FailedToSaveHeistData
    L3_2(L4_2, L5_2, L6_2)
  end
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:OpenBanDoorForEveryone"
function L121_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = A1_2.heist_name
  L4_2 = L6_1
  L4_2 = L4_2[L3_2]
  if not L4_2 then
    L4_2 = L6_1
    L5_2 = {}
    L4_2[L3_2] = L5_2
  end
  L4_2 = L6_1
  L4_2 = L4_2[L3_2]
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L4_2 = L6_1
    L4_2 = L4_2[L3_2]
    L5_2 = {}
    L4_2[A2_2] = L5_2
  end
  L4_2 = L6_1
  L4_2 = L4_2[L3_2]
  L4_2 = L4_2[A2_2]
  L4_2 = L4_2.BankDoor
  if not L4_2 then
    L4_2 = L6_1
    L4_2 = L4_2[L3_2]
    L4_2 = L4_2[A2_2]
    L4_2.BankDoor = A1_2
    L4_2 = L6_1
    L4_2 = L4_2[L3_2]
    L4_2 = L4_2[A2_2]
    L4_2.DoorCoords = A0_2
    L4_2 = TriggerClientEvent
    L5_2 = "Pug:client:OpenBanDoorForEveryone"
    L6_2 = -1
    L7_2 = A0_2
    L8_2 = A1_2
    L9_2 = A2_2
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  end
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:RefreshCoolDoownToStartNow"
function L121_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = source
  L5_2 = Wait
  L6_2 = 500
  L5_2(L6_2)
  L5_2 = tonumber
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  A2_2 = L5_2
  if not A2_2 or A2_2 < 1 then
    A2_2 = 1
  end
  L5_2 = A2_2 * 60
  L6_2 = os
  L6_2 = L6_2.time
  L6_2 = L6_2()
  L7_2 = L3_1
  L7_2 = L7_2[A0_2]
  L7_2 = L7_2[A1_2]
  if L7_2 then
    L7_2 = L3_1
    L7_2 = L7_2[A0_2]
    L7_2 = L7_2.OWNER
    if L7_2 then
      L7_2 = L3_1
      L7_2 = L7_2[A0_2]
      L7_2 = L7_2.OWNER
      L7_2 = L7_2[A1_2]
    end
    if L7_2 and L7_2 ~= L4_2 then
      L8_2 = PrintDebug
      L9_2 = "Ignored non-owner cooldown refresh for"
      L10_2 = A0_2
      L11_2 = A1_2
      L12_2 = "source"
      L13_2 = L4_2
      L14_2 = "owner"
      L15_2 = L7_2
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
      L8_2 = TriggerClientEvent
      L9_2 = "Pug:client:ShowHeistNotify"
      L10_2 = L4_2
      L11_2 = Config
      L11_2 = L11_2.LangT
      L11_2 = L11_2.StepOnCooldown
      L12_2 = "error"
      L8_2(L9_2, L10_2, L11_2, L12_2)
      return
    else
      L8_2 = PrintDebug
      L9_2 = "WAS THE CORRECT PLAYER"
      L8_2(L9_2)
    end
    L8_2 = L3_1
    L8_2 = L8_2[A0_2]
    L9_2 = L6_2 + L5_2
    L8_2[A1_2] = L9_2
  end
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:SetStepOnCoolDown"
function L121_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = source
  L5_2 = L3_1
  L5_2 = L5_2[A0_2]
  if not L5_2 then
    L5_2 = L3_1
    L6_2 = {}
    L5_2[A0_2] = L6_2
  end
  L5_2 = tonumber
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  A2_2 = L5_2
  if not A2_2 or A2_2 < 1 then
    A2_2 = 1
  end
  L5_2 = PrintDebug
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L10_2 = "heistName, stepNumber, cooldownTime, remove"
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = PrintDebug
  L6_2 = A2_2
  L7_2 = "cooldownTime"
  L5_2(L6_2, L7_2)
  if A3_2 then
    L5_2 = L3_1
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2[A1_2]
    if L5_2 and "police" == A3_2 then
      L5_2 = TriggerClientEvent
      L6_2 = "Pug:client:ResetRobberyProp"
      L7_2 = -1
      L8_2 = A0_2
      L9_2 = A1_2
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = L29_1
      L6_2 = A0_2
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L6_2 = json
        L6_2 = L6_2.decode
        L7_2 = L5_2.stages
        L6_2 = L6_2(L7_2)
        L7_2 = ipairs
        L8_2 = L6_2
        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
        for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
          L13_2 = tonumber
          L14_2 = L12_2.stepNumber
          L13_2 = L13_2(L14_2)
          L14_2 = tonumber
          L15_2 = A1_2
          L14_2 = L14_2(L15_2)
          if L13_2 == L14_2 then
            L13_2 = L12_2.doorId
            if L13_2 then
              L13_2 = SetDoorLockStatus
              L14_2 = tonumber
              L15_2 = L12_2.doorId
              L14_2 = L14_2(L15_2)
              L15_2 = true
              L13_2(L14_2, L15_2)
            end
          end
        end
      end
      L6_2 = TriggerClientEvent
      L7_2 = "Pug:client:ShowHeistNotify"
      L8_2 = L4_2
      L9_2 = Config
      L9_2 = L9_2.T
      L10_2 = "StepHasBeenReset"
      L9_2 = L9_2(L10_2)
      L10_2 = "success"
      L6_2(L7_2, L8_2, L9_2, L10_2)
    end
    L5_2 = L48_1
    L6_2 = A0_2
    L7_2 = A1_2
    L5_2(L6_2, L7_2)
    L5_2 = L49_1
    L6_2 = A0_2
    L7_2 = A1_2
    L5_2(L6_2, L7_2)
    L5_2 = L3_1
    L5_2 = L5_2[A0_2]
    L5_2[A1_2] = nil
    L5_2 = L3_1
    L5_2 = L5_2[A0_2]
    L5_2 = L5_2.OWNER
    if L5_2 then
      L5_2 = L3_1
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2.OWNER
      L5_2 = L5_2[A1_2]
      if L5_2 then
        L5_2 = L3_1
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2.OWNER
        L5_2[A1_2] = nil
      end
    end
    L5_2 = L6_1
    L5_2 = L5_2[A0_2]
    if L5_2 then
      L5_2 = L6_1
      L5_2 = L5_2[A0_2]
      L5_2 = L5_2[A1_2]
      if L5_2 then
        L5_2 = L6_1
        L5_2 = L5_2[A0_2]
        L5_2 = L5_2[A1_2]
        L5_2 = L5_2.BankDoor
        if L5_2 then
          L5_2 = L6_1
          L5_2 = L5_2[A0_2]
          L5_2 = L5_2[A1_2]
          L5_2.BankDoor = false
          L5_2 = TriggerClientEvent
          L6_2 = "Pug:client:RemoveBankDoorState"
          L7_2 = -1
          L8_2 = A0_2
          L9_2 = A1_2
          L5_2(L6_2, L7_2, L8_2, L9_2)
          L5_2 = L6_1
          L5_2 = L5_2[A0_2]
          L5_2 = L5_2[A1_2]
          L5_2.DoorCoords = nil
        end
      end
    end
    return
  end
  L5_2 = L3_1
  L5_2 = L5_2[A0_2]
  L5_2 = L5_2[A1_2]
  if L5_2 then
    L6_2 = os
    L6_2 = L6_2.time
    L6_2 = L6_2()
    if L5_2 > L6_2 then
      L6_2 = L3_1
      L6_2 = L6_2[A0_2]
      L6_2 = L6_2.OWNER
      if L6_2 then
        L6_2 = L3_1
        L6_2 = L6_2[A0_2]
        L6_2 = L6_2.OWNER
        L6_2 = L6_2[A1_2]
      end
      if L6_2 and L6_2 ~= L4_2 then
        L7_2 = PrintDebug
        L8_2 = "Ignored duplicate step cooldown reservation for"
        L9_2 = A0_2
        L10_2 = A1_2
        L11_2 = "source"
        L12_2 = L4_2
        L13_2 = "owner"
        L14_2 = L6_2
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
        L7_2 = TriggerClientEvent
        L8_2 = "Pug:client:ShowHeistNotify"
        L9_2 = L4_2
        L10_2 = Config
        L10_2 = L10_2.LangT
        L10_2 = L10_2.StepOnCooldown
        L11_2 = "error"
        L7_2(L8_2, L9_2, L10_2, L11_2)
        return
      end
    end
  end
  L6_2 = A2_2 * 60
  L7_2 = os
  L7_2 = L7_2.time
  L7_2 = L7_2()
  L8_2 = L3_1
  L8_2 = L8_2[A0_2]
  L9_2 = L7_2 + L6_2
  L8_2[A1_2] = L9_2
  L8_2 = L3_1
  L8_2 = L8_2[A0_2]
  L8_2 = L8_2.OWNER
  if not L8_2 then
    L8_2 = L3_1
    L8_2 = L8_2[A0_2]
    L9_2 = {}
    L8_2.OWNER = L9_2
  end
  L8_2 = L3_1
  L8_2 = L8_2[A0_2]
  L8_2 = L8_2.OWNER
  L8_2[A1_2] = L4_2
  L8_2 = 0
  L9_2 = CreateThread
  function L10_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    while true do
      L0_3 = L8_2
      L0_3 = L0_3 + 1
      L8_2 = L0_3
      L1_3 = A0_2
      L0_3 = L3_1
      L0_3 = L0_3[L1_3]
      if L0_3 then
        L1_3 = A0_2
        L0_3 = L3_1
        L0_3 = L0_3[L1_3]
        L1_3 = A1_2
        L0_3 = L0_3[L1_3]
        if L0_3 then
          L0_3 = os
          L0_3 = L0_3.time
          L0_3 = L0_3()
          L2_3 = A0_2
          L1_3 = L3_1
          L1_3 = L1_3[L2_3]
          L2_3 = A1_2
          L1_3 = L1_3[L2_3]
          if L0_3 >= L1_3 then
            L0_3 = PrintDebug
            L2_3 = A0_2
            L1_3 = L3_1
            L1_3 = L1_3[L2_3]
            L2_3 = A1_2
            L1_3 = L1_3[L2_3]
            L2_3 = "stepCooldowns[heistName][stepNumber]2"
            L0_3(L1_3, L2_3)
            L0_3 = TriggerClientEvent
            L1_3 = "Pug:client:ResetRobberyProp"
            L2_3 = -1
            L3_3 = A0_2
            L4_3 = A1_2
            L0_3(L1_3, L2_3, L3_3, L4_3)
            L0_3 = L29_1
            L1_3 = A0_2
            L0_3 = L0_3(L1_3)
            if L0_3 then
              L1_3 = json
              L1_3 = L1_3.decode
              L2_3 = L0_3.stages
              L1_3 = L1_3(L2_3)
              L2_3 = ipairs
              L3_3 = L1_3
              L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
              for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
                L8_3 = tonumber
                L9_3 = L7_3.stepNumber
                L8_3 = L8_3(L9_3)
                L9_3 = tonumber
                L10_3 = A1_2
                L9_3 = L9_3(L10_3)
                if L8_3 == L9_3 then
                  L8_3 = L7_3.doorId
                  if L8_3 then
                    L8_3 = SetDoorLockStatus
                    L9_3 = tonumber
                    L10_3 = L7_3.doorId
                    L9_3 = L9_3(L10_3)
                    L10_3 = true
                    L8_3(L9_3, L10_3)
                  end
                end
              end
            end
            L1_3 = L48_1
            L2_3 = A0_2
            L3_3 = A1_2
            L1_3(L2_3, L3_3)
            L1_3 = L49_1
            L2_3 = A0_2
            L3_3 = A1_2
            L1_3(L2_3, L3_3)
            L2_3 = A0_2
            L1_3 = L3_1
            L1_3 = L1_3[L2_3]
            L2_3 = A1_2
            L1_3[L2_3] = nil
            L2_3 = A0_2
            L1_3 = L3_1
            L1_3 = L1_3[L2_3]
            L1_3 = L1_3.OWNER
            if L1_3 then
              L2_3 = A0_2
              L1_3 = L3_1
              L1_3 = L1_3[L2_3]
              L1_3 = L1_3.OWNER
              L2_3 = A1_2
              L1_3 = L1_3[L2_3]
              if L1_3 then
                L2_3 = A0_2
                L1_3 = L3_1
                L1_3 = L1_3[L2_3]
                L1_3 = L1_3.OWNER
                L2_3 = A1_2
                L1_3[L2_3] = nil
              end
            end
            L2_3 = A0_2
            L1_3 = L6_1
            L1_3 = L1_3[L2_3]
            if L1_3 then
              L2_3 = A0_2
              L1_3 = L6_1
              L1_3 = L1_3[L2_3]
              L2_3 = A1_2
              L1_3 = L1_3[L2_3]
              if L1_3 then
                L2_3 = A0_2
                L1_3 = L6_1
                L1_3 = L1_3[L2_3]
                L2_3 = A1_2
                L1_3 = L1_3[L2_3]
                L1_3 = L1_3.BankDoor
                if L1_3 then
                  L2_3 = A0_2
                  L1_3 = L6_1
                  L1_3 = L1_3[L2_3]
                  L2_3 = A1_2
                  L1_3 = L1_3[L2_3]
                  L1_3.BankDoor = false
                  L1_3 = TriggerClientEvent
                  L2_3 = "Pug:client:RemoveBankDoorState"
                  L3_3 = -1
                  L4_3 = A0_2
                  L5_3 = A1_2
                  L1_3(L2_3, L3_3, L4_3, L5_3)
                  L2_3 = A0_2
                  L1_3 = L6_1
                  L1_3 = L1_3[L2_3]
                  L2_3 = A1_2
                  L1_3 = L1_3[L2_3]
                  L1_3.DoorCoords = nil
                end
              end
            end
            break
          end
        end
      end
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
    end
  end
  L9_2(L10_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:SetLasersOffForEveryone"
function L121_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = L1_1
  L4_2 = L1_1
  L4_2 = L4_2[A0_2]
  if not L4_2 then
    L4_2 = {}
  end
  L3_2[A0_2] = L4_2
  L3_2 = L1_1
  L3_2 = L3_2[A0_2]
  L4_2 = {}
  L4_2.on = false
  L3_2[A1_2] = L4_2
  L3_2 = TriggerClientEvent
  L4_2 = "Pug:client:RemoveLasersForEveryone"
  L5_2 = -1
  L6_2 = A0_2
  L7_2 = A1_2
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = A2_2 * 60
  L4_2 = os
  L4_2 = L4_2.time
  L4_2 = L4_2()
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    while true do
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
      L0_3 = os
      L0_3 = L0_3.time
      L0_3 = L0_3()
      L1_3 = L4_2
      L1_3 = L0_3 - L1_3
      L2_3 = L3_2
      if L1_3 >= L2_3 then
        L3_3 = A0_2
        L2_3 = L1_1
        L2_3 = L2_3[L3_3]
        if L2_3 then
          L3_3 = A0_2
          L2_3 = L1_1
          L2_3 = L2_3[L3_3]
          L3_3 = A1_2
          L2_3 = L2_3[L3_3]
          if L2_3 then
            L3_3 = A0_2
            L2_3 = L1_1
            L2_3 = L2_3[L3_3]
            L3_3 = A1_2
            L4_3 = {}
            L4_3.on = true
            L2_3[L3_3] = L4_3
            L2_3 = TriggerClientEvent
            L3_3 = "Pug:client:AddLasersForEveryone"
            L4_3 = -1
            L5_3 = A0_2
            L6_3 = A1_2
            L2_3(L3_3, L4_3, L5_3, L6_3)
            break
          end
        end
        L2_3 = PrintDebug
        L3_3 = "Laser state for heist "
        L4_3 = A0_2
        L5_3 = " and step "
        L6_3 = A1_2
        L7_3 = " no longer exists. Cooldown ignored."
        L3_3 = L3_3 .. L4_3 .. L5_3 .. L6_3 .. L7_3
        L2_3(L3_3)
        break
      end
      L3_3 = A0_2
      L2_3 = L1_1
      L2_3 = L2_3[L3_3]
      if L2_3 then
        L3_3 = A0_2
        L2_3 = L1_1
        L2_3 = L2_3[L3_3]
        L3_3 = A1_2
        L2_3 = L2_3[L3_3]
        if L2_3 then
          goto lbl_70
        end
      end
      L2_3 = PrintDebug
      L3_3 = "Laser state for heist "
      L4_3 = A0_2
      L5_3 = " and step "
      L6_3 = A1_2
      L7_3 = " was removed during the cooldown. Exiting loop."
      L3_3 = L3_3 .. L4_3 .. L5_3 .. L6_3 .. L7_3
      L2_3(L3_3)
      do break end
      ::lbl_70::
    end
  end
  L5_2(L6_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:RequestLaserStates"
function L121_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = source
  L1_2 = pairs
  L2_2 = L1_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = pairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L12_2.on
      if not L13_2 then
        L13_2 = TriggerClientEvent
        L14_2 = "Pug:client:RemoveLasersForEveryone"
        L15_2 = L0_2
        L16_2 = L5_2
        L17_2 = L11_2
        L13_2(L14_2, L15_2, L16_2, L17_2)
      end
    end
  end
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:RequestBankDoorStates"
function L121_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L0_2 = source
  L1_2 = pairs
  L2_2 = L6_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = pairs
    L8_2 = L6_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
      L13_2 = L12_2.BankDoor
      if L13_2 then
        L13_2 = TriggerClientEvent
        L14_2 = "Pug:client:OpenBanDoorForEveryone"
        L15_2 = L0_2
        L16_2 = L12_2.DoorCoords
        L17_2 = L12_2.BankDoor
        L18_2 = L11_2
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2)
      end
    end
  end
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:triggerExplosion"
function L121_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L3_2 = A0_2.x
    if L3_2 then
      L3_2 = A0_2.y
      if L3_2 then
        L3_2 = A0_2.z
        if L3_2 then
          L3_2 = TriggerClientEvent
          L4_2 = "Pug:client:createExplosion"
          L5_2 = -1
          L6_2 = A0_2
          L7_2 = A1_2 or L7_2
          if not A1_2 then
            L7_2 = 0
          end
          L8_2 = A2_2 or L8_2
          if not A2_2 then
            L8_2 = 1.0
          end
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
      end
    end
  end
  else
    L3_2 = PrintDebug
    L4_2 = "Invalid coordinates for explosion."
    L3_2(L4_2)
  end
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:RobberyGiveItem"
function L121_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)
  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L8_2 = source
  L9_2 = Config
  L9_2 = L9_2.FrameworkFunctions
  L9_2 = L9_2.GetPlayer
  L10_2 = L8_2
  L9_2 = L9_2(L10_2)
  L10_2 = tokens
  L10_2 = L10_2[L8_2]
  if L10_2 ~= A7_2 then
    L10_2 = L25_1
    L11_2 = L8_2
    L12_2 = "Pug:server:RobberyGiveItem"
    L10_2(L11_2, L12_2)
    return
  end
  if A0_2 then
    L10_2 = GetResourceState
    L11_2 = "tgiann-inventory"
    L10_2 = L10_2(L11_2)
    if "started" == L10_2 then
      L10_2 = exports
      L10_2 = L10_2["tgiann-inventory"]
      L11_2 = L10_2
      L10_2 = L10_2.AddItem
      L12_2 = L8_2
      L13_2 = A1_2
      L14_2 = A2_2
      L10_2(L11_2, L12_2, L13_2, L14_2)
    else
      L10_2 = GetResourceState
      L11_2 = "ox_inventory"
      L10_2 = L10_2(L11_2)
      if "started" == L10_2 then
        L10_2 = exports
        L10_2 = L10_2.ox_inventory
        L11_2 = L10_2
        L10_2 = L10_2.CanCarryItem
        L12_2 = L8_2
        L13_2 = A1_2
        L14_2 = A2_2 or L14_2
        if not A2_2 then
          L14_2 = 1
        end
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
        if L10_2 then
          L10_2 = exports
          L10_2 = L10_2.ox_inventory
          L11_2 = L10_2
          L10_2 = L10_2.AddItem
          L12_2 = L8_2
          L13_2 = A1_2
          L14_2 = A2_2 or L14_2
          if not A2_2 then
            L14_2 = 1
          end
          L15_2 = A3_2
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
        else
          L10_2 = exports
          L10_2 = L10_2.ox_inventory
          L11_2 = L10_2
          L10_2 = L10_2.CustomDrop
          L12_2 = "ItemDropOx"
          L13_2 = {}
          L14_2 = {}
          L15_2 = A1_2
          L16_2 = A2_2
          L14_2[1] = L15_2
          L14_2[2] = L16_2
          L13_2[1] = L14_2
          L14_2 = GetEntityCoords
          L15_2 = GetPlayerPed
          L16_2 = L8_2
          L15_2, L16_2, L17_2 = L15_2(L16_2)
          L14_2 = L14_2(L15_2, L16_2, L17_2)
          L15_2 = 20
          L16_2 = 1000000
          L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          L10_2 = TriggerClientEvent
          L11_2 = "Pug:client:ShowHeistNotify"
          L12_2 = L8_2
          L13_2 = Config
          L13_2 = L13_2.LangT
          L13_2 = L13_2.ItemsFellOnGround
          L14_2 = "error"
          L10_2(L11_2, L12_2, L13_2, L14_2)
        end
      else
        L10_2 = L9_2.AddItem
        L11_2 = A1_2
        L12_2 = A2_2 or L12_2
        if not A2_2 then
          L12_2 = 1
        end
        L13_2 = false
        L14_2 = A3_2
        L10_2(L11_2, L12_2, L13_2, L14_2)
      end
    end
    L10_2 = Framework
    if "QBCore" == L10_2 then
      L10_2 = TriggerClientEvent
      L11_2 = "inventory:client:ItemBox"
      L12_2 = L8_2
      L13_2 = FWork
      L13_2 = L13_2.Shared
      L13_2 = L13_2.Items
      L13_2 = L13_2[A1_2]
      L14_2 = "add"
      L15_2 = A2_2 or L15_2
      if not A2_2 then
        L15_2 = 1
      end
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    end
    L10_2 = L39_1
    L11_2 = A4_2
    L10_2 = L10_2(L11_2)
    A4_2 = L10_2
    if "" ~= A4_2 and " " ~= A4_2 then
      L10_2 = L42_1
      L11_2 = L8_2
      L12_2 = {}
      L12_2.robberyName = A4_2
      L12_2.action = "step_reward_item"
      L12_2.actionLabel = "Step Reward Item"
      L13_2 = tonumber
      L14_2 = A5_2
      L13_2 = L13_2(L14_2)
      if not L13_2 then
        L13_2 = 0
      end
      L12_2.stepNumber = L13_2
      L13_2 = "%sx %s"
      L14_2 = L13_2
      L13_2 = L13_2.format
      L15_2 = math
      L15_2 = L15_2.floor
      L16_2 = tonumber
      L17_2 = A2_2
      L16_2 = L16_2(L17_2)
      if not L16_2 then
        L16_2 = 0
      end
      L15_2 = L15_2(L16_2)
      L16_2 = tostring
      L17_2 = A1_2 or L17_2
      if not A1_2 then
        L17_2 = "item"
      end
      L16_2, L17_2 = L16_2(L17_2)
      L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
      L12_2.rewardSummary = L13_2
      L13_2 = L43_1
      L14_2 = A6_2
      L15_2 = "Awarded an item during a main robbery."
      L13_2 = L13_2(L14_2, L15_2)
      L12_2.details = L13_2
      L10_2(L11_2, L12_2)
    end
  else
    L10_2 = GetResourceState
    L11_2 = "tgiann-inventory"
    L10_2 = L10_2(L11_2)
    if "started" == L10_2 then
      L10_2 = exports
      L10_2 = L10_2["tgiann-inventory"]
      L11_2 = L10_2
      L10_2 = L10_2.RemoveItem
      L12_2 = L8_2
      L13_2 = A1_2
      L14_2 = A2_2 or L14_2
      if not A2_2 then
        L14_2 = 1
      end
      L10_2(L11_2, L12_2, L13_2, L14_2)
    else
      L10_2 = GetResourceState
      L11_2 = "ox_inventory"
      L10_2 = L10_2(L11_2)
      if "started" == L10_2 then
        L10_2 = exports
        L10_2 = L10_2.ox_inventory
        L11_2 = L10_2
        L10_2 = L10_2.RemoveItem
        L12_2 = L8_2
        L13_2 = A1_2
        L14_2 = A2_2 or L14_2
        if not A2_2 then
          L14_2 = 1
        end
        L15_2 = A3_2
        L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
      else
        L10_2 = L9_2.RemoveItem
        L11_2 = A1_2
        L12_2 = A2_2 or L12_2
        if not A2_2 then
          L12_2 = 1
        end
        L10_2(L11_2, L12_2)
      end
    end
    L10_2 = Framework
    if "QBCore" == L10_2 then
      L10_2 = TriggerClientEvent
      L11_2 = "inventory:client:ItemBox"
      L12_2 = L8_2
      L13_2 = FWork
      L13_2 = L13_2.Shared
      L13_2 = L13_2.Items
      L13_2 = L13_2[A1_2]
      L14_2 = "remove"
      L15_2 = A2_2 or L15_2
      if not A2_2 then
        L15_2 = 1
      end
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    end
  end
  L10_2 = L23_1
  L11_2 = L8_2
  L10_2 = L10_2(L11_2)
  L11_2 = tokens
  L11_2[L8_2] = L10_2
  L11_2 = TriggerClientEvent
  L12_2 = "Pug:client:UpdateRobberyToken"
  L13_2 = L8_2
  L14_2 = L10_2
  L11_2(L12_2, L13_2, L14_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:CreateSyncedProps"
function L121_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L6_2 = A5_2 or nil
  if A5_2 then
    L6_2 = A5_2.Stage
    if L6_2 then
      L6_2 = A5_2.Stage
      L6_2 = L6_2.stepNumber
    end
  end
  L7_2 = L28_1
  L8_2 = "create"
  L9_2 = A3_2
  L10_2 = L6_2
  L11_2 = A4_2
  L12_2 = A0_2
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  if L7_2 then
    return
  end
  L7_2 = L47_1
  L8_2 = A3_2
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = TriggerClientEvent
  L8_2 = "Pug:client:CreateSyncedProps"
  L9_2 = -1
  L10_2 = A0_2
  L11_2 = A1_2
  L12_2 = A2_2
  L13_2 = A3_2
  L14_2 = A4_2
  L15_2 = A5_2
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
end
L119_1(L120_1, L121_1)
L119_1 = RegisterNetEvent
L120_1 = "Pug:server:DeleteRobberiesEntity"
function L121_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = L28_1
  L5_2 = "delete"
  L6_2 = A2_2
  L7_2 = A3_2
  L8_2 = A1_2
  L9_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  if L4_2 then
    return
  end
  L4_2 = TriggerClientEvent
  L5_2 = "Pug:client:DeleteRobberiesEntity"
  L6_2 = -1
  L7_2 = A0_2
  L8_2 = A1_2
  L9_2 = A2_2
  L10_2 = A3_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
end
L119_1(L120_1, L121_1)
L119_1 = {}
L120_1 = RegisterNetEvent
L121_1 = "Pug:server:CreateRobberyGuards"
function L122_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L3_2 = A0_2.stepNumber
  L4_2 = A2_2
  L3_2 = L3_2 .. L4_2
  L4_2 = A0_2.guards
  if L4_2 then
    L4_2 = A0_2.guards
    L4_2 = #L4_2
    if L4_2 > 0 then
      L4_2 = L7_1
      L5_2 = L7_1
      L5_2 = L5_2[L3_2]
      if not L5_2 then
        L5_2 = {}
      end
      L4_2[L3_2] = L5_2
      L4_2 = ipairs
      L5_2 = A0_2.guards
      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
        L10_2 = vector3
        L11_2 = L9_2.guardPosition
        L11_2 = L11_2[1]
        L12_2 = L9_2.guardPosition
        L12_2 = L12_2[2]
        L13_2 = L9_2.guardPosition
        L13_2 = L13_2[3]
        L10_2 = L10_2(L11_2, L12_2, L13_2)
        L11_2 = GetHashKey
        L12_2 = L9_2.guardModel
        L11_2 = L11_2(L12_2)
        L12_2 = CreatePed
        L13_2 = 4
        L14_2 = L11_2
        L15_2 = L10_2.x
        L16_2 = L10_2.y
        L17_2 = L10_2.z
        L18_2 = L9_2.heading
        L19_2 = true
        L20_2 = false
        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L13_2 = os
        L13_2 = L13_2.time
        L13_2 = L13_2()
        L14_2 = 4
        while true do
          L15_2 = DoesEntityExist
          L16_2 = L12_2
          L15_2 = L15_2(L16_2)
          if L15_2 then
            break
          end
          L15_2 = Wait
          L16_2 = 1000
          L15_2(L16_2)
          L15_2 = os
          L15_2 = L15_2.time
          L15_2 = L15_2()
          L15_2 = L15_2 - L13_2
          if L14_2 <= L15_2 then
            break
          end
        end
        L15_2 = SetEntityHeading
        L16_2 = L12_2
        L17_2 = L9_2.heading
        L17_2 = L17_2 + 0.0
        L15_2(L16_2, L17_2)
        L15_2 = GiveWeaponToPed
        L16_2 = L12_2
        L17_2 = GetHashKey
        L18_2 = L9_2.weapon
        L17_2 = L17_2(L18_2)
        L18_2 = 9999
        L19_2 = false
        L20_2 = true
        L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
        L15_2 = table
        L15_2 = L15_2.insert
        L16_2 = L7_1
        L16_2 = L16_2[L3_2]
        L17_2 = {}
        L18_2 = NetworkGetNetworkIdFromEntity
        L19_2 = L12_2
        L18_2 = L18_2(L19_2)
        L17_2.guardNetId = L18_2
        L17_2.guardData = L9_2
        L17_2.stageData = A0_2
        L15_2(L16_2, L17_2)
      end
      L4_2 = TriggerClientEvent
      L5_2 = "Pug:client:SyncAllGuards"
      L6_2 = -1
      L7_2 = L7_1
      L7_2 = L7_2[L3_2]
      L8_2 = A1_2
      L9_2 = A2_2
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
      L4_2 = L119_1
      L4_2 = L4_2[L3_2]
      if not L4_2 then
        L4_2 = L119_1
        L4_2[L3_2] = true
        L4_2 = math
        L4_2 = L4_2.max
        L5_2 = 1
        L6_2 = tonumber
        L7_2 = A1_2 or L7_2
        if not A1_2 then
          L7_2 = 1
        end
        L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L6_2(L7_2)
        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L4_2 = L4_2 * 60
        L4_2 = L4_2 * 1000
        L5_2 = CreateThread
        function L6_2()
          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
          L0_3 = Wait
          L1_3 = L4_2
          L0_3(L1_3)
          L1_3 = L3_2
          L0_3 = L7_1
          L0_3 = L0_3[L1_3]
          if L0_3 then
            L1_3 = L3_2
            L0_3 = L7_1
            L0_3 = L0_3[L1_3]
            L0_3 = #L0_3
            if L0_3 > 0 then
              L0_3 = ipairs
              L2_3 = L3_2
              L1_3 = L7_1
              L1_3 = L1_3[L2_3]
              L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
              for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
                L6_3 = NetworkGetEntityFromNetworkId
                L7_3 = L5_3.guardNetId
                L6_3 = L6_3(L7_3)
                L7_3 = DoesEntityExist
                L8_3 = L6_3
                L7_3 = L7_3(L8_3)
                if L7_3 then
                  L7_3 = DeleteEntity
                  L8_3 = L6_3
                  L7_3(L8_3)
                  L7_3 = PrintDebug
                  L8_3 = "Deleted guard entity with network ID:"
                  L9_3 = L5_3.guardNetId
                  L7_3(L8_3, L9_3)
                else
                  L7_3 = PrintDebug
                  L8_3 = "Guard entity not found or already deleted:"
                  L9_3 = L5_3.guardNetId
                  L7_3(L8_3, L9_3)
                end
              end
              L1_3 = L3_2
              L0_3 = L7_1
              L0_3[L1_3] = nil
              L0_3 = PrintDebug
              L1_3 = "Guards for key '"
              L2_3 = L3_2
              L3_3 = "' deleted after stepCooldown."
              L1_3 = L1_3 .. L2_3 .. L3_3
              L0_3(L1_3)
            end
          end
          L1_3 = L3_2
          L0_3 = L119_1
          L0_3[L1_3] = nil
        end
        L5_2(L6_2)
      end
  end
  else
    L4_2 = PrintDebug
    L5_2 = "No guards data available in the guardStage."
    L4_2(L5_2)
  end
end
L120_1(L121_1, L122_1)
L120_1 = RegisterNetEvent
L121_1 = "Pug:server:RobberySaveVehicleToDatabase"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = source
  L3_2 = Framework
  if "ESX" == L3_2 then
    L3_2 = FWork
    L3_2 = L3_2.GetPlayerFromId
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = MySQL
    L4_2 = L4_2.insert
    L5_2 = "INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (?, ?, ?)"
    L6_2 = {}
    L7_2 = L3_2.identifier
    L8_2 = A0_2.plate
    L9_2 = json
    L9_2 = L9_2.encode
    L10_2 = A0_2
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2(L10_2)
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L6_2[4] = L10_2
    L6_2[5] = L11_2
    L6_2[6] = L12_2
    L6_2[7] = L13_2
    L6_2[8] = L14_2
    L6_2[9] = L15_2
    L6_2[10] = L16_2
    L4_2(L5_2, L6_2)
  else
    L3_2 = FWork
    L3_2 = L3_2.Functions
    L3_2 = L3_2.GetPlayer
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      L4_2 = A0_2.plate
      L5_2 = A1_2
      L6_2 = json
      L6_2 = L6_2.encode
      L7_2 = A0_2
      L6_2 = L6_2(L7_2)
      L7_2 = MySQL
      L7_2 = L7_2.insert
      L8_2 = "INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)"
      L9_2 = {}
      L10_2 = L3_2.PlayerData
      L10_2 = L10_2.license
      L11_2 = L3_2.PlayerData
      L11_2 = L11_2.citizenid
      L12_2 = L5_2
      L13_2 = GetHashKey
      L14_2 = L5_2
      L13_2 = L13_2(L14_2)
      L14_2 = L6_2
      L15_2 = L4_2
      L16_2 = 0
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L9_2[4] = L13_2
      L9_2[5] = L14_2
      L9_2[6] = L15_2
      L9_2[7] = L16_2
      L7_2(L8_2, L9_2)
      L7_2 = TriggerClientEvent
      L8_2 = "Pug:client:ShowHeistNotify"
      L9_2 = L2_2
      L10_2 = Config
      L10_2 = L10_2.LangT
      L10_2 = L10_2.VehicleSavedToGarage
      L11_2 = "success"
      L12_2 = 5000
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    else
      L4_2 = TriggerClientEvent
      L5_2 = "Pug:client:ShowHeistNotify"
      L6_2 = L2_2
      L7_2 = Config
      L7_2 = L7_2.T
      L8_2 = "PlayerNotFound"
      L7_2 = L7_2(L8_2)
      L8_2 = "error"
      L9_2 = 5000
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    end
  end
end
L120_1(L121_1, L122_1)
L120_1 = RegisterNetEvent
L121_1 = "Pug:server:StartToxicGasForEveryone"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = TriggerClientEvent
  L3_2 = "Pug:client:StartToxicGasForEveryone"
  L4_2 = -1
  L5_2 = A0_2
  L6_2 = A1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:serverCB:GetHeistData"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = A0_2
  L3_2 = getHeists
  L3_2 = L3_2()
  L4_2 = heistPasscodes
  L5_2 = getBankTruckSettings
  L5_2 = L5_2()
  L6_2 = getSellItemsSettings
  L6_2 = L6_2()
  L7_2 = getAtmRobberySettings
  L7_2 = L7_2()
  L8_2 = getPettyCrimeSettings
  L9_2 = L2_2
  L8_2 = L8_2(L9_2)
  L9_2 = getHouseRobberySettings
  L9_2 = L9_2()
  L10_2 = getRobberyIntelConfig
  L10_2 = L10_2()
  L11_2 = A1_2
  L12_2 = {}
  L12_2.heistData = L3_2
  L12_2.passcodes = L4_2
  L13_2 = heistPasscodesLocation
  L12_2.passcodeLocation = L13_2
  L12_2.TruckData = L5_2
  L12_2.SellItemsData = L6_2
  L12_2.AtmRobberyData = L7_2
  L12_2.PettyCrimeData = L8_2
  L12_2.HouseRobberyData = L9_2
  L12_2.RobberyIntelData = L10_2
  L11_2(L12_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:serverCB:IsCityWideBlackout"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = L8_1
  L2_2(L3_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:server:hasStepBeenCompleted"
function L122_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2
  L4_2 = L50_1
  L5_2 = A2_2
  L6_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = A1_2
    L5_2 = true
    L4_2(L5_2)
    return
  end
  L4_2 = L3_1
  L4_2 = L4_2[A2_2]
  if L4_2 then
    L4_2 = L3_1
    L4_2 = L4_2[A2_2]
    L4_2 = L4_2[A3_2]
    if L4_2 then
      L4_2 = os
      L4_2 = L4_2.time
      L4_2 = L4_2()
      L5_2 = L3_1
      L5_2 = L5_2[A2_2]
      L5_2 = L5_2[A3_2]
      if L4_2 < L5_2 then
        L5_2 = A1_2
        L6_2 = true
        L5_2(L6_2)
        return
      end
    end
  end
  L4_2 = A1_2
  L5_2 = false
  L4_2(L5_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:server:hasStepObjectBeenCompleted"
function L122_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = A1_2
  L5_2 = L51_1
  L6_2 = A2_2
  L7_2 = A3_2
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  L4_2(L5_2, L6_2, L7_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:server:isStepOnCooldown"
function L122_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = L3_1
  L4_2 = L4_2[A2_2]
  if L4_2 then
    L4_2 = L3_1
    L4_2 = L4_2[A2_2]
    L4_2 = L4_2[A3_2]
    if L4_2 then
      L4_2 = os
      L4_2 = L4_2.time
      L4_2 = L4_2()
      L5_2 = L3_1
      L5_2 = L5_2[A2_2]
      L5_2 = L5_2[A3_2]
      if L4_2 < L5_2 then
        L5_2 = A1_2
        L6_2 = true
        L5_2(L6_2)
        return
      else
        L5_2 = TriggerClientEvent
        L6_2 = "Pug:client:ResetRobberyProp"
        L7_2 = -1
        L8_2 = A2_2
        L9_2 = A3_2
        L5_2(L6_2, L7_2, L8_2, L9_2)
        L5_2 = L29_1
        L6_2 = A2_2
        L5_2 = L5_2(L6_2)
        if L5_2 then
          L6_2 = json
          L6_2 = L6_2.decode
          L7_2 = L5_2.stages
          L6_2 = L6_2(L7_2)
          L7_2 = ipairs
          L8_2 = L6_2
          L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
          for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
            L13_2 = tonumber
            L14_2 = L12_2.stepNumber
            L13_2 = L13_2(L14_2)
            L14_2 = tonumber
            L15_2 = A3_2
            L14_2 = L14_2(L15_2)
            if L13_2 == L14_2 then
              L13_2 = L12_2.doorId
              if L13_2 then
                L13_2 = SetDoorLockStatus
                L14_2 = tonumber
                L15_2 = L12_2.doorId
                L14_2 = L14_2(L15_2)
                L15_2 = true
                L13_2(L14_2, L15_2)
              end
            end
          end
        end
        L6_2 = L48_1
        L7_2 = A2_2
        L8_2 = A3_2
        L6_2(L7_2, L8_2)
        L6_2 = L49_1
        L7_2 = A2_2
        L8_2 = A3_2
        L6_2(L7_2, L8_2)
        L6_2 = L3_1
        L6_2 = L6_2[A2_2]
        L6_2[A3_2] = nil
        L6_2 = L3_1
        L6_2 = L6_2[A2_2]
        L6_2 = L6_2.OWNER
        if L6_2 then
          L6_2 = L3_1
          L6_2 = L6_2[A2_2]
          L6_2 = L6_2.OWNER
          L6_2 = L6_2[A3_2]
          if L6_2 then
            L6_2 = L3_1
            L6_2 = L6_2[A2_2]
            L6_2 = L6_2.OWNER
            L6_2[A3_2] = nil
          end
        end
        L6_2 = L6_1
        L6_2 = L6_2[A2_2]
        if L6_2 then
          L6_2 = L6_1
          L6_2 = L6_2[A2_2]
          L6_2 = L6_2[A3_2]
          if L6_2 then
            L6_2 = L6_1
            L6_2 = L6_2[A2_2]
            L6_2 = L6_2[A3_2]
            L6_2 = L6_2.BankDoor
            if L6_2 then
              L6_2 = L6_1
              L6_2 = L6_2[A2_2]
              L6_2 = L6_2[A3_2]
              L6_2.BankDoor = false
              L6_2 = TriggerClientEvent
              L7_2 = "Pug:client:RemoveBankDoorState"
              L8_2 = -1
              L9_2 = A2_2
              L10_2 = A3_2
              L6_2(L7_2, L8_2, L9_2, L10_2)
              L6_2 = L6_1
              L6_2 = L6_2[A2_2]
              L6_2 = L6_2[A3_2]
              L6_2.DoorCoords = nil
            end
          end
        end
      end
    end
  end
  L4_2 = A1_2
  L5_2 = false
  L4_2(L5_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:callback:GetOxDoorLocks"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = {}
  L3_2 = MySQL
  L3_2 = L3_2.Async
  L3_2 = L3_2.fetchAll
  L4_2 = "SELECT * FROM ox_doorlock"
  L5_2 = {}
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    if A0_3 then
      L1_3 = type
      L2_3 = A0_3
      L1_3 = L1_3(L2_3)
      if "table" == L1_3 then
        goto lbl_13
      end
    end
    L1_3 = A1_2
    L2_3 = {}
    L1_3(L2_3)
    do return end
    ::lbl_13::
    L1_3 = 1
    L2_3 = #A0_3
    L3_3 = 1
    for L4_3 = L1_3, L2_3, L3_3 do
      L5_3 = A0_3[L4_3]
      if L5_3 then
        L6_3 = L5_3.data
        if L6_3 then
          L6_3 = json
          L6_3 = L6_3.decode
          L7_3 = L5_3.data
          L6_3 = L6_3(L7_3)
          if L6_3 then
            goto lbl_30
          end
        end
      end
      L6_3 = nil
      ::lbl_30::
      if L6_3 then
        L7_3 = type
        L8_3 = L6_3
        L7_3 = L7_3(L8_3)
        if "table" == L7_3 then
          L7_3 = table
          L7_3 = L7_3.insert
          L8_3 = L2_2
          L9_3 = {}
          L10_3 = L5_3.id
          L9_3.id = L10_3
          L10_3 = L5_3.name
          L9_3.name = L10_3
          L10_3 = L6_3.coords
          if L10_3 then
            L10_3 = {}
            L11_3 = L6_3.coords
            L11_3 = L11_3.x
            if not L11_3 then
              L11_3 = 0.0
            end
            L10_3.x = L11_3
            L11_3 = L6_3.coords
            L11_3 = L11_3.y
            if not L11_3 then
              L11_3 = 0.0
            end
            L10_3.y = L11_3
            L11_3 = L6_3.coords
            L11_3 = L11_3.z
            if not L11_3 then
              L11_3 = 0.0
            end
            L10_3.z = L11_3
            if L10_3 then
              goto lbl_72
            end
          end
          L10_3 = nil
          ::lbl_72::
          L9_3.coords = L10_3
          L10_3 = L6_3.heading
          if not L10_3 then
            L10_3 = 0.0
          end
          L9_3.heading = L10_3
          L10_3 = L6_3.model
          L9_3.model = L10_3
          L10_3 = L6_3.maxDistance
          L9_3.maxDistance = L10_3
          L10_3 = L6_3.state
          L9_3.state = L10_3
          L10_3 = L6_3.doors
          L9_3.doors = L10_3
          L7_3(L8_3, L9_3)
        end
      end
    end
    L1_3 = A1_2
    L2_3 = L2_2
    L1_3(L2_3)
  end
  L3_2(L4_2, L5_2, L6_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:server:GetUpdatedCoreDataRobberyCreator"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = FWork
  L3_2 = GetResourceState
  L4_2 = "core_inventory"
  L3_2 = L3_2(L4_2)
  if "started" == L3_2 then
    L3_2 = exports
    L3_2 = L3_2.core_inventory
    L4_2 = L3_2
    L3_2 = L3_2.getItemsList
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  end
  L3_2 = A1_2
  L4_2 = L2_2
  L3_2(L4_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "heist:server:isSimultaneousStepActive"
function L122_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = L29_1
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = A1_2
    L6_2 = false
    L5_2(L6_2)
    return
  end
  L5_2 = json
  L5_2 = L5_2.decode
  L6_2 = L4_2.stages
  L5_2 = L5_2(L6_2)
  L6_2 = nil
  L7_2 = ipairs
  L8_2 = L5_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    L13_2 = tonumber
    L14_2 = L12_2.stepNumber
    L13_2 = L13_2(L14_2)
    L14_2 = tonumber
    L15_2 = A3_2
    L14_2 = L14_2(L15_2)
    if L13_2 == L14_2 then
      L6_2 = L12_2
      break
    end
  end
  if L6_2 then
    L7_2 = L6_2.requireSimultaneous
    if L7_2 then
      goto lbl_41
    end
  end
  L7_2 = A1_2
  L8_2 = false
  L7_2(L8_2)
  do return end
  ::lbl_41::
  L7_2 = tonumber
  L8_2 = L6_2.simultaneousStepNumber
  L7_2 = L7_2(L8_2)
  L8_2 = L2_1
  L8_2 = L8_2[A2_2]
  if L8_2 then
    L8_2 = L2_1
    L8_2 = L8_2[A2_2]
    L8_2 = L8_2[L7_2]
    if L8_2 then
      L8_2 = A1_2
      L9_2 = true
      L8_2(L9_2)
  end
  else
    L8_2 = A1_2
    L9_2 = false
    L8_2(L9_2)
  end
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:serverCB:GetRobberyRep"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2
  L3_2 = nil
  L4_2 = Framework
  if "QBCore" == L4_2 then
    L4_2 = FWork
    L4_2 = L4_2.Functions
    L4_2 = L4_2.GetPlayer
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
  else
    L4_2 = Config
    L4_2 = L4_2.FrameworkFunctions
    L4_2 = L4_2.GetPlayer
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
  end
  L4_2 = A1_2
  L5_2 = GetRobberyRep
  L6_2 = L3_2
  L5_2, L6_2 = L5_2(L6_2)
  L4_2(L5_2, L6_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:serverCB:GetHouseRobberyRep"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A0_2
  L3_2 = nil
  L4_2 = Framework
  if "QBCore" == L4_2 then
    L4_2 = FWork
    L4_2 = L4_2.Functions
    L4_2 = L4_2.GetPlayer
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
  else
    L4_2 = Config
    L4_2 = L4_2.FrameworkFunctions
    L4_2 = L4_2.GetPlayer
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
  end
  L4_2 = A1_2
  L5_2 = GetHouseRobberyRep
  L6_2 = L3_2
  L5_2, L6_2 = L5_2(L6_2)
  L4_2(L5_2, L6_2)
end
L120_1(L121_1, L122_1)
L120_1 = Config
L120_1 = L120_1.FrameworkFunctions
L120_1 = L120_1.CreateCallback
L121_1 = "Pug:server:IsRobberyOnCooldown"
function L122_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L4_2 = AllRobberysCooldDownTable
  L4_2 = L4_2[A2_2]
  if L4_2 and L3_2 < L4_2 then
    L5_2 = A1_2
    L6_2 = true
    L7_2 = L4_2 - L3_2
    L5_2(L6_2, L7_2)
  else
    L5_2 = A1_2
    L6_2 = false
    L7_2 = 0
    L5_2(L6_2, L7_2)
  end
end
L120_1(L121_1, L122_1)
L120_1 = table
function L121_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L2_2 = type
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      goto lbl_10
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_10::
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == A1_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end
L120_1.contains = L121_1
L120_1 = AddEventHandler
L121_1 = "playerDropped"
function L122_1()
  local L0_2, L1_2
  L1_2 = source
  L0_2 = L9_1
  L0_2[L1_2] = nil
end
L120_1(L121_1, L122_1)
L120_1 = RegisterNetEvent
L121_1 = "Pug:server:RemoveRobberyCooldown"
function L122_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if "string" == L1_2 then
      goto lbl_12
    end
  end
  L1_2 = PrintDebug
  L2_2 = "Error: robberyName must be a string"
  L1_2(L2_2)
  do return end
  ::lbl_12::
  L1_2 = AllRobberysCooldDownTable
  L1_2 = L1_2[A0_2]
  if L1_2 then
    L1_2 = AllRobberysCooldDownTable
    L1_2[A0_2] = nil
    L1_2 = PrintDebug
    L2_2 = "Cooldown for robbery '"
    L3_2 = A0_2
    L4_2 = "' has been manually removed."
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
  else
    L1_2 = PrintDebug
    L2_2 = "Cooldown for robbery '"
    L3_2 = A0_2
    L4_2 = "' does not exist or has already been removed."
    L2_2 = L2_2 .. L3_2 .. L4_2
    L1_2(L2_2)
  end
end
L120_1(L121_1, L122_1)
L120_1 = RegisterNetEvent
L121_1 = "Pug:server:TriggerCityWideBlackout"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L8_1
  if not L2_2 then
    L2_2 = A0_2 * 60000
    L3_2 = L53_1
    L4_2 = A1_2
    L3_2(L4_2)
    L3_2 = Wait
    L4_2 = L2_2
    L3_2(L4_2)
    L3_2 = SetCityWideBlackOutOff
    L3_2()
  end
end
L120_1(L121_1, L122_1)
L120_1 = RegisterNetEvent
L121_1 = "Pug:server:SetRobberiesOnCooldown"
function L122_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 then
    L2_2 = PrintDebug
    L3_2 = "Error: robberyNames must be a table"
    L2_2(L3_2)
    return
  end
  if not A1_2 or A1_2 <= 0 then
    L2_2 = PrintDebug
    L3_2 = "Error: cooldownMinutes must be greater than zero"
    L2_2(L3_2)
    return
  end
  L2_2 = A1_2 * 60
  L3_2 = os
  L3_2 = L3_2.time
  L3_2 = L3_2()
  L4_2 = {}
  L5_2 = ipairs
  L6_2 = A0_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
    L11_2 = AllRobberysCooldDownTable
    L11_2 = L11_2[L10_2]
    if not L11_2 then
      L11_2 = AllRobberysCooldDownTable
      L12_2 = L3_2 + L2_2
      L11_2[L10_2] = L12_2
      L11_2 = table
      L11_2 = L11_2.insert
      L12_2 = L4_2
      L13_2 = L10_2
      L11_2(L12_2, L13_2)
      L11_2 = PrintDebug
      L12_2 = "Set robbery '"
      L13_2 = L10_2
      L14_2 = "' on cooldown for "
      L15_2 = A1_2
      L16_2 = " minutes."
      L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
      L11_2(L12_2)
    else
      L11_2 = PrintDebug
      L12_2 = "Robbery '"
      L13_2 = L10_2
      L14_2 = "' is already on cooldown. Skipping."
      L12_2 = L12_2 .. L13_2 .. L14_2
      L11_2(L12_2)
    end
  end
  L5_2 = #L4_2
  if L5_2 > 0 then
    L5_2 = CreateThread
    function L6_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
      while true do
        L0_3 = Wait
        L1_3 = 1000
        L0_3(L1_3)
        L0_3 = os
        L0_3 = L0_3.time
        L0_3 = L0_3()
        L1_3 = true
        L2_3 = ipairs
        L3_3 = L4_2
        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
        for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
          L8_3 = AllRobberysCooldDownTable
          L8_3 = L8_3[L7_3]
          if L8_3 then
            if L0_3 >= L8_3 then
              L9_3 = AllRobberysCooldDownTable
              L9_3[L7_3] = nil
              L9_3 = PrintDebug
              L10_3 = "Cooldown for robbery '"
              L11_3 = L7_3
              L12_3 = "' has ended."
              L10_3 = L10_3 .. L11_3 .. L12_3
              L9_3(L10_3)
            else
              L1_3 = false
            end
          else
            L9_3 = PrintDebug
            L10_3 = "Cooldown for robbery '"
            L11_3 = L7_3
            L12_3 = "' has been manually removed."
            L10_3 = L10_3 .. L11_3 .. L12_3
            L9_3(L10_3)
          end
        end
        if L1_3 then
          break
        end
      end
    end
    L5_2(L6_2)
  end
end
L120_1(L121_1, L122_1)
L120_1 = _ENV
L121_1 = "SetRobberiesOnCooldownBasedOnMinutesUntilRobbery"
function L122_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L0_2 = getHeists
  L0_2 = L0_2()
  if L0_2 then
    L1_2 = #L0_2
    if 0 ~= L1_2 then
      goto lbl_12
    end
  end
  L1_2 = PrintDebug
  L2_2 = "No heists found."
  L1_2(L2_2)
  do return end
  ::lbl_12::
  L1_2 = os
  L1_2 = L1_2.time
  L1_2 = L1_2()
  L2_2 = ipairs
  L3_2 = L0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = json
    L8_2 = L8_2.decode
    L9_2 = L7_2.settings
    L8_2 = L8_2(L9_2)
    L9_2 = L8_2.minutesUntilRobbery
    if L9_2 then
      L9_2 = L8_2.minutesUntilRobbery
      if "" ~= L9_2 then
        L9_2 = L8_2.minutesUntilRobbery
        if " " ~= L9_2 and L8_2 then
          L9_2 = L8_2.minutesUntilRobbery
          if L9_2 then
            L9_2 = tonumber
            L10_2 = L8_2.minutesUntilRobbery
            L9_2 = L9_2(L10_2)
            if L9_2 > 0 then
              L9_2 = tonumber
              L10_2 = L8_2.minutesUntilRobbery
              L9_2 = L9_2(L10_2)
              L10_2 = L9_2 * 60
              L11_2 = AllRobberysCooldDownTable
              L12_2 = L7_2.heist_name
              L13_2 = L1_2 + L10_2
              L11_2[L12_2] = L13_2
              L11_2 = PrintDebug
              L12_2 = "Setting robbery '"
              L13_2 = L7_2.heist_name
              L14_2 = "' on cooldown for "
              L15_2 = L9_2
              L16_2 = " minutes."
              L12_2 = L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2
              L11_2(L12_2)
            end
          end
        end
      end
    end
  end
  L2_2 = CreateThread
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    while true do
      L0_3 = Wait
      L1_3 = 1000
      L0_3(L1_3)
      L0_3 = os
      L0_3 = L0_3.time
      L0_3 = L0_3()
      L1_3 = true
      L2_3 = pairs
      L3_3 = AllRobberysCooldDownTable
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        if L7_3 <= L0_3 then
          L8_3 = AllRobberysCooldDownTable
          L8_3[L6_3] = nil
          L8_3 = PrintDebug
          L9_3 = "Cooldown for robbery '"
          L10_3 = L6_3
          L11_3 = "' has ended."
          L9_3 = L9_3 .. L10_3 .. L11_3
          L8_3(L9_3)
        else
          L1_3 = false
        end
      end
      if L1_3 then
        break
      end
    end
  end
  L2_2(L3_2)
end
L120_1[L121_1] = L122_1
