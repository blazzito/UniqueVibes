ServerConfig = {}

-- If you want to sender the identifiers of the player in the logs
ServerConfig.UseIdentifiers = true

-- If you want to use fivemanage you can use it with this url structure:
--            https://api.fivemanage.com/api/image?apiKey=YOUR_API_TOKEN
-- Where YOUR_API_TOKEN is the token that you get from fivemanage page

-- If you want to use discord you can use it with this url structure:
--            https://discord.com/api/webhooks/WEBHOOK_ID/WEBHOOK_TOKEN
-- Where WEBHOOK_ID and WEBHOOK_TOKEN are the values that you get from discord webhook page

ServerConfig.Logs = {
    DispatchAlerts = 'YOUR_LOG_URL',
    Shapes = 'YOUR_LOG_URL',
    Notes = 'YOUR_LOG_URL',
    DutyClock = 'YOUR_LOG_URL',
    Management = 'YOUR_LOG_URL',
    Camera = 'YOUR_LOG_URL',
    Federal = 'YOUR_LOG_URL',
    Bills = 'YOUR_LOG_URL',
    Cams = 'YOUR_LOG_URL',
    Mugshots = 'YOUR_LOG_URL',
    Ankle = 'YOUR_LOG_URL'
}