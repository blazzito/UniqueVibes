Citizen.CreateThread(function()
    while not QBCore and not QBox do Wait(100) end
    
    Framework = exports['qb-core']:GetCoreObject()
    Fr.usersTable = "players"
    Fr.identificatorTable = "citizenid"
    Fr.Table = 'player_vehicles'
    Fr.VehProps = 'mods'
    Fr.OwnerTable = "citizenid"
    Fr.StoredTable = 'state'
    Fr.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded'

    Fr.IsPlayerDead = function(source)
        local Player = Fr.getPlayerFromId(source)
        if not Player then return false end
        return Player.PlayerData.metadata["isdead"] or Player.PlayerData.metadata["inlaststand"]
    end
    Fr.RegisterServerCallback = function(...) return Framework.Functions.CreateCallback(...) end
    Fr.GetPlayerFromIdentifier = function(identifier) return Framework.Functions.GetPlayerByCitizenId(identifier) end
    Fr.getPlayerFromId = function(...) return Framework.Functions.GetPlayer(...) end
    Fr.GetMoney = function(Player, account) 
        if not Player then return 0 end
        return Player.PlayerData.money[account == "money" and "cash" or account] 
    end
    Fr.ManageMoney = function(Player, account, action, amount)
        if not Player then return false end
        account = (account == "money" and "cash" or account)
        if action == "add" then return Player.Functions.AddMoney(account, amount)
        else return Player.Functions.RemoveMoney(account, amount) end
    end
    Fr.GetIndentifier = function(source) 
        local Player = Fr.getPlayerFromId(source)
        return Player and Player.PlayerData.citizenid or nil 
    end
    Fr.GetPlayerName = function(sourceOrIdentifier)
        local xPlayer = Fr.getPlayerFromId(sourceOrIdentifier)
        if xPlayer then return xPlayer.PlayerData.charinfo.firstname .." ".. xPlayer.PlayerData.charinfo.lastname end
        local result = MySQL.Sync.fetchAll("SELECT charinfo FROM players WHERE citizenid = @citizenid", {['@citizenid'] = trim(sourceOrIdentifier)})
        if result[1] then
            local info = json.decode(result[1].charinfo)
            return info.firstname .. " " .. info.lastname
        end
        return "Unknown"
    end
    Fr.GetGroup = function(source) return "Admin" end
    Fr.GetSourceFromPlayerObject = function(xPlayer) return xPlayer and xPlayer.PlayerData.source or nil end
    Fr.GetPlayerJob = function(xPlayer) 
        if not xPlayer then return { name = "unemployed", grade = 0 } end
        return { name = xPlayer.PlayerData.job.name, grade = xPlayer.PlayerData.job.grade.level } 
    end
    Fr.GetPlayerGang = function(xPlayer)
        if not xPlayer then return { name = "none", grade = 0 } end
        if GetResourceState('op-crime') == 'started' then
            local xSource = Fr.GetSourceFromPlayerObject(xPlayer)
            local havePerms = exports['op-crime']:checkPermissions(Fr.GetIndentifier(xSource), "garage_access")
            local grade = Config.ReverseGradeCheck and (havePerms and 50 or 0) or (havePerms and 0 or 50)
            return { name = tostring(Player(xSource).state.gangId), grade = grade }
        else
            return { name = xPlayer.PlayerData.gang.name, grade = xPlayer.PlayerData.gang.grade.level }
        end
    end
end)
