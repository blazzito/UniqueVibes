fx_version 'cerulean'
game 'gta5'

description 'Unique Vibes Custom Escape Menu'
author 'Blazzito'

shared_scripts {
    '@es_extended/imports.lua'
}

server_scripts {
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/css/*.css',
    'web/js/*.js',
    'web/img/*.png',
    'web/img/*.jpg',
    'web/img/*.jpeg'
}
