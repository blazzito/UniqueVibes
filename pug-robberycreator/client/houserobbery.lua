local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1, L45_1, L46_1, L47_1, L48_1, L49_1, L50_1, L51_1, L52_1, L53_1, L54_1, L55_1, L56_1, L57_1, L58_1, L59_1, L60_1, L61_1, L62_1, L63_1, L64_1, L65_1, L66_1, L67_1, L68_1, L69_1, L70_1, L71_1, L72_1, L73_1, L74_1, L75_1, L76_1, L77_1, L78_1, L79_1, L80_1, L81_1, L82_1, L83_1, L84_1, L85_1, L86_1, L87_1, L88_1, L89_1, L90_1, L91_1, L92_1, L93_1, L94_1, L95_1, L96_1, L97_1, L98_1, L99_1, L100_1, L101_1, L102_1, L103_1, L104_1, L105_1, L106_1, L107_1, L108_1, L109_1, L110_1, L111_1, L112_1, L113_1, L114_1, L115_1, L116_1, L117_1, L118_1, L119_1, L120_1, L121_1, L122_1, L123_1, L124_1, L125_1, L126_1, L127_1, L128_1, L129_1, L130_1, L131_1, L132_1, L133_1, L134_1, L135_1, L136_1, L137_1, L138_1, L139_1, L140_1, L141_1, L142_1, L143_1, L144_1, L145_1, L146_1, L147_1, L148_1, L149_1, L150_1, L151_1, L152_1, L153_1, L154_1, L155_1, L156_1, L157_1, L158_1, L159_1, L160_1, L161_1, L162_1, L163_1, L164_1, L165_1, L166_1, L167_1, L168_1, L169_1, L170_1, L171_1, L172_1, L173_1, L174_1, L175_1, L176_1, L177_1, L178_1, L179_1, L180_1, L181_1, L182_1, L183_1, L184_1, L185_1, L186_1, L187_1, L188_1, L189_1, L190_1, L191_1, L192_1, L193_1, L194_1, L195_1, L196_1, L197_1, L198_1, L199_1, L200_1, L201_1, L202_1
L0_1 = {}
L1_1 = {}
L0_1.settings = L1_1
L1_1 = {}
L0_1.shells = L1_1
L1_1 = {}
L0_1.locations = L1_1
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = nil
L5_1 = nil
L6_1 = false
L7_1 = false
L8_1 = nil
L9_1 = 0
L10_1 = nil
L11_1 = {}
L11_1.enabled = false
L11_1.pointIndex = nil
L11_1.durationMs = 12000
L11_1.notify = true
L12_1 = 100.0
L13_1 = 16
L14_1 = 6.0
L15_1 = 0.12
L16_1 = 1.5
L17_1 = 10.0
L18_1 = 18.0
L19_1 = 34.0
L20_1 = 22.0
L21_1 = 0.002
L22_1 = 1.0
L23_1 = 1400
L24_1 = 8
L25_1 = "houseMissionNpc"
L26_1 = 100.0
L27_1 = 120.0
L28_1 = nil
L29_1 = nil
L30_1 = nil
L31_1 = nil
L32_1 = nil
L33_1 = nil
L34_1 = nil
L35_1 = nil
L36_1 = nil
L37_1 = nil
L38_1 = nil
L39_1 = nil
L40_1 = nil
L41_1 = nil
L42_1 = nil
function L43_1(A0_2)
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
function L44_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A0_2 then
    L2_2 = type
    L3_2 = A0_2.looted
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      goto lbl_10
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_10::
  L2_2 = A0_2.looted
  L2_2 = L2_2[A1_2]
  L2_2 = true == L2_2
  return L2_2
end
function L45_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L43_1
  if A0_2 then
    L2_2 = A0_2.prop
    if L2_2 then
      goto lbl_8
    end
  end
  L2_2 = ""
  ::lbl_8::
  L1_2 = L1_2(L2_2)
  if "" ~= L1_2 then
    L2_2 = type
    L3_2 = Config
    L2_2 = L2_2(L3_2)
    if "table" == L2_2 then
      L2_2 = type
      L3_2 = Config
      L3_2 = L3_2.RobberyAnimations
      L2_2 = L2_2(L3_2)
      if "table" == L2_2 then
        goto lbl_24
      end
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_24::
  L2_2 = Config
  L2_2 = L2_2.RobberyAnimations
  L2_2 = L2_2[L1_2]
  L3_2 = type
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L3_2 = "table" == L3_2
  return L3_2
end
function L46_1(A0_2)
  local L1_2, L2_2
  L1_2 = L43_1
  if A0_2 then
    L2_2 = A0_2.prop
    if L2_2 then
      goto lbl_8
    end
  end
  L2_2 = ""
  ::lbl_8::
  L1_2 = L1_2(L2_2)
  L1_2 = L45_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = "" ~= L1_2 and L1_2
  return L1_2
end
function L47_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = "table" == L1_2 or "vector3" == L1_2 or "vector4" == L1_2
  return L2_2
end
function L48_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    return A0_2
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "string" == L1_2 and "" ~= A0_2 then
    L1_2 = pcall
    L2_2 = json
    L2_2 = L2_2.decode
    L3_2 = A0_2
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
  L1_2 = {}
  L2_2 = {}
  L1_2.settings = L2_2
  L2_2 = {}
  L1_2.shells = L2_2
  L2_2 = {}
  L1_2.locations = L2_2
  return L1_2
end
function L49_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L47_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = vector3
  L2_2 = tonumber
  L3_2 = A0_2.x
  if not L3_2 then
    L3_2 = A0_2[1]
  end
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0.0
  end
  L3_2 = tonumber
  L4_2 = A0_2.y
  if not L4_2 then
    L4_2 = A0_2[2]
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0.0
  end
  L4_2 = tonumber
  L5_2 = A0_2.z
  if not L5_2 then
    L5_2 = A0_2[3]
  end
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0.0
  end
  return L1_2(L2_2, L3_2, L4_2)
end
function L50_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L47_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = vector4
  L2_2 = tonumber
  L3_2 = A0_2.x
  if not L3_2 then
    L3_2 = A0_2[1]
  end
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0.0
  end
  L3_2 = tonumber
  L4_2 = A0_2.y
  if not L4_2 then
    L4_2 = A0_2[2]
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0.0
  end
  L4_2 = tonumber
  L5_2 = A0_2.z
  if not L5_2 then
    L5_2 = A0_2[3]
  end
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 0.0
  end
  L5_2 = tonumber
  L6_2 = A0_2.w
  if not L6_2 then
    L6_2 = A0_2.h
    if not L6_2 then
      L6_2 = A0_2[4]
    end
  end
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0.0
  end
  return L1_2(L2_2, L3_2, L4_2, L5_2)
end
function L51_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L49_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = {}
  L3_2 = L1_2.x
  L2_2.x = L3_2
  L3_2 = L1_2.y
  L2_2.y = L3_2
  L3_2 = L1_2.z
  L2_2.z = L3_2
  return L2_2
end
function L52_1(A0_2)
  local L1_2, L2_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2 or A0_2
  if not L1_2 then
    A0_2 = 0.0
  end
  A0_2 = A0_2 % 360.0
  if A0_2 < 0.0 then
    A0_2 = A0_2 + 360.0
  end
  return A0_2
end
function L53_1(...)
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L0_2 = L11_1.enabled
  if not L0_2 then
    return
  end
  L0_2 = {}
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = ...
  L0_2[1] = L1_2
  L0_2[2] = L2_2
  L0_2[3] = L3_2
  L0_2[4] = L4_2
  L0_2[5] = L5_2
  L0_2[6] = L6_2
  L0_2[7] = L7_2
  L0_2[8] = L8_2
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
    else
      L7_2 = type
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if "vector3" ~= L7_2 then
        L7_2 = type
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if "vector4" ~= L7_2 then
          goto lbl_40
        end
      end
      L7_2 = tostring
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      L0_2[L5_2] = L7_2
      goto lbl_44
      ::lbl_40::
      L7_2 = tostring
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      L0_2[L5_2] = L7_2
    end
    ::lbl_44::
  end
  L1_2 = print
  L2_2 = "^3PUG HOUSE DEBUG:^0 "
  L3_2 = table
  L3_2 = L3_2.concat
  L4_2 = L0_2
  L5_2 = " "
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2 .. L3_2
  L1_2(L2_2)
end
function L54_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L11_1.enabled
  if L2_2 then
    L2_2 = L11_1.notify
    if true == L2_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L2_2 = Notify
  L3_2 = tostring
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = "primary"
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = 5000
  end
  L2_2(L3_2, L4_2, L5_2)
end
function L55_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L11_1.enabled
  if not L1_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = L11_1.pointIndex
  if nil == L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = tonumber
  L2_2 = L11_1.pointIndex
  L1_2 = L1_2(L2_2)
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2 == L2_2
  return L1_2
end
function L56_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0.0
  end
  if nil == L2_2 then
    L4_2 = L52_1
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2 + 0.0
    return L4_2
  end
  if 0.0 == L2_2 and 0.0 ~= L3_2 then
    L4_2 = L52_1
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L4_2 = L4_2 + 0.0
    return L4_2
  end
  L4_2 = L52_1
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L4_2 = L4_2 + 0.0
  return L4_2
end
function L57_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = tonumber
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0.0
  end
  if nil == L2_2 or 0.0 == L2_2 and 0.0 ~= L3_2 then
    L4_2 = L52_1
    L5_2 = L3_2
    return L4_2(L5_2)
  end
  L4_2 = L52_1
  L5_2 = L2_2
  return L4_2(L5_2)
end
function L58_1(A0_2)
  local L1_2, L2_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.lower
  L1_2 = L1_2(L2_2)
  if "standing" == L1_2 then
    L2_2 = "standing"
    return L2_2
  end
  L2_2 = "sleeping"
  return L2_2
end
function L59_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = GetHashKey
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = IsModelValid
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = RequestModel
  L4_2 = L2_2
  L3_2(L4_2)
  while true do
    L3_2 = HasModelLoaded
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
  end
  return L2_2
end
function L60_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = ipairs
  L3_2 = Config
  L3_2 = L3_2.HouseRobberyShellModels
  if not L3_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L43_1
    L9_2 = L7_2.model
    L8_2 = L8_2(L9_2)
    if L8_2 == L1_2 then
      return L7_2
    end
  end
end
function L61_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = L60_1
  L2_2 = A0_2.model
  return L1_2(L2_2)
end
function L62_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = A0_2[A1_2]
  if nil ~= L2_2 then
    return L2_2
  end
  L3_2 = L61_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = type
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = L3_2[A1_2]
    return L4_2
  end
end
function L63_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L43_1
  L2_2 = L62_1
  L3_2 = A0_2
  L4_2 = "shellType"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = L62_1
    L3_2 = A0_2
    L4_2 = "type"
    L2_2 = L2_2(L3_2, L4_2)
    if not L2_2 then
      L2_2 = L62_1
      L3_2 = A0_2
      L4_2 = "interiorType"
      L2_2 = L2_2(L3_2, L4_2)
    end
  end
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.lower
  L1_2 = L1_2(L2_2)
  if "world" == L1_2 or "world_interior" == L1_2 or "interior" == L1_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = L62_1
  L3_2 = A0_2
  L4_2 = "isWorldInterior"
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = true == L2_2
  return L2_2
end
function L64_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L50_1
  L2_2 = L62_1
  L3_2 = A0_2
  L4_2 = "enterOffset"
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = {}
  end
  return L1_2(L2_2)
end
function L65_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = L62_1
  L2_2 = A0_2
  L3_2 = "ipls"
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = L62_1
    L2_2 = A0_2
    L3_2 = "ipl"
    L1_2 = L1_2(L2_2, L3_2)
  end
  L2_2 = {}
  L3_2 = type
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = ipairs
    L4_2 = L1_2
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L43_1
      L10_2 = L8_2
      L9_2 = L9_2(L10_2)
      if "" ~= L9_2 then
        L10_2 = #L2_2
        L10_2 = L10_2 + 1
        L2_2[L10_2] = L9_2
      end
    end
  else
    L3_2 = L43_1
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if "" ~= L3_2 then
      L4_2 = #L2_2
      L4_2 = L4_2 + 1
      L2_2[L4_2] = L3_2
    end
  end
  return L2_2
end
function L66_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = ipairs
  L3_2 = L65_1
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2)
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = RequestIpl
    L9_2 = L7_2
    L8_2(L9_2)
  end
  if A1_2 then
    L2_2 = RequestCollisionAtCoord
    L3_2 = A1_2.x
    L4_2 = A1_2.y
    L5_2 = A1_2.z
    L2_2(L3_2, L4_2, L5_2)
    L2_2 = GetInteriorAtCoords
    L3_2 = A1_2.x
    L4_2 = A1_2.y
    L5_2 = A1_2.z
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    if L2_2 and 0 ~= L2_2 then
      L3_2 = type
      L4_2 = PinInteriorInMemory
      L3_2 = L3_2(L4_2)
      if "function" == L3_2 then
        L3_2 = PinInteriorInMemory
        L4_2 = L2_2
        L3_2(L4_2)
      end
      L3_2 = type
      L4_2 = RefreshInterior
      L3_2 = L3_2(L4_2)
      if "function" == L3_2 then
        L3_2 = RefreshInterior
        L4_2 = L2_2
        L3_2(L4_2)
      end
      L3_2 = type
      L4_2 = IsInteriorReady
      L3_2 = L3_2(L4_2)
      if "function" == L3_2 then
        L3_2 = GetGameTimer
        L3_2 = L3_2()
        while true do
          L4_2 = IsInteriorReady
          L5_2 = L2_2
          L4_2 = L4_2(L5_2)
          if L4_2 then
            break
          end
          L4_2 = GetGameTimer
          L4_2 = L4_2()
          L4_2 = L4_2 - L3_2
          L5_2 = 2500
          if not (L4_2 < L5_2) then
            break
          end
          L4_2 = Wait
          L5_2 = 50
          L4_2(L5_2)
        end
      end
    end
  end
end
function L67_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = type
  L2_2 = Config
  L2_2 = L2_2.HouseRobberyNpcs
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = Config
    L1_2 = L1_2.HouseRobberyNpcs
    if L1_2 then
      goto lbl_13
    end
  end
  L1_2 = {}
  ::lbl_13::
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = ""
    L10_2 = type
    L11_2 = L8_2
    L10_2 = L10_2(L11_2)
    if "table" == L10_2 then
      L10_2 = L43_1
      L11_2 = L8_2.model
      if not L11_2 then
        L11_2 = L8_2.ped
        if not L11_2 then
          L11_2 = L8_2.name
          if not L11_2 then
            L11_2 = L8_2.label
            if not L11_2 then
              L11_2 = L8_2[1]
            end
          end
        end
      end
      L10_2 = L10_2(L11_2)
      L9_2 = L10_2
    else
      L10_2 = L43_1
      L11_2 = L8_2
      L10_2 = L10_2(L11_2)
      L9_2 = L10_2
    end
    if "" ~= L9_2 then
      L10_2 = IsModelValid
      L11_2 = GetHashKey
      L12_2 = L9_2
      L11_2, L12_2 = L11_2(L12_2)
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 then
        L10_2 = #L2_2
        L10_2 = L10_2 + 1
        L2_2[L10_2] = L9_2
      end
    end
  end
  L3_2 = #L2_2
  if L3_2 > 0 then
    L3_2 = math
    L3_2 = L3_2.random
    L4_2 = 1
    L5_2 = #L2_2
    L3_2 = L3_2(L4_2, L5_2)
    L3_2 = L2_2[L3_2]
    return L3_2
  end
  L3_2 = L43_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "" ~= L3_2 then
    return L3_2
  end
  L4_2 = "mp_m_freemode_01"
  return L4_2
end
function L68_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A1_2 then
    L2_2 = A1_2.spawn
    if L2_2 then
      goto lbl_8
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_8::
  L2_2 = L49_1
  L3_2 = A0_2 or L3_2
  if not A0_2 then
    L3_2 = {}
  end
  L2_2 = L2_2(L3_2)
  L3_2 = vector3
  L4_2 = A1_2.spawn
  L4_2 = L4_2.x
  L5_2 = L2_2.x
  L4_2 = L4_2 + L5_2
  L5_2 = A1_2.spawn
  L5_2 = L5_2.y
  L6_2 = L2_2.y
  L5_2 = L5_2 + L6_2
  L6_2 = A1_2.spawn
  L6_2 = L6_2.z
  L7_2 = L2_2.z
  L6_2 = L6_2 + L7_2
  return L3_2(L4_2, L5_2, L6_2)
end
function L69_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 then
    L1_2 = type
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if "vector3" ~= L1_2 then
      L1_2 = type
      L2_2 = A0_2
      L1_2 = L1_2(L2_2)
      if "vector4" ~= L1_2 then
        L1_2 = false
        return L1_2
      end
    end
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
  L4_2 = nil ~= L1_2 and nil ~= L2_2 and nil ~= L3_2
  return L4_2
end
function L70_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L69_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
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
function L71_1(A0_2)
  local L1_2, L2_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = A0_2.isPlaced
  L1_2 = L69_1
  L2_2 = A0_2.coords
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = L70_1
    L2_2 = A0_2.coords
    L1_2 = L1_2(L2_2)
    L1_2 = "table" == L1_2 and L1_2
  end
  return L1_2
end
function L72_1(A0_2)
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
    L7_2 = L71_1
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
function L73_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L49_1
  if A0_2 then
    L2_2 = A0_2.coords
    if L2_2 then
      goto lbl_9
    end
  end
  L2_2 = {}
  ::lbl_9::
  L1_2 = L1_2(L2_2)
  L2_2 = tonumber
  L3_2 = A0_2 or L3_2
  if A0_2 then
    L3_2 = A0_2.heading
  end
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0.0
  end
  L3_2 = {}
  L3_2.coords = L1_2
  L4_2 = L52_1
  L5_2 = L2_2 + 180.0
  L4_2 = L4_2(L5_2)
  L3_2.heading = L4_2
  return L3_2
end
function L74_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L49_1
  if A0_2 then
    L2_2 = A0_2.coords
    if L2_2 then
      goto lbl_9
    end
  end
  L2_2 = {}
  ::lbl_9::
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = vector3
  L3_2 = L1_2.x
  L4_2 = L1_2.y
  L5_2 = L1_2.z
  L5_2 = L5_2 + 1.0
  return L2_2(L3_2, L4_2, L5_2)
end
function L75_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = type
    L2_2 = A0_2.entry
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      L1_2 = L69_1
      L2_2 = A0_2.entry
      L2_2 = L2_2.coords
      L1_2 = L1_2(L2_2)
      if L1_2 then
        goto lbl_19
      end
    end
  end
  L1_2 = nil
  do return L1_2 end
  ::lbl_19::
  L1_2 = L49_1
  L2_2 = A0_2.entry
  L2_2 = L2_2.coords
  L1_2 = L1_2(L2_2)
  L2_2 = vector3
  L3_2 = L1_2.x
  L4_2 = L1_2.y
  L5_2 = L1_2.z
  return L2_2(L3_2, L4_2, L5_2)
end
PugGetHouseEntryAlertCoords = L75_1
function L75_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = pairs
    L3_2 = A0_2
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      L1_2[L6_2] = L7_2
    end
  end
  L2_2 = type
  L3_2 = L0_1.settings
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = L0_1.settings
    if L2_2 then
      goto lbl_26
    end
  end
  L2_2 = {}
  ::lbl_26::
  L3_2 = next
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if nil ~= L3_2 then
    L3_2 = L2_2.sendAlert
    L3_2 = true == L3_2
    L1_2.sendAlert = L3_2
    L3_2 = L2_2.alertChance
    if not L3_2 then
      L3_2 = L1_2.alertChance
    end
    L1_2.alertChance = L3_2
    L3_2 = L2_2.policeAlertHeader
    if not L3_2 then
      L3_2 = L1_2.policeAlertHeader
    end
    L1_2.policeAlertHeader = L3_2
    L3_2 = L2_2.policeAlert
    if not L3_2 then
      L3_2 = L1_2.policeAlert
    end
    L1_2.policeAlert = L3_2
    L3_2 = L2_2.policeJobs
    if not L3_2 then
      L3_2 = L1_2.policeJobs
    end
    L1_2.policeJobs = L3_2
    L3_2 = L2_2.alertCode
    if not L3_2 then
      L3_2 = L1_2.alertCode
    end
    L1_2.alertCode = L3_2
    L3_2 = L2_2.alertIcon
    if not L3_2 then
      L3_2 = L1_2.alertIcon
    end
    L1_2.alertIcon = L3_2
    L3_2 = L2_2.alertPriority
    if not L3_2 then
      L3_2 = L1_2.alertPriority
    end
    L1_2.alertPriority = L3_2
    L3_2 = L2_2.alertCamId
    if not L3_2 then
      L3_2 = L1_2.alertCamId
    end
    L1_2.alertCamId = L3_2
    L3_2 = L2_2.blipSprite
    if not L3_2 then
      L3_2 = L1_2.blipSprite
    end
    L1_2.blipSprite = L3_2
    L3_2 = L2_2.blipColor
    if not L3_2 then
      L3_2 = L1_2.blipColor
    end
    L1_2.blipColor = L3_2
    L3_2 = L2_2.blipScale
    if not L3_2 then
      L3_2 = L1_2.blipScale
    end
    L1_2.blipScale = L3_2
    L3_2 = L2_2.alertSound1
    if not L3_2 then
      L3_2 = L1_2.alertSound1
    end
    L1_2.alertSound1 = L3_2
    L3_2 = L2_2.blipFlash
    L3_2 = true == L3_2
    L1_2.blipFlash = L3_2
  end
  return L1_2
end
function L76_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = {}
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 then
    return L1_2
  end
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = type
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if "table" == L8_2 then
      L8_2 = L43_1
      L9_2 = L7_2.locationId
      if not L9_2 then
        L9_2 = L6_2
      end
      L8_2 = L8_2(L9_2)
      if "" ~= L8_2 then
        L9_2 = {}
        L10_2 = {}
        L11_2 = type
        L12_2 = L7_2.lootedPoints
        L11_2 = L11_2(L12_2)
        if "table" == L11_2 then
          L11_2 = pairs
          L12_2 = L7_2.lootedPoints
          L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
          for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
            L17_2 = tonumber
            L18_2 = L15_2
            L17_2 = L17_2(L18_2)
            if not L17_2 then
              L17_2 = tonumber
              L18_2 = L16_2 or L18_2
              if L16_2 then
                L18_2 = L15_2
              end
              L17_2 = L17_2(L18_2)
            end
            if L17_2 and true == L16_2 then
              L9_2[L17_2] = true
            end
          end
        end
        L11_2 = type
        L12_2 = L7_2.activeLootPoints
        L11_2 = L11_2(L12_2)
        if "table" == L11_2 then
          L11_2 = pairs
          L12_2 = L7_2.activeLootPoints
          L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
          for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
            L17_2 = tonumber
            L18_2 = L15_2
            L17_2 = L17_2(L18_2)
            if not L17_2 then
              L17_2 = tonumber
              L18_2 = L16_2 or L18_2
              if L16_2 then
                L18_2 = L15_2
              end
              L17_2 = L17_2(L18_2)
            end
            if L17_2 and true == L16_2 then
              L10_2[L17_2] = true
            end
          end
        end
        L11_2 = {}
        L11_2.locationId = L8_2
        L12_2 = L43_1
        L13_2 = L7_2.shellId
        L12_2 = L12_2(L13_2)
        L11_2.shellId = L12_2
        L12_2 = L43_1
        L13_2 = L7_2.presetId
        L12_2 = L12_2(L13_2)
        L11_2.presetId = L12_2
        L12_2 = tonumber
        L13_2 = L7_2.endTime
        L12_2 = L12_2(L13_2)
        if not L12_2 then
          L12_2 = 0
        end
        L11_2.endTime = L12_2
        L11_2.lootedPoints = L9_2
        L11_2.activeLootPoints = L10_2
        L12_2 = L7_2.activeLootPointsSet
        L12_2 = true == L12_2
        L11_2.activeLootPointsSet = L12_2
        L12_2 = L7_2.securityDisabled
        L12_2 = true == L12_2
        L11_2.securityDisabled = L12_2
        L1_2[L8_2] = L11_2
      end
    end
  end
  return L1_2
end
function L77_1(A0_2)
  local L1_2, L2_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L1_1
  L2_2 = L2_2[L1_2]
  return L2_2
end
function L78_1(A0_2)
  local L1_2, L2_2
  L1_2 = L77_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = nil ~= L1_2
  return L1_2
end
function L79_1(A0_2)
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
function L80_1(A0_2)
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
    L8_2 = L71_1
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = math
      L8_2 = L8_2.random
      L9_2 = 1
      L10_2 = 100
      L8_2 = L8_2(L9_2, L10_2)
      L9_2 = L79_1
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      if L8_2 <= L9_2 then
        L1_2[L6_2] = true
      end
    end
  end
  return L1_2
end
function L81_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A0_2 then
    L2_2 = A0_2.activeLootPointsSet
    if true == L2_2 then
      goto lbl_8
    end
  end
  L2_2 = true
  do return L2_2 end
  ::lbl_8::
  L2_2 = type
  L3_2 = A0_2.activeLootPoints
  L2_2 = L2_2(L3_2)
  L2_2 = "table" == L2_2
  return L2_2
end
function L82_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L1_2 = A0_2.activeLootPointsSet
    if true == L1_2 then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L1_2 = type
  L2_2 = A0_2.activeLootPoints
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.activeLootPoints
    if L1_2 then
      goto lbl_17
    end
  end
  L1_2 = {}
  ::lbl_17::
  A0_2.activeLootPoints = L1_2
  L1_2 = ipairs
  L2_2 = A0_2.preset
  if L2_2 then
    L2_2 = A0_2.preset
    L2_2 = L2_2.lootPoints
    if L2_2 then
      goto lbl_28
    end
  end
  L2_2 = {}
  ::lbl_28::
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L71_1
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = L79_1
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
      if L7_2 >= 100 then
        L7_2 = A0_2.activeLootPoints
        L7_2[L5_2] = true
      end
    end
  end
end
function L83_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 or 0 == A0_2 then
    L1_2 = false
    return L1_2
  end
  L1_2 = GetPedMovementClipset
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = GetHashKey
  L3_2 = "move_ped_crouched"
  L2_2 = L2_2(L3_2)
  L1_2 = L1_2 == L2_2
  return L1_2
end
L84_1 = false
L85_1 = 0.0
function L86_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = math
  L3_2 = L3_2.min
  L4_2 = 1.0
  L5_2 = math
  L5_2 = L5_2.max
  L6_2 = 0.0
  L7_2 = tonumber
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 0.0
  end
  L8_2 = L12_1
  L7_2 = L7_2 / L8_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  if true ~= A2_2 then
    L4_2 = L84_1
    L5_2 = true == A0_2
    if L4_2 == L5_2 then
      L4_2 = math
      L4_2 = L4_2.abs
      L5_2 = L85_1
      if not L5_2 then
        L5_2 = 0.0
      end
      L5_2 = L5_2 - L3_2
      L4_2 = L4_2(L5_2)
      L5_2 = L21_1
      if L4_2 < L5_2 then
        return
      end
    end
  end
  L4_2 = true == A0_2
  L84_1 = L4_2
  L85_1 = L3_2
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.type = "houseDisturbanceHud"
  L6_2 = true == A0_2
  L5_2.visible = L6_2
  L5_2.progress = L3_2
  L4_2(L5_2)
end
function L87_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = "houseSecurity_%s"
  L2_2 = L1_2
  L1_2 = L1_2.format
  L3_2 = L43_1
  L4_2 = A0_2
  L3_2, L4_2 = L3_2(L4_2)
  return L1_2(L2_2, L3_2, L4_2)
end
function L88_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = "houseLoot_%s_%s"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = L43_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = tonumber
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = A1_2
  end
  return L2_2(L3_2, L4_2, L5_2)
end
function L89_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = L78_1
    L2_2 = A0_2.id
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = "Enter House"
      return L1_2
    end
  end
  if A0_2 then
    L1_2 = A0_2.interactionLabel
    if L1_2 then
      goto lbl_16
    end
  end
  L1_2 = "Break In"
  ::lbl_16::
  return L1_2
end
function L90_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if not A0_2 then
    return
  end
  L1_2 = type
  L2_2 = A0_2.securityLaserKeys
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = type
    L2_2 = LaserTable
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      L1_2 = ipairs
      L2_2 = A0_2.securityLaserKeys
      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
        L7_2 = LaserTable
        L7_2[L6_2] = nil
      end
    end
  end
  A0_2.securityLaserKeys = nil
end
function L91_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 then
    return
  end
  L1_2 = type
  L2_2 = A0_2.editorLootPointProps
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = pairs
    L2_2 = A0_2.editorLootPointProps
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      if L6_2 then
        L7_2 = DoesEntityExist
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L7_2 = DeleteEntity
          L8_2 = L6_2
          L7_2(L8_2)
        end
      end
    end
  end
  A0_2.editorLootPointProps = nil
  L1_2 = L90_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = A0_2.securityKeypadEntity
  if L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2.securityKeypadEntity
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = A0_2.securityKeypadEntity
      L1_2(L2_2)
    end
  end
  A0_2.securityKeypadEntity = nil
  L1_2 = A0_2.homeOwnerPed
  if L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2.homeOwnerPed
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = DeleteEntity
      L2_2 = A0_2.homeOwnerPed
      L1_2(L2_2)
    end
  end
  A0_2.homeOwnerPed = nil
end
function L92_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = ClearPedTasksImmediately
  L6_2 = A0_2
  L5_2(L6_2)
  L5_2 = TaskStartScenarioInPlace
  L6_2 = A0_2
  L7_2 = "WORLD_HUMAN_BUM_SLUMPED"
  L8_2 = 0
  L9_2 = true
  L5_2(L6_2, L7_2, L8_2, L9_2)
  if A3_2 then
    L5_2 = Wait
    L6_2 = 0
    L5_2(L6_2)
    L5_2 = SetEntityCoordsNoOffset
    L6_2 = A0_2
    L7_2 = A3_2.x
    L8_2 = A3_2.y
    L9_2 = A3_2.z
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    if nil ~= A4_2 then
      L5_2 = SetEntityHeading
      L6_2 = A0_2
      L7_2 = tonumber
      L8_2 = A4_2
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = 0.0
      end
      L5_2(L6_2, L7_2)
    end
  end
end
function L93_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if not A1_2 then
    L2_2 = nil
    return L2_2
  end
  L2_2 = L58_1
  L3_2 = A0_2 or L3_2
  if A0_2 then
    L3_2 = A0_2.stance
  end
  L2_2 = L2_2(L3_2)
  if "sleeping" == L2_2 then
    L3_2 = vector3
    L4_2 = A1_2.x
    L5_2 = A1_2.y
    L6_2 = A1_2.z
    L7_2 = L22_1
    L6_2 = L6_2 + L7_2
    return L3_2(L4_2, L5_2, L6_2)
  end
  return A1_2
end
function L94_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 and 0 ~= A0_2 then
    L4_2 = DoesEntityExist
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L4_2 = L58_1
  L5_2 = A1_2 or L5_2
  if A1_2 then
    L5_2 = A1_2.stance
  end
  L4_2 = L4_2(L5_2)
  L5_2 = ClearPedTasksImmediately
  L6_2 = A0_2
  L5_2(L6_2)
  L5_2 = SetBlockingOfNonTemporaryEvents
  L6_2 = A0_2
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = SetPedCanRagdoll
  L6_2 = A0_2
  L7_2 = false
  L5_2(L6_2, L7_2)
  L5_2 = SetEntityInvincible
  L6_2 = A0_2
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = SetEntityCollision
  L6_2 = A0_2
  L7_2 = true
  L8_2 = true
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = FreezeEntityPosition
  L6_2 = A0_2
  L7_2 = false
  L5_2(L6_2, L7_2)
  if "standing" == L4_2 then
    L5_2 = TaskStandStill
    L6_2 = A0_2
    L7_2 = -1
    L5_2(L6_2, L7_2)
    L5_2 = FreezeEntityPosition
    L6_2 = A0_2
    L7_2 = true
    L5_2(L6_2, L7_2)
    return
  end
  L5_2 = L92_1
  L6_2 = A0_2
  L7_2 = A1_2 or L7_2
  if A1_2 then
    L7_2 = A1_2.animDict
  end
  L8_2 = A1_2 or L8_2
  if A1_2 then
    L8_2 = A1_2.animAction
  end
  L9_2 = A2_2
  L10_2 = A3_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = FreezeEntityPosition
  L6_2 = A0_2
  L7_2 = true
  L5_2(L6_2, L7_2)
end
function L95_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = "HOUSE_HOMEOWNER"
  L1_2 = GetHashKey
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  L2_2 = DoesRelationshipGroupExist
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = AddRelationshipGroup
    L3_2 = L0_2
    L2_2(L3_2)
    L2_2 = GetHashKey
    L3_2 = L0_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  L2_2 = SetRelationshipBetweenGroups
  L3_2 = 1
  L4_2 = L1_2
  L5_2 = L1_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SetRelationshipBetweenGroups
  L3_2 = 5
  L4_2 = L1_2
  L5_2 = GetHashKey
  L6_2 = "PLAYER"
  L5_2, L6_2 = L5_2(L6_2)
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = SetRelationshipBetweenGroups
  L3_2 = 5
  L4_2 = GetHashKey
  L5_2 = "PLAYER"
  L4_2 = L4_2(L5_2)
  L5_2 = L1_2
  L2_2(L3_2, L4_2, L5_2)
  return L1_2
end
PugGetHouseHomeOwnerRelationshipGroup = L95_1
function L95_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  if A0_2 and 0 ~= A0_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_12
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_12::
  L1_2 = FreezeEntityPosition
  L2_2 = A0_2
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityInvincible
  L2_2 = A0_2
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = SetEntityCollision
  L2_2 = A0_2
  L3_2 = true
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetBlockingOfNonTemporaryEvents
  L2_2 = A0_2
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = SetPedCanRagdoll
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetPedAsEnemy
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetPedSeeingRange
  L2_2 = A0_2
  L3_2 = 200.0
  L1_2(L2_2, L3_2)
  L1_2 = SetPedHearingRange
  L2_2 = A0_2
  L3_2 = 200.0
  L1_2(L2_2, L3_2)
  L1_2 = SetPedAlertness
  L2_2 = A0_2
  L3_2 = 3
  L1_2(L2_2, L3_2)
  L1_2 = SetPedRelationshipGroupHash
  L2_2 = A0_2
  L3_2 = PugGetHouseHomeOwnerRelationshipGroup
  L3_2, L4_2 = L3_2()
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetPedCombatAttributes
  L2_2 = A0_2
  L3_2 = 0
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetPedCombatAttributes
  L2_2 = A0_2
  L3_2 = 5
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetPedCombatAttributes
  L2_2 = A0_2
  L3_2 = 46
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetPedCombatAttributes
  L2_2 = A0_2
  L3_2 = 50
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetPedFleeAttributes
  L2_2 = A0_2
  L3_2 = 0
  L4_2 = false
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = SetPedCombatAbility
  L2_2 = A0_2
  L3_2 = 2
  L1_2(L2_2, L3_2)
  L1_2 = SetPedCombatMovement
  L2_2 = A0_2
  L3_2 = 3
  L1_2(L2_2, L3_2)
  L1_2 = SetPedCombatRange
  L2_2 = A0_2
  L3_2 = 0
  L1_2(L2_2, L3_2)
  L1_2 = SetPedTargetLossResponse
  L2_2 = A0_2
  L3_2 = 1
  L1_2(L2_2, L3_2)
  L1_2 = SetPedKeepTask
  L2_2 = A0_2
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = SetCurrentPedWeapon
  L2_2 = A0_2
  L3_2 = GetHashKey
  L4_2 = "WEAPON_UNARMED"
  L3_2 = L3_2(L4_2)
  L4_2 = true
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = true
  return L1_2
end
PugPrepareHouseHomeOwnerForCombat = L95_1
function L95_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  if not A0_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = A0_2.homeOwnerPed
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  if L2_2 then
    L4_2 = DoesEntityExist
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L4_2 = IsPedDeadOrDying
      L5_2 = L2_2
      L6_2 = true
      L4_2 = L4_2(L5_2, L6_2)
      if not L4_2 then
        goto lbl_23
      end
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_23::
  if L3_2 and 0 ~= L3_2 then
    L4_2 = IsPedDeadOrDying
    L5_2 = L3_2
    L6_2 = true
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_35
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_35::
  L4_2 = PugPrepareHouseHomeOwnerForCombat
  L5_2 = L2_2
  L4_2(L5_2)
  L4_2 = GetEntityCoords
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  L5_2 = GetEntityCoords
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  L6_2 = L4_2 - L5_2
  L6_2 = #L6_2
  L7_2 = type
  L8_2 = SetPedHeadingToFaceVector
  L7_2 = L7_2(L8_2)
  if "function" == L7_2 then
    L7_2 = SetPedHeadingToFaceVector
    L8_2 = L2_2
    L9_2 = L5_2
    L7_2(L8_2, L9_2)
  end
  if true == A1_2 then
    L7_2 = ClearPedTasks
    L8_2 = L2_2
    L7_2(L8_2)
    L7_2 = TaskGoStraightToCoord
    L8_2 = L2_2
    L9_2 = L5_2.x
    L10_2 = L5_2.y
    L11_2 = L5_2.z
    L12_2 = 2.4
    L13_2 = 1250
    L14_2 = GetEntityHeading
    L15_2 = L3_2
    L14_2 = L14_2(L15_2)
    L15_2 = 0.2
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  else
    L7_2 = TaskCombatPed
    L8_2 = L2_2
    L9_2 = L3_2
    L10_2 = 0
    L11_2 = 16
    L7_2(L8_2, L9_2, L10_2, L11_2)
  end
  L7_2 = SetPedKeepTask
  L8_2 = L2_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = true
  L8_2 = L6_2
  L9_2 = L4_2
  return L7_2, L8_2, L9_2
end
PugCommandHouseHomeOwnerAttack = L95_1
function L95_1(A0_2)
  local L1_2, L2_2
  if A0_2 then
    L1_2 = A0_2.homeOwnerAttackThreadRunning
    if true ~= L1_2 then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  A0_2.homeOwnerAttackThreadRunning = true
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = 0
    L1_3 = nil
    while true do
      L2_3 = L4_1
      L3_3 = A0_2
      if L2_3 ~= L3_3 then
        break
      end
      L2_3 = A0_2.homeOwnerAwake
      if true ~= L2_3 then
        break
      end
      L2_3 = L0_3 >= 3
      L3_3 = PugCommandHouseHomeOwnerAttack
      L4_3 = A0_2
      L5_3 = L2_3
      L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
      if not L3_3 then
        break
      end
      if L2_3 then
        L0_3 = 0
      else
        if L1_3 and L4_3 then
          L6_3 = 2.4
          if L4_3 > L6_3 and L5_3 then
            L6_3 = L5_3 - L1_3
            L6_3 = #L6_3
            L7_3 = 0.08
            if L6_3 < L7_3 then
              L0_3 = L0_3 + 1
          end
        end
        else
          L0_3 = 0
        end
      end
      L1_3 = L5_3
      L6_3 = Wait
      L7_3 = 750
      L6_3(L7_3)
    end
    L2_3 = L4_1
    L3_3 = A0_2
    if L2_3 == L3_3 then
      A0_2.homeOwnerAttackThreadRunning = false
    end
  end
  L1_2(L2_2)
end
PugStartHouseHomeOwnerAttackThread = L95_1
function L95_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L1_2 = A0_2.homeOwnerAwake
    if true ~= L1_2 then
      goto lbl_16
    end
  end
  if A0_2 then
    L1_2 = A0_2.homeOwnerAwake
    if true == L1_2 then
      L1_2 = PugStartHouseHomeOwnerAttackThread
      L2_2 = A0_2
      L1_2(L2_2)
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_16::
  L1_2 = A0_2.homeOwnerPed
  if L1_2 then
    L2_2 = DoesEntityExist
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_26
    end
  end
  L2_2 = false
  do return L2_2 end
  ::lbl_26::
  A0_2.homeOwnerAwake = true
  L2_2 = ClearPedTasksImmediately
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = PugPrepareHouseHomeOwnerForCombat
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = TaskCombatPed
  L3_2 = L1_2
  L4_2 = PlayerPedId
  L4_2 = L4_2()
  L5_2 = 0
  L6_2 = 16
  L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = PugStartHouseHomeOwnerAttackThread
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = true
  return L2_2
end
function L96_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 then
    L4_2 = A0_2.instance
    if L4_2 and A1_2 and 0 ~= A1_2 then
      L4_2 = DoesEntityExist
      L5_2 = A1_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        goto lbl_16
      end
    end
  end
  do return end
  ::lbl_16::
  L4_2 = type
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  if "table" ~= L4_2 or not A3_2 then
    L4_2 = {}
    A3_2 = L4_2
  end
  L4_2 = type
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if "table" ~= L4_2 or not A2_2 then
    L4_2 = {}
    A2_2 = L4_2
  end
  L4_2 = L69_1
  L5_2 = A3_2.coords
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = A3_2.coords
    if L4_2 then
      goto lbl_45
    end
  end
  L4_2 = A2_2.coords
  ::lbl_45::
  L5_2 = L69_1
  L6_2 = L4_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L5_2 = L68_1
  L6_2 = L4_2
  L7_2 = A0_2.instance
  L5_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    return
  end
  L6_2 = L56_1
  L7_2 = A3_2.heading
  L8_2 = A2_2.heading
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = SetEntityAsMissionEntity
  L8_2 = A1_2
  L9_2 = true
  L10_2 = true
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = SetEntityCoordsNoOffset
  L8_2 = A1_2
  L9_2 = L5_2.x
  L10_2 = L5_2.y
  L11_2 = L5_2.z
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L7_2 = SetEntityRotation
  L8_2 = A1_2
  L9_2 = 0.0
  L10_2 = 0.0
  L11_2 = L6_2
  L12_2 = 2
  L13_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2 = SetEntityHeading
  L8_2 = A1_2
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = SetEntityInvincible
  L8_2 = A1_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = SetEntityCollision
  L8_2 = A1_2
  L9_2 = false
  L10_2 = false
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = FreezeEntityPosition
  L8_2 = A1_2
  L9_2 = true
  L7_2(L8_2, L9_2)
end
function L97_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  if A0_2 then
    L1_2 = A0_2.instance
    if L1_2 then
      L1_2 = A0_2.instance
      L1_2 = L1_2.spawn
      if L1_2 then
        goto lbl_11
      end
    end
  end
  do return end
  ::lbl_11::
  L1_2 = L91_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = type
  L2_2 = A0_2.preset
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.preset
    if L1_2 then
      goto lbl_24
    end
  end
  L1_2 = {}
  ::lbl_24::
  L2_2 = type
  L3_2 = L1_2.securitySystem
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = L1_2.securitySystem
    if L2_2 then
      goto lbl_34
    end
  end
  L2_2 = {}
  ::lbl_34::
  L3_2 = type
  L4_2 = L2_2.keypad
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = L2_2.keypad
    if L3_2 then
      goto lbl_43
    end
  end
  L3_2 = nil
  ::lbl_43::
  L4_2 = L2_2.isPlaced
  if true == L4_2 and L3_2 then
    L4_2 = L3_2.placed
    if false ~= L4_2 then
      L4_2 = L69_1
      L5_2 = L3_2.coords
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L4_2 = L59_1
        L5_2 = L3_2.prop
        if not L5_2 then
          L5_2 = "prop_ld_keypad_01b"
        end
        L4_2 = L4_2(L5_2)
        if L4_2 then
          L5_2 = L68_1
          L6_2 = L3_2.coords
          L7_2 = A0_2.instance
          L5_2 = L5_2(L6_2, L7_2)
          L6_2 = CreateObjectNoOffset
          L7_2 = L4_2
          L8_2 = L5_2.x
          L9_2 = L5_2.y
          L10_2 = L5_2.z
          L11_2 = false
          L12_2 = false
          L13_2 = false
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
          if 0 == L6_2 then
            L7_2 = CreateObject
            L8_2 = L4_2
            L9_2 = L5_2.x
            L10_2 = L5_2.y
            L11_2 = L5_2.z
            L12_2 = false
            L13_2 = false
            L14_2 = false
            L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
            L6_2 = L7_2
          end
          if 0 ~= L6_2 then
            L7_2 = DoesEntityExist
            L8_2 = L6_2
            L7_2 = L7_2(L8_2)
            if L7_2 then
              L7_2 = L96_1
              L8_2 = A0_2
              L9_2 = L6_2
              L10_2 = L2_2
              L11_2 = L3_2
              L7_2(L8_2, L9_2, L10_2, L11_2)
              A0_2.securityKeypadEntity = L6_2
            end
          end
          L7_2 = SetModelAsNoLongerNeeded
          L8_2 = L4_2
          L7_2(L8_2)
        end
      end
    end
  end
  L4_2 = L2_2.isPlaced
  if true == L4_2 then
    L4_2 = A0_2.securityDisabled
    if true ~= L4_2 then
      L4_2 = type
      L5_2 = LaserTable
      L4_2 = L4_2(L5_2)
      if "table" == L4_2 then
        L4_2 = type
        L5_2 = L2_2.lasers
        L4_2 = L4_2(L5_2)
        if "table" == L4_2 then
          L4_2 = {}
          A0_2.securityLaserKeys = L4_2
          L4_2 = L43_1
          L5_2 = A0_2.assetTag
          if not L5_2 then
            L5_2 = A0_2.animationSyncId
            if not L5_2 then
              L5_2 = A0_2.cacheKey
              if not L5_2 then
                L5_2 = "house_assets_"
                L6_2 = tostring
                L7_2 = GetGameTimer
                L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L7_2()
                L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
                L5_2 = L5_2 .. L6_2
              end
            end
          end
          L4_2 = L4_2(L5_2)
          L5_2 = ipairs
          L6_2 = L2_2.lasers
          L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
          for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do
            L11_2 = L68_1
            L12_2 = L10_2.startVector
            L13_2 = A0_2.instance
            L11_2 = L11_2(L12_2, L13_2)
            L12_2 = L68_1
            L13_2 = L10_2.endVector
            L14_2 = A0_2.instance
            L12_2 = L12_2(L13_2, L14_2)
            if L11_2 and L12_2 then
              L13_2 = type
              L14_2 = L10_2.movement
              L13_2 = L13_2(L14_2)
              if "table" == L13_2 then
                L13_2 = L10_2.movement
                if L13_2 then
                  goto lbl_168
                end
              end
              L13_2 = {}
              ::lbl_168::
              L14_2 = L43_1
              L15_2 = L13_2.direction
              if not L15_2 then
                L15_2 = "none"
              end
              L14_2 = L14_2(L15_2)
              L15_2 = "%s_laser_%s"
              L16_2 = L15_2
              L15_2 = L15_2.format
              L17_2 = L4_2
              L18_2 = L9_2
              L15_2 = L15_2(L16_2, L17_2, L18_2)
              L16_2 = LaserTable
              L17_2 = {}
              L17_2.start = L11_2
              L17_2.endPos = L12_2
              L18_2 = {}
              L18_2.r = 255
              L18_2.g = 0
              L18_2.b = 0
              L18_2.a = 255
              L17_2.color = L18_2
              L18_2 = tonumber
              L19_2 = L10_2.intensity
              L18_2 = L18_2(L19_2)
              if not L18_2 then
                L18_2 = 100
              end
              L18_2 = L18_2 + 2
              L17_2.damage = L18_2
              L17_2.Heist = L4_2
              L18_2 = {}
              L19_2 = L14_2 or L19_2
              if "" == L14_2 or not L14_2 then
                L19_2 = "none"
              end
              L18_2.direction = L19_2
              L19_2 = tonumber
              L20_2 = L13_2.amount
              L19_2 = L19_2(L20_2)
              if not L19_2 then
                L19_2 = 0.0
              end
              L18_2.amount = L19_2
              L17_2.movement = L18_2
              L18_2 = tonumber
              L19_2 = L13_2.speed
              L18_2 = L18_2(L19_2)
              if not L18_2 then
                L18_2 = 0.007
              end
              L17_2.speed = L18_2
              L17_2.directionState = 1
              L17_2.initialStart = L11_2
              L17_2.initialEnd = L12_2
              L17_2.stepId = L9_2
              L16_2[L15_2] = L17_2
              L16_2 = A0_2.securityLaserKeys
              L17_2 = A0_2.securityLaserKeys
              L17_2 = #L17_2
              L17_2 = L17_2 + 1
              L16_2[L17_2] = L15_2
            end
          end
        end
      end
    end
  end
  L4_2 = type
  L5_2 = L1_2.homeOwner
  L4_2 = L4_2(L5_2)
  if "table" == L4_2 then
    L4_2 = L1_2.homeOwner
    if L4_2 then
      goto lbl_247
    end
  end
  L4_2 = nil
  ::lbl_247::
  if L4_2 then
    L5_2 = L4_2.isPlaced
    if true == L5_2 then
      L5_2 = L69_1
      L6_2 = L4_2.coords
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L5_2 = L4_2.model
        if not L5_2 then
          L5_2 = "mp_m_freemode_01"
        end
        L6_2 = A0_2.randomizeHomeOwnerModel
        if true == L6_2 then
          L6_2 = L67_1
          L7_2 = L5_2
          L6_2 = L6_2(L7_2)
          L5_2 = L6_2
        end
        L6_2 = L59_1
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L7_2 = L68_1
          L8_2 = L4_2.coords
          L9_2 = A0_2.instance
          L7_2 = L7_2(L8_2, L9_2)
          L8_2 = L93_1
          L9_2 = L4_2
          L10_2 = L7_2
          L8_2 = L8_2(L9_2, L10_2)
          L9_2 = CreatePed
          L10_2 = 4
          L11_2 = L6_2
          L12_2 = L7_2.x
          L13_2 = L7_2.y
          L14_2 = L7_2.z
          L15_2 = tonumber
          L16_2 = L4_2.heading
          L15_2 = L15_2(L16_2)
          if not L15_2 then
            L15_2 = 0.0
          end
          L16_2 = false
          L17_2 = false
          L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
          if 0 ~= L9_2 then
            L10_2 = SetEntityAsMissionEntity
            L11_2 = L9_2
            L12_2 = true
            L13_2 = true
            L10_2(L11_2, L12_2, L13_2)
            L10_2 = SetEntityCoordsNoOffset
            L11_2 = L9_2
            L12_2 = L8_2.x
            L13_2 = L8_2.y
            L14_2 = L8_2.z
            L15_2 = false
            L16_2 = false
            L17_2 = false
            L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
            L10_2 = SetEntityHeading
            L11_2 = L9_2
            L12_2 = tonumber
            L13_2 = L4_2.heading
            L12_2 = L12_2(L13_2)
            if not L12_2 then
              L12_2 = 0.0
            end
            L10_2(L11_2, L12_2)
            L10_2 = L94_1
            L11_2 = L9_2
            L12_2 = L4_2
            L13_2 = L8_2
            L14_2 = tonumber
            L15_2 = L4_2.heading
            L14_2 = L14_2(L15_2)
            if not L14_2 then
              L14_2 = 0.0
            end
            L10_2(L11_2, L12_2, L13_2, L14_2)
            A0_2.homeOwnerPed = L9_2
          end
          L10_2 = SetModelAsNoLongerNeeded
          L11_2 = L6_2
          L10_2(L11_2)
        end
      end
    end
  end
end
function L98_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L1_2 = A0_2.disturbanceTriggered
    if true ~= L1_2 then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  A0_2.disturbanceTriggered = true
  L1_2 = L12_1
  A0_2.disturbanceLevel = L1_2
  L1_2 = L75_1
  L2_2 = A0_2.location
  if not L2_2 then
    L2_2 = {}
  end
  L1_2 = L1_2(L2_2)
  L2_2 = PugGetHouseEntryAlertCoords
  L3_2 = A0_2.location
  L2_2 = L2_2(L3_2)
  L1_2.alertCoords = L2_2
  L2_2 = AlertPolice
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = L95_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = Notify
    L4_2 = Config
    L4_2 = L4_2.T
    L5_2 = "HouseNoiseOwnerCalledCops"
    L4_2 = L4_2(L5_2)
    L5_2 = "error"
    L6_2 = 6500
    L3_2(L4_2, L5_2, L6_2)
  else
    L3_2 = Notify
    L4_2 = Config
    L4_2 = L4_2.T
    L5_2 = "HouseNoisePoliceCalled"
    L4_2 = L4_2(L5_2)
    L5_2 = "error"
    L6_2 = 6500
    L3_2(L4_2, L5_2, L6_2)
  end
end
function L99_1(A0_2)
  local L1_2, L2_2
  if not A0_2 then
    return
  end
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    L0_3 = GetGameTimer
    L0_3 = L0_3()
    L1_3 = L86_1
    L2_3 = true
    L3_3 = A0_2.disturbanceLevel
    if not L3_3 then
      L3_3 = 0.0
    end
    L4_3 = true
    L1_3(L2_3, L3_3, L4_3)
    while true do
      L1_3 = L4_1
      L2_3 = A0_2
      if L1_3 ~= L2_3 then
        break
      end
      L1_3 = GetGameTimer
      L1_3 = L1_3()
      L2_3 = L1_3 - L0_3
      L3_3 = L13_1
      if L2_3 >= L3_3 then
        L2_3 = math
        L2_3 = L2_3.max
        L3_3 = 0.001
        L4_3 = L1_3 - L0_3
        L4_3 = L4_3 / 1000.0
        L2_3 = L2_3(L3_3, L4_3)
        L0_3 = L1_3
        L3_3 = PlayerPedId
        L3_3 = L3_3()
        L4_3 = GetEntitySpeed
        L5_3 = L3_3
        L4_3 = L4_3(L5_3)
        L5_3 = L15_1
        L5_3 = L4_3 >= L5_3
        L6_3 = L83_1
        L7_3 = L3_3
        L6_3 = L6_3(L7_3)
        L7_3 = 0.0
        L8_3 = type
        L9_3 = A0_2.preset
        L8_3 = L8_3(L9_3)
        if "table" == L8_3 then
          L8_3 = type
          L9_3 = A0_2.preset
          L9_3 = L9_3.homeOwner
          L8_3 = L8_3(L9_3)
          if "table" == L8_3 then
            L8_3 = A0_2.preset
            L8_3 = L8_3.homeOwner
            if L8_3 then
              goto lbl_61
            end
          end
        end
        L8_3 = nil
        ::lbl_61::
        if L8_3 then
          L9_3 = L58_1
          L10_3 = L8_3.stance
          L9_3 = L9_3(L10_3)
          if "standing" == L9_3 then
            L9_3 = A0_2.homeOwnerAwake
            if true ~= L9_3 then
              L9_3 = A0_2.homeOwnerPed
              if L9_3 then
                L10_3 = DoesEntityExist
                L11_3 = L9_3
                L10_3 = L10_3(L11_3)
                if L10_3 then
                  L10_3 = GetEntityCoords
                  L11_3 = L9_3
                  L10_3 = L10_3(L11_3)
                  L11_3 = GetEntityCoords
                  L12_3 = L3_3
                  L11_3 = L11_3(L12_3)
                  L12_3 = L11_3 - L10_3
                  L12_3 = #L12_3
                  if L12_3 <= 7.0 then
                    L12_3 = L95_1
                    L13_3 = A0_2
                    L12_3 = L12_3(L13_3)
                    if L12_3 then
                      L12_3 = Notify
                      L13_3 = Config
                      L13_3 = L13_3.T
                      L14_3 = "HomeOwnerSpotted"
                      L13_3 = L13_3(L14_3)
                      L14_3 = "error"
                      L15_3 = 4500
                      L12_3(L13_3, L14_3, L15_3)
                    end
                  end
                end
              end
            end
          end
        end
        L9_3 = IsPedJumping
        L10_3 = L3_3
        L9_3 = L9_3(L10_3)
        if not L9_3 then
          L9_3 = IsPedVaulting
          L10_3 = L3_3
          L9_3 = L9_3(L10_3)
          if not L9_3 then
            goto lbl_118
          end
        end
        L9_3 = L20_1
        L9_3 = L9_3 * L2_3
        L7_3 = L7_3 + L9_3
        ::lbl_118::
        if L5_3 and not L6_3 then
          L9_3 = L17_1
          L9_3 = L9_3 * L2_3
          L7_3 = L7_3 + L9_3
        end
        L9_3 = IsPedSprinting
        L10_3 = L3_3
        L9_3 = L9_3(L10_3)
        if not L9_3 then
          L9_3 = 4.6
          if not (L4_3 >= L9_3) then
            goto lbl_141
          end
        end
        L9_3 = L19_1
        L9_3 = L9_3 * L2_3
        L7_3 = L7_3 + L9_3
        goto lbl_160
        ::lbl_141::
        L9_3 = IsPedRunning
        L10_3 = L3_3
        L9_3 = L9_3(L10_3)
        if not L9_3 then
          L9_3 = L16_1
          if not (L4_3 >= L9_3) then
            goto lbl_155
          end
        end
        L9_3 = L18_1
        L9_3 = L9_3 * L2_3
        L7_3 = L7_3 + L9_3
        goto lbl_160
        ::lbl_155::
        L9_3 = L14_1
        L9_3 = L9_3 * L2_3
        L7_3 = L7_3 - L9_3
        ::lbl_160::
        L9_3 = math
        L9_3 = L9_3.min
        L10_3 = L12_1
        L11_3 = math
        L11_3 = L11_3.max
        L12_3 = 0.0
        L13_3 = tonumber
        L14_3 = A0_2.disturbanceLevel
        L13_3 = L13_3(L14_3)
        if not L13_3 then
          L13_3 = 0.0
        end
        L13_3 = L13_3 + L7_3
        L11_3, L12_3, L13_3, L14_3, L15_3 = L11_3(L12_3, L13_3)
        L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)
        A0_2.disturbanceLevel = L9_3
        L9_3 = A0_2.disturbanceLevel
        L10_3 = L12_1
        if L9_3 >= L10_3 then
          L9_3 = A0_2.disturbanceTriggered
          if true ~= L9_3 then
            L9_3 = L98_1
            L10_3 = A0_2
            L9_3(L10_3)
          end
        end
        L9_3 = L86_1
        L10_3 = true
        L11_3 = A0_2.disturbanceLevel
        if not L11_3 then
          L11_3 = 0.0
        end
        L12_3 = false
        L9_3(L10_3, L11_3, L12_3)
      end
      L2_3 = Wait
      L3_3 = 0
      L2_3(L3_3)
    end
    L1_3 = L86_1
    L2_3 = false
    L3_3 = 0.0
    L4_3 = true
    L1_3(L2_3, L3_3, L4_3)
  end
  L1_2(L2_2)
end
function L100_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = L88_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L34_1
  L4_2 = L2_2
  L3_2(L4_2)
  L3_2 = L3_1
  L3_2[L2_2] = nil
end
function L101_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L87_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L34_1
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = L3_1
  L2_2[L1_2] = nil
end
function L102_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    return
  end
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:server:ReleaseHouseBreakInLock"
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end
function L103_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" ~= L1_2 then
    L2_2 = Config
    L2_2 = L2_2.FrameworkFunctions
    if L2_2 then
      L2_2 = Config
      L2_2 = L2_2.FrameworkFunctions
      L2_2 = L2_2.TriggerCallback
      if L2_2 then
        goto lbl_18
      end
    end
  end
  L2_2 = false
  L3_2 = "invalid"
  do return L2_2, L3_2 end
  ::lbl_18::
  L2_2 = nil
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.TriggerCallback
  L4_2 = "Pug:server:TryBeginHouseBreakIn"
  function L5_2(A0_3, A1_3, A2_3, A3_3)
    local L4_3, L5_3, L6_3
    L4_3 = {}
    L5_3 = true == A0_3
    L4_3.allowed = L5_3
    L5_3 = tostring
    L6_3 = A1_3 or L6_3
    if not A1_3 then
      L6_3 = ""
    end
    L5_3 = L5_3(L6_3)
    L4_3.reason = L5_3
    L5_3 = tonumber
    L6_3 = A2_3
    L5_3 = L5_3(L6_3)
    if not L5_3 then
      L5_3 = 0
    end
    L4_3.requiredXp = L5_3
    L5_3 = tonumber
    L6_3 = A3_3
    L5_3 = L5_3(L6_3)
    if not L5_3 then
      L5_3 = 0
    end
    L4_3.currentXp = L5_3
    L2_2 = L4_3
  end
  L6_2 = L1_2
  L3_2(L4_2, L5_2, L6_2)
  while nil == L2_2 do
    L3_2 = Wait
    L4_2 = 50
    L3_2(L4_2)
  end
  L3_2 = L2_2.allowed
  L4_2 = L2_2.reason
  L5_2 = L2_2.requiredXp
  L6_2 = L2_2.currentXp
  return L3_2, L4_2, L5_2, L6_2
end
function L104_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = L43_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = L43_1
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L6_2 = L43_1
  L7_2 = A2_2
  L6_2 = L6_2(L7_2)
  L7_2 = tonumber
  L8_2 = A3_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 0
  end
  if "" ~= L4_2 and "" ~= L5_2 and "" ~= L6_2 and not (L7_2 <= 0) then
    L8_2 = Config
    L8_2 = L8_2.FrameworkFunctions
    if L8_2 then
      L8_2 = Config
      L8_2 = L8_2.FrameworkFunctions
      L8_2 = L8_2.TriggerCallback
      if L8_2 then
        goto lbl_37
      end
    end
  end
  L8_2 = false
  L9_2 = "invalid"
  L10_2 = nil
  do return L8_2, L9_2, L10_2 end
  ::lbl_37::
  L8_2 = nil
  L9_2 = Config
  L9_2 = L9_2.FrameworkFunctions
  L9_2 = L9_2.TriggerCallback
  L10_2 = "Pug:server:CreateOpenHouseRobberyState"
  function L11_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3
    L3_3 = {}
    L4_3 = true == A0_3
    L3_3.success = L4_3
    L4_3 = tostring
    L5_3 = A1_3 or L5_3
    if not A1_3 then
      L5_3 = ""
    end
    L4_3 = L4_3(L5_3)
    L3_3.reason = L4_3
    L3_3.state = A2_3
    L8_2 = L3_3
  end
  L12_2 = L4_2
  L13_2 = L5_2
  L14_2 = L6_2
  L15_2 = L7_2
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  while nil == L8_2 do
    L9_2 = Wait
    L10_2 = 50
    L9_2(L10_2)
  end
  L9_2 = L8_2.success
  if L9_2 then
    L9_2 = type
    L10_2 = L8_2.state
    L9_2 = L9_2(L10_2)
    if "table" == L9_2 then
      L9_2 = L76_1
      L10_2 = {}
      L11_2 = L8_2.state
      L10_2[L4_2] = L11_2
      L9_2 = L9_2(L10_2)
      L10_2 = L9_2[L4_2]
      if L10_2 then
        L10_2 = L1_1
        L11_2 = L9_2[L4_2]
        L10_2[L4_2] = L11_2
        L10_2 = L9_2[L4_2]
        L8_2.state = L10_2
      end
    end
  end
  L9_2 = L8_2.success
  L10_2 = L8_2.reason
  L11_2 = L8_2.state
  return L9_2, L10_2, L11_2
end
function L105_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L2_2 = false
    L3_2 = "invalid"
    L4_2 = 0
    return L2_2, L3_2, L4_2
  end
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  if L2_2 then
    L2_2 = Config
    L2_2 = L2_2.FrameworkFunctions
    L2_2 = L2_2.TriggerCallback
    if L2_2 then
      goto lbl_23
    end
  end
  L2_2 = false
  L3_2 = "callback_missing"
  L4_2 = 0
  do return L2_2, L3_2, L4_2 end
  ::lbl_23::
  L2_2 = nil
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.TriggerCallback
  L4_2 = "Pug:server:EnterHouseRoutingBucket"
  function L5_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3
    L3_3 = {}
    L4_3 = true == A0_3
    L3_3.success = L4_3
    L4_3 = tostring
    L5_3 = A1_3 or L5_3
    if not A1_3 then
      L5_3 = ""
    end
    L4_3 = L4_3(L5_3)
    L3_3.reason = L4_3
    L4_3 = tonumber
    L5_3 = A2_3
    L4_3 = L4_3(L5_3)
    if not L4_3 then
      L4_3 = 0
    end
    L3_3.bucket = L4_3
    L2_2 = L3_3
  end
  L6_2 = L1_2
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  while nil == L2_2 do
    L4_2 = GetGameTimer
    L4_2 = L4_2()
    L4_2 = L4_2 - L3_2
    L5_2 = 5000
    if not (L4_2 < L5_2) then
      break
    end
    L4_2 = Wait
    L5_2 = 50
    L4_2(L5_2)
  end
  if not L2_2 then
    L4_2 = false
    L5_2 = "timeout"
    L6_2 = 0
    return L4_2, L5_2, L6_2
  end
  L4_2 = L2_2.success
  L5_2 = L2_2.reason
  L6_2 = L2_2.bucket
  return L4_2, L5_2, L6_2
end
function L106_1()
  local L0_2, L1_2
  L0_2 = TriggerServerEvent
  L1_2 = "Pug:server:LeaveHouseRoutingBucket"
  L0_2(L1_2)
end
function L107_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = L43_1
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = A1_2
  L4_2 = L4_2(L5_2)
  if "" == L3_2 or not L4_2 then
    return
  end
  L5_2 = TriggerServerEvent
  L6_2 = "Pug:server:ReleaseOpenHouseLootPointLock"
  L7_2 = L3_2
  L8_2 = L4_2
  L9_2 = true == A2_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
end
function L108_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L43_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "" == L2_2 then
    return
  end
  L3_2 = TriggerServerEvent
  L4_2 = "Pug:server:ReleaseOpenHouseSecurityLock"
  L5_2 = L2_2
  L6_2 = true == A1_2
  L3_2(L4_2, L5_2, L6_2)
end
function L109_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = L43_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if "" ~= L2_2 and L3_2 then
    L4_2 = Config
    L4_2 = L4_2.FrameworkFunctions
    if L4_2 then
      L4_2 = Config
      L4_2 = L4_2.FrameworkFunctions
      L4_2 = L4_2.TriggerCallback
      if L4_2 then
        goto lbl_23
      end
    end
  end
  L4_2 = false
  L5_2 = "invalid"
  do return L4_2, L5_2 end
  ::lbl_23::
  L4_2 = nil
  L5_2 = Config
  L5_2 = L5_2.FrameworkFunctions
  L5_2 = L5_2.TriggerCallback
  L6_2 = "Pug:server:TryLockOpenHouseLootPoint"
  function L7_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = {}
    L3_3 = true == A0_3
    L2_3.allowed = L3_3
    L3_3 = tostring
    L4_3 = A1_3 or L4_3
    if not A1_3 then
      L4_3 = ""
    end
    L3_3 = L3_3(L4_3)
    L2_3.reason = L3_3
    L4_2 = L2_3
  end
  L8_2 = L2_2
  L9_2 = L3_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
  while nil == L4_2 do
    L5_2 = Wait
    L6_2 = 50
    L5_2(L6_2)
  end
  L5_2 = L4_2.allowed
  L6_2 = L4_2.reason
  return L5_2, L6_2
end
function L110_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" ~= L1_2 then
    L2_2 = Config
    L2_2 = L2_2.FrameworkFunctions
    if L2_2 then
      L2_2 = Config
      L2_2 = L2_2.FrameworkFunctions
      L2_2 = L2_2.TriggerCallback
      if L2_2 then
        goto lbl_18
      end
    end
  end
  L2_2 = false
  L3_2 = "invalid"
  do return L2_2, L3_2 end
  ::lbl_18::
  L2_2 = nil
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.TriggerCallback
  L4_2 = "Pug:server:TryLockOpenHouseSecuritySystem"
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = {}
    L3_3 = true == A0_3
    L2_3.allowed = L3_3
    L3_3 = tostring
    L4_3 = A1_3 or L4_3
    if not A1_3 then
      L4_3 = ""
    end
    L3_3 = L3_3(L4_3)
    L2_3.reason = L3_3
    L2_2 = L2_3
  end
  L6_2 = L1_2
  L3_2(L4_2, L5_2, L6_2)
  while nil == L2_2 do
    L3_2 = Wait
    L4_2 = 50
    L3_2(L4_2)
  end
  L3_2 = L2_2.allowed
  L4_2 = L2_2.reason
  return L3_2, L4_2
end
function L111_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = L4_1
  if L0_2 then
    L0_2 = L4_1.location
    if L0_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L0_2 = L77_1
  L1_2 = L4_1.location
  L1_2 = L1_2.id
  L0_2 = L0_2(L1_2)
  L1_2 = type
  L2_2 = L0_2
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = type
    L2_2 = L0_2.lootedPoints
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      L1_2 = L0_2.lootedPoints
      if L1_2 then
        goto lbl_27
      end
    end
  end
  L1_2 = {}
  ::lbl_27::
  L2_2 = type
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L2_2 = "table" == L2_2
  L3_2 = type
  L4_2 = L0_2
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = L0_2.activeLootPointsSet
    if true == L3_2 then
      L3_2 = type
      L4_2 = L0_2.activeLootPoints
      L3_2 = L3_2(L4_2)
      if "table" == L3_2 then
        L3_2 = L0_2.activeLootPoints
        if L3_2 then
          goto lbl_55
        end
      end
      L3_2 = {}
      ::lbl_55::
      L4_1.activeLootPoints = L3_2
      L4_1.activeLootPointsSet = true
    end
  end
  L3_2 = L82_1
  L4_2 = L4_1
  L3_2(L4_2)
  L3_2 = L4_1.looted
  if not L3_2 then
    L3_2 = {}
  end
  L4_1.looted = L3_2
  L3_2 = L4_1.busyLootPoints
  if not L3_2 then
    L3_2 = {}
  end
  L4_1.busyLootPoints = L3_2
  L3_2 = L4_1.activeLootPointsSet
  if true == L3_2 then
    L3_2 = ipairs
    L4_2 = L4_1.preset
    if L4_2 then
      L4_2 = L4_1.preset
      L4_2 = L4_2.lootPoints
      if L4_2 then
        goto lbl_85
      end
    end
    L4_2 = {}
    ::lbl_85::
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
      L9_2 = L81_1
      L10_2 = L4_1
      L11_2 = L7_2
      L9_2 = L9_2(L10_2, L11_2)
      if not L9_2 then
        L9_2 = L4_1.busyLootPoints
        L9_2[L7_2] = nil
        L9_2 = L100_1
        L10_2 = L4_1.location
        L10_2 = L10_2.id
        L11_2 = L7_2
        L9_2(L10_2, L11_2)
        L9_2 = L4_1.pointProps
        if L9_2 then
          L9_2 = L4_1.pointProps
          L9_2 = L9_2[L7_2]
          if L9_2 then
            L9_2 = L4_1.pointProps
            L9_2 = L9_2[L7_2]
            L10_2 = DoesEntityExist
            L11_2 = L9_2
            L10_2 = L10_2(L11_2)
            if L10_2 then
              L10_2 = SetEntityAsMissionEntity
              L11_2 = L9_2
              L12_2 = true
              L13_2 = true
              L10_2(L11_2, L12_2, L13_2)
              L10_2 = DeleteEntity
              L11_2 = L9_2
              L10_2(L11_2)
            end
            L10_2 = L4_1.pointProps
            L10_2[L7_2] = nil
          end
        end
      end
    end
  end
  L3_2 = pairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    if true == L8_2 then
      L9_2 = tonumber
      L10_2 = L7_2
      L9_2 = L9_2(L10_2)
      if not L9_2 then
        L9_2 = L7_2
      end
      L10_2 = L4_1.preset
      if L10_2 then
        L10_2 = L4_1.preset
        L10_2 = L10_2.lootPoints
        if L10_2 then
          L10_2 = L4_1.preset
          L10_2 = L10_2.lootPoints
          L10_2 = L10_2[L9_2]
          if L10_2 then
            goto lbl_152
          end
        end
      end
      L10_2 = nil
      ::lbl_152::
      L11_2 = L4_1.looted
      L11_2[L9_2] = true
      L11_2 = L4_1.looted
      L12_2 = tostring
      L13_2 = L9_2
      L12_2 = L12_2(L13_2)
      L11_2[L12_2] = true
      L11_2 = L4_1.busyLootPoints
      L11_2[L9_2] = nil
      L11_2 = L4_1.busyLootPoints
      L12_2 = tostring
      L13_2 = L9_2
      L12_2 = L12_2(L13_2)
      L11_2[L12_2] = nil
      L11_2 = L100_1
      L12_2 = L4_1.location
      L12_2 = L12_2.id
      L13_2 = L9_2
      L11_2(L12_2, L13_2)
      if L10_2 then
        L11_2 = L46_1
        L12_2 = L10_2
        L11_2 = L11_2(L12_2)
        if L11_2 then
          L11_2 = L42_1
          if L11_2 then
            L11_2 = L42_1
            L12_2 = L4_1
            L13_2 = L9_2
            L14_2 = L10_2
            L11_2(L12_2, L13_2, L14_2)
          end
        end
      end
    end
  end
  L3_2 = ipairs
  L4_2 = L4_1.preset
  if L4_2 then
    L4_2 = L4_1.preset
    L4_2 = L4_2.lootPoints
    if L4_2 then
      goto lbl_199
    end
  end
  L4_2 = {}
  ::lbl_199::
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L71_1
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      L9_2 = L81_1
      L10_2 = L4_1
      L11_2 = L7_2
      L9_2 = L9_2(L10_2, L11_2)
      if L9_2 then
        L9_2 = L44_1
        L10_2 = L4_1
        L11_2 = L7_2
        L9_2 = L9_2(L10_2, L11_2)
        if not L9_2 then
          L9_2 = L37_1
          L10_2 = L4_1
          L11_2 = L7_2
          L12_2 = L8_2
          L13_2 = true
          L9_2(L10_2, L11_2, L12_2, L13_2)
        end
      end
    end
  end
  if L2_2 then
    L3_2 = L4_1.securityDisabled
    if true ~= L3_2 then
      L4_1.securityDisabled = true
      L4_1.securityBusy = false
      L3_2 = L101_1
      L4_2 = L4_1.location
      L4_2 = L4_2.id
      L3_2(L4_2)
      L3_2 = L90_1
      L4_2 = L4_1
      L3_2(L4_2)
    end
  end
end
function L112_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = ipairs
  L2_2 = L0_1.shells
  if not L2_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L43_1
    L8_2 = L6_2.id
    L7_2 = L7_2(L8_2)
    L8_2 = L43_1
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    if L7_2 == L8_2 then
      return L6_2
    end
  end
end
function L113_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = ipairs
  L2_2 = L0_1.locations
  if not L2_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L43_1
    L8_2 = L6_2.id
    L7_2 = L7_2(L8_2)
    L8_2 = L43_1
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    if L7_2 == L8_2 then
      return L6_2
    end
  end
end
function L114_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = type
  L1_2 = L0_1.settings
  L0_2 = L0_2(L1_2)
  if "table" == L0_2 then
    L0_2 = L0_1.settings
    if L0_2 then
      goto lbl_11
    end
  end
  L0_2 = {}
  ::lbl_11::
  L1_2 = type
  L2_2 = L0_2.missionNpc
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = L0_2.missionNpc
    if L1_2 then
      goto lbl_20
    end
  end
  L1_2 = nil
  ::lbl_20::
  L2_2 = L0_2.missionNpcEnabled
  if true == L2_2 and L1_2 then
    L2_2 = L69_1
    L3_2 = L1_2.coords
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_32
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_32::
  return L1_2
end
function L115_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L114_1
  L0_2 = L0_2()
  if not L0_2 then
    L1_2 = nil
    L10_1 = L1_2
    return
  end
  L1_2 = Config
  L1_2 = L1_2.FrameworkFunctions
  L1_2 = L1_2.TriggerCallback
  L2_2 = "Pug:server:GetHouseRobberyMissionState"
  function L3_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3
    if true == A0_3 then
      L3_3 = type
      L4_3 = A2_3
      L3_3 = L3_3(L4_3)
      if "table" == L3_3 and A2_3 then
        goto lbl_11
        L3_3 = A2_3 or L3_3
      end
    end
    L3_3 = nil
    ::lbl_11::
    L10_1 = L3_3
  end
  L1_2(L2_2, L3_2)
end
function L116_1()
  local L0_2, L1_2, L2_2
  L0_2 = L114_1
  L0_2 = L0_2()
  L1_2 = L43_1
  if L0_2 then
    L2_2 = L0_2.interactionLabel
    if L2_2 then
      goto lbl_10
    end
  end
  L2_2 = ""
  ::lbl_10::
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L1_2 = "Request House Lead"
  end
  return L1_2
end
function L117_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if "missing" == A0_2 then
    L2_2 = Notify
    L3_2 = Config
    L3_2 = L3_2.T
    L4_2 = "HouseMissionTalkToNpc"
    L3_2 = L3_2(L4_2)
    L4_2 = "error"
    L2_2(L3_2, L4_2)
  elseif "expired" == A0_2 then
    L2_2 = Notify
    L3_2 = Config
    L3_2 = L3_2.T
    L4_2 = "HouseLeadExpired"
    L3_2 = L3_2(L4_2)
    L4_2 = "error"
    L2_2(L3_2, L4_2)
  elseif "different" == A0_2 or "different_layout" == A0_2 then
    if A1_2 then
      L2_2 = L43_1
      L3_2 = A1_2.locationLabel
      if not L3_2 then
        L3_2 = A1_2.streetName
      end
      L2_2 = L2_2(L3_2)
      if L2_2 then
        goto lbl_36
      end
    end
    L2_2 = ""
    ::lbl_36::
    if "" ~= L2_2 then
      L3_2 = Notify
      L4_2 = Config
      L4_2 = L4_2.T
      L5_2 = "HouseWrongAssigned"
      L6_2 = L2_2
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = "error"
      L3_2(L4_2, L5_2)
    else
      L3_2 = Notify
      L4_2 = Config
      L4_2 = L4_2.T
      L5_2 = "HouseWrongLead"
      L4_2 = L4_2(L5_2)
      L5_2 = "error"
      L3_2(L4_2, L5_2)
    end
  elseif "invalid" == A0_2 then
    L2_2 = Notify
    L3_2 = Config
    L3_2 = L3_2.T
    L4_2 = "HouseLeadInvalid"
    L3_2 = L3_2(L4_2)
    L4_2 = "error"
    L2_2(L3_2, L4_2)
  else
    L2_2 = Notify
    L3_2 = Config
    L3_2 = L3_2.T
    L4_2 = "HouseNeedValidLead"
    L3_2 = L3_2(L4_2)
    L4_2 = "error"
    L2_2(L3_2, L4_2)
  end
end
function L118_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = L114_1
  L3_2 = L3_2()
  if not L3_2 then
    L4_2 = nil
    L10_1 = L4_2
    L4_2 = true
    L5_2 = nil
    return L4_2, L5_2
  end
  L4_2 = false
  L5_2 = false
  L6_2 = "missing"
  L7_2 = nil
  L8_2 = Config
  L8_2 = L8_2.FrameworkFunctions
  L8_2 = L8_2.TriggerCallback
  L9_2 = "Pug:server:ValidateHouseRobberyMission"
  function L10_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3
    L3_3 = true == A0_3
    L4_2 = L3_3
    L3_3 = tostring
    L4_3 = A1_3 or L4_3
    if not A1_3 then
      L4_3 = "missing"
    end
    L3_3 = L3_3(L4_3)
    L6_2 = L3_3
    L3_3 = type
    L4_3 = A2_3
    L3_3 = L3_3(L4_3)
    L3_3 = A2_3 or L3_3
    if "table" ~= L3_3 or not A2_3 then
      L3_3 = nil
    end
    L7_2 = L3_3
    L3_3 = L7_2
    L10_1 = L3_3
    L3_3 = true
    L5_2 = L3_3
  end
  L11_2 = L43_1
  L12_2 = A0_2
  L11_2 = L11_2(L12_2)
  L12_2 = L43_1
  L13_2 = A1_2
  L12_2 = L12_2(L13_2)
  L13_2 = L43_1
  L14_2 = A2_2
  L13_2, L14_2 = L13_2(L14_2)
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  while not L5_2 do
    L8_2 = Wait
    L9_2 = 50
    L8_2(L9_2)
  end
  if true ~= L4_2 then
    L8_2 = L117_1
    L9_2 = L6_2
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
    L8_2 = false
    L9_2 = L7_2
    return L8_2, L9_2
  end
  L8_2 = true
  L9_2 = L7_2
  return L8_2, L9_2
end
function L119_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = L114_1
  L0_2 = L0_2()
  if not L0_2 then
    L1_2 = Notify
    L2_2 = Config
    L2_2 = L2_2.T
    L3_2 = "HouseMissionNpcNotConfigured"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = Config
  L1_2 = L1_2.FrameworkFunctions
  L1_2 = L1_2.TriggerCallback
  L2_2 = "Pug:server:RequestHouseRobberyMission"
  function L3_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3
    if true == A0_3 then
      L3_3 = type
      L4_3 = A2_3
      L3_3 = L3_3(L4_3)
      if "table" == L3_3 then
        L3_3 = type
        L4_3 = A2_3.coords
        L3_3 = L3_3(L4_3)
        if "table" == L3_3 then
          goto lbl_43
        end
      end
    end
    L3_3 = nil
    L10_1 = L3_3
    if "no_eligible" == A1_3 then
      L3_3 = Notify
      L4_3 = Config
      L4_3 = L4_3.T
      L5_3 = "NoHouseLeadsAvailable"
      L4_3 = L4_3(L5_3)
      L5_3 = "error"
      L3_3(L4_3, L5_3)
    elseif "disabled" == A1_3 then
      L3_3 = Notify
      L4_3 = Config
      L4_3 = L4_3.T
      L5_3 = "HouseMissionsDisabled"
      L4_3 = L4_3(L5_3)
      L5_3 = "error"
      L3_3(L4_3, L5_3)
    else
      L3_3 = Notify
      L4_3 = Config
      L4_3 = L4_3.T
      L5_3 = "HouseLeadNotFound"
      L4_3 = L4_3(L5_3)
      L5_3 = "error"
      L3_3(L4_3, L5_3)
    end
    do return end
    ::lbl_43::
    L10_1 = A2_3
    L3_3 = SetNewWaypoint
    L4_3 = tonumber
    L5_3 = A2_3.coords
    L5_3 = L5_3.x
    L4_3 = L4_3(L5_3)
    if not L4_3 then
      L4_3 = 0.0
    end
    L5_3 = tonumber
    L6_3 = A2_3.coords
    L6_3 = L6_3.y
    L5_3 = L5_3(L6_3)
    if not L5_3 then
      L5_3 = 0.0
    end
    L3_3(L4_3, L5_3)
    L3_3 = L43_1
    L4_3 = A2_3.locationLabel
    if not L4_3 then
      L4_3 = A2_3.streetName
      if not L4_3 then
        L4_3 = Config
        L4_3 = L4_3.T
        L5_3 = "MarkedHouse"
        L4_3 = L4_3(L5_3)
      end
    end
    L3_3 = L3_3(L4_3)
    L4_3 = math
    L4_3 = L4_3.max
    L5_3 = 1
    L6_3 = math
    L6_3 = L6_3.ceil
    L7_3 = tonumber
    L8_3 = A2_3.timeRemaining
    L7_3 = L7_3(L8_3)
    if not L7_3 then
      L7_3 = 0
    end
    L7_3 = L7_3 / 60
    L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3)
    L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)
    if "reused" == A1_3 then
      L5_3 = Notify
      L6_3 = Config
      L6_3 = L6_3.T
      L7_3 = "HouseWaypointRefreshed"
      L8_3 = L3_3
      L9_3 = L4_3
      L6_3 = L6_3(L7_3, L8_3, L9_3)
      L7_3 = "success"
      L8_3 = 6500
      L5_3(L6_3, L7_3, L8_3)
    else
      L5_3 = Notify
      L6_3 = Config
      L6_3 = L6_3.T
      L7_3 = "HouseLeadReceived"
      L8_3 = L3_3
      L9_3 = L4_3
      L6_3 = L6_3(L7_3, L8_3, L9_3)
      L7_3 = "success"
      L8_3 = 6500
      L5_3(L6_3, L7_3, L8_3)
    end
  end
  L1_2(L2_2, L3_2)
end
function L120_1()
  local L0_2, L1_2
  L0_2 = L8_1
  if L0_2 then
    L0_2 = DoesEntityExist
    L1_2 = L8_1
    L0_2 = L0_2(L1_2)
    if L0_2 then
      L0_2 = DeleteEntity
      L1_2 = L8_1
      L0_2(L1_2)
    end
  end
  L0_2 = nil
  L8_1 = L0_2
end
function L121_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = L114_1
  L0_2 = L0_2()
  if not L0_2 then
    return
  end
  L1_2 = L8_1
  if L1_2 then
    L1_2 = DoesEntityExist
    L2_2 = L8_1
    L1_2 = L1_2(L2_2)
    if L1_2 then
      return
    end
  end
  L1_2 = L59_1
  L2_2 = L0_2.model
  if not L2_2 then
    L2_2 = "a_m_y_business_03"
  end
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    return
  end
  L2_2 = L49_1
  L3_2 = L0_2.coords
  L2_2 = L2_2(L3_2)
  L3_2 = CreatePed
  L4_2 = 4
  L5_2 = L1_2
  L6_2 = L2_2.x
  L7_2 = L2_2.y
  L8_2 = L2_2.z
  L8_2 = L8_2 + 1
  L9_2 = L52_1
  L10_2 = L0_2.heading
  L9_2 = L9_2(L10_2)
  L10_2 = false
  L11_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L8_1 = L3_2
  L3_2 = SetEntityCoordsNoOffset
  L4_2 = L8_1
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L7_2 = L7_2 + 1
  L8_2 = false
  L9_2 = false
  L10_2 = false
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L3_2 = SetEntityInvincible
  L4_2 = L8_1
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = FreezeEntityPosition
  L4_2 = L8_1
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetEntityCollision
  L4_2 = L8_1
  L5_2 = true
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = SetBlockingOfNonTemporaryEvents
  L4_2 = L8_1
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SetPedCanRagdoll
  L4_2 = L8_1
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = TaskStartScenarioInPlace
  L4_2 = L8_1
  L5_2 = "WORLD_HUMAN_CLIPBOARD"
  L6_2 = 0
  L7_2 = true
  L3_2(L4_2, L5_2, L6_2, L7_2)
  L3_2 = SetModelAsNoLongerNeeded
  L4_2 = L1_2
  L3_2(L4_2)
end
function L122_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L9_1
  L0_2 = L0_2 + 1
  L9_1 = L0_2
  L0_2 = L9_1
  L1_2 = L120_1
  L1_2()
  L1_2 = L114_1
  L1_2 = L1_2()
  if not L1_2 then
    return
  end
  L2_2 = L49_1
  L3_2 = L1_2.coords
  L2_2 = L2_2(L3_2)
  L3_2 = CreateThread
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3
    while true do
      L0_3 = L0_2
      L1_3 = L9_1
      if L0_3 ~= L1_3 then
        break
      end
      L0_3 = GetEntityCoords
      L1_3 = PlayerPedId
      L1_3, L2_3, L3_3 = L1_3()
      L0_3 = L0_3(L1_3, L2_3, L3_3)
      L1_3 = L2_2
      L1_3 = L0_3 - L1_3
      L1_3 = #L1_3
      L2_3 = L26_1
      if L1_3 <= L2_3 then
        L2_3 = L121_1
        L2_3()
      else
        L2_3 = L8_1
        if L2_3 then
          L2_3 = DoesEntityExist
          L3_3 = L8_1
          L2_3 = L2_3(L3_3)
          if L2_3 then
            L2_3 = L27_1
            if L1_3 >= L2_3 then
              L2_3 = L120_1
              L2_3()
            end
          end
        end
      end
      L2_3 = Wait
      L3_3 = 1000
      L2_3(L3_3)
    end
  end
  L3_2(L4_2)
end
function L123_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 then
    return
  end
  L2_2 = ipairs
  L3_2 = A0_2.presets
  if not L3_2 then
    L3_2 = {}
  end
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L43_1
    L9_2 = L7_2.id
    L8_2 = L8_2(L9_2)
    L9_2 = L43_1
    L10_2 = A1_2
    L9_2 = L9_2(L10_2)
    if L8_2 == L9_2 then
      return L7_2
    end
  end
end
function L124_1(A0_2)
  local L1_2, L2_2, L3_2
  if not A0_2 or "" == A0_2 then
    return
  end
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
    L1_2 = Config
    L1_2 = L1_2.Target
    if L1_2 then
      L1_2 = exports
      L2_2 = Config
      L2_2 = L2_2.Target
      L1_2 = L1_2[L2_2]
      L2_2 = L1_2
      L1_2 = L1_2.RemoveZone
      L3_2 = A0_2
      L1_2(L2_2, L3_2)
    end
  end
end
L34_1 = L124_1
function L124_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L5_2 = Config
  L5_2 = L5_2.Target
  if L5_2 then
    L5_2 = Config
    L5_2 = L5_2.DrawTextInsteadOfTarget
    if not L5_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L5_2 = 0.5
  if A0_2 then
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = A0_2
    L8_2 = "houseEntry"
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L5_2 = 2.0
  end
  elseif A0_2 then
    L6_2 = string
    L6_2 = L6_2.find
    L7_2 = A0_2
    L8_2 = "houseExit"
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L5_2 = 1.0
    end
  end
  L6_2 = Config
  L6_2 = L6_2.Target
  if "ox_target" == L6_2 then
    L6_2 = exports
    L6_2 = L6_2.ox_target
    L7_2 = L6_2
    L6_2 = L6_2.addSphereZone
    L8_2 = {}
    L8_2.name = A0_2
    L8_2.coords = A1_2
    L8_2.radius = L5_2
    L9_2 = Config
    L9_2 = L9_2.Debug
    L8_2.debug = L9_2
    L9_2 = {}
    L10_2 = {}
    L10_2.icon = A2_2
    L10_2.label = A3_2
    L10_2.onSelect = A4_2
    L11_2 = Config
    L11_2 = L11_2.Debug
    L10_2.debug = L11_2
    L10_2.distance = 1.6
    L9_2[1] = L10_2
    L8_2.options = L9_2
    L6_2(L7_2, L8_2)
  else
    L6_2 = exports
    L7_2 = Config
    L7_2 = L7_2.Target
    L6_2 = L6_2[L7_2]
    L7_2 = L6_2
    L6_2 = L6_2.AddCircleZone
    L8_2 = A0_2
    L9_2 = A1_2
    L10_2 = L5_2
    L11_2 = {}
    L11_2.name = A0_2
    L12_2 = Config
    L12_2 = L12_2.Debug
    L11_2.debugPoly = L12_2
    L12_2 = {}
    L13_2 = {}
    L14_2 = {}
    L14_2.icon = A2_2
    L14_2.label = A3_2
    L14_2.action = A4_2
    L13_2[1] = L14_2
    L12_2.options = L13_2
    L12_2.distance = 1.6
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  end
end
L35_1 = L124_1
function L124_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 then
    L3_2 = A0_2.location
    if L3_2 then
      L3_2 = A0_2.instance
      if L3_2 and A2_2 then
        L3_2 = L71_1
        L4_2 = A2_2
        L3_2 = L3_2(L4_2)
        if L3_2 then
          goto lbl_17
        end
      end
    end
  end
  do return end
  ::lbl_17::
  L3_2 = L88_1
  L4_2 = A0_2.location
  L4_2 = L4_2.id
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L4_2 = L3_1
  L4_2 = L4_2[L3_2]
  if L4_2 then
    L4_2 = L34_1
    L5_2 = L3_2
    L4_2(L5_2)
  end
  L4_2 = vector3
  L5_2 = A0_2.instance
  L5_2 = L5_2.spawn
  L5_2 = L5_2.x
  L6_2 = A2_2.coords
  L6_2 = L6_2.x
  L5_2 = L5_2 + L6_2
  L6_2 = A0_2.instance
  L6_2 = L6_2.spawn
  L6_2 = L6_2.y
  L7_2 = A2_2.coords
  L7_2 = L7_2.y
  L6_2 = L6_2 + L7_2
  L7_2 = A0_2.instance
  L7_2 = L7_2.spawn
  L7_2 = L7_2.z
  L8_2 = A2_2.coords
  L8_2 = L8_2.z
  L7_2 = L7_2 + L8_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L3_1
  L5_2[L3_2] = true
  L5_2 = L35_1
  L6_2 = L3_2
  L7_2 = L4_2
  L8_2 = "fa-solid fa-box-open"
  L9_2 = A2_2.label
  if not L9_2 then
    L9_2 = "Search"
  end
  function L10_2()
    local L0_3, L1_3
    L0_3 = L29_1
    L1_3 = A1_2
    L0_3(L1_3)
  end
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
end
L36_1 = L124_1
function L124_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 or not A2_2 then
    return
  end
  L4_2 = L71_1
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = L100_1
    L5_2 = A0_2.location
    if L5_2 then
      L5_2 = A0_2.location
      L5_2 = L5_2.id
    end
    L6_2 = A1_2
    L4_2(L5_2, L6_2)
    L4_2 = A0_2.pointProps
    if L4_2 then
      L4_2 = A0_2.pointProps
      L4_2 = L4_2[A1_2]
      if L4_2 then
        goto lbl_27
      end
    end
    L4_2 = nil
    ::lbl_27::
    if L4_2 then
      L5_2 = DoesEntityExist
      L6_2 = L4_2
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L5_2 = SetEntityAsMissionEntity
        L6_2 = L4_2
        L7_2 = true
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = DeleteEntity
        L6_2 = L4_2
        L5_2(L6_2)
      end
    end
    L5_2 = A0_2.pointProps
    if L5_2 then
      L5_2 = A0_2.pointProps
      L5_2[A1_2] = nil
      L5_2 = A0_2.pointProps
      L6_2 = tostring
      L7_2 = A1_2
      L6_2 = L6_2(L7_2)
      L5_2[L6_2] = nil
    end
    return
  end
  L4_2 = L81_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  if L4_2 then
    L4_2 = L44_1
    L5_2 = A0_2
    L6_2 = A1_2
    L4_2 = L4_2(L5_2, L6_2)
    if not L4_2 then
      goto lbl_120
    end
  end
  L4_2 = L100_1
  L5_2 = A0_2.location
  if L5_2 then
    L5_2 = A0_2.location
    L5_2 = L5_2.id
  end
  L6_2 = A1_2
  L4_2(L5_2, L6_2)
  L4_2 = A0_2.pointProps
  if L4_2 then
    L4_2 = A0_2.pointProps
    L4_2 = L4_2[A1_2]
    if L4_2 then
      goto lbl_81
    end
  end
  L4_2 = nil
  ::lbl_81::
  if L4_2 then
    L5_2 = DoesEntityExist
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = SetEntityAsMissionEntity
      L6_2 = L4_2
      L7_2 = true
      L8_2 = true
      L5_2(L6_2, L7_2, L8_2)
      L5_2 = DeleteEntity
      L6_2 = L4_2
      L5_2(L6_2)
    end
  end
  L5_2 = A0_2.pointProps
  if L5_2 then
    L5_2 = A0_2.pointProps
    L5_2[A1_2] = nil
    L5_2 = A0_2.pointProps
    L6_2 = tostring
    L7_2 = A1_2
    L6_2 = L6_2(L7_2)
    L5_2[L6_2] = nil
  end
  L5_2 = L46_1
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    L5_2 = L42_1
    if L5_2 then
      L5_2 = L42_1
      L6_2 = A0_2
      L7_2 = A1_2
      L8_2 = A2_2
      L5_2(L6_2, L7_2, L8_2)
    end
  end
  do return end
  ::lbl_120::
  L4_2 = L88_1
  L5_2 = A0_2.location
  if L5_2 then
    L5_2 = A0_2.location
    L5_2 = L5_2.id
  end
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  if true ~= A3_2 then
    L5_2 = L3_1
    L5_2 = L5_2[L4_2]
    if L5_2 then
      goto lbl_139
    end
  end
  L5_2 = L36_1
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L5_2(L6_2, L7_2, L8_2)
  ::lbl_139::
  L5_2 = L43_1
  L6_2 = A2_2.prop
  L5_2 = L5_2(L6_2)
  if "" ~= L5_2 then
    L5_2 = L40_1
    if L5_2 then
      L5_2 = A0_2.pointProps
      if not L5_2 then
        L5_2 = {}
      end
      A0_2.pointProps = L5_2
      L5_2 = A0_2.pointProps
      L5_2 = L5_2[A1_2]
      if L5_2 then
        L6_2 = DoesEntityExist
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        if L6_2 then
          goto lbl_171
        end
      end
      L6_2 = L40_1
      L7_2 = A2_2
      L8_2 = A0_2.instance
      L6_2 = L6_2(L7_2, L8_2)
      L5_2 = L6_2
      if L5_2 then
        L6_2 = A0_2.pointProps
        L6_2[A1_2] = L5_2
      end
    end
  end
  ::lbl_171::
end
L37_1 = L124_1
function L124_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = GetEntityCoords
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L1_2 = nil
  L2_2 = nil
  L3_2 = ipairs
  L4_2 = L0_1.locations
  if not L4_2 then
    L4_2 = {}
  end
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = L8_2.enabled
    if false ~= L9_2 then
      L9_2 = L8_2.entry
      if L9_2 then
        L9_2 = L8_2.entry
        L9_2 = L9_2.coords
        if L9_2 then
          L9_2 = L74_1
          L10_2 = L8_2.entry
          L9_2 = L9_2(L10_2)
          L10_2 = L9_2 or L10_2
          if L9_2 then
            L10_2 = L0_2 - L9_2
            L10_2 = #L10_2
          end
          if L10_2 then
            L11_2 = 1.6
            if L10_2 <= L11_2 and (not L2_2 or L2_2 > L10_2) then
              L1_2 = L8_2
              L2_2 = L10_2
            end
          end
        end
      end
    end
  end
  L3_2 = L1_2
  L4_2 = L2_2
  return L3_2, L4_2
end
function L125_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = L114_1
  L0_2 = L0_2()
  if not L0_2 then
    L1_2 = nil
    L2_2 = nil
    return L1_2, L2_2
  end
  L1_2 = GetEntityCoords
  L2_2 = PlayerPedId
  L2_2, L3_2, L4_2, L5_2 = L2_2()
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  L2_2 = L49_1
  L3_2 = L0_2.coords
  L2_2 = L2_2(L3_2)
  L3_2 = L1_2 - L2_2
  L3_2 = #L3_2
  L4_2 = 1.6
  if L3_2 > L4_2 then
    L4_2 = nil
    L5_2 = nil
    return L4_2, L5_2
  end
  L4_2 = {}
  L4_2.type = "mission"
  L5_2 = L116_1
  L5_2 = L5_2()
  L4_2.label = L5_2
  L5_2 = L3_2
  return L4_2, L5_2
end
function L126_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.FrameworkFunctions
  if L0_2 then
    L0_2 = Config
    L0_2 = L0_2.FrameworkFunctions
    L0_2 = L0_2.TriggerCallback
    if L0_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L0_2 = Config
  L0_2 = L0_2.FrameworkFunctions
  L0_2 = L0_2.TriggerCallback
  L1_2 = "Pug:server:GetOpenHouseRobberies"
  function L2_2(A0_3)
    local L1_3, L2_3
    L1_3 = L76_1
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L1_1 = L1_3
    L1_3 = L33_1
    L1_3()
  end
  L0_2(L1_2, L2_2)
end
function L127_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L1_2 = A0_2.instance
    if L1_2 then
      L1_2 = A0_2.preset
      if L1_2 then
        goto lbl_11
      end
    end
  end
  L1_2 = nil
  L2_2 = nil
  do return L1_2, L2_2 end
  ::lbl_11::
  L1_2 = type
  L2_2 = A0_2.preset
  L2_2 = L2_2.securitySystem
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = A0_2.preset
    L1_2 = L1_2.securitySystem
    if L1_2 then
      goto lbl_22
    end
  end
  L1_2 = nil
  ::lbl_22::
  if L1_2 then
    L2_2 = L1_2.isPlaced
    if true == L2_2 then
      L2_2 = A0_2.securityDisabled
      if true ~= L2_2 then
        goto lbl_32
      end
    end
  end
  L2_2 = nil
  L3_2 = nil
  do return L2_2, L3_2 end
  ::lbl_32::
  L2_2 = type
  L3_2 = L1_2.keypad
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = L1_2.keypad
    if L2_2 then
      goto lbl_42
    end
  end
  L2_2 = {}
  ::lbl_42::
  L3_2 = L69_1
  L4_2 = L2_2.coords
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = L2_2.coords
    if L3_2 then
      goto lbl_51
    end
  end
  L3_2 = L1_2.coords
  ::lbl_51::
  L4_2 = L69_1
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = nil
    L5_2 = L1_2
    return L4_2, L5_2
  end
  L4_2 = L68_1
  L5_2 = L3_2
  L6_2 = A0_2.instance
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L4_2
  L6_2 = L1_2
  return L5_2, L6_2
end
function L128_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L43_1
  if A0_2 then
    L2_2 = A0_2.label
    if L2_2 then
      goto lbl_8
    end
  end
  L2_2 = ""
  ::lbl_8::
  L1_2 = L1_2(L2_2)
  if "" == L1_2 then
    L2_2 = L43_1
    if A0_2 then
      L3_2 = A0_2.keypad
      if L3_2 then
        L3_2 = A0_2.keypad
        L3_2 = L3_2.label
        if L3_2 then
          goto lbl_22
        end
      end
    end
    L3_2 = ""
    ::lbl_22::
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  if "" == L1_2 then
    L1_2 = "Disable Security"
  end
  return L1_2
end
function L129_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  if A0_2 then
    L1_2 = A0_2.location
    if L1_2 then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L1_2 = L101_1
  L2_2 = A0_2.location
  L2_2 = L2_2.id
  L1_2(L2_2)
  L1_2 = L127_1
  L2_2 = A0_2
  L1_2, L2_2 = L1_2(L2_2)
  if not L1_2 or not L2_2 then
    return
  end
  L3_2 = L87_1
  L4_2 = A0_2.location
  L4_2 = L4_2.id
  L3_2 = L3_2(L4_2)
  L4_2 = L3_1
  L4_2[L3_2] = true
  L4_2 = L35_1
  L5_2 = L3_2
  L6_2 = L1_2
  L7_2 = "fa-solid fa-keyboard"
  L8_2 = L128_1
  L9_2 = L2_2
  L8_2 = L8_2(L9_2)
  function L9_2()
    local L0_3, L1_3
    L0_3 = L30_1
    L0_3()
  end
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
end
function L130_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = L4_1
  if L0_2 then
    L0_2 = L4_1.instance
    if L0_2 then
      L0_2 = L4_1.instance
      L0_2 = L0_2.spawn
      if L0_2 then
        goto lbl_12
      end
    end
  end
  do return end
  ::lbl_12::
  L0_2 = GetEntityCoords
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L1_2()
  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L1_2 = L4_1.instance
  L1_2 = L1_2.spawn
  L2_2 = nil
  L3_2 = nil
  L4_2 = vector3
  L5_2 = L1_2.x
  L6_2 = L4_1.instance
  L6_2 = L6_2.enterOffset
  L6_2 = L6_2.x
  L5_2 = L5_2 + L6_2
  L6_2 = L1_2.y
  L7_2 = L4_1.instance
  L7_2 = L7_2.enterOffset
  L7_2 = L7_2.y
  L6_2 = L6_2 + L7_2
  L7_2 = L1_2.z
  L8_2 = L4_1.instance
  L8_2 = L8_2.enterOffset
  L8_2 = L8_2.z
  L7_2 = L7_2 + L8_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L0_2 - L4_2
  L5_2 = #L5_2
  L6_2 = 1.6
  if L5_2 <= L6_2 then
    L6_2 = {}
    L6_2.type = "exit"
    L6_2.label = "Leave House"
    L2_2 = L6_2
    L3_2 = L5_2
  end
  L6_2 = L127_1
  L7_2 = L4_1
  L6_2, L7_2 = L6_2(L7_2)
  if L6_2 and L7_2 then
    L8_2 = L0_2 - L6_2
    L8_2 = #L8_2
    L9_2 = 1.6
    if L8_2 <= L9_2 and (not L3_2 or L3_2 > L8_2) then
      L9_2 = {}
      L9_2.type = "security"
      L10_2 = L128_1
      L11_2 = L7_2
      L10_2 = L10_2(L11_2)
      L9_2.label = L10_2
      L2_2 = L9_2
      L3_2 = L8_2
    end
  end
  L8_2 = ipairs
  L9_2 = L4_1.preset
  if L9_2 then
    L9_2 = L4_1.preset
    L9_2 = L9_2.lootPoints
    if L9_2 then
      goto lbl_87
    end
  end
  L9_2 = {}
  ::lbl_87::
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    L14_2 = L71_1
    L15_2 = L13_2
    L14_2 = L14_2(L15_2)
    if L14_2 then
      L14_2 = L81_1
      L15_2 = L4_1
      L16_2 = L12_2
      L14_2 = L14_2(L15_2, L16_2)
      if L14_2 then
        L14_2 = L44_1
        L15_2 = L4_1
        L16_2 = L12_2
        L14_2 = L14_2(L15_2, L16_2)
        if not L14_2 then
          L14_2 = L38_1
          L15_2 = L13_2
          L16_2 = L4_1.instance
          L14_2 = L14_2(L15_2, L16_2)
          if L14_2 then
            L15_2 = L0_2 - L14_2
            L15_2 = #L15_2
            L16_2 = 1.6
            if L15_2 <= L16_2 and (not L3_2 or L3_2 > L15_2) then
              L16_2 = {}
              L16_2.type = "loot"
              L16_2.index = L12_2
              L17_2 = L13_2.label
              if not L17_2 then
                L17_2 = "Search"
              end
              L16_2.label = L17_2
              L2_2 = L16_2
              L3_2 = L15_2
            end
          end
        end
      end
    end
  end
  L8_2 = L2_2
  L9_2 = L3_2
  return L8_2, L9_2
end
function L131_1()
  local L0_2, L1_2
  L0_2 = L6_1
  if L0_2 then
    return
  end
  L0_2 = true
  L6_1 = L0_2
  L0_2 = CreateThread
  function L1_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L0_3 = false
    while true do
      L1_3 = L6_1
      if not L1_3 then
        break
      end
      L1_3 = 500
      L2_3 = L4_1
      if L2_3 then
        L2_3 = L130_1
        L2_3 = L2_3()
        if L2_3 then
          L3_3 = DrawTextOption
          L4_3 = "[E] "
          L5_3 = tostring
          L6_3 = L2_3.label
          if not L6_3 then
            L6_3 = "Interact"
          end
          L5_3 = L5_3(L6_3)
          L4_3 = L4_3 .. L5_3
          L3_3(L4_3)
          L0_3 = true
          L1_3 = 0
          L3_3 = IsControlJustPressed
          L4_3 = 0
          L5_3 = 38
          L3_3 = L3_3(L4_3, L5_3)
          if L3_3 then
            L3_3 = L2_3.type
            if "exit" == L3_3 then
              L3_3 = L28_1
              L4_3 = true
              L3_3(L4_3)
            else
              L3_3 = L2_3.type
              if "security" == L3_3 then
                L3_3 = L30_1
                L3_3()
              else
                L3_3 = L2_3.type
                if "loot" == L3_3 then
                  L3_3 = L2_3.index
                  if L3_3 then
                    L3_3 = L29_1
                    L4_3 = L2_3.index
                    L3_3(L4_3)
                  end
                end
              end
            end
            L3_3 = Wait
            L4_3 = 300
            L3_3(L4_3)
          end
        end
      else
        L2_3 = L125_1
        L2_3, L3_3 = L2_3()
        L4_3 = L124_1
        L4_3, L5_3 = L4_3()
        L6_3 = L2_3
        L7_3 = L3_3
        if L4_3 and (not L7_3 or L5_3 and L5_3 < L7_3) then
          L8_3 = {}
          L8_3.type = "entry"
          L9_3 = L89_1
          L10_3 = L4_3
          L9_3 = L9_3(L10_3)
          L8_3.label = L9_3
          L8_3.location = L4_3
          L6_3 = L8_3
          L7_3 = L5_3
        end
        if L6_3 then
          L8_3 = DrawTextOption
          L9_3 = "[E] "
          L10_3 = tostring
          L11_3 = L6_3.label
          if not L11_3 then
            L11_3 = "Interact"
          end
          L10_3 = L10_3(L11_3)
          L9_3 = L9_3 .. L10_3
          L8_3(L9_3)
          L0_3 = true
          L1_3 = 0
          L8_3 = IsControlJustPressed
          L9_3 = 0
          L10_3 = 38
          L8_3 = L8_3(L9_3, L10_3)
          if L8_3 then
            L8_3 = L6_3.type
            if "mission" == L8_3 then
              L8_3 = L119_1
              L8_3()
            else
              L8_3 = L6_3.location
              if L8_3 then
                L9_3 = L78_1
                L10_3 = L8_3.id
                L9_3 = L9_3(L10_3)
                if L9_3 then
                  L9_3 = L32_1
                  L10_3 = L8_3.id
                  L9_3(L10_3)
                else
                  L9_3 = L31_1
                  L10_3 = L8_3.id
                  L9_3(L10_3)
                end
              end
            end
            L8_3 = Wait
            L9_3 = 300
            L8_3(L9_3)
          end
        end
      end
      if 500 == L1_3 and L0_3 then
        L2_3 = HideTextOption
        L2_3()
        L0_3 = false
      end
      L2_3 = Wait
      L3_3 = L1_3
      L2_3(L3_3)
    end
    if L0_3 then
      L1_3 = HideTextOption
      L1_3()
    end
  end
  L0_2(L1_2)
end
function L132_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L3_2 = math
  L3_2 = L3_2.max
  L4_2 = 500
  L5_2 = tonumber
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 5000
  end
  L3_2 = L3_2(L4_2, L5_2)
  A1_2 = L3_2
  L3_2 = type
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if "table" ~= L3_2 or not A2_2 then
    L3_2 = {}
    A2_2 = L3_2
  end
  L3_2 = PlayerPedId
  L3_2 = L3_2()
  L4_2 = tonumber
  L5_2 = A2_2.heading
  L4_2 = L4_2(L5_2)
  L5_2 = L43_1
  L6_2 = A2_2.animDict
  if not L6_2 then
    L6_2 = ""
  end
  L5_2 = L5_2(L6_2)
  L6_2 = L43_1
  L7_2 = A2_2.animAction
  if not L7_2 then
    L7_2 = ""
  end
  L6_2 = L6_2(L7_2)
  L7_2 = tonumber
  L8_2 = A2_2.animFlag
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = 1
  end
  if L4_2 then
    L8_2 = SetEntityHeading
    L9_2 = L3_2
    L10_2 = L4_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = FreezeEntityPosition
  L9_2 = L3_2
  L10_2 = true
  L8_2(L9_2, L10_2)
  if "" ~= L5_2 and "" ~= L6_2 then
    L8_2 = RequestAnimDict
    L9_2 = L5_2
    L8_2(L9_2)
    while true do
      L8_2 = HasAnimDictLoaded
      L9_2 = L5_2
      L8_2 = L8_2(L9_2)
      if L8_2 then
        break
      end
      L8_2 = Wait
      L9_2 = 0
      L8_2(L9_2)
    end
    L8_2 = TaskPlayAnim
    L9_2 = L3_2
    L10_2 = L5_2
    L11_2 = L6_2
    L12_2 = 8.0
    L13_2 = -8.0
    L14_2 = -1
    L15_2 = L7_2
    L16_2 = 0
    L17_2 = false
    L18_2 = false
    L19_2 = false
    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  else
    L8_2 = TaskStartScenarioInPlace
    L9_2 = L3_2
    L10_2 = "PROP_HUMAN_BUM_BIN"
    L11_2 = 0
    L12_2 = true
    L8_2(L9_2, L10_2, L11_2, L12_2)
  end
  L8_2 = Notify
  L9_2 = A0_2 or L9_2
  if not A0_2 then
    L9_2 = Config
    L9_2 = L9_2.T
    L10_2 = "Searching"
    L9_2 = L9_2(L10_2)
  end
  L10_2 = "primary"
  L11_2 = A1_2
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = GetGameTimer
  L8_2 = L8_2()
  L8_2 = L8_2 + A1_2
  while true do
    L9_2 = GetGameTimer
    L9_2 = L9_2()
    if not (L8_2 > L9_2) then
      break
    end
    L9_2 = Wait
    L10_2 = 0
    L9_2(L10_2)
    if L4_2 then
      L9_2 = SetEntityHeading
      L10_2 = L3_2
      L11_2 = L4_2
      L9_2(L10_2, L11_2)
    end
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 24
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 25
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 30
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 31
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 32
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 33
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 34
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 35
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = DisableControlAction
    L10_2 = 0
    L11_2 = 73
    L12_2 = true
    L9_2(L10_2, L11_2, L12_2)
  end
  L9_2 = ClearPedTasksImmediately
  L10_2 = L3_2
  L9_2(L10_2)
  L9_2 = FreezeEntityPosition
  L10_2 = L3_2
  L11_2 = false
  L9_2(L10_2, L11_2)
end
function L133_1(A0_2)
  local L1_2, L2_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = "" ~= L1_2 and "none" ~= L1_2
  return L2_2
end
function L134_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
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
  L2_2 = L43_1
  L3_2 = A0_2.minigameType
  if not L3_2 then
    L3_2 = A0_2.minigameOption
    if not L3_2 then
      L3_2 = ""
    end
  end
  L2_2 = L2_2(L3_2)
  L3_2 = L43_1
  L4_2 = L1_2.minigameType
  if not L4_2 then
    L4_2 = L1_2.minigameOption
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
function L135_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = tonumber
  L3_2 = A0_2.heading
  L2_2 = L2_2(L3_2)
  L3_2 = L43_1
  L4_2 = A0_2.animDict
  if not L4_2 then
    L4_2 = ""
  end
  L3_2 = L3_2(L4_2)
  L4_2 = L43_1
  L5_2 = A0_2.animAction
  if not L5_2 then
    L5_2 = ""
  end
  L4_2 = L4_2(L5_2)
  L5_2 = L43_1
  L6_2 = A0_2.scenario
  if not L6_2 then
    L6_2 = ""
  end
  L5_2 = L5_2(L6_2)
  L6_2 = tonumber
  L7_2 = A0_2.animFlag
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = 49
  end
  L7_2 = {}
  L7_2.active = true
  if L2_2 then
    L8_2 = SetEntityHeading
    L9_2 = L1_2
    L10_2 = L2_2
    L8_2(L9_2, L10_2)
  end
  L8_2 = FreezeEntityPosition
  L9_2 = L1_2
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = CreateThread
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
    L0_3 = L3_2
    if "" ~= L0_3 then
      L0_3 = L4_2
      if "" ~= L0_3 then
        L0_3 = RequestAnimDict
        L1_3 = L3_2
        L0_3(L1_3)
        while true do
          L0_3 = L7_2.active
          if not L0_3 then
            break
          end
          L0_3 = HasAnimDictLoaded
          L1_3 = L3_2
          L0_3 = L0_3(L1_3)
          if L0_3 then
            break
          end
          L0_3 = Wait
          L1_3 = 0
          L0_3(L1_3)
        end
        L0_3 = L7_2.active
        if L0_3 then
          L0_3 = TaskPlayAnim
          L1_3 = L1_2
          L2_3 = L3_2
          L3_3 = L4_2
          L4_3 = 8.0
          L5_3 = -8.0
          L6_3 = -1
          L7_3 = L6_2
          L8_3 = 0
          L9_3 = false
          L10_3 = false
          L11_3 = false
          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
        end
    end
    else
      L0_3 = L5_2
      if "" ~= L0_3 then
        L0_3 = TaskStartScenarioInPlace
        L1_3 = L1_2
        L2_3 = L5_2
        L3_3 = 0
        L4_3 = true
        L0_3(L1_3, L2_3, L3_3, L4_3)
      else
        L0_3 = TaskStartScenarioInPlace
        L1_3 = L1_2
        L2_3 = "PROP_HUMAN_BUM_BIN"
        L3_3 = 0
        L4_3 = true
        L0_3(L1_3, L2_3, L3_3, L4_3)
      end
    end
    while true do
      L0_3 = L7_2.active
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = L2_2
      if L0_3 then
        L0_3 = SetEntityHeading
        L1_3 = L1_2
        L2_3 = L2_2
        L0_3(L1_3, L2_3)
      end
      L0_3 = L3_2
      if "" ~= L0_3 then
        L0_3 = L4_2
        if "" ~= L0_3 then
          L0_3 = IsEntityPlayingAnim
          L1_3 = L1_2
          L2_3 = L3_2
          L3_3 = L4_2
          L4_3 = 3
          L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)
          if not L0_3 then
            L0_3 = TaskPlayAnim
            L1_3 = L1_2
            L2_3 = L3_2
            L3_3 = L4_2
            L4_3 = 8.0
            L5_3 = -8.0
            L6_3 = -1
            L7_3 = L6_2
            L8_3 = 0
            L9_3 = false
            L10_3 = false
            L11_3 = false
            L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
          end
        end
      end
    end
  end
  L8_2(L9_2)
  function L8_2()
    local L0_3, L1_3, L2_3
    L7_2.active = false
    L0_3 = TriggerEvent
    L1_3 = "Pug:client:StopRobberySceneKeepAlive"
    L0_3(L1_3)
    L0_3 = ClearPedTasksImmediately
    L1_3 = L1_2
    L0_3(L1_3)
    L0_3 = FreezeEntityPosition
    L1_3 = L1_2
    L2_3 = false
    L0_3(L1_3, L2_3)
  end
  return L8_2
end
function L136_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = L43_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "" == L1_2 or "none" == L1_2 then
    L2_2 = true
    L3_2 = false
    return L2_2, L3_2
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
  L4_2 = "HouseMinigameUnavailable"
  L3_2 = L3_2(L4_2)
  L4_2 = "error"
  L2_2(L3_2, L4_2)
  L2_2 = false
  L3_2 = false
  do return L2_2, L3_2 end
  ::lbl_38::
  L2_2 = pcall
  L3_2 = Config
  L3_2 = L3_2.MiniGames
  L3_2 = L3_2[L1_2]
  L3_2 = L3_2.Game
  L2_2, L3_2 = L2_2(L3_2)
  if not L2_2 then
    L4_2 = Notify
    L5_2 = Config
    L5_2 = L5_2.T
    L6_2 = "HouseMinigameStartFailed"
    L5_2 = L5_2(L6_2)
    L6_2 = "error"
    L4_2(L5_2, L6_2)
    L4_2 = ClearPedTasks
    L5_2 = PlayerPedId
    L5_2, L6_2 = L5_2()
    L4_2(L5_2, L6_2)
    L4_2 = false
    L5_2 = false
    return L4_2, L5_2
  end
  L4_2 = true == L3_2
  L5_2 = true
  return L4_2, L5_2
end
function L137_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
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
  L1_2 = true
  return L1_2
end
function L138_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = A0_2.requiredItems
  if L1_2 then
    L1_2 = A0_2.requiredItems
    L1_2 = #L1_2
    if 0 ~= L1_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
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
end
function L139_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2.requireWeaponInHand
  if true ~= L1_2 then
    L1_2 = true
    return L1_2
  end
  L1_2 = A0_2.requiredWeapons
  if not L1_2 then
    L1_2 = {}
  end
  L2_2 = #L1_2
  if 0 == L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = GetSelectedPedWeapon
  L3_2 = PlayerPedId
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L3_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  if not L2_2 or 0 == L2_2 then
    L3_2 = Notify
    L4_2 = Config
    L4_2 = L4_2.T
    L5_2 = "HouseRequiredWeaponInHand"
    L4_2 = L4_2(L5_2)
    L5_2 = "error"
    L3_2(L4_2, L5_2)
    L3_2 = false
    return L3_2
  end
  L3_2 = ipairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do
    L9_2 = GetHashKey
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    if L2_2 == L9_2 then
      L9_2 = true
      return L9_2
    end
  end
  L3_2 = Notify
  L4_2 = Config
  L4_2 = L4_2.T
  L5_2 = "HouseRequiredWeaponEquipped"
  L4_2 = L4_2(L5_2)
  L5_2 = "error"
  L3_2(L4_2, L5_2)
  L3_2 = false
  return L3_2
end
function L140_1(A0_2)
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
function L141_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 then
    L1_2 = A0_2.xpOptions
    if true == L1_2 then
      goto lbl_9
    end
  end
  L1_2 = true
  L2_2 = nil
  do return L1_2, L2_2 end
  ::lbl_9::
  L1_2 = tonumber
  L2_2 = A0_2.xpNeededAmount
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = 0
  end
  L2_2 = A0_2.removeXpOnHit
  if L2_2 then
    L2_2 = tonumber
    L3_2 = A0_2.xpRemoveAmount
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_27
    end
    L2_2 = 0
    if L2_2 then
      goto lbl_27
    end
  end
  L2_2 = 0
  ::lbl_27::
  L3_2 = true
  L4_2 = false
  L5_2 = Config
  L5_2 = L5_2.FrameworkFunctions
  L5_2 = L5_2.TriggerCallback
  L6_2 = "Pug:serverCB:GetHouseRobberyRep"
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = tonumber
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      L1_3 = 0
    end
    L2_3 = L1_2
    if L2_3 > 0 then
      L2_3 = L1_2
      if L1_3 < L2_3 then
        L2_3 = Notify
        L3_3 = Config
        L3_3 = L3_3.T
        L4_3 = "NeedXP"
        L5_3 = L1_2
        L3_3 = L3_3(L4_3, L5_3)
        L4_3 = "error"
        L2_3(L3_3, L4_3)
        L2_3 = false
        L3_2 = L2_3
      end
    end
    L2_3 = true
    L4_2 = L2_3
  end
  L5_2(L6_2, L7_2)
  while not L4_2 do
    L5_2 = Wait
    L6_2 = 50
    L5_2(L6_2)
  end
  if not L3_2 then
    L5_2 = false
    L6_2 = nil
    return L5_2, L6_2
  end
  L5_2 = true
  L6_2 = L2_2 or L6_2
  if not (L2_2 > 0) or not L2_2 then
    L6_2 = nil
  end
  return L5_2, L6_2
end
function L142_1(A0_2, A1_2)
  local L2_2
  if A1_2 then
    L2_2 = A1_2.xpOptions
    if true == L2_2 then
      return A1_2
    end
  end
  L2_2 = nil
  return L2_2
end
function L143_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 then
    L2_2 = A0_2.xpOptions
    if true == L2_2 then
      goto lbl_7
    end
  end
  do return end
  ::lbl_7::
  L2_2 = tonumber
  L3_2 = A0_2.xpRewardAmount
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0
  end
  if L2_2 > 0 then
    L3_2 = TriggerServerEvent
    L4_2 = "Pug:Server:ToggleHouseRobberyRep"
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
  end
  if A1_2 and A1_2 > 0 then
    L3_2 = TriggerServerEvent
    L4_2 = "Pug:Server:ToggleHouseRobberyRep"
    L5_2 = A1_2
    L6_2 = true
    L3_2(L4_2, L5_2, L6_2)
  end
end
function L144_1(A0_2)
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
    if L1_2 >= L2_2 then
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
end
function L145_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = tonumber
  L3_2 = A1_2 or L3_2
  if A1_2 then
    L3_2 = A1_2.failPoliceChance
  end
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = 0
  end
  if L2_2 <= 0 then
    return
  end
  L3_2 = math
  L3_2 = L3_2.random
  L4_2 = 1
  L5_2 = 100
  L3_2 = L3_2(L4_2, L5_2)
  if L2_2 >= L3_2 then
    L3_2 = AlertPolice
    L4_2 = A0_2
    L3_2(L4_2)
  end
end
function L146_1(A0_2, A1_2)
  local L2_2, L3_2
  if not A1_2 then
    return A0_2
  end
  L2_2 = A1_2.rewardItem
  if true ~= L2_2 then
    L2_2 = A1_2.rewardMoney
    if true ~= L2_2 then
      goto lbl_45
    end
  end
  L2_2 = {}
  L3_2 = A1_2.rewardItems
  if not L3_2 then
    L3_2 = {}
  end
  L2_2.rewardItems = L3_2
  L3_2 = A1_2.rewardMoney
  L3_2 = true == L3_2
  L2_2.moneyReward = L3_2
  L3_2 = A1_2.rewardMoneyType
  if not L3_2 then
    L3_2 = "cash"
  end
  L2_2.rewardType = L3_2
  L3_2 = A1_2.rewardMoneyMin
  if not L3_2 then
    L3_2 = 1
  end
  L2_2.minMoney = L3_2
  L3_2 = A1_2.rewardMoneyMax
  if not L3_2 then
    L3_2 = 1
  end
  L2_2.maxMoney = L3_2
  L3_2 = A1_2.moneyChance
  if not L3_2 then
    L3_2 = 100
  end
  L2_2.moneyChance = L3_2
  do return L2_2 end
  ::lbl_45::
  return A0_2
end
function L147_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L1_2 = type
    L2_2 = A0_2.pointProps
    L1_2 = L1_2(L2_2)
    if "table" == L1_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L1_2 = pairs
  L2_2 = A0_2.pointProps
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = DoesEntityExist
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = DeleteEntity
      L8_2 = L6_2
      L7_2(L8_2)
    end
    L7_2 = A0_2.pointProps
    L7_2[L5_2] = nil
  end
end
function L148_1(A0_2)
  local L1_2, L2_2
  L1_2 = L43_1
  if A0_2 then
    L2_2 = A0_2.prop
    if L2_2 then
      goto lbl_8
    end
  end
  L2_2 = ""
  ::lbl_8::
  L1_2 = L1_2(L2_2)
  if "tr_prop_tr_container_01a" == L1_2 then
    L2_2 = 1.5
    return L2_2
  end
  if "h4_prop_h4_safe_01a" == L1_2 then
    L2_2 = 1.25
    return L2_2
  end
  L2_2 = 0.75
  return L2_2
end
function L149_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  if A0_2 and A1_2 then
    L4_2 = A1_2.spawn
    if L4_2 then
      goto lbl_12
    end
  end
  L4_2 = {}
  L5_2 = nil
  do return L4_2, L5_2 end
  ::lbl_12::
  L4_2 = L38_1
  L5_2 = A0_2
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  if not L4_2 then
    L5_2 = {}
    L6_2 = nil
    return L5_2, L6_2
  end
  L5_2 = L43_1
  L6_2 = A0_2.prop
  L5_2 = L5_2(L6_2)
  if "" == L5_2 then
    L6_2 = {}
    L7_2 = L4_2
    return L6_2, L7_2
  end
  L6_2 = tonumber
  L7_2 = A3_2
  L6_2 = L6_2(L7_2)
  A3_2 = L6_2 or A3_2
  if not L6_2 then
    L6_2 = L148_1
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
    A3_2 = L6_2
  end
  L6_2 = GetHashKey
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = {}
  L8_2 = {}
  function L9_2(A0_3)
    local L1_3, L2_3, L3_3
    if A0_3 and 0 ~= A0_3 then
      L1_3 = DoesEntityExist
      L2_3 = A0_3
      L1_3 = L1_3(L2_3)
      if L1_3 then
        L1_3 = L8_2
        L1_3 = L1_3[A0_3]
        if not L1_3 then
          goto lbl_15
        end
      end
    end
    do return end
    ::lbl_15::
    L1_3 = GetEntityModel
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = L6_2
    if L1_3 ~= L2_3 then
      return
    end
    L1_3 = GetEntityCoords
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L2_3 = L4_2
    L2_3 = L1_3 - L2_3
    L2_3 = #L2_3
    L3_3 = A3_2
    if L2_3 > L3_3 then
      return
    end
    L2_3 = L8_2
    L2_3[A0_3] = true
    L2_3 = L7_2
    L2_3 = #L2_3
    L3_3 = L2_3 + 1
    L2_3 = L7_2
    L2_3[L3_3] = A0_3
  end
  L10_2 = L9_2
  L11_2 = A2_2
  L10_2(L11_2)
  L10_2 = GetClosestObjectOfType
  L11_2 = L4_2.x
  L12_2 = L4_2.y
  L13_2 = L4_2.z
  L14_2 = A3_2
  L15_2 = L6_2
  L16_2 = 0
  L17_2 = 0
  L18_2 = 0
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  if 0 ~= L10_2 then
    L11_2 = DoesEntityExist
    L12_2 = L10_2
    L11_2 = L11_2(L12_2)
    if L11_2 then
      L11_2 = L9_2
      L12_2 = L10_2
      L11_2(L12_2)
    end
  end
  L11_2 = ipairs
  L12_2 = GetGamePool
  L13_2 = "CObject"
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L12_2(L13_2)
  L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
    L17_2 = L9_2
    L18_2 = L16_2
    L17_2(L18_2)
  end
  L11_2 = table
  L11_2 = L11_2.sort
  L12_2 = L7_2
  function L13_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = GetEntityCoords
    L3_3 = A0_3
    L2_3 = L2_3(L3_3)
    L3_3 = L4_2
    L2_3 = L2_3 - L3_3
    L2_3 = #L2_3
    L3_3 = GetEntityCoords
    L4_3 = A1_3
    L3_3 = L3_3(L4_3)
    L4_3 = L4_2
    L3_3 = L3_3 - L4_3
    L3_3 = #L3_3
    L4_3 = math
    L4_3 = L4_3.abs
    L5_3 = L2_3 - L3_3
    L4_3 = L4_3(L5_3)
    L5_3 = 0.01
    if L4_3 <= L5_3 then
      L4_3 = A0_3 < A1_3
      return L4_3
    end
    L4_3 = L2_3 < L3_3
    return L4_3
  end
  L11_2(L12_2, L13_2)
  L11_2 = L7_2
  L12_2 = L4_2
  return L11_2, L12_2
end
function L150_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = L149_1
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L6_2 = L4_2[1]
  if A2_2 then
    L7_2 = DoesEntityExist
    L8_2 = A2_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = ipairs
      L8_2 = L4_2
      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
        if L12_2 == A2_2 then
          L6_2 = L12_2
          break
        end
      end
    end
  end
  L7_2 = L6_2
  L8_2 = L4_2
  L9_2 = L5_2
  return L7_2, L8_2, L9_2
end
function L151_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  if A0_2 then
    L3_2 = A0_2.instance
    if L3_2 and A2_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L3_2 = A0_2.pointProps
  if L3_2 then
    L3_2 = A0_2.pointProps
    L3_2 = L3_2[A1_2]
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = nil
  ::lbl_17::
  L4_2 = L148_1
  L5_2 = A2_2
  L4_2 = L4_2(L5_2)
  L5_2 = L150_1
  L6_2 = A2_2
  L7_2 = A0_2.instance
  L8_2 = L3_2
  L9_2 = L4_2
  L5_2, L6_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L7_2 = #L6_2
  if 0 == L7_2 and L3_2 then
    L7_2 = DoesEntityExist
    L8_2 = L3_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = {}
      L8_2 = L3_2
      L7_2[1] = L8_2
      L6_2 = L7_2
    end
  end
  L7_2 = ipairs
  L8_2 = L6_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do
    if L12_2 then
      L13_2 = DoesEntityExist
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      if L13_2 then
        L13_2 = SetEntityAsMissionEntity
        L14_2 = L12_2
        L15_2 = true
        L16_2 = true
        L13_2(L14_2, L15_2, L16_2)
        L13_2 = DeleteEntity
        L14_2 = L12_2
        L13_2(L14_2)
        L13_2 = DoesEntityExist
        L14_2 = L12_2
        L13_2 = L13_2(L14_2)
        if L13_2 then
          L13_2 = TriggerEvent
          L14_2 = "FullyDeleteRobberiesEntity"
          L15_2 = L12_2
          L13_2(L14_2, L15_2)
        end
      end
    end
  end
  L7_2 = A0_2.pointProps
  if L7_2 then
    L7_2 = A0_2.pointProps
    L7_2[A1_2] = nil
    L7_2 = A0_2.pointProps
    L8_2 = tostring
    L9_2 = A1_2
    L8_2 = L8_2(L9_2)
    L7_2[L8_2] = nil
  end
end
L42_1 = L151_1
function L151_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2
  if A0_2 then
    L3_2 = A0_2.instance
    if L3_2 then
      L3_2 = A0_2.instance
      L3_2 = L3_2.spawn
      if L3_2 then
        L3_2 = L55_1
        L4_2 = A1_2
        L3_2 = L3_2(L4_2)
        if L3_2 then
          goto lbl_16
        end
      end
    end
  end
  do return end
  ::lbl_16::
  L3_2 = A0_2.preset
  if L3_2 then
    L3_2 = A0_2.preset
    L3_2 = L3_2.lootPoints
    if L3_2 then
      L3_2 = A0_2.preset
      L3_2 = L3_2.lootPoints
      L3_2 = L3_2[A1_2]
      if L3_2 then
        goto lbl_29
      end
    end
  end
  L3_2 = nil
  ::lbl_29::
  if not L3_2 then
    L4_2 = L53_1
    L5_2 = "point"
    L6_2 = A1_2
    L7_2 = A2_2 or L7_2
    if not A2_2 then
      L7_2 = "debug"
    end
    L8_2 = "missing point data"
    L4_2(L5_2, L6_2, L7_2, L8_2)
    return
  end
  L4_2 = A0_2.pointProps
  if L4_2 then
    L4_2 = A0_2.pointProps
    L4_2 = L4_2[A1_2]
    if L4_2 then
      goto lbl_48
    end
  end
  L4_2 = nil
  ::lbl_48::
  L5_2 = L150_1
  L6_2 = L3_2
  L7_2 = A0_2.instance
  L8_2 = L4_2
  L9_2 = math
  L9_2 = L9_2.max
  L10_2 = L148_1
  L11_2 = L3_2
  L10_2 = L10_2(L11_2)
  L11_2 = 1.5
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L9_2(L10_2, L11_2)
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
  L8_2 = L56_1
  L9_2 = L3_2.propHeading
  L10_2 = L3_2.heading
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = L54_1
  L10_2 = "House debug p%s %s | saved %.2f | session %s | primary %s | matches %s"
  L11_2 = L10_2
  L10_2 = L10_2.format
  L12_2 = tostring
  L13_2 = A1_2
  L12_2 = L12_2(L13_2)
  L13_2 = tostring
  L14_2 = A2_2 or L14_2
  if not A2_2 then
    L14_2 = "snapshot"
  end
  L13_2 = L13_2(L14_2)
  L14_2 = tonumber
  L15_2 = L8_2
  L14_2 = L14_2(L15_2)
  if not L14_2 then
    L14_2 = 0.0
  end
  L15_2 = tostring
  L16_2 = L4_2 or L16_2
  if not L4_2 then
    L16_2 = "nil"
  end
  L15_2 = L15_2(L16_2)
  L16_2 = tostring
  L17_2 = L5_2 or L17_2
  if not L5_2 then
    L17_2 = "nil"
  end
  L16_2 = L16_2(L17_2)
  L17_2 = tostring
  L18_2 = L6_2 or L18_2
  if not L6_2 then
    L18_2 = {}
  end
  L18_2 = #L18_2
  L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2 = L17_2(L18_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
  L11_2 = 2500
  L9_2(L10_2, L11_2)
  L9_2 = L53_1
  L10_2 = "point"
  L11_2 = A1_2
  L12_2 = "reason"
  L13_2 = A2_2 or L13_2
  if not A2_2 then
    L13_2 = "snapshot"
  end
  L14_2 = "savedHeading"
  L15_2 = L8_2
  L16_2 = "sessionEntity"
  L17_2 = L4_2 or L17_2
  if not L4_2 then
    L17_2 = "nil"
  end
  L18_2 = "primaryEntity"
  L19_2 = L5_2 or L19_2
  if not L5_2 then
    L19_2 = "nil"
  end
  L20_2 = "worldCoords"
  L21_2 = L7_2 or L21_2
  if not L7_2 then
    L21_2 = "nil"
  end
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)
  L9_2 = ipairs
  L10_2 = L6_2 or L10_2
  if not L6_2 then
    L10_2 = {}
  end
  L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
  for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do
    L15_2 = DoesEntityExist
    L16_2 = L14_2
    L15_2 = L15_2(L16_2)
    if L15_2 then
      L15_2 = L53_1
      L16_2 = "point"
      L17_2 = A1_2
      L18_2 = "candidate"
      L19_2 = L13_2
      L20_2 = "entity"
      L21_2 = L14_2
      L22_2 = "heading"
      L23_2 = GetEntityHeading
      L24_2 = L14_2
      L23_2 = L23_2(L24_2)
      L24_2 = "coords"
      L25_2 = GetEntityCoords
      L26_2 = L14_2
      L25_2 = L25_2(L26_2)
      L26_2 = "model"
      L27_2 = GetEntityModel
      L28_2 = L14_2
      L27_2 = L27_2(L28_2)
      L28_2 = "isSeeded"
      L29_2 = L4_2 == L14_2
      L30_2 = "isPrimary"
      L31_2 = L5_2 == L14_2
      L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2)
    end
  end
end
function L152_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  if A0_2 then
    L3_2 = L55_1
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L3_2 = tonumber
  L4_2 = L11_1.durationMs
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 8000
  end
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L0_3 = GetGameTimer
    L0_3 = L0_3()
    L1_3 = L3_2
    L0_3 = L0_3 + L1_3
    L1_3 = 0
    while true do
      L2_3 = L4_1
      L3_3 = A0_2
      if L2_3 ~= L3_3 then
        break
      end
      L2_3 = GetGameTimer
      L2_3 = L2_3()
      if not (L0_3 > L2_3) then
        break
      end
      L1_3 = L1_3 + 1
      L2_3 = L151_1
      L3_3 = A0_2
      L4_3 = A1_2
      L5_3 = "%s_tick_%s"
      L6_3 = L5_3
      L5_3 = L5_3.format
      L7_3 = A2_2
      if not L7_3 then
        L7_3 = "trace"
      end
      L8_3 = L1_3
      L5_3, L6_3, L7_3, L8_3 = L5_3(L6_3, L7_3, L8_3)
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)
      L2_3 = Wait
      L3_3 = 500
      L2_3(L3_3)
    end
  end
  L4_2(L5_2)
end
function L153_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L3_2 = L150_1
  L4_2 = A0_2
  L5_2 = A1_2
  L6_2 = A2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2, L6_2)
  if L5_2 then
    L6_2 = #L4_2
    if 0 ~= L6_2 then
      goto lbl_13
    end
  end
  L6_2 = nil
  do return L6_2 end
  ::lbl_13::
  L6_2 = L39_1
  L7_2 = A0_2
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L6_2 = L5_2
  end
  L7_2 = L56_1
  L8_2 = A0_2.propHeading
  L9_2 = A0_2.heading
  L7_2 = L7_2(L8_2, L9_2)
  if not L7_2 then
    L7_2 = 0.0
  end
  L7_2 = L7_2 + 0.0
  L8_2 = ipairs
  L9_2 = L4_2
  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
  for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
    if L13_2 == L3_2 then
      L14_2 = SetEntityAsMissionEntity
      L15_2 = L13_2
      L16_2 = true
      L17_2 = true
      L14_2(L15_2, L16_2, L17_2)
      L14_2 = SetEntityInvincible
      L15_2 = L13_2
      L16_2 = true
      L14_2(L15_2, L16_2)
      L14_2 = SetEntityCoords
      L15_2 = L13_2
      L16_2 = L6_2.x
      L17_2 = L6_2.y
      L18_2 = L6_2.z
      L19_2 = false
      L20_2 = false
      L21_2 = false
      L22_2 = false
      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      L14_2 = SetEntityRotation
      L15_2 = L13_2
      L16_2 = 0.0
      L17_2 = 0.0
      L18_2 = L7_2 + 0.0
      L19_2 = 2
      L20_2 = true
      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      L14_2 = SetEntityHeading
      L15_2 = L13_2
      L16_2 = L7_2 + 0.0
      L14_2(L15_2, L16_2)
      L14_2 = FreezeEntityPosition
      L15_2 = L13_2
      L16_2 = true
      L14_2(L15_2, L16_2)
    else
      L14_2 = DeleteEntity
      L15_2 = L13_2
      L14_2(L15_2)
    end
  end
  return L3_2
end
function L154_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2
  L5_2 = tonumber
  L6_2 = A4_2
  L5_2 = L5_2(L6_2)
  A4_2 = L5_2 or A4_2
  if not L5_2 then
    A4_2 = 0
  end
  L5_2 = CreateThread
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = A4_2
    if L0_3 > 0 then
      L0_3 = Wait
      L1_3 = A4_2
      L0_3(L1_3)
    end
    L0_3 = L153_1
    L1_3 = A0_2
    L2_3 = A1_2
    L3_3 = A2_2
    L0_3(L1_3, L2_3, L3_3)
  end
  L5_2(L6_2)
end
function L155_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_2 = A0_2 or L1_2
  if "number" ~= L1_2 or not A0_2 then
    L1_2 = GetHashKey
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
  end
  L2_2 = HasModelLoaded
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    return L1_2
  end
  L2_2 = RequestModel
  L3_2 = L1_2
  L2_2(L3_2)
  L2_2 = GetGameTimer
  L2_2 = L2_2()
  while true do
    L3_2 = HasModelLoaded
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L3_2 = GetGameTimer
    L3_2 = L3_2()
    L3_2 = L3_2 - L2_2
    L4_2 = 10000
    if L3_2 > L4_2 then
      L3_2 = PrintDebug
      L4_2 = "House prop model failed to load"
      L5_2 = tostring
      L6_2 = A0_2
      L5_2 = L5_2(L6_2)
      L6_2 = tostring
      L7_2 = L1_2
      L6_2, L7_2 = L6_2(L7_2)
      L3_2(L4_2, L5_2, L6_2, L7_2)
      L3_2 = L53_1
      L4_2 = "model_load_failed"
      L5_2 = tostring
      L6_2 = A0_2
      L5_2 = L5_2(L6_2)
      L6_2 = tostring
      L7_2 = L1_2
      L6_2, L7_2 = L6_2(L7_2)
      L3_2(L4_2, L5_2, L6_2, L7_2)
      L3_2 = nil
      return L3_2
    end
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
  end
  return L1_2
end
function L156_1(A0_2)
  local L1_2, L2_2
  if not A0_2 then
    return
  end
  L1_2 = CreateThread
  function L2_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3
    while true do
      L0_3 = L4_1
      L1_3 = A0_2
      if L0_3 ~= L1_3 then
        break
      end
      L0_3 = ipairs
      L1_3 = A0_2.preset
      if L1_3 then
        L1_3 = A0_2.preset
        L1_3 = L1_3.lootPoints
        if L1_3 then
          goto lbl_15
        end
      end
      L1_3 = {}
      ::lbl_15::
      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)
      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do
        L6_3 = A0_2.pointProps
        if L6_3 then
          L6_3 = A0_2.pointProps
          L6_3 = L6_3[L4_3]
          if L6_3 then
            goto lbl_25
          end
        end
        L6_3 = nil
        ::lbl_25::
        L7_3 = L71_1
        L8_3 = L5_3
        L7_3 = L7_3(L8_3)
        if L7_3 then
          L7_3 = L81_1
          L8_3 = A0_2
          L9_3 = L4_3
          L7_3 = L7_3(L8_3, L9_3)
          if L7_3 then
            L7_3 = L44_1
            L8_3 = A0_2
            L9_3 = L4_3
            L7_3 = L7_3(L8_3, L9_3)
            if not L7_3 then
              L7_3 = L153_1
              L8_3 = L5_3
              L9_3 = A0_2.instance
              L10_3 = L6_3
              L7_3 = L7_3(L8_3, L9_3, L10_3)
              if L7_3 then
                L8_3 = A0_2.pointProps
                if L8_3 then
                  L8_3 = A0_2.pointProps
                  L8_3[L4_3] = L7_3
                end
              end
            end
          end
        end
      end
      L0_3 = Wait
      L1_3 = 250
      L0_3(L1_3)
    end
  end
  L1_2(L2_2)
end
function L157_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  if A0_2 then
    L1_2 = A0_2.instance
    if L1_2 then
      L1_2 = A0_2.animationSyncId
      if L1_2 then
        goto lbl_10
      end
    end
  end
  do return end
  ::lbl_10::
  L1_2 = ipairs
  L2_2 = A0_2.preset
  if L2_2 then
    L2_2 = A0_2.preset
    L2_2 = L2_2.lootPoints
    if L2_2 then
      goto lbl_20
    end
  end
  L2_2 = {}
  ::lbl_20::
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L38_1
    L8_2 = L6_2
    L9_2 = A0_2.instance
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = L43_1
    if L6_2 then
      L9_2 = L6_2.prop
      if L9_2 then
        goto lbl_33
      end
    end
    L9_2 = ""
    ::lbl_33::
    L8_2 = L8_2(L9_2)
    if L7_2 and "" ~= L8_2 then
      L9_2 = {}
      L10_2 = L8_2
      L9_2[1] = L10_2
      L10_2 = Config
      L10_2 = L10_2.RobberyAnimations
      L10_2 = L10_2[L8_2]
      if L10_2 then
        L10_2 = Config
        L10_2 = L10_2.RobberyAnimations
        L10_2 = L10_2[L8_2]
        L10_2 = L10_2.ReplaceProp
        if L10_2 then
          L10_2 = #L9_2
          L10_2 = L10_2 + 1
          L11_2 = Config
          L11_2 = L11_2.RobberyAnimations
          L11_2 = L11_2[L8_2]
          L11_2 = L11_2.ReplaceProp
          L9_2[L10_2] = L11_2
        end
      end
      if "h4_prop_h4_glass_disp_01a" == L8_2 then
        L10_2 = #L9_2
        L10_2 = L10_2 + 1
        L9_2[L10_2] = "h4_prop_h4_necklace_01a"
      end
      L10_2 = {}
      L11_2 = ipairs
      L12_2 = L9_2
      L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)
      for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do
        L17_2 = L43_1
        L18_2 = L16_2
        L17_2 = L17_2(L18_2)
        L16_2 = L17_2
        if "" ~= L16_2 then
          L17_2 = L10_2[L16_2]
          if not L17_2 then
            L10_2[L16_2] = true
            L17_2 = TriggerEvent
            L18_2 = "Pug:client:DeleteRobberiesEntity"
            L19_2 = L7_2
            L20_2 = GetHashKey
            L21_2 = L16_2
            L20_2 = L20_2(L21_2)
            L21_2 = A0_2.animationSyncId
            L17_2(L18_2, L19_2, L20_2, L21_2)
          end
        end
      end
    end
  end
end
function L158_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = L43_1
  if A0_2 then
    L3_2 = A0_2.prop
    if L3_2 then
      goto lbl_8
    end
  end
  L3_2 = ""
  ::lbl_8::
  L2_2 = L2_2(L3_2)
  if "" ~= L2_2 and A1_2 then
    L3_2 = A1_2.spawn
    if L3_2 then
      goto lbl_18
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_18::
  L3_2 = L39_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = L155_1
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = CreateObjectNoOffset
  L6_2 = L4_2
  L7_2 = L3_2.x
  L8_2 = L3_2.y
  L9_2 = L3_2.z
  L10_2 = false
  L11_2 = false
  L12_2 = false
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L6_2 = DoesEntityExist
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = CreateObject
    L7_2 = L4_2
    L8_2 = L3_2.x
    L9_2 = L3_2.y
    L10_2 = L3_2.z
    L11_2 = false
    L12_2 = false
    L13_2 = false
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L5_2 = L6_2
  end
  L6_2 = DoesEntityExist
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L6_2 = PrintDebug
    L7_2 = "House prop entity failed to create"
    L8_2 = tostring
    L9_2 = L2_2
    L8_2 = L8_2(L9_2)
    L9_2 = tostring
    L10_2 = L4_2
    L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L6_2 = L53_1
    L7_2 = "entity_create_failed"
    L8_2 = tostring
    L9_2 = L2_2
    L8_2 = L8_2(L9_2)
    L9_2 = tostring
    L10_2 = L4_2
    L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L6_2 = nil
    return L6_2
  end
  L6_2 = SetEntityAsMissionEntity
  L7_2 = L5_2
  L8_2 = true
  L9_2 = true
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = SetEntityInvincible
  L7_2 = L5_2
  L8_2 = true
  L6_2(L7_2, L8_2)
  function L6_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L153_1
    L1_3 = A0_2
    L2_3 = A1_2
    L3_3 = L5_2
    L0_3 = L0_3(L1_3, L2_3, L3_3)
    if L0_3 then
      L1_3 = DoesEntityExist
      L2_3 = L0_3
      L1_3 = L1_3(L2_3)
      if L1_3 then
        L5_2 = L0_3
      end
    end
  end
  L7_2 = L6_2
  L7_2()
  L7_2 = L154_1
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = L5_2
  L11_2 = nil
  L12_2 = 50
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
  return L5_2
end
L40_1 = L158_1
function L158_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 then
    L1_2 = A0_2.preset
    if L1_2 then
      L1_2 = A0_2.instance
      if L1_2 then
        goto lbl_10
      end
    end
  end
  do return end
  ::lbl_10::
  L1_2 = L147_1
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = {}
  A0_2.pointProps = L1_2
  L1_2 = ipairs
  L2_2 = A0_2.preset
  L2_2 = L2_2.lootPoints
  if not L2_2 then
    L2_2 = {}
  end
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L44_1
    L8_2 = A0_2
    L9_2 = L5_2
    L7_2 = L7_2(L8_2, L9_2)
    if L7_2 then
      L7_2 = L46_1
      L8_2 = L6_2
      L7_2 = L7_2(L8_2)
    end
    L8_2 = L71_1
    L9_2 = L6_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L8_2 = L81_1
      L9_2 = A0_2
      L10_2 = L5_2
      L8_2 = L8_2(L9_2, L10_2)
      if L8_2 and not L7_2 then
        L8_2 = L40_1
        L9_2 = L6_2
        L10_2 = A0_2.instance
        L8_2 = L8_2(L9_2, L10_2)
        if L8_2 then
          L9_2 = A0_2.pointProps
          L9_2[L5_2] = L8_2
        end
      end
    end
  end
end
function L159_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  if A0_2 and A1_2 then
    L2_2 = A1_2.spawn
    if L2_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = L43_1
  L4_2 = A0_2.prop
  L3_2 = L3_2(L4_2)
  L4_2 = L69_1
  L5_2 = A0_2.pedCoords
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = L49_1
    L5_2 = A0_2.pedCoords
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_25
    end
  end
  L4_2 = nil
  ::lbl_25::
  if L4_2 and "tr_prop_tr_adv_case_01a" ~= L3_2 then
    L5_2 = SetEntityCoords
    L6_2 = L2_2
    L7_2 = A1_2.spawn
    L7_2 = L7_2.x
    L8_2 = L4_2.x
    L7_2 = L7_2 + L8_2
    L8_2 = A1_2.spawn
    L8_2 = L8_2.y
    L9_2 = L4_2.y
    L8_2 = L8_2 + L9_2
    L9_2 = A1_2.spawn
    L9_2 = L9_2.z
    L10_2 = L4_2.z
    L9_2 = L9_2 + L10_2
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L13_2 = false
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L5_2 = SetEntityHeading
    L6_2 = L2_2
    L7_2 = L56_1
    L8_2 = A0_2.pedHeading
    L9_2 = A0_2.heading
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2)
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    return
  end
  L5_2 = L38_1
  L6_2 = A0_2
  L7_2 = A1_2
  L5_2 = L5_2(L6_2, L7_2)
  if L5_2 then
    L6_2 = SetPedHeadingToFaceVector
    L7_2 = L2_2
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
end
function L160_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Config
  L1_2 = L1_2.RobberyAnimations
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L2_2 = Config
    L2_2 = L2_2.Animations
    L3_2 = tonumber
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L1_2 = L2_2[L3_2]
  end
  return L1_2
end
function L161_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = L43_1
  if A0_2 then
    L3_2 = A0_2.animation
    if L3_2 then
      goto lbl_8
    end
  end
  L3_2 = ""
  ::lbl_8::
  L2_2 = L2_2(L3_2)
  if "" ~= L2_2 then
    L3_2 = L160_1
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_17
    end
  end
  L3_2 = nil
  ::lbl_17::
  if not L3_2 then
    L4_2 = Config
    L4_2 = L4_2.Animations
    if L4_2 then
      L4_2 = Config
      L4_2 = L4_2.Animations
      L5_2 = L24_1
      L4_2 = L4_2[L5_2]
      if L4_2 then
        goto lbl_30
        L3_2 = L4_2 or L3_2
      end
    end
    L3_2 = nil
  end
  ::lbl_30::
  if L3_2 then
    L4_2 = L3_2.IsScenario
    if L4_2 then
      L4_2 = L43_1
      L5_2 = L3_2.AnimDict
      L4_2 = L4_2(L5_2)
      if "" ~= L4_2 then
        L4_2 = {}
        L4_2.heading = A1_2
        L5_2 = L3_2.AnimDict
        L4_2.scenario = L5_2
        return L4_2
      end
    end
  end
  if L3_2 then
    L4_2 = L43_1
    L5_2 = L3_2.AnimDict
    L4_2 = L4_2(L5_2)
    if "" ~= L4_2 then
      L4_2 = L43_1
      L5_2 = L3_2.AnimAction
      L4_2 = L4_2(L5_2)
      if "" ~= L4_2 then
        L4_2 = {}
        L4_2.heading = A1_2
        L5_2 = L3_2.AnimDict
        L4_2.animDict = L5_2
        L5_2 = L3_2.AnimAction
        L4_2.animAction = L5_2
        L4_2.animFlag = 49
        return L4_2
      end
    end
  end
  L4_2 = {}
  L4_2.heading = A1_2
  L4_2.animDict = "anim@heists@keypad@"
  L4_2.animAction = "idle_a"
  L4_2.animFlag = 49
  return L4_2
end
function L162_1(A0_2, A1_2)
  local L2_2, L3_2
  if not A1_2 then
    L2_2 = 5000
    return L2_2
  end
  L2_2 = A1_2.NetworkedAnimations
  if L2_2 then
    L2_2 = A0_2.propName
    if "ch_prop_gold_trolly_01a" ~= L2_2 then
      L2_2 = A0_2.propName
      if "ch_prop_cash_low_trolly_01a" ~= L2_2 then
        L2_2 = A0_2.propName
        if "ch_prop_diamond_trolly_01a" ~= L2_2 then
          L2_2 = A0_2.propName
          if "imp_prop_impexp_coke_trolly" ~= L2_2 then
            goto lbl_23
          end
        end
      end
    end
    L2_2 = 36000
    do return L2_2 end
    goto lbl_40
    ::lbl_23::
    L2_2 = A0_2.propName
    if "tr_prop_tr_adv_case_01a" == L2_2 then
      L2_2 = 4800
      return L2_2
    else
      L2_2 = A0_2.propName
      if "p_chem_vial_02b_s" == L2_2 then
        L2_2 = 15000
        return L2_2
      else
        L2_2 = A0_2.propName
        if "h4_prop_h4_safe_01a" == L2_2 then
          L2_2 = 12000
          return L2_2
        end
      end
    end
    ::lbl_40::
    L2_2 = 10000
    return L2_2
  end
  L2_2 = A1_2.IsNetWorkedScene
  if L2_2 then
    L2_2 = 9000
    return L2_2
  end
  L2_2 = A1_2.AnimationOptions
  if L2_2 then
    L2_2 = tonumber
    L3_2 = A1_2.AnimationOptions
    L3_2 = L3_2.EmoteDuration
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_57
    end
  end
  L2_2 = nil
  ::lbl_57::
  if L2_2 and L2_2 > 0 then
    return L2_2
  end
  L3_2 = A1_2.AnimAction
  if "shoplift_mid" == L3_2 then
    L3_2 = L23_1
    return L3_2
  end
  L3_2 = A1_2.SkipWaitTime
  if L3_2 then
    L3_2 = 2500
    return L3_2
  end
  L3_2 = 8000
  return L3_2
end
function L163_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 or not A1_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = L38_1
  L4_2 = A1_2
  L5_2 = A0_2.instance
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = L69_1
  L5_2 = A1_2.pedCoords
  L4_2 = L4_2(L5_2)
  if L4_2 then
    L4_2 = L49_1
    L5_2 = A1_2.pedCoords
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_26
    end
  end
  L4_2 = nil
  ::lbl_26::
  L5_2 = L3_2
  if L4_2 then
    L6_2 = vector3
    L7_2 = A0_2.instance
    L7_2 = L7_2.spawn
    L7_2 = L7_2.x
    L8_2 = L4_2.x
    L7_2 = L7_2 + L8_2
    L8_2 = A0_2.instance
    L8_2 = L8_2.spawn
    L8_2 = L8_2.y
    L9_2 = L4_2.y
    L8_2 = L8_2 + L9_2
    L9_2 = A0_2.instance
    L9_2 = L9_2.spawn
    L9_2 = L9_2.z
    L10_2 = L4_2.z
    L9_2 = L9_2 + L10_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L6_2
  end
  L6_2 = {}
  L7_2 = tonumber
  L8_2 = A1_2.numberValue
  L7_2 = L7_2(L8_2)
  L7_2 = A2_2 or L7_2
  if not L7_2 and not A2_2 then
    L7_2 = 1
  end
  L6_2.stepNumber = L7_2
  L7_2 = L43_1
  L8_2 = A1_2.prop
  L7_2 = L7_2(L8_2)
  L6_2.propName = L7_2
  L7_2 = L43_1
  L8_2 = A1_2.animation
  L7_2 = L7_2(L8_2)
  L6_2.animation = L7_2
  L6_2.pedCoords = L5_2
  L7_2 = L56_1
  L8_2 = A1_2.pedHeading
  L9_2 = A1_2.heading
  L7_2 = L7_2(L8_2, L9_2)
  L6_2.heading = L7_2
  L7_2 = L56_1
  L8_2 = A1_2.propHeading
  L9_2 = A1_2.heading
  L7_2 = L7_2(L8_2, L9_2)
  L6_2.propHeading = L7_2
  L6_2.targetVector = L3_2
  L6_2.hackType = "none"
  L6_2.unlockTime = 0
  return L6_2
end
function L164_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L4_2 = L163_1
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  if L4_2 then
    L5_2 = L4_2.animation
    if "" ~= L5_2 then
      L5_2 = L160_1
      L6_2 = L4_2.animation
      L5_2 = L5_2(L6_2)
      if L5_2 then
        goto lbl_17
      end
    end
  end
  L5_2 = nil
  ::lbl_17::
  if L4_2 then
    L6_2 = tonumber
    L7_2 = L4_2.heading
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_25
    end
  end
  L6_2 = nil
  ::lbl_25::
  if L5_2 then
    L7_2 = L5_2.NetworkedAnimations
    L7_2 = L5_2.IsNetWorkedScene
    L7_2 = L5_2.ReplaceProp
    L7_2 = L5_2.AnimationOptions
    L7_2 = not L7_2 and L7_2
    if L7_2 then
      L8_2 = L5_2.IsScenario
      if L8_2 then
        L8_2 = L43_1
        L9_2 = L5_2.AnimDict
        L8_2 = L8_2(L9_2)
        if "" ~= L8_2 then
          L8_2 = {}
          L8_2.heading = L6_2
          L9_2 = L5_2.AnimDict
          L8_2.scenario = L9_2
          L9_2 = true
          return L8_2, L9_2
        end
      end
    end
    if L7_2 then
      L8_2 = L43_1
      L9_2 = L5_2.AnimDict
      L8_2 = L8_2(L9_2)
      if "" ~= L8_2 then
        L8_2 = L43_1
        L9_2 = L5_2.AnimAction
        L8_2 = L8_2(L9_2)
        if "" ~= L8_2 then
          L8_2 = {}
          L8_2.heading = L6_2
          L9_2 = L5_2.AnimDict
          L8_2.animDict = L9_2
          L9_2 = L5_2.AnimAction
          L8_2.animAction = L9_2
          L8_2.animFlag = 49
          L9_2 = true
          return L8_2, L9_2
        end
      end
    end
  end
  if A3_2 then
    L7_2 = SetPedHeadingToFaceVector
    L8_2 = PlayerPedId
    L8_2 = L8_2()
    L9_2 = A3_2
    L7_2(L8_2, L9_2)
  end
  L7_2 = {}
  L8_2 = L6_2 or L8_2
  if not L6_2 then
    L8_2 = GetEntityHeading
    L9_2 = PlayerPedId
    L9_2 = L9_2()
    L8_2 = L8_2(L9_2)
  end
  L7_2.heading = L8_2
  L7_2.scenario = "PROP_HUMAN_BUM_BIN"
  L8_2 = false
  return L7_2, L8_2
end
function L165_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  if A0_2 then
    L3_2 = A0_2.preset
    if L3_2 then
      L3_2 = A0_2.preset
      L3_2 = L3_2.lootPoints
      if L3_2 then
        L3_2 = A0_2.preset
        L3_2 = L3_2.lootPoints
        L3_2 = L3_2[A1_2]
        if L3_2 then
          goto lbl_16
        end
      end
    end
  end
  L3_2 = nil
  ::lbl_16::
  if A0_2 then
    L4_2 = A0_2.pointProps
    if L4_2 then
      L4_2 = A0_2.pointProps
      L4_2 = L4_2[A1_2]
      if L4_2 then
        goto lbl_26
      end
    end
  end
  L4_2 = nil
  ::lbl_26::
  if L3_2 then
    L5_2 = L150_1
    L6_2 = L3_2
    L7_2 = A0_2.instance
    L8_2 = L4_2
    L9_2 = L148_1
    L10_2 = L3_2
    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2)
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
    if L5_2 then
      goto lbl_39
    end
  end
  L5_2 = nil
  ::lbl_39::
  if L5_2 then
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      if A0_2 then
        L6_2 = A0_2.pointProps
        if L6_2 then
          L6_2 = A0_2.pointProps
          L6_2[A1_2] = L5_2
        end
      end
      return L5_2
    end
  end
  L6_2 = L43_1
  if A2_2 then
    L7_2 = A2_2.propName
    if L7_2 then
      goto lbl_61
    end
  end
  L7_2 = ""
  ::lbl_61::
  L6_2 = L6_2(L7_2)
  if "" ~= L6_2 and A2_2 then
    L7_2 = A2_2.targetVector
    if L7_2 then
      goto lbl_71
    end
  end
  L7_2 = nil
  do return L7_2 end
  ::lbl_71::
  L7_2 = 1.5
  if "tr_prop_tr_container_01a" == L6_2 then
    L7_2 = 2.5
  end
  L8_2 = GetClosestObjectOfType
  L9_2 = A2_2.targetVector
  L10_2 = L7_2
  L11_2 = GetHashKey
  L12_2 = L6_2
  L11_2 = L11_2(L12_2)
  L12_2 = 0
  L13_2 = 0
  L14_2 = 0
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L9_2 = L8_2 or L9_2
  if 0 == L8_2 or not L8_2 then
    L9_2 = nil
  end
  return L9_2
end
function L166_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if A1_2 and A2_2 then
    L3_2 = DoesEntityExist
    L4_2 = A2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_12
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_12::
  if A0_2 then
    L3_2 = A0_2.animationSyncId
    if L3_2 then
      goto lbl_23
    end
  end
  L3_2 = "house_"
  L4_2 = tostring
  L5_2 = GetGameTimer
  L5_2, L6_2, L7_2, L8_2 = L5_2()
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L3_2 = L3_2 .. L4_2
  ::lbl_23::
  L4_2 = L56_1
  L5_2 = A1_2.propHeading
  L6_2 = A1_2.heading
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = vector3
  L6_2 = 0.0
  L7_2 = 0.0
  L8_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = {}
  L7_2 = GetEntityCoords
  L8_2 = A2_2
  L7_2 = L7_2(L8_2)
  L6_2.Coords = L7_2
  L6_2.Rotation = L5_2
  L7_2 = A1_2.propName
  L6_2.PropName = L7_2
  L6_2.RobberyName = L3_2
  L6_2.Stage = A1_2
  L6_2.DataObject = A2_2
  L7_2 = {}
  L7_2.heist_name = L3_2
  L6_2.Heist = L7_2
  L6_2.Heading = L4_2
  L6_2.LocalOnly = true
  L6_2.HouseRobbery = true
  return L6_2
end
function L167_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L3_2 = L163_1
  L4_2 = A0_2
  L5_2 = A2_2
  L6_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if L3_2 then
    L4_2 = L3_2.animation
    if "" ~= L4_2 then
      goto lbl_13
    end
  end
  L4_2 = false
  do return L4_2 end
  ::lbl_13::
  L4_2 = L160_1
  L5_2 = L3_2.animation
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = false
    return L5_2
  end
  L5_2 = L3_2.propName
  if "prop_ld_keypad_01b" == L5_2 then
    L3_2.hackType = "numberpad"
  end
  L5_2 = L165_1
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = L3_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = L55_1
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    L6_2 = L53_1
    L7_2 = "point"
    L8_2 = A1_2
    L9_2 = "animation_scene_object"
    L10_2 = L5_2 or L10_2
    if not L5_2 then
      L10_2 = "nil"
    end
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = L151_1
    L7_2 = A0_2
    L8_2 = A1_2
    L9_2 = "before_animation"
    L6_2(L7_2, L8_2, L9_2)
  end
  L6_2 = L56_1
  L7_2 = L3_2.propHeading
  L8_2 = L3_2.heading
  L6_2 = L6_2(L7_2, L8_2)
  if L5_2 then
    L7_2 = DoesEntityExist
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = SetEntityRotation
      L8_2 = L5_2
      L9_2 = vector3
      L10_2 = 0.0
      L11_2 = 0.0
      L12_2 = L6_2
      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2(L10_2, L11_2, L12_2)
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L7_2 = SetEntityHeading
      L8_2 = L5_2
      L9_2 = L6_2
      L7_2(L8_2, L9_2)
    end
  end
  L7_2 = L166_1
  L8_2 = A0_2
  L9_2 = L3_2
  L10_2 = L5_2
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = Config
  L8_2 = L8_2.RobberyAnimations
  L9_2 = L3_2.animation
  L8_2 = L8_2[L9_2]
  if not L8_2 then
    L8_2 = L3_2.pedCoords
    if L8_2 then
      L8_2 = SetEntityCoords
      L9_2 = PlayerPedId
      L9_2 = L9_2()
      L10_2 = L3_2.pedCoords
      L8_2(L9_2, L10_2)
      L8_2 = SetEntityHeading
      L9_2 = PlayerPedId
      L9_2 = L9_2()
      L10_2 = tonumber
      L11_2 = L3_2.heading
      L10_2 = L10_2(L11_2)
      if not L10_2 then
        L10_2 = 0.0
      end
      L8_2(L9_2, L10_2)
    end
  end
  L8_2 = L162_1
  L9_2 = L3_2
  L10_2 = L4_2
  L8_2 = L8_2(L9_2, L10_2)
  L9_2 = GetGameTimer
  L9_2 = L9_2()
  L10_2 = TryingHack
  L10_2 = not L10_2
  if L10_2 then
    TryingHack = true
  end
  L11_2 = TriggerEvent
  L12_2 = "Pug:client:DoRobberiesAnimation"
  L13_2 = L3_2.animation
  L14_2 = PlayerPedId
  L14_2 = L14_2()
  L15_2 = false
  L16_2 = L7_2
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
  L11_2 = L4_2.ReplaceProp
  if L11_2 and L5_2 then
    L11_2 = DoesEntityExist
    L12_2 = L5_2
    L11_2 = L11_2(L12_2)
    if L11_2 then
      L11_2 = TriggerEvent
      L12_2 = "FullyDeleteRobberiesEntity"
      L13_2 = L5_2
      L11_2(L12_2, L13_2)
      if A0_2 then
        L11_2 = A0_2.pointProps
        if L11_2 then
          L11_2 = A0_2.pointProps
          L11_2[A1_2] = nil
        end
      end
    end
  end
  L11_2 = GetGameTimer
  L11_2 = L11_2()
  L11_2 = L11_2 - L9_2
  L11_2 = L8_2 - L11_2
  if L11_2 > 0 then
    L12_2 = Wait
    L13_2 = L11_2
    L12_2(L13_2)
  end
  L12_2 = L4_2.NetworkedAnimations
  if L12_2 then
    L12_2 = L3_2.hackType
    if "none" ~= L12_2 then
      L12_2 = L3_2.propName
      if "h4_prop_h4_safe_01a" ~= L12_2 then
        L12_2 = Wait
        L13_2 = 2500
        L12_2(L13_2)
    end
    else
      L12_2 = GetJewelryCases
      L13_2 = L3_2.propName
      L12_2 = L12_2(L13_2)
      if L12_2 then
        L12_2 = Wait
        L13_2 = 2500
        L12_2(L13_2)
      end
    end
    L12_2 = TriggerEvent
    L13_2 = "Pug:client:EndMultipleNetworkAnimation"
    L14_2 = L3_2
    L15_2 = L7_2
    L12_2(L13_2, L14_2, L15_2)
  end
  if L10_2 then
    TryingHack = false
  end
  L12_2 = L4_2.ReplaceProp
  if not L12_2 then
    L12_2 = L4_2.NetworkedAnimations
    if not L12_2 then
      L12_2 = ClearPedTasksImmediately
      L13_2 = PlayerPedId
      L13_2, L14_2, L15_2, L16_2 = L13_2()
      L12_2(L13_2, L14_2, L15_2, L16_2)
      L12_2 = ReloadSkin
      L12_2()
    end
  end
  L12_2 = true
  return L12_2
end
function L168_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L0_2 = pairs
  L1_2 = L3_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L34_1
    L7_2 = L4_2
    L6_2(L7_2)
  end
  L0_2 = {}
  L3_1 = L0_2
end
function L169_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = tonumber
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  A0_2 = L1_2
  if A0_2 and 0 ~= A0_2 then
    L1_2 = DoesEntityExist
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = SetEntityAsMissionEntity
      L2_2 = A0_2
      L3_2 = true
      L4_2 = true
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = DeleteEntity
      L2_2 = A0_2
      L1_2(L2_2)
    end
  end
end
function L170_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  if not A0_2 then
    return
  end
  L1_2 = A0_2.worldInterior
  if true == L1_2 then
    return
  end
  L1_2 = type
  L2_2 = A0_2.objects
  L1_2 = L1_2(L2_2)
  if "table" == L1_2 then
    L1_2 = pairs
    L2_2 = A0_2.objects
    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
      L7_2 = L169_1
      L8_2 = L6_2
      L7_2(L8_2)
    end
    return
  end
  L1_2 = L169_1
  L2_2 = A0_2.shellObject
  L1_2(L2_2)
end
function L171_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = L4_1
  if not L1_2 then
    return
  end
  L1_2 = L4_1
  L2_2 = true == A0_2
  if L2_2 then
    L3_2 = IsScreenFadedOut
    L3_2 = L3_2()
    if not L3_2 then
      L3_2 = DoScreenFadeOut
      L4_2 = 1000
      L3_2(L4_2)
      while true do
        L3_2 = IsScreenFadedOut
        L3_2 = L3_2()
        if L3_2 then
          break
        end
        L3_2 = Wait
        L4_2 = 0
        L3_2(L4_2)
      end
    end
  end
  L3_2 = L86_1
  L4_2 = false
  L5_2 = 0.0
  L6_2 = true
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = L168_1
  L3_2()
  L3_2 = L91_1
  L4_2 = L1_2
  L3_2(L4_2)
  L3_2 = L147_1
  L4_2 = L1_2
  L3_2(L4_2)
  L3_2 = L157_1
  L4_2 = L1_2
  L3_2(L4_2)
  L3_2 = L170_1
  L4_2 = L1_2.instance
  L3_2(L4_2)
  if A0_2 then
    L3_2 = L1_2.outside
    if L3_2 then
      L3_2 = SetEntityCoords
      L4_2 = PlayerPedId
      L4_2 = L4_2()
      L5_2 = L1_2.outside
      L5_2 = L5_2.coords
      L5_2 = L5_2.x
      L6_2 = L1_2.outside
      L6_2 = L6_2.coords
      L6_2 = L6_2.y
      L7_2 = L1_2.outside
      L7_2 = L7_2.coords
      L7_2 = L7_2.z
      L8_2 = false
      L9_2 = false
      L10_2 = false
      L11_2 = false
      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      L3_2 = SetEntityHeading
      L4_2 = PlayerPedId
      L4_2 = L4_2()
      L5_2 = L1_2.outside
      L5_2 = L5_2.heading
      if not L5_2 then
        L5_2 = 0.0
      end
      L3_2(L4_2, L5_2)
    end
  end
  L3_2 = L106_1
  L3_2()
  L3_2 = nil
  L4_1 = L3_2
  if L2_2 then
    L3_2 = DoScreenFadeIn
    L4_2 = 1000
    L3_2(L4_2)
  end
end
L28_1 = L171_1
function L171_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
    A0_2 = L2_2
  end
  L2_2 = GetEntityCoords
  L3_2 = PlayerPedId
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L3_2()
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  if A1_2 then
    L3_2 = L49_1
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_29
    end
  end
  L3_2 = vector3
  L4_2 = L2_2.x
  L5_2 = L2_2.y
  L6_2 = L2_2.z
  L6_2 = L6_2 + 100.0
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  ::lbl_29::
  L4_2 = L64_1
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L5_2 = vector3
  L6_2 = L3_2.x
  L7_2 = L3_2.y
  L8_2 = L3_2.z
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = GetResourceState
  L7_2 = "qb-interior"
  L6_2 = L6_2(L7_2)
  if "started" ~= L6_2 and A0_2 then
    L6_2 = A0_2.model
    if "shell_trailer" ~= L6_2 then
      L6_2 = A0_2.model
      if "modernhotel_shell" ~= L6_2 then
        goto lbl_58
      end
    end
    L6_2 = Notify
    L7_2 = "qb-interior IS NOT STARTED PLEASE DOWNLOAD IT FROM GITHUB"
    L8_2 = "error"
    L6_2(L7_2, L8_2)
    L6_2 = print
    L7_2 = "^1 qb-interior IS NOT STARTED PLEASE DOWNLOAD IT FROM GITHUB"
    L6_2(L7_2)
    return
  end
  ::lbl_58::
  L6_2 = GetResourceState
  L7_2 = "K4MB1-StarterShells"
  L6_2 = L6_2(L7_2)
  if "started" ~= L6_2 and A0_2 then
    L6_2 = A0_2.model
    if "k4_v16low1_shell" ~= L6_2 then
      L6_2 = A0_2.model
      if "k4_house4_furn" ~= L6_2 then
        goto lbl_79
      end
    end
    L6_2 = Notify
    L7_2 = "K4MB1-StarterShells IS NOT STARTED PLEASE DOWNLOAD IT FROM GITHUB"
    L8_2 = "error"
    L6_2(L7_2, L8_2)
    L6_2 = print
    L7_2 = "^1 K4MB1-StarterShells IS NOT STARTED PLEASE DOWNLOAD IT FROM GITHUB"
    L6_2(L7_2)
    return
  end
  ::lbl_79::
  L6_2 = GetResourceState
  L7_2 = "lev_apartment"
  L6_2 = L6_2(L7_2)
  if "started" ~= L6_2 and A0_2 then
    L6_2 = A0_2.model
    if "lev_apartment_shell" == L6_2 then
      L6_2 = Notify
      L7_2 = "lev_apartment IS NOT STARTED PLEASE DOWNLOAD IT FROM GITHUB"
      L8_2 = "error"
      L6_2(L7_2, L8_2)
      L6_2 = print
      L7_2 = "^1 lev_apartment IS NOT STARTED PLEASE DOWNLOAD IT FROM GITHUB"
      L6_2(L7_2)
      return
    end
  end
  L6_2 = L63_1
  L7_2 = A0_2
  L6_2 = L6_2(L7_2)
  if L6_2 then
    L6_2 = DoScreenFadeOut
    L7_2 = 300
    L6_2(L7_2)
    while true do
      L6_2 = IsScreenFadedOut
      L6_2 = L6_2()
      if L6_2 then
        break
      end
      L6_2 = Wait
      L7_2 = 0
      L6_2(L7_2)
    end
    L6_2 = vector3
    L7_2 = L4_2.x
    L8_2 = L4_2.y
    L9_2 = L4_2.z
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = L66_1
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
    L7_2 = SetEntityCoords
    L8_2 = PlayerPedId
    L8_2 = L8_2()
    L9_2 = L6_2.x
    L10_2 = L6_2.y
    L11_2 = L6_2.z
    L12_2 = false
    L13_2 = false
    L14_2 = false
    L15_2 = false
    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
    L7_2 = SetEntityHeading
    L8_2 = PlayerPedId
    L8_2 = L8_2()
    L9_2 = L4_2.w
    L7_2(L8_2, L9_2)
    L7_2 = DoScreenFadeIn
    L8_2 = 300
    L7_2(L8_2)
    L7_2 = {}
    L8_2 = vector3
    L9_2 = 0.0
    L10_2 = 0.0
    L11_2 = 0.0
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    L7_2.spawn = L8_2
    L7_2.enterOffset = L4_2
    L7_2.worldInterior = true
    return L7_2
  end
  L6_2 = DoScreenFadeOut
  L7_2 = 300
  L6_2(L7_2)
  while true do
    L6_2 = IsScreenFadedOut
    L6_2 = L6_2()
    if L6_2 then
      break
    end
    L6_2 = Wait
    L7_2 = 0
    L6_2(L7_2)
  end
  L6_2 = RequestCollisionAtCoord
  L7_2 = L5_2.x
  L8_2 = L5_2.y
  L9_2 = L5_2.z
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = L59_1
  L7_2 = A0_2.model
  L6_2 = L6_2(L7_2)
  if not L6_2 then
    L7_2 = DoScreenFadeIn
    L8_2 = 100
    L7_2(L8_2)
    L7_2 = print
    L8_2 = "^2 No Model hash loaded for this house"
    L7_2(L8_2)
    L7_2 = nil
    return L7_2
  end
  L7_2 = CreateObject
  L8_2 = L6_2
  L9_2 = L5_2.x
  L10_2 = L5_2.y
  L11_2 = L5_2.z
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L8_2 = DoesEntityExist
  L9_2 = L7_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = DoScreenFadeIn
    L9_2 = 100
    L8_2(L9_2)
    L8_2 = SetModelAsNoLongerNeeded
    L9_2 = L6_2
    L8_2(L9_2)
    L8_2 = print
    L9_2 = "^2 No shellObject exist for this house"
    L8_2(L9_2)
    L8_2 = nil
    return L8_2
  end
  L8_2 = SetEntityAsMissionEntity
  L9_2 = L7_2
  L10_2 = true
  L11_2 = true
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = FreezeEntityPosition
  L9_2 = L7_2
  L10_2 = true
  L8_2(L9_2, L10_2)
  L8_2 = GetGameTimer
  L8_2 = L8_2()
  while true do
    L9_2 = HasCollisionLoadedAroundEntity
    L10_2 = L7_2
    L9_2 = L9_2(L10_2)
    if L9_2 then
      break
    end
    L9_2 = GetGameTimer
    L9_2 = L9_2()
    L9_2 = L9_2 - L8_2
    L10_2 = 2500
    if not (L9_2 < L10_2) then
      break
    end
    L9_2 = RequestCollisionAtCoord
    L10_2 = L5_2.x
    L11_2 = L5_2.y
    L12_2 = L5_2.z
    L9_2(L10_2, L11_2, L12_2)
    L9_2 = Wait
    L10_2 = 0
    L9_2(L10_2)
  end
  L9_2 = SetEntityCoords
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = L5_2.x
  L12_2 = L4_2.x
  L11_2 = L11_2 + L12_2
  L12_2 = L5_2.y
  L13_2 = L4_2.y
  L12_2 = L12_2 + L13_2
  L13_2 = L5_2.z
  L14_2 = L4_2.z
  L13_2 = L13_2 + L14_2
  L14_2 = false
  L15_2 = false
  L16_2 = false
  L17_2 = false
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L9_2 = SetEntityHeading
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = L4_2.w
  L9_2(L10_2, L11_2)
  L9_2 = DoScreenFadeIn
  L10_2 = 100
  L9_2(L10_2)
  L9_2 = SetModelAsNoLongerNeeded
  L10_2 = L6_2
  L9_2(L10_2)
  L9_2 = {}
  L9_2.shellObject = L7_2
  L9_2.spawn = L5_2
  L9_2.enterOffset = L4_2
  return L9_2
end
function L172_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2
  L5_2 = A4_2 or nil
  if not A4_2 then
    L5_2 = L77_1
    L6_2 = A0_2.id
    L5_2 = L5_2(L6_2)
  end
  L6_2 = type
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  if "table" == L6_2 then
    L6_2 = type
    L7_2 = L5_2.lootedPoints
    L6_2 = L6_2(L7_2)
    if "table" == L6_2 then
      L6_2 = L5_2.lootedPoints
      if L6_2 then
        goto lbl_21
      end
    end
  end
  L6_2 = {}
  ::lbl_21::
  L7_2 = L73_1
  L8_2 = A0_2.entry
  L7_2 = L7_2(L8_2)
  L8_2 = L105_1
  L9_2 = A0_2.id
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L9_2 = Notify
    L10_2 = "Failed to enter the house instance."
    L11_2 = "error"
    L9_2(L10_2, L11_2)
    return
  end
  L9_2 = L49_1
  L10_2 = A0_2.entry
  if L10_2 then
    L10_2 = A0_2.entry
    L10_2 = L10_2.coords
    if L10_2 then
      goto lbl_44
    end
  end
  L10_2 = {}
  ::lbl_44::
  L9_2 = L9_2(L10_2)
  L10_2 = L70_1
  L11_2 = A0_2.entry
  if L11_2 then
    L11_2 = A0_2.entry
    L11_2 = L11_2.coords
    if L11_2 then
      goto lbl_54
    end
  end
  L11_2 = nil
  ::lbl_54::
  L10_2 = L10_2(L11_2)
  if L10_2 then
    L10_2 = GetEntityCoords
    L11_2 = PlayerPedId
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L11_2()
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
    L9_2 = L10_2
  end
  L10_2 = vector3
  L11_2 = L9_2.x
  L12_2 = L9_2.y
  L13_2 = L9_2.z
  L13_2 = L13_2 + 100.0
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L11_2 = L171_1
  L12_2 = A1_2
  L13_2 = L10_2
  L11_2 = L11_2(L12_2, L13_2)
  if not L11_2 then
    L12_2 = L106_1
    L12_2()
    L12_2 = Notify
    L13_2 = Config
    L13_2 = L13_2.T
    L14_2 = "HouseShellLoadFailed"
    L13_2 = L13_2(L14_2)
    L14_2 = "error"
    L12_2(L13_2, L14_2)
    return
  end
  L12_2 = {}
  L12_2.location = A0_2
  L12_2.shell = A1_2
  L12_2.preset = A2_2
  L12_2.instance = L11_2
  L13_2 = "house_%s_%s"
  L14_2 = L13_2
  L13_2 = L13_2.format
  L15_2 = L43_1
  L16_2 = A0_2.id
  L15_2 = L15_2(L16_2)
  L16_2 = tostring
  L17_2 = GetGameTimer
  L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L17_2()
  L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L12_2.animationSyncId = L13_2
  L13_2 = "house_session_%s_%s"
  L14_2 = L13_2
  L13_2 = L13_2.format
  L15_2 = L43_1
  L16_2 = A0_2.id
  L15_2 = L15_2(L16_2)
  L16_2 = tostring
  L17_2 = GetGameTimer
  L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L17_2()
  L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)
  L12_2.assetTag = L13_2
  L13_2 = {}
  L14_2 = L7_2.coords
  L13_2.coords = L14_2
  L14_2 = L7_2.heading
  L13_2.heading = L14_2
  L12_2.outside = L13_2
  L12_2.routingBucketActive = true
  L12_2.randomizeHomeOwnerModel = true
  L13_2 = {}
  L12_2.looted = L13_2
  L13_2 = {}
  L12_2.busyLootPoints = L13_2
  L13_2 = type
  L14_2 = L5_2
  L13_2 = L13_2(L14_2)
  if "table" == L13_2 then
    L13_2 = type
    L14_2 = L5_2.activeLootPoints
    L13_2 = L13_2(L14_2)
    if "table" == L13_2 then
      L13_2 = L5_2.activeLootPoints
      if L13_2 then
        goto lbl_143
      end
    end
  end
  L13_2 = {}
  ::lbl_143::
  L12_2.activeLootPoints = L13_2
  L13_2 = type
  L14_2 = L5_2
  L13_2 = L13_2(L14_2)
  L13_2 = "table" == L13_2
  L12_2.activeLootPointsSet = L13_2
  L13_2 = type
  L14_2 = L5_2
  L13_2 = L13_2(L14_2)
  L13_2 = "table" == L13_2
  L12_2.securityDisabled = L13_2
  L12_2.securityBusy = false
  L12_2.disturbanceLevel = 0.0
  L12_2.disturbanceTriggered = false
  L12_2.homeOwnerAwake = false
  L4_1 = L12_2
  L12_2 = L82_1
  L13_2 = L4_1
  L12_2(L13_2)
  L12_2 = pairs
  L13_2 = L6_2
  L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
  for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do
    if true == L17_2 then
      L18_2 = tonumber
      L19_2 = L16_2
      L18_2 = L18_2(L19_2)
      if not L18_2 then
        L18_2 = L16_2
      end
      L19_2 = L4_1.looted
      L19_2[L18_2] = true
      L19_2 = L4_1.looted
      L20_2 = tostring
      L21_2 = L18_2
      L20_2 = L20_2(L21_2)
      L19_2[L20_2] = true
    end
  end
  L12_2 = L97_1
  L13_2 = L4_1
  L12_2(L13_2)
  L12_2 = L158_1
  L13_2 = L4_1
  L12_2(L13_2)
  L12_2 = L156_1
  L13_2 = L4_1
  L12_2(L13_2)
  L12_2 = vector3
  L13_2 = L11_2.spawn
  L13_2 = L13_2.x
  L14_2 = L11_2.enterOffset
  L14_2 = L14_2.x
  L13_2 = L13_2 + L14_2
  L14_2 = L11_2.spawn
  L14_2 = L14_2.y
  L15_2 = L11_2.enterOffset
  L15_2 = L15_2.y
  L14_2 = L14_2 + L15_2
  L15_2 = L11_2.spawn
  L15_2 = L15_2.z
  L16_2 = L11_2.enterOffset
  L16_2 = L16_2.z
  L15_2 = L15_2 + L16_2
  L12_2 = L12_2(L13_2, L14_2, L15_2)
  L13_2 = "houseExit_%s"
  L14_2 = L13_2
  L13_2 = L13_2.format
  L15_2 = A0_2.id
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = L3_1
  L14_2[L13_2] = true
  L14_2 = L35_1
  L15_2 = L13_2
  L16_2 = L12_2
  L17_2 = "fa-solid fa-door-open"
  L18_2 = "Leave House"
  function L19_2()
    local L0_3, L1_3
    L0_3 = L28_1
    L1_3 = true
    L0_3(L1_3)
  end
  L14_2(L15_2, L16_2, L17_2, L18_2, L19_2)
  L14_2 = L129_1
  L15_2 = L4_1
  L14_2(L15_2)
  L14_2 = ipairs
  L15_2 = A2_2.lootPoints
  if not L15_2 then
    L15_2 = {}
  end
  L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
  for L18_2, L19_2 in L14_2, L15_2, L16_2, L17_2 do
    L20_2 = L71_1
    L21_2 = L19_2
    L20_2 = L20_2(L21_2)
    if L20_2 then
      L20_2 = L81_1
      L21_2 = L4_1
      L22_2 = L18_2
      L20_2 = L20_2(L21_2, L22_2)
      if L20_2 then
        L20_2 = L44_1
        L21_2 = L4_1
        L22_2 = L18_2
        L20_2 = L20_2(L21_2, L22_2)
        if not L20_2 then
          L20_2 = L36_1
          L21_2 = L4_1
          L22_2 = L18_2
          L23_2 = L19_2
          L20_2(L21_2, L22_2, L23_2)
        end
      end
    end
  end
  L14_2 = L4_1
  L15_2 = CreateThread
  function L16_2()
    local L0_3, L1_3
    L0_3 = Wait
    L1_3 = 750
    L0_3(L1_3)
    L0_3 = L4_1
    L1_3 = L14_2
    if L0_3 == L1_3 then
      L0_3 = L111_1
      L0_3()
    end
  end
  L15_2(L16_2)
  L15_2 = Wait
  L16_2 = 500
  L15_2(L16_2)
  L15_2 = L99_1
  L16_2 = L4_1
  L15_2(L16_2)
  L15_2 = Notify
  L16_2 = A3_2 or L16_2
  if not A3_2 then
    L16_2 = Config
    L16_2 = L16_2.T
    L17_2 = "SlippedInsideHouse"
    L16_2 = L16_2(L17_2)
  end
  L17_2 = "success"
  L15_2(L16_2, L17_2)
end
function L173_1(A0_2)
  local L1_2, L2_2
  L1_2 = L170_1
  L2_2 = A0_2
  L1_2(L2_2)
end
function L174_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = "%s:%s"
  L3_2 = L2_2
  L2_2 = L2_2.format
  L4_2 = L43_1
  if A0_2 then
    L5_2 = A0_2.id
    if L5_2 then
      goto lbl_13
    end
    L5_2 = A0_2.model
    if L5_2 then
      goto lbl_13
    end
  end
  L5_2 = ""
  ::lbl_13::
  L4_2 = L4_2(L5_2)
  L5_2 = L43_1
  if A1_2 then
    L6_2 = A1_2.id
    if L6_2 then
      goto lbl_21
    end
  end
  L6_2 = ""
  ::lbl_21::
  L5_2, L6_2 = L5_2(L6_2)
  return L2_2(L3_2, L4_2, L5_2, L6_2)
end
function L175_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = L49_1
  L2_2 = A0_2 or L2_2
  if not A0_2 then
    L2_2 = {}
  end
  L1_2 = L1_2(L2_2)
  L2_2 = vector3
  L3_2 = L1_2.x
  L4_2 = L1_2.y
  L5_2 = L1_2.z
  L5_2 = L5_2 + 100.0
  return L2_2(L3_2, L4_2, L5_2)
end
function L176_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = L49_1
  if A0_2 then
    L3_2 = A0_2.pedCoords
    if L3_2 then
      goto lbl_14
    end
  end
  if A0_2 then
    L3_2 = A0_2.coords
    if L3_2 then
      goto lbl_14
    end
  end
  L3_2 = {}
  ::lbl_14::
  L2_2 = L2_2(L3_2)
  L3_2 = tonumber
  L4_2 = A0_2 or L4_2
  if A0_2 then
    L4_2 = A0_2.pedHeading
    if not L4_2 then
      L4_2 = A0_2.heading
    end
  end
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 0.0
  end
  L4_2 = vector3
  L5_2 = A1_2.spawn
  L5_2 = L5_2.x
  L6_2 = L2_2.x
  L5_2 = L5_2 + L6_2
  L6_2 = A1_2.spawn
  L6_2 = L6_2.y
  L7_2 = L2_2.y
  L6_2 = L6_2 + L7_2
  L7_2 = A1_2.spawn
  L7_2 = L7_2.z
  L8_2 = L2_2.z
  L7_2 = L7_2 + L8_2
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = L3_2
  return L4_2, L5_2
end
function L177_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = L5_1
  if not L1_2 then
    return
  end
  L1_2 = L91_1
  L2_2 = L5_1
  L1_2(L2_2)
  L1_2 = L173_1
  L2_2 = L5_1.instance
  L1_2(L2_2)
  if A0_2 then
    L1_2 = L5_1.outside
    if L1_2 then
      L1_2 = SetEntityCoords
      L2_2 = PlayerPedId
      L2_2 = L2_2()
      L3_2 = L5_1.outside
      L3_2 = L3_2.coords
      L3_2 = L3_2.x
      L4_2 = L5_1.outside
      L4_2 = L4_2.coords
      L4_2 = L4_2.y
      L5_2 = L5_1.outside
      L5_2 = L5_2.coords
      L5_2 = L5_2.z
      L6_2 = false
      L7_2 = false
      L8_2 = false
      L9_2 = false
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
      L1_2 = SetEntityHeading
      L2_2 = PlayerPedId
      L2_2 = L2_2()
      L3_2 = L5_1.outside
      L3_2 = L3_2.heading
      if not L3_2 then
        L3_2 = 0.0
      end
      L1_2(L2_2, L3_2)
    end
  end
  L1_2 = nil
  L5_1 = L1_2
end
CleanupHouseEditorPreview = L177_1
function L177_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L2_2 = A0_2 or L2_2
  if "table" ~= L2_2 or not A0_2 then
    L2_2 = {}
  end
  L3_2 = type
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L3_2 = A1_2 or L3_2
  if "table" ~= L3_2 or not A1_2 then
    L3_2 = {}
  end
  L4_2 = L174_1
  L5_2 = L2_2
  L6_2 = L3_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = L43_1
  L6_2 = L2_2.model
  L5_2 = L5_2(L6_2)
  if "" == L5_2 then
    L5_2 = false
    L6_2 = "No shell model was provided."
    return L5_2, L6_2
  end
  L5_2 = L3_2.lootPoints
  if L5_2 then
    L5_2 = L3_2.lootPoints
    L5_2 = #L5_2
    if 0 ~= L5_2 then
      goto lbl_41
    end
  end
  L5_2 = false
  L6_2 = "That preset has no placed points."
  do return L5_2, L6_2 end
  ::lbl_41::
  L5_2 = L5_1
  if L5_2 then
    L5_2 = L5_1.cacheKey
    if L5_2 == L4_2 then
      L5_1.shell = L2_2
      L5_1.preset = L3_2
      L5_2 = L97_1
      L6_2 = L5_1
      L5_2(L6_2)
      L5_2 = L41_1
      L6_2 = L5_1
      L5_2(L6_2)
      L5_2 = true
      return L5_2
    end
  end
  L5_2 = L5_1
  if L5_2 then
    L5_2 = L5_1.outside
    if L5_2 then
      goto lbl_77
    end
  end
  L5_2 = {}
  L6_2 = L51_1
  L7_2 = GetEntityCoords
  L8_2 = PlayerPedId
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2()
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2.coords = L6_2
  L6_2 = GetEntityHeading
  L7_2 = PlayerPedId
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2()
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2.heading = L6_2
  ::lbl_77::
  L6_2 = L5_1
  if L6_2 then
    L6_2 = L91_1
    L7_2 = L5_1
    L6_2(L7_2)
    L6_2 = L173_1
    L7_2 = L5_1.instance
    L6_2(L7_2)
  end
  L6_2 = L171_1
  L7_2 = L2_2
  L8_2 = L175_1
  L9_2 = L5_2.coords
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  if not L6_2 then
    L7_2 = false
    L8_2 = "That shell could not be loaded."
    return L7_2, L8_2
  end
  L7_2 = {}
  L7_2.cacheKey = L4_2
  L7_2.shell = L2_2
  L7_2.preset = L3_2
  L7_2.instance = L6_2
  L8_2 = "house_preview_%s"
  L9_2 = L8_2
  L8_2 = L8_2.format
  L11_2 = L4_2
  L10_2 = L4_2.gsub
  L12_2 = "[^%w_%-]"
  L13_2 = "_"
  L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2.assetTag = L8_2
  L7_2.outside = L5_2
  L5_1 = L7_2
  L7_2 = L97_1
  L8_2 = L5_1
  L7_2(L8_2)
  L7_2 = L41_1
  L8_2 = L5_1
  L7_2(L8_2)
  L7_2 = true
  return L7_2
end
function L178_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L3_2 = L177_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2, L4_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L5_2 = false
    L6_2 = L4_2
    return L5_2, L6_2
  end
  L5_2 = tonumber
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 1
  end
  L6_2 = L5_1.preset
  if L6_2 then
    L6_2 = L5_1.preset
    L6_2 = L6_2.lootPoints
    if L6_2 then
      L6_2 = L5_1.preset
      L6_2 = L6_2.lootPoints
      L6_2 = L6_2[L5_2]
    end
  end
  if not L6_2 then
    L7_2 = false
    L8_2 = "That point could not be found."
    return L7_2, L8_2
  end
  L7_2 = L176_1
  L8_2 = L6_2
  L9_2 = L5_1.instance
  L7_2, L8_2 = L7_2(L8_2, L9_2)
  L9_2 = SetEntityCoords
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = L7_2.x
  L12_2 = L7_2.y
  L13_2 = L7_2.z
  L14_2 = false
  L15_2 = false
  L16_2 = false
  L17_2 = false
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L9_2 = SetEntityHeading
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = L8_2
  L9_2(L10_2, L11_2)
  L9_2 = true
  return L9_2
end
function L179_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if true == A4_2 then
    L5_2 = L69_1
    L6_2 = A2_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = L70_1
      L6_2 = A2_2
      L5_2 = L5_2(L6_2)
      if not L5_2 then
        goto lbl_16
      end
    end
  end
  L5_2 = false
  L6_2 = "That placement has not been placed yet."
  do return L5_2, L6_2 end
  ::lbl_16::
  L5_2 = L177_1
  L6_2 = A0_2
  L7_2 = A1_2
  L5_2, L6_2 = L5_2(L6_2, L7_2)
  if not L5_2 then
    L7_2 = false
    L8_2 = L6_2
    return L7_2, L8_2
  end
  L7_2 = L49_1
  L8_2 = A2_2 or L8_2
  if not A2_2 then
    L8_2 = {}
  end
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L8_2 = false
    L9_2 = "That placement could not be found."
    return L8_2, L9_2
  end
  L8_2 = vector3
  L9_2 = L5_1.instance
  L9_2 = L9_2.spawn
  L9_2 = L9_2.x
  L10_2 = L7_2.x
  L9_2 = L9_2 + L10_2
  L10_2 = L5_1.instance
  L10_2 = L10_2.spawn
  L10_2 = L10_2.y
  L11_2 = L7_2.y
  L10_2 = L10_2 + L11_2
  L11_2 = L5_1.instance
  L11_2 = L11_2.spawn
  L11_2 = L11_2.z
  L12_2 = L7_2.z
  L11_2 = L11_2 + L12_2
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = SetEntityCoords
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = L8_2.x
  L12_2 = L8_2.y
  L13_2 = L8_2.z
  L14_2 = false
  L15_2 = false
  L16_2 = false
  L17_2 = false
  L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L9_2 = SetEntityHeading
  L10_2 = PlayerPedId
  L10_2 = L10_2()
  L11_2 = tonumber
  L12_2 = A3_2
  L11_2 = L11_2(L12_2)
  if not L11_2 then
    L11_2 = 0.0
  end
  L9_2(L10_2, L11_2)
  L9_2 = true
  return L9_2
end
function L180_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_2 = type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = type
    L4_2 = A0_2.Target
    L3_2 = L3_2(L4_2)
    if "table" == L3_2 then
      goto lbl_13
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_13::
  L3_2 = L49_1
  L4_2 = A0_2.Target
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = L49_1
  L5_2 = A0_2.PedCoords
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = L3_2
  end
  L5_2 = L43_1
  L6_2 = A0_2.TargetText
  if not L6_2 then
    L6_2 = A0_2.targetText
    if not L6_2 then
      L6_2 = A0_2.TargetLabel
      if not L6_2 then
        L6_2 = A0_2.targetLabel
        if not L6_2 then
          L6_2 = A0_2.optionLabel
          if not L6_2 then
            L6_2 = A0_2.Name
            if not L6_2 then
              L6_2 = "Search"
            end
          end
        end
      end
    end
  end
  L5_2 = L5_2(L6_2)
  if "" == L5_2 then
    L5_2 = "Search"
  end
  L6_2 = L57_1
  L7_2 = A0_2.Heading
  L8_2 = A0_2.PropHeading
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L57_1
  L8_2 = A0_2.PropHeading
  L9_2 = A0_2.Heading
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = {}
  L9_2 = "loot_%s_%s"
  L10_2 = L9_2
  L9_2 = L9_2.format
  L11_2 = A2_2
  L12_2 = tostring
  L13_2 = GetGameTimer
  L13_2 = L13_2()
  L12_2, L13_2 = L12_2(L13_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2)
  L8_2.id = L9_2
  L8_2.label = L5_2
  L9_2 = {}
  L10_2 = L3_2.x
  L11_2 = A1_2.x
  L10_2 = L10_2 - L11_2
  L9_2.x = L10_2
  L10_2 = L3_2.y
  L11_2 = A1_2.y
  L10_2 = L10_2 - L11_2
  L9_2.y = L10_2
  L10_2 = L3_2.z
  L11_2 = A1_2.z
  L10_2 = L10_2 - L11_2
  L9_2.z = L10_2
  L8_2.coords = L9_2
  L8_2.heading = L6_2
  L9_2 = {}
  L10_2 = L4_2.x
  L11_2 = A1_2.x
  L10_2 = L10_2 - L11_2
  L9_2.x = L10_2
  L10_2 = L4_2.y
  L11_2 = A1_2.y
  L10_2 = L10_2 - L11_2
  L9_2.y = L10_2
  L10_2 = L4_2.z
  L11_2 = A1_2.z
  L10_2 = L10_2 - L11_2
  L9_2.z = L10_2
  L8_2.pedCoords = L9_2
  L8_2.pedHeading = L6_2
  L9_2 = L43_1
  L10_2 = A0_2.Prop
  if not L10_2 then
    L10_2 = ""
  end
  L9_2 = L9_2(L10_2)
  L8_2.prop = L9_2
  L9_2 = L43_1
  L10_2 = A0_2.Animation
  if not L10_2 then
    L10_2 = ""
  end
  L9_2 = L9_2(L10_2)
  L8_2.animation = L9_2
  L8_2.propHeading = L7_2
  L8_2.isPlaced = true
  L8_2.placed = true
  return L8_2
end
function L181_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 and A1_2 then
    L2_2 = A1_2.spawn
    if L2_2 then
      L2_2 = L71_1
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      if L2_2 then
        goto lbl_15
      end
    end
  end
  L2_2 = nil
  do return L2_2 end
  ::lbl_15::
  L2_2 = L49_1
  L3_2 = A0_2.coords
  if not L3_2 then
    L3_2 = {}
  end
  L2_2 = L2_2(L3_2)
  L3_2 = vector3
  L4_2 = A1_2.spawn
  L4_2 = L4_2.x
  L5_2 = L2_2.x
  L4_2 = L4_2 + L5_2
  L5_2 = A1_2.spawn
  L5_2 = L5_2.y
  L6_2 = L2_2.y
  L5_2 = L5_2 + L6_2
  L6_2 = A1_2.spawn
  L6_2 = L6_2.z
  L7_2 = L2_2.z
  L6_2 = L6_2 + L7_2
  return L3_2(L4_2, L5_2, L6_2)
end
L38_1 = L181_1
function L181_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L38_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L3_2 = nil
    return L3_2
  end
  L3_2 = L43_1
  if A0_2 then
    L4_2 = A0_2.prop
    if L4_2 then
      goto lbl_16
    end
  end
  L4_2 = ""
  ::lbl_16::
  L3_2 = L3_2(L4_2)
  if "tr_prop_tr_adv_case_01a" == L3_2 then
    L3_2 = vector3
    L4_2 = L2_2.x
    L5_2 = L2_2.y
    L6_2 = L2_2.z
    L6_2 = L6_2 + 0.3
    return L3_2(L4_2, L5_2, L6_2)
  end
  return L2_2
end
L39_1 = L181_1
function L181_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L2_2 = L43_1
  if A0_2 then
    L3_2 = A0_2.prop
    if L3_2 then
      goto lbl_8
    end
  end
  L3_2 = ""
  ::lbl_8::
  L2_2 = L2_2(L3_2)
  if "" ~= L2_2 and A1_2 then
    L3_2 = A1_2.spawn
    if L3_2 then
      goto lbl_18
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_18::
  L3_2 = L39_1
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = L59_1
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = CreateObjectNoOffset
  L6_2 = L4_2
  L7_2 = L3_2.x
  L8_2 = L3_2.y
  L9_2 = L3_2.z
  L10_2 = false
  L11_2 = false
  L12_2 = false
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  if L5_2 and 0 ~= L5_2 then
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_61
    end
  end
  L6_2 = CreateObject
  L7_2 = L4_2
  L8_2 = L3_2.x
  L9_2 = L3_2.y
  L10_2 = L3_2.z
  L11_2 = false
  L12_2 = false
  L13_2 = false
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L5_2 = L6_2
  ::lbl_61::
  if L5_2 and 0 ~= L5_2 then
    L6_2 = DoesEntityExist
    L7_2 = L5_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_75
    end
  end
  L6_2 = SetModelAsNoLongerNeeded
  L7_2 = L4_2
  L6_2(L7_2)
  L6_2 = nil
  do return L6_2 end
  ::lbl_75::
  L6_2 = L56_1
  L7_2 = A0_2.propHeading
  L8_2 = A0_2.heading
  L6_2 = L6_2(L7_2, L8_2)
  if not L6_2 then
    L6_2 = 0.0
  end
  L6_2 = L6_2 + 0.0
  L7_2 = SetEntityAsMissionEntity
  L8_2 = L5_2
  L9_2 = true
  L10_2 = true
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = SetEntityCoords
  L8_2 = L5_2
  L9_2 = L3_2.x
  L10_2 = L3_2.y
  L11_2 = L3_2.z
  L12_2 = false
  L13_2 = false
  L14_2 = false
  L15_2 = false
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L7_2 = SetEntityRotation
  L8_2 = L5_2
  L9_2 = 0.0
  L10_2 = 0.0
  L11_2 = L6_2
  L12_2 = 2
  L13_2 = true
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L7_2 = SetEntityHeading
  L8_2 = L5_2
  L9_2 = L6_2
  L7_2(L8_2, L9_2)
  L7_2 = SetEntityInvincible
  L8_2 = L5_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = SetEntityCollision
  L8_2 = L5_2
  L9_2 = false
  L10_2 = false
  L7_2(L8_2, L9_2, L10_2)
  L7_2 = FreezeEntityPosition
  L8_2 = L5_2
  L9_2 = true
  L7_2(L8_2, L9_2)
  L7_2 = SetModelAsNoLongerNeeded
  L8_2 = L4_2
  L7_2(L8_2)
  return L5_2
end
function L182_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 then
    L2_2 = A0_2.instance
    if L2_2 then
      L2_2 = A0_2.instance
      L2_2 = L2_2.spawn
      if L2_2 then
        goto lbl_11
      end
    end
  end
  do return end
  ::lbl_11::
  L2_2 = type
  L3_2 = A0_2.editorLootPointProps
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = pairs
    L3_2 = A0_2.editorLootPointProps
    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
      if L7_2 then
        L8_2 = DoesEntityExist
        L9_2 = L7_2
        L8_2 = L8_2(L9_2)
        if L8_2 then
          L8_2 = DeleteEntity
          L9_2 = L7_2
          L8_2(L9_2)
        end
      end
    end
  end
  L2_2 = {}
  A0_2.editorLootPointProps = L2_2
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3
    L1_3 = L71_1
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    if not L1_3 then
      return
    end
    L1_3 = L181_1
    L2_3 = A0_3
    L3_3 = A0_2.instance
    L1_3 = L1_3(L2_3, L3_3)
    if L1_3 then
      L2_3 = A0_2.editorLootPointProps
      L3_3 = A0_2.editorLootPointProps
      L3_3 = #L3_3
      L3_3 = L3_3 + 1
      L2_3[L3_3] = L1_3
    end
  end
  L3_2 = type
  L4_2 = A0_2.preset
  L3_2 = L3_2(L4_2)
  if "table" == L3_2 then
    L3_2 = A0_2.preset
    if L3_2 then
      goto lbl_47
    end
  end
  L3_2 = {}
  ::lbl_47::
  L4_2 = ipairs
  L5_2 = L3_2.lootPoints
  if not L5_2 then
    L5_2 = {}
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L2_2
    L11_2 = L9_2
    L10_2(L11_2)
  end
  L4_2 = ipairs
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = {}
  end
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do
    L10_2 = L2_2
    L11_2 = L9_2
    L10_2(L11_2)
  end
end
L41_1 = L182_1
function L182_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L43_1
  if A0_2 then
    L3_2 = A0_2.label
    if L3_2 then
      goto lbl_8
    end
  end
  L3_2 = ""
  ::lbl_8::
  L2_2 = L2_2(L3_2)
  if "" == L2_2 then
    L2_2 = "Search"
  end
  L3_2 = "Point %s: %s"
  L4_2 = L3_2
  L3_2 = L3_2.format
  L5_2 = tostring
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L6_2 = L2_2
  return L3_2(L4_2, L5_2, L6_2)
end
function L183_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L4_2 = World3dToScreen2d
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2, L7_2)
  if not L4_2 then
    return
  end
  L7_2 = GetGameplayCamCoords
  L7_2 = L7_2()
  L8_2 = vector3
  L9_2 = L7_2.x
  L10_2 = L7_2.y
  L11_2 = L7_2.z
  L8_2 = L8_2(L9_2, L10_2, L11_2)
  L9_2 = vector3
  L10_2 = A0_2
  L11_2 = A1_2
  L12_2 = A2_2
  L9_2 = L9_2(L10_2, L11_2, L12_2)
  L8_2 = L8_2 - L9_2
  L8_2 = #L8_2
  L9_2 = math
  L9_2 = L9_2.max
  L10_2 = 0.25
  L11_2 = math
  L11_2 = L11_2.min
  L12_2 = 0.35
  L13_2 = math
  L13_2 = L13_2.max
  L14_2 = L8_2
  L15_2 = 0.01
  L13_2 = L13_2(L14_2, L15_2)
  L14_2 = 1
  L13_2 = L14_2 / L13_2
  L13_2 = L13_2 * 8.0
  L11_2, L12_2, L13_2, L14_2, L15_2 = L11_2(L12_2, L13_2)
  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L10_2 = SetTextScale
  L11_2 = L9_2
  L12_2 = L9_2
  L10_2(L11_2, L12_2)
  L10_2 = SetTextFont
  L11_2 = 4
  L10_2(L11_2)
  L10_2 = SetTextProportional
  L11_2 = 1
  L10_2(L11_2)
  L10_2 = SetTextColour
  L11_2 = 255
  L12_2 = 255
  L13_2 = 255
  L14_2 = 230
  L10_2(L11_2, L12_2, L13_2, L14_2)
  L10_2 = SetTextCentre
  L11_2 = true
  L10_2(L11_2)
  L10_2 = SetTextOutline
  L10_2()
  L10_2 = BeginTextCommandDisplayText
  L11_2 = "STRING"
  L10_2(L11_2)
  L10_2 = AddTextComponentSubstringPlayerName
  L11_2 = A3_2
  L10_2(L11_2)
  L10_2 = EndTextCommandDisplayText
  L11_2 = L5_2
  L12_2 = L6_2
  L10_2(L11_2, L12_2)
end
function L184_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = {}
  L3_2.active = true
  L4_2 = CreateThread
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3
    while true do
      L0_3 = L3_2.active
      if not L0_3 then
        break
      end
      L0_3 = Wait
      L1_3 = 0
      L0_3(L1_3)
      L0_3 = GetEntityCoords
      L1_3 = PlayerPedId
      L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L1_3()
      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)
      L1_3 = A1_2
      if not L1_3 then
        L1_3 = {}
      end
      L1_3 = #L1_3
      function L2_3(A0_4, A1_4, A2_4)
        local L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4, L26_4, L27_4, L28_4, L29_4
        L3_4 = L38_1
        L4_4 = A0_4
        L5_4 = A0_2
        L3_4 = L3_4(L4_4, L5_4)
        if L3_4 then
          L4_4 = L0_3
          L4_4 = L4_4 - L3_4
          L4_4 = #L4_4
          if not (L4_4 > 40.0) then
            goto lbl_14
          end
        end
        do return end
        ::lbl_14::
        if A2_4 then
          L4_4 = {}
          L4_4.r = 0
          L4_4.g = 200
          L4_4.b = 120
          if L4_4 then
            goto lbl_28
          end
        end
        L4_4 = {}
        L4_4.r = 255
        L4_4.g = 220
        L4_4.b = 0
        ::lbl_28::
        L5_4 = DrawMarker
        L6_4 = 28
        L7_4 = L3_4.x
        L8_4 = L3_4.y
        L9_4 = L3_4.z
        L9_4 = L9_4 + 0.08
        L10_4 = 0.0
        L11_4 = 0.0
        L12_4 = 0.0
        L13_4 = 0.0
        L14_4 = 0.0
        L15_4 = 0.0
        L16_4 = 0.13
        L17_4 = 0.13
        L18_4 = 0.13
        L19_4 = L4_4.r
        L20_4 = L4_4.g
        L21_4 = L4_4.b
        L22_4 = 185
        L23_4 = false
        L24_4 = false
        L25_4 = 2
        L26_4 = false
        L27_4 = nil
        L28_4 = nil
        L29_4 = false
        L5_4(L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4, L26_4, L27_4, L28_4, L29_4)
        L5_4 = L183_1
        L6_4 = L3_4.x
        L7_4 = L3_4.y
        L8_4 = L3_4.z
        L8_4 = L8_4 + 0.23
        L9_4 = L182_1
        L10_4 = A0_4
        L11_4 = A1_4
        L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4, L26_4, L27_4, L28_4, L29_4 = L9_4(L10_4, L11_4)
        L5_4(L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4, L15_4, L16_4, L17_4, L18_4, L19_4, L20_4, L21_4, L22_4, L23_4, L24_4, L25_4, L26_4, L27_4, L28_4, L29_4)
      end
      L3_3 = ipairs
      L4_3 = A1_2
      if not L4_3 then
        L4_3 = {}
      end
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L9_3 = L2_3
        L10_3 = L8_3
        L11_3 = L7_3
        L12_3 = false
        L9_3(L10_3, L11_3, L12_3)
      end
      L3_3 = ipairs
      L4_3 = A2_2
      if not L4_3 then
        L4_3 = {}
      end
      L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)
      for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do
        L9_3 = L2_3
        L10_3 = L8_3
        L11_3 = L1_3 + L7_3
        L12_3 = true
        L9_3(L10_3, L11_3, L12_3)
      end
    end
  end
  L4_2(L5_2)
  return L3_2
end
function L185_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2
  L2_2 = SetNuiFocus
  L3_2 = false
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = "toggleUIVisibility"
  L3_2.visible = false
  L2_2(L3_2)
  L2_2 = type
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if "table" ~= L2_2 or not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = PlayerPedId
  L2_2 = L2_2()
  L3_2 = A1_2.useClone
  L3_2 = true == L3_2
  L4_2 = A1_2.keepUiHidden
  L4_2 = true == L4_2
  L5_2 = L43_1
  L6_2 = A1_2.previewModel
  if not L6_2 then
    L6_2 = ""
  end
  L5_2 = L5_2(L6_2)
  L6_2 = 0
  L7_2 = 0
  if L3_2 then
    L8_2 = ClonePedEx
    L9_2 = L2_2
    L10_2 = 0.0
    L11_2 = false
    L12_2 = true
    L13_2 = 1
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
    L6_2 = L8_2
    L8_2 = SetEntityCollision
    L9_2 = L6_2
    L10_2 = false
    L11_2 = false
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = SetEntityInvincible
    L9_2 = L6_2
    L10_2 = true
    L8_2(L9_2, L10_2)
    L8_2 = FreezeEntityPosition
    L9_2 = L6_2
    L10_2 = true
    L8_2(L9_2, L10_2)
    L8_2 = SetEntityVisible
    L9_2 = L2_2
    L10_2 = true
    L11_2 = false
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = SetEntityAlpha
    L9_2 = L2_2
    L10_2 = 255
    L11_2 = false
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = SetEntityAlpha
    L9_2 = L6_2
    L10_2 = 215
    L11_2 = false
    L8_2(L9_2, L10_2, L11_2)
  end
  if "" ~= L5_2 then
    L8_2 = L59_1
    L9_2 = L5_2
    L8_2 = L8_2(L9_2)
    if L8_2 then
      L9_2 = GetEntityCoords
      L10_2 = L2_2
      L9_2 = L9_2(L10_2)
      L10_2 = CreateObjectNoOffset
      L11_2 = L8_2
      L12_2 = L9_2.x
      L13_2 = L9_2.y
      L14_2 = L9_2.z
      L15_2 = false
      L16_2 = false
      L17_2 = false
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      L7_2 = L10_2
      if 0 == L7_2 then
        L10_2 = CreateObject
        L11_2 = L8_2
        L12_2 = L9_2.x
        L13_2 = L9_2.y
        L14_2 = L9_2.z
        L15_2 = false
        L16_2 = false
        L17_2 = false
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
        L7_2 = L10_2
      end
      L10_2 = SetEntityCollision
      L11_2 = L7_2
      L12_2 = false
      L13_2 = false
      L10_2(L11_2, L12_2, L13_2)
      L10_2 = SetEntityInvincible
      L11_2 = L7_2
      L12_2 = true
      L10_2(L11_2, L12_2)
      L10_2 = FreezeEntityPosition
      L11_2 = L7_2
      L12_2 = true
      L10_2(L11_2, L12_2)
      L10_2 = SetEntityAlpha
      L11_2 = L7_2
      L12_2 = 215
      L13_2 = false
      L10_2(L11_2, L12_2, L13_2)
      L10_2 = SetModelAsNoLongerNeeded
      L11_2 = L8_2
      L10_2(L11_2)
    end
  end
  L8_2 = L52_1
  L9_2 = GetEntityHeading
  L10_2 = L2_2
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2 = L9_2(L10_2)
  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
  function L9_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L6_2
    if 0 ~= L0_3 then
      L0_3 = DoesEntityExist
      L1_3 = L6_2
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = DeleteEntity
        L1_3 = L6_2
        L0_3(L1_3)
      end
    end
    L0_3 = L7_2
    if 0 ~= L0_3 then
      L0_3 = DoesEntityExist
      L1_3 = L7_2
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = DeleteEntity
        L1_3 = L7_2
        L0_3(L1_3)
      end
    end
    L0_3 = SetEntityVisible
    L1_3 = L2_2
    L2_3 = true
    L3_3 = false
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = L3_2
    if L0_3 then
      L0_3 = SetEntityAlpha
      L1_3 = L2_2
      L2_3 = 255
      L3_3 = false
      L0_3(L1_3, L2_3, L3_3)
    end
    L0_3 = HideRobberyCreatorPrompt
    L0_3()
  end
  while true do
    L10_2 = Wait
    L11_2 = 0
    L10_2(L11_2)
    L10_2 = DisableControlAction
    L11_2 = 0
    L12_2 = 24
    L13_2 = true
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = DisableControlAction
    L11_2 = 0
    L12_2 = 25
    L13_2 = true
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = DisableControlAction
    L11_2 = 0
    L12_2 = 140
    L13_2 = true
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = DisableControlAction
    L11_2 = 0
    L12_2 = 141
    L13_2 = true
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = DisableControlAction
    L11_2 = 0
    L12_2 = 142
    L13_2 = true
    L10_2(L11_2, L12_2, L13_2)
    L10_2 = GetEntityCoords
    L11_2 = L2_2
    L10_2 = L10_2(L11_2)
    if L3_2 or 0 ~= L7_2 then
      L11_2 = type
      L12_2 = RayCastGamePlayCamera
      L11_2 = L11_2(L12_2)
      if "function" == L11_2 then
        L11_2 = RayCastGamePlayCamera
        L12_2 = 20.0
        L11_2, L12_2 = L11_2(L12_2)
        if L11_2 and L12_2 then
          L13_2 = vector3
          L14_2 = L12_2.x
          L15_2 = L12_2.y
          L16_2 = L12_2.z
          L13_2 = L13_2(L14_2, L15_2, L16_2)
          L10_2 = L13_2
        end
        L13_2 = DrawMarker
        L14_2 = 28
        L15_2 = L10_2.x
        L16_2 = L10_2.y
        L17_2 = L10_2.z
        L17_2 = L17_2 + 0.03
        L18_2 = 0.0
        L19_2 = 0.0
        L20_2 = 0.0
        L21_2 = 0.0
        L22_2 = 0.0
        L23_2 = 0.0
        L24_2 = 0.12
        L25_2 = 0.12
        L26_2 = 0.12
        L27_2 = 0
        L28_2 = 150
        L29_2 = 0
        L30_2 = 125
        L31_2 = false
        L32_2 = false
        L33_2 = 2
        L34_2 = false
        L35_2 = nil
        L36_2 = nil
        L37_2 = false
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2, L37_2)
        L13_2 = GetGameplayCamCoords
        L13_2 = L13_2()
        L14_2 = IsControlPressed
        L15_2 = 0
        L16_2 = 174
        L14_2 = L14_2(L15_2, L16_2)
        if L14_2 then
          L14_2 = L52_1
          L15_2 = L8_2 + 1.0
          L14_2 = L14_2(L15_2)
          L8_2 = L14_2
        end
        L14_2 = IsControlPressed
        L15_2 = 0
        L16_2 = 175
        L14_2 = L14_2(L15_2, L16_2)
        if L14_2 then
          L14_2 = L52_1
          L15_2 = L8_2 - 1.0
          L14_2 = L14_2(L15_2)
          L8_2 = L14_2
        end
    end
    else
      L11_2 = GetEntityHeading
      L12_2 = L2_2
      L11_2 = L11_2(L12_2)
      L8_2 = L11_2
    end
    if L3_2 and 0 ~= L6_2 then
      L11_2 = DoesEntityExist
      L12_2 = L6_2
      L11_2 = L11_2(L12_2)
      if L11_2 then
        L11_2 = SetEntityCoords
        L12_2 = L6_2
        L13_2 = L10_2.x
        L14_2 = L10_2.y
        L15_2 = L10_2.z
        L16_2 = false
        L17_2 = false
        L18_2 = false
        L19_2 = false
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        L11_2 = SetEntityHeading
        L12_2 = L6_2
        L13_2 = L8_2
        L11_2(L12_2, L13_2)
      end
    end
    if 0 ~= L7_2 then
      L11_2 = DoesEntityExist
      L12_2 = L7_2
      L11_2 = L11_2(L12_2)
      if L11_2 then
        L11_2 = SetEntityCoords
        L12_2 = L7_2
        L13_2 = L10_2.x
        L14_2 = L10_2.y
        L15_2 = L10_2.z
        L16_2 = false
        L17_2 = false
        L18_2 = false
        L19_2 = false
        L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
        L11_2 = SetEntityHeading
        L12_2 = L7_2
        L13_2 = L8_2
        L11_2(L12_2, L13_2)
      end
    end
    L11_2 = {}
    L12_2 = {}
    L12_2.key = "E"
    L12_2.label = "Confirm house location"
    L12_2.tone = "primary"
    L13_2 = {}
    L13_2.key = "Backspace"
    L13_2.label = "Cancel"
    L13_2.tone = "danger"
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    if L3_2 or 0 ~= L7_2 then
      L12_2 = #L11_2
      L12_2 = L12_2 + 1
      L13_2 = {}
      L13_2.key = "Left / Right"
      L13_2.label = "Rotate heading"
      L11_2[L12_2] = L13_2
    end
    L12_2 = DrawRobberyCreatorPrompt
    L13_2 = {}
    L14_2 = A1_2.title
    if not L14_2 then
      L14_2 = "House Location Placement"
    end
    L13_2.title = L14_2
    L14_2 = A1_2.description
    if not L14_2 then
      L14_2 = "Place the new house robbery entry point in the world."
    end
    L13_2.description = L14_2
    L14_2 = A1_2.meta
    if not L14_2 then
      L14_2 = "Street name is generated automatically"
    end
    L13_2.meta = L14_2
    L13_2.actions = L11_2
    L12_2(L13_2)
    L12_2 = IsControlJustPressed
    L13_2 = 0
    L14_2 = 38
    L12_2 = L12_2(L13_2, L14_2)
    if L12_2 then
      L12_2 = GetStreetNameAtCoord
      L13_2 = L10_2.x
      L14_2 = L10_2.y
      L15_2 = L10_2.z
      L12_2 = L12_2(L13_2, L14_2, L15_2)
      L13_2 = GetStreetNameFromHashKey
      L14_2 = L12_2 or L14_2
      if not L12_2 then
        L14_2 = 0
      end
      L13_2 = L13_2(L14_2)
      L14_2 = L9_2
      L14_2()
      if not L4_2 then
        L14_2 = SetNuiFocus
        L15_2 = true
        L16_2 = true
        L14_2(L15_2, L16_2)
        L14_2 = SendNUIMessage
        L15_2 = {}
        L15_2.type = "toggleUIVisibility"
        L15_2.visible = true
        L14_2(L15_2)
        L14_2 = TabletEmote
        L14_2()
      end
      L14_2 = {}
      L14_2.success = true
      L15_2 = {}
      L16_2 = {}
      L17_2 = L10_2.x
      L16_2.x = L17_2
      L17_2 = L10_2.y
      L16_2.y = L17_2
      L17_2 = L10_2.z
      L16_2.z = L17_2
      L15_2.coords = L16_2
      L15_2.heading = L8_2
      L14_2.location = L15_2
      L14_2.streetName = L13_2
      return L14_2
    else
      L12_2 = IsControlJustPressed
      L13_2 = 0
      L14_2 = 177
      L12_2 = L12_2(L13_2, L14_2)
      if L12_2 then
        L12_2 = L9_2
        L12_2()
        if not L4_2 then
          L12_2 = SetNuiFocus
          L13_2 = true
          L14_2 = true
          L12_2(L13_2, L14_2)
          L12_2 = SendNUIMessage
          L13_2 = {}
          L13_2.type = "toggleUIVisibility"
          L13_2.visible = true
          L12_2(L13_2)
          L12_2 = TabletEmote
          L12_2()
        end
        L12_2 = {}
        L12_2.success = false
        L12_2.error = "Placement cancelled."
        return L12_2
      end
    end
  end
end
function L186_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = type
  L5_2 = A3_2
  L4_2 = L4_2(L5_2)
  if "table" ~= L4_2 or not A3_2 then
    L4_2 = {}
    A3_2 = L4_2
  end
  L4_2 = A3_2.keepInside
  if true == L4_2 and A2_2 then
    L4_2 = L43_1
    L5_2 = A3_2.previewKey
    L4_2 = L4_2(L5_2)
    if "" == L4_2 then
      L5_2 = L174_1
      L6_2 = A3_2.shell
      if not L6_2 then
        L6_2 = {}
      end
      L7_2 = A3_2.preset
      if not L7_2 then
        L7_2 = {}
      end
      L5_2 = L5_2(L6_2, L7_2)
      L4_2 = L5_2
    end
    L5_2 = {}
    L5_2.cacheKey = L4_2
    L6_2 = type
    L7_2 = A3_2.shell
    L6_2 = L6_2(L7_2)
    if "table" == L6_2 then
      L6_2 = A3_2.shell
      if L6_2 then
        goto lbl_47
      end
    end
    L6_2 = {}
    ::lbl_47::
    L5_2.shell = L6_2
    L6_2 = type
    L7_2 = A3_2.preset
    L6_2 = L6_2(L7_2)
    if "table" == L6_2 then
      L6_2 = A3_2.preset
      if L6_2 then
        goto lbl_58
      end
    end
    L6_2 = {}
    ::lbl_58::
    L5_2.preset = L6_2
    L5_2.instance = A2_2
    L6_2 = "house_preview_%s"
    L7_2 = L6_2
    L6_2 = L6_2.format
    L9_2 = L4_2
    L8_2 = L4_2.gsub
    L10_2 = "[^%w_%-]"
    L11_2 = "_"
    L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2, L10_2, L11_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L5_2.assetTag = L6_2
    L6_2 = {}
    L7_2 = L51_1
    L8_2 = A0_2 or L8_2
    if not A0_2 then
      L8_2 = {}
    end
    L7_2 = L7_2(L8_2)
    L6_2.coords = L7_2
    L7_2 = tonumber
    L8_2 = A1_2
    L7_2 = L7_2(L8_2)
    if not L7_2 then
      L7_2 = 0.0
    end
    L6_2.heading = L7_2
    L5_2.outside = L6_2
    L5_1 = L5_2
  else
    L4_2 = L173_1
    L5_2 = A2_2
    L4_2(L5_2)
    L4_2 = SetEntityCoords
    L5_2 = PlayerPedId
    L5_2 = L5_2()
    L6_2 = A0_2.x
    L7_2 = A0_2.y
    L8_2 = A0_2.z
    L9_2 = false
    L10_2 = false
    L11_2 = false
    L12_2 = false
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    L4_2 = SetEntityHeading
    L5_2 = PlayerPedId
    L5_2 = L5_2()
    L6_2 = A1_2
    L4_2(L5_2, L6_2)
  end
  L4_2 = SetNuiFocus
  L5_2 = true
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.type = "toggleUIVisibility"
  L5_2.visible = true
  L4_2(L5_2)
  L4_2 = TabletEmote
  L4_2()
end
function L187_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = L174_1
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = L51_1
  L4_2 = GetEntityCoords
  L5_2 = PlayerPedId
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2()
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = GetEntityHeading
  L5_2 = PlayerPedId
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2()
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
  L5_2 = nil
  L6_2 = L5_1
  if L6_2 then
    L6_2 = L5_1.outside
    if L6_2 then
      L6_2 = L5_1.outside
      L6_2 = L6_2.coords
      if L6_2 then
        L6_2 = L51_1
        L7_2 = L5_1.outside
        L7_2 = L7_2.coords
        L6_2 = L6_2(L7_2)
        L3_2 = L6_2
      end
    end
    L6_2 = tonumber
    L7_2 = L5_1.outside
    if L7_2 then
      L7_2 = L5_1.outside
      L7_2 = L7_2.heading
    end
    L6_2 = L6_2(L7_2)
    L4_2 = L6_2 or L4_2
    if not L6_2 then
    end
    L6_2 = L43_1
    L7_2 = L5_1.shell
    if L7_2 then
      L7_2 = L5_1.shell
      L7_2 = L7_2.id
      if L7_2 then
        goto lbl_53
      end
      L7_2 = L5_1.shell
      L7_2 = L7_2.model
      if L7_2 then
        goto lbl_53
      end
    end
    L7_2 = ""
    ::lbl_53::
    L6_2 = L6_2(L7_2)
    L7_2 = L43_1
    L8_2 = A0_2.id
    if not L8_2 then
      L8_2 = A0_2.model
      if not L8_2 then
        L8_2 = ""
      end
    end
    L7_2 = L7_2(L8_2)
    L6_2 = L6_2 == L7_2
    L7_2 = L91_1
    L8_2 = L5_1
    L7_2(L8_2)
    L7_2 = L5_1.instance
    if L7_2 then
      L7_2 = L5_1.cacheKey
      if L7_2 == L2_2 or L6_2 then
        L5_2 = L5_1.instance
    end
    else
      L7_2 = L173_1
      L8_2 = L5_1.instance
      L7_2(L8_2)
    end
    L7_2 = nil
    L5_1 = L7_2
  end
  L6_2 = SetNuiFocus
  L7_2 = false
  L8_2 = false
  L6_2(L7_2, L8_2)
  L6_2 = SendNUIMessage
  L7_2 = {}
  L7_2.type = "toggleUIVisibility"
  L7_2.visible = false
  L6_2(L7_2)
  if not L5_2 then
    L6_2 = L171_1
    L7_2 = A0_2
    L8_2 = L175_1
    L9_2 = L3_2
    L8_2, L9_2 = L8_2(L9_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L6_2
  end
  L6_2 = L3_2
  L7_2 = L4_2
  L8_2 = L5_2
  L9_2 = L2_2
  return L6_2, L7_2, L8_2, L9_2
end
function L188_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 then
    L3_2 = type
    L4_2 = LaserTable
    L3_2 = L3_2(L4_2)
    if "table" == L3_2 then
      goto lbl_9
    end
  end
  do return end
  ::lbl_9::
  L3_2 = L49_1
  L4_2 = A1_2 or L4_2
  if A1_2 then
    L4_2 = A1_2.startVector
  end
  L3_2 = L3_2(L4_2)
  L4_2 = L49_1
  L5_2 = A1_2 or L5_2
  if A1_2 then
    L5_2 = A1_2.endVector
  end
  L4_2 = L4_2(L5_2)
  if not L3_2 or not L4_2 then
    return
  end
  L5_2 = type
  L6_2 = A0_2.securityLaserKeys
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = A0_2.securityLaserKeys
    if L5_2 then
      goto lbl_34
    end
  end
  L5_2 = {}
  ::lbl_34::
  A0_2.securityLaserKeys = L5_2
  L5_2 = L43_1
  L6_2 = A0_2.assetTag
  if not L6_2 then
    L6_2 = A0_2.cacheKey
    if not L6_2 then
      L6_2 = "house_security_preview_"
      L7_2 = tostring
      L8_2 = GetGameTimer
      L8_2, L9_2, L10_2 = L8_2()
      L7_2 = L7_2(L8_2, L9_2, L10_2)
      L6_2 = L6_2 .. L7_2
    end
  end
  L5_2 = L5_2(L6_2)
  L6_2 = "%s_laser_preview_%s"
  L7_2 = L6_2
  L6_2 = L6_2.format
  L8_2 = L5_2
  L9_2 = tostring
  L10_2 = A2_2 or L10_2
  if not A2_2 then
    L10_2 = A0_2.securityLaserKeys
    L10_2 = #L10_2
    L10_2 = L10_2 + 1
  end
  L9_2, L10_2 = L9_2(L10_2)
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
  L7_2 = LaserTable
  L8_2 = {}
  L8_2.start = L3_2
  L8_2.endPos = L4_2
  L9_2 = {}
  L9_2.r = 255
  L9_2.g = 0
  L9_2.b = 0
  L9_2.a = 255
  L8_2.color = L9_2
  L9_2 = tonumber
  L10_2 = A1_2 or L10_2
  if A1_2 then
    L10_2 = A1_2.intensity
  end
  L9_2 = L9_2(L10_2)
  if not L9_2 then
    L9_2 = 100
  end
  L9_2 = L9_2 + 2
  L8_2.damage = L9_2
  L8_2.Heist = L5_2
  L9_2 = {}
  L9_2.direction = "none"
  L9_2.amount = 0.0
  L8_2.movement = L9_2
  L8_2.speed = 0.007
  L8_2.directionState = 1
  L8_2.initialStart = L3_2
  L8_2.initialEnd = L4_2
  L9_2 = A2_2 or L9_2
  if not A2_2 then
    L9_2 = 1
  end
  L8_2.stepId = L9_2
  L8_2.editorPreview = true
  L7_2[L6_2] = L8_2
  L7_2 = A0_2.securityLaserKeys
  L8_2 = A0_2.securityLaserKeys
  L8_2 = #L8_2
  L8_2 = L8_2 + 1
  L7_2[L8_2] = L6_2
end
function L189_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2
  L1_2 = type
  L2_2 = RayCastGamePlayCamera
  L1_2 = L1_2(L2_2)
  if "function" ~= L1_2 then
    L1_2 = {}
    L1_2.success = false
    L1_2.error = "Laser placement is unavailable."
    return L1_2
  end
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "table" ~= L1_2 or not A0_2 then
    L1_2 = {}
    A0_2 = L1_2
  end
  L1_2 = Config
  L1_2 = L1_2.Color
  L2_2 = 0.04
  L3_2 = nil
  L4_2 = {}
  function L5_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L0_3 = A0_2.hasPlacedLasers
    L0_3 = true == L0_3
    L1_3 = DrawRobberyCreatorPrompt
    L2_3 = {}
    L2_3.title = "Laser Placement"
    L3_3 = L3_2
    if L3_3 then
      L3_3 = "Choose the end point for this laser beam."
      if L3_3 then
        goto lbl_17
      end
    end
    L3_3 = "Choose the starting point for this laser beam."
    ::lbl_17::
    L2_3.description = L3_3
    L3_3 = L3_2
    if L3_3 then
      L3_3 = "Start point saved"
      if L3_3 then
        goto lbl_30
      end
    end
    if L0_3 then
      L3_3 = "Placed lasers are visible"
      if L3_3 then
        goto lbl_30
      end
    end
    L3_3 = "No lasers placed yet"
    ::lbl_30::
    L2_3.meta = L3_3
    L3_3 = {}
    L4_3 = {}
    L4_3.key = "E"
    L5_3 = L3_2
    if L5_3 then
      L5_3 = "Set end point"
      if L5_3 then
        goto lbl_43
      end
    end
    L5_3 = "Set starting point"
    ::lbl_43::
    L4_3.label = L5_3
    L4_3.tone = "primary"
    L5_3 = {}
    L5_3.key = "Enter"
    if L0_3 then
      L6_3 = "Save security system"
      if L6_3 then
        goto lbl_54
      end
    end
    L6_3 = "Save keypad only"
    ::lbl_54::
    L5_3.label = L6_3
    L5_3.tone = "success"
    L6_3 = {}
    L6_3.key = "Backspace"
    L7_3 = L3_2
    if L7_3 then
      L7_3 = "Remove start point"
      if L7_3 then
        goto lbl_71
      end
    end
    if L0_3 then
      L7_3 = "Save and exit"
      if L7_3 then
        goto lbl_71
      end
    end
    L7_3 = "Cancel"
    ::lbl_71::
    L6_3.label = L7_3
    L7_3 = L3_2
    if L7_3 then
      L7_3 = "danger"
      if L7_3 then
        goto lbl_84
      end
    end
    if L0_3 then
      L7_3 = "success"
      if L7_3 then
        goto lbl_84
      end
    end
    L7_3 = "danger"
    ::lbl_84::
    L6_3.tone = L7_3
    L3_3[1] = L4_3
    L3_3[2] = L5_3
    L3_3[3] = L6_3
    L2_3.actions = L3_3
    L1_3(L2_3)
  end
  while true do
    L6_2 = Wait
    L7_2 = 0
    L6_2(L7_2)
    L6_2 = RayCastGamePlayCamera
    L7_2 = 20.0
    L6_2, L7_2 = L6_2(L7_2)
    L8_2 = L5_2
    L8_2()
    L8_2 = IsControlJustPressed
    L9_2 = 0
    L10_2 = 191
    L8_2 = L8_2(L9_2, L10_2)
    if not L8_2 then
      L8_2 = IsControlJustPressed
      L9_2 = 0
      L10_2 = 201
      L8_2 = L8_2(L9_2, L10_2)
      if not L8_2 then
        goto lbl_55
      end
    end
    L8_2 = HideRobberyCreatorPrompt
    L8_2()
    L8_2 = {}
    L8_2.success = false
    L8_2.save = true
    do return L8_2 end
    ::lbl_55::
    L8_2 = DisableControlAction
    L9_2 = 0
    L10_2 = 24
    L11_2 = true
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = DisableControlAction
    L9_2 = 0
    L10_2 = 25
    L11_2 = true
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = DisableControlAction
    L9_2 = 0
    L10_2 = 140
    L11_2 = true
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = DisableControlAction
    L9_2 = 0
    L10_2 = 141
    L11_2 = true
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = DisableControlAction
    L9_2 = 0
    L10_2 = 142
    L11_2 = true
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = DisableControlAction
    L9_2 = 1
    L10_2 = 177
    L11_2 = true
    L8_2(L9_2, L10_2, L11_2)
    L8_2 = IsControlJustPressed
    L9_2 = 1
    L10_2 = 177
    L8_2 = L8_2(L9_2, L10_2)
    if not L8_2 then
      L8_2 = IsControlJustPressed
      L9_2 = 0
      L10_2 = 177
      L8_2 = L8_2(L9_2, L10_2)
      if not L8_2 then
        L8_2 = IsDisabledControlJustPressed
        L9_2 = 1
        L10_2 = 177
        L8_2 = L8_2(L9_2, L10_2)
        if not L8_2 then
          L8_2 = IsDisabledControlJustPressed
          L9_2 = 0
          L10_2 = 177
          L8_2 = L8_2(L9_2, L10_2)
        end
      end
    end
    if L8_2 then
      if L3_2 then
        L3_2 = nil
        L4_2.vector1 = nil
      else
        L9_2 = HideRobberyCreatorPrompt
        L9_2()
        L9_2 = {}
        L9_2.success = false
        L10_2 = A0_2.hasPlacedLasers
        L10_2 = true == L10_2
        L9_2.save = L10_2
        L10_2 = A0_2.hasPlacedLasers
        if true == L10_2 then
          L10_2 = "Security system saved."
          if L10_2 then
            goto lbl_132
          end
        end
        L10_2 = "Laser placement cancelled."
        ::lbl_132::
        L9_2.error = L10_2
        return L9_2
      end
    end
    if L6_2 and L7_2 then
      L9_2 = GetEntityCoords
      L10_2 = PlayerPedId
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2 = L10_2()
      L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2)
      L10_2 = DrawMarker
      L11_2 = 28
      L12_2 = L7_2.x
      L13_2 = L7_2.y
      L14_2 = L7_2.z
      L15_2 = 0.0
      L16_2 = 0.0
      L17_2 = 0.0
      L18_2 = 0.0
      L19_2 = 0.0
      L20_2 = 0.0
      L21_2 = L2_2
      L22_2 = L2_2
      L23_2 = L2_2
      L24_2 = L1_2.r
      L25_2 = L1_2.g
      L26_2 = L1_2.b
      L27_2 = L1_2.a
      L28_2 = false
      L29_2 = false
      L30_2 = 2
      L31_2 = nil
      L32_2 = nil
      L33_2 = false
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2)
      L10_2 = DrawLine
      L11_2 = L9_2.x
      L12_2 = L9_2.y
      L13_2 = L9_2.z
      L14_2 = L7_2.x
      L15_2 = L7_2.y
      L16_2 = L7_2.z
      L17_2 = L1_2.r
      L18_2 = L1_2.g
      L19_2 = L1_2.b
      L20_2 = L1_2.a
      L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      if L3_2 then
        L10_2 = DrawLine
        L11_2 = L3_2.x
        L12_2 = L3_2.y
        L13_2 = L3_2.z
        L14_2 = L7_2.x
        L15_2 = L7_2.y
        L16_2 = L7_2.z
        L17_2 = 255
        L18_2 = 0
        L19_2 = 0
        L20_2 = L1_2.a
        L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
      end
      L10_2 = IsControlJustPressed
      L11_2 = 0
      L12_2 = 38
      L10_2 = L10_2(L11_2, L12_2)
      if L10_2 then
        if not L3_2 then
          L3_2 = L7_2
          L10_2 = {}
          L11_2 = L7_2.x
          L12_2 = L7_2.y
          L13_2 = L7_2.z
          L10_2[1] = L11_2
          L10_2[2] = L12_2
          L10_2[3] = L13_2
          L4_2.vector1 = L10_2
        else
          L10_2 = {}
          L11_2 = L7_2.x
          L12_2 = L7_2.y
          L13_2 = L7_2.z
          L10_2[1] = L11_2
          L10_2[2] = L12_2
          L10_2[3] = L13_2
          L4_2.vector2 = L10_2
          L10_2 = HideRobberyCreatorPrompt
          L10_2()
          L10_2 = {}
          L10_2.success = true
          L10_2.FinalInfo = L4_2
          return L10_2
        end
      end
    end
  end
end
function L190_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  while true do
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
    L1_2 = DisableControlAction
    L2_2 = 0
    L3_2 = 24
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DisableControlAction
    L2_2 = 0
    L3_2 = 25
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DisableControlAction
    L2_2 = 0
    L3_2 = 140
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DisableControlAction
    L2_2 = 0
    L3_2 = 141
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DisableControlAction
    L2_2 = 0
    L3_2 = 142
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = {}
    L2_2 = {}
    L2_2.key = "E"
    L2_2.label = "Place another robbable object"
    L2_2.tone = "primary"
    L3_2 = {}
    L3_2.key = "Backspace"
    if A0_2 then
      L4_2 = "Save and exit"
      if L4_2 then
        goto lbl_45
      end
    end
    L4_2 = "Cancel"
    ::lbl_45::
    L3_2.label = L4_2
    if A0_2 then
      L4_2 = "success"
      if L4_2 then
        goto lbl_52
      end
    end
    L4_2 = "danger"
    ::lbl_52::
    L3_2.tone = L4_2
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    if A0_2 then
      L2_2 = table
      L2_2 = L2_2.insert
      L3_2 = L1_2
      L4_2 = 2
      L5_2 = {}
      L5_2.key = "Enter"
      L5_2.label = "Save and exit"
      L5_2.tone = "success"
      L2_2(L3_2, L4_2, L5_2)
    end
    L2_2 = DrawRobberyCreatorPrompt
    L3_2 = {}
    L3_2.title = "Loot Point Placement"
    L3_2.description = "Add another loot point or finish this shell preset."
    if A0_2 then
      L4_2 = "At least one point placed"
      if L4_2 then
        goto lbl_77
      end
    end
    L4_2 = "Awaiting first point"
    ::lbl_77::
    L3_2.meta = L4_2
    L3_2.actions = L1_2
    L2_2(L3_2)
    L2_2 = IsControlJustPressed
    L3_2 = 0
    L4_2 = 38
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L2_2 = HideRobberyCreatorPrompt
      L2_2()
      L2_2 = "continue"
      return L2_2
    end
    if A0_2 then
      L2_2 = IsControlJustPressed
      L3_2 = 0
      L4_2 = 191
      L2_2 = L2_2(L3_2, L4_2)
      if not L2_2 then
        L2_2 = IsControlJustPressed
        L3_2 = 0
        L4_2 = 201
        L2_2 = L2_2(L3_2, L4_2)
        if not L2_2 then
          goto lbl_108
        end
      end
      L2_2 = HideRobberyCreatorPrompt
      L2_2()
      L2_2 = "save"
      return L2_2
    end
    ::lbl_108::
    L2_2 = IsControlJustPressed
    L3_2 = 0
    L4_2 = 177
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L2_2 = HideRobberyCreatorPrompt
      L2_2()
      if A0_2 then
        L2_2 = "save"
        if L2_2 then
          goto lbl_122
        end
      end
      L2_2 = "cancel"
      ::lbl_122::
      return L2_2
    end
  end
end
function L191_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  if A0_2 then
    L4_2 = A0_2.coords
    if L4_2 then
      goto lbl_8
    end
  end
  L4_2 = nil
  do return L4_2 end
  ::lbl_8::
  L4_2 = L49_1
  L5_2 = A0_2.coords
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = nil
    return L5_2
  end
  L5_2 = type
  L6_2 = A3_2
  L5_2 = L5_2(L6_2)
  if "table" ~= L5_2 or not A3_2 then
    L5_2 = {}
    A3_2 = L5_2
  end
  L5_2 = type
  L6_2 = A3_2.keypad
  L5_2 = L5_2(L6_2)
  if "table" == L5_2 then
    L5_2 = A3_2.keypad
    if L5_2 then
      goto lbl_35
    end
  end
  L5_2 = {}
  ::lbl_35::
  L6_2 = L134_1
  L7_2 = A3_2
  L6_2 = L6_2(L7_2)
  L7_2 = L133_1
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  L8_2 = tonumber
  L9_2 = A0_2.heading
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = 0.0
  end
  L9_2 = {}
  L10_2 = L4_2.x
  L11_2 = A2_2.x
  L10_2 = L10_2 - L11_2
  L9_2.x = L10_2
  L10_2 = L4_2.y
  L11_2 = A2_2.y
  L10_2 = L10_2 - L11_2
  L9_2.y = L10_2
  L10_2 = L4_2.z
  L11_2 = A2_2.z
  L10_2 = L10_2 - L11_2
  L9_2.z = L10_2
  L10_2 = L43_1
  L11_2 = L5_2.prop
  if not L11_2 then
    L11_2 = A3_2.prop
    if not L11_2 then
      L11_2 = "prop_ld_keypad_01b"
    end
  end
  L10_2 = L10_2(L11_2)
  if "" == L10_2 then
    L10_2 = "prop_ld_keypad_01b"
  end
  L11_2 = L43_1
  L12_2 = L5_2.label
  if not L12_2 then
    L12_2 = A3_2.label
    if not L12_2 then
      L12_2 = "Security Keypad"
    end
  end
  L11_2 = L11_2(L12_2)
  if "" == L11_2 then
    L11_2 = "Security Keypad"
  end
  L12_2 = {}
  L13_2 = L43_1
  L14_2 = A3_2.id
  if not L14_2 then
    L14_2 = "security_system"
  end
  L13_2 = L13_2(L14_2)
  L12_2.id = L13_2
  L13_2 = L43_1
  L14_2 = A3_2.label
  if not L14_2 then
    L14_2 = "Security System"
  end
  L13_2 = L13_2(L14_2)
  L12_2.label = L13_2
  L13_2 = tostring
  L14_2 = A3_2.numberValue
  if not L14_2 then
    L14_2 = "security"
  end
  L13_2 = L13_2(L14_2)
  L12_2.numberValue = L13_2
  L12_2.isPlaced = true
  L12_2.coords = L9_2
  L12_2.heading = L8_2
  L12_2.pedCoords = L9_2
  L12_2.pedHeading = L8_2
  L12_2.prop = L10_2
  L13_2 = L43_1
  L14_2 = A3_2.animation
  if not L14_2 then
    L14_2 = tostring
    L15_2 = L24_1
    L14_2 = L14_2(L15_2)
  end
  L13_2 = L13_2(L14_2)
  L12_2.animation = L13_2
  L12_2.propHeading = L8_2
  L12_2.minigameCheckbox = L7_2
  L12_2.minigameType = L6_2
  L13_2 = tostring
  L14_2 = A3_2.failPoliceChance
  if not L14_2 then
    L14_2 = A3_2.alertChance
    if not L14_2 then
      L14_2 = 0
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.failPoliceChance = L13_2
  L13_2 = A3_2.requiresItem
  L13_2 = true == L13_2
  L12_2.requiresItem = L13_2
  L13_2 = type
  L14_2 = A3_2.requiredItems
  L13_2 = L13_2(L14_2)
  if "table" == L13_2 then
    L13_2 = A3_2.requiredItems
    if L13_2 then
      goto lbl_155
    end
  end
  L13_2 = {}
  ::lbl_155::
  L12_2.requiredItems = L13_2
  L13_2 = A3_2.rewardItem
  L13_2 = true == L13_2
  L12_2.rewardItem = L13_2
  L13_2 = type
  L14_2 = A3_2.rewardItems
  L13_2 = L13_2(L14_2)
  if "table" == L13_2 then
    L13_2 = A3_2.rewardItems
    if L13_2 then
      goto lbl_172
    end
  end
  L13_2 = {}
  ::lbl_172::
  L12_2.rewardItems = L13_2
  L13_2 = A3_2.rewardMoney
  L13_2 = true == L13_2
  L12_2.rewardMoney = L13_2
  L13_2 = L43_1
  L14_2 = A3_2.rewardMoneyType
  if not L14_2 then
    L14_2 = A3_2.rewardType
    if not L14_2 then
      L14_2 = "cash"
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.rewardMoneyType = L13_2
  L13_2 = tostring
  L14_2 = A3_2.rewardMoneyMin
  if not L14_2 then
    L14_2 = A3_2.minMoney
    if not L14_2 then
      L14_2 = 1
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.rewardMoneyMin = L13_2
  L13_2 = tostring
  L14_2 = A3_2.rewardMoneyMax
  if not L14_2 then
    L14_2 = A3_2.maxMoney
    if not L14_2 then
      L14_2 = 1
    end
  end
  L13_2 = L13_2(L14_2)
  L12_2.rewardMoneyMax = L13_2
  L13_2 = tostring
  L14_2 = A3_2.moneyChance
  if not L14_2 then
    L14_2 = 100
  end
  L13_2 = L13_2(L14_2)
  L12_2.moneyChance = L13_2
  L13_2 = A3_2.delayRewardCheckbox
  L13_2 = true == L13_2
  L12_2.delayRewardCheckbox = L13_2
  L13_2 = tostring
  L14_2 = A3_2.rewardDelayTime
  if not L14_2 then
    L14_2 = 1
  end
  L13_2 = L13_2(L14_2)
  L12_2.rewardDelayTime = L13_2
  L13_2 = A3_2.requireWeaponInHand
  L13_2 = true == L13_2
  L12_2.requireWeaponInHand = L13_2
  L13_2 = type
  L14_2 = A3_2.requiredWeapons
  L13_2 = L13_2(L14_2)
  if "table" == L13_2 then
    L13_2 = A3_2.requiredWeapons
    if L13_2 then
      goto lbl_245
    end
  end
  L13_2 = {}
  ::lbl_245::
  L12_2.requiredWeapons = L13_2
  L13_2 = {}
  L13_2.prop = L10_2
  L13_2.label = L11_2
  L13_2.coords = L9_2
  L13_2.heading = L8_2
  L13_2.placed = true
  L13_2.minigameCheckbox = L7_2
  L13_2.minigameType = L6_2
  L12_2.keypad = L13_2
  L13_2 = {}
  L12_2.lasers = L13_2
  L13_2 = L12_2.label
  if "" == L13_2 then
    L12_2.label = "Security System"
  end
  L13_2 = ipairs
  L14_2 = A1_2 or L14_2
  if not A1_2 then
    L14_2 = {}
  end
  L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
  for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do
    L19_2 = L49_1
    L20_2 = L18_2.startVector
    L19_2 = L19_2(L20_2)
    L20_2 = L49_1
    L21_2 = L18_2.endVector
    L20_2 = L20_2(L21_2)
    if L19_2 and L20_2 then
      L21_2 = L12_2.lasers
      L22_2 = L12_2.lasers
      L22_2 = #L22_2
      L22_2 = L22_2 + 1
      L23_2 = {}
      L24_2 = "laser_%s"
      L25_2 = L24_2
      L24_2 = L24_2.format
      L26_2 = L17_2
      L24_2 = L24_2(L25_2, L26_2)
      L23_2.id = L24_2
      L24_2 = {}
      L25_2 = L19_2.x
      L26_2 = A2_2.x
      L25_2 = L25_2 - L26_2
      L26_2 = L19_2.y
      L27_2 = A2_2.y
      L26_2 = L26_2 - L27_2
      L27_2 = L19_2.z
      L28_2 = A2_2.z
      L27_2 = L27_2 - L28_2
      L24_2[1] = L25_2
      L24_2[2] = L26_2
      L24_2[3] = L27_2
      L23_2.startVector = L24_2
      L24_2 = {}
      L25_2 = L20_2.x
      L26_2 = A2_2.x
      L25_2 = L25_2 - L26_2
      L26_2 = L20_2.y
      L27_2 = A2_2.y
      L26_2 = L26_2 - L27_2
      L27_2 = L20_2.z
      L28_2 = A2_2.z
      L27_2 = L27_2 - L28_2
      L24_2[1] = L25_2
      L24_2[2] = L26_2
      L24_2[3] = L27_2
      L23_2.endVector = L24_2
      L24_2 = tonumber
      L25_2 = L18_2.intensity
      L24_2 = L24_2(L25_2)
      if not L24_2 then
        L24_2 = 100
      end
      L23_2.intensity = L24_2
      L24_2 = L18_2.movement
      L23_2.movement = L24_2
      L21_2[L22_2] = L23_2
    end
  end
  return L12_2
end
function L192_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  if A0_2 then
    L3_2 = A0_2.coords
    if L3_2 then
      goto lbl_8
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_8::
  L3_2 = L49_1
  L4_2 = A0_2.coords
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L4_2 = nil
    return L4_2
  end
  L4_2 = {}
  L4_2.isPlaced = true
  L4_2.model = "mp_m_freemode_01"
  L5_2 = L58_1
  L6_2 = A2_2
  L5_2 = L5_2(L6_2)
  L4_2.stance = L5_2
  L5_2 = {}
  L6_2 = L3_2.x
  L7_2 = A1_2.x
  L6_2 = L6_2 - L7_2
  L5_2.x = L6_2
  L6_2 = L3_2.y
  L7_2 = A1_2.y
  L6_2 = L6_2 - L7_2
  L5_2.y = L6_2
  L6_2 = L3_2.z
  L7_2 = A1_2.z
  L6_2 = L6_2 - L7_2
  L5_2.z = L6_2
  L4_2.coords = L5_2
  L5_2 = tonumber
  L6_2 = A0_2.heading
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L5_2 = 0.0
  end
  L4_2.heading = L5_2
  L4_2.animDict = "timetable@tracy@sleep@"
  L4_2.animAction = "idle_c"
  return L4_2
end
function L193_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A0_2 and 0 ~= A0_2 then
    L2_2 = DoesEntityExist
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L2_2 = L58_1
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = ClearPedTasksImmediately
  L4_2 = A0_2
  L3_2(L4_2)
  L3_2 = FreezeEntityPosition
  L4_2 = A0_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  if "standing" == L2_2 then
    L3_2 = TaskStandStill
    L4_2 = A0_2
    L5_2 = -1
    L3_2(L4_2, L5_2)
    return
  end
  L3_2 = L92_1
  L4_2 = A0_2
  L5_2 = "timetable@tracy@sleep@"
  L6_2 = "idle_c"
  L3_2(L4_2, L5_2, L6_2)
end
function L194_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.type = "toggleUIVisibility"
  L1_2.visible = false
  L0_2(L1_2)
  L0_2 = PlayerPedId
  L0_2 = L0_2()
  L1_2 = ClonePedEx
  L2_2 = L0_2
  L3_2 = 0.0
  L4_2 = false
  L5_2 = true
  L6_2 = 1
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  if 0 ~= L1_2 then
    L2_2 = DoesEntityExist
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_44
    end
  end
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.type = "toggleUIVisibility"
  L3_2.visible = true
  L2_2(L3_2)
  L2_2 = TabletEmote
  L2_2()
  L2_2 = {}
  L2_2.success = false
  L2_2.error = "Home owner placement preview failed."
  do return L2_2 end
  ::lbl_44::
  L2_2 = "sleeping"
  L3_2 = L52_1
  L4_2 = GetEntityHeading
  L5_2 = L0_2
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2 = L4_2(L5_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2)
  L4_2 = SetEntityCollision
  L5_2 = L1_2
  L6_2 = false
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = SetEntityInvincible
  L5_2 = L1_2
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = FreezeEntityPosition
  L5_2 = L1_2
  L6_2 = true
  L4_2(L5_2, L6_2)
  L4_2 = SetEntityVisible
  L5_2 = L0_2
  L6_2 = true
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = SetEntityAlpha
  L5_2 = L0_2
  L6_2 = 255
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = SetEntityAlpha
  L5_2 = L1_2
  L6_2 = 215
  L7_2 = false
  L4_2(L5_2, L6_2, L7_2)
  L4_2 = L193_1
  L5_2 = L1_2
  L6_2 = L2_2
  L4_2(L5_2, L6_2)
  function L4_2()
    local L0_3, L1_3, L2_3, L3_3
    L0_3 = L1_2
    if 0 ~= L0_3 then
      L0_3 = DoesEntityExist
      L1_3 = L1_2
      L0_3 = L0_3(L1_3)
      if L0_3 then
        L0_3 = DeleteEntity
        L1_3 = L1_2
        L0_3(L1_3)
      end
    end
    L0_3 = SetEntityVisible
    L1_3 = L0_2
    L2_3 = true
    L3_3 = false
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = SetEntityAlpha
    L1_3 = L0_2
    L2_3 = 255
    L3_3 = false
    L0_3(L1_3, L2_3, L3_3)
    L0_3 = HideRobberyCreatorPrompt
    L0_3()
  end
  while true do
    L5_2 = Wait
    L6_2 = 0
    L5_2(L6_2)
    L5_2 = DisableControlAction
    L6_2 = 0
    L7_2 = 24
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = DisableControlAction
    L6_2 = 0
    L7_2 = 25
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = DisableControlAction
    L6_2 = 0
    L7_2 = 140
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = DisableControlAction
    L6_2 = 0
    L7_2 = 141
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = DisableControlAction
    L6_2 = 0
    L7_2 = 142
    L8_2 = true
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = GetEntityCoords
    L6_2 = L0_2
    L5_2 = L5_2(L6_2)
    L6_2 = type
    L7_2 = RayCastGamePlayCamera
    L6_2 = L6_2(L7_2)
    if "function" == L6_2 then
      L6_2 = RayCastGamePlayCamera
      L7_2 = 20.0
      L6_2, L7_2 = L6_2(L7_2)
      if L6_2 and L7_2 then
        L8_2 = vector3
        L9_2 = L7_2.x
        L10_2 = L7_2.y
        L11_2 = L7_2.z
        L8_2 = L8_2(L9_2, L10_2, L11_2)
        L5_2 = L8_2
      end
      L8_2 = DrawMarker
      L9_2 = 28
      L10_2 = L5_2.x
      L11_2 = L5_2.y
      L12_2 = L5_2.z
      L12_2 = L12_2 + 0.03
      L13_2 = 0.0
      L14_2 = 0.0
      L15_2 = 0.0
      L16_2 = 0.0
      L17_2 = 0.0
      L18_2 = 0.0
      L19_2 = 0.12
      L20_2 = 0.12
      L21_2 = 0.12
      L22_2 = 0
      L23_2 = 150
      L24_2 = 0
      L25_2 = 125
      L26_2 = false
      L27_2 = false
      L28_2 = 2
      L29_2 = false
      L30_2 = nil
      L31_2 = nil
      L32_2 = false
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2)
      L8_2 = GetGameplayCamCoords
      L8_2 = L8_2()
      L9_2 = DrawLine
      L10_2 = L8_2.x
      L11_2 = L8_2.y
      L12_2 = L8_2.z
      L13_2 = L5_2.x
      L14_2 = L5_2.y
      L15_2 = L5_2.z
      L16_2 = 0
      L17_2 = 150
      L18_2 = 0
      L19_2 = 200
      L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L9_2 = IsControlPressed
      L10_2 = 0
      L11_2 = 174
      L9_2 = L9_2(L10_2, L11_2)
      if L9_2 then
        L9_2 = L52_1
        L10_2 = L3_2 + 1.0
        L9_2 = L9_2(L10_2)
        L3_2 = L9_2
      end
      L9_2 = IsControlPressed
      L10_2 = 0
      L11_2 = 175
      L9_2 = L9_2(L10_2, L11_2)
      if L9_2 then
        L9_2 = L52_1
        L10_2 = L3_2 - 1.0
        L9_2 = L9_2(L10_2)
        L3_2 = L9_2
      end
    else
      L6_2 = GetEntityHeading
      L7_2 = L0_2
      L6_2 = L6_2(L7_2)
      L3_2 = L6_2
    end
    L6_2 = IsControlJustPressed
    L7_2 = 0
    L8_2 = 14
    L6_2 = L6_2(L7_2, L8_2)
    if not L6_2 then
      L6_2 = IsControlJustPressed
      L7_2 = 0
      L8_2 = 15
      L6_2 = L6_2(L7_2, L8_2)
      if not L6_2 then
        goto lbl_222
      end
    end
    if "sleeping" == L2_2 then
      L6_2 = "standing"
      if L6_2 then
        goto lbl_218
        L2_2 = L6_2 or L2_2
      end
    end
    L2_2 = "sleeping"
    ::lbl_218::
    L6_2 = L193_1
    L7_2 = L1_2
    L8_2 = L2_2
    L6_2(L7_2, L8_2)
    ::lbl_222::
    L6_2 = DoesEntityExist
    L7_2 = L1_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = SetEntityCoords
      L7_2 = L1_2
      L8_2 = L5_2.x
      L9_2 = L5_2.y
      L10_2 = L5_2.z
      L11_2 = false
      L12_2 = false
      L13_2 = false
      L14_2 = false
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
      L6_2 = SetEntityHeading
      L7_2 = L1_2
      L8_2 = L3_2
      L6_2(L7_2, L8_2)
    end
    L6_2 = DrawRobberyCreatorPrompt
    L7_2 = {}
    L7_2.title = "Home Owner Placement"
    L7_2.description = "Place the home owner preview inside the shell and choose the stance."
    L8_2 = "Mode: %s"
    L9_2 = L8_2
    L8_2 = L8_2.format
    if "sleeping" == L2_2 then
      L10_2 = "Sleeping"
      if L10_2 then
        goto lbl_254
      end
    end
    L10_2 = "Standing"
    ::lbl_254::
    L8_2 = L8_2(L9_2, L10_2)
    L7_2.meta = L8_2
    L8_2 = {}
    L9_2 = {}
    L9_2.key = "E"
    L9_2.label = "Confirm home owner"
    L9_2.tone = "primary"
    L10_2 = {}
    L10_2.key = "Backspace"
    L10_2.label = "Cancel"
    L10_2.tone = "danger"
    L11_2 = {}
    L11_2.key = "MW"
    L11_2.label = "Toggle sleep or stand"
    L12_2 = {}
    L12_2.key = "Left / Right"
    L12_2.label = "Rotate heading"
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L8_2[4] = L12_2
    L7_2.actions = L8_2
    L6_2(L7_2)
    L6_2 = IsControlJustPressed
    L7_2 = 0
    L8_2 = 38
    L6_2 = L6_2(L7_2, L8_2)
    if L6_2 then
      L6_2 = GetStreetNameAtCoord
      L7_2 = L5_2.x
      L8_2 = L5_2.y
      L9_2 = L5_2.z
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L7_2 = GetStreetNameFromHashKey
      L8_2 = L6_2 or L8_2
      if not L6_2 then
        L8_2 = 0
      end
      L7_2 = L7_2(L8_2)
      L8_2 = L4_2
      L8_2()
      L8_2 = {}
      L8_2.success = true
      L8_2.stance = L2_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = L5_2.x
      L10_2.x = L11_2
      L11_2 = L5_2.y
      L10_2.y = L11_2
      L11_2 = L5_2.z
      L10_2.z = L11_2
      L9_2.coords = L10_2
      L9_2.heading = L3_2
      L8_2.location = L9_2
      L8_2.streetName = L7_2
      return L8_2
    else
      L6_2 = IsControlJustPressed
      L7_2 = 0
      L8_2 = 177
      L6_2 = L6_2(L7_2, L8_2)
      if L6_2 then
        L6_2 = L4_2
        L6_2()
        L6_2 = {}
        L6_2.success = false
        L6_2.error = "Home owner placement cancelled."
        return L6_2
      end
    end
  end
end
function L195_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L4_2 = type
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L4_2 = A0_2 or L4_2
  if "table" ~= L4_2 or not A0_2 then
    L4_2 = {}
  end
  L5_2 = type
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L5_2 = A1_2 or L5_2
  if "table" ~= L5_2 or not A1_2 then
    L5_2 = {}
  end
  L6_2 = type
  L7_2 = A3_2
  L6_2 = L6_2(L7_2)
  if "table" ~= L6_2 or not A3_2 then
    L6_2 = {}
    A3_2 = L6_2
  end
  L6_2 = A3_2.singlePlacement
  L6_2 = true == L6_2
  L7_2 = L43_1
  L8_2 = L4_2.model
  L7_2 = L7_2(L8_2)
  if "" == L7_2 then
    L7_2 = A2_2
    L8_2 = {}
    L8_2.success = false
    L8_2.error = "No shell model was provided."
    L7_2(L8_2)
    return
  end
  L7_2 = type
  L8_2 = RunRobberyCreatorTargetPlacement
  L7_2 = L7_2(L8_2)
  if "function" ~= L7_2 then
    L7_2 = A2_2
    L8_2 = {}
    L8_2.success = false
    L8_2.error = "Shared target placement is unavailable."
    L7_2(L8_2)
    return
  end
  L7_2 = L187_1
  L8_2 = L4_2
  L9_2 = L5_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2)
  if not L9_2 then
    L11_2 = L186_1
    L12_2 = L7_2
    L13_2 = L8_2
    L14_2 = L9_2
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = A2_2
    L12_2 = {}
    L12_2.success = false
    L12_2.error = "That shell could not be loaded."
    L11_2(L12_2)
    return
  end
  L11_2 = {}
  L11_2.instance = L9_2
  L11_2.preset = L5_2
  L12_2 = "house_place_%s_%s"
  L13_2 = L12_2
  L12_2 = L12_2.format
  L14_2 = L43_1
  L15_2 = L4_2.id
  if not L15_2 then
    L15_2 = L4_2.model
    if not L15_2 then
      L15_2 = L10_2
    end
  end
  L14_2 = L14_2(L15_2)
  L15_2 = tostring
  L16_2 = GetGameTimer
  L16_2, L17_2 = L16_2()
  L15_2, L16_2, L17_2 = L15_2(L16_2, L17_2)
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
  L11_2.assetTag = L12_2
  L12_2 = {}
  L13_2 = L97_1
  L14_2 = L11_2
  L13_2(L14_2)
  L13_2 = L41_1
  L14_2 = L11_2
  L15_2 = L12_2
  L13_2(L14_2, L15_2)
  L13_2 = L5_2.lootPoints
  if not L13_2 then
    L13_2 = {}
  end
  L13_2 = #L13_2
  L13_2 = L13_2 + 1
  L14_2 = L184_1
  L15_2 = L9_2
  L16_2 = L5_2.lootPoints
  if not L16_2 then
    L16_2 = {}
  end
  L17_2 = L12_2
  L14_2 = L14_2(L15_2, L16_2, L17_2)
  function L15_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
    L14_2.active = false
    L2_3 = L91_1
    L3_3 = L11_2
    L2_3(L3_3)
    L2_3 = L186_1
    L3_3 = L7_2
    L4_3 = L8_2
    L5_3 = L9_2
    L6_3 = L6_2
    if L6_3 then
      L6_3 = {}
      L6_3.keepInside = true
      L7_3 = L4_2
      L6_3.shell = L7_3
      L7_3 = L5_2
      L6_3.preset = L7_3
      L7_3 = L10_2
      L6_3.previewKey = L7_3
      if L6_3 then
        goto lbl_24
      end
    end
    L6_3 = nil
    ::lbl_24::
    L2_3(L3_3, L4_3, L5_3, L6_3)
    if A0_3 then
      L2_3 = A2_2
      L3_3 = {}
      L3_3.success = true
      L4_3 = L12_2
      L3_3.points = L4_3
      L2_3(L3_3)
    else
      L2_3 = A2_2
      L3_3 = {}
      L3_3.success = false
      L4_3 = A1_3 or L4_3
      if not A1_3 then
        L4_3 = "Loot point placement cancelled."
      end
      L3_3.error = L4_3
      L2_3(L3_3)
    end
  end
  function L16_2()
    local L0_3, L1_3, L2_3
    L0_3 = RunRobberyCreatorTargetPlacement
    L1_3 = {}
    L1_3.message = "robabble object"
    L2_3 = L6_2
    L2_3 = not L2_3
    L1_3.allowSaveAndExit = L2_3
    function L2_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4
      if A0_4 then
        L1_4 = A0_4.SaveAndExit
        if L1_4 then
          L1_4 = L12_2
          L1_4 = #L1_4
          if L1_4 > 0 then
            L1_4 = L15_2
            L2_4 = true
            L1_4(L2_4)
          else
            L1_4 = L15_2
            L2_4 = false
            L3_4 = "Loot point placement cancelled."
            L1_4(L2_4, L3_4)
          end
          return
        end
      end
      if A0_4 then
        L1_4 = A0_4.FinalInfo
        if L1_4 then
          goto lbl_25
        end
      end
      L1_4 = nil
      ::lbl_25::
      L2_4 = L180_1
      L3_4 = L1_4
      L4_4 = L9_2.spawn
      L5_4 = L13_2
      L2_4 = L2_4(L3_4, L4_4, L5_4)
      if L2_4 then
        L3_4 = L12_2
        L3_4 = #L3_4
        L4_4 = L3_4 + 1
        L3_4 = L12_2
        L3_4[L4_4] = L2_4
        L3_4 = Notify
        L4_4 = "Saved house point headings | prop: %.2f | player animation: %.2f"
        L5_4 = L4_4
        L4_4 = L4_4.format
        L6_4 = tonumber
        L7_4 = L2_4.propHeading
        L6_4 = L6_4(L7_4)
        if not L6_4 then
          L6_4 = 0.0
        end
        L7_4 = tonumber
        L8_4 = L2_4.pedHeading
        L7_4 = L7_4(L8_4)
        if not L7_4 then
          L7_4 = 0.0
        end
        L4_4 = L4_4(L5_4, L6_4, L7_4)
        L5_4 = "success"
        L6_4 = 7500
        L3_4(L4_4, L5_4, L6_4)
        L3_4 = PrintDebug
        L4_4 = "House point saved"
        L5_4 = tostring
        L6_4 = L2_4.label
        if not L6_4 then
          L6_4 = L2_4.prop
          if not L6_4 then
            L6_4 = L13_2
          end
        end
        L5_4 = L5_4(L6_4)
        L6_4 = "propHeading:"
        L7_4 = tonumber
        L8_4 = L2_4.propHeading
        L7_4 = L7_4(L8_4)
        if not L7_4 then
          L7_4 = 0.0
        end
        L8_4 = "playerAnimationHeading:"
        L9_4 = tonumber
        L10_4 = L2_4.pedHeading
        L9_4 = L9_4(L10_4)
        if not L9_4 then
          L9_4 = 0.0
        end
        L3_4(L4_4, L5_4, L6_4, L7_4, L8_4, L9_4)
        L3_4 = L13_2
        L3_4 = L3_4 + 1
        L13_2 = L3_4
        L3_4 = L41_1
        L4_4 = L11_2
        L5_4 = L12_2
        L3_4(L4_4, L5_4)
        L3_4 = L6_2
        if L3_4 then
          L3_4 = L15_2
          L4_4 = true
          L3_4(L4_4)
          return
        end
        L3_4 = SetNuiFocus
        L4_4 = false
        L5_4 = false
        L3_4(L4_4, L5_4)
        L3_4 = SendNUIMessage
        L4_4 = {}
        L4_4.type = "toggleUIVisibility"
        L4_4.visible = false
        L3_4(L4_4)
        L3_4 = L16_2
        L3_4()
        return
      end
      L3_4 = L12_2
      L3_4 = #L3_4
      if L3_4 > 0 then
        L3_4 = L15_2
        L4_4 = true
        L3_4(L4_4)
      else
        L3_4 = L15_2
        L4_4 = false
        L5_4 = "Loot point placement cancelled."
        L3_4(L4_4, L5_4)
      end
    end
    L0_3(L1_3, L2_3)
  end
  L17_2 = L16_2
  L17_2()
end
function L196_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L4_2 = type
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L4_2 = A0_2 or L4_2
  if "table" ~= L4_2 or not A0_2 then
    L4_2 = {}
  end
  L5_2 = type
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L5_2 = A1_2 or L5_2
  if "table" ~= L5_2 or not A1_2 then
    L5_2 = {}
  end
  L6_2 = type
  L7_2 = A3_2
  L6_2 = L6_2(L7_2)
  if "table" ~= L6_2 or not A3_2 then
    L6_2 = {}
    A3_2 = L6_2
  end
  L6_2 = A3_2.keepInside
  L6_2 = true == L6_2
  L7_2 = L43_1
  L8_2 = L4_2.model
  L7_2 = L7_2(L8_2)
  if "" == L7_2 then
    L7_2 = A2_2
    L8_2 = {}
    L8_2.success = false
    L8_2.error = "No shell model was provided."
    L7_2(L8_2)
    return
  end
  L7_2 = L187_1
  L8_2 = L4_2
  L9_2 = L5_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2)
  if not L9_2 then
    L11_2 = L186_1
    L12_2 = L7_2
    L13_2 = L8_2
    L14_2 = L9_2
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = A2_2
    L12_2 = {}
    L12_2.success = false
    L12_2.error = "That shell could not be loaded."
    L11_2(L12_2)
    return
  end
  L11_2 = {}
  L11_2.instance = L9_2
  L11_2.preset = L5_2
  L12_2 = "house_security_%s_%s"
  L13_2 = L12_2
  L12_2 = L12_2.format
  L14_2 = L43_1
  L15_2 = L4_2.id
  if not L15_2 then
    L15_2 = L4_2.model
    if not L15_2 then
      L15_2 = L10_2
    end
  end
  L14_2 = L14_2(L15_2)
  L15_2 = tostring
  L16_2 = GetGameTimer
  L16_2, L17_2, L18_2, L19_2, L20_2 = L16_2()
  L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2)
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L11_2.assetTag = L12_2
  L12_2 = L97_1
  L13_2 = L11_2
  L12_2(L13_2)
  function L12_2(A0_3, A1_3, A2_3)
    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L3_3 = L91_1
    L4_3 = L11_2
    L3_3(L4_3)
    L3_3 = L186_1
    L4_3 = L7_2
    L5_3 = L8_2
    L6_3 = L9_2
    L7_3 = L6_2
    if L7_3 then
      L7_3 = {}
      L7_3.keepInside = true
      L8_3 = L4_2
      L7_3.shell = L8_3
      L8_3 = L5_2
      L7_3.preset = L8_3
      L8_3 = L10_2
      L7_3.previewKey = L8_3
      if L7_3 then
        goto lbl_23
      end
    end
    L7_3 = nil
    ::lbl_23::
    L3_3(L4_3, L5_3, L6_3, L7_3)
    L3_3 = A2_2
    L4_3 = {}
    L5_3 = true == A0_3
    L4_3.success = L5_3
    L4_3.securitySystem = A1_3
    L4_3.error = A2_3
    L3_3(L4_3)
  end
  L13_2 = L185_1
  L14_2 = "~INPUT_CONTEXT~ Confirm keypad position  |  ~INPUT_VEH_DUCK~ Cancel"
  L15_2 = {}
  L15_2.keepUiHidden = true
  L15_2.previewModel = "prop_ld_keypad_01b"
  L15_2.title = "Security Keypad Placement"
  L15_2.description = "Place the keypad where players should start the house security system."
  L15_2.meta = "Shared across the selected shell security layout"
  L13_2 = L13_2(L14_2, L15_2)
  if L13_2 then
    L14_2 = L13_2.success
    if true == L14_2 then
      L14_2 = L13_2.location
      if L14_2 then
        goto lbl_113
      end
    end
  end
  L14_2 = L12_2
  L15_2 = false
  L16_2 = nil
  L17_2 = "Security system placement cancelled."
  L14_2(L15_2, L16_2, L17_2)
  do return end
  ::lbl_113::
  L14_2 = {}
  while true do
    L15_2 = L189_1
    L16_2 = {}
    L17_2 = #L14_2
    L17_2 = L17_2 > 0
    L16_2.hasPlacedLasers = L17_2
    L15_2 = L15_2(L16_2)
    if L15_2 then
      L16_2 = L15_2.save
      if true == L16_2 then
        L16_2 = L191_1
        L17_2 = L13_2.location
        L18_2 = L14_2
        L19_2 = L9_2.spawn
        L20_2 = L5_2.securitySystem
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
        L17_2 = L12_2
        L18_2 = nil ~= L16_2
        L19_2 = L16_2
        if L16_2 then
        end
        L20_2 = "Security system placement cancelled."
        L17_2(L18_2, L19_2, L20_2)
        return
      end
    end
    if L15_2 then
      L16_2 = L15_2.success
      if L16_2 then
        L16_2 = L15_2.FinalInfo
        if L16_2 then
          L16_2 = L15_2.FinalInfo
          L16_2 = L16_2.vector1
          if L16_2 then
            L16_2 = L15_2.FinalInfo
            L16_2 = L16_2.vector2
            if L16_2 then
              L16_2 = {}
              L17_2 = L15_2.FinalInfo
              L17_2 = L17_2.vector1
              L16_2.startVector = L17_2
              L17_2 = L15_2.FinalInfo
              L17_2 = L17_2.vector2
              L16_2.endVector = L17_2
              L16_2.intensity = 100
              L16_2.movement = nil
              L17_2 = #L14_2
              L17_2 = L17_2 + 1
              L14_2[L17_2] = L16_2
              L17_2 = L188_1
              L18_2 = L11_2
              L19_2 = L16_2
              L20_2 = #L14_2
              L17_2(L18_2, L19_2, L20_2)
              L17_2 = Notify
              L18_2 = Config
              L18_2 = L18_2.T
              L19_2 = "LaserSavedNext"
              L18_2 = L18_2(L19_2)
              L19_2 = "success"
              L20_2 = 4500
              L17_2(L18_2, L19_2, L20_2)
          end
        end
      end
    end
    else
      L16_2 = #L14_2
      if L16_2 > 0 then
        L16_2 = L191_1
        L17_2 = L13_2.location
        L18_2 = L14_2
        L19_2 = L9_2.spawn
        L20_2 = L5_2.securitySystem
        L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
        L17_2 = L12_2
        L18_2 = nil ~= L16_2
        L19_2 = L16_2
        if L16_2 then
        end
        L20_2 = "Security system placement cancelled."
        L17_2(L18_2, L19_2, L20_2)
        return
      else
        L16_2 = L12_2
        L17_2 = false
        L18_2 = nil
        L19_2 = "Security system placement cancelled."
        L16_2(L17_2, L18_2, L19_2)
        return
      end
    end
  end
end
function L197_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L4_2 = type
  L5_2 = A0_2
  L4_2 = L4_2(L5_2)
  L4_2 = A0_2 or L4_2
  if "table" ~= L4_2 or not A0_2 then
    L4_2 = {}
  end
  L5_2 = type
  L6_2 = A1_2
  L5_2 = L5_2(L6_2)
  L5_2 = A1_2 or L5_2
  if "table" ~= L5_2 or not A1_2 then
    L5_2 = {}
  end
  L6_2 = type
  L7_2 = A3_2
  L6_2 = L6_2(L7_2)
  if "table" ~= L6_2 or not A3_2 then
    L6_2 = {}
    A3_2 = L6_2
  end
  L6_2 = A3_2.keepInside
  L6_2 = true == L6_2
  L7_2 = L43_1
  L8_2 = L4_2.model
  L7_2 = L7_2(L8_2)
  if "" == L7_2 then
    L7_2 = A2_2
    L8_2 = {}
    L8_2.success = false
    L8_2.error = "No shell model was provided."
    L7_2(L8_2)
    return
  end
  L7_2 = L187_1
  L8_2 = L4_2
  L9_2 = L5_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2)
  if not L9_2 then
    L11_2 = L186_1
    L12_2 = L7_2
    L13_2 = L8_2
    L14_2 = L9_2
    L11_2(L12_2, L13_2, L14_2)
    L11_2 = A2_2
    L12_2 = {}
    L12_2.success = false
    L12_2.error = "That shell could not be loaded."
    L11_2(L12_2)
    return
  end
  L11_2 = {}
  L11_2.instance = L9_2
  L11_2.preset = L5_2
  L12_2 = "house_owner_%s_%s"
  L13_2 = L12_2
  L12_2 = L12_2.format
  L14_2 = L43_1
  L15_2 = L4_2.id
  if not L15_2 then
    L15_2 = L4_2.model
    if not L15_2 then
      L15_2 = L10_2
    end
  end
  L14_2 = L14_2(L15_2)
  L15_2 = tostring
  L16_2 = GetGameTimer
  L16_2, L17_2, L18_2 = L16_2()
  L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2, L17_2, L18_2)
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)
  L11_2.assetTag = L12_2
  L12_2 = L97_1
  L13_2 = L11_2
  L12_2(L13_2)
  L12_2 = L194_1
  L12_2 = L12_2()
  if L12_2 then
    L13_2 = L12_2.success
    if L13_2 then
      L13_2 = L12_2.location
      if L13_2 then
        L13_2 = L192_1
        L14_2 = L12_2.location
        L15_2 = L9_2.spawn
        L16_2 = L12_2.stance
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        if L13_2 then
          goto lbl_106
        end
      end
    end
  end
  L13_2 = nil
  ::lbl_106::
  L14_2 = L91_1
  L15_2 = L11_2
  L14_2(L15_2)
  L14_2 = L186_1
  L15_2 = L7_2
  L16_2 = L8_2
  L17_2 = L9_2
  if L6_2 then
    L18_2 = {}
    L18_2.keepInside = true
    L18_2.shell = L4_2
    L18_2.preset = L5_2
    L18_2.previewKey = L10_2
    if L18_2 then
      goto lbl_124
    end
  end
  L18_2 = nil
  ::lbl_124::
  L14_2(L15_2, L16_2, L17_2, L18_2)
  L14_2 = A2_2
  L15_2 = {}
  L16_2 = nil ~= L13_2
  L15_2.success = L16_2
  L15_2.homeOwner = L13_2
  if L13_2 then
  end
  L15_2.error = "Home owner placement cancelled."
  L14_2(L15_2)
end
function L198_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L0_2 = L4_1
  if L0_2 then
    L0_2 = L4_1.location
    if L0_2 then
      goto lbl_8
    end
  end
  do return end
  ::lbl_8::
  L0_2 = L43_1
  L1_2 = L4_1.location
  L1_2 = L1_2.id
  L0_2 = L0_2(L1_2)
  L1_2 = L4_1.preset
  if L1_2 then
    L1_2 = L4_1.preset
    L1_2 = L1_2.securitySystem
    if L1_2 then
      goto lbl_20
    end
  end
  L1_2 = nil
  ::lbl_20::
  L2_2 = type
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = L1_2.isPlaced
    if true == L2_2 then
      goto lbl_29
    end
  end
  do return end
  ::lbl_29::
  L2_2 = L4_1.securityDisabled
  if true == L2_2 then
    L2_2 = Notify
    L3_2 = Config
    L3_2 = L3_2.T
    L4_2 = "SecurityAlreadyDisabled"
    L3_2 = L3_2(L4_2)
    L4_2 = "error"
    L2_2(L3_2, L4_2)
    return
  end
  L2_2 = L4_1.securityBusy
  if L2_2 then
    return
  end
  L4_1.securityBusy = true
  L2_2 = L110_1
  L3_2 = L0_2
  L2_2, L3_2 = L2_2(L3_2)
  if not L2_2 then
    L4_1.securityBusy = false
    if "disabled" == L3_2 then
      L4_1.securityDisabled = true
      L4_2 = L101_1
      L5_2 = L0_2
      L4_2(L5_2)
      L4_2 = L90_1
      L5_2 = L4_1
      L4_2(L5_2)
      L4_2 = Notify
      L5_2 = Config
      L5_2 = L5_2.T
      L6_2 = "SecurityAlreadyDisabledPrimary"
      L5_2 = L5_2(L6_2)
      L6_2 = "primary"
      L4_2(L5_2, L6_2)
    elseif "busy" == L3_2 then
      L4_2 = Notify
      L5_2 = Config
      L5_2 = L5_2.T
      L6_2 = "SomeoneDisablingSecurity"
      L5_2 = L5_2(L6_2)
      L6_2 = "error"
      L4_2(L5_2, L6_2)
    else
      L4_2 = L126_1
      L4_2()
    end
    return
  end
  L4_2 = L139_1
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_1.securityBusy = false
    L4_2 = L108_1
    L5_2 = L0_2
    L6_2 = false
    L4_2(L5_2, L6_2)
    return
  end
  L4_2 = L1_2.requiresItem
  if true == L4_2 then
    L4_2 = L137_1
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L4_1.securityBusy = false
      L4_2 = L108_1
      L5_2 = L0_2
      L6_2 = false
      L4_2(L5_2, L6_2)
      return
    end
  end
  L4_2 = nil
  L5_2 = false
  L6_2 = L134_1
  L7_2 = L1_2
  L6_2 = L6_2(L7_2)
  L7_2 = L133_1
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  if L7_2 then
    L8_2 = select
    L9_2 = 1
    L10_2 = L127_1
    L11_2 = L4_1
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L10_2(L11_2)
    L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    if L8_2 then
      L9_2 = SetPedHeadingToFaceVector
      L10_2 = PlayerPedId
      L10_2 = L10_2()
      L11_2 = L8_2
      L9_2(L10_2, L11_2)
    end
    L5_2 = true
    L9_2 = L135_1
    L10_2 = L161_1
    L11_2 = L1_2
    L12_2 = GetEntityHeading
    L13_2 = PlayerPedId
    L13_2, L14_2, L15_2, L16_2, L17_2 = L13_2()
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)
    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L4_2 = L9_2
  end
  L8_2 = L136_1
  L9_2 = L6_2 or L9_2
  if not L7_2 or not L6_2 then
    L9_2 = "none"
  end
  L8_2, L9_2 = L8_2(L9_2)
  if L4_2 then
    L10_2 = L4_2
    L10_2()
  end
  if not L8_2 then
    L10_2 = L1_2.requiresItem
    if true == L10_2 and L9_2 then
      L10_2 = L138_1
      L11_2 = L1_2
      L10_2(L11_2)
    end
    L4_1.securityBusy = false
    L10_2 = L108_1
    L11_2 = L0_2
    L12_2 = false
    L10_2(L11_2, L12_2)
    L10_2 = L145_1
    L11_2 = L4_1.location
    L12_2 = L1_2
    L10_2(L11_2, L12_2)
    L10_2 = Notify
    L11_2 = Config
    L11_2 = L11_2.T
    L12_2 = "SecurityDisableFailed"
    L11_2 = L11_2(L12_2)
    L12_2 = "error"
    L10_2(L11_2, L12_2)
    L10_2 = CreateThread
    function L11_2()
      local L0_3, L1_3
      L0_3 = Wait
      L1_3 = 200
      L0_3(L1_3)
      L0_3 = ClearPedTasksImmediately
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L0_3(L1_3)
    end
    L10_2(L11_2)
    return
  end
  L10_2 = select
  L11_2 = 1
  L12_2 = L127_1
  L13_2 = L4_1
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L12_2(L13_2)
  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  if L10_2 then
    L11_2 = SetPedHeadingToFaceVector
    L12_2 = PlayerPedId
    L12_2 = L12_2()
    L13_2 = L10_2
    L11_2(L12_2, L13_2)
  end
  if not L5_2 then
    L11_2 = L132_1
    L12_2 = "Disabling security system"
    L13_2 = 3500
    L14_2 = L161_1
    L15_2 = L1_2
    L16_2 = GetEntityHeading
    L17_2 = PlayerPedId
    L17_2 = L17_2()
    L16_2, L17_2 = L16_2(L17_2)
    L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2, L16_2, L17_2)
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  end
  L11_2 = L144_1
  L12_2 = L146_1
  L13_2 = L4_1.location
  L14_2 = L1_2
  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L12_2(L13_2, L14_2)
  L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
  L4_1.securityDisabled = true
  L4_1.securityBusy = false
  L11_2 = L101_1
  L12_2 = L0_2
  L11_2(L12_2)
  L11_2 = L90_1
  L12_2 = L4_1
  L11_2(L12_2)
  L11_2 = L108_1
  L12_2 = L0_2
  L13_2 = true
  L11_2(L12_2, L13_2)
  L11_2 = Notify
  L12_2 = Config
  L12_2 = L12_2.T
  L13_2 = "SecurityDisabled"
  L12_2 = L12_2(L13_2)
  L13_2 = "success"
  L11_2(L12_2, L13_2)
  L11_2 = CreateThread
  function L12_2()
    local L0_3, L1_3
    L0_3 = Wait
    L1_3 = 200
    L0_3(L1_3)
    L0_3 = ClearPedTasksImmediately
    L1_3 = PlayerPedId
    L1_3 = L1_3()
    L0_3(L1_3)
  end
  L11_2(L12_2)
end
L30_1 = L198_1
function L198_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = L4_1
  if not L1_2 then
    return
  end
  L1_2 = L44_1
  L2_2 = L4_1
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = Notify
    L2_2 = Config
    L2_2 = L2_2.T
    L3_2 = "LootPointAlreadySearched"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = L81_1
  L2_2 = L4_1
  L3_2 = A0_2
  L1_2 = L1_2(L2_2, L3_2)
  if not L1_2 then
    L1_2 = Notify
    L2_2 = Config
    L2_2 = L2_2.T
    L3_2 = "LootPointUnavailable"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    L1_2 = L100_1
    L2_2 = L4_1.location
    L2_2 = L2_2.id
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = L4_1.busyLootPoints
  if not L1_2 then
    L1_2 = {}
  end
  L4_1.busyLootPoints = L1_2
  L1_2 = L4_1.busyLootPoints
  L1_2 = L1_2[A0_2]
  if L1_2 then
    return
  end
  L1_2 = L4_1.busyLootPoints
  L1_2[A0_2] = true
  L1_2 = L43_1
  L2_2 = L4_1.location
  if L2_2 then
    L2_2 = L4_1.location
    L2_2 = L2_2.id
  end
  L1_2 = L1_2(L2_2)
  L2_2 = L109_1
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L4_2 = L4_1.busyLootPoints
    L4_2[A0_2] = nil
    if "looted" == L3_2 then
      L4_2 = L4_1.looted
      L4_2[A0_2] = true
      L4_2 = L4_1.looted
      L5_2 = tostring
      L6_2 = A0_2
      L5_2 = L5_2(L6_2)
      L4_2[L5_2] = true
      L4_2 = L77_1
      L5_2 = L1_2
      L4_2 = L4_2(L5_2)
      if L4_2 then
        L5_2 = type
        L6_2 = L4_2.lootedPoints
        L5_2 = L5_2(L6_2)
        if "table" == L5_2 then
          L5_2 = L4_2.lootedPoints
          if L5_2 then
            goto lbl_90
          end
        end
        L5_2 = {}
        ::lbl_90::
        L4_2.lootedPoints = L5_2
        L5_2 = L4_2.lootedPoints
        L5_2[A0_2] = true
      end
      L5_2 = L100_1
      L6_2 = L1_2
      L7_2 = A0_2
      L5_2(L6_2, L7_2)
      L5_2 = L4_1.preset
      if L5_2 then
        L5_2 = L4_1.preset
        L5_2 = L5_2.lootPoints
        if L5_2 then
          L5_2 = L4_1.preset
          L5_2 = L5_2.lootPoints
          L5_2 = L5_2[A0_2]
          if L5_2 then
            goto lbl_110
          end
        end
      end
      L5_2 = nil
      ::lbl_110::
      if L5_2 then
        L6_2 = L46_1
        L7_2 = L5_2
        L6_2 = L6_2(L7_2)
        if L6_2 then
          L6_2 = L42_1
          L7_2 = L4_1
          L8_2 = A0_2
          L9_2 = L5_2
          L6_2(L7_2, L8_2, L9_2)
        end
      end
      L6_2 = Notify
      L7_2 = Config
      L7_2 = L7_2.T
      L8_2 = "LootPointAlreadySearched"
      L7_2 = L7_2(L8_2)
      L8_2 = "error"
      L6_2(L7_2, L8_2)
    elseif "busy" == L3_2 then
      L4_2 = Notify
      L5_2 = Config
      L5_2 = L5_2.T
      L6_2 = "LootPointBusy"
      L5_2 = L5_2(L6_2)
      L6_2 = "error"
      L4_2(L5_2, L6_2)
    elseif "inactive" == L3_2 then
      L4_2 = L4_1.activeLootPoints
      if not L4_2 then
        L4_2 = {}
      end
      L4_1.activeLootPoints = L4_2
      L4_2 = L4_1.activeLootPoints
      L4_2[A0_2] = nil
      L4_1.activeLootPointsSet = true
      L4_2 = L100_1
      L5_2 = L1_2
      L6_2 = A0_2
      L4_2(L5_2, L6_2)
      L4_2 = Notify
      L5_2 = Config
      L5_2 = L5_2.T
      L6_2 = "LootPointUnavailable"
      L5_2 = L5_2(L6_2)
      L6_2 = "error"
      L4_2(L5_2, L6_2)
    else
      L4_2 = L126_1
      L4_2()
    end
    return
  end
  L4_2 = L4_1.preset
  if L4_2 then
    L4_2 = L4_1.preset
    L4_2 = L4_2.lootPoints
    if L4_2 then
      L4_2 = L4_1.preset
      L4_2 = L4_2.lootPoints
      L4_2 = L4_2[A0_2]
    end
  end
  if L4_2 then
    L5_2 = L71_1
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_191
    end
  end
  L5_2 = L4_1.busyLootPoints
  L5_2[A0_2] = nil
  L5_2 = L107_1
  L6_2 = L1_2
  L7_2 = A0_2
  L8_2 = false
  L5_2(L6_2, L7_2, L8_2)
  do return end
  ::lbl_191::
  L5_2 = L142_1
  L6_2 = L4_1.location
  L7_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2)
  L6_2 = L141_1
  L7_2 = L5_2
  L6_2, L7_2 = L6_2(L7_2)
  if not L6_2 then
    L8_2 = L4_1.busyLootPoints
    L8_2[A0_2] = nil
    L8_2 = L107_1
    L9_2 = L1_2
    L10_2 = A0_2
    L11_2 = false
    L8_2(L9_2, L10_2, L11_2)
    return
  end
  L8_2 = L139_1
  L9_2 = L4_2
  L8_2 = L8_2(L9_2)
  if not L8_2 then
    L8_2 = L4_1.busyLootPoints
    L8_2[A0_2] = nil
    L8_2 = L107_1
    L9_2 = L1_2
    L10_2 = A0_2
    L11_2 = false
    L8_2(L9_2, L10_2, L11_2)
    return
  end
  L8_2 = L4_2.requiresItem
  if true == L8_2 then
    L8_2 = L137_1
    L9_2 = L4_2
    L8_2 = L8_2(L9_2)
    if not L8_2 then
      L8_2 = L4_1.busyLootPoints
      L8_2[A0_2] = nil
      L8_2 = L107_1
      L9_2 = L1_2
      L10_2 = A0_2
      L11_2 = false
      L8_2(L9_2, L10_2, L11_2)
      return
    end
  end
  L8_2 = L151_1
  L9_2 = L4_1
  L10_2 = A0_2
  L11_2 = "before_loot_start"
  L8_2(L9_2, L10_2, L11_2)
  L8_2 = L38_1
  L9_2 = L4_2
  L10_2 = L4_1.instance
  L8_2 = L8_2(L9_2, L10_2)
  if not L8_2 then
    L9_2 = L4_1.busyLootPoints
    L9_2[A0_2] = nil
    L9_2 = L107_1
    L10_2 = L1_2
    L11_2 = A0_2
    L12_2 = false
    L9_2(L10_2, L11_2, L12_2)
    return
  end
  L9_2 = L100_1
  L10_2 = L1_2
  L11_2 = A0_2
  L9_2(L10_2, L11_2)
  L9_2 = L159_1
  L10_2 = L4_2
  L11_2 = L4_1.instance
  L9_2(L10_2, L11_2)
  L9_2 = false
  L10_2 = nil
  L11_2 = false
  L12_2 = L4_2.minigameCheckbox
  if true == L12_2 then
    L12_2 = L133_1
    L13_2 = L4_2.minigameType
    L12_2 = L12_2(L13_2)
    if L12_2 then
      L12_2 = nil
      L13_2 = L164_1
      L14_2 = L4_1
      L15_2 = L4_2
      L16_2 = A0_2
      L17_2 = L8_2
      L13_2, L14_2 = L13_2(L14_2, L15_2, L16_2, L17_2)
      L9_2 = L14_2
      L12_2 = L13_2
      L11_2 = true
      L13_2 = L135_1
      L14_2 = L12_2
      L13_2 = L13_2(L14_2)
      L10_2 = L13_2
    end
  end
  L12_2 = L136_1
  L13_2 = L4_2.minigameCheckbox
  if true == L13_2 then
    L13_2 = L4_2.minigameType
    if L13_2 then
      goto lbl_297
    end
  end
  L13_2 = "none"
  ::lbl_297::
  L12_2, L13_2 = L12_2(L13_2)
  if L10_2 then
    L14_2 = L10_2
    L14_2()
  end
  if not L12_2 then
    L14_2 = L4_2.requiresItem
    if true == L14_2 and L13_2 then
      L14_2 = L138_1
      L15_2 = L4_2
      L14_2(L15_2)
    end
    L14_2 = L4_1.busyLootPoints
    L14_2[A0_2] = nil
    L14_2 = L107_1
    L15_2 = L1_2
    L16_2 = A0_2
    L17_2 = false
    L14_2(L15_2, L16_2, L17_2)
    L14_2 = L37_1
    L15_2 = L4_1
    L16_2 = A0_2
    L17_2 = L4_2
    L18_2 = true
    L14_2(L15_2, L16_2, L17_2, L18_2)
    L14_2 = L145_1
    L15_2 = L4_1.location
    L16_2 = L4_2
    L14_2(L15_2, L16_2)
    L14_2 = Notify
    L15_2 = Config
    L15_2 = L15_2.T
    L16_2 = "SearchPointFailed"
    L15_2 = L15_2(L16_2)
    L16_2 = "error"
    L14_2(L15_2, L16_2)
    return
  end
  if L9_2 then
    L14_2 = ClearPedTasksImmediately
    L15_2 = PlayerPedId
    L15_2, L16_2, L17_2, L18_2 = L15_2()
    L14_2(L15_2, L16_2, L17_2, L18_2)
    L14_2 = FreezeEntityPosition
    L15_2 = PlayerPedId
    L15_2 = L15_2()
    L16_2 = false
    L14_2(L15_2, L16_2)
  else
    L14_2 = L167_1
    L15_2 = L4_1
    L16_2 = A0_2
    L17_2 = L4_2
    L14_2 = L14_2(L15_2, L16_2, L17_2)
    if not L14_2 then
      L14_2 = SetPedHeadingToFaceVector
      L15_2 = PlayerPedId
      L15_2 = L15_2()
      L16_2 = L8_2
      L14_2(L15_2, L16_2)
      if not L11_2 then
        L14_2 = L132_1
        L15_2 = "Searching "
        L16_2 = string
        L16_2 = L16_2.lower
        L17_2 = L4_2.label
        if not L17_2 then
          L17_2 = "spot"
        end
        L16_2 = L16_2(L17_2)
        L15_2 = L15_2 .. L16_2
        L16_2 = 3500
        L14_2(L15_2, L16_2)
      end
    end
  end
  L14_2 = L144_1
  L15_2 = L146_1
  L16_2 = L4_1.location
  L17_2 = L4_2
  L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2, L17_2)
  L14_2(L15_2, L16_2, L17_2, L18_2)
  L14_2 = L143_1
  L15_2 = L5_2
  L16_2 = L7_2
  L14_2(L15_2, L16_2)
  L14_2 = L46_1
  L15_2 = L4_2
  L14_2 = L14_2(L15_2)
  if L14_2 then
    L14_2 = L42_1
    L15_2 = L4_1
    L16_2 = A0_2
    L17_2 = L4_2
    L14_2(L15_2, L16_2, L17_2)
  end
  L14_2 = L4_1.looted
  L14_2[A0_2] = true
  L14_2 = L4_1.looted
  L15_2 = tostring
  L16_2 = A0_2
  L15_2 = L15_2(L16_2)
  L14_2[L15_2] = true
  L14_2 = L4_1.busyLootPoints
  L14_2[A0_2] = nil
  L14_2 = L77_1
  L15_2 = L4_1.location
  L15_2 = L15_2.id
  L14_2 = L14_2(L15_2)
  if L14_2 then
    L15_2 = type
    L16_2 = L14_2.lootedPoints
    L15_2 = L15_2(L16_2)
    if "table" == L15_2 then
      L15_2 = L14_2.lootedPoints
      if L15_2 then
        goto lbl_420
      end
    end
    L15_2 = {}
    ::lbl_420::
    L14_2.lootedPoints = L15_2
    L15_2 = L14_2.lootedPoints
    L15_2[A0_2] = true
  end
  L15_2 = L100_1
  L16_2 = L4_1.location
  L16_2 = L16_2.id
  L17_2 = A0_2
  L15_2(L16_2, L17_2)
  L15_2 = L107_1
  L16_2 = L1_2
  L17_2 = A0_2
  L18_2 = true
  L15_2(L16_2, L17_2, L18_2)
  L15_2 = Notify
  L16_2 = Config
  L16_2 = L16_2.T
  L17_2 = "Searched"
  L16_2 = L16_2(L17_2)
  L17_2 = "success"
  L15_2(L16_2, L17_2)
end
L29_1 = L198_1
function L198_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = L4_1
  if L1_2 then
    L1_2 = Notify
    L2_2 = Config
    L2_2 = L2_2.T
    L3_2 = "AlreadyInsideHouseRobbery"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = L113_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = L1_2.enabled
    if false ~= L2_2 then
      goto lbl_21
    end
  end
  do return end
  ::lbl_21::
  L2_2 = L77_1
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L3_2 = L31_1
    L4_2 = A0_2
    L3_2(L4_2)
    return
  end
  L3_2 = L118_1
  L4_2 = L1_2.id
  L5_2 = L2_2.shellId
  L6_2 = L2_2.presetId
  L3_2 = L3_2(L4_2, L5_2, L6_2)
  if true ~= L3_2 then
    return
  end
  L4_2 = L141_1
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    return
  end
  L5_2 = L112_1
  L6_2 = L2_2.shellId
  L5_2 = L5_2(L6_2)
  if not L5_2 then
    L6_2 = Notify
    L7_2 = Config
    L7_2 = L7_2.T
    L8_2 = "OpenedHouseUnavailable"
    L7_2 = L7_2(L8_2)
    L8_2 = "error"
    L6_2(L7_2, L8_2)
    L6_2 = L126_1
    L6_2()
    return
  end
  L6_2 = L123_1
  L7_2 = L5_2
  L8_2 = L2_2.presetId
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L72_1
  L8_2 = L6_2
  L7_2 = L7_2(L8_2)
  if not L7_2 then
    L7_2 = Notify
    L8_2 = Config
    L8_2 = L8_2.T
    L9_2 = "OpenedHouseNoLootLayout"
    L8_2 = L8_2(L9_2)
    L9_2 = "error"
    L7_2(L8_2, L9_2)
    L7_2 = L126_1
    L7_2()
    return
  end
  L7_2 = L172_1
  L8_2 = L1_2
  L9_2 = L5_2
  L10_2 = L6_2
  L11_2 = Config
  L11_2 = L11_2.T
  L12_2 = "EnteredOpenedHouse"
  L11_2, L12_2 = L11_2(L12_2)
  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
end
L32_1 = L198_1
function L198_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L0_2 = RequestAnimDict
  L1_2 = "anim@heists@keycard@"
  L0_2(L1_2)
  while true do
    L0_2 = HasAnimDictLoaded
    L1_2 = "anim@heists@keycard@"
    L0_2 = L0_2(L1_2)
    if L0_2 then
      break
    end
    L0_2 = Wait
    L1_2 = 0
    L0_2(L1_2)
  end
  L0_2 = TaskPlayAnim
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = "anim@heists@keycard@"
  L3_2 = "exit"
  L4_2 = 5.0
  L5_2 = 1.0
  L6_2 = -1
  L7_2 = 16
  L8_2 = 0
  L9_2 = 0
  L10_2 = 0
  L11_2 = 0
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L0_2 = Wait
  L1_2 = 400
  L0_2(L1_2)
  L0_2 = ClearPedTasks
  L1_2 = PlayerPedId
  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L1_2()
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
function L199_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L1_2 = Config
  L1_2 = L1_2.DontAllowPoliceToDoRobbery
  if L1_2 then
    L1_2 = PugIsRobberyCreatorPoliceJob
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = Notify
      L2_2 = Config
      L2_2 = L2_2.LangT
      L2_2 = L2_2.PoliceCannotDoRobberies
      L3_2 = "error"
      L1_2(L2_2, L3_2)
      return
    end
  end
  L1_2 = L4_1
  if L1_2 then
    L1_2 = Notify
    L2_2 = Config
    L2_2 = L2_2.T
    L3_2 = "AlreadyInsideHouseRobbery"
    L2_2 = L2_2(L3_2)
    L3_2 = "error"
    L1_2(L2_2, L3_2)
    return
  end
  L1_2 = L7_1
  if L1_2 then
    return
  end
  L1_2 = L113_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L2_2 = L1_2.enabled
    if false ~= L2_2 then
      goto lbl_40
    end
  end
  do return end
  ::lbl_40::
  L2_2 = L118_1
  L3_2 = L1_2.id
  L2_2, L3_2 = L2_2(L3_2)
  if true ~= L2_2 then
    return
  end
  L4_2 = "house_location_"
  L5_2 = L43_1
  L6_2 = L1_2.id
  L5_2 = L5_2(L6_2)
  L4_2 = L4_2 .. L5_2
  L5_2 = IsRobberyOnCooldown
  L6_2 = L4_2
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
  L5_2 = L141_1
  L6_2 = L1_2
  L5_2, L6_2 = L5_2(L6_2)
  if not L5_2 then
    return
  end
  L7_2 = true
  L7_1 = L7_2
  L7_2 = L103_1
  L8_2 = L1_2.id
  L7_2, L8_2, L9_2 = L7_2(L8_2)
  if not L7_2 then
    L10_2 = false
    L7_1 = L10_2
    if "busy" == L8_2 then
      L10_2 = Notify
      L11_2 = Config
      L11_2 = L11_2.T
      L12_2 = "HouseBreakInBusy"
      L11_2 = L11_2(L12_2)
      L12_2 = "error"
      L10_2(L11_2, L12_2)
    elseif "open" == L8_2 then
      L10_2 = L126_1
      L10_2()
      L10_2 = Notify
      L11_2 = Config
      L11_2 = L11_2.T
      L12_2 = "HouseAlreadyOpen"
      L11_2 = L11_2(L12_2)
      L12_2 = "primary"
      L10_2(L11_2, L12_2)
    elseif "xp" == L8_2 then
      L10_2 = Notify
      L11_2 = Config
      L11_2 = L11_2.T
      L12_2 = "NeedXP"
      L13_2 = tonumber
      L14_2 = L9_2
      L13_2 = L13_2(L14_2)
      if not L13_2 then
        L13_2 = 0
      end
      L11_2 = L11_2(L12_2, L13_2)
      L12_2 = "error"
      L10_2(L11_2, L12_2)
    end
    return
  end
  L10_2 = L140_1
  L11_2 = L1_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = L102_1
    L11_2 = L1_2.id
    L10_2(L11_2)
    L10_2 = false
    L7_1 = L10_2
    return
  end
  L10_2 = L137_1
  L11_2 = L1_2
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = L102_1
    L11_2 = L1_2.id
    L10_2(L11_2)
    L10_2 = false
    L7_1 = L10_2
    return
  end
  L10_2 = tonumber
  L11_2 = L1_2.entry
  if L11_2 then
    L11_2 = L1_2.entry
    L11_2 = L11_2.heading
  end
  L10_2 = L10_2(L11_2)
  if not L10_2 then
    L10_2 = GetEntityHeading
    L11_2 = PlayerPedId
    L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L11_2()
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
  end
  L11_2 = SetEntityHeading
  L12_2 = PlayerPedId
  L12_2 = L12_2()
  L13_2 = L10_2
  L11_2(L12_2, L13_2)
  L11_2 = nil
  L12_2 = false
  L13_2 = L133_1
  L14_2 = L1_2.minigameOption
  L13_2 = L13_2(L14_2)
  if L13_2 then
    L12_2 = true
    L13_2 = L135_1
    L14_2 = {}
    L14_2.heading = L10_2
    L14_2.animDict = "veh@break_in@0h@p_m_one@"
    L14_2.animAction = "low_force_entry_ds"
    L14_2.animFlag = 49
    L13_2 = L13_2(L14_2)
    L11_2 = L13_2
  end
  L13_2 = L136_1
  L14_2 = L1_2.minigameOption
  L13_2, L14_2 = L13_2(L14_2)
  if L11_2 then
    L15_2 = L11_2
    L15_2()
  end
  if not L13_2 then
    if L14_2 then
      L15_2 = L138_1
      L16_2 = L1_2
      L15_2(L16_2)
    end
    L15_2 = L102_1
    L16_2 = L1_2.id
    L15_2(L16_2)
    L15_2 = false
    L7_1 = L15_2
    L15_2 = Notify
    L16_2 = Config
    L16_2 = L16_2.T
    L17_2 = "HouseBreakInFailed"
    L16_2 = L16_2(L17_2)
    L17_2 = "error"
    L15_2(L16_2, L17_2)
    L15_2 = CreateThread
    function L16_2()
      local L0_3, L1_3
      L0_3 = Wait
      L1_3 = 200
      L0_3(L1_3)
      L0_3 = ClearPedTasksImmediately
      L1_3 = PlayerPedId
      L1_3 = L1_3()
      L0_3(L1_3)
    end
    L15_2(L16_2)
    return
  end
  if not L12_2 then
    L15_2 = L132_1
    L16_2 = L1_2.progressLabel
    if not L16_2 then
      L16_2 = "Breaking into house"
    end
    L17_2 = L1_2.progressDuration
    L18_2 = {}
    L18_2.heading = L10_2
    L18_2.animDict = "veh@break_in@0h@p_m_one@"
    L18_2.animAction = "low_force_entry_ds"
    L18_2.animFlag = 49
    L15_2(L16_2, L17_2, L18_2)
  end
  L15_2 = L198_1
  L15_2()
  L15_2 = nil
  L16_2 = nil
  if L3_2 then
    L17_2 = L43_1
    L18_2 = L3_2.shellId
    L17_2 = L17_2(L18_2)
    if "" ~= L17_2 then
      L17_2 = L43_1
      L18_2 = L3_2.presetId
      L17_2 = L17_2(L18_2)
      if "" ~= L17_2 then
        L17_2 = L112_1
        L18_2 = L3_2.shellId
        L17_2 = L17_2(L18_2)
        L15_2 = L17_2
        L17_2 = L123_1
        L18_2 = L15_2
        L19_2 = L3_2.presetId
        L17_2 = L17_2(L18_2, L19_2)
        L16_2 = L17_2
    end
  end
  else
    L17_2 = {}
    L18_2 = ipairs
    L19_2 = L1_2.shellIds
    if not L19_2 then
      L19_2 = {}
    end
    L18_2, L19_2, L20_2, L21_2 = L18_2(L19_2)
    for L22_2, L23_2 in L18_2, L19_2, L20_2, L21_2 do
      L24_2 = L112_1
      L25_2 = L23_2
      L24_2 = L24_2(L25_2)
      if L24_2 then
        L25_2 = L43_1
        L26_2 = L24_2.model
        L25_2 = L25_2(L26_2)
        if "" ~= L25_2 then
          L25_2 = #L17_2
          L25_2 = L25_2 + 1
          L17_2[L25_2] = L24_2
        end
      end
    end
    L18_2 = #L17_2
    if 0 == L18_2 then
      L18_2 = L102_1
      L19_2 = L1_2.id
      L18_2(L19_2)
      L18_2 = false
      L7_1 = L18_2
      L18_2 = Notify
      L19_2 = Config
      L19_2 = L19_2.T
      L20_2 = "NoShellLinked"
      L19_2 = L19_2(L20_2)
      L20_2 = "error"
      L18_2(L19_2, L20_2)
      return
    end
    L18_2 = math
    L18_2 = L18_2.random
    L19_2 = 1
    L20_2 = #L17_2
    L18_2 = L18_2(L19_2, L20_2)
    L15_2 = L17_2[L18_2]
    L18_2 = {}
    L19_2 = L1_2.presetSelections
    if L19_2 then
      L19_2 = L1_2.presetSelections
      L20_2 = L15_2.id
      L19_2 = L19_2[L20_2]
      if L19_2 then
        goto lbl_304
      end
    end
    L19_2 = {}
    ::lbl_304::
    if L19_2 then
      L20_2 = #L19_2
      if L20_2 > 0 then
        L20_2 = ipairs
        L21_2 = L19_2
        L20_2, L21_2, L22_2, L23_2 = L20_2(L21_2)
        for L24_2, L25_2 in L20_2, L21_2, L22_2, L23_2 do
          L26_2 = L123_1
          L27_2 = L15_2
          L28_2 = L25_2
          L26_2 = L26_2(L27_2, L28_2)
          L27_2 = L72_1
          L28_2 = L26_2
          L27_2 = L27_2(L28_2)
          if L27_2 then
            L27_2 = #L18_2
            L27_2 = L27_2 + 1
            L18_2[L27_2] = L26_2
          end
        end
    end
    else
      L20_2 = ipairs
      L21_2 = L15_2.presets
      if not L21_2 then
        L21_2 = {}
      end
      L20_2, L21_2, L22_2, L23_2 = L20_2(L21_2)
      for L24_2, L25_2 in L20_2, L21_2, L22_2, L23_2 do
        L26_2 = L72_1
        L27_2 = L25_2
        L26_2 = L26_2(L27_2)
        if L26_2 then
          L26_2 = #L18_2
          L26_2 = L26_2 + 1
          L18_2[L26_2] = L25_2
        end
      end
    end
    L20_2 = #L18_2
    if 0 == L20_2 then
      L20_2 = L102_1
      L21_2 = L1_2.id
      L20_2(L21_2)
      L20_2 = false
      L7_1 = L20_2
      L20_2 = Notify
      L21_2 = Config
      L21_2 = L21_2.T
      L22_2 = "ShellNoLootPreset"
      L21_2 = L21_2(L22_2)
      L22_2 = "error"
      L20_2(L21_2, L22_2)
      return
    end
    L20_2 = math
    L20_2 = L20_2.random
    L21_2 = 1
    L22_2 = #L18_2
    L20_2 = L20_2(L21_2, L22_2)
    L16_2 = L18_2[L20_2]
  end
  if L15_2 then
    L17_2 = L72_1
    L18_2 = L16_2
    L17_2 = L17_2(L18_2)
    if L17_2 then
      goto lbl_394
    end
  end
  L17_2 = L102_1
  L18_2 = L1_2.id
  L17_2(L18_2)
  L17_2 = false
  L7_1 = L17_2
  L17_2 = Notify
  L18_2 = Config
  L18_2 = L18_2.T
  L19_2 = "AssignedHouseLeadUnavailable"
  L18_2 = L18_2(L19_2)
  L19_2 = "error"
  L17_2(L18_2, L19_2)
  L17_2 = L115_1
  L17_2()
  do return end
  ::lbl_394::
  L17_2 = L75_1
  L18_2 = L1_2
  L17_2 = L17_2(L18_2)
  L18_2 = L17_2.sendAlert
  if L18_2 then
    L18_2 = tonumber
    L19_2 = L17_2.alertChance
    L18_2 = L18_2(L19_2)
    if not L18_2 then
      L18_2 = 100
    end
    L19_2 = math
    L19_2 = L19_2.random
    L20_2 = 1
    L21_2 = 100
    L19_2 = L19_2(L20_2, L21_2)
    if L18_2 >= L19_2 then
      L19_2 = AlertPolice
      L20_2 = L17_2
      L19_2(L20_2)
    end
  end
  L18_2 = nil
  L19_2 = tonumber
  L20_2 = L1_2.cooldown
  L19_2 = L19_2(L20_2)
  if L19_2 then
    L19_2 = tonumber
    L20_2 = L1_2.cooldown
    L19_2 = L19_2(L20_2)
    if L19_2 > 0 then
      L19_2 = L104_1
      L20_2 = L1_2.id
      L21_2 = L15_2.id
      L22_2 = L16_2.id
      L23_2 = tonumber
      L24_2 = L1_2.cooldown
      L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L23_2(L24_2)
      L19_2, L20_2, L21_2 = L19_2(L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      if not L19_2 then
        L22_2 = L102_1
        L23_2 = L1_2.id
        L22_2(L23_2)
        L22_2 = false
        L7_1 = L22_2
        L22_2 = Notify
        L23_2 = Config
        L23_2 = L23_2.T
        L24_2 = "HouseOpenFailed"
        L23_2 = L23_2(L24_2)
        L24_2 = "error"
        L22_2(L23_2, L24_2)
        return
      end
      L18_2 = L21_2
      L22_2 = TriggerServerEvent
      L23_2 = "Pug:server:SetRobberiesOnCooldown"
      L24_2 = {}
      L25_2 = L4_2
      L24_2[1] = L25_2
      L25_2 = tonumber
      L26_2 = L1_2.cooldown
      L25_2, L26_2, L27_2, L28_2 = L25_2(L26_2)
      L22_2(L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
  end
  else
    L19_2 = {}
    L20_2 = L43_1
    L21_2 = L1_2.id
    L20_2 = L20_2(L21_2)
    L19_2.locationId = L20_2
    L20_2 = L43_1
    L21_2 = L15_2.id
    L20_2 = L20_2(L21_2)
    L19_2.shellId = L20_2
    L20_2 = L43_1
    L21_2 = L16_2.id
    L20_2 = L20_2(L21_2)
    L19_2.presetId = L20_2
    L20_2 = {}
    L19_2.lootedPoints = L20_2
    L20_2 = L80_1
    L21_2 = L16_2
    L20_2 = L20_2(L21_2)
    L19_2.activeLootPoints = L20_2
    L19_2.activeLootPointsSet = true
    L18_2 = L19_2
    L19_2 = L102_1
    L20_2 = L1_2.id
    L19_2(L20_2)
  end
  L19_2 = false
  L7_1 = L19_2
  L19_2 = L143_1
  L20_2 = L1_2
  L21_2 = L6_2
  L19_2(L20_2, L21_2)
  L19_2 = L172_1
  L20_2 = L1_2
  L21_2 = L15_2
  L22_2 = L16_2
  L23_2 = "You slipped inside the house."
  L24_2 = L18_2
  L19_2(L20_2, L21_2, L22_2, L23_2, L24_2)
end
L31_1 = L199_1
function L199_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L0_2 = pairs
  L1_2 = L2_1
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L34_1
    L7_2 = L4_2
    L6_2(L7_2)
  end
  L0_2 = {}
  L2_1 = L0_2
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
        goto lbl_30
      end
    end
  end
  L0_2 = L131_1
  L0_2()
  do return end
  ::lbl_30::
  L0_2 = L6_1
  if L0_2 then
    L0_2 = false
    L6_1 = L0_2
    L0_2 = HideTextOption
    L0_2()
  end
  L0_2 = ipairs
  L1_2 = L0_1.locations
  if not L1_2 then
    L1_2 = {}
  end
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = L5_2.enabled
    if false ~= L6_2 then
      L6_2 = L5_2.entry
      if L6_2 then
        L6_2 = L5_2.entry
        L6_2 = L6_2.coords
        if L6_2 then
          L6_2 = L74_1
          L7_2 = L5_2.entry
          L6_2 = L6_2(L7_2)
          L7_2 = "houseEntry_"
          L8_2 = L43_1
          L9_2 = L5_2.id
          L8_2 = L8_2(L9_2)
          L7_2 = L7_2 .. L8_2
          L8_2 = L2_1
          L8_2[L7_2] = true
          L8_2 = L78_1
          L9_2 = L5_2.id
          L8_2 = L8_2(L9_2)
          L9_2 = L35_1
          L10_2 = L7_2
          L11_2 = L6_2
          if L8_2 then
            L12_2 = "fa-solid fa-door-open"
            if L12_2 then
              goto lbl_77
            end
          end
          L12_2 = "fa-solid fa-house-crack"
          ::lbl_77::
          L13_2 = L89_1
          L14_2 = L5_2
          L13_2 = L13_2(L14_2)
          function L14_2()
            local L0_3, L1_3
            L0_3 = L78_1
            L1_3 = L5_2.id
            L0_3 = L0_3(L1_3)
            if L0_3 then
              L0_3 = L32_1
              L1_3 = L5_2.id
              L0_3(L1_3)
            else
              L0_3 = L31_1
              L1_3 = L5_2.id
              L0_3(L1_3)
            end
          end
          L9_2(L10_2, L11_2, L12_2, L13_2, L14_2)
        end
      end
    end
  end
  L0_2 = L114_1
  L0_2 = L0_2()
  if L0_2 then
    L2_2 = L25_1
    L1_2 = L2_1
    L1_2[L2_2] = true
    L1_2 = L49_1
    L2_2 = L0_2.coords
    L1_2 = L1_2(L2_2)
    L2_2 = L35_1
    L3_2 = L25_1
    L4_2 = vector3
    L5_2 = L1_2.x
    L6_2 = L1_2.y
    L7_2 = L1_2.z
    L7_2 = L7_2 + 1
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = "fa-solid fa-user-secret"
    L6_2 = L116_1
    L6_2 = L6_2()
    function L7_2()
      local L0_3, L1_3
      L0_3 = L119_1
      L0_3()
    end
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
end
L33_1 = L199_1
L199_1 = RegisterNUICallback
L200_1 = "SaveHouseRobberyData"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerEvent
  L3_2 = "Pug:client:UpdateHouseRobberyData"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = TriggerServerEvent
  L3_2 = "Pug:saveHouseRobberyData"
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L3_2.data = A0_2
  L2_2(L3_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "GetHousePresetFiles"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:GetHousePresetFiles"
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
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "SaveHousePreset"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:SaveHousePreset"
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = {}
      L2_3.success = false
      L2_3.error = "Failed to save house preset."
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
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "LoadHousePreset"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.TriggerCallback
  L3_2 = "Pug:server:LoadHousePreset"
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3 or L2_3
    if not A0_3 then
      L2_3 = {}
      L2_3.success = false
      L2_3.error = "Failed to load house preset."
    end
    L1_3(L2_3)
  end
  L5_2 = A0_2 or L5_2
  if A0_2 then
    L5_2 = A0_2.fileName
  end
  L2_2(L3_2, L4_2, L5_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "PlaceHouseLocationPoint"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "table" == L2_2 then
    L2_2 = A0_2.prompt
    if L2_2 then
      goto lbl_10
    end
  end
  L2_2 = nil
  ::lbl_10::
  L3_2 = A1_2
  L4_2 = L185_1
  L5_2 = L2_2
  L6_2 = A0_2
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  L3_2(L4_2, L5_2, L6_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "BeginHouseShellPlacement"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L195_1
  if A0_2 then
    L3_2 = A0_2.shell
    if L3_2 then
      goto lbl_9
    end
  end
  L3_2 = {}
  ::lbl_9::
  if A0_2 then
    L4_2 = A0_2.preset
    if L4_2 then
      goto lbl_16
    end
  end
  L4_2 = {}
  ::lbl_16::
  L5_2 = A1_2
  L6_2 = A0_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "BeginHouseSecurityPlacement"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L196_1
  if A0_2 then
    L3_2 = A0_2.shell
    if L3_2 then
      goto lbl_9
    end
  end
  L3_2 = {}
  ::lbl_9::
  if A0_2 then
    L4_2 = A0_2.preset
    if L4_2 then
      goto lbl_16
    end
  end
  L4_2 = {}
  ::lbl_16::
  L5_2 = A1_2
  L6_2 = A0_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "BeginHouseHomeOwnerPlacement"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L197_1
  if A0_2 then
    L3_2 = A0_2.shell
    if L3_2 then
      goto lbl_9
    end
  end
  L3_2 = {}
  ::lbl_9::
  if A0_2 then
    L4_2 = A0_2.preset
    if L4_2 then
      goto lbl_16
    end
  end
  L4_2 = {}
  ::lbl_16::
  L5_2 = A1_2
  L6_2 = A0_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "FocusHousePointPreview"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L178_1
  if A0_2 then
    L3_2 = A0_2.shell
    if L3_2 then
      goto lbl_9
    end
  end
  L3_2 = {}
  ::lbl_9::
  if A0_2 then
    L4_2 = A0_2.preset
    if L4_2 then
      goto lbl_16
    end
  end
  L4_2 = {}
  ::lbl_16::
  if A0_2 then
    L5_2 = A0_2.pointIndex
    if L5_2 then
      goto lbl_22
    end
  end
  L5_2 = 1
  ::lbl_22::
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2)
  L4_2 = A1_2
  L5_2 = {}
  L6_2 = true == L2_2
  L5_2.success = L6_2
  L5_2.error = L3_2
  L4_2(L5_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "FocusHouseSpecialPreview"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = L179_1
  if A0_2 then
    L3_2 = A0_2.shell
    if L3_2 then
      goto lbl_9
    end
  end
  L3_2 = {}
  ::lbl_9::
  if A0_2 then
    L4_2 = A0_2.preset
    if L4_2 then
      goto lbl_16
    end
  end
  L4_2 = {}
  ::lbl_16::
  if A0_2 then
    L5_2 = A0_2.coords
    if L5_2 then
      goto lbl_23
    end
  end
  L5_2 = {}
  ::lbl_23::
  if A0_2 then
    L6_2 = A0_2.heading
    if L6_2 then
      goto lbl_29
    end
  end
  L6_2 = 0
  ::lbl_29::
  L7_2 = A0_2 or L7_2
  if A0_2 then
    L7_2 = A0_2.isPlaced
    L7_2 = true == L7_2
  end
  L2_2, L3_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  L4_2 = A1_2
  L5_2 = {}
  L6_2 = true == L2_2
  L5_2.success = L6_2
  L5_2.error = L3_2
  L4_2(L5_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNUICallback
L200_1 = "ExitHousePointPreview"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = CleanupHouseEditorPreview
  L3_2 = true
  L2_2(L3_2)
  L2_2 = A1_2
  L3_2 = {}
  L3_2.success = true
  L2_2(L3_2)
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNetEvent
L200_1 = "Pug:client:UpdateHouseRobberyData"
function L201_1(A0_2)
  local L1_2, L2_2
  L1_2 = L48_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L0_1 = L1_2
  L1_2 = L122_1
  L1_2()
  L1_2 = L33_1
  L1_2()
  L1_2 = L115_1
  L1_2()
  L1_2 = L126_1
  L1_2()
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNetEvent
L200_1 = "Pug:client:UpdateOpenHouseRobberyStates"
function L201_1(A0_2)
  local L1_2, L2_2
  L1_2 = L76_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L1_1 = L1_2
  L1_2 = L111_1
  L1_2()
  L1_2 = L33_1
  L1_2()
end
L199_1(L200_1, L201_1)
L199_1 = RegisterNetEvent
L200_1 = "Pug:client:ToggleHousePropDebug"
function L201_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L3_2 = true == A0_2
  L11_1.enabled = L3_2
  L3_2 = tonumber
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L11_1.pointIndex = L3_2
  L3_2 = tonumber
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = 8000
  end
  L11_1.durationMs = L3_2
  L3_2 = L11_1.enabled
  if L3_2 then
    L3_2 = L11_1.pointIndex
    if L3_2 then
      L3_2 = tostring
      L4_2 = L11_1.pointIndex
      L3_2 = L3_2(L4_2)
      if L3_2 then
        goto lbl_29
      end
    end
    L3_2 = "all"
    ::lbl_29::
    L4_2 = Notify
    L5_2 = Config
    L5_2 = L5_2.T
    L6_2 = "HousePropDebugEnabled"
    L7_2 = L3_2
    L5_2 = L5_2(L6_2, L7_2)
    L6_2 = "success"
    L4_2(L5_2, L6_2)
    L4_2 = L53_1
    L5_2 = "enabled"
    L6_2 = "point"
    L7_2 = L3_2
    L8_2 = "durationMs"
    L9_2 = L11_1.durationMs
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = L4_1
    if L4_2 then
      L4_2 = L11_1.pointIndex
      if L4_2 then
        L4_2 = L151_1
        L5_2 = L4_1
        L6_2 = L11_1.pointIndex
        L7_2 = "manual_enable"
        L4_2(L5_2, L6_2, L7_2)
        L4_2 = L152_1
        L5_2 = L4_1
        L6_2 = L11_1.pointIndex
        L7_2 = "manual_enable"
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  else
    L3_2 = Notify
    L4_2 = Config
    L4_2 = L4_2.T
    L5_2 = "HousePropDebugDisabled"
    L4_2 = L4_2(L5_2)
    L5_2 = "primary"
    L3_2(L4_2, L5_2)
    L3_2 = print
    L4_2 = "^3PUG HOUSE DEBUG:^0 disabled"
    L3_2(L4_2)
  end
end
L199_1(L200_1, L201_1)
L199_1 = RegisterCommand
L200_1 = "pughousedebug"
function L201_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = tostring
  L4_2 = A1_2[1]
  if not L4_2 then
    L4_2 = ""
  end
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  if "off" == L2_2 or "0" == L2_2 or "disable" == L2_2 then
    L3_2 = TriggerEvent
    L4_2 = "Pug:client:ToggleHousePropDebug"
    L5_2 = false
    L3_2(L4_2, L5_2)
    return
  end
  if "dump" == L2_2 then
    L3_2 = tonumber
    L4_2 = A1_2[2]
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      L3_2 = L11_1.pointIndex
    end
    L4_2 = L4_1
    if L4_2 and L3_2 then
      L4_2 = L151_1
      L5_2 = L4_1
      L6_2 = L3_2
      L7_2 = "manual_dump"
      L4_2(L5_2, L6_2, L7_2)
    else
      L4_2 = Notify
      L5_2 = Config
      L5_2 = L5_2.T
      L6_2 = "HouseDebugMissingSessionOrPoint"
      L5_2 = L5_2(L6_2)
      L6_2 = "error"
      L4_2(L5_2, L6_2)
    end
    return
  end
  L3_2 = tonumber
  L4_2 = A1_2[1]
  L3_2 = L3_2(L4_2)
  L4_2 = tonumber
  L5_2 = A1_2[2]
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = 8000
  end
  L5_2 = TriggerEvent
  L6_2 = "Pug:client:ToggleHousePropDebug"
  L7_2 = true
  L8_2 = L3_2
  L9_2 = L4_2
  L5_2(L6_2, L7_2, L8_2, L9_2)
end
L202_1 = false
L199_1(L200_1, L201_1, L202_1)
L199_1 = AddEventHandler
L200_1 = "onResourceStop"
function L201_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = GetCurrentResourceName
  L1_2 = L1_2()
  if A0_2 ~= L1_2 then
    return
  end
  L1_2 = pairs
  L2_2 = L2_1
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = L34_1
    L8_2 = L5_2
    L7_2(L8_2)
  end
  L1_2 = L168_1
  L1_2()
  L1_2 = L120_1
  L1_2()
  L1_2 = L28_1
  L2_2 = false
  L1_2(L2_2)
  L1_2 = CleanupHouseEditorPreview
  L2_2 = false
  L1_2(L2_2)
  L1_2 = false
  L6_1 = L1_2
  L1_2 = HideTextOption
  L1_2()
end
L199_1(L200_1, L201_1)
