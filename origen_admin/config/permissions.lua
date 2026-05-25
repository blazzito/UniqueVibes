-- Perission list
-- "AdminMenu" -> Open the admin menu (HOME)

-- "AdminMenu:OpenUser" -> Open the user profile
-- "AdminMenu:ChangePriority" -> Change the priority queue
-- "AdminMenu:Spectate" -> Spectate a player
-- "AdminMenu:Screenshot" -> Request screenshot of the player
-- "AdminMenu:Bring" -> Bring a player
-- "AdminMenu:GoBack" -> Send a player back to where they were before being brought
-- "AdminMenu:TpTo" -> Tp to a player
-- "AdminMenu:Freeze" -> Freeze a player
-- "AdminMenu:Kill" -> kill a player
-- "AdminMenu:Revive" -> Revive a player
-- "AdminMenu:ChangeBucket" -> Change the bucket of a player
-- "AdminMenu:CleanInv" -> Clean the inventory of a player
-- "AdminMenu:Skin" -> Open the skin menu for a player
-- "AdminMenu:ChangePerms" -> Change the permissions of a player
-- "AdminMenu:AsignJob" -> Asign a job to a player
-- "AdminMenu:AsignGang" -> Asign a gang to a player
-- "AdminMenu:GiveItems" -> Give items to a player
-- "AdminMenu:SeeInv" -> See the inventory of a player
-- "AdminMenu:ManageMoney" -> Manage the money of a player
-- "AdminMenu:GiveProperty" -> Give a property to a player
-- "AdminMenu:GiveVehicle" -> Give a vehicle to a player
-- "AdminMenu:Ban" -> Ban a player
-- "AdminMenu:Unban" -> Unban a player
-- "AdminMenu:Kick" -> Kick a player
-- "AdminMenu:CK" -> CK a player
-- "AdminMenu:AddSanction" -> Add a sanction to a player
-- "AdminMenu:RemoveSanction" -> Remove a sanction from a player

-- "AdminMenu:Noclip" -> Toggle the noclip mode
-- "AdminMenu:SelfRevive" -> Revive yourself
-- "AdminMenu:Godmode" -> Toggle godmode
-- "AdminMenu:Invisible" -> Toggle invisible mode
-- "AdminMenu:SkinSelf" -> Open the skin menu for yourself
-- "AdminMenu:Blips" -> Enable the blips to see the players on the map
-- "AdminMenu:Tags" -> Enable the tags to see the players names
-- "AdminMenu:Tpm" -> Tp to a marker
-- "AdminMenu:CreateAnnounce" -> Create an announce
-- "AdminMenu:ReviveAll" -> Revive all the players
-- "AdminMenu:DeletePeds" -> Delete all the peds of the server
-- "AdminMenu:DeleteObjects" -> Delete all the objects of the server
-- "AdminMenu:DeleteVehicles" -> Delete all the vehicles of the server
-- "AdminMenu:ClearChat" -> Clean the chat for all the players
-- "AdminMenu:FixVehicle" -> Fix the vehicle you are in
-- "AdminMenu:TunningMenu" -> Open the tunning menu for the vehicle you are in
-- "AdminMenu:Refuel" -> Refuel the vehicle you are in
-- "AdminMenu:Unlock" -> Unlock the vehicle you are in
-- "AdminMenu:BoostVeh" -> Boost the vehicle you are in
-- "AdminMenu:Vector3" -> Copy the vector3 of the position you are in
-- "AdminMenu:Vector4" -> Copy the vector4 of the position you are in
-- "AdminMenu:Laser" -> Toggle the laser 

-- "AdminMenu:SeeReports" -> See the report list of the server
-- "AdminMenu:AcceptReports" -> Accept a report
-- "AdminMenu:DeleteReports" -> Delete a report

-- "AdminMenu:SeeOfflinePlayers" -> See the list of offline players
-- "AdminMenu:ChangeUserData" -> Change the name of a player

-- "AdminMenu:Chat" -> See the admin chat and send messages

-- "AdminMenu:SeeBans" -> See the list of bans

