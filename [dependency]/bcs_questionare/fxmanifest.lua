shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
author 'baguscodestudio'
description 'Questionare NUI with callbacks'
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/images/*.png',
    'html/assets/*.js',
    'html/assets/*.css'
}
client_script "client.lua"