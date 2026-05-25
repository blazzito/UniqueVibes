Config = {}

Config.FuelLevelByStep = 100 -- Amount of fuel added in each step (only if not using UI)

-- TIPOS DE COMBUSTIBLE Y SUS EFECTOS
Config.Fuels = {
    ['a'] = {
        label = 'Gasolina 98',
        price = 2,
        consumption = 0.015, -- CONSUME POCO (Tanque dura más)
        performance = 1.0,   -- Velocidad normal
        powerMultiplier = 1.0 -- Potencia normal
    },
    ['b'] = {
        label = 'Gasolina 95',
        price = 1,
        consumption = 0.022, -- CONSUMO ESTÁNDAR
        performance = 1.0,
        powerMultiplier = 1.0
    },
    ['c'] = {
        label = 'Queroseno',
        price = 3,
        consumption = 0.035, -- CONSUME RÁPIDO
        performance = 1.1,   -- 10% más de velocidad punta
        powerMultiplier = 1.8 -- 80% MÁS DE ACELERACIÓN (Torque)
    }
}

-- Compatibilidad con mayúsculas por si acaso
Config.Fuels['A'] = Config.Fuels['a']
Config.Fuels['B'] = Config.Fuels['b']
Config.Fuels['C'] = Config.Fuels['c']

Config.Stations = {
    [1] = {
        name = "Gasolinera Central",
        coords = vector3(425.43, -1023.23, 28.91),
        stock = { a = 5000, b = 5000, c = 5000 },
        prices = { a = 2.0, b = 1.0, c = 3.0 }
    }
}

Config.FuelPumps = {
    "prop_gas_pump_1d",
    "prop_gas_pump_1a",
    "prop_gas_pump_1b",
    "prop_gas_pump_1c",
    "prop_vintage_pump",
    "prop_gas_pump_old2",
    "prop_gas_pump_old3"
}
