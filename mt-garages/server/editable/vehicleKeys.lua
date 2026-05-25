RegisterServerEvent('mt-garages:wxCarlock')
AddEventHandler('mt-garages:wxCarlock', function(vehicle, model, plate)
    exports["wx_carlock"]:shareKey(source, plate)
end)