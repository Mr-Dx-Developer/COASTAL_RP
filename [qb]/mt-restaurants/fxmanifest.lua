fx_version('cerulean')
author 'Marttins#8421'
description 'Simple full configurable restaurant script for QBCore by Marttins#8421'
game 'gta5'

shared_scripts {
    '@ox_lib/init.lua',
    "shared/*.lua",
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server/*.lua",
}

client_scripts {
    "client/*.lua",
}

escrow_ignore {
    "shared/*.lua",
    "client/*.lua",
    "server/*.lua",
}

lua54 "yes"
dependency '/assetpacks'