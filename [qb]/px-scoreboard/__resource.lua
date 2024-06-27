shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
description 'A Simple Scoreboard By PX Scripts'
author 'PX TEAM'
discord 'https://discord.gg/hGx4T7QQEJ'
client_scripts {
    'cl_scoreboard.lua',
    'warmenu.lua',
}


server_script {
    'sv_scoreboard.lua',
    '@oxmysql/lib/MySQL.lua'
   }

lua54 'yes'
escrow_ignore {
   'html/*',
   'config.lua'	 
}