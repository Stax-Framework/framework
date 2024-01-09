---@class StaxPlayerManagerSingleton
---@field Players { [number]: StaxPlayer }
local Singleton = {
  Players = {}
}

local function _add(player)
  table.insert(Singleton.Players, player)
end

local function _remove(index)
  table.remove(Singleton.Players, index)
end

local function _fetch(handle)
  if not handle then
    return Singleton.Players
  end

  return Singleton.Players[handle]
end

---@class StaxPlayerManager
---@field COMPONENT StaxComponent
---@field Logger StaxLogger?
local PlayerManager = {
  COMPONENT = Stax.Component.Init("PlayerManager", { "Logger" }),
  Logger = nil
}

--- Adds a new player instance to the player manager
---@param player StaxPlayer
function PlayerManager.Add(player)
  return _add(player)
end

--- Removes a player instance from the player manager
---@param player StaxPlayer
function PlayerManager.Remove(player)
  return _remove(player)
end

--- Fetches the player instance from the players source
---@param handle number | nil
---@return (StaxPlayer | nil)
function PlayerManager.Fetch(handle)
  return _fetch(handle)
end

Stax.Register(PlayerManager, function(components)
  PlayerManager.Logger = components.Logger
end)