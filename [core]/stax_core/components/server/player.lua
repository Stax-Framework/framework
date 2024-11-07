---@class StaxPlayer
---@field COMPONENT StaxComponent
---@field Database StaxDatabase?
---@field Logger StaxLogger?
---@field Groups table | nil
---@field Handle string | nil
---@field Name string
---@field Identifiers table<string, string>
---@field Data { _id:  string | nil, identifier: string, group: string, bans: {}, kicks: {}, warns: {} }
local Player = {
  COMPONENT = Stax.Component.Init("Player", {
    "Logger",
    "Database"
  }),
  Database = nil,
  Logger = nil,
  Groups = nil,
}
Player.__index = Player

---@param source string | number
---@return StaxPlayer
function Player.Create(source)
  local newPlayer = {
    Handle = source,
    Name = GetPlayerName(source),
    Identifiers = {},
    Data = {
      _id = nil,
      identifier = nil,
      group = "user",
      bans = {},
      kicks = {},
      warns = {}
    }
  }
  setmetatable(newPlayer, Player)

  --- LICENSE IS HARDCODED HERE (POSSIBLE CONFIG TO DETERMINE WHICH IDENTIFIER TO USE)
  newPlayer.identifiers = Player.GetIdentifiers(newPlayer, { "license" })
  newPlayer.Data.identifier = newPlayer.identifiers["license"]

  newPlayer.Logger.Success("Player.Create", "Created Player: " .. newPlayer.Name)

  Player.Load(newPlayer)

  return newPlayer
end

--- @param self StaxPlayer
--- @param group string
function Player.SetGroup(self, group)
  if Player.Groups[group] == nil then
    return
  end

  --- CHANGE PLAYERS GROUP
  self.Data.group = group

  Player.Save(self)
end

--- Fetches all of the identifiers with specified types
---@param self StaxPlayer
---@param types table<string, string>
function Player.GetIdentifiers(self, types)
  local identifiers = {}

  for _, t in pairs(types) do
    identifiers[t] = GetPlayerIdentifierByType(self.Handle, t)
  end

  return identifiers
end

--- Loads the players data
---@param self StaxPlayer
function Player.Load(self)
  Player.Database.FindOne({ collection = "players", query = { identifier = self.Data.identifier }}, function(results)
    if results[1] == nil then
      Player.Insert(self)
    else
      self.Data = results[1]
      Player.Logger.Unpack("Player.Load", results[1], true)
      Player.Logger.Unpack("PLAYER_LOADED_DATA", self.Data, true)
    end
  end)
end

--- Saves the players data
---@param self StaxPlayer
function Player.Insert(self)
  Player.Database.InsertOne({ collection = "players", document = self.Data }, function(insertCount, insertedIds)
    if insertCount > 0 then
      Player.Logger.Unpack("Player.Save", insertedIds, true)
    else
      Player.Logger.Error("Player.Save", "Failed to save player " .. self.Name .. "!")
    end
  end)
end

--- Updates the players current existing data
---@param self StaxPlayer
function Player.Save(self)
  Player.Database.UpdateOne({ collection = "players", query = { _id = self.Data._id } }, function(updatedCount)
    if updatedCount > 0 then
      Player.Logger.Success("Player.Save", "Saved player " .. self.Name .. "!")
    else
      Player.Logger.Error("Player.Save", "Unable to save player " .. self.Name .. "!")
    end
  end)
end

--- Bans the player
---@param self StaxPlayer
---@param admin StaxPlayer
---@param data {  }
function Player.Ban(self, admin, data)

end

--- Kicks the player
---@param self StaxPlayer
---@param admin StaxPlayer
---@param reason string
function Player.Kick(self, admin, reason)

end

--- Warns the player
---@param self StaxPlayer
---@param admin StaxPlayer
---@param reason string
function Player.Warn(self, admin, reason)

end

--- Checks if the players group is a super group (has all permissions)
---@param self StaxPlayer
function Player.IsSuper(self)

end

--- Checks if the player has a permission on their group
---@param self StaxPlayer
---@param permission string
function Player.HasPermission(self, permission)

end

--- Checks if the player has specified permissions on their group
---@param self StaxPlayer
---@param permissions table<string>
function Player.HasPermissions(self, permissions)

end

Stax.Register(Player, function(components)
  Player.Database = components.Database
  Player.Logger = components.Logger
  Player.Groups = Stax.Config:Fetch("permissions")
end)
