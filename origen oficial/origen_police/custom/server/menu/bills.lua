function sendBill(source, data)
    local Player = FW_GetPlayer(source)
    local jobCategory = CanOpenTablet(Player.PlayerData.job.name)[2]
    local author = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. " (" .. (Player.PlayerData.metadata.police_badge or "0000") .. ")"
    local title = Config.Translations.PoliceBill
    if jobCategory ~= Config.PoliceJobCategory then
        title = "Bill from " .. jobCategory
    end

    -- Enriquecer data con campos que necesita el adapter
    data.job    = Player.PlayerData.job.name
    data.author = author
    data.title  = title

    -- Delegar al adapter (usa billing interno o externo según config)
    local result = BillingAdapter.sendBill(source, data)

    -- Log Discord independientemente del sistema usado
    CreateLog({
        type = 'Bills',
        embed = {
            title = Config.LogsTranslations.AddBill.title,
            description = Config.LogsTranslations.AddBill.message:format(author, data.price, data.months, json.encode(data.bills, {indent = true})),
            color = 0x1B55BF,
        },
    })

    return result
end

function DeleteBill(source, data)
    return BillingAdapter.deleteBill(source, data)
end

function GetDebors(jobCategory)
    -- Excepted table structure:
    -- [
    --      {
    --          citizenid = "123456789",
    --          price = 1000,
    --          charinfo = "[{firstname: 'John', lastname: 'Doe'}]"}]", -- ONLY FOR QB
    --          firstname = "John", -- ONLY FOR ESX
    --          lastname = "Doe", -- ONLY FOR ESX
    --          image = "profile.png",
    --          totalprice = 3000,
    --      }
    -- ]

    local result
    if Config.Framework == "qbcore" then
        result = MySQL.awaitQuery('SELECT opb.citizenid, SUM(opb.price) AS totalprice, p.charinfo, p.image FROM origen_police_bills opb INNER JOIN players p ON opb.citizenid = p.citizenid WHERE opb.payed = 0 AND opb.job = "'..jobCategory..'" GROUP BY opb.citizenid')
    else
        result = MySQL.awaitQuery('SELECT opb.citizenid, SUM(opb.price) AS totalprice, u.firstname, u.lastname, u.image FROM origen_police_bills opb INNER JOIN users u ON opb.citizenid = u.identifier WHERE opb.payed = 0 AND opb.job = "'..jobCategory..'" GROUP BY opb.citizenid')
    end
    return result
end

function GetBillsFromCitizenID(cid, jobCategory)
    return BillingAdapter.getBillsFromCitizenID(cid, jobCategory)
end

function GetUnpayedBills(cid)
    return MySQL.awaitQuery('SELECT * FROM origen_police_bills WHERE citizenid = ? AND payed = 0 ORDER BY id DESC', {cid})
end

function GetBillsFromReporter(reportid)
    return BillingAdapter.getBillsFromReporter(reportid)
end

function NewBillReport(index, data, author, jobCategory)
    return BillingAdapter.newBillReport(index, data, author, jobCategory)
end

function UpdateBillReport(index, data)
    return BillingAdapter.updateBillReport(index, data)
end

function PayBill(id)
    -- Solo para legacy: marcar como pagada en origen_police_bills
    MySQL.awaitQuery("UPDATE origen_police_bills SET payed = ? WHERE id = ?", {1, id})
end

exports("PayBill", PayBill)
exports("GetUnpayedBills", GetUnpayedBills)