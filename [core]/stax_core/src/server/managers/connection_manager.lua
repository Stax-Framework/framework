---@class DeferralType
---@field defer fun()
---@field update fun(message: string)
---@field presentCard fun(card: string | table, callback?: fun(data: table, rawData: string))
---@field done fun(message?: string)
local DeferralType = {
    defer = function() end,
    update = function(message) end,
    presentCard = function(card, callback) end,
    done = function(message) end
}

--card: object | string, cb?: (data: object, rawData: string)

---@class StaxConnectionManagerSingleton
---@field PlayerManager StaxPlayerManager | nil
---@field Player StaxPlayer | nil
---@field Logger StaxLogger | nil
local Manager = {
    ConnectingPlayers = {},
    CanConnect = false,

    PlayerManager = nil,
    Player = nil,
    Logger = nil
}

local ConnectingStates = {
    [1] = "Connecting",
    [2] = "Authenticating",
    [3] = "Initializing",
    [4] = "Joining"
}

--- Connection handler for the playerConnecting event
---@param playerName string
---@param setKickReason fun(reason: string)
---@param deferrals DeferralType
function Manager.Connecting(source, playerName, setKickReason, deferrals)
    deferrals.defer()

    Citizen.Wait(1)

    if not Manager.CanConnect then
        deferrals.done("Please wait to connect... The server just started!")
        return
    end

    if not Manager.ConnectingPlayers[source] then
        Manager.ConnectingPlayers[source] = 1

        deferrals.update("Connecting to the server... Please wait...")

        Citizen.Wait(1000)

        Manager.Authenticating(source, deferrals)
    else
        return
    end

    Manager.Logger.Success("Manager.Connecting", tostring("| PlayerID: " .. source .. " PlayerName: " .. playerName))
end

--- Handles all the authentication logic for the playerConnecting event
---@param source string | number
---@param deferrals DeferralType
function Manager.Authenticating(source, deferrals)
    local playerInstance = Manager.Player.Create(source)

    deferrals.update("Authenticating...")

    Citizen.Wait(1000)

    --- CHECK BANS
    deferrals.update("Checking Bans...")

    Citizen.Wait(1000)

    --- CHECK WHITELIST
    deferrals.update("Checking Whitelist...")

    Citizen.Wait(1000)

    if playerInstance then
        Manager.PlayerManager.Add(playerInstance)

        deferrals.done()

        Manager.ConnectingPlayers[source] = nil
    end
end

--- Join handler for the playerJoining event
---@param source string
---@param oldID string
function Manager.Join(source, oldID)
    Manager.Logger.Success("Manager.Join", tostring("| PlayerId: " .. source .. " | PlayerName: " .. GetPlayerName(source)))
end

Stax.Ready(function()
    Manager.PlayerManager = Stax.RequireAsync("PlayerManager")
    Manager.Player = Stax.RequireAsync("Player")
    Manager.Logger = Stax.RequireAsync("Logger")

    AddEventHandler("playerConnecting", function(playerName, setKickReason, deferrals)
        Manager.Connecting(source, playerName, setKickReason, deferrals)
    end)
    AddEventHandler("playerJoining", function(source, oldId)
        Manager.Join(source, oldId)
    end)

    Citizen.CreateThread(function()
        Citizen.Wait(5000)
        Manager.CanConnect = true
    end)
end)