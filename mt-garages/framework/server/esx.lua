Citizen.CreateThread(function()
    while not ESX do Wait(100) end
    
    Framework = exports["es_extended"]:getSharedObject()
    Fr.usersTable = "users"
    Fr.identificatorTable = "identifier"
    Fr.Table = 'owned_vehicles'
    Fr.VehProps = 'vehicle'
    Fr.OwnerTable = "owner"
    Fr.StoredTable = "stored"
    Fr.PlayerLoaded = 'esx:playerLoaded'

    Fr.IsPlayerDead = function(source) return Player(source).state.isDead end
    Fr.RegisterServerCallback = function(...) return Framework.RegisterServerCallback(...) end
    Fr.GetPlayerFromIdentifier = function(identifier) return Framework.GetPlayerFromIdentifier(identifier) end
    Fr.getPlayerFromId = function(...) return Framework.GetPlayerFromId(...) end
    Fr.GetMoney = function(xPlayer, account)
        if not xPlayer then return 0 end
        return xPlayer.getAccount(account).money 
    end
    Fr.ManageMoney = function(xPlayer, account, action, amount)
        if not xPlayer then return false end
        if action == "add" then return xPlayer.addAccountMoney(account, amount)
        else return xPlayer.removeAccountMoney(account, amount) end
    end
    Fr.GetIndentifier = function(source)
        local xPlayer = Fr.getPlayerFromId(source)
        return xPlayer and xPlayer.identifier or nil
    end
    Fr.GetPlayerName = function(sourceOrIdentifier)
        local xPlayer = Fr.getPlayerFromId(sourceOrIdentifier)
        local name
        if xPlayer then
            name = xPlayer.name
            if name == GetPlayerName(xPlayer.source) then
                name = xPlayer.get('firstName') .. ' ' .. xPlayer.get('lastName')
            end
        else
            local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {['@identifier'] = trim(sourceOrIdentifier)})
            name = result[1] and (result[1].firstname .. " " .. result[1].lastname) or "Unknown"
        end
        return name
    end
    Fr.GetGroup = function(source) 
        local xPlayer = Fr.getPlayerFromId(source)
        return xPlayer and xPlayer.getGroup() or "user" 
    end
    Fr.GetSourceFromPlayerObject = function(xPlayer) return xPlayer and xPlayer.source or nil end
    Fr.GetPlayerJob = function(xPlayer) 
        if not xPlayer then return { name = "unemployed", grade = 0 } end
        return { name = xPlayer.job.name, grade = xPlayer.job.grade } 
    end
    Fr.GetPlayerGang = function(xPlayer)
        if not xPlayer then return { name = "none", grade = 0 } end
        if GetResourceState('op-crime') == 'started' then
            local xSource = Fr.GetSourceFromPlayerObject(xPlayer)
            local havePerms = exports['op-crime']:checkPermissions(Fr.GetIndentifier(xSource), "garage_access")
            local grade = Config.ReverseGradeCheck and (havePerms and 50 or 0) or (havePerms and 0 or 50)
            return { name = tostring(Player(xSource).state.gangId), grade = grade }
        else
            return { name = xPlayer.job.name, grade = xPlayer.job.grade }
        end
    end
end)
