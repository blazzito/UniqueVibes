local NPCEntities = {}
local BillsNPCActive = false

function CreateNPCsBills()
    BillsNPCActive = true
    local currentActive = BillsNPCActive

    for _, npcCoord in pairs(BillsNPCPositions) do
        Citizen.CreateThread(function()
            -- Si ya nos limpiaron antes de que cargue el modelo, salimos
            if not BillsNPCActive then return end

            RequestModel(GetHashKey("s_m_y_cop_01"))

            while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
                if not BillsNPCActive then return end
                Wait(1)
            end

            if not BillsNPCActive then return end

            local npc = CreatePed(4, GetHashKey("s_m_y_cop_01"), npcCoord.x, npcCoord.y, npcCoord.z - 1, npcCoord.w, false, true)
            NPCEntities[#NPCEntities + 1] = npc
            SetEntityHeading(npc, npcCoord.w)
            FreezeEntityPosition(npc, true)
            SetEntityInvincible(npc, true)
            SetBlockingOfNonTemporaryEvents(npc, true)
            TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 0, true)

            local notify = false

            while BillsNPCActive do
                local wait = 1000

                if #(GetEntityCoords(PlayerPedId()) - npcCoord.xyz) < 2.5 then
                    wait = 5

                    if Config.CustomNotify then
                        ShowHelpNotification("E", "Check your bills")
                        notify = true
                    else
                        if Config.Framework == "qbcore" then
                            if not notify then
                                exports['qb-core']:DrawText("[E] Check your bills", 'left')
                                notify = true
                            end
                        elseif Config.Framework == "esx" then
                            Framework.ShowHelpNotification("~INPUT_PICKUP~ Check your bills", true)
                        end
                    end

                    if IsControlJustPressed(0, 38) then
                        ShowBills()
                    end
                elseif notify then
                    HideHelpNotification()
                    notify = false
                end

                Citizen.Wait(wait)
            end

            -- Salimos del loop: aseguramos que el ped se elimine si aún existe
            if DoesEntityExist(npc) then
                DeleteEntity(npc)
            end
        end)
    end
end

function ClearNPCsBills()
    BillsNPCActive = false
    for _, npc in pairs(NPCEntities) do
        if DoesEntityExist(npc) then
            DeleteEntity(npc)
        end
    end
    NPCEntities = {}
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    ClearNPCsBills()
end)

function ShowBills()
    FW_TriggerCallback("origen_police:server:GetBills", function(bills)
        local menu = {
            {
                header = "Bills",
                isMenuHeader = true,
            }
        }

        for i = 1, #bills do
            local txt = ""
            local title = (bills[i].title and bills[i].title) or 'Bill'

            bills[i].concepts = json.decode(bills[i].concepts)
            for j = 1, #bills[i].concepts do
                txt = txt .. bills[i].concepts[j] .. "<br>"
            end

            table.insert(menu, {
                header = title .. ': $' .. bills[i].price .. "",
                txt = txt,
                params = {
                    event = "origen_police:server:PayBill",
                    isServer = true,
                    args = {
                        id = bills[i].id,
                        price = bills[i].price,
                        job = bills[i].job
                    }
                }
            })
        end

        OpenMenu(menu)
    end)
end

exports("ShowBills", ShowBills)
RegisterNetEvent("origen_police:client:ShowBills", function()
    ShowBills()
end)

exports("GetBills", function()
    local result = -1
    FW_TriggerCallback("origen_police:server:GetBills", function(bills)
        result = bills
    end)
    while result == -1 do
        Citizen.Wait(0)
    end
    return result
end)

if Config.IgnoreSettings then LoadMarkers() end