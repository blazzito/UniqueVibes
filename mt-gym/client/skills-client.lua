OldSkills = {}
Skills = {}
NeedToSave = false
DataArrived = false

RegisterNetEvent(LoadedEvent)
AddEventHandler(LoadedEvent, function()
    Citizen.Wait(10000)
	GetData()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        GetData()
    end
end)

function GetData()
    TSCB('mt_skills:server:getPlayerData', function(data)
        for k, v in pairs(data) do
            if v ~= nil then
                Skills[k] = v
                OldSkills[k] = v
            end
        end

        SetSkills() -- Set Skills
        DataArrived = true
    end)

    -- Remove Skills
    Citizen.CreateThread(function()
        while true do
            Wait(1000*60*Config.Skills.RemoveTime)
            for k, v in pairs(Skills) do
                if v > 1 then
                    Skills[k] -= 1
                end
            end
        end
    end)

    -- Save Skills
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000*60 * Config.Skills.SaveFrequency)
            for k, v in pairs(OldSkills) do
                if Skills[k] ~= OldSkills[k] then
                    NeedToSave = true
                    OldSkills[k] = Skills[k]
                end
            end

            if NeedToSave then
                NeedToSave = false
                TriggerServerEvent('mt_skills:server:UpdateSkill', Skills)
            end
        end
    end)

    -- Add Skills
    DefaultSkills()
end

-- Add Skill

RegisterNetEvent('mt_skills:client:AddSkill')
AddEventHandler('mt_skills:client:AddSkill', function(Skill, Value)
    if Config.Skills.SkillTypes[Skill] ~= nil then
        if Skills[Skill] + Value <= 100 then
            Skills[Skill] += Value

            local label = Config.Skills.SkillTypes[Skill].Label
            notification("Gimnasio", "+" .. Value .. " " .. label, Config.Skills.SkillNotifyTime, "success")
        else -- Set to maximum value
            Skills[Skill] = 100
        end

        SetSkills()
    end
end)

-- Set Skills

function SetSkills()
    local player = PlayerId()

    -- Stamina
    if Config.Skills.SkillTypes['Stamina'].Use then
        StatSetInt("MP0_STAMINA", Skills['Stamina'], true)
    end

    -- Running
    if Config.Skills.SkillTypes['Running'].Use then
        local value = 500
        if Config.Skills.SprintSpeedIncrease:upper() == 'FAST' then
            value = 300
        elseif Config.Skills.SprintSpeedIncrease:upper() == 'MEDIUM' then
            value = 400
        end

        SetRunSprintMultiplierForPlayer(player, 1.0+Skills['Running']/value)
        StatSetInt('MP0_LUNG_CAPACITY', Skills['Running'], true)
    end

    -- Driving
    if Config.Skills.SkillTypes['Driving'].Use then
        StatSetInt('MP0_DRIVING_ABILITY', Skills['Driving'], true)
    end

    -- Strength
    if Config.Skills.SkillTypes['Strength'].Use then
        local value = 500
        if Config.Skills.StrengthIncrease:upper() == 'HIGH' then
            value = 300
        elseif Config.Skills.StrengthIncrease:upper() == 'MEDIUM' then
            value = 400
        end

        StatSetInt("MP0_STRENGTH", Skills['Strength'], true)
        SetWeaponDamageModifier(("WEAPON_UNARMED"), 1.0+Skills['Strength']/value)
    end

    -- Swimming
    if Config.Skills.SkillTypes['Swimming'].Use then
        local value = 0
        if Config.Skills.SwimSpeedIncrease:upper() == 'FAST' then
            value = 300
        elseif Config.Skills.SwimSpeedIncrease:upper() == 'MEDIUM' then
            value = 400
        else
            value = 500
        end

        SetSwimMultiplierForPlayer(player, 1.0+Skills['Swimming']/value)
    end

    -- Shooting
    if Config.Skills.SkillTypes['Shooting'].Use then
        StatSetInt("MP0_SHOOTING_ABILITY", Skills['Shooting'], true)
    end
end

Citizen.CreateThread(function()
    RegisterCommand(Config.Skills.SkillMenu.Command, function(source, args, rawCommand)
        if DataArrived then
            Citizen.Wait(10)
            TriggerEvent('mt_skills:client:OpenMenu')
        end
    end)

    RegisterKeyMapping(Config.Skills.SkillMenu.Command, Config.Skills.SkillMenu.Label, "keyboard", Config.Skills.SkillMenu.Control)
    TriggerEvent('chat:addSuggestion', '/'.. Config.Skills.SkillMenu.Command ..'', Config.Skills.SkillMenu.Label)
end)

RegisterNetEvent('mt_skills:client:OpenMenu')
AddEventHandler('mt_skills:client:OpenMenu', function()
    SetNuiFocus(true,true)
    SendNUIMessage({action = "open", skills = Skills, skilltypes = Config.Skills.SkillTypes})
end)

RegisterNUICallback("UseButton", function(data)
	if data.action == "close" then
		SetNuiFocus(false,false)
    end
end)

function GetSkillCount(skilltype)
    for skill, value in pairs(Skills) do
        if skill == skilltype then
            return value
        end
    end
    return nil 
end


function AddSkillCount(skilltype, count)
    for skill, value in pairs(Skills) do
        if skill == skilltype then
            if Skills[skilltype] + count <= 100 then
                Skills[skilltype] += count
            end
        end
    end
    return nil 
end

function RemoveSkillCount(skilltype, count)
    for skill, value in pairs(Skills) do
        if skill == skilltype then
            if value >= 1 then
                Skills[skilltype] -= count
            end
        end
    end
    return nil 
end