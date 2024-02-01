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
  return exports.stax_core:PlayerManager_Add(player)
end

--- Removes a player instance from the player manager
---@param player StaxPlayer
function PlayerManager.Remove(player)
  return exports.stax_core:PlayerManager_Remove(player)
end

--- Fetches the player instance from the players source
---@param handle number | nil
---@return (StaxPlayer | nil)
function PlayerManager.Fetch(handle)
  return exports.stax_core:PlayerManager_Fetch(handle)
end

Stax.Register(PlayerManager, function(components)
  PlayerManager.Logger = components.Logger
end)