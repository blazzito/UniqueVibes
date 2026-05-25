-- Automatic MySQL Database Setup and Management

-- Table creation queries
local tableQueries = {
    -- Garages table
    [[
CREATE TABLE IF NOT EXISTS `mtgarages_garages` (
        `Index` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
        `Label` VARCHAR(300) DEFAULT NULL,
        `Type` varchar(250) NOT NULL DEFAULT 'car',
        `Coords` VARCHAR(300) NOT NULL DEFAULT '{"CenterOfZone":{"z": 0,"y": 0,"x": 0,"w": 0},"AccessPoint": {"z": 0,"y": 0,"x": 0,"w": 0}}',
        `JobName` varchar(250) DEFAULT NULL,
        `JobGrade` int NOT NULL DEFAULT '0',
        `JobMode` VARCHAR(300) NOT NULL DEFAULT 'owned',
        `Radius` int NOT NULL DEFAULT '20',
        `isPrivate` tinyint(1) NOT NULL DEFAULT '0',
        `privatePlayers` VARCHAR(300) NOT NULL DEFAULT '[]',
        `zpoints` VARCHAR(300) NOT NULL DEFAULT '{"minZ": 0.0, "maxZ": 0.0}',
        `onespawn` VARCHAR(300) NOT NULL DEFAULT '{"z": 0,"y": 0,"x": 0,"w": 0}',
        `GangName` VARCHAR(300) DEFAULT NULL,
        `GangGrade` int(11) DEFAULT 0,
        `GangMode` VARCHAR(300) NOT NULL DEFAULT 'owned',
        `blipDisabled` tinyint DEFAULT 0,
        PRIMARY KEY (`Index`)
    )]],
    
    -- Impounds table
    [[
CREATE TABLE IF NOT EXISTS `mtgarages_impounds` (
        `Index` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
        `Label` varchar(250) DEFAULT NULL,
        `Type` varchar(250) NOT NULL DEFAULT 'car',
        `Coords` VARCHAR(300) NOT NULL DEFAULT '{"z": 0,"y": 0,"x": 0,"w": 0}',
        `AllowedJobs` VARCHAR(300) NOT NULL DEFAULT '[]',
        `blipDisabled` tinyint DEFAULT 0,
        PRIMARY KEY (`Index`)
    )]],
    
    -- Job vehicles table
    [[
CREATE TABLE IF NOT EXISTS `mtgarages_jobvehicles` (
        `index` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
        `model` VARCHAR(300) DEFAULT NULL,
        `job` VARCHAR(300) DEFAULT NULL,
        `gradesAllowed` VARCHAR(300) NOT NULL DEFAULT '[]',
        `properties` TEXT NOT NULL DEFAULT '{}',
        PRIMARY KEY (`index`)
    )]],
    
    -- Vehicle labels table
    [[
CREATE TABLE IF NOT EXISTS `mtgarages_vehicles` (
        `model` VARCHAR(300) DEFAULT NULL,
        `label` VARCHAR(300) DEFAULT NULL
    )]],
    
    -- Gang vehicles table
    [[
CREATE TABLE IF NOT EXISTS `mtgarages_gangvehicles` (
        `index` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
        `model` VARCHAR(300) DEFAULT NULL,
        `gang` VARCHAR(300) DEFAULT NULL,
        `gradesAllowed` VARCHAR(300) NOT NULL DEFAULT '[]',
        `properties` TEXT NOT NULL DEFAULT '{}',
        PRIMARY KEY (`index`)
    )]]
}

-- Function to check if a column exists and add it if missing
function ensureColumnExists(tableName, columnName, definition)
    local result = MySQL.query.await([[
        SELECT COUNT(*) AS columnExists
        FROM information_schema.COLUMNS
        WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = @tableName AND COLUMN_NAME = @columnName
    ]], {
        ["@tableName"] = tableName,
        ["@columnName"] = columnName
    })
    
    if result[1].columnExists == 0 then
        local success, err = pcall(function()
            MySQL.execute("ALTER TABLE " .. tableName .. " ADD COLUMN " .. columnName .. " " .. definition)
        end)
        
        if not success then
            print("^1[Auto-SQL] Error during adding column: ^0" .. err)
        else
            print("^2[Auto-SQL] Successfully created missing column: " .. columnName)
        end
    end
end

