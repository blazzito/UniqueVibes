Config = Config or {}

-- Define your custom radio categories and channels here.
-- This replaces the tablet database logic entirely.
Config.CustomRadio = {
    {
        category = "MANDO Y SUPERVISIÓN",
        freqs = { "Central 1", "Central 2", "Supervisión Sur", "Supervisión Norte", "Táctico Mando" }
    },
    {
        category = "UNIDADES SAPD",
        freqs = { "Adam 10", "Adam 20", "Adam 30", "Adam 40", "Adam 50", "Lincoln 10", "Lincoln 20", "Mary 10" }
    },
    {
        category = "DIVISIONES ESPECIALES",
        freqs = { "SWAT Táctico", "SWAT Asalto", "K9 Unidad", "Aéreo 1 (Air Support)", "Aéreo 2" }
    },
    {
        category = "INVESTIGACIÓN Y DETECTIVES",
        freqs = { "CID 1", "CID 2", "Operaciones Encubiertas", "Narcóticos" }
    },
    {
        category = "DEPARTAMENTOS COMUNES",
        freqs = { "Interdepartamental", "Emergencias SAPD/EMS", "Frecuencia Compartida" }
    }
}
