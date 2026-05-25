ESX = Core
QBCore = Core

-- MT GYM UTILS
function notification(title, text, time, type)
    lib.notify({
        title = title,
        description = text,
        type = type,
        duration = time
    })
end

function AddSkill(Skill)
    -- You can use another skill system, but I think our the best :D, because that is simple and great
    if Config.MINIGAME then
        finished = exports["taskbarskill"]:taskBar(3700, 1)
        if finished == 100 then 
            TriggerEvent('mt_skills:client:AddSkill', Skill, 1)
        end
    else
        TriggerEvent('mt_skills:client:AddSkill', Skill, 1)
    end
    -- Trigger name, SKILL_NAME, AMOUNT
end

function TextUIFunction(type, text)
    if type == 'open' then
        if Config.TextUI:lower() == 'mt-notify' then
            exports['mt-notify']:displayTextUI(text)
        else
            lib.showTextUI(text)
        end
    elseif type == 'hide' then
        if Config.TextUI:lower() == 'mt-notify' then
            exports['mt-notify']:hideTextUI()
        else
            lib.hideTextUI()
        end
    end
end

function TextUI3DFunction(type, data)
    if type == 'add' then 
        if Config.TextUI:lower() == 'mt-notify' then
            exports['mt-notify']:create3DTextUI(data.id, {
                type = '3dtext',
                coords = data.position,
                text = data.text,
                key = 'E',
                displayDist = 5.0,
                interactDist = 1.2,
                event = data.triggerName,
                args = data.args,
                canInteract = function()
                    return not InTask and not Resting
                end
            })
        end    
    elseif type == 'remove' then 
        if Config.TextUI:lower() == 'mt-notify' then
            exports['mt-notify']:DeleteDrawText3D(data.id)
        end  
    end       
end

function TargetFunction(type, exportType, data)
    if type == 'add' then 
        if Config.Target:upper() == 'OXTARGET' then
            if exportType == 'entity' then 
                return exports.ox_target:addLocalEntity(data.entity, data.options)
            elseif exportType == 'coord' then 
                return exports.ox_target:addSphereZone(data)
            end
        elseif Config.Target:upper() == 'QB-TARGET' then 
            if exportType == 'entity' then 
                return exports['qb-target']:AddTargetEntity(data.entity,{
                    name = data.name,
                    options = data.options,
                    distance = data.distance
                })
            elseif exportType == 'coord' then 
                return exports['qb-target']:AddCircleZone(
                    data[1], -- name
                    data[2], -- coords
                    data[3], -- radius
                    data[4], -- zoneData
                    data[5]  -- targetData
                )
            end     
        end
    elseif type == 'remove' then 
        if Config.Target:upper() == 'OXTARGET' then
            exports.ox_target:removeZone(data.zone)
        elseif Config.Target:upper() == 'QB-TARGET' then 
            exports['qb-target']:RemoveZone(data.zone)
        end
    end
end

function ProgressBarFunction(time, text, anim)
    if Config.ProgressBar:lower() == 'ox_lib' then
        return lib.progressBar({
            duration = time,
            label = text,
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true,
                mouse = false
            },
            anim = anim
        })
    elseif Config.ProgressBar:lower() == 'progressbars' then
        exports['progressBars']:startUI(time, text)
        Citizen.Wait(time)
        return true
    elseif Config.ProgressBar:lower() == 'mythic_progbar' then
        TriggerEvent("mythic_progbar:client:progress", {name = "gym_exercise", duration = time, label = text, useWhileDead = false, canCancel = true})
        Citizen.Wait(time)
        return true
    elseif Config.ProgressBar:lower() == 'pogressbar' then
        exports['pogressBar']:drawBar(time, text)
        Citizen.Wait(time)
        return true
    end
end

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.025+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


--[[
    Exercise Play trigger: TriggerEvent('mt_skills:client:PlayExercise', exercise, heading)
]]