---@class ServerManagerSingleton
local ServerManager = {}

--- Sets a ready state on the server manager
---@param key string
---@param state boolean
function ServerManager.SetReadyState(key, state)
  exports.stax_core:ServerManager_SetReadyState(key, state)
end

--- Gets a ready state from the server manager
---@param key string
---@return boolean
function ServerManager.GetReadyState(key)
  return exports.stax_core:ServerManager_GetReadyState(key)
end

--- Gets if the server is ready to use
---@return boolean
function ServerManager.IsServerReady()
  return exports.stax_core:ServerManager_ServerReady()
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.ServerManager()
    return ServerManager
  end
end)