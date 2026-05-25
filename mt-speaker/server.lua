local ESX = nil
local QBCore = nil

if Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx_core' then
    QBCore = exports['qb-core']:GetCoreObject()
end

-- ==========================================
-- Admin Radio Command
-- ==========================================
RegisterCommand(Config.AdminCommand, function(source, args, rawCommand)
    if source == 0 then return end
    
    local hasPermission = false
    
    if Config.Framework == 'esx' and ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            local group = xPlayer.getGroup()
            for _, g in ipairs(Config.AdminGroups) do
                if group == g then
                    hasPermission = true
                    break
                end
            end
        end
    elseif (Config.Framework == 'qb-core' or Config.Framework == 'qbx_core') and QBCore then
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            for _, perm in ipairs(Config.AdminRadio.Permissions) do
                if QBCore.Functions.HasPermission(source, perm) then
                    hasPermission = true
                    break
                end
            end
        end
    else
        -- Fallback to ace permissions
        hasPermission = IsPlayerAceAllowed(source, "command." .. Config.AdminCommand)
    end
    
    if hasPermission then
        TriggerClientEvent('mt-speaker:client:openAdminRadio', source, {
            mode = Config.AdminRadio.Modes.ZONE,
            radius = Config.AdminRadio.DefaultRadius,
            volume = Config.AdminRadio.DefaultVolume,
            active = false
        })
    else
        TriggerClientEvent('ox_lib:notify', source, { type = 'error', description = 'No tienes permisos para usar el panel de administración' })
    end
end, false)

-- ==========================================
-- Core Speaker Logic
-- ==========================================
local placedSpeakers = {}
local speakerIdCount = 0
local playlists = {}
local syncGroups = {}

local function GenerateSpeakerId()
    speakerIdCount = speakerIdCount + 1
    return "speaker_" .. speakerIdCount
end

RegisterNetEvent('mt-speaker:server:placeSpeaker', function(data)
    local src = source
    local speakerId = GenerateSpeakerId()
    
    local typeData = Config.SpeakerTypes[data.type] or {}
    
    placedSpeakers[speakerId] = {
        x = data.x,
        y = data.y,
        z = data.z,
        heading = data.heading,
        type = data.type,
        owner = src,
        volume = Config.DefaultVolume,
        maxVolume = typeData.maxVolume or 100,
        range = typeData.range or 30.0,
        prop = typeData.prop or 'prop_speaker_01',
        isPlaying = false,
        videoId = nil,
        title = nil,
        isVehicle = false
    }
    
    TriggerClientEvent('mt-speaker:client:speakerPlaced', -1, speakerId, placedSpeakers[speakerId])
end)

RegisterNetEvent('mt-speaker:server:removeSpeaker', function(speakerId)
    local src = source
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId] = nil
        TriggerClientEvent('mt-speaker:client:speakerRemoved', -1, speakerId)
    end
end)

RegisterNetEvent('mt-speaker:server:playMusic', function(speakerId, url, videoId, title)
    if not placedSpeakers[speakerId] and speakerId:match("^vehicle_") then
        placedSpeakers[speakerId] = {
            owner = source,
            volume = Config.DefaultVolume,
            isPlaying = false,
            isVehicle = true
        }
    end
    
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].isPlaying = true
        placedSpeakers[speakerId].videoId = videoId
        placedSpeakers[speakerId].title = title
        placedSpeakers[speakerId].startTime = os.time()
        
        TriggerClientEvent('mt-speaker:client:playMusic', -1, speakerId, videoId, placedSpeakers[speakerId].volume)
        TriggerClientEvent('mt-speaker:client:updateTitle', -1, speakerId, title, videoId)
    end
end)

RegisterNetEvent('mt-speaker:server:stopMusic', function(speakerId)
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].isPlaying = false
        placedSpeakers[speakerId].videoId = nil
        TriggerClientEvent('mt-speaker:client:stopMusic', -1, speakerId)
    end
end)

RegisterNetEvent('mt-speaker:server:setVolume', function(speakerId, volume)
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].volume = volume
        TriggerClientEvent('mt-speaker:client:volumeChanged', -1, speakerId, volume)
    end
end)

RegisterNetEvent('mt-speaker:server:requestSpeakers', function()
    local src = source
    local now = os.time()
    for k, v in pairs(placedSpeakers) do
        if v.isPlaying and v.startTime then
            v.elapsedSeconds = now - v.startTime
        end
    end
    TriggerClientEvent('mt-speaker:client:syncSpeakers', src, placedSpeakers)
end)

RegisterNetEvent('mt-speaker:server:updateTitle', function(speakerId, title)
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].title = title
        TriggerClientEvent('mt-speaker:client:updateTitle', -1, speakerId, title, placedSpeakers[speakerId].videoId)
    end
end)

