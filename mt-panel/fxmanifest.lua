fx_version 'cerulean'
game 'gta5'

description 'MT Panel - Sistema de gestión centralizada de scripts'
author 'ElMataDev'
version '1.0.1'

lua54 'yes'

shared_scripts {
    'config.lua',
    'locales/locales.lua',
    'locales/translations/*.lua'
}

client_script {
    'client/*.lua'
}

server_scripts {
    'config_sv.lua',
    'server/*.lua'
}

ui_page 'ui/index.html'

files {
    'ui/**/*',
    'ui/assets/**/*',
    'ui/icons/**/*'
}

escrow_ignore {
    'config.lua',
    'config_sv.lua',
    'locales/**/*.lua'
}


