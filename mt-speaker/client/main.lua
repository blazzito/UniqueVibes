local isPlacingSpeaker = false
placedSpeakers = {}
currentSpeaker = nil
playerSpeakers = {}
local currentVehicleRadio = nil
local isCarRadioOpen = false

local function HasPermission()
    if not Config.UsePermissions then
        return true
    end
    
    for _, job in pairs(Config.AllowedJobs) do
        local playerJob = Custom.GetJob()
        if playerJob.name == job then
            return true
        end
    end
    
    return false
end

local function ExtractVideoId(url)
    local patterns = {
        'youtube%.com/watch%?v=([%w-_]+)',
        'youtu%.be/([%w-_]+)',
        'youtube%.com/embed/([%w-_]+)',
        'youtube%.com/v/([%w-_]+)'
    }
    
    for _, pattern in ipairs(patterns) do
        local videoId = string.match(url, pattern)
        if videoId then
            return videoId
        end
    end
    
    return nil
end

local function IsValidURL(url)
    if not url or url == '' then
        return false
    end
    
    if Config.ValidateDomain then
        if not string.match(url, 'youtube%.com') and not string.match(url, 'youtu%.be') then
            return false
        end
    end
    
    local videoId = ExtractVideoId(url)
    return videoId ~= nil
end

local function GetYouTubeTitle(url)
    local videoId = ExtractVideoId(url)
    if not videoId then
        return 'Unknown'
    end
    
    return 'Loading... (' .. videoId .. ')'
end

