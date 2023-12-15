---@class StaxPlayerManager
---@field COMPONENT ComponentDetails
---@field PLAYERS { [string]: StaxPlayer }
local PlayerManager = {
  COMPONENT = {
    NAME = "PlayerManager",
    REQUIREMENTS = {}
  }
}

--- Adds a new player instance to the player manager
---@param player StaxPlayer
---@return number
function PlayerManager.Add(player)
  return exports.stax_core:PlayerManager_Add(player)
end

--- Removes a player instance from the player manager
---@param player StaxPlayer
function PlayerManager.Remove(player)
  return exports.stax_core:PlayerManager_Remove(player)
end

--- Fetches the player instance from the players source
---@param handle number
---@return (StaxPlayer | nil)
function PlayerManager.Fetch(handle)
  return exports.stax_core:PlayerManager_Fetch(handle)
end

Stax.Register(PlayerManager)