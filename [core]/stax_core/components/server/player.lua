---@class StaxPlayer
---@field COMPONENT StaxComponent
---@field Name string
---@field Database StaxDatabase?
---@field Logger StaxLogger?
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
    identifiers = GetPlayerIdentifier(source, "license")
  }
  setmetatable(newPlayer, Player)

  newPlayer.Logger.Success("Player.Create", "Created Player: " .. newPlayer.name)

  return newPlayer
end

function Player.Save(self)
  -- Player.Database.Insert({ collection = "players", documents = {} }, function()

  -- end)
end

Stax.Register(Player, function(components)
  Player.Database = components.Database
  Player.Logger = components.Logger
end)