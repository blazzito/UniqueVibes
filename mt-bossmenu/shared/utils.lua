

Utils = {}

function Utils.TableContains(tbl, val)
    for _, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

function Utils.FormatCurrency(amount)
    return string.gsub(ESX.Math.GroupDigits(amount), ",", ".") .. (Config.Currency or "$")
end

function Utils.FormatDate(timestamp)
    local format = Config.Timestamp == 'us' and "%m/%d/%Y %H:%M:%S" or "%d/%m/%Y %H:%M:%S"
    return os.date(format, timestamp)
end

function Utils.DeepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[Utils.DeepCopy(orig_key)] = Utils.DeepCopy(orig_value)
        end
        setmetatable(copy, Utils.DeepCopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end
