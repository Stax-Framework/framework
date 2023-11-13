---@class Stax
---@field Config Config | nil
---@field Locale Locale | nil
---@field Roleplay table
---@field DeadZone table 
---@field FirstResponse table
Stax = {
  DefinedEvents = {},
  Config = nil,
  Locale = nil
}

--- Initializes Stax globally into your plugin
function Stax.Init()
  local Config = Stax.Config()
  local Locale = Stax.Locale()

  Config.Listen(function(config)
    Stax.Config = config
  end)

  Locale.Listen(function(locale)
    Stax.Locale = locale
  end)
end

--- Only runs the callback code if its ran on the server
---@param callback function
---@return any
function Stax.ServerOnly(callback)
  if IsDuplicityVersion() then
    return callback()
  end
end

--- Only runs the callback code if its ran on the client
---@param callback function
---@return any
function Stax.ClientOnly(callback)
  if not IsDuplicityVersion() then
    return callback()
  end
end

--- Only runs if the game the script is running on matches the one you define
---@param game "fivem" | "redm"
---@param callback function
---@return any
function Stax.RunGameOnly(game, callback)
  if GetGameName() == game then
    return callback()
  end
end