---@type StaxLogger
local Logger

---@type StaxDirectory
local Directory

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
---@field public Data StaxPluginData Plugin data
local Plugin = {
  COMPONENT = {
    NAME = "Plugin",
    REQUIREMENTS = {
      "Logger",
      "Directory"
    }
  },
  Resource = "Default_Resource_Name",
  Data = PluginData
}
Plugin.__index = Plugin

--- Creates a new instance of a stax plugin
---@return StaxPlugin | nil
function Plugin.Create(resource)
  local newPlugin = {}
  setmetatable(newPlugin, Plugin)

  newPlugin.Resource = resource
  newPlugin.Data = PluginData

  local fetched = Plugin.FetchInfo(newPlugin)

  if not fetched then
    print("Failed to create plugin instance for resource '" .. tostring(resource) .. "'")
    return nil
  end

  Citizen.CreateThread(function()
    local initialized = Plugin.Init(newPlugin)
    if not initialized then return nil end

    Logger.Success("Plugin.Create", newPlugin.Data.Name .. " Initialized!")

    local loaded = Plugin.Load(newPlugin)
    if not loaded then return nil end

    Logger.Success("Plugin.Create", newPlugin.Data.Name .. " Loaded!")

    local started = Plugin.Start(newPlugin)
    if not started then return nil end

    Logger.Success("Plugin.Create", newPlugin.Data.Name .. " Started!")
  end)

  return newPlugin
end

--- Starts the plugins preinitialization stage
---@return Promise<boolean>
function Plugin.Init(self)
  local p = promise.new()

  p:resolve(true)

  return Citizen.Await(p)
end

--- Starts the plugins preinitialization stage
---@return Promise<boolean>
function Plugin.Load(self)
  local p = promise.new()

  Plugin.FetchConfigs(self)

  p:resolve(true)

  return Citizen.Await(p)
end

--- Starts the plugins preinitialization stage
---@return Promise<boolean>
function Plugin.Loaded(self)
  local p = promise.new()

  p:resolve(true)

  return Citizen.Await(p)
end

--- Starts the plugins preinitialization stage
---@return Promise<boolean>
function Plugin.Start(self)
  local p = promise.new()

  p:resolve(true)

  return Citizen.Await(p)
end

--- Fetches configs from a resources configs folder
function Plugin.FetchConfigs(self)
  local function _getConfigScope(file)
    if string.find(file, ".client.") then
      return "client"
    elseif string.find(file, ".server.") then
      return "server"
    end

    return "shared"
  end

  local configDirectory = GetResourcePath(self.Resource) .. "/configs/"
  local files = Directory.Scan(configDirectory)

  if not files then
    Logger.Warning("Plugin.FetchConfigs", "No configs directory found for " .. self.Data.Name .. " (" .. self.Resource .. ")")
  end

  if #files < 1 then
    Logger.Warning("Plugin.FetchConfigs", "No configs found for " .. self.Data.Name .. " (" .. self.Resource .. ")")
  end

  if files then
    for a = 1, #files do
      if not string.find(files[a], ".json") then
        Logger.Warning("Plugin.FetchConfigs", "Only json files should exist in the configs directory " .. self.Data.Name .. " (" .. self.Resource .. ")")
        break
      end

      local data = LoadResourceFile(self.Resource, "/configs/" .. files[a])
      
      if data then
        data = json.decode(data)
      end

      local scope = _getConfigScope(files[a])

      print("[" .. files[a] .. "]: " .. tostring(scope))
    end
  end

  Logger.Success("Plugin.FetchConfigs", "End Of Fetching Configs")
end

--- Fetches locales from a resources locales folder
function Plugin.FetchLocales(self)

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

Stax.Register(Plugin, function(components)
  Logger = components["Logger"]
  Directory = components["Directory"]
end)