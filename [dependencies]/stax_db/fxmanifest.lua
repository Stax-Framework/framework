--[[ SCRIPTED BY Xander1998 ]]--

fx_version "adamant"

game { "gta5", "rdr3" }

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

dependency "yarn"

server_scripts {
  --- [ LIBS ] ---
  "@stax_core/libs/stax.lua",

  ---[ SCRIPTS ]---
  "index.js",
  "src/exports.lua",
  "components/database.lua"
}

--[[ STAX METADATA ]]--
stax_plugin "stax-db" {
  name = "Stax Database",
  description = "Stax Database",
  version = 0.1
}