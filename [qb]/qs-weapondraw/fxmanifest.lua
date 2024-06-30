shared_script '@BRPS-GUARD/ai_module_fg-obfuscated.lua'
shared_script '@BRPS-GUARD/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
shared_scripts {
    'config.lua'
}
client_script {
    'client.lua'
}
escrow_ignore {
    'config.lua'
}
dependencies {
    '/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
    'qs-inventory'  -- Required.
}
dependency '/assetpacks'