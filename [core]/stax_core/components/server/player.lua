---@type StaxDatabase
local Database
---@type StaxLogger
local Logger

---@class StaxPlayerData
---@field _id (number | nil) Players Source Id
local PlayerData = {
  _id = nil,
  identifiers = {
    ["license"] = nil,
    ["steam"] = nil
  }
}

---@class StaxPlayer
---@field COMPONENT ComponentDetails
---@field Handle number Players Source ID
---@field Name string Players Username
---@field Data StaxPlayerData
local Player = {
  COMPONENT = {
    NAME = "Player",
    REQUIREMENTS = {
      "Database",
      "Logger"
    }
  },
  Name = "",
  Data = PlayerData
}
Player.__index = Player

--- Creates a new instance of the player
---@return StaxPlayer
function Player.Init(data)
  return setmetatable(data, Player)
end

---@return boolean
function Player.Exists(identifier)
  local dbResult = Database.AsyncFindOne("players", {
    ["identifiers.license"] = { ["$eq"] = "license:000000000" },
    ["identifiers.steam"] = { ["$eq"] = "steam:010asf9asdf8" }
  })

  print(json.encode(dbResult, { indent = true }))

  if not dbResult.success then
    Logger.Error("Player.Exists", tostring(dbResult.results))
    return false
  end

  if dbResult.results then
    if #dbResult.results > 0 then
      return true
    end
  end

  return false
end

function Player.Create(handle)
  local data = {
    name = "Xander1998",
    identifiers = {
      license = nil,
      steam = nil
    }
  }

  for identType, value in pairs(data.identifiers) do
    local identifier = GetPlayerIdentifierByType(handle, identType)

    if identifier then
      data.identifiers[identType] = identifier
    end
  end

  local dbResult = Database.AsyncInsertOne("players", data)

  if not dbResult.success then
    print(json.encode(dbResult.insertedIds))
    return
  end

  return Player.Init({
    Handle = 999,
    Name = data.Name,
    Data = data
  })
end

function Player.Delete()

end

function Player.GetIdentifiers(handle)

end

---@return (StaxPlayer | nil)
function Player.Fetch(t)
  return nil
end

function Player.TriggerEvent(self, event, ...)
  TriggerClientEvent(event, self.Handle, ...)
end

function Player.Save(self)
  print("Saving Player: [" .. tostring(self.Handle) .. "]: " .. tostring(self.Name))
end

Stax.Register(Player, function(components)
  Database = components["Database"]
  Logger = components["Logger"]
end)