function PlaceSpeaker(speakerType)
    if isPlacingSpeaker then return end
    
    if not HasPermission() then
        Internal.Notify(_('no_permission'), 'error')
        return
    end
    
    if #playerSpeakers >= Config.MaxSpeakers then
        Internal.Notify(_('max_speakers_reached', #playerSpeakers, Config.MaxSpeakers), 'error')
        return
    end

    local typeData = Config.SpeakerTypes[speakerType]
    local speakerModel = GetHashKey(typeData and typeData.prop or 'prop_speaker_01')
    
    lib.requestModel(speakerModel)
    
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local playerHeading = GetEntityHeading(playerPed)
    local forward = GetEntityForwardVector(playerPed)
    local spawnCoords = playerCoords + forward * 1.5
    
    local ground, groundZ = GetGroundZFor_3dCoord(spawnCoords.x, spawnCoords.y, spawnCoords.z + 10.0, false)
    if ground then
        spawnCoords = vector3(spawnCoords.x, spawnCoords.y, groundZ)
    end

    -- Animación pickup_low
    local animDict = "pickup_object"
    lib.requestAnimDict(animDict)
    TaskPlayAnim(playerPed, animDict, "pickup_low", 8.0, -8.0, -1, 0, 0, false, false, false)
    
    Wait(800) -- Tiempo justo para que la animación parezca que lo deja en el suelo

    TriggerServerEvent('mt-speaker:server:placeSpeaker', {
        x = spawnCoords.x,
        y = spawnCoords.y,
        z = spawnCoords.z,
        heading = playerHeading,
        type = speakerType
    })
    
    Wait(500)
    ClearPedTasks(playerPed)
end

function RemoveSpeaker(speakerId)
    TriggerServerEvent('mt-speaker:server:removeSpeaker', speakerId)
end

function OpenSpeakerUI(speakerId)
    local speaker = placedSpeakers[speakerId]
    if not speaker then 
        return 
    end
    
    currentSpeaker = speakerId
    SetNuiFocus(true, true)
    
    lib.callback('mt-speaker:server:getSyncStatus', false, function(syncStatus)        
        SendNUIMessage({
            action = 'openSpeaker',
            speakerId = speakerId,
            isCarRadio = false,
            syncStatus = syncStatus or {synced = false}
        })        
    end, speakerId)
end

RegisterNUICallback('closeSpeaker', function(data, cb)
    SetNuiFocus(false, false)
    
    if isCarRadioOpen then
        isCarRadioOpen = false
        currentVehicleRadio = nil
    else
        currentSpeaker = nil
    end
    
    cb('ok')
end)

-- Play Music
RegisterNUICallback('playMusic', function(data, cb)
    local speakerId = nil
    
    if isCarRadioOpen and currentVehicleRadio then
        speakerId = 'vehicle_' .. currentVehicleRadio.plate
    elseif currentSpeaker then
        speakerId = currentSpeaker
    else
        cb({success = false, message = 'No speaker or vehicle selected'})
        return
    end
    
    local url = data.url
    if not IsValidURL(url) then
        cb({success = false, message = _('invalid_url')})
        Internal.Notify(_('invalid_url'), 'error')
        return
    end
    
    local videoId = ExtractVideoId(url)
    local title = GetYouTubeTitle(url)
    
    TriggerServerEvent('mt-speaker:server:playMusic', speakerId, url, videoId, title)
    
    cb({success = true, title = title})
end)

RegisterNUICallback('stopMusic', function(data, cb)
    local speakerId = nil
    
    if isCarRadioOpen and currentVehicleRadio then
        speakerId = 'vehicle_' .. currentVehicleRadio.plate
    elseif currentSpeaker then
        speakerId = currentSpeaker
    else
        cb({success = false})
        return
    end
    
    TriggerServerEvent('mt-speaker:server:stopMusic', speakerId)
    cb({success = true})
end)

RegisterNUICallback('setVolume', function(data, cb)
    local speakerId = nil
    
    if isCarRadioOpen and currentVehicleRadio then
        speakerId = 'vehicle_' .. currentVehicleRadio.plate
    elseif currentSpeaker then
        speakerId = currentSpeaker
    else
        cb({success = false})
        return
    end
    
    local speaker = placedSpeakers[speakerId]
    local maxVolume = (speaker and speaker.maxVolume) or Config.MaxVolume or 100
    local volume = tonumber(data.volume) or Config.DefaultVolume
    volume = math.max(Config.MinVolume, math.min(maxVolume, volume))
    
    TriggerServerEvent('mt-speaker:server:setVolume', speakerId, volume)
    cb({success = true})
end)

RegisterNUICallback('removeSpeaker', function(data, cb)
    if isCarRadioOpen then
        cb({success = false, message = 'Cannot remove car radio'})
        return
    end
    
    if not currentSpeaker then
        cb({success = false})
        return
    end
    
    RemoveSpeaker(currentSpeaker)
    SetNuiFocus(false, false)
    currentSpeaker = nil
    cb({success = true})
end)

RegisterNUICallback('Internal.Notify', function(data, cb)
    local type = data.type or 'primary'
    Internal.Notify(data.message, type)
    cb('ok')
end)

RegisterNUICallback('updateSongTitle', function(data, cb)    
    if data.speakerId and data.title then
        TriggerServerEvent('mt-speaker:server:updateTitle', data.speakerId, data.title)
        
        if currentSpeaker == data.speakerId or (isCarRadioOpen and currentVehicleRadio and ('vehicle_' .. currentVehicleRadio.plate) == data.speakerId) then
            SendNUIMessage({
                action = 'updateNowPlaying',
                title = data.title
            })
        end
    end
    
    cb('ok')
end)
RegisterNUICallback('getPlaylists', function(data, cb)
    lib.callback('mt-speaker:server:getPlaylists', false, function(result)
        if result then
            cb({
                myPlaylists = result.myPlaylists or {},
                sharedPlaylists = result.sharedPlaylists or {}
            })
        else
            cb({
                myPlaylists = {},
                sharedPlaylists = {}
            })
        end
    end)
end)

RegisterNUICallback('searchMusic', function(data, cb)
    if not data.query or data.query == "" then
        cb({})
        return
    end

    lib.callback('mt-speaker:server:searchMusic', false, function(results)
        cb(results or {})
    end, data.query)
end)

RegisterNUICallback('createPlaylist', function(data, cb)
    if not data.name or data.name == '' then
        cb({success = false, message = 'Invalid playlist name'})
        return
    end
    
    lib.callback('mt-speaker:server:createPlaylist', false, function(success, message)
        if success then
            Internal.Notify(_('playlist_created', data.name), 'success')
            cb({success = true, message = message or 'Playlist created'})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message or 'Error creating playlist'})
        end
    end, data.name, data.imageUrl or '')
end)

