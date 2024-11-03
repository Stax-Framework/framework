---@class StaxPlayer
---@field COMPONENT StaxComponent
---@field Name string
---@field Database StaxDatabase?
---@field Logger StaxLogger?
---@field source number
---@field name string
---@field identifiers table<string, string>
---@field data table
local Player = {
  COMPONENT = Stax.Component.Init("Player", {
    "Logger",
    "Database"
  }),
  Database = nil,
  Logger = nil
}
Player.__index = Player

---@param source number
---@return StaxPlayer
function Player.Create(source)
  local newPlayer = {
    source = source,
    name = GetPlayerName(source),
    identifiers = {},
    data = {
      uid = nil
    }
  }
  setmetatable(newPlayer, Player)

  newPlayer.identifiers = Player.GetIdentifiers(newPlayer, { "license" })
  newPlayer.data.identifier = newPlayer.identifiers["license"]

  newPlayer.Logger.Success("Player.Create", "Created Player: " .. newPlayer.name)

  Player.Load(newPlayer)

  return newPlayer
end

--- Fetches all of the identifiers with specified types
---@param self StaxPlayer
---@param types table<string, string>
function Player.GetIdentifiers(self, types)
  local identifiers = {}

  for _, t in pairs(types) do
    identifiers[t] = GetPlayerIdentifierByType(self.source, t)
  end

  return identifiers
end

--- Loads the players data
---@param self StaxPlayer
function Player.Load(self)
  Player.Database.FindOne({ collection = "players", query = { identifier = self.data.identifier }}, function(results)
    if results[1] == nil then
      Player.Save(self)
    else
      Player.Logger.Unpack("Player.Load", results[1], true)
    end
  end)
end

--- Saves the players data
---@param self StaxPlayer
function Player.Save(self)
  Player.Database.Insert({ collection = "players", documents = { self.data } }, function(insertCount, insertedIds)
    if insertCount > 0 then
      Player.Logger.Unpack("Player.Save", insertedIds, true)
    else
      Player.Logger.Error("Player.Save", "Failed to save player " .. self.name .. "!")
    end
  end)
end

--- Bans the player
---@param self StaxPlayer
function Player.Ban(self)

end

--- Kicks the player
---@param self StaxPlayer
function Player.Kick(self)

end

--- Warns the player
---@param self StaxPlayer
function Player.Warn(self)

end

Stax.Register(Player, function(components)
  Player.Database = components.Database
  Player.Logger = components.Logger
end)
