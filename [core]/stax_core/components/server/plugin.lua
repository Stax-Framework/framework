---@class StaxPluginData
---@field public Key string Plugin's unique key
---@field public Name string Plugin's name
---@field public Description string Plugin's brief functionality description
---@field public Version string Plugin's current version
local PluginData = {
  Key = "Default_Plugin_Key",
  Name = "Default_Plugin_Name",
  Description = "N/A",
  Version = "N/A"
}

---@class StaxPlugin
---@field public COMPONENT ComponentDetails
---@field public Resource string Plugin resource name
---@field public Key string Plugin defined key
---@field public Data StaxPluginData Plugin data
local Plugin = {
  COMPONENT = {
    NAME = "Plugin",
    REQUIREMENTS = {}
  },
  Resource = "Default_Resource_Name",
  Key = "Default_Plugin_Key",
  Data = PluginData
}
Plugin.__index = Plugin

--- Creates a new instance of a stax plugin
function Plugin.Register(resource)
  local newPlugin = {}
  setmetatable(newPlugin, Plugin)

  newPlugin.Resource = resource
  newPlugin.Data = PluginData

  local fetched = Plugin.FetchInfo(newPlugin)

  if not fetched then
    print("Failed to create plugin instance for resource '" .. tostring(resource) .. "'")
    return nil
  end

  print("Registered New Plugin: " .. json.encode(newPlugin, { indent = true }))

  return newPlugin
end

--- Starts the plugins preinitialization stage
function Plugin.Start()

end

function Plugin.Load()

end

function Plugin.Init()

end

function Plugin.Loaded()

end

---@return boolean
function Plugin.FetchInfo(self)
  --- Checks if the plugin has a specific metadata key
  ---@param key string
  ---@return boolean
  local function HasKey(key)
    return GetNumResourceMetadata(self.Resource, key) > 0
  end

  --- Gets all metadata by key
  ---@param key string
  ---@return table | nil
  local function GetAllByKey(key)
    if not HasKey(key) then
      return nil
    end

    local count = GetNumResourceMetadata(self.Resource, key)
    local values = {}

    for a = 0, count do
      values[#values+1] = {
        value = GetResourceMetadata(self.Resource, key, a),
        extra = GetResourceMetadata(self.Resource, key .. "_extra", a)
      }
    end

    return values
  end

  --- DATA LOGIC
  local data = GetAllByKey("stax_plugin")

  if not data then return false end
  if not data[1] then return false end

  self.Data.Key = data[1].value

  if not data[1].extra then
    return false
  end

  local extra = json.decode(data[1].extra)

  if extra then
    if not extra.name then return false end
    if not extra.description then return false end
    if not extra.version then return false end

    self.Data.Name = extra.name
    self.Data.Description = extra.description
    self.Data.Version = extra.version
  end

  return true
end

Stax.Component.Register(Plugin)