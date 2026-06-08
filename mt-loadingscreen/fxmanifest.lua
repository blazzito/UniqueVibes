game 'common'

fx_version 'cerulean'
author 'ElMataDev'
description 'Pantalla de carga'
version '1.0.0'
lua54 'yes'

loadscreen 'web/index.html'


loadscreen_manual_shutdown "yes"
loadscreen_cursor "yes"

client_script 'client/client.lua'

files {
    'web/index.html',
    'web/js/config.js',
    'web/js/index.js',
    'web/css/index.css'
}
