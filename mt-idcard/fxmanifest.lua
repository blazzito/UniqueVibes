fx_version 'cerulean'

game "gta5"

author "Byte Labs"
version '1.5.0'
description 'Byte Labs ID Card'
repository 'https://github.com/Byte-Labs-Project/bl_idcard'

lua54 'yes'

ui_page 'web/index.html'
-- ui_page 'http://localhost:3000/' --for dev

shared_script '@ox_lib/init.lua'

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/init.lua'
}

client_script {
    'client/init.lua',
}

files {
    'web/index.html',
    'web/style.css',
    'web/script.js',
    'web/mugshots/*.png',
    'client/**',
    'shared/**',
}
