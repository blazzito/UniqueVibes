
fx_version 'cerulean'
game 'gta5'

author 'ElMata'
version '1.1.0'
description 'Script de remolques'
lua54 'yes'

shared_scripts {
  'config.lua',
}

client_scripts {
  'client.lua',
}

server_scripts {
  'server.lua',
}

ui_page 'html/index.html'
files {
  'html/index.html',
  'html/style.css',
  'html/script.js',
  'data/**/*.meta'
}


data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'

data_file 'DLC_ITYP_XML' 'stream/flatbed/def_flatbed3_props.ytyp.xml'

