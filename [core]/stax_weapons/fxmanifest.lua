---@diagnostic disable
---[[
--- SCRIPTED BY Xander1998
---]]

fx_version 'cerulean'

game 'gta5'

description "STAX Weapons"

version '0.1_Alpha'

author 'Xander1998'

lua54 'yes'

shared_scripts {
    ---[[
    --- STAX LIB
    ---]]
    "@stax/libs/stax.lua",

    ---[[
    --- SHARED CONFIG / LOCALE
    ---]]
    "config.lua",
}

server_scripts {}

client_scripts {
    ---[[
    --- SOURCE FILES
    ---]]
    "source/client/**/*.lua",
}