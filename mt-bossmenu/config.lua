Config = {}

Config.Locale = 'es'
Config.Currency = '$'
Config.Timestamp = 'us'
Config.UnemployedJobName = 'unemployed'

Config.JobCreator = false -- 'jaksam', 'lunar', false

Config.AdminGroups = { 'admin', 'superadmin', 'founder', 'ceo', 'director', 'subdirector' }
Config.AdminCommand = 'adminboss'

Config.Menus = {
    employees = { enabled = true },
    salaries = { enabled = true, maximum = nil },
    account = { enabled = true },
    bonus = { enabled = true, maximum = nil }
}