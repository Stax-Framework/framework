local Http = Stax.Http()
local Logger = Stax.Logger()

local DiscordManager = {}

--- @class Embed
---@field public color number | nil
---@field public title string | nil
---@field public description string | nil
---@field public footer { text: string } | nil
local EmbedType = {
  color = nil,
  title = nil,
  description = nil,
  footer = nil
}

--- Sends a message to the discord webhook channel
---@param channel string key used in discord config to define channel id
---@param message string message to send to the discord channel
function DiscordManager.SendMessage(channel, message)
  local configChannel = Stax.Config:Get("discord.webhooks." .. channel)

  if not configChannel then
    Logger.Error("DiscordManager", "Couldn't find channel (" .. configChannel .. ") in discord config to send the webhook to!")
    return
  end

  Http.Post(configChannel, {
    data = {
      username = "Stax Framework",
      content = message
    },
    headers = {
      ["Content-Type"] = "application/json"
    }
  }, function (status, text, headers) end)
end

--- Sends a embedded message to the discord webhook channel
---@param channel string key used in discord config to define channel id
---@param embed Embed[] embedded data to send to the discord channel
function DiscordManager.SendEmbed(channel, embed)
  local configChannel = Stax.Config:Get("discord.webhooks." .. channel)

  if not configChannel then
    Logger.Success("DiscordManager", "Couldn't find channel (" .. configChannel .. ") in discord config to send the webhook to!")
    return
  end
  
  Http.Post(configChannel, {
    data = {
      username = "Stax Framework",
      embeds = embed
    },
    headers = {
      ["Content-Type"] = "application/json"
    }
  }, function (status, text, headers) end)
end

--- Gets the users roles from the discord guild
---@param discordId string discord:1231412431234
function DiscordManager.GetRoles(discordId)
  local p = promise.new()
  local bot = Stax.Config:Get("discord.bot")
  local id = string.gsub(discordId, "discord:", "")

  if bot.token == nil or bot.guild == nil then
    return
  end

  Http.Get("https://discordapp.com/api/guilds/" .. bot.guild .. "/members/" .. id, {
    headers = {
      ["Content-Type"] = "application/json",
      ["Authorization"] = "Bot " .. bot.token
    }
  }, function (status, text, headers)
    if status ~= 200 then
      p:reject()
      return
    end

    local data = json.decode(text)

    p:resolve(data.roles)
  end)

  return Citizen.Await(p)
end

exports("DiscordManager_SendMessage", DiscordManager.SendMessage)
exports("DiscordManager_SendEmbed", DiscordManager.SendEmbed)
exports("DiscordManager_GetRoles", DiscordManager.GetRoles)