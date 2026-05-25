ConfigSV = {}

-- Configuración de Registros en Discord
ConfigSV.Webhooks = {
    enabled = true,
    url = "", -- Pon aquí tu URL de Discord
    color = 8719945, -- Color del mensaje (Hex: #850E49)
    footer = "MT Panel System"
}

-- Acceso por Identificador (Permisos de Super-Admin)
-- Estas personas tendrán acceso aunque no tengan el rango en el framework
ConfigSV.MasterAdmins = {
    'license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
    -- 'discord:123456789012345678',
}

-- Configuración de Debug
ConfigSV.Debug = false
