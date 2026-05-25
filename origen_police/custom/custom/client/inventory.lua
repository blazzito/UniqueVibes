function OpenStash(id, label, slots, weight, owner, private)
    print("^5[Inventory Debug]^0 OpenStash called with ID:", id, "Label:", label, "Slots:", slots, "Weight:", weight)
    if  Config.Inventory == "qb-inventory" or
        Config.Inventory == "qs-inventory" or
        Config.Inventory == "ls-inventory" or
        Config.Inventory == "codem-inventory"
    then
        print("^5[Inventory Debug]^0 QB-like inventory detected, triggering server event...")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", id, {
            maxweight = weight,
            slots = slots,
            label = label
        })
        TriggerEvent("inventory:client:SetCurrentStash", id)
    else
        print("^5[Inventory Debug]^0 Non-QB inventory detected, triggering callback...")
        FW_TriggerCallback("origen_police:server:OpenPoliceStash", function(data)
            print("^5[Inventory Debug]^0 Callback received for OpenStash")
            if not owner then
                local PlayerData = FW_GetPlayerData(false)
                owner = PlayerData.citizenid
            end
            print("^5[Inventory Debug]^0 Final owner for inventory:", owner)
            if Config.Inventory == "ox_inventory" then
                print("^5[Inventory Debug]^0 Opening OX inventory...")
                exports.ox_inventory:openInventory('stash', {id=id, owner = owner})
            elseif Config.Inventory == "tgiann-inventory" then
                print("^5[Inventory Debug]^0 Opening tgiann inventory...")
                exports["tgiann-inventory"]:OpenInventory('stash', id, nil, nil)
            elseif Config.Inventory == "origen_inventory" then
                -- Opened by server
                print("^5[Inventory Debug]^0 Origen inventory opened by server")
            else
                print("^5[Inventory Debug]^0 Inventory type not explicitly handled in callback:", Config.Inventory)
            end
        end, id, label, slots, weight, private)
    end
end

function OpenArmoury()
    local PlayerData = FW_GetPlayerData()
    local badge = PlayerData.metadata.police_badge or "0000"
    local jobLabel = PlayerData.job.label

    if PlayerData.job.name == "sheriff" then
        jobLabel = "BCSD"
    elseif PlayerData.job.name == "police" then
        jobLabel = "LSPD"
    elseif PlayerData.job.name == "sapd" then
        jobLabel = "SAPD"
    elseif PlayerData.job.name == "saspa" then
        jobLabel = "SASPA"
    end

    local serie = badge .. " | " .. jobLabel

    for _, v in pairs(Config.Armory.items) do
        if v.type == "weapon" then
            v.info = v.info or {}
            local randomSerial = string.format("%04X%04X", math.random(0x1000, 0xFFFF), math.random(0x1000, 0xFFFF))
            v.info.serie = randomSerial .. " | " .. jobLabel
        end
    end

    if  Config.Inventory == "qb-inventory" or
        Config.Inventory == "origen_inventory" or
        Config.Inventory == "qs-inventory" or
        Config.Inventory == "ls-inventory"
    then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "Equipment", Config.Armory)
    elseif Config.Inventory == "codem-inventory" then
        TriggerEvent('codem-inventory:OpenPlayerShop', Config.Armory.items)
    else
        FW_TriggerCallback("origen_police:server:OpenPoliceArmoury", function(data)
            if Config.Inventory == "ox_inventory" then
                exports.ox_inventory:openInventory('shop', { type = 'OrigenPoliceArmoury', id = 1})
            end
        end)
    end
end

function OpenAmbulanceArmoury()
    if  Config.Inventory == "qb-inventory" or
        Config.Inventory == "origen_inventory" or
        Config.Inventory == "qs-inventory" or
        Config.Inventory == "ls-inventory"
    then
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "AmbulanceEquipment", Config.AmbulanceArmory)
    elseif Config.Inventory == "codem-inventory" then
        TriggerEvent('codem-inventory:OpenPlayerShop', Config.AmbulanceArmory.items)
    else
        FW_TriggerCallback("origen_police:server:OpenAmbulanceArmoury", function(data)
            if Config.Inventory == "ox_inventory" then
                exports.ox_inventory:openInventory('shop', { type = 'OrigenAmbulanceArmoury', id = 1})
            end
        end)
    end
end

