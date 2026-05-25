

fx_version 'cerulean'
game 'gta5'

author 'Mata'
description 'MT Bossmenu'
lua_54 'yes'
version '1.5.0'

shared_scripts {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    '@ox_lib/init.lua',
    'config.lua',
    'shared/constants.lua',
    'shared/utils.lua',
}

client_scripts {
    'locales/*.lua',
    'client/nui/bonus.lua',
    'client/nui/notify.lua',
    'client/nui/nui.lua',
    'client/main.lua',
    'client/modules/billing.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'locales/*.lua',
    'webhooks.lua',
    'server/mysql.lua',
    'server/logger.lua',
    'server/security/validation.lua',
    'server/services/points.lua',
    'server/services/society.lua',
    'server/services/employees.lua',
    'server/services/finances.lua',
    'server/services/bonus.lua',
    'server/services/billing.lua',
    'server/callbacks/bonus.lua',
    'server/callbacks/callbacks.lua',
    'server/main.lua',
    'server/queue.lua',
}

ui_page 'html/dist/index.html'
-- ui_page 'http://localhost:5173/'

files {
    'html/dist/index.html',
    'html/dist/assets/*',
}

dependencies {
    'es_extended',
    'oxmysql',
    'ox_lib',
}
