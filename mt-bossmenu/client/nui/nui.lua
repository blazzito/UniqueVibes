

ESX = exports['es_extended']:getSharedObject()

local stats = {}

function openNUI(data)
    -- Fetch all data in a single request instead of 7 separate calls
    ESX.TriggerServerCallback('mt_bossmenu:getInitialData', function(result)
        if not result then return end

        SendNUIMessage({
            action = 'openNUI',
            menus = Config.Menus,
            stats = {
                employeesamount = result.stats.employees,
                ondutyamount = result.stats.onduty,
                account = string.gsub(ESX.Math.GroupDigits(result.stats.balance), ",", "."),
                currency = result.currency,
                jobName = result.stats.jobName,
                jobLabel = result.stats.jobLabel,
                isBoss = result.stats.isBoss
            },
            employees = result.employees,
            salaries = result.salaries
        })

        -- Cargar ofertas y postulaciones del Job Center
        lib.callback('mt-newjobs:getJobOffers', false, function(offers)
            SendNUIMessage({
                action = 'getJobOffers',
                data = offers
            })
        end)

        lib.callback('mt-newjobs:getApplications', false, function(apps)
            SendNUIMessage({
                action = 'getApplications',
                data = apps
            })
        end, result.stats.jobName)

        SetNuiFocus(true, true)
        stats = data
    end)
end

RegisterNUICallback('closeNUI', function (data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('notify', function(data, cb)
    ESX.ShowNotification(data.message, data.type)
    cb('ok')
end)

-- Unified handling of employee actions
local function refreshData()
    ESX.TriggerServerCallback('mt_bossmenu:getInitialData', function(result)
        if not result then return end
        SendNUIMessage({
            action = 'getStats',
            stats = {
                employeesamount = result.stats.employees,
                ondutyamount = result.stats.onduty,
                account = string.gsub(ESX.Math.GroupDigits(result.stats.balance), ",", "."),
                currency = Config.Currency,
                isBoss = result.stats.isBoss
            }
        })
        SendNUIMessage({
            action = 'getEmployeesList',
            employees = result.employees
        })

        -- Actualizar ofertas y postulaciones
        lib.callback('mt-newjobs:getJobOffers', false, function(offers)
            SendNUIMessage({
                action = 'getJobOffers',
                data = offers
            })
        end)

        lib.callback('mt-newjobs:getApplications', false, function(apps)
            SendNUIMessage({
                action = 'getApplications',
                data = apps
            })
        end, result.stats.jobName)
    end)
end

RegisterNUICallback('addEmployee', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:addEmployee', function(success)
        if success then refreshData() cb('ok') else cb('error') end
    end, data)
end)

RegisterNUICallback('promoteEmployee', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:promoteEmployee', function(message)       
        if message == 'success' then refreshData() cb('ok') else cb(message) end
    end, data)
end)

RegisterNUICallback('demoteEmployee', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:demoteEmployee', function(message)
        if message == 'success' then refreshData() cb('ok') else cb(message) end
    end, data)
end)

RegisterNUICallback('fireEmployee', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:fireEmployee', function(message)
        if message == 'success' then refreshData() cb('ok') else cb(message) end
    end, data)
end)

RegisterNUICallback('changeSalary', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:changeSalary', function(message)
        if message == 'success' then refreshData() cb('ok') else cb(message) end
    end, data)
end)

RegisterNUICallback('deposit', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:depositMoney', function(message)
        if message == 'success' then refreshData() cb('ok') else cb(message) end
    end, data)
end)

RegisterNUICallback('withdraw', function (data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:withdrawMoney', function(message)
        if message == 'success' then refreshData() cb('ok') else cb(message) end
    end, data)
end)

RegisterNUICallback('getCurrentCoords', function(data, cb)
    local coords = GetEntityCoords(PlayerPedId())
    cb({ 
        coords = string.format("%.2f, %.2f, %.2f", coords.x, coords.y, coords.z) 
    })
end)

RegisterNUICallback('createBossPoint', function(data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:server:createPoint', function(success)
        cb(success and 'ok' or 'error')
    end, data)
end)

RegisterNUICallback('editBossPoint', function(data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:server:updatePoint', function(success)
        cb(success and 'ok' or 'error')
    end, data)
end)

RegisterNUICallback('deleteBossPoint', function(data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:server:deletePoint', function(success)
        cb(success and 'ok' or 'error')
    end, data)
end)

RegisterNUICallback('updatePaymentSchedule', function(data, cb)
    -- Lógica para guardar horario de pago en BD
    cb('ok')
end)

RegisterNUICallback('updateBillingPermission', function(data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:server:updateBillingPermission', function(success)
        cb(success and 'ok' or 'error')
    end, data)
end)
RegisterNUICallback('toggleBillingSystem', function(data, cb)
    ESX.TriggerServerCallback('mt_bossmenu:server:toggleBillingSystem', function(success)
        cb(success and 'ok' or 'error')
    end, data)
end)

function getStats(data) refreshData() end
function getEmployees() refreshData() end
function getSalaries() refreshData() end

RegisterNUICallback('getJobOffers', function(data, cb)
    lib.callback('mt-newjobs:getJobOffers', false, function(offers)
        SendNUIMessage({
            action = 'getJobOffers',
            data = offers
        })
        cb('ok')
    end)
end)

RegisterNUICallback('getApplications', function(data, cb)
    local xPlayer = ESX.GetPlayerData()
    lib.callback('mt-newjobs:getApplications', false, function(apps)
        SendNUIMessage({
            action = 'getApplications',
            data = apps
        })
        cb('ok')
    end, xPlayer.job.name)
end)

RegisterNUICallback('openOfferCreator', function(data, cb)
    TriggerEvent('mt-newjobs:client:openOfferCreator')
    cb('ok')
end)

RegisterNUICallback('deleteOffer', function(data, cb)
    lib.callback('mt-newjobs:deleteOffer', false, function(success)
        if success then
            -- Refresh list
            lib.callback('mt-newjobs:getJobOffers', false, function(offers)
                SendNUIMessage({
                    action = 'getJobOffers',
                    data = offers
                })
            end)
            cb('ok')
        else
            cb('error')
        end
    end, data.id)
end)

RegisterNUICallback('updateJobOffer', function(data, cb)
    TriggerServerEvent('mt-newjobs:server:updateOffer', data)
    cb('ok')
    refreshData()
end)

RegisterNUICallback('createJobOffer', function(data, cb)
    TriggerServerEvent('mt-newjobs:server:createOffer', data)
    -- Refresh list after a short delay
    SetTimeout(500, function()
        lib.callback('mt-newjobs:getJobOffers', false, function(offers)
            SendNUIMessage({
                action = 'getJobOffers',
                data = offers
            })
        end)
    end)
    cb('ok')
end)

RegisterNUICallback('deleteApplication', function(data, cb)
    TriggerServerEvent('mt-newjobs:server:deleteApplication', data.id)
    -- Refresh list
    SetTimeout(500, function()
        local xPlayer = ESX.GetPlayerData()
        lib.callback('mt-newjobs:getApplications', false, function(apps)
            SendNUIMessage({
                action = 'getApplications',
                data = apps
            })
        end, xPlayer.job.name)
    end)
    cb('ok')
end)