Lang = Lang or {}

function t(key, ...)
    local lang = Config and Config.Locale or "es"
    if Lang[lang] and Lang[lang][key] then
        return string.format(Lang[lang][key], ...)
    end
    return key
end

-- Configuración de idioma (añadir al config.lua si no existe)
if not Config then Config = {} end
Config.Locale = Config.Locale or "es"






