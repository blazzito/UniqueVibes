GarbageConfig = {
    JobName = "garbage",
    Label = "Basurero",
    Blip = {
        Coords = vector3(6233.3721, -2731.0686, 24.4706),
        Sprite = 318,
        Color = 4,
        Scale = 0.8,
        Label = "Trabajo de Basurero"
    },
    Locations = {
        Start = vector3(6233.4634, -2731.1643, 24.4706),
        VehicleSpawn = vector4(6232.6113, -2759.3220, 19.3828, 217.2461),
        VehicleReturn = vector3(6222.1416, -2767.9546, 19.3498),
        VehicleModel = "trash",
    },
    NPC = {
        Model = "a_f_m_downtown_01",
        Coords = vector4(6233.4634, -2731.1643, 24.4706, 180.0261),
    },
    Payment = {
        PerBag = 10,
    },
    DetectionRadius = 2000.0,
    GarbageModels = {
        "prop_cs_street_binbag_01",
        "prop_dumpster_01a",
        "prop_dumpster_02a",
        "prop_dumpster_02b",
        "prop_dumpster_03a",
        "prop_dumpster_4a",
        "prop_dumpster_4b",
        "prop_bin_01a",
        "prop_bin_02a",
        "prop_bin_03a",
        "prop_bin_04a",
        "prop_bin_05a",
        "prop_bin_07a",
        "prop_bin_08a",
        "prop_bin_10a",
        "prop_bin_10b",
        "prop_bin_beach_01d",
        "prop_rub_binbag_05",
        -533742224,
        2059820264,
        -847374323,
        379515281,
        -902335402
    },
    Uniform = {
        ['male'] = {
            drawables = {
                ['3'] = { index = 63, texture = 0 },  -- Brazos / Manos
                ['4'] = { index = 36, texture = 0 }, -- Pantalones
                ['6'] = { index = 25, texture = 0 }, -- Calzado / Botas
                ['8'] = { index = 15, texture = 0 }, -- Camiseta interior
                ['11'] = { index = 56, texture = 0 }, -- Chaqueta / Torso exterior
            }
        },
        ['female'] = {
            drawables = {
                ['3'] = { index = 83, texture = 0 }, -- Brazos / Manos
                ['4'] = { index = 35, texture = 0 }, -- Pantalones
                ['6'] = { index = 25, texture = 0 }, -- Calzado / Botas
                ['8'] = { index = 14, texture = 0 }, -- Camiseta interior
                ['11'] = { index = 49, texture = 0 }, -- Chaqueta / Torso exterior
            }
        }
    }
}

