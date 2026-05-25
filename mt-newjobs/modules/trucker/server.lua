-- =====================================================
-- TRUCKER JOB - SERVER SIDE
-- =====================================================

lib.callback.register('mt-trucker:getStats', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end
    local stats = GetPlayerStats(xPlayer.identifier, 'trucker')
    local levelInfo = LevelSystem:GetCurrentLevelProgress(stats.xp)
    return {
        level = levelInfo.level,
        xp = stats.xp,
        totalItems = stats.total_actions,
        shiftsCompleted = stats.shifts_completed,
        totalEarned = stats.total_earned,
        totalTime = stats.total_time,
        bestShift = stats.best_shift,
        bonusPercent = LevelSystem:GetPayBonus(levelInfo.level),
        levelProgress = levelInfo,
        avgPerShift = stats.shifts_completed > 0 and math.floor(stats.total_actions / stats.shifts_completed) or 0,
        truckerOptions = {
            routes = TruckerConfig.Routes,
            trucks = TruckerConfig.Trucks,
            trailers = TruckerConfig.Trailers
        }
    }
end)

lib.callback.register('mt-trucker:openMenu', function(source)
    return CanOpenMenu(source, 'trucker_menu')
end)

lib.callback.register('mt-trucker:checkSpawnFree', function(source)
    -- Check multiple spawn points
    for _, spawn in ipairs(TruckerConfig.Locations.VehicleSpawn) do
        if IsSpawnPointFree(vec3(spawn.x, spawn.y, spawn.z), 5.0) then
            return true
        end
    end
    return false
end)

lib.callback.register('mt-trucker:startJob', function(source)
    local freeSpawns = {}
    for i, spawn in ipairs(TruckerConfig.Locations.VehicleSpawn) do
        if IsSpawnPointFree(vec3(spawn.x, spawn.y, spawn.z), 5.0) then
            table.insert(freeSpawns, i)
        end
    end
    
    if #freeSpawns > 0 then
        return freeSpawns[math.random(1, #freeSpawns)]
    end
    
    return 1 -- fallback if all seem occupied (let client handle it)
end)

RegisterNetEvent('mt-trucker:completeDelivery', function(routeIndex, timeWorked, truckModel, trailerModel)
    local _source = source
    local route = TruckerConfig.Routes[routeIndex]
    if not route then return end
    
    local truckMult = 1.0
    local trailerMult = 1.0
    
    if truckModel then
        for _, t in ipairs(TruckerConfig.Trucks) do
            if t.model == truckModel then truckMult = t.paymentFactor break end
        end
    end
    
    if trailerModel then
        for _, t in ipairs(TruckerConfig.Trailers) do
            if t.model == trailerModel then trailerMult = t.paymentFactor break end
        end
    end
    
    local totalPay = math.floor(route.payment * truckMult * trailerMult)
    FinishJob(_source, 'trucker', 1, totalPay, timeWorked)
end)

RegisterNetEvent('mt-trucker:cancelJob', function()
    -- Logic for cancellation
end)

RegisterNetEvent('mt-trucker:closeMenu', function()
    local _source = source
    ReleaseMenu(_source, 'trucker_menu')
end)

