Config.QuickMenu = {}
Config.QuickMenu.Tabs = {
    {
        index = 'ref',
        icon = 'fa-solid fa-hashtag',
        defaultSelected = true
    },
    {
        index = 'com-rad',
        icon = 'fa-solid fa-circle-nodes',
    },
    {
        index = 'radio',
        icon = 'fa-solid fa-walkie-talkie',
    },
    {
        index = 'interaccion',
        icon = 'fa-solid fa-user',
    },
    {
        index = 'guns',
        icon = 'fa-solid fa-gun',
        allowedJobs = {
            Config.PoliceJobCategory
        },
        hidden = not Config.Holster -- This tab will be hidden if the holster system is disabled, this option ignore allowed jobs
    },
    {
        index = 'items',
        icon = 'fa-solid fa-road-barrier',
    },
    {
        index = 'settings',
        icon = 'fa-solid fa-wrench',
    },
}

Config.QuickMenu.Interactions = {
    {
        header = true,
        translation = 'CitizenInteraction'
    },
    {
        translation = 'Search',
        icon = 'lni lni-user',
        command = 'cachearPolice',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'Wifes',
        icon = 'lni lni-user',
        event = 'origen_police:client:cuffuncuff',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'Escort',
        icon = 'lni lni-user',
        event = 'origen_police:client:drag'
    },
    {
        translation = 'PutInVehicle',
        icon = 'lni lni-user',
        event = 'origen_police:client:vehicleinof'
    },
    {
        translation = 'JumpTo',
        icon = 'lni lni-user',
        command = 'placaje',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'revive',
        icon = 'lni lni-user',
        command = 'revivep',
        allowedJobs = {
            Config.EmsJobCategory
        },
    },
    {
        translation = 'HealWounds',
        icon = 'lni lni-user',
        command = Config.Framework == 'qbcore' and 'heal' or 'healp',
        allowedJobs = {
            Config.EmsJobCategory
        },
    },
    {
        translation = 'PutTakeAnkle',
        icon = 'lni lni-user',
        event = 'origen_police:client:anklecuff',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        header = true,
        translation = 'VehicleInteraction'
    },
    {
        translation = 'VehicleInformation',
        icon = 'lni lni-car-alt',
        event = 'origen_police:client:vehicledata',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'SeizeVehicle',
        icon = 'lni lni-car-alt',
        event = 'origen_police:client:dvpolice',
        allowedJobs = {
            Config.PoliceJobCategory
        },
        hidden = not Config.Confiscate
    },
    {
        translation = 'ForceLock',
        icon = 'lni lni-car-alt',
        event = 'origen_police:client:openveh',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'StopTraffic',
        icon = 'lni lni-car-alt',
        serverEvent = 'origen_police:server:stoptraffic'
    },
    {
        translation = 'ReduceTraffic',
        icon = 'lni lni-car-alt',
        serverEvent = 'origen_police:server:slowtraffic'
    },
    {
        translation = 'ResumeTraffic',
        icon = 'lni lni-car-alt',
        serverEvent = 'origen_police:server:resumetraffic'
    },
}

Config.QuickMenu.Holster = {
    {
        translation = 'ShowHideWeapons',
        icon = 'lni lni-user',
        event = 'origen_police:holster:unarm',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        header = true,
        translation = 'PistolPos'
    },
    {
        translation = 'Front',
        icon = 'lni lni-user',
        command = 'holster boxers',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'Behind',
        icon = 'lni lni-user',
        command = 'holster backhandgun',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'WaistCart',
        icon = 'lni lni-user',
        command = 'holster waisthandgun',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'NormalCart',
        icon = 'lni lni-user',
        command = 'holster handguns',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'ChestCart',
        icon = 'lni lni-user',
        command = 'holster chesthandgun',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'ThighCart',
        icon = 'lni lni-user',
        command = 'holster hiphandgun',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'LegCart',
        icon = 'lni lni-user',
        command = 'holster leghandgun',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'SeparateLegCart',
        icon = 'lni lni-user',
        command = 'holster handguns2',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        header = true,
        translation = 'RiflePos'
    },
    {
        translation = 'Chest',
        icon = 'lni lni-user',
        command = 'holster tacticalrifle',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
    {
        translation = 'Back',
        icon = 'lni lni-user',
        command = 'holster assault',
        allowedJobs = {
            Config.PoliceJobCategory
        },
    },
}

Config.QuickMenu.Objects = {
    {
        name = 'cone', -- Name of Config.Props object
        icon = 'cone.png',
        translation = 'Cone',
        allowedJobs = {
            'all'
        },
    },
    {
        name = 'barrier', -- Name of Config.Props object
        icon = 'barrier.png',
        translation = 'Barrier',
        allowedJobs = {
            'all'
        },
    },
    {
        name = 'signal', -- Name of Config.Props object
        icon = 'signal.png',
        translation = 'Sign',
        allowedJobs = {
            'all'
        },
    },
    {
        name = 'spikes', -- Name of Config.Props object
        icon = 'spikes.png',
        translation = 'Spikes',
        allowedJobs = (function()
            local jobs = {}
            for _, jobData in pairs(Config.JobCategory[Config.PoliceJobCategory] or {}) do
                table.insert(jobs, jobData.name)
            end
            return jobs
        end)(),
    },
    {
        name = 'radar', -- Name of Config.Props object
        icon = 'radar.png',
        translation = 'Radar',
        allowedJobs = (function()
            local jobs = {}
            for _, jobData in pairs(Config.JobCategory[Config.PoliceJobCategory] or {}) do
                table.insert(jobs, jobData.name)
            end
            return jobs
        end)(),
    },
    {
        name = 'none', -- The remove button is not a Config.Props object
        icon = 'bin.png',
        translation = 'Delete',
        allowedJobs = {
            'all'
        },
        customEvent = 'rmveobj', -- Custom event to remove the object
        customClass = 'bg-qrr', -- Custom class for the red background
        dontClose = true, -- This button will not close the quick menu
    },
}