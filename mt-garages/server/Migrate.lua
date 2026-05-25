-- Command to migrate old vehicle types to new types
RegisterCommand("garagesMigrate", function(source)
    -- Only allow server console to run this command (source = 0)
    if source == 0 then
        -- Migrate: plane -> air
        MySQL.Async.execute(
            "UPDATE `" .. Fr.Table .. "` SET `type` = @newType WHERE `type` = @oldType",
            {
                ["@newType"] = "air",
                ["@oldType"] = "plane"
            },
            function(rowsUpdated)
                print("[GaragesMigration] Updated rows: " .. rowsUpdated .. "")
            end
        )
        
        -- Migrate: helicopter -> air
        MySQL.Async.execute(
            "UPDATE `" .. Fr.Table .. "` SET `type` = @newType WHERE `type` = @oldType",
            {
                ["@newType"] = "air",
                ["@oldType"] = "helicopter"
            },
            function(rowsUpdated)
                print("[GaragesMigration] Updated rows: " .. rowsUpdated .. "")
            end
        )
        
        -- Migrate: boat -> sea
        MySQL.Async.execute(
            "UPDATE `" .. Fr.Table .. "` SET `type` = @newType WHERE `type` = @oldType",
            {
                ["@newType"] = "sea",
                ["@oldType"] = "boat"
            },
            function(rowsUpdated)
                print("[GaragesMigration] Updated rows: " .. rowsUpdated .. "")
            end
        )
        
        -- Wait 3 seconds before completion message
        Wait(3000)
        print("[GaragesMigration] Migration completed.")
    end
end)