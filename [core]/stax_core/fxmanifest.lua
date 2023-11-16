--[[ Created By Xander1998 ]]--

fx_version 'cerulean'

game 'gta5'

description 'STAX Core'

version '1.0.0'

author 'Xander1998'

shared_scripts {
  --- IMPORTS
  "libs/shared/classes/stax.lua",
  "libs/shared/classes/singletons/string.lua",
  "libs/shared/classes/singletons/class.lua",
  "libs/shared/classes/singletons/events.lua",
  "libs/shared/classes/singletons/logger.lua",
  "libs/shared/classes/singletons/table.lua",
  "libs/shared/classes/singletons/managers/callbackmanager.lua",
  "libs/shared/classes/singletons/managers/mumblemanager.lua",
  "libs/shared/classes/config.lua",
  "libs/shared/classes/locale.lua",
  "libs/shared/enums/events.lua",

  --- SCRIPTS
  "shared/managers/callbackmanager.lua",
  "shared/managers/mumblemanager.lua",
  "shared/stax.lua"
}

client_scripts {
  "client/client.lua"
}

server_scripts {
  --- IMPORTS
  "@stax_database/libs/database.lua",
  "libs/server/classes/singletons/file.lua",
  "libs/server/classes/singletons/directory.lua",
  "libs/server/classes/singletons/http.lua",
  "libs/server/classes/singletons/managers/playermanager.lua",
  "libs/server/classes/singletons/managers/pluginmanager.lua",
  "libs/server/classes/singletons/managers/servermanager.lua",
  "libs/server/classes/singletons/managers/discordmanager.lua",
  "libs/shared/classes/datetime.lua",
  "libs/server/classes/plugin.lua",
  "libs/server/classes/user.lua",
  "libs/server/classes/player.lua",

  --- SCRIPTS
  "server/managers/playermanager.lua",
  "server/managers/pluginmanager.lua",
  "server/managers/queuemanager.lua",
  "server/managers/servermanager.lua",
  "server/managers/discordmanager.lua",
  "server/baseevents.lua",
  "server/server.lua"
}

lua54 'yes'

--[[ STAX METADATA ]]--
stax_plugin "stax-core" {
  name = "Stax Core",
  description = "Stax Framework Core",
  version = 0.1,
  github = {
    username = "Stax-Framework",
    repository = "stax_core"
  }
}