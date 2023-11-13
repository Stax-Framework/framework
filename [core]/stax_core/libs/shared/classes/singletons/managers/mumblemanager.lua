---@class MumbleManagerSingleton
local MumbleManager = {}

--- [SERVER] Create a permanent voice channel in mumble
---@param id number
function MumbleManager.CreateChannel(id)
  Stax.ServerOnly(function()
    exports.stax_core:MumbleManager_CreateChannel(id)
  end)
end

Stax.ServerOnly(function()
  function Stax.MumbleManager()
    return MumbleManager
  end
end)