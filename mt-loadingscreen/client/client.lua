local ClientLoadESX = false


Citizen.CreateThread(function()
    while not ClientLoadESX do
        SetNuiFocus(true, true)
        Wait(500)
    end
end)

RegisterNUICallback('transitionCovered', function(data, cb)
    ClientLoadESX = true
    SetNuiFocus(false, false)
    ShutdownLoadingScreenNui()
    cb('ok')
end)

AddEventHandler("playerSpawned", function()
    Wait(1000)
    if not ClientLoadESX then
        ClientLoadESX = true
        SetNuiFocus(false, false)
        ShutdownLoadingScreenNui()
    end
end)
