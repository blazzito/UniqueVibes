ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
if ESX == nil then ESX = exports["es_extended"]:getSharedObject() end

-- Callback para entregar datos al abrir el menú
ESX.RegisterServerCallback('blazz_pause:getData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label .. " - " .. xPlayer.job.grade_label,
            cash = xPlayer.getMoney(),
            bank = xPlayer.getAccount('bank').money,
            id = source
        }
        cb(data)
    else
        cb(nil)
    end
end)