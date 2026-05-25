ChickenConfig = {}

ChickenConfig.JobName = 'pollero'

ChickenConfig.Blip = {
    Coords = vec3(-76.37, 6253.97, 31.09),
    Sprite = 442,
    Color = 0,
    Scale = 0.8,
    Label = 'Granja Avícola'
}

ChickenConfig.Cooldown = 5
ChickenConfig.Payment = 6
ChickenConfig.MaxChickensPerRound = 50

ChickenConfig.NPC = {
    Model = 'S_M_M_FieldWorker_01',
    Coords = vec4(-68.76, 6256.48, 31.09, 166.43),
}

ChickenConfig.Locations = {
    VehicleSpawn = vector4(-63.66, 6277.58, 31.37, 120.27),
    VehicleReturn = vector3(-79.65, 6270.47, 31.38),
    VehicleModel = 'Bison',
    ProcessingPoints = {
        { coords = vector4(-85.83, 6227.45, 31.09, 304.63) },
        { coords = vector4(-85.76, 6233.71, 31.09, 122.48) },
    }
}

-- Zonas donde aparecen los pollos (peds reales que corretean)
ChickenConfig.ChickenModel = 'A_C_Hen'
ChickenConfig.ChickensPerZone = 25
ChickenConfig.CatchDistance = 1.5

ChickenConfig.ChickenZones = {
    {
        label = 'Corral Grappeseed',
        center = vector3(2176.17, 4967.2, 41.33),
        radius = 15.0,
        spawns = {
            vector3(2182.19, 4980.15, 41.43),
            vector3(2195.48, 4969.09, 41.37),
            vector3(2179.14, 4962.58, 41.34),
            vector3(2170.6, 4944.29, 41.28),
            vector3(2156.22, 4964.51, 41.42),
            vector3(2162.04, 4972.76, 41.36),
            vector3(2169.2, 4982.39, 41.34),
            vector3(2181.96, 4982.41, 41.44),
            vector3(2173.43, 4960.26, 41.36),
            vector3(2163.04, 4962.06, 41.43),
            vector3(2178.69, 4969.86, 41.31),
            vector3(2188.23, 4972.88, 41.41),
        }
    },
}

ChickenConfig.DeliveryPoints = {
    { 
        coords = vector3(-1178.1, -891.66, 13.76), 
        label = "Burguer Shot",
        npc = {
            model = 's_m_m_dockwork_01',
            coords = vector4(-1178.1, -891.66, 13.76, 305.72)
        }
    },
}

ChickenConfig.Anims = {
    Catch = {
        dict = 'random@domestic',
        clip = 'pickup_low',
    },
    Carry = {
        dict = 'missfbi4prepp1',
        clip = '_idle_garbage_man',
        bone = 28422, -- SKEL_R_Hand
        pos = vector3(0.0, 0.04, 0.10),
        rot = vector3(180.0, 0.0, 0.0)
    }
}

ChickenConfig.Uniform = {
    ['male'] = {
        drawables = {
            ['3'] = { index = 64, texture = 0 },
            ['4'] = { index = 39, texture = 0 },
            ['6'] = { index = 25, texture = 0 },
            ['8'] = { index = 15, texture = 0 },
            ['11'] = { index = 66, texture = 0 },
        },
        props = {}
    },
    ['female'] = {
        drawables = {
            ['3'] = { index = 80, texture = 0 },
            ['4'] = { index = 39, texture = 0 },
            ['6'] = { index = 25, texture = 0 },
            ['8'] = { index = 14, texture = 0 },
            ['11'] = { index = 60, texture = 0 },
        },
        props = {}
    }
}

