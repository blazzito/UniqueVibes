-- Crear tabla de aplicaciones si no existe
MySQL.ready(function()
    -- Asegurar que la tabla de ofertas tenga la columna 'job'
    MySQL.query([[
        ALTER TABLE `mt_newjobs_offers` ADD COLUMN IF NOT EXISTS `job` VARCHAR(50) DEFAULT NULL;
    ]])
    
    -- Asegurar que la tabla de aplicaciones exista
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `mt_newjobs_applications` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `job` VARCHAR(50) NOT NULL,
            `identifier` VARCHAR(60) NOT NULL,
            `name` VARCHAR(100),
            `age` INT,
            `phone` VARCHAR(20),
            `experience` TEXT,
            `time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ]])
end)

lib.callback.register('mt-newjobs:getRankings', function(source)
    local rankings = {
        overall = {
            hours = {},
            earnings = {},
            experience = {}
        },
        jobs = {} -- Aquí guardaremos el top de cada trabajo: rankings.jobs['taxi'] = { hours = {}, ... }
    }

    local jobs = JobCenterConfig.Jobs
    for _, job in ipairs(jobs) do
        rankings.jobs[job.id] = {
            hours = {},
            earnings = {},
            experience = {}
        }
    end

    -- 1. TOP GLOBAL (Suma de todos los trabajos por jugador)
    local overallHours = MySQL.query.await([[
        SELECT s.identifier, SUM(s.total_time) as value, u.firstname, u.lastname 
        FROM `mt_newjobs_stats` s 
        LEFT JOIN users u ON s.identifier = u.identifier 
        GROUP BY s.identifier 
        ORDER BY value DESC LIMIT 10
    ]])
    if overallHours then
        for _, row in ipairs(overallHours) do
            table.insert(rankings.overall.hours, {
                name = (row.firstname or "Ciudadano") .. " " .. (row.lastname or "Desconocido"),
                value = row.value or 0
            })
        end
    end

    -- 2. TOP GLOBAL GANANCIAS
    local overallEarnings = MySQL.query.await([[
        SELECT s.identifier, SUM(s.total_earned) as value, u.firstname, u.lastname 
        FROM `mt_newjobs_stats` s 
        LEFT JOIN users u ON s.identifier = u.identifier 
        GROUP BY s.identifier 
        ORDER BY value DESC LIMIT 10
    ]])
    if overallEarnings then
        for _, row in ipairs(overallEarnings) do
            table.insert(rankings.overall.earnings, {
                name = (row.firstname or "Ciudadano") .. " " .. (row.lastname or "Desconocido"),
                value = row.value or 0
            })
        end
    end

    -- 3. TOP GLOBAL EXPERIENCIA
    local overallXP = MySQL.query.await([[
        SELECT s.identifier, SUM(s.xp) as value, u.firstname, u.lastname 
        FROM `mt_newjobs_stats` s 
        LEFT JOIN users u ON s.identifier = u.identifier 
        GROUP BY s.identifier 
        ORDER BY value DESC LIMIT 10
    ]])
    if overallXP then
        for _, row in ipairs(overallXP) do
            table.insert(rankings.overall.experience, {
                name = (row.firstname or "Ciudadano") .. " " .. (row.lastname or "Desconocido"),
                value = row.value or 0
            })
        end
    end

    -- 2. TOP POR TRABAJO (Específico de cada id)
    local jobStats = MySQL.query.await([[
        SELECT s.identifier, s.job, s.total_time, s.total_earned, s.xp, u.firstname, u.lastname 
        FROM `mt_newjobs_stats` s 
        LEFT JOIN users u ON s.identifier = u.identifier
        ORDER BY s.total_time DESC
    ]])
    
    if jobStats then
        for _, row in ipairs(jobStats) do
            if rankings.jobs[row.job] then
                -- Añadir al top de horas del trabajo (máximo 10)
                if #rankings.jobs[row.job].hours < 10 then
                    table.insert(rankings.jobs[row.job].hours, {
                        name = (row.firstname or "Ciudadano") .. " " .. (row.lastname or "Desconocido"),
                        value = row.total_time or 0
                    })
                end
                -- Añadir al top de ganancias del trabajo (máximo 10)
                if #rankings.jobs[row.job].earnings < 10 then
                    table.insert(rankings.jobs[row.job].earnings, {
                        name = (row.firstname or "Ciudadano") .. " " .. (row.lastname or "Desconocido"),
                        value = row.total_earned or 0
                    })
                end
            end
        end
    end

    return rankings
end)

lib.callback.register('mt-newjobs:getJobOffers', function(source)
    local result = MySQL.query.await('SELECT * FROM `mt_newjobs_offers` ORDER BY id DESC LIMIT 10')
    if not result or #result == 0 then
        return {}
    end
    return result
end)

RegisterNetEvent('mt-newjobs:server:updateOffer', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return end

    if not data.id then return end

    -- Verificar si es el autor o admin
    local offer = MySQL.single.await('SELECT author_identifier FROM `mt_newjobs_offers` WHERE id = ?', {data.id})
    if not offer then return end

    if offer.author_identifier ~= xPlayer.identifier and xPlayer.getGroup() ~= 'admin' then
        TriggerClientEvent('ox_lib:notify', _source, {title = 'Oficina de Trabajo', description = 'No tienes permiso para editar esta oferta', type = 'error'})
        return
    end

    MySQL.update.await('UPDATE `mt_newjobs_offers` SET business_name = ?, position = ?, salary = ?, benefits = ?, description = ?, logo = ? WHERE id = ?', {
        data.business_name,
        data.position,
        data.salary,
        data.benefits,
        data.description,
        data.logo,
        data.id
    })

    xPlayer.showNotification('Oferta actualizada correctamente.', 'success')
end)

RegisterNetEvent('mt-newjobs:server:createOffer', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return end

    -- Optional: Add a cost to post an offer (e.g. $500)
    -- if xPlayer.getMoney() < 500 then
    --     TriggerClientEvent('ox_lib:notify', _source, {title = 'Oficina de Trabajo', description = 'No tienes suficiente dinero para publicar una oferta ($500)', type = 'error'})
    --     return
    -- end
    -- xPlayer.removeMoney(500)

    local authorName = xPlayer.getName()

    MySQL.insert.await('INSERT INTO `mt_newjobs_offers` (business_name, position, salary, benefits, description, logo, author_identifier, author_name, job) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        data.business_name,
        data.position,
        data.salary,
        data.benefits,
        data.description,
        data.logo,
        xPlayer.identifier,
        authorName,
        xPlayer.getJob().name
    })

    xPlayer.showNotification('Oferta de empleo publicada correctamente.', 'success')
end)

lib.callback.register('mt-newjobs:submitApplication', function(source, data)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Obtener el trabajo de la oferta para guardarlo en la postulación
    local offerData = MySQL.single.await('SELECT job FROM `mt_newjobs_offers` WHERE id = ?', {data.offerId})
    local jobName = offerData and offerData.job or 'unknown'

    MySQL.insert.await('INSERT INTO `mt_newjobs_applications` (job, identifier, name, age, phone, experience) VALUES (?, ?, ?, ?, ?, ?)', {
        jobName,
        xPlayer.identifier,
        data.name,
        data.age,
        data.phone,
        data.experience
    })

    xPlayer.showNotification('Tu postulación ha sido enviada correctamente.', 'success')
    return true
end)

lib.callback.register('mt-newjobs:getApplications', function(source, jobId)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return {} end

    -- Solo el jefe puede ver las postulaciones de su trabajo
    -- O si es admin
    local job = xPlayer.getJob()
    if job.name ~= jobId and xPlayer.getGroup() ~= 'admin' then
        return {}
    end

    return MySQL.query.await('SELECT * FROM `mt_newjobs_applications` WHERE job = ? ORDER BY id DESC', {jobId})
end)

lib.callback.register('mt-newjobs:deleteOffer', function(source, offerId)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    local offer = MySQL.single.await('SELECT author_identifier FROM `mt_newjobs_offers` WHERE id = ?', {offerId})
    if not offer then return false end

    if offer.author_identifier ~= xPlayer.identifier and xPlayer.getGroup() ~= 'admin' then
        return false
    end

    MySQL.query.await('DELETE FROM `mt_newjobs_offers` WHERE id = ?', {offerId})
    return true
end)

RegisterNetEvent('mt-newjobs:server:deleteApplication', function(appId)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return end
    MySQL.query.await('DELETE FROM `mt_newjobs_applications` WHERE id = ?', {appId})
end)

RegisterNetEvent('mt-newjobs:server:selectJob', function(jobId)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then return end

    -- Validar que el trabajo exista en el Job Center
    local validJob = false
    local jobName = jobId
    for _, job in ipairs(JobCenterConfig.Jobs) do
        if job.id == jobId then
            validJob = true
            jobName = job.name
            break
        end
    end

    if validJob then
        xPlayer.setJob(jobId, 0)
        TriggerClientEvent('ox_lib:notify', _source, {
            title = 'Oficina de Trabajo',
            description = 'Has sido contratado como ' .. jobName,
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', _source, {
            title = 'Oficina de Trabajo',
            description = 'El trabajo seleccionado no es válido',
            type = 'error'
        })
    end
end)


