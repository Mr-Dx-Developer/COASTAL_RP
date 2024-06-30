shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

author 'Randolio'
description 'Reworked Pizza Job for ESX/QB.'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

server_scripts {
    'bridge/server/**.lua',
    'sv_config.lua',
    'sv_pizzajob.lua'
}

client_scripts {
    'bridge/client/**.lua',
    'cl_pizzajob.lua'
}

lua54 'yes'
