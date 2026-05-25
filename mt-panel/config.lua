Config = {}

-- Idioma del sistema ('es' o 'en')
Config.Locale = "es"

-- Comando para abrir el hub
-- Comando para abrir el hub
Config.Command = "mtpanel" -- Comando para abrir el hub

-- Framework (auto-detecta o forzar: 'qbcore', 'esx', 'standalone')
Config.Framework = "auto"

-- Tecla para abrir el hub (opcional, comentar para deshabilitar)
Config.OpenKey = nil -- Ejemplo: "F5"

-- Lista de scripts disponibles en el servidor
-- Agregar/eliminar scripts según tu inventario
Config.Scripts = {
    {
        id = "mt-dealerships",
        name = "MT Dealerships",
        description = "Concesionario de vehículos con sistema de compra/venta y gestión avanzada",
        icon = "car",
        category = "Vehicles",
        adminRoute = "export",
        resourceName = "mt-dealerships",
        color = "#ff6b00"
    },
    {
        id = "mt-fuel",
        name = "Fuel System",
        description = "Sistema de combustible - gestión de estaciones y stock",
        icon = "gas-pump",
        category = "Economy",
        adminRoute = "export",
        resourceName = "mt-fuel",
        color = "#00a8cc"
    },
}

-- Categorías disponibles (se auto-generan de Config.Scripts pero puedes personalizar)
Config.Categories = {
    {id = "all", name = "Todos", icon = "grid"},
    {id = "Vehicles", name = "Vehículos", icon = "car"},
    {id = "Economy", name = "Economía", icon = "coin"},
}

-- Configuración del Footer
Config.Footer = {
    -- Información del servidor
    showServerName = true,
    serverNameOverride = nil, -- nil = usar sv_hostname, o poner "TU SERVIDOR AQUÍ"
    
    -- Enlaces sociales (dejar en blanco para ocultar)
    discord = "https://discord.gg/tuservidor",
    website = "https://tuservidor.com",
    store = "https://tienda.tuservidor.com",
    tiktok = "", -- Opcional
    twitter = "", -- Opcional
    
    -- Información a mostrar
    showPlayers = true,
    showUptime = true,
    showActiveScripts = true,
    showPing = true,
    showVersion = true,
    showTime = true,
}

-- Flujo de apertura/cierre entre Hub y paneles admin conectados
Config.Transitions = {
    -- Espera corta para soltar focus del hub antes de abrir panel externo (ms)
    OpenExportDelayMs = 60,

    -- Espera corta antes de reabrir hub al volver desde un panel (ms)
    ReturnToHubDelayMs = 60,
}


