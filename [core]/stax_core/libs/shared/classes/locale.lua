local String = Stax.String()
local Table = Stax.Table()
local Class = Stax.Class()
local Events = Stax.Events()

---@class Locale
---@field private Storage table
local Locale = {}
Locale.__index = Locale

--- Creates a new instance of StaxLocale
---@param locale table
---@return Locale
function Locale.New(locale)
  local newLocale = {}
  setmetatable(newLocale, Locale)

  newLocale.Storage = locale

  return newLocale
end

--- Gets a config from a keys path
---@param key string | nil
---@return any
function Locale:Get(key)
  if not key then return self.Storage end

  local path = String.Split(key, ".")
  local storage = Table.Copy(self.Storage)

  for _, v in pairs(path) do
    storage = storage[v]
  end

  return storage
end

--- Creates a listener for the configs that the framework pushes to the plugins client and server
---@param callback fun(config: Locale)
function Locale.Listen(callback)
  local currentResource = GetCurrentResourceName()
  local isServer = IsDuplicityVersion()

  if isServer then
    Events.CreateEvent("STAX::Core::Shared::LocaleListener", function(resource, locale)
      if currentResource ~= resource then return end
      callback(Class.Init(locale, Locale))
    end)
  else
    Events.CreateNetEvent("STAX::Core::Shared::LocaleListener", function(resource, locale)
      if currentResource ~= resource then return end
      callback(Class.Init(locale, Locale))
    end)
  end
end

function Stax.Locale()
  return Locale
end