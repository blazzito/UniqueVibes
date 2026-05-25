Business = nil

FW_CreateCallback("origen_admin:server:GetBusiness", function(source, cb)
    if not Business then 
        Business = {}
        if GetResourceState("origen_masterjob") == "started" then
            for k, v in pairs(exports["origen_masterjob"]:GetBusinesses()) do 
                Business[k] = {name = k, label = k}
            end
        end
    end
    cb(Business)
end)