fx_version 'cerulean'
game "gta5"

name "ton_surf"
description "Permet de gérer facilement des distributeur."
author "tontonCasi@twitch"
version "1.0.0"

lua54 "yes"

shared_scripts {
	"@es_extended/imports.lua",
    "config.lua",
}

client_scripts {
    "client/cl_main.lua"
}

server_scripts {
    "@ox_lib/init.lua",
    "serveur/sv_main.lua",
}