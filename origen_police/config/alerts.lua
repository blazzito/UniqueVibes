Config.MinAlertCooldown = 20 -- Seconds player have to wait to send another alert
Config.RecieveAlwaysAlerts = true -- if it is false, the alert first will be send to the dispatch if it's open, if it's closed the alert will be send to the mini dispatch, if it's true the alert will be send to the dispatch and mini dispatch at the same time
Config.DispatchRedirect = false -- If it's true the alerts first will be send to the dispatch, then the dispatch manager will redirect the alert to other units, if it's false the alerts will be send directly to all the units
Config.ShootAlert = true -- Enable shoot alert
Config.DisplayPlateOnVehicleAlerts = true -- To enable or disable the display of the plate in the vehicle alerts
Config.HeatMapAlerts = true -- Enable or disable the heat map alerts in the dispatch
Config.WeaponSilencierBlockShootAlert = true -- If the weapon has a silencier, it will not trigger the shoot alert
Config.BlackListedShootAlertWeapons = { -- The list of weapons that will not trigger the shoot alert
    --"WEAPON_STUNGUN",
    --"WEAPON_FLAREGUN",
    --"WEAPON_FIREEXTINGUISHER",
}
Config.BlackListedShootAlertAmmo = { -- The list of ammo that will not trigger the shoot alert
    "AMMO_BALL",
    "AMMO_PETROLCAN",
}

Config.ShootAlertCooldown = 120000 -- Cooldown between each shoot alert
Config.ShootAlertRequireSeen = true -- If true, the alert will be send only if the shooter is near a ped(200m) or a camera(50m), if false, the alert will be send even if the player is not seen by a ped or a camera
Config.ShootAlertDisablePolice = true -- If true, shoot alerts triggered byte jobs listed in config/jobs.lua will not be sent, if false, the alerts will be sent ignoring the shooter job
Config.ShootAlertWeaponChance = 50 -- The chance of the weapon to be sended to the alert (0-100%)
Config.ShootAlertAmmoChance = 50 -- The chance of the ammo to be sended to the alert (0-100%)
Config.ShootAlertAmmoTranslation = { -- The translation of each ammo
    -- Low caliber
    [`AMMO_PISTOL`] = Translations.LowCaliber,
    [`AMMO_SMG`] = Translations.LowCaliber,
    [`AMMO_FLARE`] = Translations.LowCaliber,

    -- Shotgun caliber
    [`AMMO_SHOTGUN`] = Translations.ShotgunCaliber,

    -- Medium caliber
    [`AMMO_RIFLE`] = Translations.MediumCaliber,

    -- Special caliber
    [-1] = Translations.HighCaliber, -- If the ammo is not in the list, it will be considered as high caliber
}

Config.OpenDispatchOnAlert = true -- If true, the dispatch will be opened when an alert is received
Config.SelectNewAlert = true -- If true, the new alert will be selected when received

Config.DebugRestrictZones = false -- If true, the restricted zones will be showed in the map
Config.RestrictedAlertZones = { -- This only will restrict automatic alerts(shoot alert), manual alerts like /911 will still work
    {
        {431.03, -981.66},
        {431.33, -971.71},
        {425.23, -979.31}
    }
}

Config.BlackListedWords = { -- Add the words you want to block in the alerts
    "dani"
}

-- DONT TOUCH BELOW
function IsWeaponBlacklisted(weaponName)
    for i = 1, #Config.BlackListedShootAlertWeapons do
        if Config.BlackListedShootAlertWeapons[i]:lower() == weaponName:lower() then
            return true
        end
    end
    return false
end

function IsWeaponBlacklistedForProfile(weaponName)
    for i = 1, #Config.BlackListedUsersWeapons do
        if Config.BlackListedUsersWeapons[i]:lower() == weaponName:lower() then
            return true
        end
    end
    return false
end

function IsAmmoBlacklisted(ammoHash)
    for i = 1, #Config.BlackListedShootAlertAmmo do
        if GetHashKey(Config.BlackListedShootAlertAmmo[i]) == ammoHash then
            return true
        end
    end
    return false
end

function GetCaliberTranslation(ammoHash)
    for k, v in pairs(Config.ShootAlertAmmoTranslation) do
        if k == ammoHash then
            return v
        end
    end
    return Config.ShootAlertAmmoTranslation[-1] -- If the ammo is not in the list, it will be considered as high caliber
end

-- Validate the Config.ShootAlertAmmoTranslation indexes
for k, _ in pairs(Config.ShootAlertAmmoTranslation) do
    if type(k) ~= "number" then
        print("^1[ERROR]^7 Config.ShootAlertAmmoTranslation index is not a number: " .. tostring(k))
    end
end