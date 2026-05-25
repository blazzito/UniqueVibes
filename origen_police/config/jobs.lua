Config.JobCategory = {
    ["police"] = {
        {
            name = "police",
            titleListLabel = "Police List",
            color = "#3f5ba1",
            badge = "lspd_badge", -- lspd_badge | bcsd_badge | fib_badge
            penalFilter = "police", -- The name of the penal code filter to separate the penal code by job
            colorHueDeg = 0, -- The hue degree of the color, 0 is the default color, you can change it to get a different color
            society = "police", -- The name of the society that will receive the money when a player pay a bill
        },
        {
            name = "sheriff",
            titleListLabel = "Sheriff List",
            color = "#a1823f",
            badge = "bcsd_badge", -- lspd_badge | bcsd_badge | fib_badge
            penalFilter = "police", -- The name of the penal code filter to separate the penal code by job
            colorHueDeg = 0, -- The hue degree of the color, 0 is the default color, you can change it to get a different color
            society = "police", -- The name of the society that will receive the money when a player pay a bill
        },
    },
    ["ambulance"] = {
        {
            name = "ambulance",
            titleListLabel = "Ambulance List",
            color = "#bf3737",
            badge = "bcsd_badge", -- lspd_badge | bcsd_badge | fib_badge
            penalFilter = "ambulance", -- The name of the penal code filter to separate the penal code by job
            colorHueDeg = 140, -- The hue degree of the color, 0 is the default color, you can change it to get a different color
            society = "ambulance", -- The name of the society that will receive the money when a player pay a bill
        },
    },
}

Config.PoliceJobCategory = "police" -- This is to send the police alerts to a specific job category
Config.EmsJobCategory = "ambulance" -- If you want to remove ems jobs you can set this to nil
Config.BossGrade = { 4 }  -- ONLY ESX, set the grades that will be considered as boss and will have more permissions like manage penal code

-- DON'T TOUCH BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING
function GetJobCategory(jobName)
    for category, jobs in pairs(Config.JobCategory) do
        for _, job in pairs(jobs) do
            if job.name:lower() == jobName:lower() then
                return category
            end
        end
    end
    return nil
end

if Config.EmsJobCategory ~= nil and Config.JobCategory[Config.EmsJobCategory] == nil then
    print("Warning: The EMS job category '"..Config.EmsJobCategory.."' does not exist in Config.JobCategory. If you want to remove EMS jobs, set Config.EmsJobCategory to nil.")
elseif Config.JobCategory[Config.PoliceJobCategory] == nil then
    print("Warning: The Police job category '"..Config.PoliceJobCategory.."' does not exist in Config.JobCategory.")
end