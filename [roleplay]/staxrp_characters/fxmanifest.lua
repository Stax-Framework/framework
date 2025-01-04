---@diagnostic disable
---[[
--- SCRIPTED BY Xander1998
---]]

fx_version 'cerulean'

game 'gta5'

description "STAX Framework Core"

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
    "locale.lua",

    ---[[
    --- SOURCE FILES
    ---]]
    "source/shared/**/*.lua",

    ---[[
    --- COMPONENT FILES
    ---]]
    "components/shared/**/*.lua"
}

server_scripts {
    ---[[
    --- SOURCE FILES
    ---]]
    "source/server/**/*.lua",

    ---[[
    --- COMPONENT FILES
    ---]]
    "components/server/**/*.lua"
}

client_scripts {
        ---[[
    --- SOURCE FILES
    ---]]
    "source/client/**/*.lua",

    ---[[
    --- COMPONENT FILES
    ---]]
    "components/client/**/*.lua"
}