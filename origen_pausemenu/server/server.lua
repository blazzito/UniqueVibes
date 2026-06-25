local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent("pausemenu:server")
AddEventHandler("pausemenu:server", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if not xPlayer then return end

    local jobLabel = xPlayer.job.label or xPlayer.job.name
    local jobGrade = xPlayer.job.grade_label or ""
    local jobDisplay = jobLabel .. " - " .. jobGrade

    local money = xPlayer.getMoney()
    local bank = xPlayer.getAccount('bank').money
    local name = xPlayer.getName()
    local players = #GetPlayers()
    local maxPlayers = GetConvarInt('sv_maxclients', 32)
    local police = Config.PoliceOnline
    local ems = Config.EMSOnline

    TriggerClientEvent("pausemenu:client", src, {name=name, job=jobDisplay, cash=money, bank=bank, players=players, max=maxPlayers, police=police, ems=ems})
end)

RegisterServerEvent('salir')
AddEventHandler('salir', function()
    DropPlayer(source, "¡Te fuiste del servidor!")
end) 