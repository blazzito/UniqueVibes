local JobCenter = {}
local isMenuOpen = false
local npcPed = nil
local interactionPoint = nil
local isInitialized = false

-- Crear Blip
function JobCenter:CreateBlip()
    local blip = AddBlipForCoord(
        JobCenterConfig.Blip.Coords.x,
        JobCenterConfig.Blip.Coords.y,
        JobCenterConfig.Blip.Coords.z
    )
    SetBlipSprite(blip, JobCenterConfig.Blip.Sprite)
    SetBlipColour(blip, JobCenterConfig.Blip.Color)
    SetBlipScale(blip, JobCenterConfig.Blip.Scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(JobCenterConfig.Blip.Label)
    EndTextCommandSetBlipName(blip)
end

-- Crear NPC
function JobCenter:CreateNPC()
    -- Eliminar NPC anterior si existe
    if npcPed and DoesEntityExist(npcPed) then
        DeleteEntity(npcPed)
        npcPed = nil
    end
    
    local npcCfg = JobCenterConfig.NPC
    
    lib.requestModel(npcCfg.Model)
    
    npcPed = CreatePed(4, GetHashKey(npcCfg.Model), 
        npcCfg.Coords.x, 
        npcCfg.Coords.y, 
        npcCfg.Coords.z - 1.0, 
        npcCfg.Coords.w, 
        false, true)
    
    FreezeEntityPosition(npcPed, true)
    SetEntityInvincible(npcPed, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)
    SetPedDiesWhenInjured(npcPed, false)
    SetPedCanPlayAmbientAnims(npcPed, true)
    SetPedCanRagdollFromPlayerImpact(npcPed, false)
    SetEntityCanBeDamaged(npcPed, false)
end

-- Crear punto de interacción
function JobCenter:CreateInteractionPoint()
    local coords = JobCenterConfig.NPC.Coords
    
    interactionPoint = lib.points.new({
        coords = vec3(coords.x, coords.y, coords.z),
        distance = 10.0,
    })

    function interactionPoint:onEnter()
        MTDrawText3D('jobcenter_start', 'Oficina de Trabajo', vec3(coords.x, coords.y, coords.z), 'E')
    end

    function interactionPoint:onExit()
        MTHideText3D('jobcenter_start')
    end

    function interactionPoint:nearby()
        if self.currentDistance < 2.0 then
            if IsControlJustPressed(0, 38) then -- E
                JobCenter:OpenMenu()
            end
        end
    end
end

-- Inicializar
function JobCenter:Init()
    if isInitialized then 
        return 
    end
    
    self:CreateBlip()
    self:CreateNPC()
    self:CreateInteractionPoint()
    
    isInitialized = true
end

-- Abrir menú
function JobCenter:OpenMenu()
    if isMenuOpen then return end
    isMenuOpen = true
    
    -- Obtener rankings y ofertas del servidor
    lib.callback('mt-newjobs:getRankings', false, function(rankings)
        lib.callback('mt-newjobs:getJobOffers', false, function(offers)
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = 'showJobCenter',
                jobs = JobCenterConfig.Jobs,
                rankings = rankings or {
                    hours = {},
                    earnings = {}
                },
                offers = offers or {}
            })
        end)
    end)
end

-- Cerrar menú
function JobCenter:CloseMenu()
    isMenuOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'hideJobCenter'
    })
end

-- Marcar ubicación del trabajo
function JobCenter:SetWaypoint(jobId)
    for _, job in ipairs(JobCenterConfig.Jobs) do
        if job.id == jobId then
            self:CloseMenu()
            Wait(200) -- Esperar a que se cierre el NUI
            SetNewWaypoint(job.location.x, job.location.y)
            
            lib.notify({
                title = 'Oficina de Trabajo',
                description = 'Ubicación de ' .. job.name .. ' marcada en el mapa',
                type = 'success',
                duration = 5000
            })
            break
        end
    end
end

-- Callbacks NUI
RegisterNUICallback('notify', function(data, cb)
    ESX.ShowNotification(data.message, data.type)
    cb('ok')
end)

RegisterNUICallback('closeJobCenter', function(data, cb)
    JobCenter:CloseMenu()
    cb('ok')
end)

RegisterNUICallback('selectJob', function(data, cb)
    if data.jobId then
        JobCenter:SetWaypoint(data.jobId)
        TriggerServerEvent('mt-newjobs:server:selectJob', data.jobId)
    end
    cb('ok')
end)

RegisterNUICallback('submitApplication', function(data, cb)
    lib.callback('mt-newjobs:submitApplication', false, function(success)
        -- El servidor ya envía la notificación
    end, data)
    cb('ok')
end)

-- Menú de Jefe
function JobCenter:OpenBossMenu()
    local xPlayer = ESX.GetPlayerData()
    if xPlayer.job.grade_name ~= 'boss' then
        lib.notify({
            title = 'Oficina de Trabajo',
            description = 'Solo los jefes de empresa pueden acceder a este menú',
            type = 'error'
        })
        return
    end

    lib.registerContext({
        id = 'job_boss_menu',
        title = 'Gestión de Empresa: ' .. xPlayer.job.label,
        options = {
            {
                title = 'Publicar Oferta de Empleo',
                description = 'Crea una nueva oferta que aparecerá en el Job Center',
                icon = 'plus',
                onSelect = function()
                    JobCenter:OpenOfferCreator()
                end
            },
            {
                title = 'Ver Postulaciones Recibidas',
                description = 'Revisa las solicitudes de jugadores interesados',
                icon = 'users',
                onSelect = function()
                    JobCenter:ViewApplications()
                end
            },
            {
                title = 'Mis Ofertas Activas',
                description = 'Gestiona o elimina tus ofertas publicadas',
                icon = 'list',
                onSelect = function()
                    JobCenter:ManageMyOffers()
                end
            }
        }
    })

    lib.showContext('job_boss_menu')
