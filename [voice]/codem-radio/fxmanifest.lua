fx_version "cerulean"

description "CodeM - X Series Radio"
author "CodeM"
version "1.4.2"

lua54 "yes"

game "gta5"

ui_page "resources/build/index.html"

shared_script "Settings.lua"

client_script "client.lua"

server_script "server.lua"


files {
  "resources/build/index.html",
  "resources/build/**/*"
}

escrow_ignore { 
  "Settings.lua",
  "client.lua",
  "server.lua",
}
dependency '/assetpacks'