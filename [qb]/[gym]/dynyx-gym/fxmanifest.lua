shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

name "dynyx-gym"
description "Gym Workout Script made for DynyxRP"
author "Green"
version "1.0."

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'client/*.lua',
    'config.lua',
}

server_scripts {
	'server/*.lua',
}

dependencies {
	'qb-target',
	'mz-skills'
}
