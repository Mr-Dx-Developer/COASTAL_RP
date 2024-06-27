shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
author 'Envi-Scripts'
fx_version 'cerulean'

game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

version '2.2.5'
 
client_scripts {
    'client/*.lua',
}
shared_scripts {
    '@envi-bridge/bridge.lua',
    'shared/*.lua',
}

server_scripts {
    'server/*.lua',
}

escrow_ignore {
    'shared/*.lua',
    'install/*/*',
    'server/server_edit.lua',
    'ui/**',

}
 
files {
    'ui/**'
}

ui_page 'ui/index.html'

dependency '/assetpacks'

bridge 'envi-bridge'
dependency '/assetpacks'