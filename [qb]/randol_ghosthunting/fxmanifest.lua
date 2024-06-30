shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

author 'Randolio'
description 'Ghost Hunting [QB/ESX]'
lua54 'yes'

shared_scripts {'@ox_lib/init.lua'}

client_scripts {'bridge/client/**.lua', 'cl_ghost.lua'}

server_scripts {'bridge/server/**.lua', 'sv_ghost.lua'}