RegisterNUICallback('renamePlaylist', function(data, cb)
    if not data.playlistId or not data.newName or data.newName == '' then
        cb({success = false, message = 'Invalid parameters'})
        return
    end
    
    lib.callback('mt-speaker:server:renamePlaylist', false, function(success, message)
        if success then
            Internal.Notify(_('playlist_renamed'), 'success')
            cb({success = true, message = message or 'Playlist renamed'})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message or 'Error renaming playlist'})
        end
    end, data.playlistId, data.newName, data.imageUrl or '')
end)

RegisterNUICallback('deletePlaylist', function(data, cb)
    if not data.playlistId then
        cb({success = false, message = 'Invalid playlist ID'})
        return
    end
    
    lib.callback('mt-speaker:server:deletePlaylist', false, function(success, message)
        if success then
            Internal.Notify(_('playlist_deleted'), 'success')
            cb({success = true, message = message or 'Playlist deleted'})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message or 'Error deleting playlist'})
        end
    end, data.playlistId)
end)

RegisterNUICallback('getPlaylistSongs', function(data, cb)
    if not data.playlistId then
        cb({songs = {}})
        return
    end
    
    lib.callback('mt-speaker:server:getPlaylistSongs', false, function(songs)
        cb({songs = songs or {}})
    end, data.playlistId)
end)

RegisterNUICallback('addSongToPlaylist', function(data, cb)
    if not data.playlistId or not data.url then
        cb({success = false, message = 'Invalid parameters'})
        return
    end
    
    local url = data.url
    if not IsValidURL(url) then
        cb({success = false, message = _('invalid_url')})
        Internal.Notify(_('invalid_url'), 'error')
        return
    end
    
    local title = data.title or GetYouTubeTitle(url)
        
    lib.callback('mt-speaker:server:addSongToPlaylist', false, function(success, message)
        if success then
            Internal.Notify(_('song_added'), 'success')
            cb({success = true, message = message or 'Song added'})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message or 'Error adding song'})
        end
    end, data.playlistId, url, title)
end)

RegisterNUICallback('removeSongFromPlaylist', function(data, cb)
    if not data.songId then
        cb({success = false, message = 'Invalid song ID'})
        return
    end
    
    lib.callback('mt-speaker:server:removeSongFromPlaylist', false, function(success, message)
        if success then
            Internal.Notify(_('song_removed'), 'success')
            cb({success = true, message = message or 'Song removed'})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message or 'Error removing song'})
        end
    end, data.songId)
end)

RegisterNUICallback('sharePlaylist', function(data, cb)
    if not data.playlistId or not data.targetPlayerId then
        cb({success = false, message = 'Invalid parameters'})
        return
    end
    
    lib.callback('mt-speaker:server:sharePlaylist', false, function(success, message)
        if success then
            Internal.Notify(_('playlist_shared'), 'success')
            cb({success = true, message = message or 'Playlist shared'})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message or 'Error sharing playlist'})
        end
    end, data.playlistId, data.targetPlayerId)
end)

RegisterNUICallback('getPublicPlaylists', function(data, cb)    
    lib.callback('mt-speaker:server:getPublicPlaylists', false, function(playlists)
        cb({playlists = playlists})
    end)
end)

