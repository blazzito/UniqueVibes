GangList = nil

FW_CreateCallback("origen_admin:server:GetGangs", function(source, cb)
    if not GangList then 
        GangList = {}
        if GetResourceState("origen_ilegal") == "started" then
            for k, v in pairs(exports["origen_ilegal"]:GetGangs()) do 
                GangList[k] = {label = k}
            end
        end
    end
    cb(GangList)
end)

function GetGangLabel(id, isOffline)
    local gangLabel = nil
    if GetResourceState("origen_ilegal") == "started" then 
        if isOffline then 
            gangLabel = MySQL.prepare.await("SELECT gang_id FROM origen_ilegal_gangs_members WHERE citizenid = ?", {id})
        else
            gangLabel = exports["origen_ilegal"]:GetGangID(tonumber(id))
        end
    end

    return gangLabel
end

function SetPlayerGang(player, id, gang, grade)
    if GetResourceState("origen_ilegal") == "started" then 
        exports["origen_ilegal"]:setGang(id, gang, tostring(grade))
    else 
        player.Functions.SetGang(gang, grade)
    end
end