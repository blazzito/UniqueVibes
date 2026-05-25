RegisterNetEventHookOrg("origen_admin:server:open_otherinv", function(target)
    local src = source
    if Config.Inventory == "qb-inventory" then 
       exports["qb-inventory"]:OpenInventoryById(src, target)
    else
        -- No implementation in client side and server side
        print("Inventory system not supported for this action")
    end
end, "AdminMenu:SeeInv")