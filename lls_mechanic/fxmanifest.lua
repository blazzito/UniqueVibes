fx_version 'cerulean'
games { 'gta5' }

author 'DiVouz'
version '1.1.0'

lua54 'on'
is_cfxv2 'yes'
use_fxv2_oal 'true'

ui_page 'client/ui/index.html'
files {
	'client/ui/index.html',
	'client/ui/js/**/*.js',
	'client/ui/css/**/*.css',
	'client/ui/img/**/*.png',
	'client/ui/img/**/*.svg',
	'client/ui/sounds/**/*.ogg'
}

client_scripts {
	'config/core.lua',
	'config/prices.lua',
	'config/client_functions.lua',
	'client/colors_data.lua',
	'client/menus.lua',
	'client/labels.lua',
	'client/helper.lua',
	'client/job.lua',
	'client/api.lua',
	'es_extended_vehicle_properties_fix.lua',
	'client/core.lua'
}

server_scripts {
	'config/core.lua',
	'config/server_functions.lua',
	'server/core.lua'
}

server_exports {
	'openMenuByAdmin',
}

shared_script '@es_extended/imports.lua'
