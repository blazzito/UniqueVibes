ESX = exports["es_extended"]:getSharedObject()
local PREFIX = Config.Prefix or "char"
local arrivalVehicles = {}
local isArriving = {}
local pendingPacks = {}

local function Debug(msg)
    if Config.Debug then
        print(("[esx_multicharacter] DEBUG: %s"):format(msg))
    end
end

-- PERSISTENCE SYSTEM (DATABASE)
local function GetConfigForDB()
    local c = Config.WelcomeVehicle
    local claim = type(c.claimPoint) == 'table' and c.claimPoint or { c.claimPoint.x, c.claimPoint.y, c.claimPoint.z }
    local spawn = type(c.spawnPoint) == 'table' and c.spawnPoint or { c.spawnPoint.x, c.spawnPoint.y, c.spawnPoint.z, c.spawnPoint.w }
    
    return {
        packs = Config.WelcomePacks,
        global = {
            claimPoint = claim,
            spawnPoint = spawn,
            labelClaim = c.labelClaim,
            labelConfirm = c.labelConfirm,
            labelOwned = c.labelOwned,
            instructions = c.instructions
        }
    }
end

local function LoadConfigFromDB()
    local result = MySQL.single.await("SELECT data FROM multicharacter_config WHERE id = 1")
    if result and result.data then
        local data = json.decode(result.data)
        if data then
            if data.packs then Config.WelcomePacks = data.packs end
            if data.global then
                local g = data.global
                Config.WelcomeVehicle.claimPoint = vec3(g.claimPoint[1], g.claimPoint[2], g.claimPoint[3])
                Config.WelcomeVehicle.spawnPoint = vec4(g.spawnPoint[1], g.spawnPoint[2], g.spawnPoint[3], g.spawnPoint[4])
                Config.WelcomeVehicle.labelClaim = g.labelClaim
                Config.WelcomeVehicle.labelConfirm = g.labelConfirm
                Config.WelcomeVehicle.labelOwned = g.labelOwned
                Config.WelcomeVehicle.instructions = g.instructions
            end
            Debug("Configuración cargada desde la Base de Datos.")
        end
    else
        -- Initial insert if empty
        local initialData = json.encode(GetConfigForDB())
        MySQL.insert.await("INSERT IGNORE INTO multicharacter_config (id, data) VALUES (1, ?)", { initialData })
        Debug("Base de datos de configuración inicializada con valores por defecto.")
    end
end

local function SaveConfigToDB()
    local data = json.encode(GetConfigForDB())
    MySQL.update.await("UPDATE multicharacter_config SET data = ? WHERE id = 1", { data })
    
    -- Sync with all clients
    TriggerClientEvent('esx_multicharacter:SyncConfig', -1, GetConfigForDB())
end

MySQL.ready(function()
    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS multicharacter_config (
            id INT PRIMARY KEY DEFAULT 1,
            data LONGTEXT NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
    ]])

    LoadConfigFromDB()
    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS multicharacter_slots (
            identifier VARCHAR(60) NOT NULL,
            slots INT(11) NOT NULL DEFAULT 0,
            PRIMARY KEY (identifier),
            INDEX slots (slots)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
    ]])

    local columns = {
        { name = "firstname", type = "VARCHAR(50) DEFAULT NULL" },
        { name = "lastname", type = "VARCHAR(50) DEFAULT NULL" },
        { name = "dateofbirth", type = "VARCHAR(10) DEFAULT NULL" },
        { name = "sex", type = "VARCHAR(1) DEFAULT NULL" },
        { name = "height", type = "INT DEFAULT 0" },
        { name = "nationality", type = "VARCHAR(50) DEFAULT 'N/A'" },
        { name = "ssn", type = "VARCHAR(10) DEFAULT NULL" },
        { name = "metadata", type = "LONGTEXT DEFAULT '{}'" },
        { name = "status", type = "LONGTEXT DEFAULT '[]'" },
        { name = "discord_id", type = "VARCHAR(50) DEFAULT NULL" },
        { name = "discord_name", type = "VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL" },
        { name = "steam_name", type = "VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL" }
    }

    for _, col in ipairs(columns) do
        MySQL.query.await(string.format("ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `%s` %s", col.name, col.type))
    end

    MySQL.query.await("ALTER TABLE `users` MODIFY COLUMN `discord_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL")
    MySQL.query.await("ALTER TABLE `users` MODIFY COLUMN `steam_name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL")
    
    while not next(ESX.Jobs) do
        Wait(500)
        ESX.Jobs = ESX.GetJobs()
    end
