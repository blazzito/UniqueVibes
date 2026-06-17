--[[


    Do NOT CHANGE any of the code in this file,
    
    if you do so, do it on your own risk and no support will be given


]]

ESX = exports['es_extended']:getSharedObject()

CreateThread(function()


    ESX.RegisterServerCallback('lls-mechanic:getCurrentMoney', function(source, cb, isWhitelistJob, customConfigPosIndex)
        local esxPlayer = ESX.GetPlayerFromId(source)
        if (esxPlayer) then
            if (isWhitelistJob == true and customConfigPosIndex and Config.Positions[customConfigPosIndex] and Config.Positions[customConfigPosIndex].societyName) then
                TriggerEvent('esx_addonaccount:getSharedAccount', Config.Positions[customConfigPosIndex].societyName, function(account)
                    if (account) then
                        cb(account.money)
                    else
                        cb(0)
                    end
                end)
            else
                cb(esxPlayer.getMoney())
            end
        else
            cb(0)
        end
    end)
end)

RegisterServerEvent('lls-mechanic:removeMoney')
AddEventHandler('lls-mechanic:removeMoney', function(amount, isWhitelistJob, customConfigPosIndex, vehicleProps)
    local src = source

    if (amount > 0) then
        if (isWhitelistJob == true and customConfigPosIndex and Config.Positions[customConfigPosIndex] and Config.Positions[customConfigPosIndex].societyName) then
            removeSocietyMoney(src, amount, customConfigPosIndex)
        else
            removePlayerCashMoney(src, amount)
        end
    end

    if (Config.AutoSaveVehiclePropertiesOnApply == true) then
        saveVehicleProperties(vehicleProps)
    end
end)



ESX.RegisterUsableItem('repairkit', function(source)
    local ok, err = pcall(function()
        exports['qs-inventory']:RemoveItem(source, "repairkit", 1)
    end)
    if not ok then
        print('[lls-mechanic] Error al remover repairkit del inventario: ' .. tostring(err))
        return
    end

    TriggerClientEvent('esx_mechanicjob:onFixkit', source)
    TriggerClientEvent('esx:showNotification', source, "Haz utilizado un kit de reparacion")
end)