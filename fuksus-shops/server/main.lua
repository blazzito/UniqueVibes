-- ============================================================
--  fuksus-shops — server/main.lua
--  Security: prices come from Config (never trusted from client)
--            job checks done server-side on real ESX player data
--            payment method validated against whitelist
--            item names validated against shop inventory
--            amounts capped and type-checked
-- ============================================================

-- Build a fast item lookup: shopKey -> itemName -> itemData
-- Populated once on resource start so buyItems never iterates Config inline.
local shopItemIndex = {}

-- Also build the safe "public" shop data sent to clients:
-- only location, name, description, blip, filters, item UI metadata (no prices).
local publicShopData = {}

local function buildIndexes()
    local itemNames = {}
    -- Gather ESX item labels when available
    if ESX and ESX.Items then
        for item, data in pairs(ESX.Items) do
            itemNames[item] = data.label
        end
    end

    for shopKey, shop in pairs(Config.shops) do
        shopItemIndex[shopKey] = {}

        local publicItems = {}
        for _, item in ipairs(shop.items) do
            -- Server index: full data including authoritative price
            shopItemIndex[shopKey][item.name] = item

            -- Public item: send type, name, description, label, price (informational —
            -- the server never trusts this back from the client at purchase time)
            publicItems[#publicItems + 1] = {
                type        = item.type,
                name        = item.name,
                description = item.description or '',
                label       = itemNames[item.name] or item.name,
                price       = item.price,
            }
        end

        publicShopData[shopKey] = {
            name        = shop.name,
            description = shop.description,
            blip        = shop.blip,
            filters     = shop.filters,
            items       = publicItems,
            ped         = shop.ped,
            locations   = shop.locations,
            hasJobs     = (shop.jobs ~= nil and next(shop.jobs) ~= nil),
        }
    end

    local shopCount = 0
    for _ in pairs(publicShopData) do shopCount = shopCount + 1 end
    print('[^2fuksus-shops^7] Indexes built for ' .. tostring(shopCount) .. ' shop(s).')
    TriggerClientEvent('fuksus-shops:dataReady', -1)
end

-- Run after ESX items are available
CreateThread(function()
    Wait(500)
    buildIndexes()
end)

-- ============================================================
--  HELPER: verify the caller has the required job for a shop
-- ============================================================
local function playerCanAccessShop(source, shopKey)
    local shop = Config.shops[shopKey]
    if not shop then return false end

    -- No job restriction → everyone can access
    if not shop.jobs or not next(shop.jobs) then return true end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    local job = xPlayer.getJob()
    for jobName, minGrade in pairs(shop.jobs) do
        if job.name == jobName and job.grade >= minGrade then
            return true
        end
    end
    return false
end

-- ============================================================
--  CALLBACK: send only public data (no prices, no sensitive cfg)
-- ============================================================
lib.callback.register('fuksus-shops:getPublicData', function(source)
    return {
        marker        = Config.marker,
        image_location = Config.image_location,
        locale        = Config.locale,
        shops         = publicShopData,
    }
end)

-- ============================================================
--  CALLBACK: server-side job check (client just asks yes/no)
-- ============================================================
lib.callback.register('fuksus-shops:canOpen', function(source, shopKey)
    if type(shopKey) ~= 'string' then return false end
    return playerCanAccessShop(source, shopKey)
end)

-- ============================================================
--  CALLBACK: purchase handler — all values resolved server-side
--
--  data expected from client:
--    data.shopKey  (string)  which shop
--    data.payment  (string)  'bank' | 'money'
--    data.items    (table)   [{ name, amount }]  ← no price from client
-- ============================================================
lib.callback.register('fuksus-shops:buyItems', function(source, data)
    -- Basic type guards
    if type(data) ~= 'table'            then return false end
    if type(data.shopKey)  ~= 'string'  then return false end
    if type(data.payment)  ~= 'string'  then return false end
    if type(data.items)    ~= 'table'   then return false end
    if #data.items == 0                 then return false end

    -- Validate payment method against server whitelist
    if not Config.allowed_payments[data.payment] then
        return false
    end

    -- Validate shop exists
    local shopIndex = shopItemIndex[data.shopKey]
    if not shopIndex then return false end

    -- Job check server-side
    if not playerCanAccessShop(source, data.shopKey) then
        return false
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- ── Validate & resolve each cart item ──────────────────
    local resolvedItems = {}
    local totalCost     = 0

    for _, cartItem in ipairs(data.items) do
        -- Type safety on what the client sent
        if type(cartItem.name)   ~= 'string'  then return false end
        if type(cartItem.amount) ~= 'number'  then return false end

        local amount = math.floor(cartItem.amount)

        -- Amount bounds
        if amount < 1 or amount > Config.max_amount_per_item then
            return false
        end

        -- Item must exist in THIS shop (prevents cross-shop exploits)
        local itemData = shopIndex[cartItem.name]
        if not itemData then return false end

        -- Price comes from server Config, not from client
        local lineTotal = itemData.price * amount
        totalCost       = totalCost + lineTotal

        resolvedItems[#resolvedItems + 1] = {
            name   = cartItem.name,
            amount = amount,
            price  = itemData.price,
        }
    end

    -- ── Check balance ──────────────────────────────────────
    local accountMoney = 0

    if data.payment == 'money' then
        accountMoney = xPlayer.getMoney()
    else
        local account = xPlayer.getAccount(data.payment)
        if not account then return false end
        accountMoney = account.money
    end

    if totalCost > accountMoney then
        xPlayer.showNotification(Locales[Config.locale]['game'].notEnoughMoney)
        return false
    end

    -- ── Check carry capacity for all items first ───────────
    for _, item in ipairs(resolvedItems) do
        if not xPlayer.canCarryItem(item.name, item.amount) then
            xPlayer.showNotification(Locales[Config.locale]['game'].notEnoughSpace)
            return false
        end
    end

    -- ── Deduct money then add items ────────────────────────
    -- Re-fetch player in case of disconnect between checks
    xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    if data.payment == 'money' then
        xPlayer.removeMoney(totalCost)
    else
        xPlayer.removeAccountMoney(data.payment, totalCost)
    end

    for _, item in ipairs(resolvedItems) do
        -- Re-check carry after each addition (sequential safety)
        if xPlayer.canCarryItem(item.name, item.amount) then
            xPlayer.addInventoryItem(item.name, item.amount)
        end
    end

    xPlayer.showNotification(Locales[Config.locale]['game'].purchaseSuccess)
    return true
end)