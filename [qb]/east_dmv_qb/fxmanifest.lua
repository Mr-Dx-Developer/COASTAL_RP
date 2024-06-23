fx_version 'cerulean'
game 'gta5'
description 'east_dmv'

shared_script 'config.lua'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

escrow_ignore {
    'client/*.lua',
    'server/*.lua',
    'config.lua'
}

lua54 'yes'
dependency '/assetpacks'