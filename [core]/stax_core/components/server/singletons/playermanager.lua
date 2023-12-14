---@class StaxPlayerManager
---@field INFO ComponentDetails
---@field PLAYERS { [string]: StaxPlayer }
local PlayerManager = {
  INFO = {
    NAME = "PlayerManager",
    REQUIREMENTS = {}
  }
}

function PlayerManager.Add()
  return exports.stax_core:PlayerManager_Add()
end

function PlayerManager.Remove()
  return exports.stax_core:PlayerManager_Remove()
end

function PlayerManager.Fetch()
  return exports.stax_core:PlayerManager_Fetch()
end

Stax.Component.Register(PlayerManager)