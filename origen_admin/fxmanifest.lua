fx_version 'cerulean'
game 'gta5'
version '1.2.7'

shared_scripts {
    'config/*.lua',
    'utils/*.lua',
    'shared/*.lua'
}

client_scripts {
    'custom/framework/client/*.lua',
    'custom/client/*.lua',
    'hooks/client.lua',
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'hooks/server.lua',
    'custom/framework/server/*.lua',
    'custom/server/*.lua',
    'server/middlewares/*.lua',
    'server/*.lua',
    'utils/*.js',
}

files {
    'locales/*.json',
    'ui/dist/index.html',
    'ui/dist/assets/*.*'
}

ui_page 'ui/dist/index.html' -- RELEASE
-- ui_page 'http://localhost:5173' -- DEV

-- Escrow

dependencies {
    'screenshot-basic'
}

lua54 'yes'

escrow_ignore {
    "config/*.lua",
    "custom/client/*.lua",
    "custom/framework/**/*.lua",
    "custom/shared/*.lua",
    "custom/server/*.lua",
}

dependency '/assetpacks'
dependency '/assetpacks'