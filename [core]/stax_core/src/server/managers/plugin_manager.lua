---@class StaxPluginManagerSingleton
---@field Plugins { [string]: StaxPlugin }
local Manager = {
  Plugins = {}
}

--- Adds a plugin to the plugin manager
---@param plugin StaxPlugin
local function _add(plugin)
  Manager.Plugins[plugin.Data.Key] = plugin
  Stax.Fire({ name = "PluginManager", action = "Added" }, plugin)
end

--- Removes a plugin from the plugin manager
---@param plugin StaxPlugin
local function _remove(plugin)
  Manager.Plugins[plugin.Data.Key] = nil
  Stax.Fire({ name = "PluginManager", action = "Removed" }, plugin)
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

--- STAX EVENTS
Stax.BaseEvent("onResourceStart", onResourceStart)
Stax.BaseEvent("onResourceStop", onResourceStop)

--- STAX EXPORTS
Stax.Export("PluginManager_Add", _add)
Stax.Export("PluginManager_Remove", _remove)
Stax.Export("PluginManager_Fetch", _fetchKey)
Stax.Export("PluginManager_FetchResource", _fetchResource)