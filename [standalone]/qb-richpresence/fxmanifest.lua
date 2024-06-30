shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'DC - Rich Presence'
shared_script 'config.lua'
server_script 'server/main.lua'
client_script 'client/main.lua'
dependencies {
    '/onesync',
    '/server:4664'
}
