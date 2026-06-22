Config.UploadMethod = 'discord' -- discord | fivemanage | custom

-- MAY BE YOU'RE LOOKING FOR THE config/logs/logs.lua FILE AND NOT THIS ONE
-- DON'T EDIT BELOW THIS LINE IF YOU DON'T KNOW WHAT YOU'RE DOING PLEASE

Config.Fields = {
    ['discord'] = 'files[]',
    ['fivemanage'] = 'image',
    ['custom'] = ''
}

function GetCustomUrlFromResponse(resp)
    -- Thats the function that will return the URL of the image from the response
    local function ShowErrorPhoto(response)
        print("Error taking photo: " .. json.encode(response) .. " - " .. "Probably you have to change the webhook because it's not valid")
    end
    local retval = false
    if Config.UploadMethod == 'discord' then
        if resp['attachments'] == nil then
            ShowErrorPhoto(resp)
        else
            retval = resp.attachments[1].url
        end
    elseif Config.UploadMethod == 'fivemanage' then
        if resp then
            retval = resp.url
        else
            ShowErrorPhoto(resp)
        end
    else
        print("Unknown upload method specified: " .. Config.UploadMethod)
    end
    return retval
end