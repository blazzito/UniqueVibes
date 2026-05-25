

fx_version 'cerulean'
game 'gta5'
author 'Mata'
description 'cmd chat by mata'
version '1.0'
ui_page 'html/index.html'
shared_scripts {
	'config.lua',
}
client_scripts {
	'client/*.lua',
}
server_scripts {
	'server/*.lua',
}
dependencies {
	'es_extended'
}
files {
    'html/index.html',
    'html/index.css',
    'html/config.default.js',
    'html/App.js',
    'html/Message.js',
    'html/Suggestions.js',
    'html/vendor/vue.2.3.3.min.js',
    'html/vendor/flexboxgrid.6.3.1.min.css',
    'html/vendor/animate.3.5.2.min.css',
    'html/vendor/latofonts.css',
    'html/franklin.ttf',
    'html/BoxedRound.ttf',
}
