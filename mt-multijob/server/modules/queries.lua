local Query = {}

function Query:init()
    local response = MySQL.query.await('SHOW TABLES LIKE "multijob"')
    if response and #response == 0 then
        MySQL.query.await('CREATE TABLE multijob (id VARCHAR(255) PRIMARY KEY, jobs VARCHAR(800)) ' , {})
    end
end

function Query:loadJobs(s)
    local id = FW:GetIdentifier(s)
    if not id then return print("Failed to get identifier for player " .. s) end
    if not Identifiers then Identifiers = {} end
    Identifiers[s] = id

    if not Jobs[s] then Jobs[s] = {} end
    local response = MySQL.query.await('SELECT `jobs` FROM `multijob` WHERE `id` = ?', {
        id
    })
    if response and #response == 0 then 
        self:createPlayer(id)
        Jobs[s] = {unemployed = {gradeLabel = "Unemployed",grade = 0,label = "Unemployed"}}
    end
    if response and #response == 1 then
        for i = 1, #response do
            local row = response[i]
            local jobs = json.decode(row.jobs) or {}   
            Jobs[s] = jobs
        end
    end
end


function Query:createPlayer(id)
    MySQL.insert.await('INSERT INTO `multijob` (id, jobs) VALUES (?, ?)', {
         id, json.encode({unemployed = {gradeLabel = "Unemployed",grade = 0,label = "Unemployed"}})
    })
end

function Query:saveJobs(s)
    local id = Identifiers and Identifiers[s] or FW:GetIdentifier(s)
    if not id then return print("Failed to save jobs for player " .. s .. ": No identifier found.") end


    MySQL.update.await('UPDATE multijob SET jobs = ? WHERE id = ?', {
        json.encode(Jobs[s]), id
    })
    if Identifiers then Identifiers[s] = nil end
    Jobs[s] = nil
end


return Query