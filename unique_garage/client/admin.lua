local function ManageGarage(key)
    local g = Garages[key]
    if not g then return end

    lib.registerContext({
        id = 'admin_manage_garage',
        title = 'Gestionar: ' .. key,
        menu = 'admin_garage_list',
        options = {
            {
                title = '📍 Teletransportarse',
                description = 'Ir al punto interactivo de este garaje',
                onSelect = function()
                    SetEntityCoordsNoOffset(PlayerPedId(), g.Enter.x, g.Enter.y, g.Enter.z, false, false, false)
                end
            },
            {
                title = '🔄 Actualizar Punto Interactivo',
                description = 'Establece tu posición actual como la entrada del garaje',
                onSelect = function()
                    local pos = GetEntityCoords(PlayerPedId())
                    g.Enter = vec3(pos.x, pos.y, pos.z)
                    TriggerServerEvent('unique_garage:saveGarage', key, g)
                    lib.notify({title = 'Garaje Actualizado', type = 'success'})
                end
            },
            {
                title = '🚗 Definir Punto de Spawn/Guardado',
                description = 'Establece tu posición actual y rotación (heading) para sacar/guardar coches',
                onSelect = function()
                    local ped = PlayerPedId()
                    local pos = GetEntityCoords(ped)
                    local heading = GetEntityHeading(ped)
                    g.Browse = vec4(pos.x, pos.y, pos.z, heading)
                    g.Store = vec3(pos.x, pos.y, pos.z)
                    TriggerServerEvent('unique_garage:saveGarage', key, g)
                    lib.notify({title = 'Punto de Spawn Actualizado', type = 'success'})
                end
            },
            {
                title = '❌ Eliminar Garaje',
                description = 'Borra este garaje permanentemente',
                icon = 'trash',
                iconColor = 'red',
                onSelect = function()
                    local confirm = lib.alertDialog({
                        header = 'Eliminar ' .. key,
                        content = '¿Estás seguro de que quieres eliminar este garaje?',
                        centered = true,
                        cancel = true
                    })
                    if confirm == 'confirm' then
                        TriggerServerEvent('unique_garage:deleteGarage', key)
                        lib.notify({title = 'Garaje Eliminado', type = 'success'})
                    end
                end
            }
        }
    })
    lib.showContext('admin_manage_garage')
end

local function OpenGarageList()
    local options = {}
    for key, g in pairs(Garages or {}) do
        table.insert(options, {
            title = key,
            description = 'Gestionar este garaje',
            icon = 'warehouse',
            onSelect = function()
                ManageGarage(key)
            end
        })
    end

    if #options == 0 then
        table.insert(options, {
            title = 'No hay garajes creados',
            disabled = true
        })
    end

    lib.registerContext({
        id = 'admin_garage_list',
        title = 'Lista de Garajes',
        menu = 'admin_garage_menu',
        options = options
    })
    lib.showContext('admin_garage_list')
end

local function OpenAdminMenu()
    lib.registerContext({
        id = 'admin_garage_menu',
        title = '🛠️ Setup de Garajes',
        options = {
            {
                title = '➕ Crear Nuevo Garaje',
                description = 'Crea un garaje en tu posición actual',
                icon = 'plus',
                onSelect = function()
                    local input = lib.inputDialog('Crear Nuevo Garaje', {
                        {type = 'input', label = 'Nombre del Garaje (ID interno)', description = 'Ej: garaje_central o Legion', required = true}
                    })
                    if input and input[1] then
                        local key = input[1]:gsub("%s+", "_")
                        if Garages[key] then
                            lib.notify({title = 'Error', description = 'Ya existe un garaje con ese ID', type = 'error'})
                            return
                        end
                        
                        local pos = GetEntityCoords(PlayerPedId())
                        local newGarage = {
                            Enter = vec3(pos.x, pos.y, pos.z)
                        }
                        TriggerServerEvent('unique_garage:saveGarage', key, newGarage)
                        lib.notify({title = 'Garaje Creado', description = 'Ahora define el punto de spawn desde la lista.', type = 'success'})
                    end
                end
            },
            {
                title = '📋 Gestionar Garajes Existentes',
                description = 'Edita o teletranspórtate a los garajes creados',
                icon = 'list',
                onSelect = function()
                    OpenGarageList()
                end
            }
        }
    })
    lib.showContext('admin_garage_menu')
end

RegisterCommand('garagesetup', function()
    lib.callback('unique_garage:isAdmin', false, function(isAdmin)
        if not isAdmin then
            lib.notify({title = 'Error', description = 'No tienes permisos para usar este comando.', type = 'error'})
            return
        end
        OpenAdminMenu()
    end)
end, false)
