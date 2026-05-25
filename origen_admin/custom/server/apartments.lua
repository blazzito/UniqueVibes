local ApartmentStructure = {
    ["qs-housing"] = {
        table = "player_houses",
        label = "house",
        identifier = "owner"
    },
    ["origen_housing"] = {
        func = function(citizenid)
            local houses = exports.origen_housing:getOwnedHouses(citizenid)
            local result = {}
            if houses then
                for _, houseID in pairs(houses) do
                    local house = exports['origen_housing']:getHouse(houseID)
                    if type(house) == 'table' then
                        table.insert(result, { label = house.name })
                    end
                end
            end
            return result
        end
    },
    ["default"] = {
        ["qbcore"] = {
            table = "apartments",
            label = "label",
            identifier = "citizenid"
        },
        ["esx"] = {
            table = "users",
            label = "last_property",
            identifier = "identifier"
        }
    }
}

function GetPlayerApartments(citizenid)
    local status, data = pcall(function()
        if ApartmentStructure.func then
            return ApartmentStructure.func(citizenid)
        end
        if Config.Framework == "qbcore" then
            return MySQL.query.await("SELECT "..ApartmentStructure.label.." AS label FROM "..ApartmentStructure.table.." WHERE "..ApartmentStructure.identifier.." = @citizenid", {
                ["@citizenid"] = citizenid
            })
        elseif Config.Framework == "esx" then
            local data = MySQL.query.await("SELECT "..ApartmentStructure.label.." AS label FROM "..ApartmentStructure.table.." WHERE "..ApartmentStructure.identifier.." = @identifier", {
                ["@identifier"] = citizenid
            })
            if Config.HousingSystem == "default" then 
                return data[1] and {data[1]} or {}
            end
            return data
        end
    end)
    if not status then
        print("Error while fetching player apartments, may be you have to configure the apartments query: " .. data)
        return {}
    end
    return data
end

function AddPlayerApartment(citizenid, type)
    local status, data = pcall(function()
        -- You have to add the code to add the apartment to the database
    end)
    if not status then
        print("Error while adding player apartment, may be you have to configure the apartments query: " .. data)
        return false
    end
    return true
end

if Config.HousingSystem == "default" then 
    ApartmentStructure = ApartmentStructure["default"][Config.Framework]
else
    ApartmentStructure = ApartmentStructure[Config.HousingSystem]
end