fx_version 'cerulean'
game 'gta5'

name 'mt-dealerships'
author 'ElMata'
description 'Dealership system for FiveM'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'init.lua',
    'config/*.lua',
}

client_scripts {
    'custom/client/**/*.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/classes/*.lua',
    'custom/server/*.lua',
    'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/**/*.*',
    'locales/*.json'
}

-- Escrow
escrow_ignore {
    'config/*.lua',
    'locales/*.json',
    'custom/**/*.lua',
}