end)

local function GetIdentifier(source)
    local identifier = GetPlayerIdentifierByType(source, Config.Identifier)
    if not identifier then return nil end
    return identifier:gsub(Config.Identifier .. ":", "")
end

local function GetTotalSlots(source, identifier)
    local dbSlots = MySQL.scalar.await("SELECT slots FROM multicharacter_slots WHERE identifier = ?", { identifier })
    return dbSlots or Config.Maxslots
end

local function GenerateSSN()
    local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local ssn = ""
    for i = 1, 8 do
        local rand = math.random(#characters)
        ssn = ssn .. string.sub(characters, rand, rand)
    end
    return ssn
end

lib.callback.register('esx_multicharacter:SetupSession', function(source)
    local identifier = GetIdentifier(source)
    if not identifier then return { characters = {}, slots = 0, hasCharacters = false } end

    local status, slotData = pcall(function()
        return MySQL.single.await("SELECT slots FROM multicharacter_slots WHERE identifier = ?", { identifier })
    end)
    
    if not status then 
        Debug(("ERROR: Fallo al obtener slots para %s"):format(identifier))
        slotData = nil 
    end

    local status2, results = pcall(function()
        return MySQL.query.await([[
            SELECT identifier, accounts, job, job_grade, firstname, lastname, dateofbirth, sex, skin, position, ssn 
            FROM users 
            WHERE identifier LIKE ?
        ]], { PREFIX .. "%:" .. identifier })
    end)

    if not status2 or not results then
        Debug(("ERROR: Fallo al obtener personajes para %s"):format(identifier))
        return { 
            characters = {}, 
            slots = slotData and slotData.slots or Config.Maxslots, 
            hasCharacters = false,
            packs = Config.WelcomePacks,
            global = {
                claimPoint = { Config.WelcomeVehicle.claimPoint.x, Config.WelcomeVehicle.claimPoint.y, Config.WelcomeVehicle.claimPoint.z },
                spawnPoint = { Config.WelcomeVehicle.spawnPoint.x, Config.WelcomeVehicle.spawnPoint.y, Config.WelcomeVehicle.spawnPoint.z, Config.WelcomeVehicle.spawnPoint.w },
                labelClaim = Config.WelcomeVehicle.labelClaim,
                labelConfirm = Config.WelcomeVehicle.labelConfirm,
                labelOwned = Config.WelcomeVehicle.labelOwned,
                instructions = Config.WelcomeVehicle.instructions
            }
        }
    end

    local characters = {}
    for i = 1, #results do
        local v = results[i]
        local accounts = json.decode(v.accounts) or {}
        local id = tonumber(v.identifier:match(PREFIX .. "(%d+):"))
        
        local jobLabel = v.job
        local gradeLabel = tostring(v.job_grade)
        if ESX.Jobs[v.job] then
            jobLabel = ESX.Jobs[v.job].label
            if ESX.Jobs[v.job].grades[gradeLabel] then
                gradeLabel = ESX.Jobs[v.job].grades[gradeLabel].label
            end
        end

        characters[id] = {
            id = id,
            bank = accounts.bank or 0,
            money = accounts.money or 0,
            job = {
                name = v.job,
                label = jobLabel,
                grade_label = gradeLabel
            },
            firstname = v.firstname,
            lastname = v.lastname,
            dateofbirth = v.dateofbirth,
            skin = v.skin and json.decode(v.skin) or {},
            sex = v.sex == 'm',
            coords = v.position and json.decode(v.position) or nil,
            ssn = v.ssn
        }
    end

    local hasCharacters = #results > 0
    local slots = slotData and slotData.slots or Config.Maxslots

    Debug(("Session Setup para %s: %s personajes encontrados, %s slots"):format(identifier, #results, slots))

    return {
        characters = characters,
        slots = slots,
        hasCharacters = hasCharacters,
        packs = Config.WelcomePacks,
        global = {
            claimPoint = { Config.WelcomeVehicle.claimPoint.x, Config.WelcomeVehicle.claimPoint.y, Config.WelcomeVehicle.claimPoint.z },
            spawnPoint = { Config.WelcomeVehicle.spawnPoint.x, Config.WelcomeVehicle.spawnPoint.y, Config.WelcomeVehicle.spawnPoint.z, Config.WelcomeVehicle.spawnPoint.w },
            labelClaim = Config.WelcomeVehicle.labelClaim,
            labelConfirm = Config.WelcomeVehicle.labelConfirm,
            labelOwned = Config.WelcomeVehicle.labelOwned,
            instructions = Config.WelcomeVehicle.instructions
        }
    }
end)

lib.callback.register('esx_multicharacter:getCurrentCoords', function(source)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    return { x = coords.x, y = coords.y, z = coords.z, h = heading }
end)

local function FetchDiscordName(discordId, targetIdentifier)
    if not Config.DiscordToken or Config.DiscordToken == "" then return end
    
    local userId = discordId:gsub("discord:", "")
    local endpoint = ("https://discord.com/api/v10/users/%s"):format(userId)
    
    PerformHttpRequest(endpoint, function(errorCode, resultData, resultHeaders)
        if errorCode == 200 and resultData then
            local data = json.decode(resultData)
            local name = data.global_name or data.username
            
            if name then
                MySQL.update("UPDATE users SET discord_name = ? WHERE identifier = ?", { name, targetIdentifier })
                Debug(("Discord Name actualizado para %s: %s"):format(targetIdentifier, name))
            end
        else
            Debug(("Error al obtener nombre de Discord para %s. Código: %s"):format(userId, tostring(errorCode)))
        end
    end, "GET", "", { ["Authorization"] = "Bot " .. Config.DiscordToken, ["Content-Type"] = "application/json" })
end

local function GetDiscordInfo(source)
    for _, id in ipairs(GetPlayerIdentifiers(source)) do
        if string.find(id, "discord:") then
            return id
        end
    end
    return nil
end

RegisterNetEvent('esx_multicharacter:CreateCharacters', function(data)
    local src = source
    local identifier = GetIdentifier(src)
    if not identifier then return end

    local totalAllowed = GetTotalSlots(src, identifier)

    if data.slot > totalAllowed then
        Debug(("%s intentó usar un slot bloqueado %s"):format(GetPlayerName(src), data.slot))
        DropPlayer(src, "Explotación detectada: Slot fuera de límites.")
        return
    end

    if not data.firstName or not data.lastName or not data.dob then
        Debug(("ERROR: Faltan datos de identidad para %s"):format(identifier))
        return
    end

    local charIdentifier = ("%s%s:%s"):format(PREFIX, data.slot, identifier)
    
    MySQL.query.await("DELETE FROM users WHERE identifier = ?", { charIdentifier })

    local dob = tostring(data.dob)
    local d, m, y = dob:match("(%d%d)(%d%d)(%d%d%d%d)")
    local formattedDob = d and ("%s-%s-%s"):format(y, m, d) or dob

    local identity = {
        firstname = data.firstName,
        lastname = data.lastName,
        dateofbirth = formattedDob,
        sex = (tostring(data.gender):lower() == 'male') and 'm' or 'f',
        height = data.height or 180,
        ssn = GenerateSSN(),
        nationality = data.nationality or "N/A"
    }

    local defaultAccounts = json.encode({bank = 5000, money = 2500})
    local start = Config.NewCharacterSpawn.startcoords
    local defaultPosition = json.encode({ x = start.x, y = start.y, z = start.z, heading = start.w })
    local defaultSkin = identity.sex == 'm' and json.encode(Config.DefaultSkin["m"]) or json.encode(Config.DefaultSkin["f"])
    
    pendingPacks[src] = data.pack or 'starter'

    local discordId = GetDiscordInfo(src)

    local success = MySQL.insert.await([[
        INSERT INTO users (
            identifier, firstname, lastname, dateofbirth, sex, height, nationality, ssn, 
            skin, accounts, position, inventory, loadout, status, metadata, job, job_grade, `group`, 
            discord_id, steam_name
        ) VALUES (
            ?, ?, ?, ?, ?, ?, ?, ?, 
            ?, ?, ?, '[]', '[]', '[]', '[]', 'unemployed', 0, 'user',
            ?, ?
        )
    ]], {
        charIdentifier, identity.firstname, identity.lastname, identity.dateofbirth, identity.sex, identity.height, identity.nationality, identity.ssn,
        defaultSkin, defaultAccounts, defaultPosition, discordId, GetPlayerName(src)
    })

    if not success then
        Debug("ERROR CRÍTICO: No se pudo insertar el usuario en la base de datos.")
        return
    end
    
    if discordId then
        FetchDiscordName(discordId, charIdentifier)
    end
    
    MySQL.query.await("INSERT IGNORE INTO multicharacter_slots (identifier, slots) VALUES (?, ?)", { 
        identifier, Config.Maxslots 
    })

    Debug("Personaje creado exitosamente: " .. charIdentifier)

    TriggerEvent('esx:onPlayerJoined', src, PREFIX .. data.slot)
    SetPlayerRoutingBucket(src, src)
    
    SetTimeout(1500, function()
        TriggerClientEvent('esx_multicharacter:newCharacterCreated', src, identity.sex)
    end)
end)

RegisterNetEvent("esx_multicharacter:CharacterChosen", function(char)
    local src = source
    local identifier = GetIdentifier(src)
    if not identifier or not char.id then return end

    local charIdentifier = ("%s%s:%s"):format(PREFIX, char.id, identifier)

    local xPlayer = ESX.GetPlayerFromIdentifier(charIdentifier)
    if xPlayer then
        if xPlayer.source ~= src then
            return DropPlayer(src, "Sesión activa detectada en otra instancia.")
        else
            TriggerEvent('esx:playerLogout', src)
            Wait(500)
        end
    end

    local discordId = GetDiscordInfo(src)
    local steamName = GetPlayerName(src)
    
    if discordId then
        MySQL.update("UPDATE users SET discord_id = ?, steam_name = ? WHERE identifier = ?", { discordId, steamName, charIdentifier })
        FetchDiscordName(discordId, charIdentifier)
    else
        MySQL.update("UPDATE users SET steam_name = ? WHERE identifier = ?", { steamName, charIdentifier })
    end

    Debug(("Jugador %s seleccionó personaje %s. Moviendo a bucket principal: %s"):format(GetPlayerName(src), charIdentifier, Config.Routingbucket))
    SetPlayerRoutingBucket(src, Config.Routingbucket or 0)
    TriggerEvent("esx:onPlayerJoined", src, PREFIX .. char.id)
end)

local function DoesColumnExist(tableName, columnName)
    local status, result = pcall(function()
        return MySQL.query.await(string.format("SHOW COLUMNS FROM `%s` LIKE ?", tableName), { columnName })
    end)
    return status and result and #result > 0
end

lib.callback.register('esx_multicharacter:DeleteCharacters', function(source, data)
    local src = source
    local charId = tonumber(data.id)
    local identifier = GetIdentifier(src)
    
    if not identifier or not charId then 
        Debug("ERROR: Intento de borrado sin identificador o ID de personaje válido.")
        return false 
    end

    local charIdentifier = ("%s%s:%s"):format(PREFIX, charId, identifier)
    Debug("Iniciando borrado robusto para identificador: " .. charIdentifier)
    
    local success = false
    
    for _, info in ipairs(Config.CleanupTables) do
        if DoesColumnExist(info.table, info.column) then
            local status, result = pcall(function()
                return MySQL.query.await(string.format("DELETE FROM `%s` WHERE `%s` = ?", info.table, info.column), { charIdentifier })
            end)
            
            if status and result then
                if info.table == "users" and result.affectedRows and result.affectedRows > 0 then 
                    success = true 
                    Debug("Borrado exitoso de tabla principal: users")
                end
            else
                if not status then
                    print(("[esx_multicharacter] ERROR SQL en tabla %s: %s"):format(info.table, tostring(result)))
                end
            end
        else
            Debug(("OMITIDO: Tabla %s o columna %s no existe."):format(info.table, info.column))
        end
    end

    print(("[esx_multicharacter] Borrado finalizado para %s. Exito: %s"):format(charIdentifier, tostring(success)))
    return success
end)

-- SECURITY & COOLDOWNS
local dbCooldown = {}
local function CheckCooldown(src)
    if not dbCooldown[src] then dbCooldown[src] = 0 end
    if dbCooldown[src] > GetGameTimer() then 
        TriggerClientEvent('esx:showNotification', src, 'Por favor, espera un momento antes de volver a intentar.')
        return false 
    end
    dbCooldown[src] = GetGameTimer() + 3000
    return true
end

RegisterNetEvent('Update:RoutingBucket', function(targetBucket)
    local src = source
    local newBucket = tonumber(targetBucket) or src
    
    -- SECURITY VALIDATION: Prevent unauthorized bucket escapes
    -- Allowed: 
    -- 1. Going into a private bucket based on its own source ID (Isolation)
    -- 2. Returning to the main bucket (0)
    -- 3. Any bucket >= 2000 (Reserved for dynamic isolation)
    -- 4. Admins can go anywhere
    local isAuthorized = (newBucket == 0) or (newBucket == src) or (newBucket >= 2000) or IsAdmin(src)
    
    if not isAuthorized then
        Debug(("ADVERTENCIA: %s intentó entrar en un bucket no autorizado: %s"):format(GetPlayerName(src), tostring(newBucket)))
        return DropPlayer(src, "Inyección de Routing Bucket detectada.")
    end

    SetPlayerRoutingBucket(src, newBucket)
    Debug(("Bucket de jugador %s actualizado a %s"):format(GetPlayerName(src), newBucket))
end)

RegisterNetEvent('Exit:Game', function()
    DropPlayer(source, 'Saliendo del servidor.')
end)

RegisterNetEvent('esx_multicharacter:finishArrival', function(netId)
    local src = source
    if not isArriving[src] then return end
    
    Debug(("Finalizando llegada para %s. Moviendo a bucket 0."):format(GetPlayerName(src)))
    
    isArriving[src] = false
    Player(src).state:set('isArriving', false, true)
    
    SetPlayerRoutingBucket(src, 0)
    
    if netId then
        local entity = NetworkGetEntityFromNetworkId(netId)
        if DoesEntityExist(entity) then
            SetEntityRoutingBucket(entity, 0)
        end
    end

    arrivalVehicles[src] = nil
    
    TriggerClientEvent('esx_multicharacter:arrivalConfirmed', src)
end)

RegisterNetEvent("esx_multicharacter:GiveItems", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    -- VALIDATION: Ensure player is actually in the creation flow
    if not pendingPacks[src] then
        Debug(("%s intentó activar GiveItems maliciosamente."):format(xPlayer.name))
        return 
    end

    local packId = pendingPacks[src]
    pendingPacks[src] = nil -- Anti-duplicate
    
    local pack = nil
    for i=1, #Config.WelcomePacks do
        if Config.WelcomePacks[i].id == packId then
            pack = Config.WelcomePacks[i]
            break
        end
    end
    
    if pack then
        Debug(("Entregando Pack de Bienvenida '%s' a %s"):format(packId, xPlayer.name))
        xPlayer.addAccountMoney('money', pack.money)
        
        for i = 1, #pack.items do
            local item = pack.items[i]
            if Config.OxInventory then
                exports.ox_inventory:AddItem(src, item.name, item.amount)
            else
                xPlayer.addInventoryItem(item.name, item.amount)
            end
        end

        if pack.vehicle then
            local plate = "INI" .. math.random(100, 999)
            MySQL.insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, job, `stored`) VALUES (?, ?, ?, ?, ?, ?)', {
                xPlayer.identifier,
                plate,
                json.encode({ model = GetHashKey(pack.vehicle), plate = plate }),
                'car',
                'civ',
                0
            })
        end
    end
end)

