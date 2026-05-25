local ESX = exports['es_extended']:getSharedObject()
Stations = {} -- ¡Sin el local!

local PointTypes = {
    { value = 'armory', label = '🔫 Armería' },
    { value = 'garage', label = '🚓 Garaje (Sacar/Guardar)' },
    { value = 'stash_personal', label = '🎒 Casillero Personal' },
    { value = 'stash_shared', label = '📦 Almacén Policial' },
    { value = 'identity', label = '💻 Identificación de Sospechoso' },
    { value = 'jail_cell', label = '⛓️ Celda (Punto de envío)' },
    { value = 'jail_release', label = '🚪 Salida de Cárcel' }
}

RegisterNetEvent('uniquepolice:client:syncStations', function(data)
    Stations = data
    RefreshStationPoints()
end)

Citizen.CreateThread(function()
    Stations = lib.callback.await('uniquepolice:server:getStations', false)
    Citizen.Wait(1000)
    RefreshStationPoints()
end)

RegisterCommand('uniquepolice', function()
    local isAdmin = lib.callback.await('uniquepolice:server:isAdmin', false)
    if not isAdmin then
        lib.notify({ title = 'Acceso Denegado', description = Config.Text.NoPermission, type = 'error' })
        return
    end
    OpenAdminMenu()
end)

function OpenAdminMenu()
    local stationOptions = {}
    for id, data in pairs(Stations) do
        table.insert(stationOptions, {
            title = data.name,
            description = 'ID Interno: ' .. id,
            icon = 'building-shield',
            onSelect = function() OpenStationManager(id, data.name) end
        })
    end

    lib.registerContext({
        id = 'up_main_menu',
        title = Config.Text.AdminMenuTitle,
        options = {
            {
                title = '➕ Crear Nueva Comisaría',
                description = 'Añade una estación desde cero a la base de datos.',
                icon = 'plus',
                onSelect = function() CreateStationDialog() end
            },
            {
                title = '🏢 Gestionar Comisarías',
                description = 'Edita los puntos de las comisarías existentes.',
                icon = 'list',
                menu = 'up_station_list'
            }
        }
    })

    lib.registerContext({
        id = 'up_station_list',
        title = 'Comisarías Registradas',
        menu = 'up_main_menu',
        options = #stationOptions > 0 and stationOptions or {{ title = 'No hay comisarías creadas', disabled = true }}
    })

    lib.showContext('up_main_menu')
end

function CreateStationDialog()
    local input = lib.inputDialog('Nueva Comisaría', {
        { type = 'input', label = 'ID Interno (Sin espacios)', description = 'Ejemplo: mrpd, paleto, sandy', required = true },
        { type = 'input', label = 'Nombre Público', description = 'Ejemplo: Mission Row', required = true }
    })

    if not input then return OpenAdminMenu() end

    local id = string.lower(input[1]:gsub("%s+", ""))
    local name = input[2]

    local success, msg = lib.callback.await('uniquepolice:server:createStation', false, id, name)
    if success then
        lib.notify({ title = 'Éxito', description = msg, type = 'success' })
        OpenAdminMenu()
    else
        lib.notify({ title = 'Error', description = msg, type = 'error' })
    end
end

function OpenStationManager(stationId, stationName)
    local options = {}
    
    for i = 1, #PointTypes do
        local pType = PointTypes[i]
        local hasPoint = Stations[stationId].points[pType.value] ~= nil
        
        table.insert(options, {
            title = pType.label,
            description = hasPoint and '📍 Punto Configurado' or '❌ Sin Configurar',
            icon = hasPoint and 'check' or 'xmark',
            iconColor = hasPoint and '#00ff00' or '#ff0000',
            onSelect = function() ManagePointAction(stationId, pType.value, pType.label) end
        })
    end

    lib.registerContext({
        id = 'up_manage_' .. stationId,
        title = 'Gestionar: ' .. stationName,
        menu = 'up_station_list',
        options = options
    })

    lib.showContext('up_manage_' .. stationId)
end

function ManagePointAction(stationId, pointType, pointLabel)
    local hasPoint = Stations[stationId].points[pointType] ~= nil

    local options = {
        {
            title = '📍 Establecer aquí',
            description = 'Guarda tus coordenadas actuales para este punto.',
            icon = 'location-dot',
            onSelect = function()
                local coords = GetEntityCoords(PlayerPedId())
                local heading = GetEntityHeading(PlayerPedId())
                local finalCoords = { x = coords.x, y = coords.y, z = coords.z, h = heading }
                
                lib.callback.await('uniquepolice:server:savePoint', false, stationId, pointType, finalCoords)
                lib.notify({ title = 'Guardado', description = pointLabel .. ' actualizado.', type = 'success' })
                OpenStationManager(stationId, Stations[stationId].name)
            end
        }
    }

    if hasPoint then
        table.insert(options, {
            title = '🚀 Teletransportarse',
            description = 'Ir a la ubicación guardada.',
            icon = 'rocket',
            onSelect = function()
                local c = Stations[stationId].points[pointType]
                SetEntityCoords(PlayerPedId(), c.x, c.y, c.z, false, false, false, true)
                OpenStationManager(stationId, Stations[stationId].name)
            end
        })
        table.insert(options, {
            title = '🗑️ Eliminar Punto',
            description = 'Borra este punto de la comisaría.',
            icon = 'trash',
            iconColor = '#ff4444',
            onSelect = function()
                lib.callback.await('uniquepolice:server:savePoint', false, stationId, pointType, nil)
                lib.notify({ title = 'Eliminado', description = pointLabel .. ' borrado.', type = 'inform' })
                OpenStationManager(stationId, Stations[stationId].name)
            end
        })
    end

    lib.registerContext({
        id = 'up_point_action',
        title = pointLabel,
        menu = 'up_manage_' .. stationId,
        options = options
    })

    lib.showContext('up_point_action')
end