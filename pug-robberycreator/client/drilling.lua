local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = RequestScaleformMovie
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  while true do
    L2_2 = HasScaleformMovieLoaded
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  return L1_2
end
L0_1.LoadMovie = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = RequestScaleformMovieInteractive
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  while true do
    L2_2 = HasScaleformMovieLoaded
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      break
    end
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
  end
  return L1_2
end
L0_1.LoadInteractive = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = SetScaleformMovieAsNoLongerNeeded
  L2_2 = A0_2
  L1_2(L2_2)
end
L0_1.UnloadMovie = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = 0
  L3_2 = A1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = HasThisAdditionalTextLoaded
    L7_2 = A0_2
    L8_2 = L5_2
    L6_2 = L6_2(L7_2, L8_2)
    if not L6_2 then
      L6_2 = ClearAdditionalText
      L7_2 = L5_2
      L8_2 = true
      L6_2(L7_2, L8_2)
      L6_2 = RequestAdditionalText
      L7_2 = A0_2
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
      while true do
        L6_2 = HasThisAdditionalTextLoaded
        L7_2 = A0_2
        L8_2 = L5_2
        L6_2 = L6_2(L7_2, L8_2)
        if L6_2 then
          break
        end
        L6_2 = Wait
        L7_2 = 0
        L6_2(L7_2)
      end
    end
  end
end
L0_1.LoadAdditionalText = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = PushScaleformMovieFunction
  L3_2 = A0_2
  L4_2 = "SET_LABELS"
  L2_2(L3_2, L4_2)
  L2_2 = 1
  L3_2 = #A1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = A1_2[L5_2]
    L7_2 = BeginTextCommandScaleformString
    L8_2 = L6_2
    L7_2(L8_2)
    L7_2 = EndTextCommandScaleformString
    L7_2()
  end
  L2_2 = PopScaleformMovieFunctionVoid
  L2_2()
