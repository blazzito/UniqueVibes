RegisterServerEvent("origen_police:server:PayBill", function(args)
    local src = source
    local Player = FW_GetPlayer(src)
    if not Player then return end

    local ok = BillingAdapter.payBill(src, args)
    if not ok then return end

    CreateLog({
        type = 'Bills',
        embed = {
            title = Config.LogsTranslations.PayBill.title,
            description = Config.LogsTranslations.PayBill.message:format(args.price, args.id),
            color = 0x1B55BF,
        },
        source = src,
    })
end)