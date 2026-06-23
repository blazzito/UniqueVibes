-----------------------------------------------------
---- For more scripts and updates, visit ------------
--------- https://discord.gg/trase ------------------
-----------------------------------------------------

fx_version 'cerulean'
games { 'gta5' }
author 'UniqueVibes'
description 'Premium Garage Script'
lua54 'yes'

ui_page 'ui/index.html'

shared_script '@ox_lib/init.lua'
shared_script 'config.lua'
client_scripts {
    'client/client.lua',
    'client/admin.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'framework/**/server.lua',
    'server/*.lua'
}

files {
  'locales/*.json',
  'ui/index.html',
  'ui/style.css',
  'ui/app.js'
}

dependency 'ox_lib'
dependency 'mysql-async'