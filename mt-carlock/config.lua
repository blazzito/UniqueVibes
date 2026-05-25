Config = {}

Config.ToggleKey = 'L' --All players can configure in-game via settings as well
Config.GiveCommand = 'darllaves' -- Command for giving key to another player
Config.MythicProgbar = false -- Recommended so players know their progress when searching vehicle/robbing peds

Config.CustomSounds = true -- Refer to README.md for more information

Config.MaxHotwireAttempts = 2 -- How many chances they get to fail hotwire.
Config.LockPickLost = 20 --Chance of losing picklock when lockpicking vehicles
Config.HotwireItemLost = 50 --Chance of loosing hotwiring item when hotwiring vehicles

Config.searchRewards = { --Random rewards upon successful vehicle search(Chance is in percent)
    [1] = {chance = 50, type = 'money', name = 'money', quantity = math.random(1, 2)},
    [2] = {chance = 1, type = 'key', name = 'keys'},
    [3] = {chance = 50, type = 'item', name = 'water', quantity = 1},
}

Config.noKeysNeeded = { --For vehicles that do not require keys(i.e. bmx bike)
    ['BMX'] = true,
    ['BMXST'] = true,
    ['CRUISER'] = true,
    ['FIXTER'] = true,
    ['SCORCHER'] = true,
    ['TRIBIKE'] = true,
    ['TRIBIKE2'] = true,
    ['TRIBIKE3'] = true
}

Language = {
    ['already_searched'] = 'Ya has registrado este vehículo.',
    ['found_cash'] = 'Has encontrado $',
    ['found_keys'] = '¡Has encontrado llaves en el vehículo!',
    ['found_item'] = 'Has encontrado',
    ['no_inv_space'] = '¡No tienes espacio en tu inventario!',
    ['handed_keys'] = 'Te han entregado las llaves.',
    ['action_cancelled'] = '¡La acción fue cancelada!',
    ['three_d_txt'] = '[H] Registrar',
    ['three_d_txt_2'] = '[H] Registrar',
    ['three_d_txt_3'] = '[H] Registrar',
    ['three_d_txt_4'] = '¡Este vehículo ya está dañado!',
    ['hotwire_success'] = '',
    ['hotwire_failed'] = '',
    ['bad_wires'] = '',
    ['already_hotwired'] = '',
    ['vehicle_locked'] = 'Has bloqueado tu vehículo.',
    ['vehicle_unlocked'] = 'Has desbloqueado tu vehículo.',
    ['no_vehiclefound'] = 'No se encontró ningún vehículo.',
    ['no_keys'] = '¡No tienes llaves para este vehículo!',
    ['too_far'] = '¡Estás demasiado lejos del vehículo!',
    ['keys_given'] = 'Has entregado tus llaves a',
    ['keys_received'] = 'Has recibido llaves de',
    ['no_player_nearby'] = '¡No hay jugadores cerca!',
    ['lockpick_success'] = 'Has forzado el vehículo con éxito.',
    ['lockpick_unsuccessful'] = 'No has logrado forzar el vehículo.',
    ['lockpick_broke'] = '¡Tu ganzúa se dobló y se rompió!',
    
}

RegisterNetEvent('mt-carlock:notify')
AddEventHandler('mt-carlock:notify', function(message)	
	
-- Place notification system info here, ex: exports['mythic_notify']:SendAlert('error', message)
    ESX.ShowNotification(message)


end)