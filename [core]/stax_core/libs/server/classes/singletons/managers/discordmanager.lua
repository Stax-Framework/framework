---@class DiscordManagerSingleton
local DiscordManager = {}

--- Sends a message to the discord webhook channel
---@param channel string
---@param message string
function DiscordManager.SendMessage(channel, message)
  exports.stax_core:DiscordManager_SendMessage(channel, message)
end

--- Sends a embedded message to the discord webhook channel
---@param channel string
---@param embed table<{ color: string, title: string, description: string, footer: table<{ text: string }> }>
function DiscordManager.SendEmbed(channel, embed)
  exports.stax_core:DiscordManager_SendEmbed(channel, embed)
end

--- Gets the users roles from the discord guild
---@param discordId string discord:1231412431234
function DiscordManager.GetRoles(discordId)
  return exports.stax_core:DiscordManager_GetRoles(discordId)
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.DiscordManager()
    return DiscordManager
  end
end)