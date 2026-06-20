local BANK = {
    Data = {}
}

local activeBlips, bankPoints, atmPoints, markerPoints = {}, {}, {}, {}
local playerLoaded, uiActive, inMenu = false, false, false

function BANK:Thread()
    self:CreateBlips()
    local data = self.Data
    data.ped = PlayerPedId()
    playerLoaded = true

    -- === BANCOS (Nodos Estáticos) ===
    for i = 1, #Config.Banks do
        local pos = Config.Banks[i].Position
        exports['mt-notify']:create3DTextUI('bank_' .. i, {
            type    = '3dtext',
            coords  = vector3(pos.x, pos.y, pos.z + 1.2),
            displayDist = 2.5,
            interactDist = 1.5,
            enableKeyClick = true,
            key     = 'E',
            text    = 'BANCO',
            job     = "all",
            options = {{ label = 'Acceder al Banco', icon = 'fa-solid fa-building-columns', event = 'esx_banking:openUI', value = false }}
        })
    end

    -- === CAJEROS (Detección Dinámica) ===
    CreateThread(function()
        local currentAtmId = nil
        while playerLoaded do
            local sleep = 500
            local pPed = PlayerPedId()
            local pCoord = GetEntityCoords(pPed)
            
            if IsPedOnFoot(pPed) and not ESX.PlayerData.dead and not inMenu then
                local found = nil
                for i = 1, #Config.AtmModels do
                    local atm = GetClosestObjectOfType(pCoord.x, pCoord.y, pCoord.z, 3.0, Config.AtmModels[i], false, false, false)
                    if atm ~= 0 then
                        found = atm
                        break
                    end
                end

                if found then
                    sleep = 250
                    local atmCoord = GetEntityCoords(found)
                    local atmId = "atm_" .. found

                    if currentAtmId ~= atmId then
                        if currentAtmId then exports['mt-notify']:DeleteText3D(currentAtmId) end
                        currentAtmId = atmId
                        exports['mt-notify']:create3DTextUI(atmId, {
                            type    = '3dtext',
                            coords  = vector3(atmCoord.x, atmCoord.y, atmCoord.z + 1.2),
                            displayDist = 2.5,
                            interactDist = 1.5,
                            enableKeyClick = true,
                            key     = 'E',
                            text    = 'CAJERO',
                            job     = "all",
                            options = {{ label = 'Usar Cajero', icon = 'fa-solid fa-money-bill-wave', event = 'esx_banking:openUI', value = true }}
                        })
                    else
                        -- Mantener coordenadas frescas si el ATM se mueve (raro pero posible)
                        exports['mt-notify']:Update3DTextCoords(atmId, vector3(atmCoord.x, atmCoord.y, atmCoord.z + 1.2))
                    end
                else
                    if currentAtmId then
                        exports['mt-notify']:DeleteText3D(currentAtmId)
                        currentAtmId = nil
                    end
                end
            else
                if currentAtmId then
                    exports['mt-notify']:DeleteText3D(currentAtmId)
                    currentAtmId = nil
                end
            end
            Wait(sleep)
        end
    end)
end

function BANK:UpdateVisibility(state)
    -- Ocultar/Mostrar todos los bancos
    for i = 1, #Config.Banks do
        if state then exports['mt-notify']:HideDrawText3D('bank_' .. i)
        else exports['mt-notify']:ShowDrawText3D('bank_' .. i) end
    end
end

RegisterNetEvent('esx_banking:openUI', function(atm)
    if inMenu then return end
    BANK:HandleUi(true, atm)
end)

