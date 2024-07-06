---@class PluginData
---@field public Key string
---@field public Name string
---@field public Description string
---@field public Version string
local PluginData = {
    Key = "Default_Plugin_Key",
    Name = "Default_Plugin_Name",
    Description = "N/A",
    Version = "N/A"
}

---@class Plugin
---@field public COMPONENT ComponentDetails
---@field public Resource string
---@field public Data PluginData
---@field public Directory Directory | nil
---@field public Logger Logger | nil
local Plugin = {
    COMPONENT = Stax.Component.Init("Plugin", { "Directory", "Logger" }),
    Resource = "Default_Resource_Name",
    Data = PluginData,

    --- IMPORTS
    Directory = nil,
    Logger = nil
}
Plugin.__index = Plugin

--- Creates a new plugin instance
---@param resource string
---@return Plugin | nil
function Plugin.New(resource)
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

        local loaded = promise.new()

        Plugin.Load(newPlugin, function(configs, locales)
            newPlugin.Config = configs
            newPlugin.Locale = locales
            loaded:resolve(true)
        end)

        if loaded then
            local started = Plugin.Start(newPlugin)

            if not started then return nil end
        end
    end)

    return newPlugin
end

---@param self Plugin
---@param results fun(configs: table, locales: table)
function Plugin.Load(self, results)
    local p = promise.new()

    local configs = Plugin.FetchConfigs(self)

    if not configs then return p:reject(false) end

    local locales = Plugin.FetchLocales(self)

    if not locales then return p:reject(false) end

    if configs and locales then
        results(configs, locales)
        p:resolve(true)
    end

    return Citizen.Await(p)
end

---@param self Plugin
function Plugin.Init(self)
    local p = promise.new()

    p:resolve(true)
    
    return Citizen.Await(p)
end

function Plugin.Start(self)

end

---@return boolean
function Plugin.FetchInfo(self)
    local function HasKey(key)
        return GetNumResourceMetadata(self.Resource, key) > 0
    end

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

function Plugin.FetchLocales(self, locale)
    local directory = GetResourcePath(self.Resource) .. "/locales/"

    local files = self.Directory.Scan(directory)
    local locales = nil
  
    if not files then
      Plugin.Logger.Warning("Plugin.FetchLocales", "No locales directory found for " .. self.Data.Name .. " (" .. self.Resource .. ")")
    end
  
    if #files < 1 then
      Plugin.Logger.Warning("Plugin.FetchLocales", "No locales found for " .. self.Data.Name .. " (" .. self.Resource .. ")")
    end
  
    if files then
        locales = {}

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

    if locales then
        Stax.FireEvent("STAX::SHARED::LoadLocales", locales)
        Plugin.Logger.Success("Plugin.FetchLocales", "Fetched Locales")
    else
        Plugin.Logger.Error("Plugin.FetchLocales", "Failed to fetch locales!")
    end
  
    return locales
end

function Plugin.FetchConfigs(self)
    local function _configScope(file)
        if string.find(file, ".client.") then
            return "client"
        elseif string.find(file, ".server.") then
            return "server"
        end

        return "shared"
    end

    local directory = GetResourcePath(self.Resource) .. "/configs/"
    local files = Plugin.Directory.Scan(directory)
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

            local scope = _configScope(files[a])

            if type(data) == "table" then
                if not configs[scope] then
                    configs[scope] = {}
                end

                configs[scope][fileKey] = data
            end
        end
    end

    Stax.FireEvent("STAX::SHARED::LoadConfigs", configs)

    if configs then
        Stax.FireEvent("STAX::SHARED::LoadConfigs", configs)
        Plugin.Logger.Success("Plugin.FetchConfigs", "Fetched Configs")
    else
        Plugin.Logger.Error("Plugin.FetchConfigs", "Failed to fetch configs!")
    end

    return configs
end

Stax.Component.Register(Plugin, function(components)
    Plugin.Directory = components.Directory
    Plugin.Logger = components.Logger
end)