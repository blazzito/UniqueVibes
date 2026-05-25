local DB = {}

-- Ranks
function DB.GetRanks()
    return MySQL.query.await('SELECT * FROM uv_vip_ranks ORDER BY id ASC')
end

function DB.CreateRank(data)
    return MySQL.insert.await('INSERT INTO uv_vip_ranks (name, label, money_passive, coins_passive, `interval`) VALUES (?, ?, ?, ?, ?)', {
        data.name, data.label, data.money_passive, data.coins_passive, data.interval
    })
end

function DB.UpdateRank(id, data)
    return MySQL.update.await('UPDATE uv_vip_ranks SET name = ?, label = ?, money_passive = ?, coins_passive = ?, `interval` = ? WHERE id = ?', {
        data.name, data.label, data.money_passive, data.coins_passive, data.interval, id
    })
end

function DB.DeleteRank(id)
    return MySQL.query.await('DELETE FROM uv_vip_ranks WHERE id = ?', { id })
end

-- Users
function DB.GetUserVIP(identifier)
    return MySQL.single.await('SELECT u.*, r.name as rank_name, r.label as rank_label FROM uv_vip_users u LEFT JOIN uv_vip_ranks r ON u.rank_id = r.id WHERE u.identifier = ?', { identifier })
end

function DB.GetAllUsersVIP()
    return MySQL.query.await('SELECT u.*, r.label as rank_label FROM uv_vip_users u LEFT JOIN uv_vip_ranks r ON u.rank_id = r.id')
end

function DB.GetAllUsers()
    local users = MySQL.query.await('SELECT identifier, firstname, lastname, accounts FROM users')
    local vipUsers = {}
    local results = MySQL.query.await('SELECT u.*, r.label as rank_label FROM uv_vip_users u LEFT JOIN uv_vip_ranks r ON u.rank_id = r.id')
    
    for _, v in ipairs(results) do
        vipUsers[v.identifier] = v
    end

    local list = {}
    local now = os.time()
    
    for _, u in ipairs(users) do
        local accounts = json.decode(u.accounts or '{}')
        local vip = vipUsers[u.identifier]
        
        local isExpired = false
        if vip and vip.expiration then
            local expTime = nil
            if type(vip.expiration) == 'number' then
                expTime = vip.expiration / 1000
            elseif type(vip.expiration) == 'string' then
                local y, m, d, h, min, s = vip.expiration:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
                if y then expTime = os.time({year=y, month=m, day=d, hour=h, min=min, sec=s}) end
            end
            
            if expTime and expTime < now then
                isExpired = true
            end
        end

        table.insert(list, {
            identifier = u.identifier,
            name = (u.firstname and u.lastname) and (u.firstname .. ' ' .. u.lastname) or 'Unknown',
            coins = accounts.uv_coins or 0,
            rank_id = (vip and not isExpired) and vip.rank_id or nil,
            rank_label = (vip and not isExpired) and vip.rank_label or 'Ninguno',
            expiration = (vip and not isExpired) and vip.expiration or nil
        })
    end
    return list
end

function DB.AssignRank(identifier, rank_id, expiration)
    return MySQL.query.await('INSERT INTO uv_vip_users (identifier, rank_id, expiration) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE rank_id = ?, expiration = ?', {
        identifier, rank_id, expiration, rank_id, expiration
    })
end

function DB.RemoveRank(identifier)
    return MySQL.query.await('DELETE FROM uv_vip_users WHERE identifier = ?', { identifier })
end

-- Coins (Integrated with ESX accounts JSON)
function DB.GetCoins(identifier)
    local result = MySQL.single.await('SELECT accounts FROM users WHERE identifier = ?', { identifier })
    if result and result.accounts then
        local accounts = json.decode(result.accounts)
        return accounts.uv_coins or 0
    end
    return 0
end

function DB.AddCoins(identifier, amount, action)
    local result = MySQL.single.await('SELECT accounts FROM users WHERE identifier = ?', { identifier })
    if result and result.accounts then
        local accounts = json.decode(result.accounts)
        accounts.uv_coins = (accounts.uv_coins or 0) + amount
        MySQL.update.await('UPDATE users SET accounts = ? WHERE identifier = ?', { json.encode(accounts), identifier })
        
        -- Also update ESX if player is online
        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer then
            xPlayer.setAccountMoney('uv_coins', accounts.uv_coins)
        end
    end

    return MySQL.insert.await('INSERT INTO uv_coins_logs (identifier, amount, action) VALUES (?, ?, ?)', {
        identifier, amount, action
    })
end

function DB.RemoveCoins(identifier, amount, action)
    local result = MySQL.single.await('SELECT accounts FROM users WHERE identifier = ?', { identifier })
    if result and result.accounts then
        local accounts = json.decode(result.accounts)
        accounts.uv_coins = math.max(0, (accounts.uv_coins or 0) - amount)
        MySQL.update.await('UPDATE users SET accounts = ? WHERE identifier = ?', { json.encode(accounts), identifier })

        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer then
            xPlayer.setAccountMoney('uv_coins', accounts.uv_coins)
        end
    end

    return MySQL.insert.await('INSERT INTO uv_coins_logs (identifier, amount, action) VALUES (?, ?, ?)', {
        identifier, -amount, action
    })
end

function DB.GetRanking()
    -- Fetching from users table and parsing JSON for coins
    local players = MySQL.query.await('SELECT identifier, accounts FROM users')
    local ranking = {}
    for _, p in ipairs(players) do
        if p.accounts then
            local accounts = json.decode(p.accounts)
            if accounts.uv_coins and accounts.uv_coins > 0 then
                table.insert(ranking, {
                    identifier = p.identifier,
                    coins = accounts.uv_coins
                })
            end
        end
    end
    table.sort(ranking, function(a, b) return a.coins > b.coins end)
    
    local top10 = {}
    for i=1, math.min(10, #ranking) do
        table.insert(top10, ranking[i])
    end
    return top10
end

-- Codes
function DB.GetCodes()
    return MySQL.query.await('SELECT * FROM uv_vip_codes')
end

function DB.CreateCode(data)
    return MySQL.insert.await('INSERT INTO uv_vip_codes (code, type, value, max_uses, expiration) VALUES (?, ?, ?, ?, ?)', {
        data.code, data.type, json.encode(data.value), data.max_uses, data.expiration
    })
end

function DB.DeleteCode(id)
    return MySQL.query.await('DELETE FROM uv_vip_codes WHERE id = ?', { id })
end

function DB.GetCode(code)
    return MySQL.single.await('SELECT * FROM uv_vip_codes WHERE code = ?', { code })
end

function DB.MarkCodeUsed(code_id, identifier)
    MySQL.query.await('UPDATE uv_vip_codes SET current_uses = current_uses + 1 WHERE id = ?', { code_id })
    return MySQL.insert.await('INSERT INTO uv_vip_codes_used (code_id, identifier) VALUES (?, ?)', { code_id, identifier })
end

function DB.HasUserUsedCode(code_id, identifier)
    local result = MySQL.single.await('SELECT 1 FROM uv_vip_codes_used WHERE code_id = ? AND identifier = ?', { code_id, identifier })
    return result ~= nil
end

exports('GetDB', function() return DB end)
GlobalState.MTVIP_DB = DB -- Making it accessible globally within the script