RegisterNUICallback('importPlaylist', function(data, cb)    
    if not data.playlistId then
        cb({success = false, message = 'Invalid playlist ID'})
        return
    end
    
    lib.callback('mt-speaker:server:importPlaylist', false, function(success, message)
        if success then
            Internal.Notify(_('playlist_imported'), 'success')
            cb({success = true, message = message or 'Playlist imported'})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message or 'Error importing playlist'})
        end
    end, data.playlistId)
end)

RegisterNUICallback('likePlaylist', function(data, cb)    
    if not data.playlistId then
        cb({success = false, message = 'Invalid playlist ID'})
        return
    end
    
    lib.callback('mt-speaker:server:likePlaylist', false, function(success, liked, message)
        if success then
            cb({success = true, liked = liked, message = message or 'Playlist liked'})
        else
            cb({success = false, message = message or 'Error liking playlist'})
        end
    end, data.playlistId)
end)

RegisterNUICallback('toggleFavorite', function(data, cb)    
    if not data.playlistId then
        cb({success = false, message = 'Invalid playlist ID'})
        return
    end
    
    lib.callback('mt-speaker:server:toggleFavorite', false, function(success, isFavorite, message)
        if success then
            cb({success = true, isFavorite = isFavorite, message = message or 'Favorite toggled'})
        else
            cb({success = false, message = message or 'Error toggling favorite'})
        end
    end, data.playlistId)
end)

RegisterNUICallback('togglePublic', function(data, cb)
    if not data.playlistId then
        cb({success = false, message = 'Invalid playlist ID'})
        return
    end
    
    lib.callback('mt-speaker:server:togglePublic', false, function(result)
        cb(result)
    end, data.playlistId)
end)

RegisterNUICallback('getNearbySpeakers', function(data, cb)
    if not data.speakerId then
        cb({speakers = {}})
        return
    end
    
    lib.callback('mt-speaker:server:getNearbySpeakers', false, function(speakers)
        cb({speakers = speakers or {}})
    end, data.speakerId, Config.SpeakerSync.MaxSyncDistance)
end)

RegisterNUICallback('createSyncGroup', function(data, cb)
    if not data.masterId or not data.slaveIds then
        cb({success = false, message = 'Invalid parameters'})
        return
    end
    
    lib.callback('mt-speaker:server:createSyncGroup', false, function(success, message)
        if success then
            Internal.Notify(_('sync_created'), 'success')
            cb({success = true, message = message})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message})
        end
    end, data.masterId, data.slaveIds)
end)

RegisterNUICallback('removeSyncGroup', function(data, cb)
    if not data.masterId then
        cb({success = false, message = 'Invalid parameters'})
        return
    end
    
    lib.callback('mt-speaker:server:removeSyncGroup', false, function(success, message)
        if success then
            Internal.Notify(_('sync_removed'), 'success')
            cb({success = true, message = message})
        else
            Internal.Notify(message or _('error_occurred'), 'error')
            cb({success = false, message = message})
        end
    end, data.masterId)
end)

RegisterNUICallback('getSyncStatus', function(data, cb)
    if not data.speakerId then
        cb({synced = false})
        return
    end
    
    lib.callback('mt-speaker:server:getSyncStatus', false, function(status)
        cb(status or {synced = false})
    end, data.speakerId)
end)

