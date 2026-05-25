local ESX = exports['es_extended']:getSharedObject()
local RentedTrailers = {} -- [source] = { netId = netId, price = price, time = os.time() }

ESX.RegisterServerCallback('az_trailer:buy', function(source, cb, price, pay, trailerNetId)
  local xPlayer = ESX.GetPlayerFromId(source)
  if not xPlayer then cb(false, 'Jugador no válido'); return end
  
  local need = tonumber(price) or 0
  if need <= 0 then cb(false, 'Precio inválido'); return end
  
  local method = (tostring(pay or 'cash') == 'card') and 'bank' or 'money'
  local balance = xPlayer.getAccount(method).money
  
  if balance >= need then
    xPlayer.removeAccountMoney(method, need)
    
    -- Register ownership
    if trailerNetId then
        RentedTrailers[source] = { netId = trailerNetId, price = need, time = os.time() }
    end
    
    cb(true)
  else
    local msg = (method == 'money') and (Config.Txt.NotEnoughCash or 'Efectivo insuficiente') or (Config.Txt.NotEnoughBank or 'Saldo insuficiente')
    cb(false, msg)
  end
end)

RegisterNetEvent('az_trailer:return', function(trailerNetId)
  local src = source
  local xPlayer = ESX.GetPlayerFromId(src)
  if not xPlayer then return end
  
  -- 1. Anti-spam check
  local rental = RentedTrailers[src]
  if not rental then 
    Config.Notify(src, "No tienes ningún remolque alquilado activo.", 'error')
    return 
  end

  -- 2. Validate proximity to NPC
  local pCoords = GetEntityCoords(GetPlayerPed(src))
  local isNear = false
  for i=1, #Config.Shops do
    if #(pCoords - Config.Shops[i].coords.xyz) < 15.0 then
        isNear = true
        break
    end
  end

  if not isNear then
    Config.Notify(src, "Debes estar cerca de una base de remolques.", 'error')
    return
  end
  
  -- 3. Verify Entity Ownership & NetID
  if rental.netId ~= trailerNetId then
    Config.Notify(src, "Este remolque no te pertenece o no está registrado.", 'error')
    return
  end

  local entity = NetworkGetEntityFromNetworkId(trailerNetId)
  if not DoesEntityExist(entity) or #(pCoords - GetEntityCoords(entity)) > 15.0 then
    Config.Notify(src, "El remolque no está cerca de ti.", 'error')
    return
  end

  -- 4. Process Refund & Delete
  DeleteEntity(entity)
  RentedTrailers[src] = nil -- Clear record
  
  local amt = math.floor(rental.price * 0.8) -- 80% refund policy
  xPlayer.addAccountMoney('money', amt)
  Config.Notify(src, string.format("Has devuelto el remolque. Reembolso (80%%): $%d", amt), 'success')
end)

-- Cleanup on disconnect
AddEventHandler('playerDropped', function()
    local src = source
    RentedTrailers[src] = nil
end)
