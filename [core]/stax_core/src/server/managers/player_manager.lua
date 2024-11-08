---@class StaxPlayerManagerSingleton
---@field Players { [number]: StaxPlayer }
---@field Logger StaxLogger | nil
local Manager = {
  Players = {},
  Logger = nil
}

local function _add(player)
  table.insert(Manager.Players, player)

  Manager.Logger.Success("PlayerManager", "Added player " .. player.Name .. " to the player manager!")
end

local function _remove(index)
  table.remove(Manager.Players, index)

  Manager.Logger.Success("PlayerManager", "Removed player " .. Manager.Players[index].Name .. " to the player manager!")
end

local function _fetch(handle)
  if not handle then
    return Manager.Players
  end

  return Manager.Players[handle]
end

Stax.Ready(function()
  Manager.Logger = Stax.RequireAsync("Logger")
end)

--- STAX EXPORTS
Stax.Export("PlayerManager_Add", _add)
Stax.Export("PlayerManager_Remove", _remove)
Stax.Export("PlayerManager_Fetch", _fetch)