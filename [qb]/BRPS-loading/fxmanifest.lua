shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'

game 'gta5'

version '1.0.1'

loadscreen 'html/index.html'
loadscreen_manual_shutdown 'yes'

client_script 'client.lua'

files {
	"html/index.html",
	"html/style.css",
	"html/loading.css",
	"html/script.js",
	
	"html/assets/logo.png",
	"html/assets/music.mp3",
	
	"html/assets/background/*.png",
	"html/assets/background/*.jpg",
	"html/assets/foreground/*.png",
	"html/assets/foreground/*.jpg",
}