-- Ambulance Armoury Interaction Point
--[[
CreateThread(function()
    if not Config.AmbulanceArmory or not Config.AmbulanceArmory.coords then return end

    local armoryCoords = Config.AmbulanceArmory.coords
    local point = lib.points.new({
        coords = vec3(armoryCoords.x, armoryCoords.y, armoryCoords.z),
        distance = 5.0,
    })

    function point:onExit()
        lib.hideTextUI()
    end

    function point:nearby()
        DrawMarker(20, armoryCoords.x, armoryCoords.y, armoryCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 0, 150, 0, 200, false, true, 2, false, nil, nil, false)

        if self.currentDistance < 1.5 then
            local PlayerData = FW_GetPlayerData()
            if PlayerData and PlayerData.job and PlayerData.job.name == Config.AmbulanceArmory.job then
                if not lib.isTextUIOpen() then
                    lib.showTextUI('[E] - ' .. Config.AmbulanceArmory.label)
                end
                if IsControlJustPressed(0, 38) then
                    lib.hideTextUI()
                    OpenAmbulanceArmoury()
                end
            end
        elseif lib.isTextUIOpen() then
            lib.hideTextUI()
        end
    end
end)
]]

function OpenOtherPlayerInv(pID)
    if Config.Inventory == 'ox_inventory' then
        exports.ox_inventory:openNearbyInventory()
    elseif  Config.Inventory == 'qb-inventory' or
            Config.Inventory == "origen_inventory" or
            Config.Inventory == 'qs-inventory'or
            Config.Inventory == "ls-inventory"
    then
        TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", pID)
    elseif Config.Inventory == 'codem-inventory' then
        TriggerEvent('codem-inventory:client:openplayerinventory', pID)
        local isClose = true
        CreateThread(function()
            while isClose do
                local targetPed = GetPlayerPed(GetPlayerFromServerId(pID))
                if not targetPed then isClose = false return end
                local targetCoords = GetEntityCoords(targetPed)
                local playerCoords = GetEntityCoords(PlayerPedId())
                if #(targetCoords - playerCoords) >= 4.0 then
                    TriggerServerEvent('origen_police:server:SetInventoryRobStatus', pID, false)
                    isClose = false
                end
                Wait(3)
            end
        end)
    elseif Config.Inventory == 'core_inventory' then
        TriggerServerEvent('core_inventory:server:openInventory', pID, 'otherplayer', nil, nil, false)
    else
        TriggerServerEvent("origen_police:server:OpenOtherPlayerInv", pID)
    end
end

local animsToSearch = {
    { dict = 'missminuteman_1ig_2', anim = 'handsup_base', flag = 3 },
    { dict = 'mp_arresting', anim = 'idle', flag = 3 },
    { dict = 'random@mugging3', anim = 'handsup_standing_base', flag = 3},
    { dict = 'combat@damage@writhe', anim = 'writhe_loop', flag = 3 },
    { dict = 'veh@low@front_ps@idle_duck', anim = 'sit', flag = 3 },
    { dict = 'move_injured_ground', anim = 'front_loop', flag = 3 },
    { dict = 'dead', anim = 'dead_a', flag = 3 },
}

function CanSearchPlayer(player)
    -- Check if player can search another player
    -- Removed restrictions (hands up / cuffed) to allow searching anytime
    return true
end

