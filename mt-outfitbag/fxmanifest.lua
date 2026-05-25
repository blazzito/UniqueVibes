
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'mt-outfitbag'
author 'ElMataDev'
version '1.2.0'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/js/jquery.js',
  'html/js/jquery-ui.js',
  'html/img/*'
}

shared_scripts {
  'config.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua'
}

client_scripts {
  'client/cl-cam.lua',
  'client/main.lua',
}

