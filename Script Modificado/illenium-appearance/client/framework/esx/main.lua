if not Framework.ESX() then return end

local ESX = exports["es_extended"]:getSharedObject()
Framework.PlayerData = nil

RegisterNetEvent("esx:playerLoaded", function(xPlayer)
    Framework.PlayerData = xPlayer
    client.job = Framework.PlayerData.job
    client.gang = Framework.PlayerData.gang
    client.citizenid = Framework.PlayerData.identifier
    InitAppearance()
end)

RegisterNetEvent("esx:onPlayerLogout", function()
    Framework.PlayerData = nil
end)

RegisterNetEvent("esx:setJob", function(job)
	Framework.PlayerData.job = job
    client.job = Framework.PlayerData.job
    client.gang = Framework.PlayerData.job
end)

local function getRankInputValues(rankList)
    local rankValues = {}
    for _, v in pairs(rankList) do
        rankValues[#rankValues + 1] = {
            label = v.label,
            value = v.grade
        }
    end
    return rankValues
end

function Framework.GetPlayerGender()
    local data = ESX.GetPlayerData()
    if data and data.sex then
        Framework.PlayerData = data
        return data.sex == "f" and "Female" or "Male"
    end
    return "Male"
end

function Framework.UpdatePlayerData()
    local data = ESX.GetPlayerData()
    if data and data.identifier then
        Framework.PlayerData = data
        client.job = data.job
        client.gang = data.job
        client.citizenid = data.identifier
    end
end

function Framework.HasTracker()
    return false
end

function Framework.CheckPlayerMeta()
    local data = ESX.GetPlayerData()
    if not data then return false end
    Framework.PlayerData = data
    return (data.dead or false) or (data.ped and IsPedCuffed(data.ped) or false)
end

function Framework.IsPlayerAllowed(citizenid)
    return Framework.PlayerData and citizenid == Framework.PlayerData.identifier
end

function Framework.GetRankInputValues(type)
    local jobGrades = lib.callback.await("illenium-appearance:server:esx:getGradesForJob", false, client[type].name)
    return getRankInputValues(jobGrades)
end

function Framework.GetJobGrade()
    return client.job.grade
end

function Framework.GetGangGrade()
    return client.gang.grade
end

function Framework.CachePed()
    ESX.SetPlayerData("ped", cache.ped)
end

function Framework.RestorePlayerArmour()
    return nil
end
