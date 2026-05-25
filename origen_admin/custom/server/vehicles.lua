local GarageStructure = {
    ["cd_garage"] = {
        vehicle = "JSON_UNQUOTE(JSON_EXTRACT(vehicle, '$.model'))",
        plate = "plate",
        garage = {
            ["qbcore"] = "parking",
            ["esx"] = "garage_id"
        }
    },
    ["okokGarage"] = {
        vehicle = "JSON_UNQUOTE(JSON_EXTRACT(vehicle, '$.model'))",
        plate = "plate",
        garage = "parking"
    },
    ["default"] = {
        ["qbcore"] = {
            vehicle = "vehicle",
            plate = "plate",
            garage = "garage"
        },
        ["esx"] = {
            vehicle = "JSON_UNQUOTE(JSON_EXTRACT(vehicle, '$.model'))",
            plate = "plate",
            garage = "garage"
        }
    }
}

local function GetStructureField(data)
    if type(data) == "table" then
        return data[Config.Framework]
    end
    return data
end

function GetPlayerVehicles(citizenid)
    local status, data = pcall(function()
        if GarageStructure.func then
            return GarageStructure.func(citizenid)
        end
        if Config.Framework == "qbcore" then
            return MySQL.query.await("SELECT "..GarageStructure.vehicle.." AS label, "..GarageStructure.plate.." AS subData, "..GarageStructure.garage.." AS garage FROM player_vehicles WHERE citizenid = @citizenid", {
                ["@citizenid"] = citizenid
            })
        elseif Config.Framework == "esx" then
            return MySQL.query.await("SELECT "..GarageStructure.vehicle.." AS label, "..GarageStructure.plate.." as subData, "..GarageStructure.garage.." AS garage FROM owned_vehicles WHERE owner = @identifier", {
                ["@identifier"] = citizenid
            })
        end
    end)
    if not status then
        print("Error while fetching player vehicles, may be you have to configure the vehicles query: " .. data)
        return {}
    end
    return data
end

function AddPlayerVehicle(citizenid, model)
    local status, data = pcall(function()
        -- You have to add the code to add the vehicle to the database
        print("You've to configure your query to add the vehicle to the database")
    end)
    if not status then
        print("Error while adding player vehicle, may be you have to configure the vehicle query: " .. data)
        return false
    end
    return true
end

if Config.GarageSystem == "default" then 
    GarageStructure = GarageStructure["default"][Config.Framework]
else
    GarageStructure = GarageStructure[Config.GarageSystem]
end
for k, v in pairs(GarageStructure) do
    GarageStructure[k] = GetStructureField(v)
end