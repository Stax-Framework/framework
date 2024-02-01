--[[ Created By Xander1998 ]]--

fx_version 'cerulean'

game 'gta5'

description 'STAX FirstResponse Core'

version '1.0.0'

author 'Xander1998'

lua54 'yes'

shared_scripts {
  --- [ LIBS ] ---
  "@stax_core/libs/stax.lua",

  ---[ COMPONENTS ]
  "components/shared/**.lua",

  --- [ SOURCE ] ---
  -- "src/shared/**/*.lua",
}

client_scripts {
  ---[ COMPONENTS ]
  "components/client/**.lua",

  --- [ SOURCE ] ---
  -- "src/client/**/*.lua",
}

server_scripts {
  ---[ COMPONENTS ]
  "components/server/**.lua",

  --- [ SOURCE ] ---
  -- "src/server/**/*.lua",
}

--[[ STAX METADATA ]]--
stax_plugin "fr-core" {
  name = "FirstResponse Core",
  description = "Stax FirstResponse Core",
  version = 0.1
}