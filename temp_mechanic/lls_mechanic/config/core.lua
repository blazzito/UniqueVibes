Config = Config or {}

-- Enables the version checher on resource start (if enabled and the resource is out of date it will print in server console)
Config.EnableVersionChecker = true

-- The derailCard position on the top of the screen (0 = right, 1 = left)
Config.detailCardMenuPosition = 0

-- The cash amount position on the top of the screen (0 = right, 1 = left)
Config.cashPosition = 0

-- If this turned off every mechanic position will be able to to cosmetics and upgrades otherwise only whitelist job can do upgrades 
Config.IsUpgradesOnlyForWhitelistJobPoints = false

-- The key to access the mechanic menu, the key code and the name can be found here: https://docs.fivem.net/docs/game-references/controls/
Config.Keys = {
    action = {key = 38, label = 'E', name = '[E]'}
}

Config.AdminGroups = {
    ["owner"] = true,
    ["fundador"] = true,
    ["directivo"] = true,
    ["superadmin"] = true,
    ["admin"] = true,
    ["mod"] = true,
}

-- LICENCIAS DE AUTORIZADOS
Config.Framework = 'esx'
Config.Command = {
    Perms = {
        ['esx'] = Config.AdminGroups,
    }
}


-- Enable this to save the vehicle properties (on apply) in database in the table `owned_vehicles` in field `vehicle`
-- by default you will need `mysql-async` (https://github.com/brouznouf/fivem-mysql-async) for the database connection (uncomment the '@mysql-async/lib/MySQL.lua' in file `fxmanifest.lua`)
-- if you want to use another library for your database connection you should modify the function `saveVehicleProperties` in file `config/server_functions.lua`
Config.AutoSaveVehiclePropertiesOnApply = true

-- The default values access disrance from position if "Config.Positions" misses the value actionDistance
Config.DefaultActionDistance = 8.0

-- The default values for the blip if "Config.Positions" misses the value "blip = {}"
Config.DefaultBlip = {
    enable = false,
    type = 72,
    color = 0,
    title = 'Mechanic',
    scale = 0.5
}

-- The default values for the marker if "Config.Positions" misses the value "marker = {}"
-- The marker will only display while you are insade a vehicle and inside the `drawDistance` of each position
--      drawDistance: the dinstance from the player that the marker will draw
--      enable: if marker will draw at all or not
--      type: the type of the marker (https://docs.fivem.net/docs/game-references/markers/)
--      positionOffset: offset from the position pos
--      direction: component of the direction vector for the marker
--      rotation: rotation for the marker. Only used if the direction vector is 0.0
--      scale: the scale for the marker
--      color: marker color r: red, g: green, b: blue, a: alpha (opacity)
--      bobUpAndDownAlways: whether or not the marker should slowly animate up/down always
--      bobUpAndDownOnAccess: whether or not the marker should slowly animate up/down only if you are in range for action
--      faceCamera: if should constantly face the camera
--      rotating: if should constantly rotating
Config.DefaultMarker = {
    drawDistance = 20.0,
    enable = false,
    type = 36,
    positionOffset = {x = 0.0, y = 0.0, z = 1.0},
    direction = {x = 0.0, y = 0.0, z = 0.0},
    rotation = {x = 0.0, y = 0.0, z = 0.0},
    scale = {x = 2.0, y = 3.0, z = 2.0},
    color = {r = 255, g = 255, b = 255, a = 100},
    bobUpAndDownAlways = false,
    bobUpAndDownOnAccess = true,
    faceCamera = false,
    rotating = true
}

-- Add or remove position for mechanic access points
-- if any position miss the property "whitelistJobName" will be open for anyone and the price will have the multiple of "Config.PriceMultiplierWithoutTheJob" in "config/prices.lua"
-- if any position miss the property "societyName" will use player cash, otherwise will use society account money (this only can be used if this point has the property "whitelistJobName") (https://github.com/esx-framework/esx_society)
-- if any position miss the property "blip = {}" will be the default as seen above "Config.DefaultBlip"
-- if any position miss the property "actionDistance" will be the default as seen above "Config.DefaultActionDistance"
Config.Positions = {
    -------------------------------------- vec3(6318.593262, -3875.973633, 14.047607
    --------------------------------------
    { -- Sports Customs -- #1
        pos = {x = 6324.672363, y = -3876.580322, z = 14.182373}, 
        whitelistJobName = 'mechanic',
        actionDistance = 8.0,
        blip = { enable = true, type = 446, color = 5, title = 'SportsCustoms', scale = 0.7 }
    },
    { -- Sports Customs -- #2
        pos = {x = 6318.593262, y = -3875.973633, z = 14.047607},
        whitelistJobName = 'mechanic',
        actionDistance = 8.0
    },
    -- DUMBER CUSTOMS
    { -- Dumber Customs -- #1
        pos = {x = 609.26, y = -249.26, z = 4.73},
        whitelistJobName = 'fixride',
        actionDistance = 8.0
    },
    { -- Dumber Customs -- #2
        pos = {x = 612.9119, y = -243.1843, z = 4.7307},
        whitelistJobName = 'fixride',
        actionDistance = 8.0
    },
    { -- Dumber Customs -- #3
        pos = {x = 616.4046, y = -237.2121, z = 4.7307},
        whitelistJobName = 'fixride',
        actionDistance = 8.0
    },

    -- PRIMOS TLL
    -- { -- TLL Customs
    --     pos = {x = 1305.3809, y = 182.2909, z = 21.7253},
    --     whitelistJobName = 'tll',
    --     actionDistance = 8.0
    -- },
    -- { -- TLL Customs 2
    --     pos = {x = 1297.6735, y = 179.6708, z = 21.3541},
    --     whitelistJobName = 'tll',
    --     actionDistance = 4.0
    -- },
    -- { -- TLL Customs 2
    --     pos = {x = 1291.3051, y = 179.2777, z = 21.3690},
    --     whitelistJobName = 'tll',
    --     actionDistance = 4.0
    -- },
    --------------------------------------
    --------------------------------------
    --------------------------------------
    --[[ { -- DEV TUNING LILITH
        pos = {x = -960.32, y = 110.44, z = 56.4},
        whitelistJobName = 'hell666',
        actionDistance = 10.0,
        blip = {
            enable = false,
            type = 72,
            color = 0,
            title = 'Bennys',
            scale = 0.5
        },
    }, ]]
}
