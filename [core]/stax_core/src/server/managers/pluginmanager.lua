---@type StaxLogger
local Logger = Stax.Component.Fetch("Logger")

---@type StaxPlugin
local Plugin = Stax.Component.Fetch("Plugin")

local PluginManager = {
  PLUGIN = {}
}

function PluginManager.Add()

end

function PluginManager.Remove()

end

function PluginManager.Fetch()

end

--- Creates an event for when the resource starts
---@param resource string
function PluginManager.OnResourceStart(resource)
  local plugin = Plugin.Register(resource)
end

AddEventHandler("onResourceStart", PluginManager.OnResourceStart)