RegisterNetEvent('mt-speaker:server:onPLayerUnload', function(src)
    if Config.AutoRemoveOnDisconnect then
        for speakerId, data in pairs(placedSpeakers) do
            if data.owner == src and not data.isVehicle then
                placedSpeakers[speakerId] = nil
                TriggerClientEvent('mt-speaker:client:speakerRemoved', -1, speakerId)
            end
        end
    end
end)

-- ==========================================
-- Admin Radio System
-- ==========================================
local adminRadioActive = false

RegisterNetEvent('mt-speaker:server:adminRadioChangeMode', function(mode)
    local src = source
    -- Logic for changing mode
end)

RegisterNetEvent('mt-speaker:server:adminRadioChangeRadius', function(radius)
    local src = source
end)

RegisterNetEvent('mt-speaker:server:adminRadioPlay', function(data)
    local src = source
    adminRadioActive = true
end)

RegisterNetEvent('mt-speaker:server:adminRadioPause', function()
    local src = source
end)

RegisterNetEvent('mt-speaker:server:adminRadioResume', function()
    local src = source
end)

RegisterNetEvent('mt-speaker:server:adminRadioStop', function()
    local src = source
    adminRadioActive = false
end)

RegisterNetEvent('mt-speaker:server:adminRadioSetVolume', function(volume)
    local src = source
end)

RegisterNetEvent('mt-speaker:server:closeAdminRadio', function()
    local src = source
end)

RegisterNetEvent('mt-speaker:server:startVoiceBroadcast', function(mode, radius)
    local src = source
end)

RegisterNetEvent('mt-speaker:server:stopVoiceBroadcast', function()
    local src = source
end)

-- ==========================================
-- Callbacks
-- ==========================================

lib.callback.register('mt-speaker:server:getSyncStatus', function(source, speakerId)
    return { synced = false }
end)

lib.callback.register('mt-speaker:server:getPlaylists', function(source)
    local myPlaylists = {}
    if playlists[source] then
        for _, p in ipairs(playlists[source]) do
            table.insert(myPlaylists, {
                id = p.id,
                name = p.name,
                imageUrl = p.imageUrl,
                songCount = #p.songs,
                isFavorite = p.isFavorite or false,
                isPublic = p.isPublic or false,
                likeCount = p.likeCount or 0
            })
        end
    end
    return {
        myPlaylists = myPlaylists,
        sharedPlaylists = {}
    }
end)

lib.callback.register('mt-speaker:server:createPlaylist', function(source, name, imageUrl)
    if not playlists[source] then playlists[source] = {} end
    local pId = "pl_" .. math.random(100000, 999999)
    table.insert(playlists[source], {
        id = pId,
        name = name,
        imageUrl = imageUrl,
        songs = {}
    })
    return true, "Playlist created"
end)

lib.callback.register('mt-speaker:server:renamePlaylist', function(source, playlistId, newName, imageUrl)
    if playlists[source] then
        for _, p in ipairs(playlists[source]) do
            if p.id == playlistId then
                p.name = newName
                p.imageUrl = imageUrl
                return true, "Playlist renamed"
            end
        end
    end
    return false, "Playlist not found"
end)

lib.callback.register('mt-speaker:server:deletePlaylist', function(source, playlistId)
    if playlists[source] then
        for i, p in ipairs(playlists[source]) do
            if p.id == playlistId then
                table.remove(playlists[source], i)
                return true, "Playlist deleted"
            end
        end
    end
    return false, "Playlist not found"
end)

lib.callback.register('mt-speaker:server:getPlaylistSongs', function(source, playlistId)
    if playlists[source] then
        for _, p in ipairs(playlists[source]) do
            if p.id == playlistId then
                return p.songs
            end
        end
    end
    return {}
end)

lib.callback.register('mt-speaker:server:addSongToPlaylist', function(source, playlistId, url, title)
    if playlists[source] then
        for _, p in ipairs(playlists[source]) do
            if p.id == playlistId then
                local videoId = string.match(url, 'v=([%w-_]+)') or string.match(url, 'youtu%.be/([%w-_]+)')
                table.insert(p.songs, {
                    id = "song_" .. math.random(100000, 999999),
                    url = url,
                    title = title,
                    videoId = videoId
                })
                return true, "Song added"
            end
        end
    end
    return false, "Playlist not found"
end)

lib.callback.register('mt-speaker:server:removeSongFromPlaylist', function(source, songId)
    if playlists[source] then
        for _, p in ipairs(playlists[source]) do
            for i, s in ipairs(p.songs) do
                if s.id == songId then
                    table.remove(p.songs, i)
                    return true, "Song removed"
                end
            end
        end
    end
    return false, "Song not found"
end)

lib.callback.register('mt-speaker:server:sharePlaylist', function(source, playlistId, targetPlayerId)
    return false, "Not implemented"
end)

