if Config.Framework ~= "esx" then return end
Framework = exports['es_extended']:getSharedObject()

Framework.Shared = {}
Framework.Functions = {}

Citizen.CreateThread(function()
    local attempt = 0
    Framework.Shared.Jobs = Framework.GetJobs()
    
    while next(Framework.Shared.Jobs) == nil do
        attempt = attempt + 1
        if attempt > 10 then
            print('^1Failed to load jobs^0')
            break
        end
        print('Loading job data...')
        Wait(1000)
        Framework.Shared.Jobs = Framework.GetJobs()
    end
end)

Framework.RegisterServerCallback("origen_admin:server:GetJobs", function(source, cb, data)
    while Framework.Shared.Jobs == nil do
        Citizen.Wait(0)
    end
    cb(Framework.Shared.Jobs)
end)

local items = {}

Citizen.CreateThread(function()
    local registeredItems = {}
    for k, v in pairs(Framework.Items) do 
        items[#items + 1] = {name = k, label = v.label}
        registeredItems[k] = true
    end
    for k, v in pairs(Framework.GetUsableItems()) do 
        if registeredItems[k] then goto continue end
        items[#items + 1] = {name = k, label = k}
        ::continue::
    end
    registeredItems = nil
end)

Framework.RegisterServerCallback("origen_admin:server:GetItems", function(source, cb, data)
    cb(items)
end)

Framework.Functions.GetPlayer = function(source)
    return ConvertESXPlayerData(Framework.GetPlayerFromId(source), nil)
end

Framework.Functions.GetPlayerByCitizenId = function(citizenid)
    return ConvertESXPlayerData(Framework.GetPlayerFromIdentifier(citizenid), citizenid)
end

Framework.Functions.HasPermission = function(source)
    local player = Framework.GetPlayerFromId(source)
    if not player then return -1 end
    for _, v in pairs(Config.PermissionList) do
        if Config.PermissionSystem then
            if IsPermissionValidSrc(source, v) then
                return true, v
            end
        else
            if player.group == v then
                return true, v
            end
        end
    end
    return false, nil
end

Framework.Functions.AddPermission = function(source, group)
    local player = Framework.GetPlayerFromId(source)
    if not player then return end
    player.setGroup(group)
end

function FW_CreateCallback(name, callback, mdw, mdwArgs)
    Framework.RegisterServerCallback(name, function(source, cb1, ...)
        if mdw then
            local args = {...}
            mdw(source, cb1, function()
                callback(source, cb1, table.unpack(args))
            end, mdwArgs and table.unpack(mdwArgs) or nil)
        else
            callback(source, cb1, ...)
        end
    end)
end

function FW_GetPlayer(source)
    return Framework.Functions.GetPlayer(tonumber(source))
end

function FW_GetPlayerFromCitizenid(citizenid)
    return Framework.Functions.GetPlayerByCitizenId(citizenid) or Framework.Functions.GetOfflinePlayerByCitizenId(citizenid)
end

function GetStatus(status, key)
    for i = 1, #status do
        if status[i].name == key then
            return (status[i].val / 10000) * 2
        end
    end
    return nil
end

function ConvertESXOfflinePlayer(identifier)
    local data = MySQL.query.await("SELECT * FROM users WHERE identifier = ? LIMIT 1", {identifier})
    if not data then return nil end
    data = data[1]
    if not data then return nil end
    local jobData = Framework.Shared.Jobs[data.job]
    if not jobData then
        print("Job info can't be found: " .. data.job)
        jobData = {
            name = data.job, 
            label = data.job,
            grades = {}
        }
    end
    local status = data.status and json.decode(data.status) or {}
    local metadata = json.decode(data.metadata) or {}
    metadata["hunger"] = GetStatus(status, "hunger")
    metadata["thirst"] = GetStatus(status, "thirst")
    metadata["health"] = GetStatus(status, "health")
    return {
        Functions = {

        },
        PlayerData = {
            license = data.identifier,
            citizenid = data.identifier,
            charinfo = {
                firstname = data.firstname,
                lastname = data.lastname,
                birthdate = data.dateofbirth,
                gender = data.sex,
            },
            job = {
                name = data.job,
                label = jobData.label,
                grade = {
                    level = data.job_grade,
                    label = (jobData.grades[tostring(data.job_grade)] and jobData.grades[tostring(data.job_grade)].label) or 'Unknown',
                    name = (jobData.grades[tostring(data.job_grade)] and jobData.grades[tostring(data.job_grade)].name) or 'Unknown',
                },
            },
            gang = {
                label = 'NONE'
            },
            money = json.decode(data.accounts) or {bank = 0, cash = 0},
            metadata = metadata,
            source = nil,
            items = json.decode(data.inventory) or {},
        }
    }
end

function ConvertESXPlayerData(xPlayer, identifier)
    if not xPlayer then
        if not identifier then return print("Trying to get player data of a offline player without identifier specified") end 
        return ConvertESXOfflinePlayer(identifier)
    end
    local metadata = xPlayer.metadata or {}
    metadata["health"] = GetEntityHealth(GetPlayerPed(xPlayer.source))
    for _, v in pairs(exports["esx_status"]:GetStatus(xPlayer.source)) do
        metadata[v.name] = (v.val / 10000) * 2
    end
    return {
        Functions = {
            SetMetaData = function(key, value)
                xPlayer.setMeta(key, value)
            end,
            SetJob = function(job, grade)
                xPlayer.setJob(job, grade)
            end,
            SetGang = function(gang, grade)
                SetGang(xPlayer.source, xPlayer.identifier, gang, grade)
            end,
            AddItem = function(item, amount)
                xPlayer.addInventoryItem(item, amount)
            end,
            AddMoney = function(account, name, reason)
                xPlayer.addAccountMoney(account, name)
            end
        },
        PlayerData = {
            license = xPlayer.identifier,
            citizenid = xPlayer.identifier,
            charinfo = {
                firstname = xPlayer.get("firstName"),
                lastname = xPlayer.get("lastName"),
                birthdate = xPlayer.get("dateofbirth"),
                gender = xPlayer.get("sex"),
            },
            job = {
                name = xPlayer.job.name,
                label = xPlayer.job.label,
                grade = {
                    level = xPlayer.job.grade,
                    label = xPlayer.job.grade_label,
                    name = xPlayer.job.grade_label
                },
            },
            gang = {
                label = 'UNKNOWN'
            },
            money = {bank = xPlayer.getAccount('bank').money, cash = xPlayer.getMoney()},
            metadata = metadata,
            source = xPlayer.source,
            items = xPlayer.inventory,
            group = xPlayer.getGroup()
        }
    }
end

local ESXPermissions = Framework.GetConfig()["AdminGroups"]

for _, group in pairs(Config.PermissionList) do 
    if not ESXPermissions[group] then 
        print("^3Looks like the group ^4" .. group .. " ^3is not defined in the es_extended config.lua, please add it to the es_extended/config.lua file ^0")
    end
end