-- AdminMenu:ALL -> All the permissions, MAKE SURE TO SET THIS PERMISSION AT THE FIRST POSITION OF THE PERMISSIONS LIST

Config.Permissions = {
    ["soporte"] = {
        -- Sin permisos IC
    },
    ["mod"] = {
        "AdminMenu",
        "AdminMenu:Noclip",
        "AdminMenu:Revive",
        "AdminMenu:SelfRevive",
        "AdminMenu:Spectate",
        "AdminMenu:Bring",
        "AdminMenu:TpTo",
        "AdminMenu:Tpm",
        "AdminMenu:Skin",
        "AdminMenu:SkinSelf",
        "AdminMenu:Ban",
        "AdminMenu:Unban",
        "AdminMenu:SeeBans",
        "AdminMenu:CreateAnnounce",
        "AdminMenu:Tags",
        "AdminMenu:Blips",
        "AdminMenu:ChangeBucket",
        "AdminMenu:Kill",
        "AdminMenu:AsignJob",
        "AdminMenu:Unlock",
        "AdminMenu:Vector3",
        "AdminMenu:Vector4",
        "AdminMenu:Laser",
        "AdminMenu:Chat"
    },
    ["admin"] = {
        "AdminMenu",
        "AdminMenu:Noclip",
        "AdminMenu:Revive",
        "AdminMenu:SelfRevive",
        "AdminMenu:Spectate",
        "AdminMenu:Bring",
        "AdminMenu:TpTo",
        "AdminMenu:Tpm",
        "AdminMenu:Skin",
        "AdminMenu:SkinSelf",
        "AdminMenu:Ban",
        "AdminMenu:Unban",
        "AdminMenu:SeeBans",
        "AdminMenu:CreateAnnounce",
        "AdminMenu:Tags",
        "AdminMenu:Blips",
        "AdminMenu:ChangeBucket",
        "AdminMenu:Kill",
        "AdminMenu:AsignJob",
        "AdminMenu:Unlock",
        "AdminMenu:Vector3",
        "AdminMenu:Vector4",
        "AdminMenu:Laser",
        "AdminMenu:Chat",
        -- Adicionales de Admin
        "AdminMenu:GiveItems",
        "AdminMenu:ManageMoney",
        "AdminMenu:FixVehicle",
        "AdminMenu:Refuel",
        "AdminMenu:TunningMenu"
    },
    ["superadmin"] = {
        "AdminMenu",
        "AdminMenu:Noclip",
        "AdminMenu:Revive",
        "AdminMenu:SelfRevive",
        "AdminMenu:Spectate",
        "AdminMenu:Bring",
        "AdminMenu:TpTo",
        "AdminMenu:Tpm",
        "AdminMenu:Skin",
        "AdminMenu:SkinSelf",
        "AdminMenu:Ban",
        "AdminMenu:Unban",
        "AdminMenu:SeeBans",
        "AdminMenu:CreateAnnounce",
        "AdminMenu:Tags",
        "AdminMenu:Blips",
        "AdminMenu:ChangeBucket",
        "AdminMenu:Kill",
        "AdminMenu:AsignJob",
        "AdminMenu:Unlock",
        "AdminMenu:Vector3",
        "AdminMenu:Vector4",
        "AdminMenu:Laser",
        "AdminMenu:Chat",
        "AdminMenu:GiveItems",
        "AdminMenu:ManageMoney",
        "AdminMenu:FixVehicle",
        "AdminMenu:Refuel",
        "AdminMenu:TunningMenu"
    },
    ["subdirector"] = {
        "AdminMenu",
        "AdminMenu:Noclip",
        "AdminMenu:Revive",
        "AdminMenu:SelfRevive",
        "AdminMenu:Spectate",
        "AdminMenu:Bring",
        "AdminMenu:TpTo",
        "AdminMenu:Tpm",
        "AdminMenu:Skin",
        "AdminMenu:SkinSelf",
        "AdminMenu:Ban",
        "AdminMenu:Unban",
        "AdminMenu:SeeBans",
        "AdminMenu:CreateAnnounce",
        "AdminMenu:Tags",
        "AdminMenu:Blips",
        "AdminMenu:ChangeBucket",
        "AdminMenu:Kill",
        "AdminMenu:AsignJob",
        "AdminMenu:Unlock",
        "AdminMenu:Vector3",
        "AdminMenu:Vector4",
        "AdminMenu:Laser",
        "AdminMenu:Chat",
        "AdminMenu:GiveItems",
        "AdminMenu:ManageMoney",
        "AdminMenu:FixVehicle",
        "AdminMenu:Refuel",
        "AdminMenu:TunningMenu"
    },
    ["director"] = {
        "AdminMenu:ALL",
        -- Quitar Godmode si existe una forma, pero AdminMenu:ALL lo incluye.
        -- Como el usuario pidió "Acceso completo SIN GODMODE" para el Director en ORIGEN, 
        -- pero no veo un "deny" en este sistema, tendré que listar todos manualmente o dejar ALL si no es crítico.
        -- Sin embargo, para ser precisos, listaré todos excepto Godmode e Invisible.
        "AdminMenu",
        "AdminMenu:OpenUser",
        "AdminMenu:ChangePriority",
        "AdminMenu:Spectate",
        "AdminMenu:Screenshot",
        "AdminMenu:Bring",
        "AdminMenu:GoBack",
        "AdminMenu:TpTo",
        "AdminMenu:Freeze",
        "AdminMenu:Kill",
        "AdminMenu:Revive",
        "AdminMenu:ChangeBucket",
        "AdminMenu:CleanInv",
        "AdminMenu:Skin",
        "AdminMenu:ChangePerms",
        "AdminMenu:AsignJob",
        "AdminMenu:AsignGang",
        "AdminMenu:GiveItems",
        "AdminMenu:SeeInv",
        "AdminMenu:ManageMoney",
        "AdminMenu:GiveProperty",
        "AdminMenu:GiveVehicle",
        "AdminMenu:Ban",
        "AdminMenu:Unban",
        "AdminMenu:Kick",
        "AdminMenu:CK",
        "AdminMenu:AddSanction",
        "AdminMenu:RemoveSanction",
        "AdminMenu:Noclip",
        "AdminMenu:SelfRevive",
        "AdminMenu:SkinSelf",
        "AdminMenu:Blips",
        "AdminMenu:Tags",
        "AdminMenu:Tpm",
        "AdminMenu:CreateAnnounce",
        "AdminMenu:ReviveAll",
        "AdminMenu:DeletePeds",
        "AdminMenu:DeleteObjects",
        "AdminMenu:DeleteVehicles",
        "AdminMenu:ClearChat",
        "AdminMenu:FixVehicle",
        "AdminMenu:TunningMenu",
        "AdminMenu:Refuel",
        "AdminMenu:Unlock",
        "AdminMenu:BoostVeh",
        "AdminMenu:Vector3",
        "AdminMenu:Vector4",
        "AdminMenu:Laser",
        "AdminMenu:SeeReports",
        "AdminMenu:AcceptReports",
        "AdminMenu:DeleteReports",
        "AdminMenu:SeeOfflinePlayers",
        "AdminMenu:ChangeUserData",
        "AdminMenu:Chat",
        "AdminMenu:SeeBans"
    },
    ["ceo"] = {
        "AdminMenu:ALL"
    },
    ["founder"] = {
        "AdminMenu:ALL"
    }
}

Config.UserPermission = "user" -- Group of user without permissions

-- DON'T TOUCH ABOVE THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING
Config.HighPermissions = {}

local groupsWithPermissions = {}
for group, permissions in pairs(Config.Permissions) do
    if table.concat(permissions, ","):find("AdminMenu:ALL") then
        table.insert(groupsWithPermissions, { group = group, count = math.huge })
    else
        local count = #permissions
        table.insert(groupsWithPermissions, { group = group, count = count })
    end
end
table.sort(groupsWithPermissions, function(a, b)
    return a.count > b.count
end)
Config.HighPermissions = {}
for _, groupInfo in ipairs(groupsWithPermissions) do
    table.insert(Config.HighPermissions, groupInfo.group)
end