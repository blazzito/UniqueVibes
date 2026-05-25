-- Admin Panel Client for Hub Integration
_G.DealershipHubIntegration = {
    openedFromHub = false
}

-- Hub Integration Exports
exports('IsOpenedFromHub', function() 
    return _G.DealershipHubIntegration.openedFromHub
end)

exports('ResetHubFlag', function() 
    _G.DealershipHubIntegration.openedFromHub = false
end)

exports('openManagement', function()
    print("^3[Dealership]^7 openManagement llamado desde hub")
    _G.DealershipHubIntegration.openedFromHub = true
    
    -- Ejecutar el comando dealer que ya existe
    ExecuteCommand('dealer')
    
    print("^3[Dealership]^7 ✅ Comando dealer ejecutado")
end)