end

function JobCenter:OpenOfferCreator()
    local xPlayer = ESX.GetPlayerData()
    local input = lib.inputDialog('Nueva Oferta de Empleo', {
        {type = 'input', label = 'Nombre del Negocio', default = xPlayer.job.label, required = true},
        {type = 'input', label = 'Puesto', placeholder = 'Ej: Conductor de Taxi', required = true},
        {type = 'input', label = 'Salario', placeholder = 'Ej: $1500 + Propinas'},
        {type = 'input', label = 'Beneficios', placeholder = 'Ej: Seguro Médico, Vehículo Propio'},
        {type = 'textarea', label = 'Descripción', placeholder = 'Describe el puesto...', required = true},
        {type = 'select', label = 'Icono (Logo)', options = {
            {label = 'Maletín', value = 'briefcase'},
            {label = 'Taxi', value = 'taxi'},
            {label = 'Autobús', value = 'bus'},
            {label = 'Camión', value = 'truck'},
            {label = 'Basura', value = 'trash-2'},
            {label = 'Comida', value = 'utensils'},
            {label = 'Seguridad', value = 'shield'},
            {label = 'Mecánico', value = 'wrench'}
        }, default = 'briefcase'}
    })

    if not input then return end

    TriggerServerEvent('mt-newjobs:server:saveOffer', {
        business_name = input[1],
        position = input[2],
        salary = input[3],
        benefits = input[4],
        description = input[5],
        logo = input[6]
    })
end

function JobCenter:ViewApplications()
    local xPlayer = ESX.GetPlayerData()
    lib.callback('mt-newjobs:getApplications', false, function(apps)
        if not apps or #apps == 0 then
            lib.notify({title = 'Empresa', description = 'No hay postulaciones nuevas', type = 'info'})
            return
        end

        local options = {}
        for _, app in ipairs(apps) do
            table.insert(options, {
                title = app.name .. ' (' .. app.age .. ' años)',
                description = 'Tel: ' .. app.phone .. '\nExp: ' .. string.sub(app.experience, 1, 50) .. '...',
                icon = 'user',
                onSelect = function()
                    lib.registerContext({
                        id = 'view_app_detail',
                        title = 'Postulación: ' .. app.name,
                        menu = 'view_applications_list',
                        options = {
                            {title = 'Nombre', description = app.name, icon = 'user', readOnly = true},
                            {title = 'Edad', description = app.age .. ' años', icon = 'calendar', readOnly = true},
                            {title = 'Teléfono', description = app.phone, icon = 'phone', readOnly = true},
                            {title = 'Experiencia', description = app.experience, icon = 'file-text', readOnly = true},
                            {
                                title = 'Cerrar Postulación',
                                description = 'Elimina esta postulación de la lista',
                                icon = 'trash',
                                onSelect = function()
                                    -- Logic to delete application could be added here
                                end
                            }
                        }
                    })
                    lib.showContext('view_app_detail')
                end
            })
        end

        lib.registerContext({
            id = 'view_applications_list',
            title = 'Postulaciones Recibidas',
            menu = 'job_boss_menu',
            options = options
        })
        lib.showContext('view_applications_list')
    end, xPlayer.job.name)
end

function JobCenter:ManageMyOffers()
    lib.callback('mt-newjobs:getJobOffers', false, function(offers)
        local xPlayer = ESX.GetPlayerData()
        local options = {}
        
        for _, offer in ipairs(offers) do
            if offer.author_identifier == xPlayer.identifier then
                table.insert(options, {
                    title = offer.business_name .. ' - ' .. offer.position,
                    description = 'Click para eliminar esta oferta',
                    icon = 'briefcase',
                    onSelect = function()
                        local alert = lib.alertDialog({
                            header = 'Confirmar eliminación',
                            content = '¿Estás seguro de que quieres eliminar esta oferta?',
                            centered = true,
                            cancel = true
                        })
                        if alert == 'confirm' then
                            lib.callback('mt-newjobs:deleteOffer', false, function(success)
                                if success then
                                    lib.notify({title = 'Éxito', description = 'Oferta eliminada', type = 'success'})
                                    JobCenter:ManageMyOffers()
                                end
                            end, offer.id)
                        end
                    end
                })
            end
        end

        if #options == 0 then
            lib.notify({title = 'Ofertas', description = 'No tienes ofertas publicadas', type = 'info'})
            return
        end

        lib.registerContext({
            id = 'my_offers_list',
            title = 'Mis Ofertas de Empleo',
            menu = 'job_boss_menu',
            options = options
        })
        lib.showContext('my_offers_list')
    end)
end

-- RegisterCommand('gestiontrabajo', function()
--     JobCenter:OpenBossMenu()
-- end)

RegisterNetEvent('mt-newjobs:client:openOfferCreator', function()
    JobCenter:OpenOfferCreator()
end)

-- Inicializar cuando el jugador carga
CreateThread(function()
    Wait(1000) -- Esperar a que todo cargue
    JobCenter:Init()
end)

-- Limpieza al detener el recurso
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    if npcPed and DoesEntityExist(npcPed) then
        DeleteEntity(npcPed)
    end
    
    if interactionPoint then
        interactionPoint:remove()
    end
end)


