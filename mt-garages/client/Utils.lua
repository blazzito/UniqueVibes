-- Utility Functions for Garage System

-- Function to send messages to React/NUI interface
function SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

-- Debug mode setup
local resourceName = GetCurrentResourceName()
local debugMode = GetConvarInt(string.format("%s-debugMode", resourceName), 0) == 1

-- Debug print function (only prints if debug mode is enabled)
function debugPrint(...)
    if not debugMode then
        return
    end
    
    local args = {...}
    local message = ""
    
    -- Concatenate all arguments into a single string
    for _, value in ipairs(args) do
        message = message .. " " .. tostring(value)
    end
    
    -- Format and print with resource name prefix
    local formattedMessage = string.format("^3[%s]^0%s", resourceName, message)
    print(formattedMessage)
end

-- Function to generate random license plate
function generatePlate()
    -- Seed random number generator with game timer
    math.randomseed(GetGameTimer())
    
    -- Define character set for plate generation
    local characters = {
        "A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
        "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
        "U", "V", "W", "X", "Y", "Z",
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"
    }
    
    local plate = nil
    
    -- Generate 8-character plate
    for i = 1, 8 do
        if plate == nil then
            plate = characters[math.random(#characters)]
        else
            plate = plate .. characters[math.random(#characters)]
        end
    end
    
    return plate
end