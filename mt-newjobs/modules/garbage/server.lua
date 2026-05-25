-- =====================================================
-- GARBAGE JOB - SERVER SIDE
-- =====================================================

lib.callback.register('mt-garbage:getStats', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end
    local stats = GetPlayerStats(xPlayer.identifier, 'garbage')
    local levelInfo = LevelSystem:GetCurrentLevelProgress(stats.xp)
    return {
        level = levelInfo.level,
        xp = stats.xp,
        totalBags = stats.total_actions,
        shiftsCompleted = stats.shifts_completed,
        totalEarned = stats.total_earned,
        bestShift = stats.best_shift,
        bonusPercent = LevelSystem:GetPayBonus(levelInfo.level)
    }
end)

lib.callback.register('mt-garbage:openMenu', function(source)
    return CanOpenMenu(source, 'garbage_menu')
end)

lib.callback.register('mt-garbage:checkSpawnFree', function(source)
    local spawnCoords = GarbageConfig.Locations.VehicleSpawn
    return IsSpawnPointFree(vec3(spawnCoords.x, spawnCoords.y, spawnCoords.z), 8.0)
end)

lib.callback.register('mt-garbage:startJob', function(source)
    return true
end)

RegisterNetEvent('mt-garbage:returnVehicle', function(bags, timeWorked)
    local _source = source
    if bags <= 0 then
        TriggerClientEvent('ox_lib:notify', _source, {
            title = 'Basurero',
            description = 'No has recogido ninguna bolsa de basura.',
            type = 'error'
        })
        return
    end
    FinishJob(_source, 'garbage', bags, bags * (GarbageConfig.Payment.PerBag or 15), timeWorked)
end)

RegisterNetEvent('mt-garbage:cancelJob', function()
    -- Clean up
end)

RegisterNetEvent('mt-garbage:closeMenu', function()
    local _source = source
    ReleaseMenu(_source, 'garbage_menu')
end)

