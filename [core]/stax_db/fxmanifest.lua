fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'alcoholiclobster'
description 'MongoDB wrapper for FiveM'
version '1.0.0'

server_only 'yes'

server_scripts {
    "@stax_core/libs/stax.lua",
    "components/**.lua",
    "index.js"
}

--[[ STAX METADATA ]]--
stax_plugin "stax-db" {
    name = "Stax Database",
    description = "Stax Framework Database",
    version = 0.1
  }