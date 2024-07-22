---@class StaxConnectionManager
---@field COMPONENT StaxComponent
local ConnectionManager = {
    COMPONENT = Stax.Component.Init("ConnectionManager", { "Player" }),
    Player = nil
}

function ConnectionManager.Get()
    return exports.stax_core:ConnectionManager_Get()
end