end
L0_1.SetLabels = L1_1
function L1_1(A0_2, A1_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = PushScaleformMovieFunction
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = pairs
  L3_2 = {}
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = ...
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L3_2[5] = L8_2
  L3_2[6] = L9_2
  L3_2[7] = L10_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L8_2 = L0_1.TrueType
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if "string" == L8_2 then
      L9_2 = _ENV
      L10_2 = "PushScaleformMovieFunctionParameterString"
      L9_2 = L9_2[L10_2]
      L10_2 = L7_2
      L9_2(L10_2)
    elseif "boolean" == L8_2 then
      L9_2 = PushScaleformMovieFunctionParameterBool
      L10_2 = L7_2
      L9_2(L10_2)
    elseif "int" == L8_2 then
      L9_2 = PushScaleformMovieFunctionParameterInt
      L10_2 = L7_2
      L9_2(L10_2)
    elseif "float" == L8_2 then
      L9_2 = PushScaleformMovieFunctionParameterFloat
      L10_2 = L7_2
      L9_2(L10_2)
    end
  end
  L2_2 = PopScaleformMovieFunctionVoid
  L2_2()
end
L0_1.PopMulti = L1_1
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = PushScaleformMovieFunction
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
  L3_2 = PushScaleformMovieFunctionParameterFloat
  L4_2 = A2_2
  L3_2(L4_2)
  L3_2 = PopScaleformMovieFunctionVoid
  L3_2()
end
L0_1.PopFloat = L1_1
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = PushScaleformMovieFunction
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
  L3_2 = PushScaleformMovieFunctionParameterInt
  L4_2 = A2_2
  L3_2(L4_2)
  L3_2 = PopScaleformMovieFunctionVoid
  L3_2()
end
L0_1.PopInt = L1_1
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = PushScaleformMovieFunction
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
  L3_2 = PushScaleformMovieFunctionParameterBool
  L4_2 = A2_2
  L3_2(L4_2)
  L3_2 = PopScaleformMovieFunctionVoid
  L3_2()
end
L0_1.PopBool = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = PushScaleformMovieFunction
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = PopScaleformMovieFunction
  return L2_2()
end
L0_1.PopRet = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = PushScaleformMovieFunction
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
  L2_2 = PopScaleformMovieFunctionVoid
  L2_2()
end
L0_1.PopVoid = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetScaleformMovieFunctionReturnBool
  L2_2 = A0_2
  return L1_2(L2_2)
end
L0_1.RetBool = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = GetScaleformMovieFunctionReturnInt
  L2_2 = A0_2
  return L1_2(L2_2)
end
L0_1.RetInt = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if "number" ~= L1_2 then
    L1_2 = type
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  L1_2 = tostring
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = string
  L2_2 = L2_2.find
  L3_2 = L1_2
  L4_2 = "."
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = "float"
    return L2_2
  else
    L2_2 = "int"
    return L2_2
  end
end
L0_1.TrueType = L1_1
L1_1 = {}
Drilling = L1_1
L1_1 = Drilling
L2_1 = {}
L3_1 = 30
L4_1 = 31
L5_1 = 32
L6_1 = 33
L7_1 = 34
L8_1 = 35
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L1_1.DisabledControls = L2_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = Drilling
  L2_2 = L2_2.Active
  if not L2_2 then
    L2_2 = Drilling
    L2_2.Active = true
    L2_2 = Drilling
    L2_2.Style = A1_2
    L2_2 = Drilling
    L2_2 = L2_2.Init
    L2_2()
    L2_2 = Drilling
    L2_2 = L2_2.Update
    L3_2 = A0_2
    L2_2(L3_2)
  end
end
StartDrilling = L1_1
L1_1 = Drilling
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = Drilling
  L0_2 = L0_2.Scaleform
  if L0_2 then
    L0_2 = L0_1.UnloadMovie
    L1_2 = Drilling
    L1_2 = L1_2.Scaleform
    L0_2(L1_2)
  end
  L0_2 = "VAULT_DRILL"
  L1_2 = Drilling
  L1_2 = L1_2.Style
  if "Laser" == L1_2 then
    L0_2 = "VAULT_LASER"
  end
  L1_2 = Drilling
  L2_2 = L0_1.LoadMovie
  L3_2 = L0_2
  L2_2 = L2_2(L3_2)
  L1_2.Scaleform = L2_2
  L1_2 = ""
  L2_2 = Drilling
  L2_2 = L2_2.Style
  if "Laser" == L2_2 then
    L1_2 = "SET_LASER_WIDTH"
  else
    L1_2 = "SET_SPEED"
  end
  L2_2 = Drilling
  L2_2.DrillSpeed = 0.0
  L2_2 = Drilling
  L2_2.DrillPos = 0.0
  L2_2 = Drilling
  L2_2.DrillTemp = 0.0
  L2_2 = Drilling
  L2_2.HoleDepth = 0.0
  L2_2 = L0_1.PopVoid
  L3_2 = Drilling
  L3_2 = L3_2.Scaleform
  L4_2 = "REVEAL"
  L2_2(L3_2, L4_2)
  L2_2 = L0_1.PopFloat
  L3_2 = Drilling
  L3_2 = L3_2.Scaleform
  L4_2 = L1_2
  L5_2 = 0.0
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L0_1.PopFloat
  L3_2 = Drilling
  L3_2 = L3_2.Scaleform
  L4_2 = "SET_DRILL_POSITION"
  L5_2 = 0.0
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L0_1.PopFloat
  L3_2 = Drilling
  L3_2 = L3_2.Scaleform
  L4_2 = "SET_TEMPERATURE"
  L5_2 = 0.0
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L0_1.PopFloat
  L3_2 = Drilling
  L3_2 = L3_2.Scaleform
  L4_2 = "SET_HOLE_DEPTH"
  L5_2 = 0.0
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L0_1.PopInt
  L3_2 = Drilling
  L3_2 = L3_2.Scaleform
  L4_2 = "SET_NUM_DISCS"
  L5_2 = 6
  L2_2(L3_2, L4_2, L5_2)
end
L1_1.Init = L2_1
L1_1 = Drilling
function L2_1(A0_2)
  local L1_2, L2_2
  while true do
    L1_2 = Drilling
    L1_2 = L1_2.Active
    if not L1_2 then
      break
    end
    L1_2 = Drilling
    L1_2 = L1_2.Draw
    L1_2()
    L1_2 = Drilling
    L1_2 = L1_2.DisableControls
    L1_2()
    L1_2 = Drilling
    L1_2 = L1_2.HandleControls
    L1_2()
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
  L1_2 = A0_2
  L2_2 = Drilling
  L2_2 = L2_2.Result
  L1_2(L2_2)
end
L1_1.Update = L2_1
L1_1 = Drilling
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L0_2 = DrawScaleformMovieFullscreen
  L1_2 = Drilling
  L1_2 = L1_2.Scaleform
  L2_2 = 255
  L3_2 = 255
  L4_2 = 255
  L5_2 = 255
  L6_2 = 255
  L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2)
