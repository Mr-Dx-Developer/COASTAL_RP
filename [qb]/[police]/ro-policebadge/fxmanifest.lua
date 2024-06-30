shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'adamant'
author 'Roski'
description 'Police Badge Made By Roski'
game 'gta5'
client_scripts {
    'cl_badge.lua'
}
server_scripts {
    'sv_badge.lua'
}
ui_page 'html/index.html'
files {
	'html/index.html',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/fonts/roboto/*.woff',
	'html/assets/fonts/roboto/*.woff2',
	'html/assets/fonts/justsignature/JustSignature.woff',
	'html/assets/images/*.png'
}
