shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

description 'QB-Scoreboard'
version '1.2.1'

ui_page 'html/ui.html'

shared_script 'config.lua'
client_script 'client.lua'
server_script 'server.lua'

files {
    'html/*'
}

lua54 'yes'
