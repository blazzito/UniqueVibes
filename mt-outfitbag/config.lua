
Config = {}

Config.debug = false


Config.bagObject = 'prop_cs_heist_bag_02'   

Config.bagAnimation = {
    enabled = true,
    dict = 'pickup_object',
    anim = 'pickup_low'
}

Config.outfitChangeAnimation = {
    enabled  = true,
    dict     = 'anim_heist@hs3f@ig12_change_clothes@',
    anim     = 'action_01_male',
    duration = 2200 -- ms
}


Config.target = {
    distance    = 2.0,
    icon        = 'fa-solid fa-suitcase', 
    openLabel   = 'Abrir bolsa',          
    pickupLabel = 'Levantar'              
}


Config.NUI = {
    locale = {
        save = 'GUARDAR OUTFIT'
    },
    previewEnabled = false,   
    allowSharing   = true     
}


Config.maxOutfits = 20


Config.BagData = {
    {
        itemName = 'outfitbag',   
        bagType  = 'default',     
        maxSlot  = 20            
    },
    -- Ejemplos adicionales (opcional):
    -- {
    --     itemName = 'outfitbag_mini',
    --     bagType  = 'mini',
    --     maxSlot  = 8
    -- },
    -- {
    --     itemName = 'outfitbag_pro',
    --     bagType  = 'pro',
    --     maxSlot  = 30
    -- },
}

return Config
