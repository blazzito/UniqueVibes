fx_version 'cerulean'
game 'gta5'

description 'MT Notify'
version '1.0.0'
lua54 'yes'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/main.lua',
    'client/textui.lua',
}

server_scripts {
    'server/*.lua',
}

files {
    'ui/index.html',
    'ui/override.css',
    'ui/textui/style.css',
    'ui/textui/script.js',
    'ui/assets/*.*',
}

ui_page {
    'ui/index.html'
    -- 'http://localhost:5173/'
}