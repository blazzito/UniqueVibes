fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name "mt-fuel"
description "Recurso de combustible"
author "ElMataDev"
version "1.0.0"

shared_scripts {
	'@ox_lib/init.lua',
    -- '@qbx_core/modules/lib.lua', -- We have our own framework bridge
	'config/*.lua',
	'shared/*.lua'
}

dependencies {
    'ox_lib',
    'oxmysql'
}

client_scripts {
	'client/polyzone.lua',
	'client/admin.lua',
	'client/refuel.lua',
	'client/consumption.lua',
	'client/interaction.lua',
    'client/nozzle.lua',
    'client/blips.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js',
}
