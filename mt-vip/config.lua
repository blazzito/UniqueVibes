Config = {}

-- Groups allowed to access the admin panel
Config.AdminGroups = {
    ['founder'] = true,
    ['ceo'] = true,
    ['director'] = true
}

-- Specific licenses allowed (optional)
Config.AdminLicenses = {
    -- "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
}

-- Command to open the panel
Config.PanelCommand = 'vipadmin'

-- Command to redeem codes
Config.RedeemCommand = 'canje'

-- Notifications settings
Config.Notify = {
    position = 'top-right',
    duration = 5000
}

-- Locale / Translations
Config.Locales = {
    ['no_permission'] = 'No tienes permisos para usar este panel.',
    ['received_paycheck'] = 'Has recibido tu pago VIP: $%s y %s coins.',
    ['invalid_code'] = 'El código ingresado es inválido o ya ha sido usado.',
    ['code_success'] = '¡Código canjeado con éxito! Recompensa recibida.',
    ['rank_assigned'] = 'Se te ha asignado el rango VIP: %s.',
    ['coins_received'] = 'Has recibido %s coins.',
    ['item_received'] = 'Has recibido %s x%s.',
    ['vehicle_received'] = 'Se ha entregado tu vehículo: %s.',
    ['already_redeemed'] = 'Ya has canjeado este código.',
    ['code_expired'] = 'Este código ha expirado.',
    ['max_uses_reached'] = 'Este código ha alcanzado el límite de usos.'
}
