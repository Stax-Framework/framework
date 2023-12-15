---@type StaxLogger
local Logger

---@type StaxPlugin
local Plugin

---@class StaxPluginManager
---@field public PLUGINS { [string]: StaxPlugin }
local PluginManager = {
  PLUGINS = {}
}

--- Adds a new plugin to the plugin manager
---@param plugin StaxPlugin
function PluginManager.Add(plugin)
  PluginManager.PLUGINS[plugin.Data.Key] = plugin
  TriggerEvent("Stax::Server::PluginAdded", plugin)
end

--- Adds a new plugin to the plugin manager
---@param plugin StaxPlugin
function PluginManager.Remove(plugin)
  PluginManager.PLUGINS[plugin.Data.Key] = nil
end

--- Fetches a plugin by its key
---@param key string
---@return (StaxPlugin | nil)
function PluginManager.FetchFromKey(key)
  if PluginManager.PLUGINS[key] then
    return PluginManager.PLUGINS[key]
  end

  return nil
end

--- Fetches a plugin by its resource name
---@param resource string
---@return (StaxPlugin | nil)
function PluginManager.FetchFromResource(resource)
  for _, plugin in pairs(PluginManager.PLUGINS) do
    if plugin.Resource == resource then
      return plugin
    end
  end

  return nil
end

--- Event to handle resource starting
---@param resource string
function PluginManager.StaxReady(resource)
  if GetCurrentResourceName() == resource then
    Plugin = Stax.Require("Plugin")
    Logger = Stax.Require("Logger")
  end

  local plugin = Plugin.Create(resource)

  if plugin then
    PluginManager.Add(plugin)
  end
end

--- Event to handle plugin being added to manager
---@param plugin StaxPlugin
function PluginManager.OnPluginAdded(plugin)
  Logger.Success("PluginManagaer.OnPluginAdded", tostring(plugin.Data.Name .. " ADDED"))
end

AddEventHandler("Stax::Shared::Ready", PluginManager.StaxReady)
AddEventHandler("Stax::Server::PluginAdded", PluginManager.OnPluginAdded)