function SearchClosestPlayer(playerId)
    local ped = PlayerPedId()
    local sId = tonumber(playerId)
    
    -- Get closest player in world for state detection (more reliable)
    local closestPlayer, closestDistance = FW_GetClosestPlayer()
    local targetPed = 0
    
    if closestPlayer ~= -1 and closestDistance <= 4.0 then
        targetPed = GetPlayerPed(closestPlayer)
    else
        -- Fallback to server ID if no one is physically close or detection fails
        local playerIdx = GetPlayerFromServerId(sId)
        if playerIdx ~= -1 then
            targetPed = GetPlayerPed(playerIdx)
        end
    end
    
    local animDict = "frisk@animation"
    local animName = "frisk_clip"
    
    -- Check if target is dead or injured to change police animation
    local isTargetDead = false
    if targetPed and targetPed ~= 0 and DoesEntityExist(targetPed) then
        local health = GetEntityHealth(targetPed)
        local isDeadNative = IsEntityDead(targetPed) or IsPedFatallyInjured(targetPed)
        local state = Entity(targetPed).state
        local stateIsDead = state.isDead or state.inLastStand or state.isdead or state.inlaststand
        
        -- Check for common downed/dead animations as fallback detection
        local isPlayingDeadAnim = IsEntityPlayingAnim(targetPed, "dead", "dead_a", 3) or 
                                IsEntityPlayingAnim(targetPed, "move_injured_ground", "front_loop", 3) or 
                                IsEntityPlayingAnim(targetPed, "combat@damage@writhe", "writhe_loop", 3) or
                                IsEntityPlayingAnim(targetPed, "veh@low@front_ps@idle_duck", "sit", 3)

        -- In many frameworks (like Qbox/QB), health 150 or 200 can be "downed" or "dead" 
        -- depending on the base health configuration (usually 100 base + 100 extra)
        isTargetDead = isDeadNative or stateIsDead or isPlayingDeadAnim or (health <= 150)
        
        if Config.Debug then
            print("^5[Search Debug]^0 TargetPed:", targetPed, "Health:", health, "AnimDead:", isPlayingDeadAnim, "StateDead:", stateIsDead, "FinalIsTargetDead:", isTargetDead)
        end
    end

    if isTargetDead then
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
        animName = "machinic_loop_mechandplayer"
    end
    
    -- Load dict
    RequestAnimDict(animDict)
    local timeout = 0
    while not HasAnimDictLoaded(animDict) and timeout < 100 do
        Wait(10)
        timeout = timeout + 1
    end

    ClearPedTasksImmediately(ped)
    Wait(100)
    
    -- Start animation manually before progress bar
    -- Flag 1 for searching on ground (full body), Flag 49 for standing frisk
    local flag = isTargetDead and 1 or 49
    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, flag, 0, false, false, false)
    
    TriggerServerEvent("origen_police:server:SyncSearch", sId, true)
    
    ProgressBar("search_player_inv", Config.Translations.Searching or "Searching", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, nil, {}, {}, function() -- Done
        StopAnimTask(ped, animDict, animName, 1.0)
        ClearPedTasksImmediately(ped)
        TriggerServerEvent("origen_police:server:SyncSearch", sId, false)
        OpenOtherPlayerInv(sId)
        StartSearchDistance(sId)
    end, function() -- Cancel
        StopAnimTask(ped, animDict, animName, 1.0)
        ClearPedTasksImmediately(ped)
        TriggerServerEvent("origen_police:server:SyncSearch", sId, false)
    end)
end

function GiveVehicleKeys(vehicle)
    -- Your code here
end

function GetPlayerItems(PlayerData)
    if Config.Inventory == "qs-inventory" then
        return exports['qs-inventory']:getUserInventory() or {}
    elseif Config.Inventory == "ls-inventory" then
        return exports["ls-inventory"]:GetPlayerItems() or {}
    elseif Config.Inventory == "origen_inventory" then
        return exports.origen_inventory:GetInventory() or {}
    elseif Config.Inventory == "ox_inventory" then
        return exports.ox_inventory:GetPlayerItems() or {}
    elseif Config.Inventory == "codem-inventory" then
        return exports["codem-inventory"]:GetClientPlayerInventory() or {}
    elseif Config.Inventory == 'core_inventory' then
        local inventory = -1
        FW_TriggerCallback("core_inventory:server:getInventory", function(data)
            inventory = data
        end)
        while inventory == -1 do
            Wait(0)
        end
        return inventory or {}
    end

    if not PlayerData then
        PlayerData = FW_GetPlayerData()
    end
    return PlayerData.items or {}
end

function GetItemFromWeapon(PlayerData, weapon)
    if Config.Inventory == "core_inventory" then
        local data = exports["core_inventory"]:GetCurrentWeaponData()
        data.label = Config.WeaponsLabels[data.name] or "Unknown"
        return data
    end
    if not PlayerData or not PlayerData.job then
        Debuger("GetItemFromWeapon called without logged in player")
        return nil
    end
    local hashes = {}
    local saveHashes = Config.Debug
    for _, v in pairs(GetPlayerItems(PlayerData)) do
        if saveHashes then
            hashes[v.name] = GetHashKey(v.name)
        end
        if GetHashKey(v.name) == weapon then
            return v
        end
    end
    print("Couldn't find weapon in inventory with hash: " .. weapon .. (saveHashes and " hashes: " .. json.encode(hashes) or ""))
    return nil
end

exports("GetPlayerItems", GetPlayerItems)

function LockInventory(value) -- To avoid the player to open the inventory
    if Config.Inventory == "ox_inventory" then
        return -- Looks like when searching other player inventory ox check if the inv is bussy, cause the player is cuffed agents can't search the inventory of cuffed players
    end
    if GetResourceState("qs-inventory") == "started" then
        exports['qs-inventory']:setInventoryDisabled(value)
    end
    LocalPlayer.state.invBusy = value
end