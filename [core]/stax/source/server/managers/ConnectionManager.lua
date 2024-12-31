---@type Logger
local _Logger
---@type PlayerManager
local _PlayerManager
---@type StaxPlayer
local _Player

local _ConnectingStates = {
    ["connecting"] = 1,
    ["queued"] = 1,
    ["loading"] = 1,
    ["loaded"] = 2
}

local Manager = {
    QueuedPlayers = {}
}

local function _connecting(playerName, setKickReason, deferrals)
    Citizen.Wait(1)

    local src = tostring(source)
    local playerInstance = _Player.new(src)

    deferrals.update("Initializing Player Instance!")

    if playerInstance then
        deferrals.update("Player Instance Initialized!")
    else
        deferrals.done("Couldn't initialize player instance!")
    end

    -- TODO: ADD CONNECTION LOGIC CHECKS
    -- TODO: ADD QUEUE CONNECTION SYSTEM

    print(playerName .. " is connecting to the server!")

    deferrals.done("Stopping you from joining here...")
end

---@param newSource string
---@param oldSource string
local function _joined(newSource, oldSource)
    local src = newSource

    print(GetPlayerName(src) .. " is joining the server!")


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