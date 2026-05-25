local ESX = exports['es_extended']:getSharedObject()
local StationsCache = {}

-- Función auxiliar para registrar la armería en ox_inventory
local function RegisterStationArmory(stationId, stationName, coords)
    if not coords then return end
    
    exports.ox_inventory:RegisterShop('uniquepolice_armory_' .. stationId, {
        name = 'Armería: ' .. stationName,
        inventory = Config.ArmoryItems,
        locations = {
            vec3(coords.x, coords.y, coords.z)
        },
        groups = {
            police = 0 -- Modifica si usas otros trabajos
        }
    })
end

-- Función auxiliar para registrar el almacén compartido en ox_inventory
local function RegisterStationSharedStash(stationId, stationName)
    exports.ox_inventory:RegisterStash('policeshared_' .. stationId, 'Almacén: ' .. stationName, 100, 800000, false, {
        police = 0 -- Solo trabajos autorizados pueden abrirlo
    })
end

-- =========================================
-- CARGA INICIAL (Caché en RAM + Registro de Tiendas)
-- =========================================
MySQL.ready(function()
    local result = MySQL.query.await('SELECT * FROM uniquepolice_stations')
    if result then
        for i = 1, #result do
            local row = result[i]
            local points = json.decode(row.points) or {}
            
            StationsCache[row.id] = {
                name = row.name,
                points = points
            }

            -- [NUEVO] Registrar Armeria si existe
            if points['armory'] then
                RegisterStationArmory(row.id, row.name, points['armory'])
            end

            -- [NUEVO] Registrar Almacén Compartido si existe
            if points['stash_shared'] then
                RegisterStationSharedStash(row.id, row.name)
            end
        end
        print('^2[UniquePolice]^7 Cargadas ' .. #result .. ' comisarías y sus armerías en ox_inventory.')
    end
end)

-- =========================================
-- CALLBACKS (Comunicación Segura)
-- =========================================
lib.callback.register('uniquepolice:server:isAdmin', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end
    
    local group = xPlayer.getGroup()
    for i = 1, #Config.AdminGroups do
        if group == Config.AdminGroups[i] then return true end
    end
    return false
end)

lib.callback.register('uniquepolice:server:getStations', function(source)
    return StationsCache
end)

lib.callback.register('uniquepolice:server:createStation', function(source, id, name)
    if StationsCache[id] then return false, "El ID de la comisaría ya existe." end

    MySQL.insert.await('INSERT INTO uniquepolice_stations (id, name, points) VALUES (?, ?, ?)', {id, name, '{}'})
    
    StationsCache[id] = { name = name, points = {} }
    TriggerClientEvent('uniquepolice:client:syncStations', -1, StationsCache)
    
    return true, "Comisaría creada con éxito."
end)

lib.callback.register('uniquepolice:server:savePoint', function(source, stationId, pointType, coords)
    if not StationsCache[stationId] then return false end

    StationsCache[stationId].points[pointType] = coords
    
    MySQL.update.await('UPDATE uniquepolice_stations SET points = ? WHERE id = ?', {
        json.encode(StationsCache[stationId].points), 
        stationId
    })

    if pointType == 'armory' and coords then
        RegisterStationArmory(stationId, StationsCache[stationId].name, coords)
    end

    -- Agrega esta condición al final del callback justo antes de retornar true:
    if pointType == 'stash_shared' and coords then
        RegisterStationSharedStash(stationId, StationsCache[stationId].name)
    end

    TriggerClientEvent('uniquepolice:client:syncStations', -1, StationsCache)
    return true
end)

-- =========================================
-- LOGICA DEL CASILLERO PERSONAL
-- =========================================
lib.callback.register('uniquepolice:server:openPersonalStash', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Usamos el identificador único del jugador (licencia) para su casillero
    local playerIdentifier = xPlayer.getIdentifier()
    local stashId = 'policestash_' .. playerIdentifier

    -- Registramos el stash en caliente para este jugador si no existe
    exports.ox_inventory:RegisterStash(stashId, 'Casillero Personal', 30, 80000, playerIdentifier)
    
    -- Le retornamos el ID exacto al cliente para que lo abra
    return stashId
end)

-- =========================================
-- LOGICA DEL LECTOR DE HUELLAS (CON IDENTIFICACIÓN)
-- =========================================

-- Callback para capturar los datos reales y el documento del civil
lib.callback.register('uniquepolice:server:getCharacterName', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return "Desconocido", "Desconocido", "000000" end

    local firstName = xPlayer.get('firstName') or "Desconocido"
    local lastName = xPlayer.get('lastName') or "Individuo"
    
    -- Buscamos el número de identificación del personaje en ESX
    -- Intentamos primero con la propiedad nativa, si no, sacamos un retazo limpio de su licencia
    local citizenId = xPlayer.get('mdcID') or xPlayer.get('identity')
    if not citizenId then
        -- Si el framework no tiene una cédula custom, limpiamos el identifier para que sea un número corto elegante
        local rawIdentifier = xPlayer.getIdentifier()
        citizenId = string.upper(string.sub(rawIdentifier, -8)) -- Agarra los últimos 8 caracteres como "N° de Cédula"
    end
    
    return firstName, lastName, citizenId
end)

-- Evento para mandar el /me y /do de entorno a la gente que esté cerca
RegisterNetEvent('uniquepolice:server:sendIdentityProximityMsg', function(coords, textMe, textDo)
    local players = ESX.GetPlayers()

    for i=1, #players do
        local targetSource = players[i]
        local targetPed = GetPlayerPed(targetSource)
        local targetCoords = GetEntityCoords(targetPed)

        if #(coords - targetCoords) < 10.0 then
            TriggerClientEvent('chat:addMessage', targetSource, {
                color = { 255, 0, 0 },
                multiline = true,
                args = { "💬 ROL", textMe }
            })
            TriggerClientEvent('chat:addMessage', targetSource, {
                color = { 0, 150, 255 },
                multiline = true,
                args = { "💻 SISTEMA", textDo }
            })
        end
    end
end)

local JailTimers = {}

-- =========================================
-- SISTEMA DE CÁRCEL COMPLETO (SERVER)
-- =========================================

-- Comando para encarcelar: /jail [ID] [Minutos]
RegisterCommand('jail', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Validamos que el que usa el comando sea policía
    local isCop = false
    for i = 1, #Config.PoliceJobs do
        if xPlayer.job.name == Config.PoliceJobs[i] then isCop = true; break end
    end

    if not isCop then
        TriggerClientEvent('ox_lib:notify', source, { title = 'Error', description = 'No eres un oficial de la ley.', type = 'error' })
        return
    end

    local targetId = tonumber(args[1])
    local jailTime = tonumber(args[2])

    if not targetId or not jailTime or jailTime <= 0 then
        TriggerClientEvent('ox_lib:notify', source, { title = 'Uso Incorrecto', description = 'Usa: /jail [ID] [Minutos]', type = 'error' })
        return
    end

    local tPlayer = ESX.GetPlayerFromId(targetId)
    if not tPlayer then
        TriggerClientEvent('ox_lib:notify', source, { title = 'Error', description = 'El jugador no está en línea.', type = 'error' })
        return
    end

    -- Buscamos la comisaría más cercana al policía para saber qué celda usar
    local pCoords = GetEntityCoords(GetPlayerPed(source))
    local closestStation = nil
    local minDist = 999999.0

    for id, data in pairs(StationsCache) do
        if data.points['jail_cell'] then
            local cellCoords = data.points['jail_cell']
            local dist = #(pCoords - vec3(cellCoords.x, cellCoords.y, cellCoords.z))
            if dist < minDist then
                minDist = dist
                closestStation = id
            end
        end
    end

    if not closestStation then
        TriggerClientEvent('ox_lib:notify', source, { title = 'Cárcel', description = 'No hay ninguna celda configurada en el servidor todavía.', type = 'error' })
        return
    end

    local targetIdentifier = tPlayer.getIdentifier()

    -- Guardamos en la Base de Datos para persistencia
    MySQL.insert('INSERT INTO uniquepolice_jail (identifier, time) VALUES (?, ?) ON DUPLICATE KEY UPDATE time = ?', 
    { targetIdentifier, jailTime, jailTime })

    -- Mandamos al civil a la celda
    TriggerClientEvent('uniquepolice:client:sendToJail', targetId, closestStation, jailTime)
    TriggerClientEvent('ox_lib:notify', source, { title = 'Éxito', description = 'Has encarcelado al ciudadano por '..jailTime..' minutos.', type = 'success' })
    
    -- Iniciamos el contador para este jugador
    StartJailTimer(targetIdentifier, targetId, closestStation)
end)

-- Función que resta el tiempo cada minuto
function StartJailTimer(identifier, source, stationId)
    if JailTimers[identifier] then return end -- Si ya tiene un hilo corriendo, lo ignora

    JailTimers[identifier] = true

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(60000) -- Espera 1 minuto (60,000 ms)

            local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
            
            -- Hacemos una consulta rápida a la BD para ver cuánto tiempo le queda
            local result = MySQL.query.await('SELECT time FROM uniquepolice_jail WHERE identifier = ?', { identifier })
            
            if result and result[1] then
                local currentTime = result[1].time - 1

                if currentTime <= 0 then
                    -- ¡Cumplió la condena!
                    MySQL.update('DELETE FROM uniquepolice_jail WHERE identifier = ?', { identifier })
                    JailTimers[identifier] = nil
                    
                    if xPlayer then
                        TriggerClientEvent('uniquepolice:client:releaseFromJail', xPlayer.source, stationId)
                    end
                    break
                else
                    -- Actualizamos el tiempo restante en la BD
                    MySQL.update('UPDATE uniquepolice_jail SET time = ? WHERE identifier = ?', { currentTime, identifier })
                    if xPlayer then
                        TriggerClientEvent('ox_lib:notify', xPlayer.source, { title = 'Cárcel', description = 'Te quedan '..currentTime..' minutos de condena.', type = 'inform' })
                    end
                end
            else
                JailTimers[identifier] = nil
                break
            end
        end
    end)
end

-- Validar si el tipo tenía una condena pendiente cuando entra al servidor (Antilogout)
RegisterNetEvent('esx:playerLoaded', function(id, xPlayer)
    local source = id
    local identifier = xPlayer.getIdentifier()

    local result = MySQL.query.await('SELECT * FROM uniquepolice_jail WHERE identifier = ?', { identifier })
    if result and result[1] then
        local remainingTime = result[1].time
        
        -- Buscamos cualquier comisaría que tenga celda para meterlo de una
        Citizen.Wait(3000) -- Esperamos a que el muñeco cargue bien en el mapa
        for stationId, data in pairs(StationsCache) do
            if data.points['jail_cell'] then
                TriggerClientEvent('uniquepolice:client:sendToJail', source, stationId, remainingTime)
                StartJailTimer(identifier, source, stationId)
                break
            end
        end
    end
end)