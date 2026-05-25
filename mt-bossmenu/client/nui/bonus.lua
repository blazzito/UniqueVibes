
ESX = exports['es_extended']:getSharedObject()

RegisterNUICallback('giveBonusToSelectedEmployees', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:giveBonusToSelectedEmployees', function(success, message)
        if success then
            cb('ok')
        elseif not success and message == 'exceeds_maximum' then
            cb('exceeds_maximum')
        else
            cb(message or 'error')
        end
    end, data)
end)

RegisterNUICallback('giveBonusToRanks', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:giveBonusToRanks', function(success, message)
        if success then
            cb('ok')
        elseif not success and message == 'exceeds_maximum' then
            cb('exceeds_maximum')
        else
            cb(message or 'error')
        end
    end, data)
end)

RegisterNUICallback('giveBonusToAllEmployees', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:giveBonusToAllEmployees', function(success, message)
        if success then
            cb('ok')
        elseif not success and message == 'exceeds_maximum' then
            cb('exceeds_maximum')
        else
            cb(message or 'error')
        end
    end, data)
end)

RegisterNUICallback('giveBonusToAllRanks', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:giveBonusToAllRanks', function(success, message)
        if success then
            cb('ok')
        elseif not success and message == 'exceeds_maximum' then
            cb('exceeds_maximum')
        else
            cb(message or 'error')
        end
    end, data)
end)

RegisterNUICallback('giveBonusToOnlineEmployees', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:giveBonusToOnlineEmployees', function(success, message)
        if success then
            cb('ok')
        elseif not success and message == 'exceeds_maximum' then
            cb('exceeds_maximum')
        else
            cb(message or 'error')
        end
    end, data)
end)