-- Initialization file for garage system

-- UI language load state
isUiLanguageLoaded = false

-- Admin data structure
adminData = {
    name = "",
    avatar = "",
    group = "",
    identifiers = {},
    aceAllowed = false
}

-- Global data tables
_G.vehicleslabels = {}
_G.jobvehicles = {}
_G.gangvehicles = {}
_G.garages = {}
_G.impounds = {}

-- Event: Register a vehicle label
RegisterNetEvent("mt-garages:registerVehicleLabel", function(vehicleData)
    vehicleslabels[tostring(vehicleData.model)] = vehicleData
end)

-- Event: Delete a vehicle label
RegisterNetEvent("mt-garages:deleteVehicleLabel", function(modelHash)
    vehicleslabels[tostring(modelHash)] = nil
end)

-- Event: Create a job vehicle
RegisterNetEvent("mt-garages:createJobVehicle", function(vehicleData)
    jobvehicles[tostring(vehicleData.index)] = vehicleData
end)

-- Event: Delete a job vehicle
RegisterNetEvent("mt-garages:deleteJobVehicle", function(vehicleIndex)
    jobvehicles[tostring(vehicleIndex)] = nil
end)

-- Event: Create a gang vehicle
RegisterNetEvent("mt-garages:createGangVehicle", function(vehicleData)
    gangvehicles[tostring(vehicleData.index)] = vehicleData
end)

-- Event: Delete a gang vehicle
RegisterNetEvent("mt-garages:deleteGangVehicle", function(vehicleIndex)
    gangvehicles[tostring(vehicleIndex)] = nil
end)

-- Thread: Initialize UI language and currency settings
Citizen.CreateThread(function()
    -- Wait for UI language to be loaded
    while not isUiLanguageLoaded do
        Wait(0)
        
        local locale = string.lower(Config.Locale)
        
        -- Send language data to UI
        SendReactMessage("setLanguage", {
            locale = Locales[locale]
        })
        
        -- Send currency settings to UI
        SendReactMessage("setCurrency", {
            currency = Config.CurrencySettings.currency,
            style = Config.CurrencySettings.style,
            format = Config.CurrencySettings.format
        })
    end
end)

-- Event: On resource start
AddEventHandler("onResourceStart", function(resourceName)
    local currentResource = GetCurrentResourceName()
    
    -- Check if this is the correct resource
    if currentResource ~= resourceName then
        return
    end
    
    -- Verify resource name is correct
    if currentResource ~= "mt-garages" then
        return print("[ELMATA.DEV] Change script name to mt-garages!!")
    end
    
    -- Wait for UI language to load
    while not isUiLanguageLoaded do
        Wait(0)
    end
    
    print("Awaiting for server variables setup....")
    Wait(5000)
    
    -- Get basic data from server
    Fr.TriggerServerCallback("mt-garages:getBasicData", function(data)
        if data.error then
            return print("Unable to get Server-Side data")
        end
        
        -- Load all data from server
        garages = data.garages
        impounds = data.impounds
        jobvehicles = data.jobvehicles
        gangvehicles = data.gangvehicles
        vehicleslabels = data.vehicleslabels
        
        -- Initialize systems
        loadJob()
        loadGang()
        
        Wait(1000)
        
        loadGarages()
        loadImpounds()
    end)
    
    -- Get admin data
    Fr.TriggerServerCallback("mt-garages:setAdminData", function(data)
        adminData = data
    end)
end)

-- Thread: Handle player loaded event
Citizen.CreateThread(function()
    -- Wait for Framework to initialize
    while Framework == nil do
        Wait(5)
    end
    
    -- Register player loaded event
    RegisterNetEvent(Fr.PlayerLoaded)
    
    AddEventHandler(Fr.PlayerLoaded, function()
        local currentResource = GetCurrentResourceName()
        
        -- Verify resource name
        if currentResource ~= "mt-garages" then
            return print("[ELMATA.DEV] Change script name to mt-garages!!")
        end
        
        -- Get admin data
        Fr.TriggerServerCallback("mt-garages:setAdminData", function(data)
            adminData = data
        end)
        
        print("Awaiting for server variables setup....")
        Wait(5000)
        
        -- Get basic data from server
        Fr.TriggerServerCallback("mt-garages:getBasicData", function(data)
            if data.error then
                return print("Unable to get Server-Side data")
            end
            
            -- Load all data from server
            garages = data.garages
            impounds = data.impounds
            jobvehicles = data.jobvehicles
            gangvehicles = data.gangvehicles
            vehicleslabels = data.vehicleslabels
            
            Wait(2000)
            
            -- Initialize systems
            loadJob()
            loadGang()
            
            Wait(2000)
            
            loadGarages()
            loadImpounds()
        end)
    end)
end)