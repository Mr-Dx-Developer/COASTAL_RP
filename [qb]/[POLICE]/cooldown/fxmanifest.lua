shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }
author 'Kael Scripts'
description 'A CoolDown System'
version '1.0.0'
client_scripts {
    'client/**.lua',
}
server_scripts {
    'server/**.lua',
}
shared_scripts {
    'config.lua',
}
files {
    'ui/index.html',
    'ui/app.js',
    'ui/css/style.css',
    'ui/images/**',
}
ui_page {'ui/index.html'}
escrow_ignore { 
    'config.lua',
    'server/**.lua',
    'client/**.lua',
}