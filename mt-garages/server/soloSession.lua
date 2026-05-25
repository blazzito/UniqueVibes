local usedBuckets = {}

-- Event: Player enters solo session
RegisterServerEvent("mt-garages:soloSession")
AddEventHandler("mt-garages:soloSession", function()
    local bucket = generateBucket()
    SetPlayerRoutingBucket(source, bucket)
end)

-- Event: Player leaves solo session
RegisterServerEvent("mt-garages:soloSessionLeave")
AddEventHandler("mt-garages:soloSessionLeave", function()
    local currentBucket = GetPlayerRoutingBucket(source)
    
    -- Return player to default bucket
    SetPlayerRoutingBucket(source, 0)
    
    -- Remove bucket from used list
    usedBuckets[currentBucket] = nil
    
    -- Ensure player is in default bucket (loop until confirmed)
    while GetPlayerRoutingBucket(source) ~= 0 do
        SetPlayerRoutingBucket(source, 0)
    end
end)

-- Generate a unique routing bucket
function generateBucket()
    local bucket = math.random(1, 7000)
    
    -- If bucket is already in use, recursively try again
    if usedBuckets[bucket] then
        return generateBucket()
    else
        -- Mark bucket as used and return it
        table.insert(usedBuckets, bucket)
        return bucket
    end
end