function BANK:CreateBlips()
    local tmpActiveBlips = {}
    for i = 1, #Config.Banks do
        if type(Config.Banks[i].Blip) == 'table' and Config.Banks[i].Blip.Enabled then
            local position = Config.Banks[i].Position
            local bInfo = Config.Banks[i].Blip
            local blip = AddBlipForCoord(position.x, position.y, position.z)
            SetBlipSprite(blip, bInfo.Sprite)
            SetBlipScale(blip, bInfo.Scale)
            SetBlipColour(blip, bInfo.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(bInfo.Label)
            EndTextCommandSetBlipName(blip)
            tmpActiveBlips[#tmpActiveBlips + 1] = blip
        end
    end

    activeBlips = tmpActiveBlips
end

function BANK:RemoveBlips()
    for i = 1, #activeBlips do
        if DoesBlipExist(activeBlips[i]) then
            RemoveBlip(activeBlips[i])
        end
    end
    activeBlips = {}
end

function BANK:HandleUi(state, atm)
    atm = atm or false
    local playerPed = PlayerPedId()
    inMenu = state
    BANK:UpdateVisibility(state)
    
    if not state then
        TriggerServerEvent('esx_banking:closeSession')
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = "close",
            showMenu = false
        })
        ClearPedTasks(playerPed)
        return
    end

    if atm then
        TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_ATM', 0, true)
        Wait(1500)
    end

    SetNuiFocus(true, true)
    TriggerServerEvent('esx_banking:openSession')

    ESX.TriggerServerCallback('esx_banking:getPlayerData', function(data)
        if atm then
            SendNUIMessage({
                action = "openATM",
                playerName = data.playerName,
                playerIban = data.playerIban,
                playerCash = data.money,
                playerBank = data.bankMoney,
            })
        else
            SendNUIMessage({
                action = "openBank",
                playerName = data.playerName,
                playerIban = data.playerIban,
                playerCash = data.money,
                playerBank = data.bankMoney,
                playerStatements = data.transactionHistory
            })
        end
    end)
end

function BANK:LoadNpc(index, netID)
    CreateThread(function()
        while not NetworkDoesEntityExistWithNetworkId(netID) do
            Wait(200)
        end
        local npc = NetworkGetEntityFromNetworkId(netID)
        TaskStartScenarioInPlace(npc, Config.Peds[index].Scenario, 0, true)
        SetEntityProofs(npc, true, true, true, true, true, true, true, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        FreezeEntityPosition(npc, true)
        SetPedCanRagdollFromPlayerImpact(npc, false)
        SetPedCanRagdoll(npc, false)
        SetEntityAsMissionEntity(npc, true, true)
        SetEntityDynamic(npc, false)
    end)
end

RegisterNetEvent('esx_banking:closebanking', function()
    BANK:HandleUi(false)
end)

RegisterNetEvent('esx_banking:pedHandler', function(netIdTable)
    for i = 1, #netIdTable do
        BANK:LoadNpc(i, netIdTable[i])
    end
end)

RegisterNetEvent('esx_banking:updateMoneyInUI', function(doingType, bankMoney, money)
    SendNUIMessage({
        updateData = true,
        data = {
            type = doingType,
            bankMoney = bankMoney,
            money = money
        }
    })
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    BANK:Thread()
end)

RegisterNetEvent('esx:playerLoaded', function()
    BANK:Thread()
end)

RegisterNetEvent('esx:onPlayerLogout', function()
    playerLoaded = false
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    BANK:RemoveBlips()
    for i = 1, #Config.Banks do exports['mt-notify']:DeleteText3D('bank_' .. i) end
end)

RegisterNetEvent('esx:onPlayerDeath', function() 
    for i = 1, #Config.Banks do exports['mt-notify']:HideDrawText3D('bank_' .. i) end
end)

RegisterNUICallback('closeApp', function(data, cb)
    BANK:HandleUi(false)
    cb('ok')
end)

RegisterNUICallback('withdraw', function(data, cb)
    if not data or not inMenu then return cb({success = false}) end
    ESX.TriggerServerCallback('esx_banking:doingType', function(result)
        cb(result)
    end, {withdraw = data.amount})
end)

RegisterNUICallback('deposit', function(data, cb)
    if not data or not inMenu then return cb({success = false}) end
    ESX.TriggerServerCallback('esx_banking:doingType', function(result)
        cb(result)
    end, {deposit = data.amount})
end)

RegisterNUICallback('transfer', function(data, cb)
    if not data or not inMenu then return cb({success = false}) end
    ESX.TriggerServerCallback('esx_banking:doingType', function(result)
        cb(result)
    end, {
        transfer = {
            playerId = data.to,
            moneyAmount = data.amount
        }
    })
end)

RegisterNUICallback('checkPin', function(data, cb)
    if not data or not inMenu then return cb({success = false}) end

    ESX.TriggerServerCallback("esx_banking:checkPincode", function(pincode)
        if pincode then
            cb({success = true})
            ESX.ShowNotification(TranslateCap('pincode_found'), "success")
        else
            cb({success = false})
            ESX.ShowNotification(TranslateCap('pincode_not_found'), "error")
        end
    end, data.pin)
end)

RegisterNUICallback('orderCard', function(data, cb)
    if not data or not inMenu then return cb({success = false}) end
    ESX.TriggerServerCallback('esx_banking:doingType', function(result)
        cb(result)
    end, {pincode = data.pin})
end)