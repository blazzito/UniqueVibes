fx_version 'cerulean'
game 'gta5'

author 'Blazz & Gemini'
description 'Midnight NYC Pause Menu'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/img/*.png' -- Por si quieres poner imagenes luego
}

client_script 'client.lua'
server_script 'server.lua'

dependencies {
    'es_extended'
}