shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

author 'KT_BRAVEHEART#9005'
description 'Simple lumberjack job for your FiveM Server By Braveheart'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
	'client/main.lua',
}

server_script 'server/*.lua'
