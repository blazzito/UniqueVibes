fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'New Jobs System'
version '1.0.0'

dependencies {
    'mt-minijuegos'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/Debug.lua',
    'shared/Job.lua',
    'shared/LevelSystem.lua',
    'modules/**/shared.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/core.lua',
    'modules/**/server.lua'
}

client_scripts {
    'client/core.lua',
    'client/debug.lua',
    'modules/**/client.lua'
}

-- UI Files (Garbage Job)
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/style.css',
    'html/css/taxi-dispatch.css',
    'html/js/script.js',
    'html/js/taxi.js',
    'html/assets/*.otf'
}
