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

---@return StaxPlayer
function Player.Create(name)
  local newPlayer = {
    Name = name
  }
  setmetatable(newPlayer, Player)

  newPlayer.Logger.Success("Player.Create", "Created Player: " .. name)

  return newPlayer
end

function Player.Save(self)
  Player.Database.SyncInsertOne("players", { name = self.Name }, nil, function(results)
    print("Saved player " .. self.Name .. " !!!! " .. json.encode(results))
  end)
end

Stax.Register(Player, function(components)
  Player.Database = components.Database
  Player.Logger = components.Logger
end)