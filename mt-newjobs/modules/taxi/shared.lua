TaxiConfig = {
    JobName = "taxi",
    Label = "Taxi",
    BossGrade = 4, -- Jefe de Flota grade

    Blip = {
        Coords = vector3(4989.0493, -1902.6945, 20.3841),
        Sprite = 198,
        Color = 5,
        Scale = 0.8,
        Label = "Central de Taxis"
    },

    -- Posiciones por defecto (NYC)
    DefaultLocations = {
        Duty = vector4(4989.0493, -1902.6945, 20.3841, 185.2120),
        VehicleSpawn = vector4(4993.1172, -1909.4789, 20.2555, 265.7189),
        VehicleSave = vector4(4984.0264, -1909.7937, 20.2719, 86.8018),
        Wardrobe = vector4(900.56, -176.12, 74.7, 230.0),
        Stash = vector4(892.37, -174.55, 74.7, 230.0),
    },

    -- Vehículos disponibles para spawnar
    Vehicles = {
        { model = "taxi", label = "Taxi Clásico" },
        { model = "emperor2", label = "Emperor" },
    },

    -- Misiones de NPC (carreras aleatorias)
    NPCMissions = {
        Enabled = true,
        CooldownBetweenMissions = 30, -- segundos
        PaymentPerKm = 15,
        MinPayment = 50,
        MaxPayment = 500,
        PickupRadius = 50.0,
        DropoffRadius = 5.0,
        -- Puntos de recogida/destino aleatorios
        Locations = {
            { coords = vector3(6149.4385, -3855.5654, 14.2322),   label = "Billards" },
            { coords = vector3(5604.0791, -3114.1243, 8.6600), label = "Comisaria de NYC" },
            { coords = vector3(5151.6216, -2606.1152, 14.7096),   label = "Parque Central" },
            { coords = vector3(7540.9434, -2920.2100, 6.0811),label = "Aeropuerto" },
            { coords = vector3(4207.0610, -1561.7728, 18.8071), label = "UwU Cafe" },
            { coords = vector3(4618.1851, -3068.9060, 4.8117), label = "NYC Fitness" },
            { coords = vector3(5305.4219, -3325.8958, 14.7641),   label = "Wiwang Tower" },
            { coords = vector3(5218.1313, -3505.5730, 14.8013), label = "WhiteWidow" },
            { coords = vector3(4918.1147, -3538.3604, 14.3048),  label = "Iglesia" },
            
            -- Puntos Extra
            { coords = vector3(5152.1729, -2386.5249, 14.7131), label = "Zona Urbana Sur" },
            { coords = vector3(4811.4824, -2138.2122, 14.7574), label = "Zona Comercial" },
            
            -- Alrededores del Centro
            { coords = vector3(4907.5693, -1985.5409, 24.6279), label = "Centro - Norte" },
            { coords = vector3(4727.8799, -1969.2058, 19.5158), label = "Centro - Noroeste" },
            { coords = vector3(4727.3481, -2823.7190, 9.7421), label = "Centro - Este" },
            { coords = vector3(4724.0605, -3067.8762, 9.8600), label = "Centro - Sureste" },
            { coords = vector3(4811.0933, -3325.7393, 14.5820), label = "Centro - Sur" },
            { coords = vector3(4811.1465, -2688.1921, 14.8130), label = "Centro - Zona Media" },
            { coords = vector3(5030.7271, -3134.1362, 14.7707), label = "Centro - Residencial" },
            { coords = vector3(4970.9087, -3212.3665, 14.7148), label = "Centro - Oficinas" },
            
            -- Hospital y Alrededores
            { coords = vector3(4977.5288, -3839.3030, 4.9358), label = "Hospital Central" },
            { coords = vector3(5198.5903, -3910.3354, 14.7623), label = "Clínica Este" },
            { coords = vector3(5506.9761, -3656.5007, 4.9598), label = "Urgencias Sur" },
            { coords = vector3(4637.2773, -3007.1375, 6.6604), label = "Clínica Oeste" },
            
            -- Orillas (Puntos Interesantes)
            { coords = vector3(4587.9473, -2176.3669, 9.9116), label = "Orilla 1" },
            { coords = vector3(4633.0010, -2438.7251, 9.4104), label = "Orilla 2" },
            { coords = vector3(4830.6392, -1506.7389, 11.6041), label = "Mirador Norte" },
            { coords = vector3(4918.4170, -1827.9272, 20.3997), label = "Zona Alta" },
            { coords = vector3(5054.0376, -1844.6134, 20.4159), label = "Colinas Este" },
            { coords = vector3(5280.4243, -2101.5125, 14.6685), label = "Mirador Este" },
            { coords = vector3(5151.8823, -2651.6152, 14.6609), label = "Residencial Este" },
            { coords = vector3(5152.1348, -3442.7993, 14.7063), label = "Parque Sur" },
            { coords = vector3(5152.9238, -3720.8945, 14.7505), label = "Zona Industrial" },
            { coords = vector3(5312.1494, -3483.3772, 14.7754), label = "Mirador Sur" },
            { coords = vector3(4888.1187, -3313.9404, 14.7669), label = "Plaza Sur" },
            { coords = vector3(4912.9136, -3124.9458, 14.7607), label = "Plaza Central" },
            { coords = vector3(4919.1040, -1932.9183, 25.4666), label = "Altos del Centro" },
            
            -- Puntos Extra Periferia
            { coords = vector3(5319.2607, -2643.3584, 14.6402), label = "Periferia Este" },
            { coords = vector3(5152.9756, -2808.1104, 14.7339), label = "Barrio Este" },
            { coords = vector3(5234.8813, -3400.9807, 14.5203), label = "Barrio Sur" },
            { coords = vector3(4919.3516, -2782.2688, 14.8140), label = "Cruce Central" },
            { coords = vector3(4970.1587, -2101.9788, 14.8586), label = "Cruce Norte" },
        }
    },

    -- Configuración visual de markers
    DrawDistance = 10.0,
    InteractDistance = 2.0,
    MarkerType = 20,
    MarkerSize = { x = 0.5, y = 0.5, z = 0.5 },
    MarkerColor = { r = 0, g = 0, b = 0, a = 200 },
}
