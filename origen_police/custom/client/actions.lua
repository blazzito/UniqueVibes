RegisterNetEvent("origen_police:client:domyfinguer", function()
    local PlayerData = FW_GetPlayerData(false)
    local text = Config.Translations['domyfinguer']:format((PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname))
    UseCommand('me', text)
end)

function LeavePoliceEquipment(p)
    local PlayerData = FW_GetPlayerData(false)
    local invID = "armas_policiales_" .. (p.station or 0).."_"..PlayerData.citizenid
    local stashData = Config.Stashes.PoliceEquipment
    OpenStash(invID, stashData.label, stashData.slots, stashData.weight, PlayerData.citizenid, true)
end

function PoliceInventory(p)
    local PlayerData = FW_GetPlayerData(false)
    local invID = "inventario_policial_" .. (p.station or 0)
    local stashData = Config.Stashes.PoliceInventory
    OpenStash(invID, stashData.label, stashData.slots, stashData.weight, PlayerData.citizenid, false)
end

function OpenEvidenceInventory(p)
    OpenMenu('dialog', GetCurrentResourceName(), 'evidenceInventory', {
        title = "Enter the Evidence ID",
    }, function(data, menu)
        if type(data) ~= "table" then
            data = {value = data}
        end
        if data and data.value then
            local text = tostring(data.value)
            if text and text:gsub("%s+", "") ~= "" then
                local stashData = Config.Stashes.Evidence
                OpenStash("org_police_evidence_"..text, stashData.label.." "..text, stashData.slots, stashData.weight, nil, false)
            end

            menu.close()
        else
            ShowNotification(Config.Translations.MustEnterNumber)
        end
    end, function(data, menu)
        menu.close()
    end)
end

function CanOpenQuickAccessMenu()
    -- Check if player can open quick access menu
    local PlayerData = FW_GetPlayerData(false)
    if PlayerData == nil or PlayerData.job == nil or PlayerData.job.name == nil then return false end
    return (CanOpenTablet(PlayerData.job.name)[1] and PlayerData.job.onduty)
end

function CanHandCuff(targetPed, distance) -- This is a function to check if the player can handcuff another player
    if IsEntityDead(PlayerPedId()) then -- Block if self player is dead
        return false
    end

    return true
end

-- Should return the coords of the player, is mostly used for dispatch alerts(i.e. gungshots, etc)
-- By default it retrieves the coords of the local player entity, but sometimes you might want to get it from a different source(like a house enter point, etc)
function GetLocalPlayerPosition()
    return GetEntityCoords(PlayerPedId())
end

RegisterNUICallback('LoadFrecListCustom', function(data, cb)
    local radioData = {
        freq = {},
        buttons = {}
    }
    
    local srcOrdered = Config.MultifrecOrdered or {}
    if #srcOrdered == 0 then
        srcOrdered = Config.CustomRadio or {}
    end

    local cleanOrdered = {}
    for _, v in pairs(srcOrdered) do
        if type(v) == "table" and type(v.category) == "string" then
            local cleanFreqs = {}
            if type(v.freqs) == "table" then
                -- Reconstruir freqs para evitar sparse arrays o mixed keys
                for _, freq in pairs(v.freqs) do
                    if type(freq) == "string" or type(freq) == "number" then
                        table.insert(cleanFreqs, tostring(freq))
                    end
                end
            end
            table.insert(cleanOrdered, { category = v.category, freqs = cleanFreqs })
        end
    end

    radioData.freq = cleanOrdered
    cb(radioData)
end)

RegisterNUICallback('LoadRadioCustom', function(data, cb)
    local radioData = {
        myfrec = "",
        freclist = {}
    }
    
    local srcOrdered = Config.MultifrecOrdered or {}
    if #srcOrdered == 0 then
        srcOrdered = Config.CustomRadio or {}
    end

    local cleanOrdered = {}
    for _, v in pairs(srcOrdered) do
        if type(v) == "table" and type(v.category) == "string" then
            local cleanFreqs = {}
            if type(v.freqs) == "table" then
                -- Reconstruir freqs para evitar sparse arrays o mixed keys
                for _, freq in pairs(v.freqs) do
                    if type(freq) == "string" or type(freq) == "number" then
                        table.insert(cleanFreqs, tostring(freq))
                    end
                end
            end
            table.insert(cleanOrdered, { category = v.category, freqs = cleanFreqs })
        end
    end

    radioData.freclist = cleanOrdered
    cb(radioData)
end)