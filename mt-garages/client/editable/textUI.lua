function showTextUI(text, coords, id, uiType, entity)
    if Config.TextUI == "mt-notify" then
        if uiType == "3d" then
            exports['mt-notify']:create3DTextUI(id or "mt-garages-3d", {
                type = '3dtext',
                coords = vec3(coords.x, coords.y, coords.z + 1.2),
                displayDist = 3.5,
                interactDist = 1.5,
                enableKeyClick = false,
                key = "E",
                text = text,
                job = "all"
            })
        else
            exports['mt-notify']:create3DTextUI(id or "mt-garages-ui", {
                type = 'textui',
                coords = coords,
                displayDist = 8.0,
                interactDist = 8.0,
                key = 'E',
                text = text,
                align = 'top-right'
            })
        end
    elseif Config.TextUI == "jg-textui" then
        exports['jg-textui']:DrawText("[E] " .. text)
    elseif Config.TextUI == "qs-textui" then
        exports['qs-textui']:create3DTextUI("garage_menu", {
            coords = coords,
            displayDist = 6.0,
            interactDist = 10.0,
            enableKeyClick = true,
            keyNum = 38,
            key = "E",
            text = text,
            triggerData = {
                triggerName = "",
                args = {}
            }
        })
    elseif Config.TextUI == "okokTextUI" then
        exports['okokTextUI']:Open(text, 'darkblue', 'right')
    elseif Config.TextUI == "brutal_textui" then
        exports['brutal_textui']:Open(text, "blue")
    elseif Config.TextUI == "ox_lib" then
        local options = {
            position = "right-center"
        }
        lib.showTextUI("[E] " .. text, options)
    elseif Config.TextUI == "0r-textui" then
        exports['0r-textui']:AddClassic(coords, '(E)', text, 2.5)
    end
end

function hideTextUI(id) 
    if Config.TextUI == "mt-notify" then
        exports['mt-notify']:DeleteDrawText3D(id or "mt-garages-3d")
        exports['mt-notify']:DeleteDrawText3D(id or "mt-garages-ui")
    elseif Config.TextUI == "jg-textui" then
        exports['jg-textui']:HideText()
    elseif Config.TextUI == "okokTextUI" then
        exports['okokTextUI']:Close()
    elseif Config.TextUI == "brutal_textui" then
        exports['brutal_textui']:Close()
    elseif Config.TextUI == "ox_lib" then
        lib.hideTextUI()
    end
end