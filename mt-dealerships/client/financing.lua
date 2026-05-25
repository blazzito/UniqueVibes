RegisterNUICallback('financing:financeVehicle', function(data, cb)
    local retval = lib.callback.await('mt-dealerships:financing:financeVehicle', false, data)
    cb(retval)
end)

RegisterNetEvent('mt-dealerships:financing:finishingPayment', function(data)
    local dealershipId = data.dealershipId
    local dealership = dealershipsData[dealershipId]
    
    if not dealership then
        return
    end

    local purchaseCoords = dealership.markers.car_delivery[1]

    DoScreenFadeOut(500)
    Wait(500)
    Custom.Notify(locale('notifications.vehicle_financed'), 'success')
    local hash = GetHashKey(data.model)
    RequestModel(hash)
    local timeout = 0
    while not HasModelLoaded(hash) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end
    if not HasModelLoaded(hash) then
        Custom.Notify(locale('notifications.error_loading_vehicle'), 'error')
        return
    end

    local purchasedVehicle = nil
    if Config.VehiclePurchase.spawnVehicle then
        -- Verificar si el punto de entrega está libre
        local vehicleInArea = GetClosestVehicle(purchaseCoords.x, purchaseCoords.y, purchaseCoords.z, 3.0, 0, 71)
        if vehicleInArea ~= 0 and DoesEntityExist(vehicleInArea) then
            Custom.Notify('Hay un vehículo en el punto de entrega. Espera a que se libere.', 'error')
            DoScreenFadeIn(2000)
            cleanupPreviewCamera()
            lib.callback.await('mt-dealerships:routingBucketHandler', false)
            return
        end
        purchasedVehicle = CreateVehicle(hash, purchaseCoords.x, purchaseCoords.y, purchaseCoords.z, purchaseCoords.heading, true, false)
        if not DoesEntityExist(purchasedVehicle) then
            Custom.Notify(locale('notifications.error_creating_vehicle'), 'error')
            return
        end

        SetModelAsNoLongerNeeded(hash)
        SetVehicleOnGroundProperly(purchasedVehicle)
        SetVehicleNumberPlateText(purchasedVehicle, data.plate)
        SetVehicleCustomPrimaryColour(purchasedVehicle, vehicleColors.primary.r, vehicleColors.primary.g, vehicleColors.primary.b)
        SetVehicleCustomSecondaryColour(purchasedVehicle, vehicleColors.secondary.r, vehicleColors.secondary.g, vehicleColors.secondary.b)
        SetEntityAsMissionEntity(purchasedVehicle, true, true)
        TaskWarpPedIntoVehicle(cache.ped, purchasedVehicle, -1)
        SetVehicleEngineOn(purchasedVehicle, true, true, false)
        SetVehicleUndriveable(purchasedVehicle, false)
        SetVehicleDirtLevel(purchasedVehicle, 0.0)
        
        Wait(200)

        TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(purchasedVehicle))
        
        local props = Custom.GetVehicleProps(purchasedVehicle)
        
        local dbResult = lib.callback.await('mt-dealerships:sv:addVehicleToDatabase', false, {
            vehicleModel = data.model,
            plate = data.plate,
            props = props
        })
        
        if Config.Debug then
            print('^2[MT DEALERSHIPS] ^7Resultado DB financiamiento:', json.encode(dbResult))
        end
        
        if Config.VehiclePurchase.giveKeysOnPurchase then
            Custom.GiveKeys(purchasedVehicle, data.plate)
        end
    else
        SetModelAsNoLongerNeeded(hash)
        
        local props = {
            model = GetHashKey(data.model),
            plate = data.plate,
            bodyHealth = 1000.0,
            engineHealth = 1000.0,
            fuelLevel = 100.0,
            dirtLevel = 0.0,
            color1 = data.firstColor,
            color2 = data.secondaryColor
        }
        
        local dbResult = lib.callback.await('mt-dealerships:sv:addVehicleToDatabase', false, {
            vehicleModel = data.model,
            plate = data.plate,
            props = props
        })
        
        if Config.Debug then
            print('^2[MT DEALERSHIPS] ^7Resultado DB financiamiento:', json.encode(dbResult))
        end
    end
    
    DoScreenFadeIn(2000)
    
    -- Cerrar NUI completamente y limpiar cámara después de completar la compra financiada
    SetNuiFocus(false, false)
    cleanupPreviewCamera()
    
    -- Restaurar routing bucket del jugador
    lib.callback.await('mt-dealerships:routingBucketHandler', false)
end)