local PlayerManager = {
  PLAYERS = {}
}

--- Adds a new player instance to the player manager
---@param player StaxPlayer
---@return number
function PlayerManager.Add(player)
  return 0
end

function PlayerManager.Remove()

end

function PlayerManager.Fetch()

end

exports("PlayerManager_Add", PlayerManager.Add)
exports("PlayerManaer_Remove", PlayerManager.Remove)
exports("PlayerManager_Fetch", PlayerManager.Fetch)