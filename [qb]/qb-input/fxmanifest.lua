shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Menu that allows players to input information for various things'
version '1.2.0'

client_scripts {
    'client/*.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles/*.css',
    'html/script.js'
}
