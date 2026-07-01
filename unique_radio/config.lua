Config = {}

-- Restricción de canales
-- Si un jugador intenta entrar a uno de estos canales, el script verificará su trabajo.
-- También estos canales aparecerán en la lista desplegable del Walkie-Talkie.
Config.RestrictedChannels = {
    { channel = 1, name = "Policía LSPD", jobs = { "police" } },
    { channel = 2, name = "Policía BCSO", jobs = { "police" } },
    { channel = 3, name = "EMS Principal", jobs = { "ambulance" } },
    { channel = 4, name = "EMS Secundario", jobs = { "ambulance" } },
    { channel = 5, name = "Mecánicos LSC", jobs = { "mechanic" } },
}

-- Configuración general de UI y Volumen
Config.DefaultVolume = 50 -- Volumen inicial (1-100)
Config.MaxVolume = 100

-- Animaciones
Config.RadioAnim = {
    Dict = "cellphone@",
    Anim = "cellphone_text_in",
    Prop = "prop_cs_hand_radio",
    PropBone = 28422,
    PropPlacement = { 0.0, 0.0, 0.0, 0.0, 0.0, 0.0 }
}

-- Animaciones al hablar por PTT (El jugador puede elegir en la UI)
Config.TalkAnims = {
    {
        Dict = "random@arrests",
        Anim = "generic_radio_chatter" -- 1: Mano al hombro (Policia)
    },
    {
        Dict = "cellphone@str",
        Anim = "cellphone_call_listen_a",
        Prop = "prop_cs_hand_radio",
        PropBone = 57005,
        PropPlacement = { 0.12, 0.02, -0.02, 20.0, 70.0, 130.0 } -- 2: Radio a la oreja
    },
    {
        Dict = "anim@male@holding_radio",
        Anim = "holding_radio_clip",
        Prop = "prop_cs_hand_radio",
        PropBone = 28422,
        PropPlacement = { 0.0750, 0.0230, -0.0230, -90.0000, 0.0, -59.9999 } -- 3: Radio en mano enfrente
    }
}

-- Integración con ox_inventory
-- El nombre del ítem en la base de datos o ox_inventory
Config.ItemName = "radio"
