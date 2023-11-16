local Logger = Stax.Logger()
local Events = Stax.Events()
local Directory = Stax.Directory()
local Config = Stax.Config()
local Locale = Stax.Locale()
local PluginManager = Stax.PluginManager()
local Database = Stax.Database()
local Class = Stax.Class()
local Http = Stax.Http()

---@class Plugin
---@field public ResourceName string Plugin resource folder name
---@field public Key string Plugin defined key
---@field public Name string Plugin defined name
---@field public Description string Plugin defined description
---@field public Version number Plugin version
---@field public Github { username: string, repository: string } Plugin Github
---@field public Dependencies table<string> Plugin defined dependencies
---@field public Config Config Plugin configurations
---@field public Locale Locale Plugin localization
---@field public Mounted boolean Plugin is mounted
local Plugin = {}
Plugin.__index = Plugin


--- Create new instance of Plugin
---@param resource string
---@return Plugin
function Plugin.New(resource)
  local newPlugin = {}
  setmetatable(newPlugin, Plugin)

  newPlugin.ResourceName = resource
  newPlugin.Key = nil
  newPlugin.Name = nil
  newPlugin.Description = nil
  newPlugin.Version = nil
  newPlugin.Github = nil
  newPlugin.Dependencies = nil
  newPlugin.Config = nil
  newPlugin.Locale = nil

  newPlugin.Mounted = false

  return newPlugin
end

--- Preinit Function
---@param callback function Calls the Initialize Function
function Plugin:PreInit(callback)
  local hasPluginInfo = self:GetPluginInfo()

  if not hasPluginInfo then
    return false
  end

  callback(function()
    self:Init(function()
      self:Mount()
    end)
  end)

  return true
end

--- Initializes the plugins
---@param mount function Calls for the plugin to mount
function Plugin:Init(mount)
  Citizen.CreateThread(function()
    self:LoadConfig()

    mount()
  end)
end

--- Fires after the plugin has been mounted
function Plugin:Mount()
  Citizen.CreateThread(function()
    self:CheckVersion()
    self:LoadLocale()

    self.Mounted = true
    Events.Fire("STAX::Core::Server::PluginMounted", self)
  end)
end

function Plugin:UnMount()
  self.Mounted = false

  Events.Fire("STAX::Core::Server::PluginUnMounted", self)
end

