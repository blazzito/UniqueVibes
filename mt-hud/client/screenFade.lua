function DoScreenFadeOut(time)
    SendNUIMessage({
        action = 'DoScreenFadeOut',
        time = time or 1000,
    })
end

function DoScreenFadeIn(time)
    SendNUIMessage({
        action = 'DoScreenFadeIn',
        time = time or 1000,
    })
end

exports('DoScreenFadeOut', DoScreenFadeOut)
exports('DoScreenFadeIn', DoScreenFadeIn)

RegisterCommand('fadeout', function()
    DoScreenFadeOut(1000)
end)

RegisterCommand('fadein', function()
    DoScreenFadeIn(2000)
end)
