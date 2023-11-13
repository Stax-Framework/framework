---@class PlayerManagerSingleton
local PlayerManager = {}

--- Adds player to the manager
---@param player Player
function PlayerManager.Add(player)
  exports.stax_core:PlayerManager_Add(player)
end

--- Removes player from the manager
---@param player Player
function PlayerManager.Remove(player)
  exports.stax_core:PlayerManager_Remove(player)
end

--- Gets the player from the player manager
---@param source number
---@return Player | nil
function PlayerManager.Get(source)
  return exports.stax_core:PlayerManager_Get(source)
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.PlayerManager()
    return PlayerManager
  end
end)