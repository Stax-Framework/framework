local Logger = Stax.Logger()

---@class PlayerManager
---@field public Players table<number, Player> Table of all player instances
local PlayerManager = {
  Players = {}
}

--- Adds a Player instance to the PlayerManager
---@param player Player
---@return Player
function PlayerManager.Add(player)
  PlayerManager.Players[player.Handle] = player
  return player
end

--- Removes a Player instance to the PlayerManager
---@param player Player
function PlayerManager.Remove(player)
  if not PlayerManager.Players[player.Handle] then
    Logger.Error("PlayerManager::Remove", "Couldn't remove player [" .. player.Name .. "]")
    return
  end

  PlayerManager.Players[player.Handle] = nil
end

--- Gets the Player instance from the player manager
---@param handle number
---@return Player | nil
function PlayerManager.Get(handle)
  ---@type Player
  local player = PlayerManager.Players[handle]

  if player then
    return player
  end

  return nil
end

--- EXPORTS
exports("PlayerManager_Add", PlayerManager.Add)
exports("PlayerManager_Remove", PlayerManager.Remove)
exports("PlayerManager_Get", PlayerManager.Get)