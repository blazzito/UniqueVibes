-- =====================================================
-- CHICKEN JOB - SERVER SIDE
-- =====================================================

local SpawnedChickens = {}
local MaxChickensPerZone = ChickenConfig.ChickensPerZone or 20

-- Sync Stats Callback
lib.callback.register('mt-chicken:getStats', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end
    local stats = GetPlayerStats(xPlayer.identifier, 'chicken')
    local levelInfo = LevelSystem:GetCurrentLevelProgress(stats.xp)
    return {
        level = levelInfo.level,
        xp = stats.xp,
        totalItems = stats.total_actions,
        shiftsCompleted = stats.shifts_completed,
        totalEarned = stats.total_earned,
        bestShift = stats.best_shift,
        bonusPercent = LevelSystem:GetPayBonus(levelInfo.level)
    }
end)

-- Menu & Spawn Callbacks
lib.callback.register('mt-chicken:openMenu', function(source)
    return CanOpenMenu(source, 'chicken_menu')
end)

lib.callback.register('mt-chicken:checkSpawnFree', function(source)
    return IsSpawnPointFree(vec3(ChickenConfig.Locations.VehicleSpawn.x, ChickenConfig.Locations.VehicleSpawn.y, ChickenConfig.Locations.VehicleSpawn.z), 5.0)
end)

lib.callback.register('mt-chicken:startJob', function(source)
    return true
end)

-- Chicken Spawning Logic (Server-side synced)
CreateThread(function()
    while true do
        Wait(30000) -- Check every 30 seconds
        for zIndex, zone in ipairs(ChickenConfig.ChickenZones) do
            local currentInZone = 0
            for id, chicken in pairs(SpawnedChickens) do
                if chicken.zone == zIndex then
                    if DoesEntityExist(chicken.entity) then
                        currentInZone = currentInZone + 1
                    else
                        SpawnedChickens[id] = nil
                    end
                end
            end
            
            if currentInZone < MaxChickensPerZone then
                local spawnCount = MaxChickensPerZone - currentInZone
                for i=1, spawnCount do
                    local spawnPos = zone.spawns[math.random(1, #zone.spawns)]
                    local ped = CreatePed(28, GetHashKey(ChickenConfig.ChickenModel or 'A_C_Hen'), spawnPos.x, spawnPos.y, spawnPos.z, math.random(0, 360), true, true)
                    local netId = NetworkGetNetworkIdFromEntity(ped)
                    local id = "chicken_" .. netId
                    SpawnedChickens[id] = { entity = ped, zone = zIndex, netId = netId }
                end
            end
        end
    end
end)

RegisterNetEvent('mt-chicken:catchChicken', function(chickenId)
    local _source = source
    -- Logic to handle catching a specific chicken if needed for syncing
end)

RegisterNetEvent('mt-chicken:deliverChicken', function(count, timeWorked)
    local _source = source
    FinishJob(_source, 'chicken', count, count * (ChickenConfig.Payment or 10), timeWorked)
end)

RegisterNetEvent('mt-chicken:cancelJob', function()
    local _source = source
    -- Clean up if necessary
end)

RegisterNetEvent('mt-chicken:closeMenu', function()
    local _source = source
    ReleaseMenu(_source, 'chicken_menu')
end)

