---@type Logger
local _Logger

local Manager = {
    Players = {}
}

---@param player StaxPlayer
local function _add(player)
    if Manager.Players[player.source] then
        _Logger.Error("PlayerManager", "Couldn't add player [" .. player.source .. "] | " .. player.name .. " because they already exist!")
        return
    end

    table.insert(Manager.Players, player)

    _Logger.Success("PlayerManager", "Added player [" .. player.source .. "] | " .. player.name .. " to the manager!")
end

---@param playerId number
local function _remove(playerId)
    if not Manager.Players[playerId] then
        _Logger.Error("PlayerManager", "Couldn't add player [" .. playerId .. "] | because they don't exist in the manager!")
        return
    end

    table.remove(Manager.Players, playerId)
end

---@param playerId number
local function _fetch(playerId)
    local player = Manager.Players[playerId]

    if not player then
        _Logger.Error("PlayerManager", "Couldn't add player [" .. playerId .. "] | because they don't exist in the manager!")
        return nil
    end

    return player
end

local function _loadComponents()
    _Logger = Stax.Component.FetchAsync("Logger")
end

---[[
--- EVENTS
---]]
Stax.Event("ComponentLoader", "Ready").create(false, _loadComponents)

---[[
--- EXPORTS
---]]
Stax.Export("PlayerMangaer_Add", _add)
Stax.Export("PlayerManger_Remove", _remove)
Stax.Export("PlayerManager_Fetch", _fetch)