
local billingSettings = {
    enabled = true,
    allowedJobs = {}
}

RegisterNetEvent('mt_bossmenu:client:updateBillingSettings', function(settings)
    billingSettings = settings
end)

local billingTargetAdded = false

function AddBillingTarget()
    if billingTargetAdded then return end
    
    exports.ox_target:addGlobalPlayer({
        {
            name = 'mt-bossmenu:bill_player',
            icon = 'fa-solid fa-file-invoice-dollar',
            label = TranslateCap('billing_send') or 'Enviar Factura',
            canInteract = function(entity, distance, coords, name, bone)
                if not billingSettings.enabled then return false end
                local xPlayer = ESX.GetPlayerData()
                if not xPlayer or not xPlayer.job then return false end
                
                for _, job in ipairs(billingSettings.allowedJobs or {}) do
                    if xPlayer.job.name == job then return true end
                end
                return false
            end,
            onSelect = function(data)
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
                TriggerEvent('mt_bossmenu:client:openBillingInput', targetId)
            end
        }
    })
    billingTargetAdded = true
end

Citizen.CreateThread(function()
    while not ESX.IsPlayerLoaded() do Wait(100) end
    TriggerServerEvent('mt_bossmenu:server:requestBillingSettings')
    AddBillingTarget()
end)

RegisterNetEvent('mt_bossmenu:client:openBillingInput', function(targetId)
    local input = lib.inputDialog('Facturación', {
        {type = 'number', label = 'Monto de la factura', icon = 'dollar-sign', min = 1, required = true},
    })

    if not input then return end
    local amount = math.floor(input[1])

    TriggerServerEvent('mt_bossmenu:server:sendBill', targetId, amount)
end)

RegisterNetEvent('mt_bossmenu:client:receiveBill', function(senderId, amount, senderJob)
    local job = senderJob or 'Sociedad'
    
    local alert = lib.alertDialog({
        header = 'Factura Recibida',
        content = string.format('Has recibido una factura de %s por valor de %s$', job, amount),
        centered = true,
        cancel = true,
        labels = {
            confirm = 'Pagar',
            cancel = 'Rechazar'
        }
    })

    if alert == 'confirm' then
        TriggerServerEvent('mt_bossmenu:server:processBill', senderId, amount, true)
    else
        TriggerServerEvent('mt_bossmenu:server:processBill', senderId, amount, false)
    end
end)
