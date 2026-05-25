tempGaragesIndex = 5000

Citizen.CreateThread(function()
    -- Wait for Framework to be initialized
    while Framework == nil do
        Wait(5)
    end
    
    -- Export: Get all garages
    function getAllGarages()
        return garages
    end
    exports("getAllGarages", getAllGarages)
    
    -- Export: Get garage by index
    function getGarageByIndex(index)
        return garages[tostring(index)]
    end
    exports("getGarageByIndex", getGarageByIndex)
    
    -- Export: Get all impounds
    function getAllImpounds()
        return impounds
    end
    exports("getAllImpounds", getAllImpounds)
    
    -- Export: Get impound by index
    function getImpoundByIndex(index)
        return impounds[tostring(index)]
    end
    exports("getImpoundByIndex", getImpoundByIndex)
    
    -- Export: Get vehicles labels
    function getVehiclesLabels()
        return vehicleslabels
    end
    exports("getVehiclesLabels", getVehiclesLabels)
    
    -- Export: Get vehicle label by model
    function getVehicleLabelByModel(model)
        return vehicleslabels[tostring(model)]
    end
    exports("getVehicleLabelByModel", getVehicleLabelByModel)
    
    -- Test command
    RegisterCommand("testexports", function()
        local labels = exports["mt-garages"]:getVehiclesLabels()
        print(json.encode(labels))
    end)
end)