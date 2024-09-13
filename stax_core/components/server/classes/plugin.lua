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
---@field public COMPONENT StaxComponentDetails
---@field public Resource string Plugin resource name
---@field public Data StaxPluginData Plugin data
---@field public Config { [string]: any }
---@field public Locale { [string]: any }
---@field public Logger StaxLogger?
---@field public Directory StaxDirectory?
local Plugin = {
  COMPONENT = Stax.Component.Init("Plugin", { "Logger", "Directory" }),
  Resource = "Default_Resource_Name",
  Data = PluginData,
  Logger = nil,
  Directory = nil
}
Plugin.__index = Plugin

--- Creates a new instance of a stax plugin
---@return StaxPlugin | nil
function Plugin.Create(resource)
  local newPlugin = {}
  setmetatable(newPlugin, Plugin)

  newPlugin.Resource = resource
  newPlugin.Data = PluginData
  newPlugin.Config = {}
  newPlugin.Locale = {}

  local fetched = Plugin.FetchInfo(newPlugin)

  if not fetched then return nil end

  Citizen.CreateThread(function()
    local initialized = Plugin.Init(newPlugin)
    if not initialized then return nil end

    Plugin.Logger.Success("Plugin.Create", newPlugin.Data.Name .. " Initialized!")

    local loaded = false

    Plugin.Load(newPlugin, function(configs, locales)
      newPlugin.Config = configs
      newPlugin.Locale = locales
      loaded = true
    end)

    repeat
      Citizen.Wait(250)
    until loaded

    Plugin.Logger.Success("Plugin.Create", newPlugin.Data.Name .. " Loaded!")

    local started = Plugin.Start(newPlugin)
    if not started then return nil end

    Plugin.Logger.Success("Plugin.Create", newPlugin.Data.Name .. " Started!")
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
---@param self StaxPlugin
---@param results fun(configs: table, locales: table)
---@return Promise<boolean>
function Plugin.Load(self, results)
  local p = promise.new()

  local configs = Plugin.FetchConfigs(self)

  if not configs then
    return p:reject(false)
  end

  if not configs["shared"] or not configs["shared"]["framework"] or not configs["shared"]["framework"]["locale"] then
    return p:reject(false)
  end

  local locales = Plugin.FetchLocales(self, configs["shared"]["framework"]["locale"])

  if not locales then
    return p:reject(false)
  end

  if configs and locales then
    results(configs, locales)
    p:resolve(true)
  end

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
  local files = Plugin.Directory.Scan(configDirectory)
  local configs = nil

  if not files then
    Plugin.Logger.Warning("Plugin.FetchConfigs", "No configs directory found for " .. self.Data.Name .. " (" .. self.Resource .. ")")
  end

  if #files < 1 then
    Plugin.Logger.Warning("Plugin.FetchConfigs", "No configs found for " .. self.Data.Name .. " (" .. self.Resource .. ")")
  end

  if files then
    configs = {}

    for a = 1, #files do
      local fileKey = string.gsub(files[a], ".json", "")

      if not string.find(files[a], ".json") then
        Plugin.Logger.Warning("Plugin.FetchConfigs", "Only json files should exist in the configs directory " .. self.Data.Name .. " (" .. self.Resource .. ")")
        break
      end

      local data = LoadResourceFile(self.Resource, "/configs/" .. files[a])

      if type(data) == "string" then
        data = json.decode(data)
      end

      local scope = _getConfigScope(files[a])

      if type(data) == "table" then
        if not configs[scope] then
          configs[scope] = {}
        end

        configs[scope][fileKey] = data
      end
    end
  end

  TriggerEvent("Stax::Shared::LoadConfigs", configs)

  Plugin.Logger.Success("Plugin.FetchConfigs", "End Of Fetching Configs")

  return configs
end

--- Fetches locales from a resources locales folder
---@param self StaxPlugin
---@param locale string
function Plugin.FetchLocales(self, locale)
  local localeDirectory = GetResourcePath(self.Resource) .. "/locales/"
  local files = self.Directory.Scan(localeDirectory)
  local locales = nil

  if not files then
    Plugin.Logger.Warning("Plugin.FetchLocales", "No locales directory found for " .. self.Data.Name .. " (" .. self.Resource .. ")")
  end

  if #files < 1 then
    Plugin.Logger.Warning("Plugin.FetchLocales", "No locales found for " .. self.Data.Name .. " (" .. self.Resource .. ")")
  end

  if files then
    for a = 1, #files do
      local fileKey = string.gsub(files[a], ".json", "")

      if fileKey == locale then
        local data = LoadResourceFile(self.Resource, "/locales/" .. files[a])
     
        if type(data) == "string" then
          data = json.decode(data)
        end
  
        if type(data) == "table" then
          locales = data
        end

        break
      end
    end
  end

  TriggerEvent("Stax::Shared::LoadLocales", locales)

  return locales
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
  Plugin.Logger = components.Logger
  Plugin.Directory = components.Directory
end)