-- Main function to create tables if they don't exist
function createTableIfNotExists()
    -- Wait for Framework
    while not Framework do
        Wait(100)
    end
    
    if ServerConfig.AutoMysql then
        -- Framework-specific vehicle table schemas
        local frameworkTables = {
            ESX = [[
                CREATE TABLE IF NOT EXISTS owned_vehicles (
                    `owner` varchar(60) DEFAULT NULL,
                    `plate` varchar(12) NOT NULL,
                    `vehicle` longtext DEFAULT NULL,
                    `type` varchar(20) NOT NULL DEFAULT 'car',
                    `job` varchar(20) DEFAULT NULL,
                    `stored` tinyint(4) NOT NULL DEFAULT '0',
                    `parking` varchar(60) DEFAULT NULL,
                    `pound` varchar(60) DEFAULT NULL,
                    `mileage` float DEFAULT '0',
                    `glovebox` longtext DEFAULT NULL,
                    `trunk` longtext DEFAULT NULL,
                    `vehicleid` int(11) DEFAULT NULL,
                    `co_owner` varchar(255) DEFAULT NULL,
                    `co_owner_name` varchar(255) DEFAULT NULL,
                    `retrievable` tinyint(1) DEFAULT 1,
                    `towedPrice` int(11) DEFAULT 0,
                    `towedAfterPrice` int(11) DEFAULT 0,
                    `towedToDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                    `towedOutBy` varchar(255) DEFAULT NULL,
                    `isTowedOut` tinyint(1) DEFAULT 0,
                    `vehicleGarage` int(11) DEFAULT 1,
                    `vehicleImpound` int(11) DEFAULT 1,
                    `impoundReason` varchar(255) DEFAULT NULL,
                    `gang` varchar(20) DEFAULT NULL,
                    `jobGrade` int(11) DEFAULT 0,
                    `jobPrivate` TEXT DEFAULT NULL,
                    `gangGrade` int(11) DEFAULT 0,
                    `gangPrivate` TEXT DEFAULT NULL,
                    `gangLocked` varchar(20) DEFAULT NULL,
                    `jobLocked` varchar(20) DEFAULT NULL,
                    `wanted` int(1) DEFAULT 0,
                    `billPrice` int(6) DEFAULT 0,
                    `description` longtext DEFAULT '',
                    PRIMARY KEY (`plate`)
                );
            ]],
            
            QB = [[
                CREATE TABLE IF NOT EXISTS player_vehicles (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `license` varchar(50) DEFAULT NULL,
                `citizenid` varchar(50) DEFAULT NULL,
                `vehicle` varchar(50) DEFAULT NULL,
                `hash` varchar(50) DEFAULT NULL,
                `mods` longtext DEFAULT NULL,
                `plate` varchar(50) NOT NULL,
                `vehicleid` int DEFAULT NULL,
                `fakeplate` varchar(50) DEFAULT NULL,
                `garage` varchar(50) DEFAULT NULL,
                `fuel` int(11) DEFAULT 100,
                `engine` float DEFAULT 1000,
                `body` float DEFAULT 1000,
                `state` int(11) DEFAULT 0,
                `depotprice` int(11) NOT NULL DEFAULT 0,
                `drivingdistance` int(50) DEFAULT NULL,
                `status` VARCHAR(300) DEFAULT NULL,
                `balance` int(11) NOT NULL DEFAULT 0,
                `paymentamount` int(11) NOT NULL DEFAULT 0,
                `paymentsleft` int(11) NOT NULL DEFAULT 0,
                `financetime` int(11) NOT NULL DEFAULT 0,
                `co_owner` varchar(255) DEFAULT NULL,
                `co_owner_name` varchar(255) DEFAULT NULL,
                `retrievable` tinyint(1) DEFAULT 1,
                `towedPrice` int(11) DEFAULT 0,
                `towedAfterPrice` int(11) DEFAULT 0,
                `towedToDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `towedOutBy` varchar(255) DEFAULT NULL,
                `isTowedOut` tinyint(1) DEFAULT 0,
                `vehicleGarage` int(11) DEFAULT 1,
                `vehicleImpound` int(11) DEFAULT 1,
                `impoundReason` varchar(255) DEFAULT NULL,
                `job` varchar(20) DEFAULT NULL,
                `jobGrade` int(11) DEFAULT 0,
                `jobPrivate` TEXT DEFAULT NULL,
                `gang` varchar(20) DEFAULT NULL,
                `gangGrade` int(11) DEFAULT 0,
                `gangPrivate` TEXT DEFAULT NULL,
                `gangLocked` varchar(20) DEFAULT NULL,
                `jobLocked` varchar(20) DEFAULT NULL,
                PRIMARY KEY (`id`)
                );
            ]]
        }
        
        -- Columns to add for ESX
        local columnsToAdd = {
            columns_ESX = {
                {name = "type", def = "varchar(20) NOT NULL DEFAULT 'car'"},
                {name = "parking", def = "varchar(60) DEFAULT NULL"},
                {name = "pound", def = "varchar(60) DEFAULT NULL"},
                {name = "mileage", def = "float DEFAULT '0'"},
                {name = "glovebox", def = "longtext DEFAULT NULL"},
                {name = "trunk", def = "longtext DEFAULT NULL"},
                {name = "vehicleid", def = "int(11) DEFAULT NULL"},
                {name = "stored", def = "tinyint(4) NOT NULL DEFAULT '0'"},
                {name = "co_owner", def = "varchar(255) DEFAULT NULL"},
                {name = "co_owner_name", def = "varchar(255) DEFAULT NULL"},
                {name = "retrievable", def = "tinyint(1) DEFAULT 1"},
                {name = "towedPrice", def = "int(11) DEFAULT 0"},
                {name = "towedAfterPrice", def = "int(11) DEFAULT 0"},
                {name = "towedToDate", def = "timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP"},
                {name = "towedOutBy", def = "varchar(255) DEFAULT NULL"},
                {name = "isTowedOut", def = "tinyint(1) DEFAULT 0"},
                {name = "vehicleGarage", def = "int(11) DEFAULT 1"},
                {name = "vehicleImpound", def = "int(11) DEFAULT 1"},
                {name = "impoundReason", def = "varchar(255) DEFAULT NULL"},
                {name = "job", def = "varchar(20) DEFAULT NULL"},
                {name = "gang", def = "varchar(20) DEFAULT NULL"},
                {name = "jobGrade", def = "int(11) DEFAULT 0"},
                {name = "jobPrivate", def = "TEXT DEFAULT NULL"},
                {name = "gangGrade", def = "int(11) DEFAULT 0"},
                {name = "gangPrivate", def = "TEXT DEFAULT NULL"},
                {name = "gangLocked", def = "varchar(20) DEFAULT NULL"},
                {name = "jobLocked", def = "varchar(20) DEFAULT NULL"},
                {name = "wanted", def = "int(1) DEFAULT 0"},
                {name = "billPrice", def = "int(6) DEFAULT 0"},
                {name = "description", def = "longtext DEFAULT ''"}
            },
            
            -- Columns to add for QBCore
            columns_QB = {
                {name = "type", def = "varchar(20) NOT NULL DEFAULT 'car'"},
                {name = "parking", def = "varchar(60) DEFAULT NULL"},
                {name = "pound", def = "varchar(60) DEFAULT NULL"},
                {name = "mileage", def = "float DEFAULT '0'"},
                {name = "glovebox", def = "longtext DEFAULT NULL"},
                {name = "trunk", def = "longtext DEFAULT NULL"},
                {name = "vehicleid", def = "int DEFAULT NULL"},
                {name = "state", def = "int(11) DEFAULT 0"},
                {name = "co_owner", def = "varchar(255) DEFAULT NULL"},
                {name = "co_owner_name", def = "varchar(255) DEFAULT NULL"},
                {name = "retrievable", def = "tinyint(1) DEFAULT 1"},
                {name = "towedPrice", def = "int(11) DEFAULT 0"},
                {name = "towedAfterPrice", def = "int(11) DEFAULT 0"},
                {name = "towedToDate", def = "timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP"},
                {name = "towedOutBy", def = "varchar(255) DEFAULT NULL"},
                {name = "isTowedOut", def = "tinyint(1) DEFAULT 0"},
                {name = "vehicleGarage", def = "int(11) DEFAULT 1"},
                {name = "vehicleImpound", def = "int(11) DEFAULT 1"},
                {name = "impoundReason", def = "varchar(255) DEFAULT NULL"},
                {name = "job", def = "varchar(20) DEFAULT NULL"},
                {name = "gang", def = "varchar(20) DEFAULT NULL"},
                {name = "jobGrade", def = "int(11) DEFAULT 0"},
                {name = "jobPrivate", def = "TEXT DEFAULT NULL"},
                {name = "gangGrade", def = "int(11) DEFAULT 0"},
                {name = "gangPrivate", def = "TEXT DEFAULT NULL"},
                {name = "gangLocked", def = "varchar(20) DEFAULT NULL"},
                {name = "jobLocked", def = "varchar(20) DEFAULT NULL"}
            }
        }
        
        -- Detect framework
        local frameworkType = "ESX"
        if QBCore or QBox then
            frameworkType = "QB"
        end
        
        -- Create vehicle table based on framework
        local tableQuery = frameworkTables[frameworkType]
        if tableQuery then
            MySQL.execute(tableQuery, {}, function(result) end)
        else
            print("^1[Error:] ^0Unsupported framework specified")
        end
        
        -- Get vehicle table name
        local tableName = Fr.Table or ""
        
        -- Add missing columns to vehicle table
        for _, column in ipairs(columnsToAdd["columns_" .. frameworkType]) do
            ensureColumnExists(tableName, column.name, column.def)
        end
    end
    
    -- Start sequential table creation
    createTablesSequentially(1)
