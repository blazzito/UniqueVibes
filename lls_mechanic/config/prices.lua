Config = Config or {}

-- The vehicle price will be the first option and will change the upgrades price 
Config.VehicleOverridePrice = {
}

-- If a is not included in "Config.VehicleOverridePrice" then price of the vehicle will be as the class
Config.VehicleClassPrice = {
    ['0'] = 0, -- Compacts
    ['1'] = 0, -- Sedans
    ['2'] = 0, -- SUVs
    ['3'] = 0, -- Coupes
    ['4'] = 0, -- Muscle
    ['5'] = 0, -- Sports Classics
    ['6'] = 0, -- Sports
    ['7'] = 0, -- Super
    ['8'] = 0, -- Motorcycles
    ['9'] = 0, -- Off-road
    ['10'] = 0, -- Industrial
    ['11'] = 0, -- Utility
    ['12'] = 0, -- Vans
    ['13'] = 0, -- Cycles
    ['14'] = 0, -- Boats
    ['15'] = 0, -- Helicopters
    ['16'] = 0, -- Planes
    ['17'] = 0, -- Service
    ['18'] = 0, -- Emergency
    ['20'] = 0 -- Commercial
}

-- If a is not included in "Config.VehicleOverridePrice" and the class of the vehicle is not included in the "Config.VehicleClassPrice" the price will be as the "Config.VehicleDefaultPrice"
Config.VehicleDefaultPrice = 0

-- This multiplier will add to the parts multiplier for the position that is not for whitelist job
Config.PriceMultiplierWithoutTheJob = 2.0

-- The price of the repair for the points with whitelist job (for the open points the "Config.PriceMultiplierWithoutTheJob" multiplier will apply)
Config.VehicleRepairPrice = 0

-- The multiplier of parts for the points with whitelist job (for the open points the "Config.PriceMultiplierWithoutTheJob" multiplier will add to that)
Config.VehicleCustomisePriceMultiplier = {
    ['engine'] = {5.0, 7.95, 20.56, 25.00, 30.00, 35.00},
    ['brakes'] = {2.0, 4.65, 9.30, 18.60, 20.0},
    ['transmission'] = {5.0, 10.95, 15.93, 20.51, 25.0},
    ['suspension'] = {1.5, 3.72, 7.44, 10.88, 15.77, 25.20, 30.0},
    ['armor'] = {20.0, 50.77, 60.77, 65.0, 75.0, 90.0, 100.0, 115.0},
    ['turbo'] = {5.0, 15.81},

    ['extras'] = 0.0,
    ['windowTint'] = 0.0,

    ['horn'] = 0.0,
    ['speakers'] = 0.0,
    ['trunk'] = 0.0,
    ['hydrulics'] = 0.0,
    ['engine_block'] = 0.0,
    ['air_filter'] = 0.0,
    ['struts'] = 0.0,
    ['tank'] = 0.0,

    ['spoilers'] = 0.0,
    ['front_bumper'] = 0.0,
    ['rear_bumper'] = 0.0,
    ['side_skirts'] = 0.0,
    ['exhaust'] = 0.0,
    ['cage'] = 0.0,
    ['grille'] = 0.0,
    ['hood'] = 0.0,
    ['left_fender'] = 0.0,
    ['right_fender'] = 0.0,
    ['roof'] = 0.0,
    ['arch_cover'] = 0.0,
    ['aerials'] = 0.0,
    ['wings'] = 0.0,
    ['windows'] = 0.0,

    ['dashboard'] = 0.0,
    ['dashboard_color'] = 0.0,
    ['dial'] = 0.0,
    ['door_speaker'] = 0.0,
    ['seat'] = 0.0,
    ['steering_wheel'] = 0.0,
    ['shifter_leaver'] = 0.0,
    ['ornaments'] = 0.0,
    ['interior'] = 0.0,
    ['plaques'] = 0.0,
    ['interior_color'] = 0.0,

    ['primary_paint'] = 0.0,
    ['secondary_paint'] = 0.0,
    ['primary_paint_type'] = 0.0,
    ['secondary_paint_type'] = 0.0,
    ['pearlescent'] = 0.0,

    ['wheels_color'] = 0.0,
    ['smoke_color'] = 0.0,

    ['sport'] = 0.0,
    ['muscle'] = 0.0,
    ['lowrider'] = 0.0,
    ['suv'] = 0.0,
    ['offroad'] = 0.0,
    ['tuner'] = 0.0,
    ['bike_wheels'] = 0.0,
    ['high_end'] = 0.0,
    ['bennys_original'] = 0.0,
    ['bennys_bespoke'] = 0.0,
    ['open_wheel'] = 0.0,
    ['street'] = 0.0,

    ['plate_type'] = 0.0,
    ['plate_color'] = 0.0,
    ['plate_holder'] = 0.0,

    ['xenon'] = 0.0,
    ['neon'] = 0.0,

    ['stickers'] = 0.0,
    ['livery'] = 0.0
}
