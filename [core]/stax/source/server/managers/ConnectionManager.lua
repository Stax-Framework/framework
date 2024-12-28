---@type Logger
local _Logger
---@type PlayerManager
local _PlayerManager
---@type Player
local _Player

local _ConnectingStates = {
    ["connecting"] = 1,
    ["queued"] = 1,
    ["loading"] = 1,
    ["loaded"] = 2
}

local Manager = {
    Players = {}
}

local function _connecting(playerName, setKickReason, deferrals)
    local src = source

    ---[[
    --- ADD CONNECTION LOGIC CHECKS
    --- ADD QUEUE CONNECTION SYSTEM
    ---]]

    deferrals.done()

    print(playerName .. " is connecting to the server!")
end

---@param newSource string
---@param oldSource string
local function _joined(newSource, oldSource)
    local src = newSource

    print(GetPlayerName(src) .. " is joining the server!")

    local playerInstance = _Player.new(newSource)

    if playerInstance then
        _PlayerManager.Add(playerInstance)
    end
end

local function _loadComponents()
    _Logger = Stax.Component.FetchAsync("Logger")
    _PlayerManager = Stax.Component.FetchAsync("PlayerManager")
    _Player = Stax.Component.FetchAsync("Player")
end

---[[
--- EVENTS
---]]
Stax.Event("playerConnecting").create(false, _connecting)
Stax.Event("playerJoining").create(false, _joined)
Stax.Event("ComponentLoader", "Ready").create(false, _loadComponents)