end

-- Function to create tables sequentially
function createTablesSequentially(index)
    if index > #tableQueries then
        if ServerConfig.AutoMysql then
            print("^2[AutoSQL] ^0All queries executed successfully.")
        else
            print("^2[AutoSQL] ^0Automatic database is disabled, please make sure to create all tables manually!")
        end
        
        -- Wait for Framework with timeout
        local attempts = 100
        while Framework == nil do
            Wait(1000)
            attempts = attempts - 1
            
            if attempts == 50 then
                print("[FRAMEWORK] Still waiting... attempts left: " .. attempts)
            end
            
            if attempts <= 0 then
                print("[FRAMEWORK ISSUE] Unable to load framework properly, please check framework files.")
                return
            end
        end
        
        -- Add missing columns to garage system tables
        if ServerConfig.AutoMysql then
            -- Garage table columns
            local garageColumns = {
                {name = "zpoints", def = "VARCHAR(300) NOT NULL DEFAULT '{\"minZ\":0.0,\"maxZ\":0.0}'"},
                {name = "onespawn", def = "VARCHAR(300) NOT NULL DEFAULT '{\"x\": 0,\"y\": 0,\"z\": 0,\"w\": 0}'"},
                {name = "GangName", def = "VARCHAR(300) DEFAULT NULL"},
                {name = "GangGrade", def = "int(11) DEFAULT 0"},
                {name = "GangMode", def = "VARCHAR(300) NOT NULL DEFAULT 'owned'"},
                {name = "blipDisabled", def = "tinyint DEFAULT 0"}
            }
            
            for _, column in ipairs(garageColumns) do
                ensureColumnExists("mtgarages_garages", column.name, column.def)
            end
            
            -- Impound table columns
            local impoundColumns = {
                {name = "blipDisabled", def = "tinyint DEFAULT 0"}
            }
            
            for _, column in ipairs(impoundColumns) do
                ensureColumnExists("mtgarages_impounds", column.name, column.def)
            end
        end
        
        -- Check version and load global states
        Wait(2000)
        loadGlobalStates()
        return
    end
    
    if not ServerConfig.AutoMysql then
        return
    end
    
    -- Execute current query and move to next
    local query = tableQueries[index]
    MySQL.execute(query, {}, function()
        createTablesSequentially(index + 1)
    end)
