local math_abs = math.abs
local math_cos = math.cos
local math_sin = math.sin
local math_sqrt = math.sqrt
local math_max = math.max
local math_min = math.min
local activeSounds = {}
local lastHudSpeaker = nil

function CreateSound(speakerId, videoId, volume, startSeconds)
    if activeSounds[speakerId] then
        DestroySound(speakerId)
    end
    
    activeSounds[speakerId] = {
        videoId = videoId,
        volume = volume,
        isPlaying = true
    }
    
    SendNUIMessage({
        action = 'createSound',
        data = {
            speakerId = speakerId,
            videoId = videoId,
            volume = volume,
            startSeconds = startSeconds or 0
        }
    })
end

function DestroySound(speakerId)
    if activeSounds[speakerId] then
        activeSounds[speakerId] = nil
        
        SendNUIMessage({
            action = 'destroySound',
            data = {
                speakerId = speakerId
            }
        })
    end
end

function UpdateSoundVolume(speakerId, volume)
    if activeSounds[speakerId] then
        activeSounds[speakerId].volume = volume
        
        SendNUIMessage({
            action = 'updateVolume',
            data = {
                speakerId = speakerId,
                volume = volume
            }
        })
    end
end

function PauseSound(speakerId)
    if activeSounds[speakerId] then
        activeSounds[speakerId].isPlaying = false
        
        SendNUIMessage({
            action = 'pauseSound',
            data = {
                speakerId = speakerId
            }
        })
    end
end

function ResumeSound(speakerId)
    if activeSounds[speakerId] then
        activeSounds[speakerId].isPlaying = true
        
        SendNUIMessage({
            action = 'resumeSound',
            data = {
                speakerId = speakerId
            }
        })
    end
end

-- Received periodically from the server to keep vehicle radio state alive for
-- players who were far away when the radio started. Updates state so the sync
-- thread can create audio when the player gets close enough.
RegisterNetEvent('mt-speaker:client:vehicleRadioKeepAlive', function(speakerId, videoId, volume, elapsed)
    if not speakerId:match("^vehicle_") then return end
    if not placedSpeakers[speakerId] then
        placedSpeakers[speakerId] = {
            isVehicle = true,
            isPlaying = true,
            videoId = videoId,
            volume = volume,
            gameTimerRef = GetGameTimer() - (elapsed * 1000)
        }
    else
        -- Refresh volume; only set gameTimerRef if not already tracking (preserve existing sync)
        placedSpeakers[speakerId].volume = volume
        placedSpeakers[speakerId].isPlaying = true
        placedSpeakers[speakerId].videoId = videoId
        if not placedSpeakers[speakerId].gameTimerRef then
            placedSpeakers[speakerId].gameTimerRef = GetGameTimer() - (elapsed * 1000)
        end
    end
end)

RegisterNetEvent('mt-speaker:client:playMusic', function(speakerId, videoId, volume)
    if speakerId:match("^vehicle_") then
        -- Always register the state so the sync thread can manage it for approaching players
        if not placedSpeakers[speakerId] then
            placedSpeakers[speakerId] = {}
        end
        placedSpeakers[speakerId].isPlaying = true
        placedSpeakers[speakerId].videoId = videoId
        placedSpeakers[speakerId].volume = volume
        placedSpeakers[speakerId].isVehicle = true
        -- Record client-side game timer when the song starts so approaching players sync correctly
        placedSpeakers[speakerId].gameTimerRef = GetGameTimer()

        -- Create sound immediately only if the vehicle is already in range
        local plate = speakerId:gsub("^vehicle_", "")
        local playerCoords = GetEntityCoords(PlayerPedId())
        local carRange = Config.CarRadioRange or 30.0

        for _, vehicle in ipairs(GetGamePool('CVehicle')) do
            if GetVehicleNumberPlateText(vehicle) == plate then
                local dist = #(playerCoords - GetEntityCoords(vehicle))
                if dist <= carRange then
                    CreateSound(speakerId, videoId, volume, 0)
                end
                break
            end
        end
        return
    end

    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].isPlaying = true
        placedSpeakers[speakerId].videoId = videoId
        placedSpeakers[speakerId].volume = volume
        placedSpeakers[speakerId].gameTimerRef = GetGameTimer()
    end

    local speaker = placedSpeakers[speakerId]
    if not speaker then return end

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local speakerCoords = vector3(speaker.x, speaker.y, speaker.z)
    local distance = #(playerCoords - speakerCoords)
    local speakerRange = speaker.range or Config.MaxDistance or 50.0

    if distance <= speakerRange then
        CreateSound(speakerId, videoId, volume, 0)
    end
end)

