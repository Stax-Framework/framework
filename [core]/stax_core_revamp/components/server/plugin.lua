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
local Plugin = {
    COMPONENT = Stax.Component.Init(),
    Resource = "Default_Resource_Name",
    Data = PluginData
}
Plugin.__index = Plugin

---@return Plugin | nil
function Plugin.New(resource)
    local newPlugin = {}
    setmetatable(newPlugin, Plugin)

    newPlugin.Resource = resource
    newPlugin.Data = PluginData
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

function Plugin.FetchLocales()
    print("Fetching Locales")
end

function Plugin.FetchConfigs()
    print("Fetching Configs")
end