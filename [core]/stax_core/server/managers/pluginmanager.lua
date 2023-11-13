local Events = Stax.Events()
local Logger = Stax.Logger()
local Plugin = Stax.Plugin()
local Class = Stax.Class()
local CoreEvents = Stax.DefinedEvents.Core()

--- Events
local BaseEvents = CoreEvents.Server.BASE
local PluginEvents = CoreEvents.Server.PLUGIN

---@class PluginManager
local PluginManager = {
  Plugins = {}
}

--- Creates new plugin instance and stores it
---@param resource string
function PluginManager.Add(resource)
  local newPlugin = Plugin.New(resource);

  local validPlugin = newPlugin:PreInit(function(CallInit)
    PluginManager.Plugins[newPlugin.Key] = newPlugin

    if newPlugin.Dependencies then
      local timestamp = GetGameTimer() * 10000

      while not PluginManager.ArePluginsMounted(newPlugin.Dependencies) do
        if timestamp < GetGameTimer() then
          Logger.Error("PluginManager::Add::DependencyTimerExpired", "[(" .. newPlugin.ResourceName .. ") " .. newPlugin.Name .. "]")
          return
        end
        Citizen.Wait(500)
      end
    end

    CallInit()
  end)

  if not validPlugin then
    return
  end
end

--- Removes the plugin from the plugin manager
---@param resource string
function PluginManager.Remove(resource)
  local key = PluginManager.GetKey(resource)

  if not key then
    return
  end

  PluginManager.Plugins[key]:UnMount()
  PluginManager.Plugins[key] = nil
end

--- Gets the plugin instance from its name
---@param key string
---@return Plugin | nil
function PluginManager.Get(key)
  return PluginManager.Plugins[key]
end

--- Gets the plugins defined key
---@param resource string
---@return string | nil
function PluginManager.GetKey(resource)
  local key = nil

  for k, v in pairs(PluginManager.Plugins) do
    if v.ResourceName == resource then
      key = k
      break
    end
  end

  if not key then
    return nil
  end

  return key
end

--- Gets if all defined plugins are mounted
---@param plugins table<string>
---@return boolean
function PluginManager.ArePluginsMounted(plugins)
  local allMounted = true

  for pluginKey, plugin in pairs(PluginManager.Plugins) do
    for _, key in pairs(plugins) do
      if pluginKey == key then
        if not plugin.Mounted then
          allMounted = false
          break
        end
      end
    end
  end

  return allMounted
end

--- EVENTS

--- Hooks into the resource start base event
---@param resource string
Events.CreateEvent(BaseEvents.OnResourceStart, function(resource)
  PluginManager.Add(resource)
end)

--- Hooks into the resource stop base event
---@param resource string
Events.CreateEvent(BaseEvents.OnResourceStop, function(resource)
  PluginManager.Remove(resource)
end)

--- Fires when a plugin is mounted
---@param plugin Plugin
Events.CreateEvent(PluginEvents.Mounted, function(plugin)
  plugin = Class.Init(plugin, Plugin)

  plugin:SendConfigPlayer(-1)
  plugin:SendLocalePlayer(-1)

  print("Plugin Mounted... Syncing Client Locales and Configs")

  Logger.Success("PluginManager::Mounted", "[(" .. plugin.ResourceName .. ") " .. plugin.Name .. "]")
end)

--- Fires when a plugin is unmounted
---@param plugin Plugin
Events.CreateEvent(PluginEvents.UnMounted, function(plugin)
  Logger.Success("PluginManager::UnMounted", "[(" .. plugin.ResourceName .. ") " .. plugin.Name .. "]")
end)

--- EXPORTS
exports("PluginManager_Get", PluginManager.Get)
exports("PluginManager_GetKey", PluginManager.GetKey)