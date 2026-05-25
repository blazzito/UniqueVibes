JobCenterConfig = {}

JobCenterConfig.NPC = {
    Model = 's_f_y_airhostess_01',
    Coords = vector4(5162.9087, -2382.5142, 18.7452, 86.9035)
}

JobCenterConfig.Blip = {
    Coords = vector3(5162.9087, -2382.5142, 18.7452),
    Sprite = 408, -- Icono de maletín
    Color = 4, -- Verde
    Scale = 0.8,
    Label = 'Oficina de Trabajo'
}

JobCenterConfig.Jobs = {
    {
        id = 'garbage',
        name = 'Basurero',
        icon = 'trash-2',
        description = 'Recoge basura por la ciudad',
        payment = '$5 por bolsa',
        location = vector3(6233.4634, -2731.1643, 24.4706),
        blipColor = 4
    },
    {
        id = 'bus',
        name = 'Conductor de Autobús',
        icon = 'bus',
        description = 'Transporta pasajeros por la ciudad',
        payment = '$10 por pasajero',
        location = vector3(3750.0024, -2546.3074, 19.5666),
        blipColor = 4
    },
    {
        id = 'camionero',
        name = 'Camionero',
        icon = 'truck',
        description = 'Transporta mercancías pesadas',
        payment = '$1200+ por ruta',
        location = vector3(6441.9263, -1687.5035, 16.7559),
        blipColor = 4
    },
--[[
    {
        id = 'pollero',
        name = 'Pollero',
        icon = 'egg',
        description = 'Captura y procesa pollos',
        payment = '$8 por pieza',
        location = vector3(-76.37, 6253.97, 31.09),
        blipColor = 4
    },
]]--
    {
        id = 'taxi',
        name = 'Taxista',
        icon = 'car',
        description = 'Transporta ciudadanos por toda la ciudad',
        payment = '$50+ por carrera',
        location = vector3(4989.0493, -1902.6945, 20.3841),
        blipColor = 5
    }
}

