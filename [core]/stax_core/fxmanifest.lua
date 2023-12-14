--[[ Created By Xander1998 ]]--

fx_version 'cerulean'

game 'gta5'

description 'STAX Core'

version '1.0.0'

author 'Xander1998'

lua54 'yes'

shared_scripts {
  --- [ LIBS ] ---
  "libs/stax.lua",

  ---[ COMPONENTS ]
  "components/shared/**.lua",

  --- [ SOURCE ] ---
  "src/shared/**/*.lua",
}

client_scripts {
  ---[ COMPONENTS ]
  "components/client/**.lua",

  --- [ SOURCE ] ---
  "src/client/**/*.lua",
}

server_scripts {
  ---[ COMPONENTS ]
  "components/server/**.lua",

    --- [ SOURCE ] ---
    "src/server/**/*.lua",
}

--[[ STAX METADATA ]]--
stax_plugin "stax-core" {
  name = "Stax Core",
  description = "Stax Framework Core"
}