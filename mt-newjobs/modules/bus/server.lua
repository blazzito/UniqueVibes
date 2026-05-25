-- =====================================================
-- BUS JOB - SERVER SIDE
-- =====================================================

lib.callback.register('mt-bus:getStats', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end
    local stats = GetPlayerStats(xPlayer.identifier, 'bus')
    local levelInfo = LevelSystem:GetCurrentLevelProgress(stats.xp)
    return {
        level = levelInfo.level,
        xp = stats.xp,
        totalItems = stats.total_actions,
        shiftsCompleted = stats.shifts_completed,
        totalEarned = stats.total_earned,
        totalTime = stats.total_time,
        bestShift = stats.best_shift,
        avgPerShift = stats.shifts_completed > 0 and math.floor(stats.total_actions / stats.shifts_completed) or 0,
        bonusPercent = LevelSystem:GetPayBonus(levelInfo.level)
    }
end)

lib.callback.register('mt-bus:openMenu', function(source)
    return CanOpenMenu(source, 'bus_menu')
end)

lib.callback.register('mt-bus:checkSpawnFree', function(source)
    return IsSpawnPointFree(vec3(BusConfig.Locations.VehicleSpawn.x, BusConfig.Locations.VehicleSpawn.y, BusConfig.Locations.VehicleSpawn.z), 10.0)
end)

lib.callback.register('mt-bus:startJob', function(source)
    return true
end)

RegisterNetEvent('mt-bus:finishJob', function(passengers, timeWorked)
    local _source = source
    FinishJob(_source, 'bus', passengers, passengers * (BusConfig.Payment.PerPassenger or 10), timeWorked)
end)

RegisterNetEvent('mt-bus:cancelJob', function()
    -- Logic when cancelling
end)

RegisterNetEvent('mt-bus:closeMenu', function()
    local _source = source
    ReleaseMenu(_source, 'bus_menu')
end)

