local String = Stax.String()
local Table = Stax.Table()

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

function Stax.Locale()
  return Locale
end