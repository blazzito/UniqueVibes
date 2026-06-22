Config.PoliceBadgeLength = 4 -- We recommend 3 or 4, more or less will break the badge
Config.OnlyPoliceCanUseBadge = true -- If you want to allow only police to use the badge
Config.ShowBadgePreview = true -- If you want to show the badge preview for the player that uses the badge
Config.NotPoliceCanShowBadge = false -- If you want to allow non-police to show the badge to other players
Config.GenerateBadgeToTheAgent = false -- If you want to generate the badge and give it to the agent directly

Config.CustomBadges = {
    {
        item = "lspd_badge",
        type = "LSPD",
        model = "prop_lspd_badge",
    },
    {
        item = "bcsd_badge",
        type = "BCSD",
        model = "prop_bcso_badge",
    },
    {
        item = "fib_badge",
        type = "FIB",
        model = "prop_fib_badge",
        generate = function(source, data, cb) -- Server side function to generate the badge, strings are error messages.
            local TargetPlayer = FW_GetPlayerFromCitizenid(data.cid)
            if not TargetPlayer then return "Target player not found for FIB badge" end
            if TargetPlayer.PlayerData.source then
                TriggerClientEvent("origen_police:client:GenerateMugshotBadge", TargetPlayer.PlayerData.source, TargetPlayer.PlayerData.charinfo.firstname.." "..TargetPlayer.PlayerData.charinfo.lastname, source, {url = ServerConfig.Logs.Mugshots, fields = Config.Fields[Config.UploadMethod]})
                return true
            end
            return "The police agent should be online to generate the badge"
        end
    },
}

function GetBadgeConfig(itemName, type)
    for _, badge in pairs(Config.CustomBadges) do
        if badge.item == itemName or badge.type == type then
            return badge
        end
    end
    return nil
end