-- Job-specific garage system

-- Job tracking variables
jobName = nil
jobGrade = nil
PlayerData = {}
oldJobName = nil
oldJobGrade = nil

CreateThread(function()
    -- Wait for Framework to initialize
    while Framework == nil do
        Wait(5)
    end
    
    -- Function to load job-specific garages
    function loadJob()
        -- Wait for player data to be available
        while Fr.GetPlayerData() == nil do
            Wait(100)
        end
        
        -- Get current player data
        PlayerData = Fr.GetPlayerData()
        
        -- Store old job data
        oldJobGrade = jobGrade
        oldJobName = jobName
        
        -- Update current job data
        jobName = getJobName()
        jobGrade = getJobGrade()
        
        -- Remove blips from old job garages
        if oldJobName then
            for garageIndex, garageData in pairs(createdGarages) do
                local garage = garages[tostring(garageIndex)]
                
                if garage.Job then
                    if garage.Job.name == oldJobName then
                        RemoveBlip(garageData.Blip)
                    end
                end
            end
        end
        
        -- Add blips for new job garages
        if jobName then
            for garageIndex, garageData in pairs(createdGarages) do
                local garage = garages[tostring(garageIndex)]
                
                if garage.Job then
                    -- Check if garage belongs to current job
                    if garage.Job.name == jobName then
                        -- For owned type, show blip if job matches (grade check not needed)
                        local shouldShowBlip = false
                        if garage.Job.type == "owned" then
                            shouldShowBlip = true
                        elseif jobGrade and garage.Job.grade and jobGrade >= garage.Job.grade then
                            shouldShowBlip = true
                        end
                        
                        if shouldShowBlip then
                            local blipCoords
                            
                            -- Determine blip position based on garage type
                            if garage.Type ~= "car" then
                                -- Use AccessPoint for air/sea garages
                                blipCoords = vec3(
                                    garage.AccessPoint.x,
                                    garage.AccessPoint.y,
                                    garage.AccessPoint.z
                                )
                            else
                                -- Use CenterOfZone for car garages
                                blipCoords = vec3(
                                    garage.CenterOfZone.x,
                                    garage.CenterOfZone.y,
                                    garage.CenterOfZone.z
                                )
                            end
                            
                            -- Create blip if not disabled
                            if garage.blipDisabled == 0 or not garage.blipDisabled then
                                garageData.Blip = SH.addBlip(
                                    blipCoords,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(jobName)
                                )
                            end
                        end
                    end
                end
            end
        end
    end
    
    -- Register job update event
    RegisterNetEvent(Fr.JobUpdateEvent)
    
    -- Handle job update event
    AddEventHandler(Fr.JobUpdateEvent, function(newJobData)
        -- Update player job data
        PlayerData.job = newJobData
        
        -- Store old job data
        oldJobGrade = jobGrade
        oldJobName = jobName
        
        -- Update current job data
        jobName = getJobName()
        jobGrade = getJobGrade()
        
        -- Hide any active UI
        hideTextUI()
        
        -- Remove blips from old job garages
        if oldJobName then
            for garageIndex, garageData in pairs(createdGarages) do
                local garage = garages[tostring(garageIndex)]
                
                if garage.Job then
                    if garage.Job.name == oldJobName then
                        RemoveBlip(garageData.Blip)
                    end
                end
            end
        end
        
        -- Add blips for new job garages
        if jobName then
            for garageIndex, garageData in pairs(createdGarages) do
                local garage = garages[tostring(garageIndex)]
                
                if garage.Job then
                    -- Check if garage belongs to current job
                    if garage.Job.name == jobName then
                        -- For owned type, show blip if job matches (grade check not needed)
                        local shouldShowBlip = false
                        if garage.Job.type == "owned" then
                            shouldShowBlip = true
                        elseif jobGrade and garage.Job.grade and jobGrade >= garage.Job.grade then
                            shouldShowBlip = true
                        end
                        
                        if shouldShowBlip then
                            local blipCoords
                            
                            -- Determine blip position based on garage type
                            if garage.Type ~= "car" then
                                -- Use AccessPoint for air/sea garages
                                blipCoords = vec3(
                                    garage.AccessPoint.x,
                                    garage.AccessPoint.y,
                                    garage.AccessPoint.z
                                )
                            else
                                -- Use CenterOfZone for car garages
                                blipCoords = vec3(
                                    garage.CenterOfZone.x,
                                    garage.CenterOfZone.y,
                                    garage.CenterOfZone.z
                                )
                            end
                            
                            -- Create blip if not disabled
                            if garage.blipDisabled == 0 or not garage.blipDisabled then
                                garageData.Blip = SH.addBlip(
                                    blipCoords,
                                    Config.Blips[garage.Type].blipId,
                                    Config.Blips[garage.Type].blipColor,
                                    TranslateIt("blip_type_" .. garage.Type) .. ": " .. capitalizeWords(jobName)
                                )
                            end
                        end
                    end
                end
            end
        end
    end)
end)