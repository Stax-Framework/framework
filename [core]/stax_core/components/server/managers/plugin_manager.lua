---@class StaxPluginManager
---@field COMPONENT StaxComponent
---@field Plugin StaxPlugin?
---@field Logger StaxLogger?
local PluginManager = {
  COMPONENT = Stax.Component.Init("PluginManager", { "Plugin", "Logger" }),
  Plugin = nil,
  Logger = nil
}

--- Adds a plugin to the plugin manager
---@param plugin StaxPlugin
function PluginManager.Add(plugin)
  return exports.stax_core:PluginManager_Add(plugin)
end

--- Removes a plugin from the plugin manager
---@param plugin StaxPlugin
function PluginManager.Remove(plugin)
  return exports.stax_core:PluginManager_Remove(plugin)
end

--- Fetches plugin from plugins key index
---@param key string
---@return StaxPlugin | nil
function PluginManager.Fetch(key)
  return exports.stax_core:PluginManager_Fetch(key)
end

--- Fetches plugin from plugins resource name
---@param resource string
---@return StaxPlugin | nil
function PluginManager.FetchResource(resource)
  return exports.stax_core:PluginManager_FetchResource(resource)
end

Stax.Register(PluginManager, function(components)
  PluginManager.Logger = components.Logger
  PluginManager.Plugin = components.Plugin
end)