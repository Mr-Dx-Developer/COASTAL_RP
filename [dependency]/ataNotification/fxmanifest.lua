shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
fx_version 'adamant'
game 'gta5'
author 'atarevals' -- Discord: !! AtaRevals#1538
description 'ataNotification'
version '1.0'
ui_page 'html/index.html'
client_scripts {
	'client.lua',
}
files {
	'html/*.*',
	'html/sound/*.*'
}
exports {
    'notification',
    'Show'
}

