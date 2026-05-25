Config.Debug = false
Config.Language = 'es'

Config.LoadDistance = 50.0
Config.UnloadDistance = 100.0
Config.UpdateInterval = 1000

Config.NPCInteractDistance = 3.0

Config.SetupMenu = {
    vehiclePlacing = 'adder'
}

Config.DealershipMenu = {
    defaultVehicleModel = 'sultan'
}

Config.TestDrive = {
    Timer = 60 * 1000,
    plate = 'TESTDRIVE',
}

Config.VehiclePurchase = {
    defaultGarage = 1, -- Default garage ID for mt-garages (Numeric)
    spawnVehicle = true, -- If true, the vehicle will be spawned when buying it, if false only save it in the garage
    giveKeysOnPurchase = true, -- If true, give the keys of the vehicle when buying it
    useOxLibProps = true, -- If true, use ox_lib for the vehicle properties
}


Config.JobVehicleLimits = {
    enabled = true, -- If true, limits the amount of vehicles of the SAME MODEL a player can buy in a job dealership category
    defaultLimit = 1, -- Default limit of same model vehicles a player can buy
    limits = {
        ['police'] = 1,
        ['ambulance'] = 1,
        ['sheriff'] = 1,
        ['sapd'] = 1,
    }
}

Config.Markers = {
    blips = {
        sprite = 524,
        color = 5,
        scale = 0.7,
        name = "Dealership",
    }
}

Config.FinancingConfig = {
    enabled = true,
    timeUnit = 'days', -- days, weeks, months, years
    maxPeriods = 12, -- max time in datatype
    interestRate = 5, -- interest rate in percentage per datatype time
    payInitialPercentage = 30, -- initial payment percentage or 0 to disable
    cronExpression = '*/10 * * * *', -- Check every 10 minutes using cron
    maxDelayedPayments = 3, -- Número máximo de cuotas que se pueden retrasar
}

Config.Camera = {
    enableCollisionCheck = false, -- Enable/Disable camera collision check
}

-- Configuración de grupos de administrador
Config.AdminGroups = {
    ['qb-core'] = {
        'admin',
        'god',
        'superadmin'
    },
    ['esx'] = {
        'superadmin',
        'subdirector',
        'director',
        'ceo',
        'founder'
    },
    ['qbx'] = {
        'admin',
        'god',
        'superadmin'
    }
}