local icons = {
    ["police"] = "fa-star",
    ["ambulance"] = "fa-ambulance",
    ["mechanic"] = "fa-wrench",
    ["unemployed"] = "fa-user",
    ["cardealer"] = "fa-car"
}


local function createJobMenu()
    local jobs, currJob = lib.callback.await("multijob:server:getJobs", false)
    local options = {}

    for k, v in pairs(jobs) do
        options[#options+1] = {
            title = ("%s %s"):format(v.label, (currJob == k and "(Activo)" or "") ),
            description = ("Rango: %s - %s"):format(v.grade, v.gradeLabel),
            icon = icons[k],
            disabled = currJob == k,
            event = "multijob:client:sendJobData",
            args = {name =k},
            arrow = true,
            -- menu = 'select_job'
        }
    end
    if not next(jobs) then
        options[1] = {
            title = "Sin Trabajos",
            icon = "fa-cross",
            disabled = true,
        }
    end
    
    lib.registerContext({
        id = "job_menu",
        title = "Multitrabajo",
        options = options,
    })
    lib.showContext("job_menu")
end


AddEventHandler("multijob:client:sendJobData", function(job)
    lib.registerContext({
        id = 'select_job',
        title = 'Acciones de Trabajo',
        menu = 'job_menu',
        onBack = function()
        end,
        options = {
          {
            title = 'Seleccionar/Entrar de servicio',
            icon = "check",
            onSelect = function()
                TriggerServerEvent("multijob:server:setJob", job.name)
                lib.notify({description = "¡Has cambiado a este trabajo!"})
            end
          },
          {
            title = 'Renunciar al trabajo',
            icon = "xmark",
            onSelect = function()
                if job.name == "unemployed" then lib.notify({description = "¡No puedes renunciar a este trabajo!"}) return end
                TriggerServerEvent("multijob:server:removeJob", {id = cache.serverId, job = job.name})
                lib.notify({description = "¡Has renunciado al trabajo!"})
            end
          }
        }
      })
      lib.showContext('select_job')
end)




RegisterCommand("jobm", function()
    createJobMenu()
end)