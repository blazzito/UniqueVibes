Config.UploadMethod = 'discord' -- discord | fivemanage | custom
-- fivemanage only work for image logs, in this case the only image log is the TakeScreenshot
-- we don't give support for add custom upload methods, if you want to add a custom upload method you need to do it by yourself

Config.Logs = {
    ["Spectate"] = "YOUR_DISCORD_WEBHOOK",
    ["TakeScreenshot"] = "YOUR_DISCORD_WEBHOOK",
    ["Bring"] = "YOUR_DISCORD_WEBHOOK",
    ["ReturnPlayer"] = "YOUR_DISCORD_WEBHOOK",
    ["TpPlayer"] = "YOUR_DISCORD_WEBHOOK",
    ["FreezePlayer"] = "YOUR_DISCORD_WEBHOOK",
    ["ChangeBucket"] = "YOUR_DISCORD_WEBHOOK",
    ["SkinForced"] = "YOUR_DISCORD_WEBHOOK",
    ["PermissionsChanged"] = "YOUR_DISCORD_WEBHOOK",
    ["AsignedJob"] = "YOUR_DISCORD_WEBHOOK",
    ["AsignedGang"] = "YOUR_DISCORD_WEBHOOK",
    ["GiveItems"] = "YOUR_DISCORD_WEBHOOK",
    ["ManageMoney"] = "YOUR_DISCORD_WEBHOOK",
    ["GiveProperty"] = "YOUR_DISCORD_WEBHOOK",
    ["GiveVehicle"] = "YOUR_DISCORD_WEBHOOK",
    ["AddSanction"] = "YOUR_DISCORD_WEBHOOK",
    ["RemoveSanction"] = "YOUR_DISCORD_WEBHOOK",
    ["BanPlayer"] = "YOUR_DISCORD_WEBHOOK",
    ["KickPlayer"] = "YOUR_DISCORD_WEBHOOK",
    ["CKPlayer"] = "YOUR_DISCORD_WEBHOOK",
    ["ReportAccepted"] = "YOUR_DISCORD_WEBHOOK",
    ["ReportDeleted"] = "YOUR_DISCORD_WEBHOOK",
}

Config.UseIdentifiers = true -- If you want to show the identifiers of the player in the logs

-- DON'T EDIT BELOW THIS LINE IF YOU DON'T KNOW WHAT YOU'RE DOING!!!

Config.Fields = {
    ['discord'] = 'files[]',
    ['fivemanage'] = 'image',
    ['custom'] = ''
}

function GetCustomUrlFromResponse(resp)
    -- Thats the function that will return the URL of the image when the upload method is set to "custom"
end