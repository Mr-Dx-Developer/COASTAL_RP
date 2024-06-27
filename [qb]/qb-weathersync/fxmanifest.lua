shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_fxv2_oal 'yes'

name 'Renewed Weather Sync'
author 'FjamZoo - Renewed Scripts'
version '1.1.3'

shared_scripts{
    '@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua',
    'compatability/**/client.lua',
}

server_scripts {
    'server/time.lua',
    'server/weather.lua',
    'compatability/**/server.lua',
}

provide 'qb-weathersync'
provide 'cd_easytime'