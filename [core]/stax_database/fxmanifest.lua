--[[ SCRIPTED BY Xander1998 ]]--

fx_version "adamant"

game { "gta5", "rdr3" }

rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

server_scripts {
  --- [ LIBS ] ---
  "@stax_core/libs/stax.lua",

  ---[ COMPONENTS ]
  "src/components/database.lua",

  --- [ SOURCE ] ---
  "./config.js",
  "./main.js",
  "./server/connection.js",
  "./server/actions/*.js",
  "./server/exports.js",
}