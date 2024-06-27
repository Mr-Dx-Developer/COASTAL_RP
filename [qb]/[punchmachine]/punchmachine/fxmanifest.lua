shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
fx_version 'adamant'
game 'gta5'
ui_page 'nui/index.html'

shared_script 'config.lua'

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/client.lua'
}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua'
}

files {'nui/*'}


lua54 'yes'