RegisterNetEvent('mt-speaker:client:speakerPlaced', function(speakerId, speakerData)
    placedSpeakers[speakerId] = speakerData
    
    if speakerData.owner == GetPlayerServerId(PlayerId()) then
        playerSpeakers[#playerSpeakers+1] = speakerId
        Internal.Notify(_('speaker_placed'), 'success')
    end
    
    CreateSpeakerObject(speakerId, speakerData)
end)

RegisterNetEvent('mt-speaker:client:speakerRemoved', function(speakerId)    
    if placedSpeakers[speakerId] then
        exports['mt-notify']:DeleteDrawText3D('speaker_' .. speakerId)
        if placedSpeakers[speakerId].object then
            local obj = placedSpeakers[speakerId].object
            
            if DoesEntityExist(obj) then
                DeleteObject(obj)
                DeleteEntity(obj)
            end
        end
        
        if currentSpeaker == speakerId then
            SetNuiFocus(false, false)
            SendNUIMessage({
                action = 'closeSpeaker'
            })
            currentSpeaker = nil
        end
        
        placedSpeakers[speakerId] = nil
        
        local wasOwner = false
        for i, id in ipairs(playerSpeakers) do
            if id == speakerId then
                table.remove(playerSpeakers, i)
                wasOwner = true
                break
            end
        end
        
        if wasOwner then
            Internal.Notify(_('speaker_removed'), 'success')
        end
    end
end)

RegisterNetEvent('mt-speaker:client:onPLayerLoad', function()
    TriggerServerEvent('mt-speaker:server:requestSpeakers')
end)

RegisterNetEvent('mt-speaker:client:removeAllSpeakers', function()
    if currentSpeaker then
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = 'closeSpeaker'
        })
        currentSpeaker = nil
    end
    
    for speakerId, speakerData in pairs(placedSpeakers) do
        exports['mt-notify']:DeleteDrawText3D('speaker_' .. speakerId)
        if speakerData.object then
            local obj = speakerData.object
            if DoesEntityExist(obj) then
                DeleteObject(obj)
                DeleteEntity(obj)
            end
        end
    end
    
    placedSpeakers = {}
    playerSpeakers = {}    
end)

RegisterNetEvent('mt-speaker:client:updateSpeaker', function(speakerId, speakerData)
    if placedSpeakers[speakerId] then
        for k, v in pairs(speakerData) do
            placedSpeakers[speakerId][k] = v
        end
    end
end)

RegisterNetEvent('mt-speaker:client:updateTitle', function(speakerId, title, videoId)
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].title = title
        if videoId then
            placedSpeakers[speakerId].videoId = videoId
        end
    end
    
    if currentSpeaker == speakerId or (isCarRadioOpen and currentVehicleRadio and ('vehicle_' .. currentVehicleRadio.plate) == speakerId) then
        SendNUIMessage({
            action = 'updateNowPlaying',
            title = title,
            videoId = videoId
        })
    end
end)

RegisterNetEvent('mt-speaker:client:volumeChanged', function(speakerId, volume)
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].volume = volume
    end
    
    SendNUIMessage({
        action = 'updateVolume',
        data = {
            speakerId = speakerId,
            volume = volume
        }
    })
end)

RegisterNetEvent('mt-speaker:client:syncSpeakers', function(speakers)
    placedSpeakers = speakers

    -- Convert server-computed elapsedSeconds into a local game timer reference
    -- so the sync thread can calculate elapsed time without os.time() (unavailable on client)
    local now = GetGameTimer()
    for speakerId, speakerData in pairs(placedSpeakers) do
        if speakerData.isPlaying and speakerData.elapsedSeconds then
            placedSpeakers[speakerId].gameTimerRef = now - (speakerData.elapsedSeconds * 1000)
        end
        CreateSpeakerObject(speakerId, speakerData)
    end
end)