lib.callback.register('mt-speaker:server:getPublicPlaylists', function(source)
    return {}
end)

lib.callback.register('mt-speaker:server:importPlaylist', function(source, playlistId)
    return false, "Not implemented"
end)

lib.callback.register('mt-speaker:server:likePlaylist', function(source, playlistId)
    return false, false, "Not implemented"
end)

lib.callback.register('mt-speaker:server:toggleFavorite', function(source, playlistId)
    return false, false, "Not implemented"
end)

lib.callback.register('mt-speaker:server:togglePublic', function(source, playlistId)
    return { success = false, message = "Not implemented" }
end)

lib.callback.register('mt-speaker:server:getNearbySpeakers', function(source, speakerId, distance)
    return {}
end)

lib.callback.register('mt-speaker:server:createSyncGroup', function(source, masterId, slaveIds)
    return false, "Not implemented"
end)

lib.callback.register('mt-speaker:server:removeSyncGroup', function(source, masterId)
    return false, "Not implemented"
end)

local function urlencode(str)
    if str then
        str = str:gsub("\n", "\r\n")
        str = str:gsub("([^%w %-%_%.%~])", function(c)
            return string.format("%%%02X", string.byte(c))
        end)
        str = str:gsub(" ", "+")
    end
    return str
end

lib.callback.register('mt-speaker:server:searchMusic', function(source, query)
    local p = promise.new()
    local instances = {
        "https://inv.riverside.rocks",
        "https://invidious.projectsegfau.lt",
        "https://invidious.privacydev.net",
        "https://yewtu.be",
        "https://vid.priv.au",
        "https://iv.melmac.space"
    }

    local function tryInstance(index)
        if index > #instances then
            p:resolve(nil)
            return
        end

        local url = string.format("%s/api/v1/search?q=%s&type=video", instances[index], urlencode(query))
        
        PerformHttpRequest(url, function(status, result, headers)
            if status == 200 and result then
                local ok, data = pcall(json.decode, result)
                if ok and type(data) == "table" and #data > 0 then
                    local normalized = {}
                    for _, item in ipairs(data) do
                        if item.title and (item.videoId or item.url) then
                            table.insert(normalized, {
                                title = item.title,
                                videoId = item.videoId or item.url:match("v=([^&]+)"),
                                author = item.author or item.uploaderName,
                                lengthSeconds = item.lengthSeconds or item.duration,
                                videoThumbnails = item.videoThumbnails
                            })
                        end
                    end
                    if #normalized > 0 then
                        p:resolve(normalized)
                    else
                        tryInstance(index + 1)
                    end
                else
                    tryInstance(index + 1)
                end
            else
                tryInstance(index + 1)
            end
        end, 'GET', '', {['User-Agent'] = 'Mozilla/5.0'})
    end

    tryInstance(1)
    return Citizen.Await(p)
end)

-- Start vehicle radio keep alive loop
CreateThread(function()
    while true do
        Wait(5000)
        local now = os.time()
        for speakerId, data in pairs(placedSpeakers) do
            if data.isVehicle and data.isPlaying then
                local elapsed = now - (data.startTime or now)
                TriggerClientEvent('mt-speaker:client:vehicleRadioKeepAlive', -1, speakerId, data.videoId, data.volume, elapsed)
            end
        end
    end
end)

-- ==========================================
-- Framework Specific Usable Items
-- ==========================================
CreateThread(function()
    Wait(500)
    if Config.Framework == 'esx' then
        local ESX = exports['es_extended']:getSharedObject()
        if Config.RequireItem then
            -- Fallback single item
            if Config.SpeakerItem then
                ESX.RegisterUsableItem(Config.SpeakerItem, function(source)
                    TriggerClientEvent('mt-speaker:client:useItem', source, 'speaker_small')
                end)
            end
            
            for k, v in pairs(Config.SpeakerTypes) do
                if v.item and v.item ~= Config.SpeakerItem then
                    ESX.RegisterUsableItem(v.item, function(source)
                        TriggerClientEvent('mt-speaker:client:useItem', source, k)
                    end)
                end
            end
        end
    elseif Config.Framework == 'qb-core' or Config.Framework == 'qbx_core' then
        local QBCore = exports['qb-core']:GetCoreObject()
        if Config.RequireItem then
            -- Fallback single item
            if Config.SpeakerItem then
                QBCore.Functions.CreateUseableItem(Config.SpeakerItem, function(source, item)
                    TriggerClientEvent('mt-speaker:client:useItem', source, 'speaker_small')
                end)
            end
            
            for k, v in pairs(Config.SpeakerTypes) do
                if v.item and v.item ~= Config.SpeakerItem then
                    QBCore.Functions.CreateUseableItem(v.item, function(source, item)
                        TriggerClientEvent('mt-speaker:client:useItem', source, k)
                    end)
                end
            end
        end
    end
end)