RegisterNetEvent('esx_multicharacter:registerArrivalVehicle', function(netId)
    local src = source
    local timer = GetGameTimer()
    local entity = 0
    
    while entity == 0 and GetGameTimer() - timer < 5000 do
        entity = NetworkGetEntityFromNetworkId(netId)
        if entity == 0 then Wait(100) end
    end
    
    if not entity or entity == 0 or not DoesEntityExist(entity) then 
        Debug(("Fallo en registro: NetID %s no reconocido para %s tras 5s"):format(netId, GetPlayerName(src)))
        return 
    end

    Debug(("Vehículo (NetID %s) registrado exitosamente para cliente %s."):format(netId, src))
    
    arrivalVehicles[src] = entity
    isArriving[src] = true
    Player(src).state:set('isArriving', true, true)

    local targetBucket = 2000 + src
    pcall(SetEntityRoutingBucket, entity, targetBucket)
    pcall(SetEntityDistanceCullingRadius, entity, 10000.0)

    CreateThread(function()
        local playerState = Player(src).state
        while playerState.isArriving and DoesEntityExist(entity) do
            if GetPlayerRoutingBucket(src) ~= targetBucket then 
                pcall(SetPlayerRoutingBucket, src, targetBucket) 
            end
            if GetEntityRoutingBucket(entity) ~= targetBucket then 
                pcall(SetEntityRoutingBucket, entity, targetBucket) 
            end
            Wait(1000) 
        end
        Debug(("Bucle de aislamiento finalizado para %s."):format(GetPlayerName(src)))
    end)
end)

