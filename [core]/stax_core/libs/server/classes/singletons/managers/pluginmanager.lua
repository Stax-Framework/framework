---@class PluginManagerSingleton
local PluginManager = {}

--- Gets the plugin using its key
---@param key string
---@return Plugin
function PluginManager.Get(key)
  return exports.stax_core:PluginManager_Get(key)
end

--- Gets the plugins key
---@param resource string
---@return string
function PluginManager.GetKey(resource)
  return exports.stax_core:PluginManager_GetKey(resource)
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.PluginManager()
    return PluginManager
  end
end)
