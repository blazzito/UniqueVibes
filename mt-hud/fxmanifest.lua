fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'ElMataDev'
description 'MT HUD - Premium HUD'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua'
}

client_scripts {
    'client/main.lua',
    'client/player.lua',
    'client/vehicle.lua',
    'client/minimap.lua',
    'client/screenFade.lua'
}

files {
    'ui/dist/index.html',
    'ui/dist/assets/*',
    'ui/dist/style.css',
    'ui/dist/script.js',
    'ui/dist/sounds/*',
}

ui_page 'ui/dist/index.html'
