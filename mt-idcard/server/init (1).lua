local config = require "shared.config"
local callback = lib.callback
local ESX = exports["es_extended"]:getSharedObject()
local unSavedMugshots = {}

local function decodeBase(mugshot, itemImage)
    local decodeBase64 = require'server.decoder'
    decodeBase64(mugshot, itemImage)
    return itemImage
end

-- Función para generar los datos de la licencia en tiempo real desde ESX
local function getLicenseData(source, licenseType, mugshot)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end

    -- Asegurarnos de que el mugshot sea un string válido
    local imageURL = mugshot
    if type(imageURL) ~= 'string' or imageURL == "" then
        print('^1[ID-CARD] Error: Mugshot invalido o vacio para ' .. xPlayer.getIdentifier() .. '^7')
        imageURL = "male_id" -- Fallback
    elseif not imageURL:find('data:image') then
        imageURL = 'data:image/png;base64,' .. imageURL
    end

    -- Obtener datos con múltiples opciones de keys por si acaso
    local firstName = xPlayer.get('firstName') or xPlayer.get('firstname') or "John"
    local lastName = xPlayer.get('lastName') or xPlayer.get('lastname') or "Doe"
    local dob = xPlayer.get('dateofbirth') or xPlayer.get('dob') or "01/01/1990"
    local sex = xPlayer.get('sex') or "m"
    
    local configType = config.items[licenseType]
    local idTypeVal = configType and (configType.genderIdType and configType.genderIdType[sex == 'm' and 'male' or 'female'] or configType.idType) or 'male_id'

    return {
        id = (xPlayer.getSSN and xPlayer.getSSN()) or xPlayer.get('ssn') or xPlayer.getIdentifier(),
        dob = dob,
        firstName = firstName,
        lastName = lastName,
        sex = (sex == 'm' or sex == 'male') and 'male' or 'female',
        imageURL = imageURL,
        idType = idTypeVal
    }
end

RegisterCommand('ver-licencia', function(source, args)
    local type = args[1] or 'id_card'
    -- Generar mugshot internamente en el cliente antes de pedir datos
    local mugshot = callback.await('bl_idcard:getMugShot', source)
    local data = getLicenseData(source, type, mugshot)
    if data then
        TriggerClientEvent('bl_idcard:open', source, data)
    end
end, false)

RegisterCommand('mostrar-licencia', function(source, args)
    local type = args[1] or 'id_card'
    -- Generar mugshot internamente
    local mugshot = callback.await('bl_idcard:getMugShot', source)
    local data = getLicenseData(source, type, mugshot)
    if data then
        local target = callback.await('bl_idcard:use', source, type)
        if target then
            TriggerClientEvent('bl_idcard:open', target, data)
        end
    end
end, false)

-- Los ítems ya no son necesarios, pero mantenemos el comando de admin por si acaso
lib.addCommand('giveidcard', {
    help = 'Gives an item to a player (DEPRACTED - Use F5 Menu)',
    params = {
        {name = 'target', type = 'playerId'},
        {name = 'license', type = 'string'},
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local data = getLicenseData(args.target, args.license)
    if data then
        exports.ox_inventory:AddItem(args.target, args.license, 1, data)
    end
end)

