shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

description 'https://github.com/Project-Sloth/ps-ui'

credits 'https://github.com/sharkiller/nopixel_minigame'


client_scripts {
  'client/*.lua',
}

ui_page {
  'html/index.html'
}

files {
    'html/js/*.js',
    'html/index.html',
    'html/style.css',
}