---@class PlayerManager
local PlayerManager = {
    COMPONENT = Stax.Component.Init("PlayerManager")
}

--- Adds a new player to the PlayerManager instance
---@param player Player
function PlayerManager.Add(player)
    return exports.stax:PlayerManager_Add(player)
end

--- Removes a player from the PlayerManager instance
---@param playerId string | number
function PlayerManager.Remove(playerId)
    return exports.stax:PlayerManager_Remove(playerId)
end

--- Fetches a player from the PlayerManager instance
---@param playerId string | number
function PlayerManager.Fetch(playerId)
    return exports.stax:PlayerManager_Fetch(playerId)
end

---[[
--- REGISTER COMPONENT
---]]
Stax.Component.Register(PlayerManager)