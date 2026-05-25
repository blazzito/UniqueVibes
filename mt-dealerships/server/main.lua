-- Main Server Side logic

-- Callbacks
lib.callback.register('mt-dealerships:getDealershipsData', function(source, lastUpdate)
    if lastUpdate and lastUpdate >= Dealerships.LastUpdate then
        return { fullUpdate = false }
    end
    
    return {
        fullUpdate = true,
        dealerships = Dealerships.GetAll(),
        updateTime = Dealerships.LastUpdate
    }
end)

lib.callback.register('mt-dealerships:ui:getDealerships', function(source)
    if not Framework.IsAdmin(source) then
        return false
    end
    return Dealerships.GetAllArray()
end)

lib.callback.register('mt-dealerships:ui:saveAll', function(source, data)
    print("[Dealership Debug] Server saveAll called by source:", source)
    if (not data) then print("[Dealership Debug] Error: No data received") return { success = false, error = "No data received" } end
    
    if not Framework.IsAdmin(source) then 
        print("[Dealership Debug] Access denied for source:", source)
        return { success = false, error = "Access denied" } 
    end
    
    local dealershipsToSave = data.data or data
    print("[Dealership Debug] Processing " .. (type(dealershipsToSave) == "table" and #dealershipsToSave or 0) .. " dealerships")
    
    for _, dealershipData in pairs(dealershipsToSave) do
        local id = dealershipData.id
        if id then
            Dealerships.Save(id, dealershipData.name or id, dealershipData)
        end
    end
    
    return { success = true }
end)

lib.callback.register('mt-dealerships:ui:deleteDealership', function(source, data)
    if not Framework.IsAdmin(source) then return false end
    local id = data.dealership or data.id
    if not id then return false end
    
    return Dealerships.Delete(id)
end)

lib.callback.register('mt-dealerships:ui:forceUpdate', function(source)
    if not Framework.IsAdmin(source) then return false end
    Dealerships.LoadAll()
    return true
end)

lib.callback.register('mt-dealerships:ui:updateIndividualLocation', function(source, data)
    if not Framework.IsAdmin(source) then return false end
    
    local dealership = Dealerships.Get(data.dealershipId)
    if not dealership then return false end
    
    -- Map currentStage/locationType names to the correct fields in dealership data
    local fieldMapping = {
        ['car_exhibitor'] = 'cars_exhibitor',
        ['car_testdrive'] = 'car_testdrive',
        ['car_delivery'] = 'car_delivery',
        ['car_preview'] = 'car_preview',
        ['npc'] = 'npcs',
        ['markers'] = 'markers'
    }
    
    local targetField = fieldMapping[data.locationType] or data.locationType
    dealership[targetField] = data.locations
    
    Dealerships.Save(data.dealershipId, dealership.name or data.dealershipId, dealership)
    
    return true
end)

lib.callback.register('mt-dealerships:routingBucketHandler', function(source, state)
    if state then
        SetPlayerRoutingBucket(source, source + 100)
    else
        SetPlayerRoutingBucket(source, 0)
    end
    return GetPlayerRoutingBucket(source)
end)

-- Helper function to generate a unique plate (Max 8 characters for GTA)
local function GeneratePlate()
    local plate = nil
    local isTaken = true
    local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    while isTaken do
        plate = ""
        for i = 1, 8 do
            local rand = math.random(1, #charset)
            plate = plate .. charset:sub(rand, rand)
        end
        
        local result = MySQL.scalar.await('SELECT plate FROM owned_vehicles WHERE plate = ?', {plate})
        if not result then
            isTaken = false
        end
    end
    
    return plate
end

lib.callback.register('mt-dealerships:sv:purchaseVehicle', function(source, data)
    local player = Framework.GetPlayer(source)
    if not player then return { success = false, message = 'Player not found' } end
    
    local price = data.price
    if not price then return { success = false, message = 'Invalid price' } end
    local money = Framework.GetPlayerMoney(source, data.paymentMethod)
    
    if money < price then

        return { success = false, message = locale('notifications.insufficient_money') }
    end
    
    if Framework.RemovePlayerMoney(source, price, data.paymentMethod) then
        local plate = GeneratePlate()
        return { success = true, plate = plate }
    else
        return { success = false, message = 'Error processing payment' }
    end
end)

lib.callback.register('mt-dealerships:sv:addVehicleToDatabase', function(source, data)
    local identifier = Framework.GetPlayerIdentifier(source)
    if not identifier then return false end
    
    local plate = data.plate
    if plate then
        plate = plate:gsub("^%s*(.-)%s*$", "%1") -- Trim plate
    else
        plate = GeneratePlate()
    end
    
    local garage = data.garage or Config.VehiclePurchase.defaultGarage
    
    -- If the vehicle was spawned immediately, stored should be 1 (OUT)
    -- Otherwise, stored should be 0 (IN)
    local stored = Config.VehiclePurchase.spawnVehicle and 1 or 0
    
    local vehicleModel = data.model or data.vehicleModel
    if Config.Debug then
        print(string.format("^3[Dealership Debug] Attempting to add vehicle: Plate [%s] Model [%s] Garage [%s] Stored [%s]^7", plate, vehicleModel, garage, stored))
    end
    
    local success = DB.AddVehicleToPlayer(identifier, plate, vehicleModel, data.props, garage, stored)
    
    if success then
        if Config.Debug then print("^2[Dealership Debug] Vehicle added successfully to database^7") end
        return { success = true, plate = plate }
    else
        print("^1[Dealership Error] Failed to add vehicle to database! Check console for SQL errors.^7")
    end

    
    return { success = false }
end)


lib.callback.register('mt-dealerships:financing:financeVehicle', function(source, data)
    local identifier = Framework.GetPlayerIdentifier(source)
    if not identifier then return false end
    
    -- Calculate initial payment
    local initialPayment = math.floor(data.totalPrice * (Config.FinancingConfig.payInitialPercentage / 100))
    local money = Framework.GetPlayerMoney(source, 'bank') -- Financing usually via bank
    
    if money < initialPayment then
        return { success = false, message = locale('notifications.insufficient_money') }
    end
    
    if Framework.RemovePlayerMoney(source, initialPayment, 'bank') then
        -- Save financing to DB
        local nextPayment = os.time() + (24 * 60 * 60) -- Default 1 day
        if Config.FinancingConfig.timeUnit == 'days' then
            -- ... adjust based on config
        end
        
        local financeData = {
            identifier = identifier,
            model = data.model,
            props = data.props,
            totalPrice = data.totalPrice,
            remainingPrice = data.totalPrice - initialPayment,
            installments = data.installments,
            installmentAmount = data.installmentAmount,
            nextPayment = os.date('%Y-%m-%d %H:%M:%S', nextPayment),
            dealershipId = data.dealershipId
        }
        
        DB.SaveFinancing(financeData)
        return { success = true }
    end
    
    return { success = false }
end)

-- Events
RegisterNetEvent('mt-dealerships:requestInitialData', function()
    local src = source
    TriggerClientEvent('mt-dealerships:receiveData', src, Dealerships.GetAll(), Dealerships.LastUpdate)
end)

RegisterNetEvent('mt-dealerships:sv:testDriveStarted', function(data)
    local src = source
    -- Logic for test drive (e.g. logging)
    Debug.info('Player ' .. src .. ' started test drive of ' .. (data.model or 'unknown'))
end)

RegisterNetEvent('mt-dealerships:sv:testDriveEnded', function(data)
    local src = source
    -- Logic for test drive end
end)

-- Cron for financing payments
if Config.FinancingConfig.enabled then
    lib.cron.new(Config.FinancingConfig.cronExpression, function()
        Debug.info('Checking financing payments...')
        local dueFinancing = DB.GetActiveFinancing()
        
        for _, finance in ipairs(dueFinancing) do
            local src = Framework.GetPlayerSourceByIdentifier(finance.identifier)
            
            if src then
                local amount = finance.installment_amount
                if Framework.RemovePlayerMoney(src, amount, 'bank') then
                    local newRemaining = finance.remaining_price - amount
                    local newPaid = finance.installments_paid + 1
                    local nextPaymentDate = os.time()
                    
                    -- Adjust based on config
                    if Config.FinancingConfig.timeUnit == 'days' then
                        nextPaymentDate = nextPaymentDate + (24 * 60 * 60)
                    elseif Config.FinancingConfig.timeUnit == 'weeks' then
                        nextPaymentDate = nextPaymentDate + (7 * 24 * 60 * 60)
                    elseif Config.FinancingConfig.timeUnit == 'months' then
                        nextPaymentDate = nextPaymentDate + (30 * 24 * 60 * 60)
                    elseif Config.FinancingConfig.timeUnit == 'years' then
                        nextPaymentDate = nextPaymentDate + (365 * 24 * 60 * 60)
                    end
                    
                    if newRemaining <= 0 then
                        DB.UpdateFinancingStatus(finance.id, 'completed')
                        Debug.success('Financing completed for ' .. finance.identifier)
                    else
                        DB.UpdateFinancingPayment(finance.id, newRemaining, newPaid, os.date('%Y-%m-%d %H:%M:%S', nextPaymentDate))
                        Debug.info('Payment processed for ' .. finance.identifier)
                    end
                else
                    -- Insufficient money
                    DB.AddDelayedPayment(finance.id)
                    Debug.warning('Payment failed (insufficient money) for ' .. finance.identifier)
                    
                    if (finance.delayed_payments + 1) >= Config.FinancingConfig.maxDelayedPayments then
                        -- Optional: Logic to seize vehicle could go here
                        Debug.error('Financing reached max delayed payments for ' .. finance.identifier)
                    end
                end
            else
                -- Player offline
                -- We skip for now, they will be charged next time they are online and the cron runs
            end
        end
    end)
end
