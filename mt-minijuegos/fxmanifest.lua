fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Origen Network'
description 'Sistema de Minijuegos - Lockpicking, Hacking, etc'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

ui_page 'html/lockpick/index.html'

files {
    'html/lockpick/*.html',
    'html/lockpick/*.css',
    'html/lockpick/*.js',
    'html/lockpick/fonts/*.otf',
    'html/hacking/*.css',
    'html/hacking/*.js'
}

-- Exports para otros recursos
exports {
    'StartLockpick',
    'StartHacking',
    'StartCodeBreaker',
    'StartWirePuzzle',
    'StartMinesweeper',
    'StartTimingCircles',
    'StartVarHack',
    'StartPowerGrid'
}

