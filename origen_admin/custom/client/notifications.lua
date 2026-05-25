function ShowNotification(text)
    if Config.Framework == "qbcore" then 
        TriggerEvent("QBCore:Notify", text)
    elseif Config.Framework == "esx" then
        Framework.ShowNotification(text)
    end
end