RegisterNetEvent('mt-speaker:client:stopMusic', function(speakerId)
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].isPlaying = false
        placedSpeakers[speakerId].videoId = nil
    end
    DestroySound(speakerId)
end)

RegisterNetEvent('mt-speaker:client:volumeChanged', function(speakerId, volume)
    UpdateSoundVolume(speakerId, volume)
    
    if placedSpeakers[speakerId] then
        placedSpeakers[speakerId].volume = volume
    end
end)

RegisterNetEvent('mt-speaker:client:pauseMusic', function(speakerId)
    PauseSound(speakerId)
end)

RegisterNetEvent('mt-speaker:client:resumeMusic', function(speakerId)
    ResumeSound(speakerId)
end)

CreateThread(function()
    while true do
        Wait(Config.SyncInterval)
        
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local soundCount = 0

        for speakerId, speaker in pairs(placedSpeakers) do
            if speaker.isPlaying and speaker.videoId then
                if speakerId:match("^vehicle_") then
                    local plate = speakerId:gsub("^vehicle_", "")
                    local carRange = Config.CarRadioRange or 30.0

                    for _, vehicle in ipairs(GetGamePool('CVehicle')) do
                        if GetVehicleNumberPlateText(vehicle) == plate then
                            local dist = #(playerCoords - GetEntityCoords(vehicle))
                            if dist <= carRange and not activeSounds[speakerId] then
                                local elapsed = speaker.gameTimerRef and math.max(0, (GetGameTimer() - speaker.gameTimerRef) / 1000) or 0
                                CreateSound(speakerId, speaker.videoId, speaker.volume or Config.DefaultVolume, elapsed)
                            elseif dist > carRange and activeSounds[speakerId] then
                                DestroySound(speakerId)
                            end
                            break
                        end
                    end
                else
                    local speakerCoords = vector3(speaker.x, speaker.y, speaker.z)
                    local distance = #(playerCoords - speakerCoords)
                    local speakerRange = speaker.range or Config.MaxDistance or 50.0
                    if distance <= speakerRange and not activeSounds[speakerId] then
                        local elapsed = speaker.gameTimerRef and math.max(0, (GetGameTimer() - speaker.gameTimerRef) / 1000) or 0
                        CreateSound(speakerId, speaker.videoId, speaker.volume or Config.DefaultVolume, elapsed)
                    elseif distance > speakerRange and activeSounds[speakerId] then
                        DestroySound(speakerId)
                    end
                end
            end
        end
        
        local speakerDistances = {}
        for speakerId, soundData in pairs(activeSounds) do
            soundCount = soundCount + 1
            local speaker = placedSpeakers[speakerId]
            local sourceCoords = nil
            local baseVolume = Config.DefaultVolume / 100.0
            
            if speakerId:match("^vehicle_") then
                local plate = speakerId:gsub("^vehicle_", "")
                local vehicles = GetGamePool('CVehicle')
                
                for _, vehicle in ipairs(vehicles) do
                    local vehiclePlate = GetVehicleNumberPlateText(vehicle)
                    if vehiclePlate == plate then
                        sourceCoords = GetEntityCoords(vehicle)
                        baseVolume = (soundData.volume or 50) / 100.0
                        break
                    end
                end
            elseif speaker then
                sourceCoords = vector3(speaker.x, speaker.y, speaker.z)
                baseVolume = (speaker.volume or 50) / 100.0
            end
            
            if sourceCoords then
                local distance = #(playerCoords - sourceCoords)
                
                local speakerHeading = nil
                if speaker and speaker.heading then
                    speakerHeading = speaker.heading
                end
                
                speakerDistances[#speakerDistances+1] = {
                    speakerId = speakerId,
                    distance = distance,
                    sourceCoords = sourceCoords,
                    baseVolume = baseVolume,
                    heading = speakerHeading
                }
            else
                DestroySound(speakerId)
            end
        end
        
        local closestSpeaker = nil
        local closestDistance = math.huge
        
        for _, speakerData in ipairs(speakerDistances) do
            if speakerData.distance < closestDistance then
                closestDistance = speakerData.distance
                closestSpeaker = speakerData.speakerId
            end
        end

        -- HUD Update logic
        if closestSpeaker then
            if lastHudSpeaker ~= closestSpeaker then
                local speaker = placedSpeakers[closestSpeaker]
                if speaker and speaker.isPlaying then
                    lastHudSpeaker = closestSpeaker
                    SendNUIMessage({
                        action = 'updateNowPlaying',
                        title = speaker.title or 'Unknown'
                    })
                end
            end
        elseif lastHudSpeaker then
            lastHudSpeaker = nil
            SendNUIMessage({
                action = 'updateNowPlaying',
                title = nil
            })
        end
        
        for _, speakerData in ipairs(speakerDistances) do
            local speakerId = speakerData.speakerId
            local distance = speakerData.distance
            local baseVolume = speakerData.baseVolume
            
            local speakerRange = speakerId:match("^vehicle_") and (Config.CarRadioRange or 30.0)
                or (placedSpeakers[speakerId] and placedSpeakers[speakerId].range)
                or Config.MaxDistance or 50.0
            
            if distance > speakerRange then
                DestroySound(speakerId)
            else
                local volumeFactor = 1.0 - (distance / speakerRange)
                volumeFactor = volumeFactor ^ 1.5
                
                if Config.EnableDirectionalAudio and speakerData.heading then
                    local directionFactor = CalculateDirectionalFactor(
                        speakerData.sourceCoords,
                        speakerData.heading,
                        playerCoords
                    )
                    volumeFactor = volumeFactor * directionFactor
                end
                
                local isDominant = (speakerId == closestSpeaker)
                
                if Config.EnableDominantSpeaker and not isDominant and #speakerDistances > 1 then
                    local distanceDiff = distance - closestDistance
                    
                    if distanceDiff < Config.EchoPreventionDistance then
                        local attenuationFactor = distanceDiff / Config.EchoPreventionDistance
                        attenuationFactor = attenuationFactor ^ 2.0
                        volumeFactor = volumeFactor * (0.1 + (attenuationFactor * (Config.NonDominantVolumeMax - 0.1)))
                    end
                end
                
                local adjustedVolume = baseVolume * volumeFactor
                
                SendNUIMessage({
                    action = 'set3DVolume',
                    data = {
                        speakerId = speakerId,
                        volume = adjustedVolume
                    }
                })
            end
        end
    end
end)

