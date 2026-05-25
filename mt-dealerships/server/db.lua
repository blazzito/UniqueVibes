MySQL.ready(function()
    -- Create dealerships table if not exists
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `mt_dealerships` (
            `id` VARCHAR(50) NOT NULL,
            `name` VARCHAR(100) NOT NULL,
            `data` LONGTEXT NOT NULL,
            `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
    ]])

    -- Create financing table if not exists
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `mt_dealership_financing` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `identifier` VARCHAR(60) NOT NULL,
            `vehicle_model` VARCHAR(50) NOT NULL,
            `vehicle_props` LONGTEXT NOT NULL,
            `total_price` INT NOT NULL,
            `remaining_price` INT NOT NULL,
            `installments_paid` INT DEFAULT 0,
            `total_installments` INT NOT NULL,
            `installment_amount` INT NOT NULL,
            `last_payment` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            `next_payment` TIMESTAMP NULL,
            `status` VARCHAR(20) DEFAULT 'active',
            `delayed_payments` INT DEFAULT 0,
            `dealership_id` VARCHAR(50) NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
    ]])
end)

DB = {}

function DB.GetDealerships()
    return MySQL.query.await('SELECT * FROM mt_dealerships')
end

function DB.SaveDealership(id, name, data)
    return MySQL.query.await([[
        INSERT INTO mt_dealerships (id, name, data) 
        VALUES (?, ?, ?) 
        ON DUPLICATE KEY UPDATE name = VALUES(name), data = VALUES(data)
    ]], {id, name, json.encode(data)})
end

function DB.DeleteDealership(id)
    return MySQL.query.await('DELETE FROM mt_dealerships WHERE id = ?', {id})
end

function DB.AddVehicleToPlayer(identifier, plate, model, props, garage, stored)
    local table = Framework.GetVehicleTable()
    local ownerCol = Framework.GetVehicleOwnerColumn()
    local isStored = stored ~= nil and stored or 0
    
    if Config.Framework == 'esx' then
        -- mt-garages ESX structure: owner, plate, vehicle (props), type, stored (0=in, 1=out), vehicleGarage (index)
        local result = MySQL.query.await([[
            INSERT INTO ]] .. table .. [[ (]] .. ownerCol .. [[, plate, vehicle, type, stored, vehicleGarage) 
            VALUES (?, ?, ?, ?, ?, ?)
        ]], { identifier, plate, json.encode(props), 'car', stored, garage })
        
        if Config.Debug then
            print("^3[Dealership DB Debug] Insert query result:^7", json.encode(result))
        end
        
        return result
    else -- QB
        return MySQL.query.await([[
            INSERT INTO ]] .. table .. [[ (]] .. ownerCol .. [[, plate, vehicle, hash, mods, garage, state) 
            VALUES (?, ?, ?, ?, ?, ?, ?)
        ]], {identifier, plate, model, GetHashKey(model), json.encode(props), garage, isStored})
    end
end

function DB.SaveFinancing(data)
    return MySQL.query.await([[
        INSERT INTO mt_dealership_financing 
        (identifier, vehicle_model, vehicle_props, total_price, remaining_price, total_installments, installment_amount, next_payment, dealership_id) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ]], {
        data.identifier, 
        data.model, 
        json.encode(data.props), 
        data.totalPrice, 
        data.remainingPrice, 
        data.installments, 
        data.installmentAmount, 
        data.nextPayment, 
        data.dealershipId
    })
end

function DB.GetActiveFinancing()
    return MySQL.query.await('SELECT *, UNIX_TIMESTAMP(next_payment) as next_payment_ts FROM mt_dealership_financing WHERE status = "active" AND next_payment <= CURRENT_TIMESTAMP')
end

function DB.UpdateFinancingPayment(id, remainingPrice, installmentsPaid, nextPayment)
    return MySQL.query.await([[
        UPDATE mt_dealership_financing 
        SET remaining_price = ?, installments_paid = ?, next_payment = ?, last_payment = CURRENT_TIMESTAMP, delayed_payments = 0
        WHERE id = ?
    ]], {remainingPrice, installmentsPaid, nextPayment, id})
end

function DB.AddDelayedPayment(id)
    return MySQL.query.await('UPDATE mt_dealership_financing SET delayed_payments = delayed_payments + 1 WHERE id = ?', {id})
end

function DB.UpdateFinancingStatus(id, status)
    return MySQL.query.await('UPDATE mt_dealership_financing SET status = ? WHERE id = ?', {status, id})
end

