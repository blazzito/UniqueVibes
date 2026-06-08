fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua'
}

client_scripts {
    'client/nui.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/css/**/*.css',
    'web/js/**/*.js',
    'web/metadata/*',
}

provide 'esx_multicharacter'