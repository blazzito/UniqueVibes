Citizen.CreateThread(function()
    -- Wait for Framework to be initialized
    while Framework == nil do
        Wait(5)
    end
    
    -- Function to add a temporary private garage
    function ClientaddTempPrivateGarage(label, garageType, coords, radius, privatePlayersList, callback)
        -- If privatePlayersList is a number, convert it to player data format
        if type(privatePlayersList) == "number" then
            local playerData = Fr.GetPlayerData()
            local playerId = trim(playerData[Fr.identificatorTable])
            
            privatePlayersList = {
                {
                    id = playerId,
                    name = ""
                }
            }
        end
        
        -- Prepare garage data
        local garageData = {
            Label = label,
            Type = garageType,
            Coords = coords,
            Radius = radius,
            PrivatePlayersList = privatePlayersList
        }
        
        -- Trigger server callback to register the garage
        Fr.TriggerServerCallback("mt-garages:registerGarage", function(result)
            callback(result)
        end, garageData)
    end
    
    -- Export the function
    exports("ClientaddTempPrivateGarage", ClientaddTempPrivateGarage)
    
    -- Function to remove a temporary private garage
    function ClientremoveTempPrivateGarage(garageId)
        TriggerServerEvent("mt-garages:deregisterGarage", garageId)
    end
    
    -- Export the function
    exports("ClientremoveTempPrivateGarage", ClientremoveTempPrivateGarage)
    
    -- Function to add a temporary gang garage
    function ClientaddTempGangGarage(label, garageType, coords, radius, gangName, gangGrade, mode, zPoints, oneSpawn, callback)
        -- Prepare gang garage data
        local garageData = {
            Label = label,
            Type = garageType,
            Coords = coords,
            Radius = radius,
            GangName = gangName,
            GangGrade = gangGrade,
            Mode = mode,
            zPoints = zPoints,
            onespawn = oneSpawn
        }
        
        -- Trigger server callback to add gang garage
        Fr.TriggerServerCallback("mt-garages:addTempGangGarage", function(result)
            callback(result)
        end, garageData)
    end
    
    -- Export the function
    exports("ClientaddTempGangGarage", ClientaddTempGangGarage)
    
    -- Function to remove a temporary gang garage
    function ClientremoveTempGangGarage(garageId)
        TriggerServerEvent("mt-garages:deregisterGarage", garageId)
    end
    
    -- Export the function
    exports("ClientremoveTempGangGarage", ClientremoveTempGangGarage)
end)