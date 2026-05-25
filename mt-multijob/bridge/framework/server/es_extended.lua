local fn = {}
local ESX = exports.es_extended:getSharedObject()
local config = lib.load("shared/config")
local fn = lib.load("server/functions")

function fn:GetPlayer(id)
    return ESX.GetPlayerFromId(id)
end

function fn:GetIdentifier(id)
    local player = self:GetPlayer(id)
    return player and player.identifier or nil
end


function fn:GetJob(id)
    local player = self:GetPlayer(id)
    local job = player.job
    return {
        name = job.name,
        label = job.label,
        grade = job.grade,
        gradeLabel = job.grade_label
    }
end

function fn:SetJob(id, name, grade)
    local player = self:GetPlayer(id)
    if ESX.DoesJobExist(name, grade) then
        player.setJob(name, grade)
    else
        return print("Job not found!")
    end
end

function fn:GetData(id)
    local player = self:GetPlayer(id)
    return {
        name = player.get("firstName"),
        lastname = player.get("lastName"),
        group = player.group
    }
end

AddEventHandler('esx:playerLoaded', function(player, xPlayer, isNew)
    TriggerEvent("multijob:server:playerLoaded", player)
end)


AddEventHandler('esx:setJob', function(player, job, lastJob)
    local playerID = tostring(player)
    local jobs = Jobs and Jobs[playerID] or {}
    
    if (fn:countJobs(jobs) >= config.maxJobs) and not jobs[job.name] then 
        -- If an admin forcibly sets a job, we need to remove an old job to make room.
        -- We must NEVER remove 'unemployed'. Find another job to remove.
        local jobToRemove = nil
        for k, v in pairs(jobs) do
            if k ~= "unemployed" and k ~= job.name then
                jobToRemove = k
                break
            end
        end

        if jobToRemove then
            jobs[jobToRemove] = nil
            TriggerClientEvent('ox_lib:notify', player, {type="warning", description = "¡Un administrador te asignó un nuevo trabajo! Has perdido tu trabajo de: " .. jobToRemove})
        else
            -- Limit reached and couldn't find a job to replace. Revert to last job.
            fn:SetJob(playerID, lastJob.name, lastJob.grade)
            TriggerClientEvent('ox_lib:notify', player, {type="error", description = "¡No puedes aceptar otro trabajo! Debes renunciar a uno de tus trabajos actuales en tu menú de Multitrabajo."})
            return 
        end
    end
    
    TriggerEvent("multijob:server:onJobChange", playerID, {
        name = job.name,
        label = job.label,
        grade = job.grade,
        gradeLabel = job.grade_label
    }, lastJob)
end)


return fn