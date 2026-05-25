HasPermission = false
InTask = false
Resting = false
ShowTextUI = false
Targets = {}

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
        ClearPedTasksImmediately(PlayerPedId())

        if Config.TextUI ~= false and Config.TextUI ~= 'false' then
            if Config.TextUI:lower() == 'mt_3dtextui' then
                for k,v in pairs(Targets) do
                    TextUI3DFunction("remove", {id = v})
                end    
                Targets = {}  
            elseif Config.TextUI ~= 'DrawText3D' then    
                TextUIFunction('hide')
            end
        else    
            for k,v in pairs(Targets) do
                TargetFunction('remove', '', {zone = v})
            end    
            Targets = {}  
        end    
    end
end)

function SendNotify(Number)
    notification(Config.Notify[Number][1], Config.Notify[Number][2], Config.Notify[Number][3], Config.Notify[Number][4])
end

local GYMBlips = {}

function RefreshGymEntities()
    -- Cleanup existing entities
    for _, blip in pairs(GYMBlips) do
        if DoesBlipExist(blip) then RemoveBlip(blip) end
    end
    GYMBlips = {}

    if Config.TextUI ~= false and Config.TextUI ~= 'false' then
        if Config.TextUI:lower() == 'mt_3dtextui' then
            for k,v in pairs(Targets) do
                TextUI3DFunction("remove", {id = v})
            end    
            Targets = {}  
        end
    else    
        for k,v in pairs(Targets) do
            TargetFunction('remove', '', {zone = v})
        end    
        Targets = {}  
    end

    -- Create new entities
    for k, v in pairs(Config.Gyms) do
        if v.Blip.Use then
            local GYMBlip = AddBlipForCoord(v.GYMCoords.x, v.GYMCoords.y, v.GYMCoords.z)
            SetBlipSprite(GYMBlip, v.Blip.sprite)
            SetBlipColour(GYMBlip, v.Blip.colour)
            SetBlipScale(GYMBlip, v.Blip.size)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(k)
            EndTextCommandSetBlipName(GYMBlip)
            SetBlipAsShortRange(GYMBlip, true)
            table.insert(GYMBlips, GYMBlip)
        end

        for _k, _v in pairs(v.Exersices) do
            if Config.TextUI == false or Config.TextUI == 'false' then
                if Config.Target:upper() == 'OXTARGET' then
                    local gym = TargetFunction("add", "coord", {
                        coords = vector3(_v.x, _v.y, _v.z),
                        radius = 2.0,
                        debug = false,
                        drawSprite = true,
                        options = {{
                            name = 'gym',
                            onSelect = function()
                                if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                    TriggerEvent('mt_skills:client:PlayExerciseEvent', _v.type, _v.heading, k)
                                end
                            end,
                            label = Config.Exersices[_v.type]['label'],
                            icon = "fa-solid fa-play",
                            distance = 2.0,
                        }}
                    })
                    table.insert(Targets, gym)
                elseif Config.Target:upper() == 'QB-TARGET' then 
                    local gym = TargetFunction('add', 'coord', {"Exersices"..k.._k, vector3(_v.x, _v.y, _v.z), 2.0,{name = "Exersices"..k.._k, debugPoly = false}, 
                        {options = { 
                            { 
                                type = "client", 
                                action = function() 
                                    if not IsPedInAnyVehicle(PlayerPedId(), false) then
                                        TriggerEvent('mt_skills:client:PlayExerciseEvent', _v.type, _v.heading, k)
                                    end
                                end,
                                label = Config.Exersices[_v.type]['label'],
                                icon = "fa-solid fa-play",
                            }
                        },
                        distance = 2.0,}}
                    )
                    table.insert(Targets, gym)
                end
            elseif Config.TextUI:lower() == 'mt-notify' or Config.TextUI:lower() == 'mt_3dtextui' then
                TextUI3DFunction("add", {
                    id = "Exersices"..k.._k,
                    position = vector3(_v.x, _v.y, _v.z),
                    text = Config.Exersices[_v.type]['label'],
                    triggerName = 'mt_skills:client:PlayExerciseEvent',
                    args = {_v.type, _v.heading, k},
                    canUseInVeh = false
                })
                table.insert(Targets, "Exersices"..k.._k)
            end
        end
    end
end

