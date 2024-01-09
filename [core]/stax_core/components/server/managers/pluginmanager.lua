---@class StaxPluginManagerSingleton
---@field Plugins { [string]: StaxPlugin }
local Singleton = {
  Plugins = {}
}

--- Adds a plugin to the plugin manager
---@param plugin StaxPlugin
local function _add(plugin)
  Singleton.Plugins[plugin.Data.Key] = plugin
  TriggerEvent("Stax::Server::PluginAdded", plugin)
end

--- Removes a plugin from the plugin manager
---@param plugin StaxPlugin
local function _remove(plugin)
  Singleton.Plugins[plugin.Data.Key] = nil
  TriggerEvent("Stax::Server::PluginRemoved", plugin)
end

--- Fetches plugin from plugins key index
---@param key string
---@return StaxPlugin | nil
local function _fetchKey(key)
  if Singleton.Plugins[key] then
    return Singleton.Plugins[key]
  end

  return nil
end

--- Fetches plugin from plugins resource name
---@param resource string
---@return StaxPlugin | nil
local function _fetchResource(resource)
  for _, plugin in pairs(Singleton.Plugins) do
    if plugin.Resource == resource then
      return plugin
    end
  end

  return nil
end

---@param resource string
local function onResourceStart(resource)
  local Plugin = Stax.RequireAsync("Plugin")
  local newPlugin = Plugin.Create(resource)

  if newPlugin then
    _add(newPlugin)
  end
end

---@param resource string
local function onResourceStop(resource)
  local plugin = _fetchResource(resource)

  if plugin then
    _remove(plugin)
  end
end

AddEventHandler("onResourceStart", onResourceStart)
AddEventHandler("onResourceStop", onResourceStop)

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
  return _add(plugin)
end

--- Removes a plugin from the plugin manager
---@param plugin StaxPlugin
function PluginManager.Remove(plugin)
  return _remove(plugin)
end

--- Fetches plugin from plugins key index
---@param key string
---@return StaxPlugin | nil
function PluginManager.Fetch(key)
  return _fetchKey(key)
end

--- Fetches plugin from plugins resource name
---@param resource string
---@return StaxPlugin | nil
function PluginManager.FetchResource(resource)
  return _fetchResource(resource)
end

Stax.Register(PluginManager, function(components)
  PluginManager.Logger = components.Logger
  PluginManager.Plugin = components.Plugin
end)