local function getCameraDirection()
    local cameraRotation = GetGameplayCamRot(0)

    local radiansZ = (cameraRotation.z * 0.0174532924)
    local radiansX = (cameraRotation.x * 0.0174532924)
    local xCos     = math_abs(math_cos(radiansX))

    return {
        x = (-math_sin(radiansZ) * xCos),
        y = (math_cos(radiansZ) * xCos),
        z = math_sin(radiansX),
    }
end

function CalculateDirectionalFactor(speakerCoords, speakerHeading, playerCoords)

    local cameraDir = getCameraDirection()
    local toSpeaker = speakerCoords - playerCoords
    local distanceToSpeaker = math_sqrt(toSpeaker.x * toSpeaker.x + toSpeaker.y * toSpeaker.y + toSpeaker.z * toSpeaker.z)

    local frontVolume = Config.DirectionalFrontVolume or 1.0
    local sideVolume = Config.DirectionalSideVolume or 0.7
    local backVolume = Config.DirectionalBackVolume or 0.3
    
    local directionFactor = frontVolume
    
    if distanceToSpeaker > 0.01 then
        local toSpeakerNorm = {
            x = toSpeaker.x / distanceToSpeaker,
            y = toSpeaker.y / distanceToSpeaker,
            z = toSpeaker.z / distanceToSpeaker
        }
        
        local dotProduct = cameraDir.x * toSpeakerNorm.x + cameraDir.y * toSpeakerNorm.y + cameraDir.z * toSpeakerNorm.z
        
        local cameraFactor = 0.3 + (dotProduct + 1.0) / 2.0 * 0.7
        
        cameraFactor = math_max(0.3, math_min(1.0, cameraFactor))
        
        directionFactor = directionFactor * cameraFactor
    end
    
    return directionFactor
end

function GetClosestSpeaker()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local closestSpeaker = nil
    local closestDistance = Config.InteractionDistance
    
    for speakerId, speakerData in pairs(placedSpeakers) do
        if not speakerData.isVehicle and speakerData.x and speakerData.y and speakerData.z then
            local speakerCoords = vector3(speakerData.x, speakerData.y, speakerData.z)
            local distance = #(playerCoords - speakerCoords)
            
            if distance < closestDistance then
                closestDistance = distance
                closestSpeaker = speakerId
            end
        end
    end
    
    return closestSpeaker, closestDistance
end

function GetPlayerSpeakers()
    return playerSpeakers
end

function GetAllSpeakers()
    return placedSpeakers
end

exports('CreateSound', CreateSound)
exports('DestroySound', DestroySound)
exports('UpdateSoundVolume', UpdateSoundVolume)
exports('GetClosestSpeaker', GetClosestSpeaker)
exports('GetPlayerSpeakers', GetPlayerSpeakers)
exports('GetAllSpeakers', GetAllSpeakers)