local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
function L1_1()
  local L0_2, L1_2
  L0_2 = MySQL
  L0_2 = L0_2.query
  L0_2 = L0_2.await
  L1_2 = "SELECT settings FROM pug_atm WHERE id = 1 LIMIT 1"
  L0_2 = L0_2(L1_2)
  if L0_2 then
    L1_2 = L0_2[1]
    if L1_2 then
      L1_2 = L0_2[1]
      L1_2 = L1_2.settings
      return L1_2
  end
  else
    L1_2 = "[]"
    return L1_2
  end
end
getAtmRobberySettings = L1_1
L1_1 = RegisterNetEvent
L2_1 = "Pug:saveAtmRobberyData"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = source
  L2_2 = MySQL
  L2_2 = L2_2.query
  L3_2 = "SELECT settings FROM pug_atm WHERE id = 1"
  L4_2 = {}
  function L5_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
    L1_3 = {}
    if A0_3 then
      L2_3 = #A0_3
      if L2_3 > 0 then
        L2_3 = json
        L2_3 = L2_3.decode
        L3_3 = A0_3[1]
        L3_3 = L3_3.settings
        L2_3 = L2_3(L3_3)
        L1_3 = L2_3 or L1_3
        if not L2_3 then
          L2_3 = {}
          L1_3 = L2_3
        end
      end
    end
    L2_3 = pairs
    L3_3 = A0_2
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
    for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
      L1_3[L6_3] = L7_3
    end
    L2_3 = json
    L2_3 = L2_3.encode
    L3_3 = L1_3
    L2_3 = L2_3(L3_3)
    L3_3 = MySQL
    L3_3 = L3_3.query
    L4_3 = "INSERT INTO pug_atm (id, settings) VALUES (1, @settings) ON DUPLICATE KEY UPDATE settings = @settings"
    L5_3 = {}
    L5_3["@settings"] = L2_3
    function L6_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4
      if A0_4 then
        L1_4 = AllRobberysCooldDownTable
        L1_4 = L1_4.atmrobbery
        if L1_4 then
          L1_4 = AllRobberysCooldDownTable
          L1_4.atmrobbery = nil
        end
        L1_4 = TriggerClientEvent
        L2_4 = "Pug:client:UpdateAtmRobberyData"
        L3_4 = -1
        L4_4 = L2_3
        L1_4(L2_4, L3_4, L4_4)
        L1_4 = Wait
        L2_4 = 50
        L1_4(L2_4)
        L1_4 = TriggerClientEvent
        L2_4 = "Pug:client:ShowHeistNotify"
        L3_4 = L1_2
        L4_4 = Config
        L4_4 = L4_4.LangT
        L4_4 = L4_4.AtmRobberyDataSaved
        L1_4(L2_4, L3_4, L4_4)
      else
        L1_4 = TriggerClientEvent
        L2_4 = "Pug:client:ShowHeistNotify"
        L3_4 = L1_2
        L4_4 = Config
        L4_4 = L4_4.LangT
        L4_4 = L4_4.ErrorSavingAtmRobberyData
        L1_4(L2_4, L3_4, L4_4)
      end
    end
    L3_3(L4_3, L5_3, L6_3)
  end
  L2_2(L3_2, L4_2, L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterNetEvent
L2_1 = "Pug:server:DeleteAtmAtCoords"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = TriggerClientEvent
  L3_2 = "Pug:client:DeleteAtmAtCoords"
  L4_2 = -1
  L5_2 = A0_2
  L6_2 = A1_2
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L1_1(L2_1, L3_1)