end

-- Initialize when MySQL is ready
MySQL.ready(function()
    createTableIfNotExists()
end)



-- Function to insert default garage and impound locations
function insertDefaultLocations()
    local garagesQuery = [[
    INSERT IGNORE INTO `mtgarages_garages` (`Label`, `Type`, `Coords`, `JobName`, `JobGrade`, `JobMode`, `Radius`, `isPrivate`, `privatePlayers`) VALUES
        ('Yellow Jack', 'car', '{"CenterOfZone":{"x":2002.5069580078128,"y":3068.250732421875,"z":45.2247085571289,"w":221.1068878173828},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 15, 0, '[]'),
        ('Legion Square', 'car', '{"AccessPoint":{"z":0,"y":0,"x":0,"w":0},"CenterOfZone":{"z":28.87832260131836,"y":-791.0386962890625,"x":225.1527557373047,"w":268.1744384765625}}', NULL, 0, 'owned', 17, 0, '[]'),
        ('UwU Cafe', 'car', '{"AccessPoint":{"y":0,"z":0,"w":0,"x":0},"CenterOfZone":{"y":-1118.1075439453126,"z":20.45190811157226,"w":60.4852066040039,"x":-578.6986694335938}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Del Perro Motel', 'car', '{"AccessPoint":{"y":0,"z":0,"w":0,"x":0},"CenterOfZone":{"y":-660.3541870117188,"z":27.15799903869629,"w":314.8405456542969,"x":-1474.28125}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('Playa Vista', 'car', '{"AccessPoint":{"y":0,"z":0,"w":0,"x":0},"CenterOfZone":{"y":-321.2774963378906,"z":46.28054428100586,"w":139.56690979003907,"x":-1995.3624267578126}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('Del Perro Molo', 'sea', '{"CenterOfZone":{"y":-1193.79052734375,"z":-0.022869348526,"w":151.6476287841797,"x":-1660.8853759765626},"AccessPoint":{"y":-1124.3619384765626,"z":1.50326204299926,"w":123.47409057617188,"x":-1617.545654296875}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Vinewood Clinton', 'car', '{"CenterOfZone":{"y":173.0720977783203,"z":95.58731842041016,"w":152.56748962402345,"x":635.1901245117188},"AccessPoint":{"y":0,"z":0,"w":0,"x":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Havick Avenue', 'car', '{"CenterOfZone":{"w":339.81927490234377,"x":324.9058837890625,"y":-210.58197021484376,"z":52.2604751586914},"AccessPoint":{"w":0,"x":0,"y":0,"z":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Alta Street', 'car', '{"CenterOfZone":{"w":281.4486999511719,"x":89.44010925292969,"y":-206.88323974609376,"z":52.66457366943359},"AccessPoint":{"w":0,"x":0,"y":0,"z":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Vitus Boulevard', 'car', '{"CenterOfZone":{"w":37.44617080688476,"x":-356.98126220703127,"y":-91.69918823242188,"z":43.82431030273437},"AccessPoint":{"w":0,"x":0,"y":0,"z":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Arcadius', 'car', '{"CenterOfZone":{"w":159.14141845703126,"x":-162.8598175048828,"y":-629.5092163085938,"z":30.59811019897461},"AccessPoint":{"w":0,"x":0,"y":0,"z":0}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('Job Center', 'car', '{"CenterOfZone":{"w":336.12750244140627,"x":-305.0691223144531,"y":-981.8150024414063,"z":29.25400161743164},"AccessPoint":{"w":0,"x":0,"y":0,"z":0}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('Benny''s', 'car', '{"CenterOfZone":{"w":179.6092071533203,"x":-183.46331787109376,"y":-1294.8294677734376,"z":29.46960258483886},"AccessPoint":{"w":0,"x":0,"y":0,"z":0}}', NULL, 0, 'owned', 15, 0, '[]'),
        ('Medical Center', 'car', '{"CenterOfZone":{"w":319.3375244140625,"x":309.8219909667969,"y":-1376.282958984375,"z":30.0175666809082},"AccessPoint":{"w":0,"x":0,"y":0,"z":0}}', NULL, 0, 'owned', 8, 0, '[]'),
        ('Davis Avenue', 'car', '{"CenterOfZone":{"w":141.37962341308595,"x":248.34539794921876,"y":-1511.647216796875,"z":27.31739807128906},"AccessPoint":{"w":0,"x":0,"y":0,"z":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Planes Hangar', 'air', '{"AccessPoint":{"w":146.03408813476566,"z":12.94506072998046,"y":-2956.856201171875,"x":-941.9015502929688},"CenterOfZone":{"w":55.43372344970703,"z":12.94506931304931,"y":-2985.9814453125,"x":-960.2349243164063}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Legion Square #2', 'car', '{"CenterOfZone":{"w":282.928466796875,"z":29.19233512878418,"y":-1070.7064208984376,"x":118.16385650634766},"AccessPoint":{"w":0,"z":0,"y":0,"x":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('LS Police', 'car', '{"CenterOfZone":{"y":-1638.7564697265626,"x":409.2654724121094,"w":195.13726806640626,"z":29.29193496704101},"AccessPoint":{"y":0,"x":0,"w":0,"z":0}}', NULL, 0, 'owned', 8, 0, '[]'),
        ('Big Goods', 'car', '{"CenterOfZone":{"x":862.9686279296875,"y":-894.6160278320313,"z":24.78264999389648,"w":181.97000122070313},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 14, 0, '[]'),
        ('Mirror Park', 'car', '{"CenterOfZone":{"x":1152.6629638671876,"y":-478.7081604003906,"z":65.33244323730469,"w":168.3243408203125},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 12, 0, '[]'),
        ('Diamond Casino', 'car', '{"CenterOfZone":{"x":901.705322265625,"y":-54.59668350219726,"z":77.93757629394531,"w":146.6295928955078},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 25, 0, '[]'),
        ('Pacific Bank', 'car', '{"CenterOfZone":{"x":293.01739501953127,"y":176.2847442626953,"z":103.28030395507813,"w":70.51278686523438},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 7, 0, '[]'),
        ('Vinewood Hills', 'car', '{"CenterOfZone":{"x":-47.18313217163086,"y":216.9972686767578,"z":105.72626495361328,"w":255.27581787109376},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 7, 0, '[]'),
        ('Tequilla Club', 'car', '{"CenterOfZone":{"x":-575.3406982421875,"y":325.1517028808594,"z":83.80779266357422,"w":264.7679748535156},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Eclipse Hotel', 'car', '{"CenterOfZone":{"x":-610.4705200195313,"y":190.5902557373047,"z":69.35404968261719,"w":92.13227081298828},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Boulevard Del Perro', 'car', '{"CenterOfZone":{"x":-739.4837646484375,"y":-64.96302795410156,"z":40.92625045776367,"w":111.6790771484375},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('Life Invader', 'car', '{"CenterOfZone":{"x":-1057.4989013671876,"y":-222.96322631835936,"z":37.21170043945312,"w":53.17665481567383},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 6, 0, '[]'),
        ('Las Cuadras Bar', 'car', '{"CenterOfZone":{"x":-1446.305419921875,"y":-360.8878173828125,"z":42.85252380371094,"w":149.39361572265626},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('LS Airport', 'car', '{"CenterOfZone":{"x":-976.03076171875,"y":-2701.060546875,"z":13.03667068481445,"w":70.69525909423828},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('Great Ocean', 'car', '{"CenterOfZone":{"x":-3149.150390625,"y":1085.7235107421876,"z":19.87111473083496,"w":340.73345947265627},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 14, 0, '[]'),
        ('Sandy Shores', 'car', '{"CenterOfZone":{"x":1514.30615234375,"y":3753.815185546875,"z":33.28375244140625,"w":208.24110412597657},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('Grapeseed Station', 'car', '{"CenterOfZone":{"x":1680.7410888671876,"y":4924.26513671875,"z":41.24620056152344,"w":339.834716796875},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 10, 0, '[]'),
        ('Paleto Mechanic', 'car', '{"CenterOfZone":{"x":132.4525146484375,"y":6598.6259765625,"z":31.04403305053711,"w":159.6817626953125},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 20, 0, '[]'),
        ('Paleto European Auto', 'car', '{"CenterOfZone":{"x":-199.9658660888672,"y":6217.06005859375,"z":30.66302871704101,"w":159.0889129638672},"AccessPoint":{"x":0,"y":0,"z":0,"w":0}}', NULL, 0, 'owned', 20, 0, '[]')
    ]]
    
    local impoundsQuery = [[
    INSERT IGNORE INTO `mtgarages_impounds` (`Label`, `Type`, `Coords`, `AllowedJobs`) VALUES
        ('LS Police', 'car', '{"x":403.6280212402344,"w":190.83750915527345,"z":28.29195404052734,"y":-1624.9676513671876}', '[]');
    ]]
    
    MySQL.execute(garagesQuery, {}, function()
        print("^2[AutoSQL] ^0Default Garage Locations inserted successfully.")
    end)
    
    MySQL.execute(impoundsQuery, {}, function()
        print("^2[AutoSQL] ^0Default Impound Locations inserted successfully.")
        Wait(1000)
        print("^2[AutoSQL] ^0Restart script to save changes.")
    end)
end

-- Register command to insert default locations (console only)
RegisterCommand("insertDefaultLocations", function(source)
    if source == 0 then -- Console only
        insertDefaultLocations()
    end
end)