function CreateSpeakerObject(speakerId, speakerData)
    if speakerData.isVehicle then return end

    if placedSpeakers[speakerId] and placedSpeakers[speakerId].object then
        return
    end
        
    local speakerModel = GetHashKey(speakerData.prop or 'prop_speaker_01')
    
    RequestModel(speakerModel)
    while not HasModelLoaded(speakerModel) do
        Wait(0)
    end
    
    local coords = vector3(speakerData.x, speakerData.y, speakerData.z)
    local speakerObject = CreateObject(speakerModel, coords.x, coords.y, coords.z, false, false, false)
    
    SetEntityHeading(speakerObject, speakerData.heading)
    PlaceObjectOnGroundProperly(speakerObject)
    SetEntityCollision(speakerObject, true, true)
    FreezeEntityPosition(speakerObject, true)
    
    placedSpeakers[speakerId].object = speakerObject
    
    local isOwner = speakerData.owner == GetPlayerServerId(PlayerId())
    local opts = {
        { label = _('press_interact') or "INTERACTUAR", event = "mt-speaker:client:openUI", value = speakerId }
    }
    if isOwner then
        table.insert(opts, { label = _('delete') or "BORRAR", event = "mt-speaker:client:removeUI", value = speakerId })
    end

    exports['mt-notify']:create3DTextUI('speaker_' .. speakerId, {
        type = '3dtext',
        coords = vector3(speakerData.x, speakerData.y, speakerData.z + 0.35),
        displayDist = Config.InteractionDistance or 5.0,
        interactDist = Config.InteractionDistance or 1.5,
        enableKeyClick = true,
        key = 'E',
        text = 'BOOMBOX',
        job = "all",
        options = opts
    })
end

AddEventHandler('mt-speaker:client:openUI', function(data)
    local speakerId = data and data.value or data
    OpenSpeakerUI(speakerId)
end)

AddEventHandler('mt-speaker:client:removeUI', function(data)
    local speakerId = data and data.value or data
    local playerPed = PlayerPedId()
    if lib.progressBar({
        duration = 2000,
        label = _('removing_speaker') or "Recogiendo boombox...",
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, mouse = false, combat = true },
        anim = {
            dict = "pickup_object",
            clip = "pickup_low",
            flag = 0
        }
    }) then
        RemoveSpeaker(speakerId)
        Wait(500)
        ClearPedTasks(playerPed)
    else
        ClearPedTasks(playerPed)
    end
end)

RegisterCommand('placespeaker', function()
    PlaceSpeaker()
end, false)

RegisterNetEvent('mt-speaker:client:useItem', function(speakerType)
    PlaceSpeaker(speakerType)
end)

function OpenCarRadio()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    if vehicle == 0 then
        Internal.Notify(_('need_vehicle'), 'error')
        return
    end
    
    local plate = GetVehicleNumberPlateText(vehicle)
    local vehicleNetId = VehToNet(vehicle)
        
    currentVehicleRadio = {
        vehicle = vehicle,
        plate = plate,
        netId = vehicleNetId
    }
    
    isCarRadioOpen = true
    
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openSpeaker',
        isCarRadio = true,
        vehiclePlate = plate
    })
end

local adminRadioOpen = false
local adminRadioActive = false

RegisterNetEvent('mt-speaker:client:openAdminRadio', function(data)    
    adminRadioOpen = true
    
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openAdminRadio',
        mode = data.mode or 'zone',
        radius = data.radius or 50,
        volume = data.volume or 50,
        active = data.active or false,
        videoId = data.videoId or nil,
        title = data.title or nil
    })
end)

RegisterNUICallback('closeAdminRadio', function(data, cb)    
    adminRadioOpen = false
    SetNuiFocus(false, false)
    
    TriggerServerEvent('mt-speaker:server:closeAdminRadio')
    cb({success = true})
end)

RegisterNUICallback('adminRadioChangeMode', function(data, cb)    
    TriggerServerEvent('mt-speaker:server:adminRadioChangeMode', data.mode)
    cb({success = true})
end)

RegisterNUICallback('adminRadioChangeRadius', function(data, cb)    
    TriggerServerEvent('mt-speaker:server:adminRadioChangeRadius', data.radius)
    cb({success = true})
end)

RegisterNUICallback('adminRadioPlay', function(data, cb)    
    TriggerServerEvent('mt-speaker:server:adminRadioPlay', data)
    cb({success = true})
end)

RegisterNUICallback('adminRadioPause', function(data, cb)    
    TriggerServerEvent('mt-speaker:server:adminRadioPause')
    cb({success = true})
end)

