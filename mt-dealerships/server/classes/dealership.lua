Dealerships = {}
Dealerships.Cache = {}
Dealerships.LastUpdate = os.time()

function Dealerships.LoadAll()
    local results = DB.GetDealerships()
    Dealerships.Cache = {}
    for _, row in ipairs(results) do
        local data = json.decode(row.data)
        if data then
            Dealerships.Cache[row.id] = data
        end
    end
    local count = 0
    for _ in pairs(Dealerships.Cache) do count = count + 1 end
    print('[Dealership] Loaded ' .. count .. ' dealerships from database.')
end

function Dealerships.Get(id)
    return Dealerships.Cache[id]
end

function Dealerships.GetAll()
    return Dealerships.Cache
end

function Dealerships.GetAllArray()
    local dealerships = {}
    for _, dealership in pairs(Dealerships.Cache) do
        table.insert(dealerships, dealership)
    end
    return dealerships
end

function Dealerships.Save(id, name, data)
    Dealerships.Cache[id] = data
    Dealerships.LastUpdate = os.time()
    TriggerClientEvent('mt-dealerships:receiveData', -1, Dealerships.Cache, Dealerships.LastUpdate)
    return DB.SaveDealership(id, name, data)
end

function Dealerships.Delete(id)
    Dealerships.Cache[id] = nil
    Dealerships.LastUpdate = os.time()
    TriggerClientEvent('mt-dealerships:receiveData', -1, Dealerships.Cache, Dealerships.LastUpdate)
    return DB.DeleteDealership(id)
end

-- Initialize on start
CreateThread(function()
    Wait(1000)
    Dealerships.LoadAll()
end)
