BillingAdapter = {}

local function useExternal()
    return Config.UseExternalBilling == true and GetResourceState(Config.ExternalBillingResource or 'origen_billing') == 'started'
end

local function billingExport(fn, ...)
    local res = Config.ExternalBillingResource or 'origen_billing'
    return exports[res][fn](exports[res], ...)
end

local function legacyGetBillsFromCitizenID(cid, jobCategory)
    local jobs = {}
    for _, jobData in pairs(Config.JobCategory[jobCategory] or {}) do
        jobs[#jobs + 1] = "'" .. jobData.name .. "'"
    end
    if #jobs == 0 then return {} end
    local jobFilter = table.concat(jobs, ',')
    return MySQL.awaitQuery(
        'SELECT * FROM origen_police_bills WHERE citizenid = ? AND job IN (' .. jobFilter .. ') ORDER BY id DESC',
        { cid }
    ) or {}
end

local function legacyGetUnpayedBills(citizenid)
    return MySQL.awaitQuery(
        'SELECT * FROM origen_police_bills WHERE citizenid = ? AND payed = 0 ORDER BY id DESC',
        { citizenid }
    ) or {}
end

local function legacyGetBillsFromReporter(reportid)
    return MySQL.awaitQuery(
        'SELECT citizenid, concepts, price, months FROM origen_police_bills WHERE reportid = ?',
        { reportid }
    ) or {}
end

local function legacyGetDebors(jobCategory)
    local jobs = {}
    for _, jobData in pairs(Config.JobCategory[jobCategory] or {}) do
        jobs[#jobs + 1] = "'" .. jobData.name .. "'"
    end
    if #jobs == 0 then return {} end
    local jobFilter = table.concat(jobs, ',')

    if Config.Framework == "qbcore" then
        return MySQL.awaitQuery(
            'SELECT opb.citizenid, SUM(opb.price) AS totalprice, p.charinfo, p.image FROM origen_police_bills opb INNER JOIN players p ON opb.citizenid = p.citizenid WHERE opb.payed = 0 AND opb.job IN (' .. jobFilter .. ') GROUP BY opb.citizenid'
        ) or {}
    else
        return MySQL.awaitQuery(
            'SELECT opb.citizenid, SUM(opb.price) AS totalprice, u.firstname, u.lastname, u.image FROM origen_police_bills opb INNER JOIN users u ON opb.citizenid = u.identifier WHERE opb.payed = 0 AND opb.job IN (' .. jobFilter .. ') GROUP BY opb.citizenid'
        ) or {}
    end
end

local function normalizeBills(bills, totalPrice)
    if type(bills) ~= 'table' or #bills == 0 then return {} end

    if type(bills[1]) == 'table' and bills[1].price then
        return bills
    end

    local n         = #bills
    local basePrice = math.floor(totalPrice / n)
    local remainder = totalPrice - (basePrice * n)
    local result    = {}
    for i, concept in ipairs(bills) do
        result[i] = {
            name   = tostring(concept),
            price  = basePrice + (i == n and remainder or 0),
            months = 0,
        }
    end
    return result
end

function BillingAdapter.sendBill(source, data)
    local normalizedBills = normalizeBills(data.bills or {}, tonumber(data.price) or 0)
    local conceptNames = {}
    for _, b in ipairs(normalizedBills) do
        conceptNames[#conceptNames + 1] = b.name
    end

    if not useExternal() then
        local billid = MySQL.awaitInsert(
            'INSERT INTO origen_police_bills (citizenid, title, concepts, price, job, author, months) VALUES (?, ?, ?, ?, ?, ?, ?)',
            { data.citizenid, data.title or Config.Translations.PoliceBill, json.encode(conceptNames), data.price, data.job, data.author, data.months }
        )
        return { billid = billid, author = data.author, date = os.time() * 1000 }
    end

    local desc    = table.concat(conceptNames, ' | ')
    local jobName = data.job or (FW_GetPlayer(source) and FW_GetPlayer(source).PlayerData.job.name) or ''
    local authorId = FW_GetPlayer(source) and FW_GetPlayer(source).PlayerData.citizenid or tostring(source)

    local contextData = json.encode({
        source_resource = 'origen_police',
        months          = data.months,
        reportid        = data.reportid,
        concepts        = normalizedBills,
        police_author   = data.author,
        title           = data.title,
    })

    local ok, result = billingExport('CreatePoliceInvoice',
        data.citizenid,
        tonumber(data.price),
        desc,
        jobName,
        authorId,
        contextData
    )

    if not ok then
        print('[BillingAdapter] Error al crear factura externa:', result)
        return nil
    end

    return {
        billid = result,
        author = data.author,
        date   = os.time() * 1000,
    }
end

function BillingAdapter.newBillReport(index, data, author, jobCategory)
    local entry           = data.value[index]
    local normalizedBills = normalizeBills(entry.bills or {}, tonumber(entry.price) or 0)
    local conceptNames    = {}
    for _, b in ipairs(normalizedBills) do conceptNames[#conceptNames + 1] = b.name end

    if not useExternal() then
        return MySQL.awaitInsert(
            'INSERT INTO origen_police_bills (citizenid, title, concepts, price, job, author, months, reportid) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            { entry.citizenid, Config.Translations.PoliceBill, json.encode(conceptNames), entry.price, jobCategory, author, entry.months, data.reportid }
        )
    end

    local desc    = table.concat(conceptNames, ' | ')
    local jobName = jobCategory
    if Config.JobCategory and Config.JobCategory[jobCategory] and Config.JobCategory[jobCategory][1] then
        jobName = Config.JobCategory[jobCategory][1].name
    end

    local contextData = json.encode({
        source_resource = 'origen_police',
        months          = entry.months,
        reportid        = data.reportid,
        concepts        = normalizedBills,
        police_author   = author,
    })

    local ok, result = billingExport('CreatePoliceInvoice',
        entry.citizenid,
        tonumber(entry.price),
        desc,
        jobName,
        author,
        contextData
    )

    if not ok then
        print('[BillingAdapter] Error al crear factura de reporte:', result)
        return nil
    end

    return result
end

function BillingAdapter.updateBillReport(index, data)
    if not useExternal() then
        return MySQL.awaitUpdate(
            'UPDATE origen_police_bills SET citizenid = ?, concepts = ?, price = ?, months = ? WHERE id = ?',
            { data.value[index].citizenid, json.encode(data.value[index].bills), data.value[index].price, data.value[index].months, data.value[index].billid }
        )
    end

    local entry    = data.value[index]
    local invoiceId = tonumber(entry.billid)
    if not invoiceId then return false end

    local concepts = entry.bills or {}
    local desc     = type(concepts) == 'table' and table.concat(concepts, ' | ') or tostring(concepts)

    local contextData = json.encode({
        source_resource = 'origen_police',
        months          = entry.months,
        reportid        = data.reportid,
        concepts        = concepts,
    })

    local ok = billingExport('UpdatePoliceInvoice', invoiceId, {
        citizenid    = entry.citizenid,
        price        = tonumber(entry.price),
        description  = desc,
        context_data = contextData,
    })

    return ok == true
end

function BillingAdapter.deleteBill(source, data)
    if not useExternal() then
        local Player = FW_GetPlayer(source)
        if not Player then return false end
        if GetMinimunGrade(Player.PlayerData.job.name, "DeleteBill") > Player.PlayerData.job.grade.level then
            return false
        end
        return (MySQL.awaitQuery('DELETE FROM origen_police_bills WHERE id = ?', { data.billid }).affectedRows > 0)
    end

    local Player = FW_GetPlayer(source)
    if Player and GetMinimunGrade(Player.PlayerData.job.name, "DeleteBill") > Player.PlayerData.job.grade.level then
        return false
    end

    local ok = billingExport('CancelPoliceInvoice', tonumber(data.billid))
    return ok == true
end

function BillingAdapter.getBillsFromCitizenID(cid, jobCategory)
    local results = {}

    local legacyBills = legacyGetBillsFromCitizenID(cid, jobCategory)
    for _, bill in ipairs(legacyBills or {}) do
        bill._source = 'legacy'
        results[#results + 1] = bill
    end

    if not useExternal() then
        return results
    end

    local ok, externalBills = billingExport('GetPoliceBillsByIdentifier', cid, jobCategory)
    if ok and type(externalBills) == 'table' then
        for _, bill in ipairs(externalBills) do
            bill._source = 'external'
            results[#results + 1] = bill
        end
    end

    return results
end

function BillingAdapter.getUnpayedBills(citizenid)
    local results = {}

    local legacyBills = legacyGetUnpayedBills(citizenid)
    for _, bill in ipairs(legacyBills) do
        bill._source = 'legacy'
        results[#results + 1] = bill
    end

    if not useExternal() then
        return results
    end

    local ok, externalBills = billingExport('GetPolicePendingByIdentifier', citizenid)
    if ok and type(externalBills) == 'table' then
        for _, bill in ipairs(externalBills) do
            bill._source = 'external'
            results[#results + 1] = bill
        end
    end

    return results
end

function BillingAdapter.payBill(source, args)
    local isExternal = args._source == 'external'
        or (type(args.id) == 'string' and args.id:sub(1, 4) == 'ext:')

    if not useExternal() or not isExternal then
        local Player = FW_GetPlayer(source)
        if not Player then return false end
        if Player.PlayerData.money.bank < tonumber(args.price) then
            TriggerClientEvent('origen_police:ShowNotification', source, "You don't have enough money")
            return false
        end
        Player.Functions.RemoveMoney("bank", tonumber(args.price), "paid-bill")
        PayBill(args.id)
        local societyTarget = args.job
        for _, jobData in pairs(Config.JobCategory) do
            for _, job in pairs(jobData) do
                if job.name == args.job then
                    societyTarget = job.society
                end
            end
        end
        AddMoneyToSociety(tonumber(args.price), societyTarget)
        return true
    end

    local realId = type(args.id) == 'string' and tonumber(args.id:sub(5)) or tonumber(args.id)
    local ok, reason = billingExport('PayPoliceInvoice', source, realId, 'bank')
    if not ok then
        TriggerClientEvent('origen_police:ShowNotification', source, "Error paying bill: " .. tostring(reason))
        return false
    end
    return true
end

function BillingAdapter.getBillsFromReporter(reportid)
    local results = {}

    local legacyBills = legacyGetBillsFromReporter(reportid)
    for _, bill in ipairs(legacyBills or {}) do
        results[#results + 1] = bill
    end

    if not useExternal() then
        return results
    end

    local ok, externalBills = billingExport('GetPoliceInvoicesByReportId', reportid)
    if ok and type(externalBills) == 'table' then
        for _, bill in ipairs(externalBills) do
            results[#results + 1] = bill
        end
    end

    return results
end

function BillingAdapter.getDebors(jobCategory)
    local legacyDebors = legacyGetDebors(jobCategory) or {}

    if not useExternal() then
        return legacyDebors
    end

    local ok, externalDebors = billingExport('GetPoliceDebtorsByCategory', jobCategory)

    if not ok or type(externalDebors) ~= 'table' then
        return legacyDebors
    end

    local mergedMap = {}

    for _, d in ipairs(legacyDebors) do
        local cid = d.citizenid
        mergedMap[cid] = mergedMap[cid] or { citizenid = cid, totalprice = 0, charinfo = d.charinfo, firstname = d.firstname, lastname = d.lastname, image = d.image }
        mergedMap[cid].totalprice = mergedMap[cid].totalprice + (tonumber(d.totalprice) or 0)
    end

    for _, d in ipairs(externalDebors) do
        local cid = d.citizenid
        if not mergedMap[cid] then
            mergedMap[cid] = { citizenid = cid, totalprice = 0, charinfo = d.charinfo, firstname = d.firstname, lastname = d.lastname, image = d.image }
        end
        mergedMap[cid].totalprice = mergedMap[cid].totalprice + (tonumber(d.totalprice) or 0)
    end

    local merged = {}
    for _, v in pairs(mergedMap) do
        merged[#merged + 1] = v
    end
    return merged
end
