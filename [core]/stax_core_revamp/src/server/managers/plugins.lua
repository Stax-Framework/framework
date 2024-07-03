---@class PluginManager
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

function Manager._fetchResource()

end

function Manager._onStart()
    
end

function Manager._onStop()

end

AddEventHandler("onResourceStart", function()

end)

AddEventHandler("onResourceStop", function()

end)