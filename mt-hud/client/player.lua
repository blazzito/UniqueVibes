local lastVitals = { health = -1, armor = -1, hunger = -1, thirst = -1, stamina = -1, oxygen = -1 }
local location = {}

local function UpdateHUD(data)
    local shouldSend = false
    local sendData = {}
    for k, v in pairs(data) do
        if v and (lastVitals[k] == nil or math.abs(lastVitals[k] - v) > 0.1) then
            lastVitals[k] = v
            sendData[k] = v
            shouldSend = true
        end
    end
    if shouldSend then
        SendNUIMessage({ action = 'updateVitals', data = sendData })
    end
end

function GetStreetName(coords)
    local streetName, streetName2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    streetName = GetStreetNameFromHashKey(streetName)
    streetName2 = GetStreetNameFromHashKey(streetName2)
    return (streetName2 == "") and streetName or (streetName .. " & " .. streetName2)
end

function GetCardinalFromHeading(h)
    if h < 22.5 or h >= 337.5 then return "Norte"
    elseif h < 67.5 then return "Noroeste"
    elseif h < 112.5 then return "Oeste"
    elseif h < 157.5 then return "Suroeste"
    elseif h < 202.5 then return "Sur"
    elseif h < 247.5 then return "Sureste"
    elseif h < 292.5 then return "Este"
    else return "Noreste" end
end

function StartStatusLoop()
    CreateThread(function()
        while IsPlayerLoaded() do
            local ped = PlayerPedId()
            local playerId = PlayerId()
            local coords = GetEntityCoords(ped)
            


            local maxHealth = GetEntityMaxHealth(ped)
            local health = GetEntityHealth(ped)
            local healthPercent = 0
            
            if maxHealth <= 100 then
                healthPercent = (health / maxHealth) * 100
            else
                healthPercent = ((health - 100) / (maxHealth - 100)) * 100
            end
            
            UpdateHUD({
                health = math.min(100, math.max(0, healthPercent)),
                armor = math.min(100, GetPedArmour(ped)),
                stamina = math.min(100, math.floor(100 - GetPlayerSprintStaminaRemaining(playerId))),
                oxygen = math.min(100, math.floor(GetPlayerUnderwaterTimeRemaining(playerId) * 10)),
            })

            Wait(150)
        end
    end)
end

CreateThread(function()
    local isPaused = false
    while true do
        Wait(500)
        local pauseActive = IsPauseMenuActive()
        if pauseActive and not isPaused then
            isPaused = true
            SendNUIMessage({ action = 'setVisible', value = false })
        elseif not pauseActive and isPaused then
            isPaused = false
            SendNUIMessage({ action = 'setVisible', value = true })
        end
    end
end)

local function RegisterStateBagHandlers()
    local serverId = GetPlayerServerId(PlayerId())
    
    AddStateBagChangeHandler('hunger', ('player:%s'):format(serverId), function(_, _, value)
        UpdateHUD({ hunger = value })
    end)

    AddStateBagChangeHandler('thirst', ('player:%s'):format(serverId), function(_, _, value)
        UpdateHUD({ thirst = value })
    end)
end

CreateThread(function()
    while not IsPlayerLoaded() do Wait(1000) end
    RegisterStateBagHandlers()
end)

RegisterNetEvent('esx_status:onTick', function(status)
    local hunger, thirst
    for _, s in ipairs(status) do
        if s.name == 'hunger' then 
            hunger = s.percent and math.floor(s.percent) or math.floor(s.val / 10000)
        end
        if s.name == 'thirst' then 
            thirst = s.percent and math.floor(s.percent) or math.floor(s.val / 10000)
        end
    end
    if hunger or thirst then
        UpdateHUD({ hunger = hunger, thirst = thirst })
    end
end)
