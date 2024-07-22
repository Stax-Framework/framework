---@class StaxPlayerManagerSingleton
---@field Players { [number]: StaxPlayer }
local Manager = {
  Players = {}
}

local function _add(player)
  table.insert(Manager.Players, player)
end

local function _remove(index)
  table.remove(Manager.Players, index)
end

local function _fetch(handle)
  if not handle then
    return Manager.Players
  end

  return Manager.Players[handle]
end

exports("PlayerManager_Add", _add)
exports("PlayerManager_Remove", _remove)
exports("PlayerManager_Fetch", _fetch)