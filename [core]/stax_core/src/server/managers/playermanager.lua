---@type StaxLogger
local Logger = Stax.Component.Fetch("Logger")

local PlayerManager = {
  PLAYERS = {}
}

--- Adds a new player instance to the player manager
---@param player StaxPlayer
function PlayerManager.Add(player)
  PlayerManager.PLAYERS[player.Handle] = player
  Logger.Success("PlayerManager.Add", "Added " .. tostring(player.Name))
end

--- Removes a player instance from the player manager
---@param player StaxPlayer
function PlayerManager.Remove(player)
  PlayerManager.PLAYERS[player.Handle] = nil
  Logger.Success("PlayerManager.Remove", "Removed " .. tostring(player.Name))
end

--- Fetches the player instance from the players source
---@param handle number
---@return (StaxPlayer | nil)
function PlayerManager.Fetch(handle)
  if PlayerManager.PLAYERS[handle] then
    return PlayerManager.PLAYERS[handle]
  end
  return nil
end

exports("PlayerManager_Add", PlayerManager.Add)
exports("PlayerManaer_Remove", PlayerManager.Remove)
exports("PlayerManager_Fetch", PlayerManager.Fetch)