Citizen.CreateThread(function()
    ESX.TriggerServerCallback('mt-gym:server:getGyms', function(serverGyms)
        Config.Gyms = serverGyms
        RefreshGymEntities()
    end)

    while true do
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local NearMarker = false
        sleep = 1000

        for k, v in pairs(Config.Gyms) do
            for _k, _v in pairs(v.Exersices) do
                local distance = #(coords - vector3(_v.x, _v.y, _v.z))
                
                -- Only run the local loop logic if we ARE NOT using mt-notify (3D)
                -- Because mt-notify handles its own interaction/distance logic via exports.
                if Config.TextUI:lower() ~= 'mt-notify' and Config.TextUI:lower() ~= 'mt_3dtextui' then
                    if distance < Config.Gyms[k]['Distances']['Marker'] then
                        if distance < Config.Gyms[k]['Distances']['Text'] and InTask == false then
                            sleep = 1
                            
                            if Config.TextUI == 'DrawText3D' then
                                DrawText3D(_v.x, _v.y, _v.z+0.3, ''.. Config.Texts.Text3D[1] ..' '.. Config.Exersices[_v.type]['label'] ..' '.. Config.Texts.Text3D[2] ..'')
                            else
                                NearMarker = true
                            end    

                            if IsControlJustReleased(0, Config.PressKey) then
                                if not IsPedInAnyVehicle(playerPed, false) then
                                    if HasPermission then
                                        workout(_v.type, _v.heading)
                                    else
                                        if Config.Gyms[k]['ItemRequired']['Use'] == false then
                                            workout(_v.type, _v.heading)
                                        else
                                            TSCB('mt-gym:server:getItem', function(HasItem)
                                                if HasItem then
                                                    HasPermission = true
                                                    CheckDistanceAndTime(k)
                                                    workout(_v.type, _v.heading)
                                                else
                                                    SendNotify(1)
                                                    HasPermission = false
                                                end
                                            end, Config.Gyms[k]['ItemRequired']['Item'], Config.Gyms[k]['ItemRequired']['RemoveItem'])
                                        end
                                    end
                                else
                                    SendNotify(4)
                                end
                            end  
                        end
                    end
                else
                    -- If using mt-notify, we only use this loop for Marker drawing if you have markers enabled (optional)
                    -- For now, we assume mt-notify handles the 'Dot' visibility.
                end
            end
        end
        Wait(sleep)

        if Config.TextUI ~= 'DrawText3D' and Config.TextUI ~= false and Config.TextUI ~= 'false' then
            if ShowTextUI and not NearMarker then
                TextUIFunction('hide')
                ShowTextUI = false
            end
        end    
    end
end)

RegisterNetEvent('mt-gym:client:updateGymConfigs', function(newGymData)
    Config.Gyms = newGymData
    RefreshGymEntities()
end)

RegisterNetEvent('mt-gym:client:openAdminMenu', function()
    local elements = {
        {title = 'Crear Nuevo Gimnasio', icon = 'plus', onSelect = function() CreateNewGym() end}
    }

    for name, data in pairs(Config.Gyms) do
        table.insert(elements, {
            title = 'Editar: ' .. name,
            icon = 'dumbbell',
            onSelect = function() EditGymMenu(name) end
        })
    end

    lib.registerContext({
        id = 'gym_admin_main',
        title = 'Panel Administrativo - MT GYM',
        options = elements
    })
    lib.showContext('gym_admin_main')
end)

function CreateNewGym()
    local input = lib.inputDialog('Nuevo Gimnasio', {
        {type = 'input', label = 'Nombre del Gimnasio', required = true},
    })
    if not input then return end
    local name = input[1]
    local coords = GetEntityCoords(PlayerPedId())

    Config.Gyms[name] = {
        ItemRequired = {Use = false, Item = '', Time = 60, RemoveItem = false},
        Distances = {Marker = 5.0, Text = 1.5},
        GYMCoords = { x = coords.x, y = coords.y, z = coords.z},
        Marker = { Distance = 15, Sprite = 30, Rotation = true, UpAndDown = false, Brightness = 100, r = 255, g = 0, b = 0, sizes = {x = 0.25, y = 0.3, z = 0.3}},
        Blip = { Use = true, colour = 1, size = 0.8, sprite = 311 },
        Exersices = {}
    }
    TriggerServerEvent('mt-gym:server:saveGymData', Config.Gyms)
end

