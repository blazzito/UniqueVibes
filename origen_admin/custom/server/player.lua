function GetPlayerHealth(player)
    return player.PlayerData.metadata.health or 200
end

function GetPlayerHunger(player)
    return player.PlayerData.metadata.hunger or 100
end

function GetPlayerThirst(player)
    return player.PlayerData.metadata.thirst or 100
end

function GetPlayerArmor(player)
    return player.PlayerData.metadata.armor or 0
end