RegisterNetEvent('esx_multicharacter:SetVehicleBucket', function(netId, bucket)
    local src = source
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return end
    
    local ped = GetPlayerPed(src)
    local pPos, vPos = GetEntityCoords(ped), GetEntityCoords(entity)
    if #(pPos - vPos) > 15.0 then
        Debug(("%s intentó mover vehículo distante %s"):format(GetPlayerName(src), netId))
        return
    end

    -- SECURITY: Only allow moving to own bucket or 0
    if bucket ~= 0 and bucket ~= (2000 + src) and not IsAdmin(src) then
        return 
    end

    SetEntityRoutingBucket(entity, bucket)
end)

RegisterNetEvent('esx_multicharacter:relog', function()
    local src = source
    Debug(("Solicitud de relog recibida para %s"):format(GetPlayerName(src)))
    TriggerEvent('esx:playerLogout', src)
end)

MySQL.ready(function()
    Wait(1000)
    local xPlayers = ESX.GetExtendedPlayers()
    for _, xPlayer in ipairs(xPlayers) do
        Debug(("Forzando relog para jugador existente: %s"):format(xPlayer.name))
        TriggerClientEvent('esx_multicharacter:relog', xPlayer.source)
    end
end)

local function IsAdmin(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end
    local group = xPlayer.getGroup()
    return group == 'admin' or group == 'superadmin' or group == 'owner'
end

RegisterCommand('adminslot', function(source)
    if source == 0 then return end
    if IsAdmin(source) then
        TriggerClientEvent('esx_multicharacter:openAdminMenu', source)
    else
        TriggerClientEvent('esx:showNotification', source, 'No tienes permisos para esto.')
    end
end, false)

-- OPTIMIZED: GetAdminUsers with LEFT JOIN to avoid SQL in loops
lib.callback.register('esx_multicharacter:GetAdminUsers', function(source, query)
    if not IsAdmin(source) then return {} end

    local processedUsers = {}
    local xPlayers = ESX.GetExtendedPlayers()
    local onlineIdentifiers = {}

    for _, xP in ipairs(xPlayers) do
        local baseId = GetIdentifier(xP.source)
        if baseId then
            onlineIdentifiers[baseId] = xP.source
        end
    end
    
    if not query or query == "" then
        for baseId, srcId in pairs(onlineIdentifiers) do
            local xP = ESX.GetPlayerFromId(srcId)
            local dbSlots = MySQL.scalar.await("SELECT slots FROM multicharacter_slots WHERE identifier = ?", { baseId })
            
            table.insert(processedUsers, {
                identifier = baseId,
                firstname = xP.get('firstName') or "Desconocido",
                lastname = xP.get('lastName') or "",
                slots = dbSlots or Config.Maxslots,
                online = true,
                source = srcId
            })
        end
        return processedUsers
    end

    local searchTerm = "%" .. string.lower(query) .. "%"
    
    -- PERFORMANCE FIX: Single query with JOIN to get slots
    local results = MySQL.query.await([[
        SELECT u.identifier, u.firstname, u.lastname, u.discord_name, u.discord_id, u.steam_name, s.slots
        FROM users u 
        LEFT JOIN multicharacter_slots s ON (SUBSTRING_INDEX(u.identifier, ':', -1) = s.identifier)
        WHERE LOWER(u.identifier) LIKE ? OR LOWER(u.firstname) LIKE ? OR LOWER(u.lastname) LIKE ? 
           OR LOWER(u.discord_name) LIKE ? OR LOWER(u.discord_id) LIKE ? OR LOWER(u.steam_name) LIKE ?
        LIMIT 30
    ]], { searchTerm, searchTerm, searchTerm, searchTerm, searchTerm, searchTerm })

    if not results then return {} end

    local addedIdentifiers = {}

    for _, v in ipairs(results) do
        local baseIdentifier = v.identifier:gsub(PREFIX .. "%d+:", "")
        
        if not addedIdentifiers[baseIdentifier] then
            local sourceId = onlineIdentifiers[baseIdentifier]

            table.insert(processedUsers, {
                identifier = baseIdentifier,
                firstname = v.firstname, 
                lastname = v.lastname,
                slots = v.slots or Config.Maxslots,
                online = sourceId ~= nil,
                source = sourceId,
                discord_name = v.discord_name,
                discord_id = v.discord_id,
                steam_name = v.steam_name
            })
            addedIdentifiers[baseIdentifier] = true
        end
    end

    return processedUsers
end)

lib.callback.register('esx_multicharacter:GetAdminUserCharacters', function(source, targetIdentifier)
    if not IsAdmin(source) then return {} end

    local results = MySQL.query.await([[
        SELECT identifier, firstname, lastname, job, job_grade 
        FROM users 
        WHERE identifier LIKE ?
    ]], { PREFIX .. "%:" .. targetIdentifier })

    local chars = {}
    for _, v in ipairs(results) do
        local id = tonumber(v.identifier:match(PREFIX .. "(%d+):"))
        table.insert(chars, {
            id = id,
            firstname = v.firstname,
            lastname = v.lastname,
            job = v.job,
            grade = v.job_grade,
            identifier = v.identifier
        })
    end
    table.sort(chars, function(a, b) return a.id < b.id end)
    return chars
end)

RegisterNetEvent('esx_multicharacter:SetSlotsAdmin', function(targetIdentifier, newSlots)
    local src = source
    if not IsAdmin(src) then return end
    if not CheckCooldown(src) then return end

    newSlots = tonumber(newSlots)
    if not newSlots or newSlots < 1 then return end
    if newSlots > 5 then newSlots = 5 end

    MySQL.insert.await([[
        INSERT INTO multicharacter_slots (identifier, slots) 
        VALUES (?, ?) 
        ON DUPLICATE KEY UPDATE slots = ?
    ]], { targetIdentifier, newSlots, newSlots })

    Debug(("Admin %s cambió slots de %s a %d"):format(GetPlayerName(src), targetIdentifier, newSlots))
    TriggerClientEvent('esx:showNotification', src, 'Slots actualizados correctamente.')
end)

RegisterNetEvent('esx_multicharacter:DeleteCharacterAdmin', function(charIdentifier)
    local src = source
    if not IsAdmin(src) then return end
    if not CheckCooldown(src) then return end

    Debug("Admin borrando personaje: " .. tostring(charIdentifier))
    
    local success = false
    
    local statusUser, resultUser = pcall(function()
        return MySQL.query.await("DELETE FROM `users` WHERE `identifier` = ?", { charIdentifier })
    end)

    if statusUser and resultUser then
        if resultUser.affectedRows and resultUser.affectedRows > 0 then
            success = true
            Debug("Borrado exitoso de tabla users (Directo). Afectados: " .. resultUser.affectedRows)
        else
            Debug("Borrado directo en users no afectó filas. ¿Identificador correcto?")
        end
    else
        Debug("Error en borrado directo de users: " .. tostring(resultUser))
    end
    
    for _, info in ipairs(Config.CleanupTables) do
        if info.table ~= 'users' and DoesColumnExist(info.table, info.column) then
            pcall(function()
                MySQL.query.await(string.format("DELETE FROM `%s` WHERE `%s` = ?", info.table, info.column), { charIdentifier })
            end)
        end
    end

    if success then
        TriggerClientEvent('esx:showNotification', src, 'Personaje eliminado correctamente.')
        
        local xTarget = ESX.GetPlayerFromIdentifier(charIdentifier)
        if xTarget then
            DropPlayer(xTarget.source, "Tu personaje ha sido eliminado por un administrador.")
        end
    else
        TriggerClientEvent('esx:showNotification', src, 'Error: No se pudo eliminar (o no existía).')
    end
end)

-- CONFIG ADMIN EVENTS
lib.callback.register('esx_multicharacter:GetAdminConfig', function(source)
    if not IsAdmin(source) then return {} end
    
    local global = {
        claimPoint = { Config.WelcomeVehicle.claimPoint.x, Config.WelcomeVehicle.claimPoint.y, Config.WelcomeVehicle.claimPoint.z },
        spawnPoint = { Config.WelcomeVehicle.spawnPoint.x, Config.WelcomeVehicle.spawnPoint.y, Config.WelcomeVehicle.spawnPoint.z, Config.WelcomeVehicle.spawnPoint.w },
        labelClaim = Config.WelcomeVehicle.labelClaim,
        labelConfirm = Config.WelcomeVehicle.labelConfirm,
        labelOwned = Config.WelcomeVehicle.labelOwned,
        instructions = Config.WelcomeVehicle.instructions
    }

    return {
        packs = Config.WelcomePacks,
        global = global
    }
end)

RegisterNetEvent('esx_multicharacter:SaveAdminPacks', function(data)
    local src = source
    if not IsAdmin(src) then return end
    if not CheckCooldown(src) then return end
    
    Config.WelcomePacks = data.packs
    SaveConfigToDB()
    TriggerClientEvent('esx_multicharacter:SyncConfig', -1, { packs = Config.WelcomePacks })
    TriggerClientEvent('esx:showNotification', src, 'Paquetes de bienvenida actualizados en DB.')
end)

RegisterNetEvent('esx_multicharacter:SaveAdminGlobal', function(data)
    local src = source
    if not IsAdmin(src) then return end
    if not CheckCooldown(src) then return end
    
    local g = data.global
    if not g or not g.claimPoint or not g.spawnPoint then return end
    
    Config.WelcomeVehicle.claimPoint = vec3(g.claimPoint[1], g.claimPoint[2], g.claimPoint[3])
    Config.WelcomeVehicle.spawnPoint = vec4(g.spawnPoint[1], g.spawnPoint[2], g.spawnPoint[3], g.spawnPoint[4])
    Config.WelcomeVehicle.labelClaim = g.labelClaim
    Config.WelcomeVehicle.labelConfirm = g.labelConfirm
    Config.WelcomeVehicle.instructions = g.instructions
    
    Debug(("Admin %s guardó ajustes globales. Reclamo: %s, Spawn: %s"):format(GetPlayerName(src), tostring(Config.WelcomeVehicle.claimPoint), tostring(Config.WelcomeVehicle.spawnPoint)))
    
    SaveConfigToDB()
    TriggerClientEvent('esx_multicharacter:SyncConfig', -1, { global = GetConfigForDB().global })
    TriggerClientEvent('esx:showNotification', src, 'Ajustes globales actualizados en DB.')
end)
