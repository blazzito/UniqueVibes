TruckerConfig = {}

TruckerConfig.JobName = 'camionero'

TruckerConfig.Blip = {
    Coords = vec3(6441.9263, -1687.5035, 16.7559), -- Port of LS area
    Sprite = 477,
    Color = 4,
    Scale = 0.8,
    Label = 'Camioneros'
}

TruckerConfig.NPC = {
    Model = 'S_M_M_Trucker_01',
    Coords = vector4(6441.9263, -1687.5035, 16.7559, 29.1772),
}

TruckerConfig.Locations = {
    VehicleSpawn = {
        vector4(6456.1084, -1676.8564, 16.9771, 107.5699),
    },
    TrailerSpawn = {
        vector4(6471.1895, -1669.4988, 16.5545, 105.1194),
    },
    VehicleReturn = vector3(6472.2446, -1677.4327, 16.3211) -- Dedicated return spot near NPC
}

-- Vehicle configuration
TruckerConfig.Trucks = {
    { model = 'phantom', label = 'Phantom Classic', minLevel = 1, paymentFactor = 1.0 },
    { model = 'hauler', label = 'Hauler Pro', minLevel = 3, paymentFactor = 1.3 },
    { model = 'packer', label = 'Packer', minLevel = 1, paymentFactor = 1.0 }
}

TruckerConfig.Trailers = {
    { model = 'trailers', label = 'Remolque de Carga', minLevel = 1, paymentFactor = 1.0 },
    { model = 'trailers2', label = 'Remolque de Maquinaria', minLevel = 3, paymentFactor = 1.2 },
    { model = 'tanker', label = 'Cisterna Industrial', minLevel = 5, paymentFactor = 1.4 },
    { model = 'tanker2', label = 'Cisterna de Combustible', minLevel = 8, paymentFactor = 1.6 }
}

-- Delivery routes Point A to Point B
TruckerConfig.Routes = {
    {
        label = 'Entrega Piere',
        targetCoords = vector3(6063.4980, -1715.4825, 16.8496),
        minLevel = 1,
        payment = 400
    },
    {
        label = 'Entrega Great Ocean',
        targetCoords = vector3(6088.2275, -1532.8970, 16.9056),
        minLevel = 1,
        payment = 500
    },
    {
        label = 'Entrega Mirror',
        targetCoords = vector3(5677.2461, -1970.0085, 2.6106),
        minLevel = 1,
        payment = 300
    },
    {
        label = 'Entrega Grapeseed',
        targetCoords = vector3(5557.1338, -1703.5974, 16.3335),
        minLevel = 5,
        payment = 1000
    },
    {
        label = 'Entrega Willies',
        targetCoords = vector3(4669.6841, -1774.8035, 18.7123),
        minLevel = 8,
        payment = 1200
    },
    {
        label = 'Entrega REED',
        targetCoords = vector3(4692.9419, -1511.4039, 8.6002),
        minLevel = 8,
        payment = 1200
    },
    {
        label = 'Entrega Grapeseed RED`S',
        targetCoords = vector3(4641.0259, -2115.4719, 9.9291),
        minLevel = 5,
        payment = 1200
    },
    {
        label = 'Entrega Marina Drive',
        targetCoords = vector3(5854.8262, -2487.6265, 2.7652),
        minLevel = 5,
        payment = 1200
    },
    {
        label = 'Entrega Clucking Chicken UpTown',
        targetCoords = vector3(5682.1313, -2168.6704, 2.7149),
        minLevel = 8,
        payment = 1000
    },
    {
        label = 'Entrega Clucking Town',
        targetCoords = vector3(7341.2920, -3088.5708, 5.8103),
        minLevel = 13,
        payment = 1000
    },
    {
        label = 'Entrega Clucking Chicken Paleto',
        targetCoords = vector3(7477.1309, -3188.8794, 5.8081),
        minLevel = 13,
        payment = 1000
    },
}

TruckerConfig.Payment = {
    Penalty = 200 -- Deposit penalty
}

