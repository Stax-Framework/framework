---@type Logger
local Logger = nil

Stax.System.Init({ "Logger" }, function(results)
    Logger = results["Logger"]
end)

---@class PluginManagerSource
---@field Plugins { [string]: Plugin }
local Manager = {
    Plugins = {}
}

---@param plugin Plugin
function Manager._add(plugin)
    Manager.Plugins[plugin.Data.Key] = plugin
    Stax.FireEvent("STAX::SERVER::PluginAdded", plugin) 
end

---@param plugin Plugin
function Manager._remove(plugin)
    Manager.Plugins[plugin.Data.Key] = plugin
    Stax.FireEvent("STAX::SERVER::PluginRemoved", plugin)
end

--- Fetches plugin
---@param type "resource" | "key"
---@param name any
function Manager._fetch(type, name)
    if type == "key" then
        if Manager.Plugins[name] then
            return Manager.Plugins[name]
        end

        return nil
    elseif type == "resource" then
        for _, plugin in pairs(Manager.Plugins) do
            if plugin.Resource == name then
                return plugin
            end
        end
        
        return nil
    else
        print("Invalid fetch type")
        return nil
    end
end

---@param resource string
function Manager._onStart(resource)
    ---@type Plugin | nil
    local Plugin = Stax.Component.FetchAsync("Plugin")

    if Plugin then
        local newPlugin = Plugin.New(resource)

        if newPlugin then
            Manager._add(newPlugin)

            Logger.Success("Hello_World", "Hello_World")
        end
    end
end

function Manager._onStop(resource)
    local plugin = Manager._fetch("resource", resource)

    if plugin then
      Manager._remove(plugin)
    end
end

---[[ EVENTS ]]---
AddEventHandler("onResourceStart", Manager._onStart)
AddEventHandler("onResourceStop", Manager._onStop)

---[[ EXPORTS ]]---
exports("PluginManager_Add", Manager._add)
exports("PluginManager_Remove", Manager._remove)
exports("PluginManager_Fetch", Manager._fetch)