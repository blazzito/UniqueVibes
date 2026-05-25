ESX = exports['es_extended']:getSharedObject()

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    Wait(5000)

    if xPlayer then
        MySQL.Async.fetchAll('SELECT * FROM mt_bossmenu_bonus_queue WHERE identifier = @identifier', {
            ['@identifier'] = xPlayer.identifier
        }, function(results)
            for _, v in ipairs(results) do
                MySQL.Async.execute('DELETE FROM mt_bossmenu_bonus_queue WHERE identifier = @identifier AND id = @id', {
                    ['@identifier'] = xPlayer.identifier,
                    ['@id'] = v.id
                })
                xPlayer.addAccountMoney('bank', v.amount)
                TriggerClientEvent('esx:showNotification', playerId, ('Has recibido una bonificación pendiente de %s en tu banco'):format(v.amount))
                Wait(5500)
            end
        end)
    end
end)