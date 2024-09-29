---@type { identifiers: { primary: string, required: { [string]: string } }}
local Configs = Stax.Config:Fetch("framework.player")

---@class StaxPlayer
---@field COMPONENT StaxComponent
---@field Id number
---@field Name string
---@field PrimaryIdentifier string
---@field Identifiers { [string]: string }
---@field Source number
---@field Logger StaxLogger?
---@field Database StaxDatabase?
---@field Configs table?
local Player = {
  COMPONENT = Stax.Component.Init("Player", {
    "Logger",
    "Database"
  }),
  Database = nil,
  Logger = nil,
  Configs = nil
}
Player.__index = Player

--- Creates a new instance of the player class
---@return StaxPlayer | nil
function Player.Create(playerSource)
  local self = setmetatable({
    Id = 0,
    Name = GetPlayerName(playerSource),
    PrimaryIdentifier = Configs.identifiers.primary,
    Identifiers = {},
    Source = playerSource
  }, Player)

  local loaded = self:Load()

  if not loaded then
    return nil
  end

  self.Logger.Success("Player.Create", "Created Player: " .. name)

  return self
end

---@return boolean
function Player:Load()
  local loaded = self:LoadIdentifiers()

  if not loaded then
    self.Logger.Error("Player.Create", "Failed to create player " .. name .. " | Didn't have all the required identifiers")
    return false
  end

  local query = self.Database.Async({
    query = [[ SELECT `id` FROM `players` WHERE `identifier` = :identifier LIMIT 1]],
    data = {
      identifier = self.Identifiers[self.PrimaryIdentifier]
    }
  })

  if query.ok then
    local results = query.results

    if results[1] then
      self.Id = results[1].id
    end
  else
    if query.error then
      self.Logger.Error("Player:Load", "Failed to load " .. self.Name .. "'s data from the database!")
      return false
    end
  end

  return true
end

function Player:LoadIdentifiers()
  for _, identType in pairs(Configs.identifiers) do
    local identifier = GetPlayerIdentifierByType(self.Source, identType)

    if identifier then
      self.Identifiers[identType] = identifier
    end
  end
end

Stax.Register(Player, function(components)
  Player.Database = components.Database
  Player.Logger = components.Logger
end)