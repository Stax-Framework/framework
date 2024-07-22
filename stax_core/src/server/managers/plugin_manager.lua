---@class StaxPluginManagerSingleton
---@field Plugins { [string]: StaxPlugin }
local Manager = {
  Plugins = {}
}

--- Adds a plugin to the plugin manager
---@param plugin StaxPlugin
local function _add(plugin)
  Manager.Plugins[plugin.Data.Key] = plugin
  TriggerEvent("Stax::Server::PluginAdded", plugin)
end

--- Removes a plugin from the plugin manager
---@param plugin StaxPlugin
local function _remove(plugin)
  Manager.Plugins[plugin.Data.Key] = nil
  TriggerEvent("Stax::Server::PluginRemoved", plugin)
end

--- Fetches plugin from plugins key index
---@param key string
---@return StaxPlugin | nil
local function _fetchKey(key)
  if Manager.Plugins[key] then
    return Manager.Plugins[key]
  end

  return nil
end

--- Fetches plugin from plugins resource name
---@param resource string
---@return StaxPlugin | nil
local function _fetchResource(resource)
  for _, plugin in pairs(Manager.Plugins) do
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

exports("PluginManager_Add", _add)
exports("PluginManager_Remove", _remove)
exports("PluginManager_Fetch", _fetchKey)
exports("PluginManager_FetchResource", _fetchResource)