function EditGymMenu(gymName)
    local gym = Config.Gyms[gymName]
    lib.registerContext({
        id = 'edit_gym_menu',
        title = 'Gimnasio: ' .. gymName,
        menu = 'gym_admin_main',
        options = {
            {title = 'Añadir Punto de Ejercicio', icon = 'plus', onSelect = function() AddExercisePoint(gymName) end},
            {title = 'Ver/Eliminar Puntos', icon = 'eye', onSelect = function() ViewExercisesMenu(gymName) end},
            {title = 'Actualizar Coordenadas Principales', icon = 'location-dot', onSelect = function() 
                local coords = GetEntityCoords(PlayerPedId())
                Config.Gyms[gymName].GYMCoords = {x = coords.x, y = coords.y, z = coords.z}
                TriggerServerEvent('mt-gym:server:saveGymData', Config.Gyms)
            end},
            {title = 'Eliminar Gimnasio', icon = 'trash', onSelect = function() 
                Config.Gyms[gymName] = nil
                TriggerServerEvent('mt-gym:server:saveGymData', Config.Gyms)
                TriggerEvent('mt-gym:client:openAdminMenu')
            end}
        }
    })
    lib.showContext('edit_gym_menu')
end

function AddExercisePoint(gymName)
    local exerciseTypes = {}
    for k, v in pairs(Config.Exersices) do
        table.insert(exerciseTypes, {value = k, label = v.label})
    end

    local input = lib.inputDialog('Añadir Ejercicio', {
        {type = 'select', label = 'Tipo de Ejercicio', options = exerciseTypes, required = true},
    })
    if not input then return end

    local type = input[1]
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())

    table.insert(Config.Gyms[gymName].Exersices, {
        type = type,
        x = coords.x,
        y = coords.y,
        z = coords.z,
        heading = heading
    })

    TriggerServerEvent('mt-gym:server:saveGymData', Config.Gyms)
end

function ViewExercisesMenu(gymName)
    local points = Config.Gyms[gymName].Exersices
    local elements = {}

    for i, p in ipairs(points) do
        table.insert(elements, {
            title = '#' .. i .. ' - ' .. p.type,
            description = 'Click para eliminar este punto',
            icon = 'trash',
            onSelect = function() 
                table.remove(Config.Gyms[gymName].Exersices, i)
                TriggerServerEvent('mt-gym:server:saveGymData', Config.Gyms)
            end
        })
    end

    lib.registerContext({
        id = 'view_points_menu',
        title = 'Puntos: ' .. gymName,
        menu = 'edit_gym_menu',
        options = elements
    })
    lib.showContext('view_points_menu')
end

RegisterNetEvent('mt_skills:client:PlayExerciseEvent')
AddEventHandler('mt_skills:client:PlayExerciseEvent', function(type, heading, name)
    if InTask == false then
        if HasPermission then
            workout(type, heading)
        else
            if Config.Gyms[name]['ItemRequired']['Use'] == false then
                workout(type, heading)
            else
                TSCB('mt-gym:server:getItem', function(HasItem)
                    if HasItem then
                        HasPermission = true
                        CheckDistanceAndTime(name)
                        workout(type, heading)
                    else
                        SendNotify(1)
                        HasPermission = false
                    end
                end, Config.Gyms[name]['ItemRequired']['Item'], Config.Gyms[name]['ItemRequired']['RemoveItem'])
            end
        end
    end    
end)

