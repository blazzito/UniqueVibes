-- ============================================================
--  fuksus-shops — config.lua  (SERVER ONLY — never sent to clients)
-- ============================================================

Config = {}

Config.locale = 'es'   -- 'es' | 'en'

-- Marker rendered next to each shop location (client uses safe defaults)
Config.marker = {
    type  = 1,
    scale = { x = 0.06, y = 0.05, z = 1 }, 
    color = { r = 0, g = 121, b = 255, a = 250 },
    face  = true,
}

-- Image path served to the NUI
-- Default: '../images/'
-- ox_inventory users: 'nui://ox_inventory/web/images/'
Config.image_location = '../images/'

-- Allowed payment account names (must match ESX account identifiers)
Config.allowed_payments = {
    bank  = true,
    money = true,
}

-- Max quantity a player can buy of a single item per transaction
Config.max_amount_per_item = 50

-- ============================================================
--  SHOPS
--  Each shop key is used internally for server-side validation.
--
--  Fields:
--    name        (string)  Display name shown in the UI
--    description (string)  Subtitle shown in the UI
--    blip        (table)   Optional map blip  { id, colour, scale }
--    jobs        (table)   Optional whitelist  { ['jobName'] = minGrade }
--                          Empty / absent → open to everyone
--    items       (table)   List of purchasable items
--      .type        Category key used by the filter buttons
--      .name        ESX item name  (must exist in the items table)
--      .description Short description shown in the UI
--      .price       Cost per unit in the selected payment account
--    filters     (table)   Maps type keys → display labels for filter buttons
--    locations   (table)   vec3 coordinates for each shop instance
-- ============================================================

Config.shops = {

    General = {
        name        = '24/7',
        description = 'Tienda general',
        blip        = { id = 59, colour = 69, scale = 0.8 },
        ped = {
            model   = `mp_m_shopkeep_01`,
            heading = 180.0,  -- fallback si una entrada no trae heading propio
            coords  = {
                { coords = vec3(4720.6758, -1854.1436, 15.4676), heading = 90.0 },
                -- agrega más así, cada uno con su propio heading
            },
        },
        items = {
            { type = 'food',  name = 'burger', description = 'Una hamburguesa para el hambre.',  price = 10 },
            { type = 'drink', name = 'water',  description = '¿Necesitas algo de tomar?',         price = 10 },
            { type = 'drink', name = 'cola',   description = 'Refrescante.',                      price = 10 },
        },
        filters = {
            food  = 'Comida',
            drink = 'Bebidas',
        },
        locations = {
            vec3(4719.1753, -1854.1260, 15.4676),
            
        },
    },

    

}
