local String = Stax.String()
local Table = Stax.Table()

---@class Config
---@field private Storage table
---@field public Shared table
---@field public Server table
---@field public Client table
local Config = {}
Config.__index = Config

--- Create a new instance of StaxConfig but loads the config directly
---@param cfg table
---@return Config
function Config.Load(cfg)
  local config = {}
  setmetatable(config, Config)

  config.Storage = cfg

  return config
end

--- Gets a config from a keys path
---@param key string | nil
---@return any
function Config:Get(key)
  if not key then return self.Storage end

  local path = String.Split(key, ".")

  local storage = Table.Copy(self.Storage)

  if not storage then return nil end

  for _, v in pairs(path) do
    if (storage[v]) then
      storage = storage[v]
    end
  end

  return storage
end

function Config.Generate(scopes)
  local storage = {}

  for _, scope in pairs(scopes) do
    for key, data in pairs(scope) do
      if storage[key] then
        for dataKey, dataValue in pairs(data) do
          storage[key][dataKey] = dataValue
        end
        break
      end

      storage[key] = data
    end
  end

  return storage
end

--- [ SHARED ]
function Stax.Config()
  return Config
end