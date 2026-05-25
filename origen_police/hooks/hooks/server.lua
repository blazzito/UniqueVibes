-- Framework hooks for server side
if Config.Framework == "qbcore" then
    -- QBCore specific hooks
    AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
        TriggerClientEvent('origen_police:client:OnPlayerLoaded', Player.PlayerData.source)
    end)

    AddEventHandler('QBCore:Server:OnJobUpdate', function(JobInfo)
        local src = source
        TriggerClientEvent('origen_police:client:OnJobUpdate', src, JobInfo)
    end)
elseif Config.Framework == "esx" then
    -- ESX specific hooks
    AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
        TriggerClientEvent('origen_police:client:OnPlayerLoaded', playerId)
    end)

    AddEventHandler('esx:setJob', function(playerId, job, lastJob)
        TriggerClientEvent('origen_police:client:OnJobUpdate', playerId, job)
    end)
end
