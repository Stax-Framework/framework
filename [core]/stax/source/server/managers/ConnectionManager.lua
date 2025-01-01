---[[
--- COMPONENTS
---]]
---@type Logger
local _Logger
---@type PlayerManager
local _PlayerManager
---@type StaxPlayer
local _Player

---[[
--- CONFIGS
---]]
local ServerWhitelisted = Stax.FetchConfig("Server.Whitelisted")

local _ConnectingStates = {
    ["connecting"] = 1,
    ["queued"] = 1,
    ["loading"] = 1,
    ["loaded"] = 2
}

local Manager = {
    QueuedPlayers = {}
}

local function _connecting(source, playerName, setKickReason, deferrals)
    Citizen.Wait(1)

    local playerInstance = _Player.new(source)

    deferrals.update("Initializing Player Instance!")

    Citizen.Wait(500)

    if not playerInstance then
        deferrals.done("Couldn't initialize player instance!")
        return
    end

    if playerInstance then
        deferrals.update("Player Instance Initialized!")
    else
        deferrals.done("Couldn't initialize player instance!")
    end

    Citizen.Wait(500)

    -- TODO: ADD WHITELIST LOGIC CHECKS
    if ServerWhitelisted then
        deferrals.update("Server is whitelisted... Checking your whitelist status!")

        Citizen.Wait(500)

        if playerInstance.whitelisted then
            deferrals.update("Whitelist check passed!")
        else
            deferrals.done("You are not whitelisted to play on the server :(")
        end
    end


    -- TODO: ADD BAN CHECK LOGIC
    deferrals.update("Checking Queue System... Logic doesn't exist yet.. Passing..")

    Citizen.Wait(500)

    -- TODO: ADD QUEUE CONNECTION SYSTEM
    deferrals.update("Checking Queue System... Logic doesn't exist yet.. Passing..")

    Citizen.Wait(500)

    print(playerName .. " is connecting to the server!")

    deferrals.done("You can join the server but nah still deving XD")
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
Stax.Event("playerConnecting").create(false, function(playerName, setKickReason, deferrals)
    local src = source

    _connecting(src, playerName, setKickReason, deferrals)
end)

Stax.Event("playerJoining").create(false, _joined)
Stax.Event("ComponentLoader", "Ready").create(false, _loadComponents)