Citizen.CreateThread(function()
    MySQL.ready(function()
        MySQL.Async.execute([[
            CREATE TABLE IF NOT EXISTS `mt_skills` (
                `player` varchar(128) NOT NULL,
                `skills` LONGTEXT NOT NULL,
                PRIMARY KEY (`player`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]], {})
    end)
end)

RESCB("mt_skills:server:getPlayerData",function(source,cb)
    local src = source

    MySQL.Async.fetchAll('SELECT * FROM mt_skills WHERE player = @player', { ['@player'] = GetIdentifier(src)}, function(result)
        result = result[1]
        if result then
            local data = json.decode(result.skills)
            cb(data)
        else
            MySQL.Async.execute("INSERT INTO mt_skills(player,skills) VALUES (@player,@skills)", {
                ["@player"] = GetIdentifier(src),
                ["@skills"] = json.encode({['Stamina'] = 0, ['Running'] = 0, ['Driving'] = 0, ['Strength'] = 0, ['Swimming'] = 0, ['Shooting'] = 0})
            }, function(rowsChanged)
            end)
            cb({['Stamina'] = 0, ['Running'] = 0, ['Driving'] = 0, ['Strength'] = 0, ['Swimming'] = 0, ['Shooting'] = 0})
        end
    end)
end)

RegisterServerEvent('mt_skills:server:UpdateSkill')
AddEventHandler('mt_skills:server:UpdateSkill', function(Skills)
    local src = source
    local player = GetIdentifier(src)
    local skillsStr = json.encode(Skills)

    MySQL.Async.fetchAll('SELECT 1 FROM mt_skills WHERE player = @player', {['@player'] = player}, function(result)
        if result[1] then
            MySQL.Async.execute('UPDATE mt_skills SET skills = @skills WHERE player = @player', {["@player"] = player, ["@skills"] = skillsStr}, nil)
        else
            MySQL.Async.execute('INSERT INTO mt_skills (player, skills) VALUES (@player, @skills)', {["@player"] = player, ["@skills"] = skillsStr}, nil)
        end
    end)
end)