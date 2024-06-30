shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game  'gta5' 

shared_scripts{
    '@ox_lib/init.lua'
}
client_scripts {
	'config.lua',	
	'client/*'	
}

server_scripts {
	'config.lua',
	"server/*"
}

lua54 'yes'
