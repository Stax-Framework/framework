---@class CallbackManagerSingleton
local CallbackManager = {}

--- Creates a callback for the server
---@param name string
---@param callback fun(player: Player, payload: table, send: fun(data: table))
function CallbackManager.ServerCallback(name, callback)
  Stax.ServerOnly(function()
    exports.stax_core:CallbackManager_ServerCallback(name, callback)
  end)
end

--- Creates a callback for the client
---@param name string
---@param callback fun(payload: table, send: fun(data: table))
function CallbackManager.ClientCallback(name, callback)
  Stax.ClientOnly(function()
    exports.stax_core:CallbackManager_ClientCallback(name, callback)
  end)
end

--- Fires a server callback where the server returns results
---@param name string
---@param payload any
---@param callback fun(...)
function CallbackManager.FireServer(name, payload, callback)
  Stax.ClientOnly(function()
    exports.stax_core:CallbackManager_FireServer(name, payload, callback)
  end)
end

--- Fires a server callback where the server returns results
---@param name string
---@param source string
---@param payload any
---@param callback fun(...)
function CallbackManager.FireClient(name, source, payload, callback)
  Stax.ServerOnly(function()
    exports.stax_core:CallbackManager_FireClient(name, source, payload, callback)
  end)
end

function Stax.CallbackManager()
  return CallbackManager
end