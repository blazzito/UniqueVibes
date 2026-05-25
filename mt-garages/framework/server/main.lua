Framework = nil
Fr = {}

Citizen.CreateThread(function()
    ESX = GetResourceState('es_extended') == 'started' and true or false
    QBCore = GetResourceState('qb-core') == 'started' and true or false
    QBox = GetResourceState('qbx_core') == 'started' and true or false
end)