function workout(exersices, heading)
    Citizen.CreateThread(function()
        if Resting == false then
            if Config.TextUI ~= 'DrawText3D' and Config.TextUI ~= false and Config.TextUI ~= 'false' then
                TextUIFunction('hide')
                exports['mt-notify']:SetGlobalSuppression(true) -- OPTIMIZATION: Hide all dots
            end
            
            InTask = true
            local playerPed = PlayerPedId()
            local exerciseData = Config.Exersices[exersices]
            
            SetEntityHeading(playerPed, heading)
            FreezeEntityPosition(playerPed, true)
            DisableControls()
    
            local timer = exerciseData['time'] * 1000
            local animData = nil

            if exerciseData.anim_sequence then
                -- Sequential Animation Logic (Elite Essence Style)
                local seq = exerciseData.anim_sequence
                
                -- Load all needed dicts
                if seq.enter then LoadAnim(seq.enter.dict) end
                if seq.training then LoadAnim(seq.training.dict) end
                if seq.exit then LoadAnim(seq.exit.dict) end
                if seq.idle then LoadAnim(seq.idle.dict) end

                -- Step 1: Enter
                if seq.enter then
                    TaskPlayAnim(playerPed, seq.enter.dict, seq.enter.clip, 8.0, -8.0, seq.enter.duration, 0, 0, false, false, false)
                    Wait(seq.enter.duration)
                end

                -- Step 2: Training (Idle loop during progress bar)
                if seq.training then
                    animData = { dict = seq.training.dict, clip = seq.training.clip, flag = 1 }
                end

                Wait(200) 

                -- Thread to cancel with X
                Citizen.CreateThread(function()
                    while InTask do
                        if IsControlJustPressed(0, 73) then -- X Key
                            if Config.ProgressBar:lower() == 'ox_lib' then
                                if lib.progressActive() then
                                    lib.cancelProgress()
                                end
                            end
                            break
                        end
                        Citizen.Wait(0)
                    end
                end)

                local completed = ProgressBarFunction(timer, exerciseData['label'], animData)
                
                -- Step 3: Exit
                if seq.exit then
                    TaskPlayAnim(playerPed, seq.exit.dict, seq.exit.clip, 8.0, -8.0, seq.exit.duration, 0, 0, false, false, false)
                    Wait(seq.exit.duration)
                end

                if completed then
                    AddSkill(exerciseData['skill'])
                else
                    SendNotify(7)
                end
            else
                -- Legacy / Scenario Logic
                if exersices == 'running' then
                    animData = { scenario = 'WORLD_HUMAN_JOG_STANDING' }
                elseif exersices == 'situps' then
                    animData = { dict = 'amb@world_human_sit_ups@male@idle_a', clip = 'idle_a', flag = 1 }
                else
                    animData = { scenario = exerciseData['anim'] }
                end

                Wait(200) 
                
                -- Thread to cancel with X
                Citizen.CreateThread(function()
                    while InTask do
                        if IsControlJustPressed(0, 73) then -- X Key
                            if Config.ProgressBar:lower() == 'ox_lib' then
                                if lib.progressActive() then
                                    lib.cancelProgress()
                                end
                            end
                            break
                        end
                        Citizen.Wait(0)
                    end
                end)

                local completed = ProgressBarFunction(timer, exerciseData['label'], animData)

                if completed then
                    AddSkill(exerciseData['skill'])
                else
                    SendNotify(7)
                end
            end
            FreezeEntityPosition(playerPed, false)
            ClearPedTasks(playerPed)
            
            if exersices == 'weightlifting' or exersices == 'bench' or exersices == 'dumbbells' then
                ClearAreaOfObjects(GetEntityCoords(playerPed), 1.0, 0)
            end
    
            InTask = false
            exports['mt-notify']:SetGlobalSuppression(false) -- RESTORE: Show dots again

            if Config.GYMResting.Use then
                Resting = true    
                CheckResting()
            end
        elseif Resting then
            SendNotify(5)    
        end
    end)
end

function DisableControls()
    Citizen.CreateThread(function()
        while InTask do 
            Citizen.Wait(0)
            for k,v in pairs(Config.DisableControls) do
                DisableControlAction(0,v,true)
                DisableControlAction(2,v,true)
            end
        end
    end)
end

function CheckDistanceAndTime(shop)
    timer = math.floor(Config.Gyms[shop]['ItemRequired']['Time']*60)
    SendNUIMessage({action = "StartTimer", time = timer})
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000*5)
            timer = timer-5
  
            if #(GetEntityCoords(PlayerPedId()) - vector3(Config.Gyms[shop]['GYMCoords']['x'], Config.Gyms[shop]['GYMCoords']['y'], Config.Gyms[shop]['GYMCoords']['z'])) > Config.GYMDistance then
              SendNotify(3)
              HasPermission = false
              SendNUIMessage({action = "StopTimer"})
              break
            end
  
            if timer < 1 then
              SendNotify(2)
              HasPermission = false
              break
            end
        end
    end)
end

function CheckResting()
    Citizen.CreateThread(function()
		Citizen.Wait(Config.GYMResting.RestDuration*1000)
		Resting = false
        SendNotify(6)
    end)
end

RegisterNetEvent('mt_skills:client:PlayExercise')
AddEventHandler('mt_skills:client:PlayExercise', function(type, heading)
    workout(type, heading)
end)

function LoadAnim(dict)
    local timeout = 2000
    while not HasAnimDictLoaded(dict) and timeout > 0 do
        RequestAnimDict(dict)
        Wait(10)
        timeout = timeout - 10
    end
end

function gymDoExercises()
    return InTask
end

-- MT GYM REPLICATION FINISHED