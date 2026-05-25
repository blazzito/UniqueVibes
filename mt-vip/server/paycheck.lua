local DB = exports['mt-vip']:GetDB()

--- Helper to parse MySQL date strings to OS time
local function ParseDate(date)
    if not date then return nil end
    if type(date) == 'number' then return math.floor(date / 1000) end
    if type(date) == 'string' then
        local y, m, d, h, min, s = date:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
        if y then
            return os.time({year=y, month=m, day=d, hour=h, min=min, sec=s})
        end
    end
    return nil
end

--- Handles the logic for giving rewards to a player
local function GiveVIPRewards(xPlayer, vipData)
    local identifier = xPlayer.getIdentifier()
    
    -- 1. Deliver money directly to BANK account
    if vipData.money_passive and vipData.money_passive > 0 then
        xPlayer.addAccountMoney('bank', vipData.money_passive)
    end

    -- 2. Deliver coins
    if vipData.coins_passive and vipData.coins_passive > 0 then
        DB.AddCoins(identifier, vipData.coins_passive, 'Passive VIP Reward')
    end

    -- 3. Update last paycheck timestamp in DB
    MySQL.query.await('UPDATE uv_vip_users SET last_paycheck = CURRENT_TIMESTAMP WHERE identifier = ?', { identifier })
    
    -- 4. Update Cache immediately to avoid double rewards before DB sync
    exports['mt-vip']:RefreshPlayerCache(identifier)

    -- 5. Notify player
    xPlayer.showNotification(string.format(Config.Locales['received_paycheck'], vipData.money_passive or 0, vipData.coins_passive or 0))
end

--- Main loop for checking VIP status and rewards
CreateThread(function()
    while true do
        Wait(60 * 1000) -- Check every 1 minute
        
        local VIPCache = exports['mt-vip']:GetVIPCache()
        local now = os.time()

        for identifier, vipData in pairs(VIPCache) do
            local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
            
            if xPlayer then
                -- A. Check Expiration
                local expiration = ParseDate(vipData.expiration)
                
                if expiration and expiration < now then
                    -- VIP expired: Remove rank and notify
                    DB.RemoveRank(identifier)
                    exports['mt-vip']:RefreshPlayerCache(identifier) -- Remove from cache
                    xPlayer.showNotification("Tu rango VIP ha expirado y los beneficios han sido retirados.")
                else
                    -- B. Check Paycheck Interval
                    local lastPay = ParseDate(vipData.last_paycheck) or 0
                    local minutesSinceLastPay = (now - lastPay) / 60

                    if minutesSinceLastPay >= (vipData.interval or 30) then
                        -- Interval reached: Deliver rewards
                        GiveVIPRewards(xPlayer, vipData)
                    end
                end
            else
                -- Player not online anymore but still in cache? Cleanup.
                -- (Usually handled by esx:playerDropped, but good for safety)
                exports['mt-vip']:RefreshPlayerCache(identifier)
            end
        end
    end
end)
