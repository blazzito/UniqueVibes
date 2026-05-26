Config = {}

-- =========================================
-- PERMISOS Y ROLES
-- =========================================
Config.AdminGroups = {'admin', 'superadmin'} -- Quienes pueden usar /uniquepolice
Config.PoliceJobs = {'police', 'sheriff'}    -- Trabajos que pueden interactuar con los puntos
Config.RequireOnDuty = true                  -- Si está en true, requiere que PlayerData.job.onduty sea true

-- =========================================
-- LOGS (Webhooks de Discord)
-- =========================================
Config.Webhooks = {
    Admin = "",   
    Armory = "",  
    Jail = "https://discord.com/api/webhooks/1508585469255090256/wx1DTTtfNfQj4YVmEqUQUMpnLXan8rp1WxLmJLwsvi__qu4bauFT45U5NPB42RXiXMs8",    
    Stash = ""    
}

-- =========================================
-- DISEÑO VISUAL PREMIUM (Contextual)
-- =========================================
Config.MarkerDrawDistance = 20.0 -- Desde cuántos metros se ven los hologramas flotantes

Config.PointSettings = {
    armory = {
        markerId = 20, 
        color = { r = 255, g = 50, b = 50, a = 150 }, 
        label = "la Armería",
        emoji = "🔫" -- Usamos emojis nativos, cero bugs
    },
    garage = {
        markerId = 20, 
        color = { r = 50, g = 255, b = 50, a = 150 }, 
        label = "el Garaje",
        emoji = "🚓" 
    },
    stash_personal = {
        markerId = 20, 
        color = { r = 0, g = 150, b = 255, a = 150 }, 
        label = "tu Casillero",
        emoji = "🎒" 
    },
    stash_shared = {
        markerId = 20, 
        color = { r = 255, g = 165, b = 0, a = 150 }, 
        label = "el Almacén",
        emoji = "📦" 
    },
    identity = {
        markerId = 20, 
        color = { r = 150, g = 0, b = 255, a = 150 }, 
        label = "el Lector Biométrico",
        emoji = "💻" 
    }
}

Config.MarkerSize = { x = 0.4, y = 0.4, z = 0.4 } 
Config.InteractDistance = 1.5 -- 🚀 AUMENTADO: Rango más cómodo para que no falle

Config.Text = {
    NoPermission = "No tienes permisos para hacer esto.",
    AdminMenuTitle = "Gestión de Comisarías",
    InteractPrefix = "[E] Interactuar con " 
}

-- =========================================
-- CONFIGURACIÓN DE LA ARMERÍA (ox_inventory)
-- =========================================
Config.ArmoryItems = {
    { name = 'WEAPON_COMBATPISTOL', price = 0 },
    { name = 'WEAPON_STUNGUN', price = 0 },
    { name = 'WEAPON_NIGHTSTICK', price = 0 },
    { name = 'WEAPON_FLASHLIGHT', price = 0 },
    { name = 'police_cad', price = 0 },
    { name = 'radio', price = 0 },
    { name = 'pistol_ammo', price = 0 },
    { name = 'armour', price = 150 },
}

-- =========================================
-- CONFIGURACIÓN DEL GARAJE Policial
-- =========================================
Config.GarageVehicles = {
    { model = 'police', label = '🚓 Patrulla de Ciudad (Victoria)' },
    { model = 'police2', label = '🚓 Patrulla Interceptora (Buffalo)' },
    { model = 'police3', label = '🚙 Camioneta de Asalto (Interceptor)' },
    { model = 'fbi2', label = '🕶️ Camioneta de Incógnito (Granger)' },
    { model = 'lcpdpigeon', label = '🚓 Triciclo Policial' },
    { model = 'riot', label = '🚓 Furgoneta Policial' },
}

-- Puntos de Spawn auxiliares (Opcional, si quieres que aparezcan unos metros más adelante)
-- Si está en false, el carro spawneará exactamente donde pusiste el marcador.
Config.SpawnOffset = false