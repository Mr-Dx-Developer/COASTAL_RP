shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'qb-gps'
version '1.0.2'
ui_page 'html/index.html'
client_script 'client/client.lua'
shared_script 'config.lua'
server_script 'server/server.lua'
files {
    'html/*.html',
    'html/js/*.js',
    'html/image/*.png',
    'html/css/*.css',
}
lua54 'yes'
escrow_ignore {
    'client/client.lua',
    'config.lua',
    'README.md',
    'LICENSE',
}
dependency '/assetpacks'
