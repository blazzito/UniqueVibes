local NPCEntities = {}

function CreateNPCsBills()
    for _, npcCoord in pairs(BillsNPCPositions) do
        CreateThread(function()
            RequestModel(GetHashKey("s_m_y_cop_01"))

            while not HasModelLoaded(GetHashKey("s_m_y_cop_01")) do
                Wait(1)
            end
            local npc = CreatePed(4, GetHashKey("s_m_y_cop_01"), npcCoord.x, npcCoord.y, npcCoord.z - 1, npcCoord.w, false, true)
            NPCEntities[#NPCEntities + 1] = npc
            SetEntityHeading(npc, npcCoord.w)
            FreezeEntityPosition(npc, true)
            SetEntityInvincible(npc, true)
            SetBlockingOfNonTemporaryEvents(npc, true)
            TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 0, true)

            local notify = false

            while true do
                local wait = 1000

                if #(GetEntityCoords(PlayerPedId()) - npcCoord.xyz) < 2.5 then
                    wait = 5

                    if Config.CustomNotify then
                        ShowHelpNotification("E", "Habla con el agente")
                        notify = true
                    else
                        if Config.Framework == "qbcore" then
                            if not notify then
                                exports['qb-core']:DrawText("[E] Habla con el agente", 'left')
                                notify = true
                            end
                        elseif Config.Framework == "esx" then
                            Framework.ShowHelpNotification("~INPUT_PICKUP~ Habla con el agente", true)
                        end
                    end

                    if IsControlJustPressed(0, 38) then
                        ShowBills()
                    end
                elseif notify then
                    HideHelpNotification()
                    notify = false
                end

                Wait(wait)
            end
        end)
    end
end

function ClearNPCsBills()
    for _, npc in pairs(NPCEntities) do
        DeleteEntity(npc)
    end
end

function ShowBills()
    local mainMenu = {
        {
            header = "Comisaría",
            isMenuHeader = true,
            icon = "fa-solid fa-building-shield",
            txt = "Selecciona una opción"
        },
        {
            header = "Avisar a Policía",
            txt = "Notificar que hay alguien esperando en el hall",
            icon = "fa-solid fa-bell",
            params = {
                isAction = true,
                event = function()
                    TriggerServerEvent("SendAlert:police", {
                        coords = GetEntityCoords(PlayerPedId()),
                        title = 'Ciudadano en Comisaría',
                        type = 'GENERAL',
                        message = "Un ciudadano está esperando en el hall de la comisaría",
                        job = 'police'
                    })
                    exports["origen_notify"]:Notify({
                        title = "Comisaría",
                        description = "Se ha notificado a la policía",
                        type = "success",
                        duration = 5000
                    })
                end
            }
        },
        {
            header = "Ver Multas",
            txt = "Consultar y pagar tus multas pendientes",
            icon = "fa-solid fa-file-invoice-dollar",
            params = {
                isAction = true,
                event = function()
                    ShowBillsMenu()
                end
            }
        },
        {
            header = "Recuperar ID Card",
            txt = "Solicitar una copia de tu ID Card ($50)",
            icon = "fa-solid fa-id-card",
            params = {
                isAction = true,
                event = function()
                    TriggerServerEvent("origen_police:server:RecoverIDCard")
                end
            }
        }
    }
    OpenMenu(mainMenu)
end

function ShowBillsMenu()
    FW_TriggerCallback("origen_police:server:GetBills", function(bills)
        local menu = {
            {
                header = "Multas",
                isMenuHeader = true,
                icon = "fa-solid fa-file-invoice-dollar",
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

        if #bills == 0 then
            table.insert(menu, {
                header = "No tienes multas pendientes",
                txt = "¡Sigue así!",
                icon = "fa-solid fa-check",
                disabled = true
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
        Wait(0)
    end
    return result
end)

if Config.IgnoreSettings then LoadMarkers() end