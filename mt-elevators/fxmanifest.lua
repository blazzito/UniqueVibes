
fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'ElMataDev'
description 'Elevator'
version '1.0'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'client/client.lua',
}

ui_page 'html/index.html'

server_scripts {
    'server/server.lua',
}

files { 
    'config.lua',
    'data/elevators.json',
    
    'html/fonts/DS-Digital.TTF',
    'html/sounds/**.ogg',
    'html/images/**.jpg',
    'html/index.html', 
    'html/script.js',
    'html/styles.css',
}

