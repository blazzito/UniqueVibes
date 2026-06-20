fx_version 'cerulean'

game 'gta5'

author 'ElMataDev'
description 'Sistema de BANCO Modificado'
lua54 'yes'
version '1.0.1'
legacyversion '1.13.4'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/**',
}

dependency 'es_extended'
dependency 'mt-notify'