RegisterNUICallback('adminRadioResume', function(data, cb)    
    TriggerServerEvent('mt-speaker:server:adminRadioResume')
    cb({success = true})
end)

RegisterNUICallback('adminRadioStop', function(data, cb)    
    TriggerServerEvent('mt-speaker:server:adminRadioStop')
    cb({success = true})
end)

RegisterNUICallback('adminRadioSetVolume', function(data, cb)    
    TriggerServerEvent('mt-speaker:server:adminRadioSetVolume', data.volume)
    cb({success = true})
end)

RegisterNUICallback('startVoiceBroadcast', function(data, cb)
    TriggerServerEvent('mt-speaker:server:startVoiceBroadcast', data.mode, data.radius)
    exports['pma-voice']:setRadioChannel(999)
    ExecuteCommand('+radiotalk')
    cb({success = true})
end)

RegisterNUICallback('stopVoiceBroadcast', function(data, cb)
    TriggerServerEvent('mt-speaker:server:stopVoiceBroadcast')
    ExecuteCommand('-radiotalk')
    cb({success = true})
end)

RegisterNetEvent('mt-speaker:client:adminRadioPlay', function(data)    
    adminRadioActive = true
    
    SendNUIMessage({
        action = 'playMusicFromAdmin',
        videoId = data.videoId,
        url = data.url,
        title = data.title or 'Admin Radio',
        volume = data.volume or 50,
        mode = data.mode or 'zone'
    })
end)

RegisterNetEvent('mt-speaker:client:adminRadioPause', function()    
    SendNUIMessage({
        action = 'pauseMusicFromAdmin'
    })
end)

RegisterNetEvent('mt-speaker:client:adminRadioResume', function()    
    SendNUIMessage({
        action = 'resumeMusicFromAdmin'
    })
end)

RegisterNetEvent('mt-speaker:client:adminRadioStop', function()
    
    adminRadioActive = false
    
    SendNUIMessage({
        action = 'stopMusicFromAdmin'
    })
end)

RegisterNetEvent('mt-speaker:client:adminRadioVolumeChange', function(data)    
    SendNUIMessage({
        action = 'updateVolumeFromAdmin',
        volume = data.volume
    })
end)

RegisterNetEvent('mt-speaker:client:updatePlayersListening', function(players)    
    SendNUIMessage({
        action = 'updatePlayersListening',
        players = players
    })
end)

RegisterNetEvent('mt-speaker:client:adminRadioPlayResponse', function(data)    
    SendNUIMessage({
        action = 'adminRadioPlayResponse',
        title = data.title
    })
end)

AddEventHandler('onResourceStop', function(resource)    
    if resource ~= GetCurrentResourceName() then return end
    if not placedSpeakers or not next(placedSpeakers) then return end
    for _, speaker in pairs(placedSpeakers) do
        local object = speaker.object
        if DoesEntityExist(object) then
            DeleteEntity(object)
        end
    end
end)

exports('PlaceSpeakerSmall', function() PlaceSpeaker('speaker_small') end)
exports('PlaceSpeakerMedium', function() PlaceSpeaker('speaker_medium') end)
exports('PlaceSpeakerMedium1', function() PlaceSpeaker('speaker_medium_1') end)
exports('PlaceSpeakerBig', function() PlaceSpeaker('speaker_big') end)

-- Exports

exports('PlaceSpeaker', PlaceSpeaker)
exports('RemoveSpeaker', RemoveSpeaker)
exports('OpenSpeakerUI', OpenSpeakerUI)
exports('OpenCarRadio', OpenCarRadio)

CreateThread(function()
    if Config.EnableCarRadio then
        RegisterCommand(Config.CarRadioCommand, function()
            OpenCarRadio()
        end, false)
        
        if Config.CarRadioKey then
            RegisterKeyMapping(Config.CarRadioCommand, 'Open Car Radio', 'keyboard', 'U') -- Default U, can be changed in game settings
        end
    end
end)