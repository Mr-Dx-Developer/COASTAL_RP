shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

this_is_a_map 'yes'

author 'KT_Braveheart#9005'
description 'Simple Flower job for your FiveM Server By Braveheart'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua'
}

server_script 'server/*.lua'
