shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Mads'
description 'Sit Anywhere!'
version '1.1.6'
client_scripts {
	'config.lua',
	'list.lua',
	'client.lua'
}
escrow_ignore {
	'config.lua',
	'list.lua',
	'client.lua'
}
dependencies {
	'/server:5181'
}
dependency '/assetpacks'