--- Get plugin name
function Plugin:GetPluginInfo()
  local data = self:GetAllByKey("stax_plugin")

  if not data then return end
  if not data[1] then return end

  self.Key = data[1].value
  
  local extra = json.decode(data[1].extra)

  self.Name = extra.name
  self.Description = extra.description
  self.Version = extra.version
  
  if extra.github then
    if extra.github.username and extra.github.repository then
      self.Github = {
        username = extra.github.username,
        repository = extra.github.repository
      }
    end
  end

  if extra.dependency then
    self.Dependencies = extra.dependency

    if not self.Key ~= "stax-core" then
      self.Dependencies[#self.Dependencies+1] = "stax-core"
    end
  else
    if self.Key ~= "stax-core" then
      self.Dependencies = { "stax-core" }
    end
  end
 
  if self.Key and self.Name and self.Description then
    return true
  end

  return false
end

--- Check Plugin Version
function Plugin:CheckVersion()
  if not self.Version then
    Logger.Warning("Plugin::Version::NoVersionDefined", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")
    return
  end
  if not self.Github then
    Logger.Warning("Plugin::Version::NoGithubDefined", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")
    return
  end

  local corePlugin = PluginManager.Get("stax-core")

  if not corePlugin then
    Logger.Error("Plugin::LoadLocale::FailedGetCorePlugin", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")
    return
  end

  if not corePlugin.Config then
    Logger.Warning("Failed to get config", "Couldn't retrieve core plugin config")
    return
  end

  local coreConfig = Class.Init(corePlugin.Config, Config)

  local checkVersion = coreConfig:Get("framework.check_version")

  if not checkVersion then
    Logger.Warning("Version Check", "Disabled")
    return
  end
  
  local url = "https://api.github.com/repos/" .. self.Github.username .. "/" .. self.Github.repository .. "/releases/latest"

  Http.Get(url, { headers = { ["Content-Type"] = "application/json" } }, function (status, text, headers)
    if status ~= 200 then
      Logger.Warning("Version Check", "Couldn't GET github latest release | HTTP ERROR | [STATUS]: " .. status)
      return
    end

    local releaseData = json.decode(text)

    if tostring(self.Version) ~= tostring(releaseData.tag_name) then
      Logger.Warning("Plugin", self.Name .. " | " .. self.ResourceName)
      Logger.Warning("Plugin Outdated", "Current Version: " .. self.Version .. " | Updated Version: " .. releaseData.tag_name)
    else
      Logger.Success("Plugin Version", self.Name .. " is up to date!" .. " Version " .. self.Version)
    end
  end)
end

--- Loads the plugins config
---@return Config | nil
function Plugin:LoadConfig()
  local p = promise.new()

  local configDirectory = GetResourcePath(self.ResourceName) .. "/configs/"
  local files = Directory.Scan(configDirectory)

  if not files then
    Logger.Warning("Plugin::ConfigLoadFailed", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")
    return nil
  end

  if #files < 1 then
    Logger.Warning("Plugin::NoConfigFiles", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")
    return nil
  end

  local generatedConfig = { client = {}, server = {}, shared = {} }

  for a = 1, #files do
    if not string.find(files[a], ".json") then
      break
    end

    local boundry = nil
    local configKey = nil
    local data = LoadResourceFile(self.ResourceName, "/configs/" .. files[a])

    local cfgData = json.decode(data)

    if string.find(files[a], ".client.") then
      boundry = "client"
      configKey = string.gsub(files[a], ".client.json", "")
    elseif string.find(files[a], ".server.") then
      boundry = "server"
      configKey = string.gsub(files[a], ".server.json", "")
    else
      boundry = "shared"
      configKey = string.gsub(files[a], ".json", "")
    end

    if not generatedConfig[boundry][configKey] then
      generatedConfig[boundry][configKey] = cfgData
    else
      for l, _cfg in pairs(cfgData) do
        generatedConfig[boundry][l] = _cfg
      end
    end
  end

  local serverConfig = Config.Generate({ generatedConfig.client, generatedConfig.server, generatedConfig.shared })
  local clientConfig = Config.Generate({ generatedConfig.client, generatedConfig.shared })

  self.Config = Config.Load(serverConfig)
  self.Config.Server = generatedConfig.server
  self.Config.Client = generatedConfig.client
  self.Config.Shared = generatedConfig.shared


  GlobalState[self.ResourceName .. '_configs'] = clientConfig

  Logger.Success("Plugin::LoadedConfig", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")

  p:resolve()

  return Citizen.Await(p)
end

--- Loads the plugins locale language file
function Plugin:LoadLocale()
  local p = promise.new()

  local corePlugin = PluginManager.Get("stax-core")

  if not corePlugin then
    Logger.Error("Plugin::FailedGetCorePlugin", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")
    return
  end

  if not corePlugin.Config then
    Logger.Warning("Failed to get config", "Couldn't retrieve core plugin config")
    return
  end

  local coreConfig = Class.Init(corePlugin.Config, Config)

  local lang = coreConfig:Get("framework.locale")

  if not lang then
    Logger.Error("Plugin::FailedGetLangFromCore", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")
    return
  end

  local locale = LoadResourceFile(self.ResourceName, "/locales/" .. lang .. ".json")

  if not locale then
    Logger.Warning("Plugin::NoLocaleFile", "[(" .. self.ResourceName .. ") " .. self.Name .. "] :: [LANGUAGE]: " .. lang)
    return
  end

  local decodedLocale = json.decode(locale)

  self.Locale = Locale.New(decodedLocale)

  GlobalState[self.ResourceName .. '_locales'] = decodedLocale

  Logger.Success("Plugin::LoadedLocale", "[(" .. self.ResourceName .. ") " .. self.Name .. "]")

  p:resolve()

  return Citizen.Await(p)
end

--- Checks if the plugin has metadata key
---@param key string
---@return boolean
function Plugin:HasKey(key)
  return GetNumResourceMetadata(self.ResourceName, key) > 0
end

--- Gets all metadata by key
---@param key string
---@return table | nil
function Plugin:GetAllByKey(key)
  if not self:HasKey(key) then
    return nil
  end

  local count = GetNumResourceMetadata(self.ResourceName, key)

  local values = {}

  for a = 0, count do
    values[#values + 1] = {
      value = GetResourceMetadata(self.ResourceName, key, a),
      extra = GetResourceMetadata(self.ResourceName, key .. "_extra", a)
    }
  end

  return values
end

--- Checks if the plugin has metadata key
---@param key string
---@return table | nil
function Plugin:GetFirstByKey(key)
  return self:GetAllByKey(key)[1]
end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.Plugin()
    return Plugin
  end
end)