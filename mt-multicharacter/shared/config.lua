Config = {}

Config.Debug = false

Config.Maxslots = 1
Config.DeleteCharacter = false -- Habilita/Deshabilita el botón de eliminar personaje (Icono basurero)
Config.Prefix = 'char'
Config.Identifier = 'license' 
Config.Routingbucket = 0
Config.RoutingbucketRandom = true 
Config.HideHUD = true -- Oculta el HUD automáticamente cuando el multicharacter está activo.

Config.OxInventory = true 
Config.IlleniumAppearance = true 
Config.Discord = "https://discord.gg/" -- Coloca aquí tu link de Discord
Config.DiscordToken = "TU_TOKEN_AQUI" -- Token del Bot para obtener nombres

Config.WelcomePacks = {
    {
        id = 'starter',
        name = 'PACK CALLEJERO',
        description = 'Para los que empiezan desde abajo con lo justo.',
        items = {
            { name = 'phone', amount = 1, label = 'Celular' },
            { name = 'water', amount = 3, label = 'Agua' },
            { name = 'bread', amount = 3, label = 'Bocadillo' },
        },
        money = 1000,
        icon = 'package',
        vehicle = 'manchez' 
    },
    {
        id = 'essential',
        name = 'PACK ESENCIAL',
        description = 'Recursos básicos para sobrevivir la primera noche.',
        items = {
            { name = 'phone', amount = 1, label = 'Celular' },
            { name = 'water', amount = 5, label = 'Agua' },
            { name = 'bread', amount = 5, label = 'Bocadillo' },
            { name = 'bandage', amount = 2, label = 'Venda' },
        },
        money = 5000,
        icon = 'briefcase',
        vehicle = 'sentinel' 
    },
    {
        id = 'premium',
        name = 'PACK REY',
        description = 'Domina la ciudad desde el primer segundo.',
        items = {
            { name = 'phone', amount = 1, label = 'Celular' },
            { name = 'water', amount = 10, label = 'Agua' },
            { name = 'bread', amount = 10, label = 'Bocadillo' },
            { name = 'bandage', amount = 5, label = 'Venda' },
            { name = 'medikit', amount = 2, label = 'Botiquín' },
        },
        money = 25000,
        icon = 'crown',
        vehicle = 'zentorno' 
    }
}

Config.WelcomeVehicle = {
    claimPoint = vec3(7527.6606, -2885.1846, 6.0903),
    spawnPoint = vec4(7524.5723, -2889.5251, 5.9002, 358.5493),
    
    labelClaim = "RECLAMA TU VEHiCULO AQUi",
    labelConfirm = "PRESIONA [E] PARA RECLAMAR VEHiCULO",
    labelOwned = "ESTE ES TU VEHiCULO",
    
    instructions = {
        title = "BIENVENIDO A UNIQUE VIBES",
        desc = "Dirigete al punto indicado para reclamar tu vehiculo de bienvenida."
    }
}

Config.Identity = {
    maxdob = 2005,
    mindob = 1970
}

Config.NewCharacterSpawn = {
    startcoords = vec4(7613.0088, -2865.2087, 6.0857, 82.6196)
}


Config.CameraFOV = 22.0
Config.CameraOffsets = {
    coords = {
        x = 0.0,
        y = 2.8, -- Distancia al personaje (menor = más cerca)
        z = 0.6,
    }, 
    rot = {
        x = -0.4, -- Desplazamiento del foco (ajustado para centrarlo un poco más)
        y = 0.0,
        z = 0.5
    }
}

Config.DefaultSkin = {
    ["m"] = {
        mom = 43, dad = 29, face_md_weight = 61, skin_md_weight = 27,
        hair_1 = 76, hair_color_1 = 61, tshirt_1 = 4, torso_1 = 23, pants_1 = 28, shoes_1 = 70
    },
    ["f"] = {
        mom = 28, dad = 6, face_md_weight = 63, skin_md_weight = 60,
        hair_1 = 43, hair_color_1 = 29, tshirt_1 = 111, torso_1 = 25, pants_1 = 12, shoes_1 = 20
    }
}

Config.CleanupTables = {
    { table = "users", column = "identifier" },
    { table = "owned_vehicles", column = "owner" },
    { table = "user_licenses", column = "owner" },
    { table = "addon_account_data", column = "owner" },
    { table = "addon_inventory_items", column = "owner" },
    { table = "datastore_data", column = "owner" },
    { table = "billing", column = "identifier" },
}

