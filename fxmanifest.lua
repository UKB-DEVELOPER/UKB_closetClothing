fx_version 'adamant'

game 'gta5'
author 'UKB Developer'

client_scripts {
    'Config/Base.config.lua',
    'Config/Notify.config.lua',
    'Config/closet.config.lua',
    'Source/Client/client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'Config/queries.config.lua',
    'Config/Base.config.lua',
    'Config/Notify.config.lua',
    'Source/Server/server.lua',
}

ui_page 'interface/index.html'

files {
    'interface/index.html',
    'interface/javascript/app.js',
    'interface/css/style.css',
    'interface/images/*.png',
}   


