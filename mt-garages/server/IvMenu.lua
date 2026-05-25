Citizen.CreateThread(function()
    -- Wait for Framework to be initialized
    while Framework == nil do
        Wait(5)
    end
    
    -- Server callback for impounding a vehicle
    Fr.RegisterServerCallback("mt-garages:ivVehicle", function(source, cb, data)
        -- Query vehicle from database by plate
        local source = source
        MySQL.query("SELECT * FROM " .. Fr.Table .. " WHERE plate = ?", {data.plate}, function(result)
            -- Return success callback
            cb(true)
            
            -- If vehicle exists in database
            if #result > 0 then
                local priceAfter = 0
                local priceBefore = 0
                
                -- Set prices if enabled in config
                if Config.IV.allowPriceBeforeImpoundDate then
                    priceBefore = data.priceBefore
                end
                
                if Config.IV.allowPriceAfterImpoundDate then
                    priceAfter = data.priceAfter
                end
                
                -- Calculate impound expiry time
                local currentTime = os.time()
                local impoundDuration = 0
                local retrievable = true
                
                if data.impoundTime.value ~= "never" then
                    -- Convert hours to seconds
                    local hours = tonumber(data.impoundTime.value or 0)
                    impoundDuration = hours * 3600
                else
                    -- Vehicle is permanently impounded
                    retrievable = false
                end
                
                -- Set default reason if empty
                if data.reason == "" then
                    data.reason = TranslateIt("imp_vehiclenoreason")
                end
                
                -- Get player name who is impounding
                local playerName = Fr.GetPlayerName(source)
                
                -- Calculate expiry date
                local expiryDate = os.date("%Y-%m-%d %H:%M:%S", currentTime + impoundDuration)
                
                -- Update vehicle in database
                MySQL.Async.execute(
                    "UPDATE `" .. Fr.Table .. "` SET `" .. Fr.StoredTable .. 
                    "` = 1, `towedToDate` = @impoundTime, `vehicleImpound` = @impoundLocation, " ..
                    "vehicleid = NULL, `towedPrice` = @priceBefore, `towedAfterPrice` = @priceAfter, " ..
                    "`impoundReason` = @reason, `towedOutBy` = @playerName, `isTowedOut` = 1, " ..
                    "`retrievable` = @ret WHERE plate = @plate",
                    {
                        ["@plate"] = data.plate,
                        ["@reason"] = data.reason,
                        ["@impoundLocation"] = data.impoundLocation.value,
                        ["@impoundTime"] = expiryDate,
                        ["@priceAfter"] = priceAfter,
                        ["@priceBefore"] = priceBefore,
                        ["@ret"] = retrievable,
                        ["@playerName"] = playerName
                    },
                    function(rowsChanged)
                        if rowsChanged > 0 then
                            -- Call hook
                            onVehicleTowedByFraction(source, data.plate, result[1])
                        end
                    end
                )
            end
            
            -- Server-side deletion
            if data.netId then
                local entity = NetworkGetEntityFromNetworkId(data.netId)
                if DoesEntityExist(entity) then
                    DeleteEntity(entity)
                end
            end
        end)
    end)
end)