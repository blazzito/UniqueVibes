Config.Maps = {}

Config.MarkersDraw = true -- Draw the markers on the map

-- DONT TOUCH BELOW;

MarkersList = {
    RequestVehicle = {
        sprite = 36,
        event = "origen_police:client:buyveh",
        text = "Request vehicle",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    ModifyVehicle = {
        sprite = 36,
        event = "origen_police:client:modifyveh",
        text = "Modify vehicle",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    SaveVehicle = {
        sprite = 36,
        radius = 3,
        event = "origen_police:client:deletevehicle",
        text = "Save vehicle",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    RequestBoat = {
        sprite = 35,
        event = "origen_police:client:boat",
        text = "Request boat",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    SaveBoat = {
        sprite = 35,
        radius = 3,
        event = "origen_police:client:deletevehicle",
        text = "Save boat",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    SaveHelicopter = {
        sprite = 34,
        radius = 3,
        event = "origen_police:client:deletevehicle",
        text = "Save helicopter",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    RequestHelicopter = {
        sprite = 34,
        event = "origen_police:client:helicop",
        text = "Request helicopter",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    DressingRoom = {
        sprite = 20,
        event = "origen_police:client:clothing",
        text = "Access to the dressing room",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    ["Inventory/Armoury"] = {
        sprite = 20,
        event = "origen_police:client:inventory",
        text = "Access to the inventory/armory",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    EvidenceReport = {
        sprite = 20,
        event = "origen_police:client:makereport",
        text = "Write evidence report",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
}

PublicMarkerList = {
    Duty = {
        sprite = 20,
        event = "origen_police:client:enterOnDuty",
        text = "Enter on duty",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    Finger = {
        sprite = 20,
        event = "origen_police:client:domyfinguer",
        text = "Put your finger on the reader",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    CriminalClothes = {
        sprite = 20,
        event = "origen_police:client:CriminalClothes",
        text = "Change clothes",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    Pertenences = {
        sprite = 20,
        event = "origen_police:client:pertenences",
        text = "Leave your belongings",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
    ConfiscatedVehicles = {
        sprite = 36,
        event = "origen_police:client:openConfiscatedMenu",
        text = "Confiscated vehicles",
        rgba = {r = 0, g = 0, b = 0, a = 255}
    },
}

Tables = {
    Markers = {

    }
}

Public = {
    Markers = {},
    CriminalClothe = {
        ["qb-clothing"] = {
            ["male"] = {
                ["hat"] = { item = -1, texture = 0},
                ["t-shirt"] = {
                    item = 15, texture = 0
                },
                ["torso2"] = {
                    item = 31, texture = 0
                },
                ["pants"] = {
                    item = 5, texture = 7
                },
                ["shoes"] = {
                    item = 56, texture = 1
                },
                ["arms"] = {
                    item = 12, texture = 0
                },
            }
        },
        ["illenium-appearance"] = {
            ["male"] = {
                model = "mp_m_freemode_01",
                components = {
                    {texture = 0, component_id = 0, drawable = 0},
                    {texture = 0, component_id = 1, drawable = 0},
                    {texture = 0, component_id = 2, drawable = 0},
                    {texture = 0, component_id = 3, drawable = 5},
                    {texture = 2, component_id = 4, drawable = 27},
                    {texture = 0, component_id = 5, drawable = 0},
                    {texture = 0, component_id = 6, drawable = 8},
                    {texture = 0, component_id = 7, drawable = 0},
                    {texture = 0, component_id = 8, drawable = 15},
                    {texture = 0, component_id = 9, drawable = 0},
                    {texture = 0, component_id = 10, drawable = 0},
                    {texture = 0, component_id = 11, drawable = 5}
                },
            }
        },
        ["origen_clothing"] = {
            ["male"] = {
                props = {
                    glasses = "none--1001---1---1",
                    bracelets = "none--1007---1---1",
                    earrings = "none--1002---1---1",
                    watches = "none--1006---1---1",
                    hats = "none--1000---1---1"
                },
                drawables = {
                    bags = "none--5--0--0",
                    torsos = "none--3--5--0",
                    masks = "none--1--0--0",
                    shoes = "none--6--8--0",
                    legs = "Male_freemode_hipster--4--1--2",
                    shirts = "none--8--15--0",
                    vest = "none--9--0--0",
                    jackets = "none--11--5--0",
                    neck = "none--7--0--0",
                    decals = "none--10--0--0"
                }
            },
            ["female"] = {
                props = {
                    glasses = "none--1001---1---1",
                    bracelets = "none--1007---1---1",
                    earrings = "none--1002---1---1",
                    watches = "none--1006---1---1",
                    hats = "none--1000---1---1"
                },
                drawables = {
                    bags = "none--5--0--0",
                    torsos = "none--3--4--0",
                    masks = "none--1--0--0",
                    shoes = "none--6--1--0",
                    legs = "mp_f_sum--4--1--10",
                    shirts = "none--8--15--0",
                    vest = "none--9--0--0",
                    jackets = "Female_freemode_valentines--11--2--0",
                    neck = "none--7--0--0",
                    decals = "none--10--0--0"
                }
            }
        },
    },
    Radars = {},
    Blips = {
        {
            coords = vector4(5635.8501, -3135.0884, 11.1186, 78.3976),
            sprite = 60,
            color = 29,
            name = "Police Station",
            size = 0.8
        },
    },
    TrafficZones = {}
}

BillsNPCPositions = {}
SpawnConfiscatedVehicles = {}
MapOptions = {}

function Shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else
        copy = orig
    end
    return copy
end

-- Procesa el data de una station y lo carga en Tables.Markers / Public.Markers
-- mapData ya viene con coords como tables {x,y,z,w} (no como vector4 todavía)
function LoadMarkersFromData(mapIndex, mapName, mapData)
    Tables.Markers[mapIndex] = {}
    if not mapData then
        Debuger("^3WARNING: Station '"..mapName.."' has no markers data, skipping.^0")
        MapOptions[mapIndex] = {}
        return
    end
    for markerType, markersData in pairs(mapData) do
        if markerType == "Options" then
            MapOptions[mapIndex] = markersData
            goto skip_marker_type
        end
        for _, markerData in pairs(markersData) do
            local newMarkerData = MarkersList[markerType]
            local newMarkerDataCopy = Shallowcopy(newMarkerData)
            if not newMarkerData then
                if markerType == "BillsNPC" then
                    BillsNPCPositions[#BillsNPCPositions + 1] = ParseVector4(markerData.coords)
                    goto skip_marker
                end
                if markerType == 'SpawnConfiscatedVehicles' then
                    SpawnConfiscatedVehicles[mapIndex] = ParseVector4(markerData.coords)
                    goto skip_marker
                end
                if markerType == 'Options' then
                    goto skip_marker
                end
                newMarkerData = PublicMarkerList[markerType]
                newMarkerDataCopy = Shallowcopy(newMarkerData)
                newMarkerDataCopy.coords = ParseVector4(markerData.coords)
                newMarkerDataCopy.spawn = markerData.spawn and ParseVector4(markerData.spawn) or nil
                newMarkerDataCopy.station = mapIndex
                newMarkerDataCopy.stationName = mapName
                Public.Markers[#Public.Markers + 1] = newMarkerDataCopy
            else
                newMarkerDataCopy.coords = ParseVector4(markerData.coords)
                newMarkerDataCopy.spawn = markerData.spawn and ParseVector4(markerData.spawn) or nil
                newMarkerDataCopy.station = mapIndex
                newMarkerDataCopy.stationName = mapName
                Tables.Markers[mapIndex][#Tables.Markers[mapIndex] + 1] = newMarkerDataCopy
            end
            ::skip_marker::
        end
        ::skip_marker_type::
    end
    if not MapOptions[mapIndex] then
        MapOptions[mapIndex] = {}
    end
end

function LoadMarkers()
    BillsNPCPositions = {}
    for mapIndex, mapName in pairs(Config.Maps) do
        -- LoadResourceFile solo lee archivos que existían al iniciar el resource.
        -- Para hot-reload se usa GetStationData desde el servidor (ver ActiveStation).
        local rawData = exports["origen_police"]:LoadMarkers(mapName)
        LoadMarkersFromData(mapIndex, mapName, rawData)
    end
    CreateNPCsBills()
end

function ReloadMarkers()
    if Config.IgnoreSettings then return end
    Tables.Markers = {}
    Public.Markers = {}
    BillsNPCPositions = {}
    ClearNPCsBills()
    LoadMarkers()
end

function IsJobAllowed(options, jobCat)
    if #options.AllowedJobCat == 0 then return true end
    for _, job in pairs(options.AllowedJobCat) do
        if job == jobCat then
            return true
        end
    end
    return false
end

Public.CriminalClothe = Public.CriminalClothe[Config.Clothing == "fivem-appearance" and "illenium-appearance" or Config.Clothing]
Config.IgnoreSettings = #Config.Maps > 0