end
L1_1.Draw = L2_1
L1_1 = Drilling
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L0_2 = Drilling
  L0_2 = L0_2.DrillPos
  L1_2 = IsControlJustPressed
  L2_2 = 0
  L3_2 = 172
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = Drilling
    L2_2 = math
    L2_2 = L2_2.min
    L3_2 = 1.0
    L4_2 = Drilling
    L4_2 = L4_2.DrillPos
    L4_2 = L4_2 + 0.01
    L2_2 = L2_2(L3_2, L4_2)
    L1_2.DrillPos = L2_2
    L1_2 = L0_1.PopVoid
    L2_2 = Drilling
    L2_2 = L2_2.Scaleform
    L3_2 = "burstOutSparks"
    L1_2(L2_2, L3_2)
  else
    L1_2 = IsControlPressed
    L2_2 = 0
    L3_2 = 172
    L1_2 = L1_2(L2_2, L3_2)
    if L1_2 then
      L1_2 = Drilling
      L2_2 = math
      L2_2 = L2_2.min
      L3_2 = 1.0
      L4_2 = Drilling
      L4_2 = L4_2.DrillPos
      L5_2 = GetFrameTime
      L5_2 = L5_2()
      L5_2 = 0.1 * L5_2
      L6_2 = math
      L6_2 = L6_2.max
      L7_2 = 0.1
      L8_2 = Drilling
      L8_2 = L8_2.DrillTemp
      L6_2 = L6_2(L7_2, L8_2)
      L6_2 = L6_2 * 10
      L5_2 = L5_2 / L6_2
      L4_2 = L4_2 + L5_2
      L2_2 = L2_2(L3_2, L4_2)
      L1_2.DrillPos = L2_2
    else
      L1_2 = IsControlJustPressed
      L2_2 = 0
      L3_2 = 173
      L1_2 = L1_2(L2_2, L3_2)
      if L1_2 then
        L1_2 = Drilling
        L2_2 = math
        L2_2 = L2_2.max
        L3_2 = 0.0
        L4_2 = Drilling
        L4_2 = L4_2.DrillPos
        L4_2 = L4_2 - 0.01
        L2_2 = L2_2(L3_2, L4_2)
        L1_2.DrillPos = L2_2
      else
        L1_2 = IsControlPressed
        L2_2 = 0
        L3_2 = 173
        L1_2 = L1_2(L2_2, L3_2)
        if L1_2 then
          L1_2 = Drilling
          L2_2 = math
          L2_2 = L2_2.max
          L3_2 = 0.0
          L4_2 = Drilling
          L4_2 = L4_2.DrillPos
          L5_2 = GetFrameTime
          L5_2 = L5_2()
          L5_2 = 0.1 * L5_2
          L4_2 = L4_2 - L5_2
          L2_2 = L2_2(L3_2, L4_2)
          L1_2.DrillPos = L2_2
        end
      end
    end
  end
  L1_2 = Drilling
  L1_2 = L1_2.DrillSpeed
  L2_2 = IsControlJustPressed
  L3_2 = 0
  L4_2 = 175
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = Drilling
    L3_2 = math
    L3_2 = L3_2.min
    L4_2 = 1.0
    L5_2 = Drilling
    L5_2 = L5_2.DrillSpeed
    L5_2 = L5_2 + 0.05
    L3_2 = L3_2(L4_2, L5_2)
    L2_2.DrillSpeed = L3_2
  else
    L2_2 = IsControlPressed
    L3_2 = 0
    L4_2 = 175
    L2_2 = L2_2(L3_2, L4_2)
    if L2_2 then
      L2_2 = Drilling
      L3_2 = math
      L3_2 = L3_2.min
      L4_2 = 1.0
      L5_2 = Drilling
      L5_2 = L5_2.DrillSpeed
      L6_2 = GetFrameTime
      L6_2 = L6_2()
      L6_2 = 0.5 * L6_2
      L5_2 = L5_2 + L6_2
      L3_2 = L3_2(L4_2, L5_2)
      L2_2.DrillSpeed = L3_2
    else
      L2_2 = IsControlJustPressed
      L3_2 = 0
      L4_2 = 174
      L2_2 = L2_2(L3_2, L4_2)
      if L2_2 then
        L2_2 = Drilling
        L3_2 = math
        L3_2 = L3_2.max
        L4_2 = 0.0
        L5_2 = Drilling
        L5_2 = L5_2.DrillSpeed
        L5_2 = L5_2 - 0.05
        L3_2 = L3_2(L4_2, L5_2)
        L2_2.DrillSpeed = L3_2
      else
        L2_2 = IsControlPressed
        L3_2 = 0
        L4_2 = 174
        L2_2 = L2_2(L3_2, L4_2)
        if L2_2 then
          L2_2 = Drilling
          L3_2 = math
          L3_2 = L3_2.max
          L4_2 = 0.0
          L5_2 = Drilling
          L5_2 = L5_2.DrillSpeed
          L6_2 = GetFrameTime
          L6_2 = L6_2()
          L6_2 = 0.5 * L6_2
          L5_2 = L5_2 - L6_2
          L3_2 = L3_2(L4_2, L5_2)
          L2_2.DrillSpeed = L3_2
        end
      end
    end
  end
  L2_2 = Drilling
  L2_2 = L2_2.DrillTemp
  L3_2 = Drilling
  L3_2 = L3_2.DrillPos
  if L0_2 < L3_2 then
    L3_2 = Drilling
    L3_2 = L3_2.DrillSpeed
    L4_2 = 0.4
    if L3_2 > L4_2 then
      L3_2 = Drilling
      L4_2 = math
      L4_2 = L4_2.min
      L5_2 = 1.0
      L6_2 = Drilling
      L6_2 = L6_2.DrillTemp
      L7_2 = GetFrameTime
      L7_2 = L7_2()
      L7_2 = 0.05 * L7_2
      L8_2 = Drilling
      L8_2 = L8_2.DrillSpeed
      L8_2 = L8_2 * 10
      L7_2 = L7_2 * L8_2
      L6_2 = L6_2 + L7_2
      L4_2 = L4_2(L5_2, L6_2)
      L3_2.DrillTemp = L4_2
      L3_2 = L0_1.PopFloat
      L4_2 = Drilling
      L4_2 = L4_2.Scaleform
      L5_2 = "SET_DRILL_POSITION"
      L6_2 = Drilling
      L6_2 = L6_2.DrillPos
      L3_2(L4_2, L5_2, L6_2)
    else
      L3_2 = Drilling
      L3_2 = L3_2.DrillPos
      L4_2 = 0.1
      if not (L3_2 < L4_2) then
        L3_2 = Drilling
        L3_2 = L3_2.DrillPos
        L4_2 = Drilling
        L4_2 = L4_2.HoleDepth
        if not (L3_2 < L4_2) then
          goto lbl_228
        end
      end
      L3_2 = L0_1.PopFloat
      L4_2 = Drilling
      L4_2 = L4_2.Scaleform
      L5_2 = "SET_DRILL_POSITION"
      L6_2 = Drilling
      L6_2 = L6_2.DrillPos
      L3_2(L4_2, L5_2, L6_2)
      goto lbl_290
      ::lbl_228::
      L3_2 = Drilling
      L3_2.DrillPos = L0_2
      L3_2 = Drilling
      L4_2 = math
      L4_2 = L4_2.min
      L5_2 = 1.0
      L6_2 = Drilling
      L6_2 = L6_2.DrillTemp
      L7_2 = GetFrameTime
      L7_2 = L7_2()
      L7_2 = 0.01 * L7_2
      L6_2 = L6_2 + L7_2
      L4_2 = L4_2(L5_2, L6_2)
      L3_2.DrillTemp = L4_2
    end
  else
    L3_2 = Drilling
    L3_2 = L3_2.DrillPos
    L4_2 = Drilling
    L4_2 = L4_2.HoleDepth
    if L3_2 < L4_2 then
      L3_2 = Drilling
      L4_2 = math
      L4_2 = L4_2.max
      L5_2 = 0.0
      L6_2 = Drilling
      L6_2 = L6_2.DrillTemp
      L7_2 = GetFrameTime
      L7_2 = L7_2()
      L7_2 = 0.05 * L7_2
      L8_2 = math
      L8_2 = L8_2.max
      L9_2 = 0.005
      L10_2 = Drilling
      L10_2 = L10_2.DrillSpeed
      L10_2 = L10_2 * 10
      L10_2 = L10_2 / 2
      L8_2 = L8_2(L9_2, L10_2)
      L7_2 = L7_2 * L8_2
      L6_2 = L6_2 - L7_2
      L4_2 = L4_2(L5_2, L6_2)
      L3_2.DrillTemp = L4_2
    end
    L3_2 = Drilling
    L3_2 = L3_2.DrillPos
    L4_2 = Drilling
    L4_2 = L4_2.HoleDepth
    if L3_2 ~= L4_2 then
      L3_2 = L0_1.PopFloat
      L4_2 = Drilling
      L4_2 = L4_2.Scaleform
      L5_2 = "SET_DRILL_POSITION"
      L6_2 = Drilling
      L6_2 = L6_2.DrillPos
      L3_2(L4_2, L5_2, L6_2)
    end
  end
  ::lbl_290::
  L3_2 = Drilling
  L3_2 = L3_2.DrillSpeed
  if L1_2 ~= L3_2 then
    L3_2 = L0_1.PopFloat
    L4_2 = Drilling
    L4_2 = L4_2.Scaleform
    L5_2 = extra
    L6_2 = Drilling
    L6_2 = L6_2.DrillSpeed
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = Drilling
  L3_2 = L3_2.DrillTemp
  if L2_2 ~= L3_2 then
    L3_2 = L0_1.PopFloat
    L4_2 = Drilling
    L4_2 = L4_2.Scaleform
    L5_2 = "SET_TEMPERATURE"
    L6_2 = Drilling
    L6_2 = L6_2.DrillTemp
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = Drilling
  L3_2 = L3_2.DrillTemp
  if L3_2 >= 1.0 then
    L3_2 = Drilling
    L3_2.Result = false
    L3_2 = Drilling
    L3_2.Active = false
    L3_2 = L0_1.PopVoid
    L4_2 = Drilling
    L4_2 = L4_2.Scaleform
    L5_2 = "RESET"
    L3_2(L4_2, L5_2)
  else
    L3_2 = Drilling
    L3_2 = L3_2.DrillPos
    if L3_2 >= 1.0 then
      L3_2 = Drilling
      L3_2.Result = true
      L3_2 = Drilling
      L3_2.Active = false
      L3_2 = L0_1.PopVoid
      L4_2 = Drilling
      L4_2 = L4_2.Scaleform
      L5_2 = "RESET"
      L3_2(L4_2, L5_2)
    end
  end
  L3_2 = Drilling
  L4_2 = Drilling
  L4_2 = L4_2.DrillPos
  L5_2 = Drilling
  L5_2 = L5_2.HoleDepth
  if L4_2 > L5_2 then
    L4_2 = Drilling
    L4_2 = L4_2.DrillPos
    if L4_2 then
      goto lbl_352
    end
  end
  L4_2 = Drilling
  L4_2 = L4_2.HoleDepth
  ::lbl_352::
  L3_2.HoleDepth = L4_2
end
L1_1.HandleControls = L2_1
L1_1 = Drilling
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = ipairs
  L1_2 = Drilling
  L1_2 = L1_2.DisabledControls
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = DisableControlAction
    L7_2 = 0
    L8_2 = L5_2
    L9_2 = true
    L6_2(L7_2, L8_2, L9_2)
  end
end
L1_1.DisableControls = L2_1
L1_1 = Drilling
function L2_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L0_2 = ipairs
  L1_2 = Drilling
  L1_2 = L1_2.DisabledControls
  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)
  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do
    L6_2 = DisableControlAction
    L7_2 = 0
    L8_2 = L5_2
    L9_2 = true
    L6_2(L7_2, L8_2, L9_2)
  end
end
L1_1.EnableControls = L2_1
