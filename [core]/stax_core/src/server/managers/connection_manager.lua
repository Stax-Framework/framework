---@class StaxConnectionManagerSingleton
---@field PlayerManager StaxPlayerManager | nil
---@field Player StaxPlayer | nil
local Manager = {
    PlayerManager = nil,
    Player = nil,

    CanConnect = false
}

function Manager.Connecting(playerName, setKickReason, deferrals)
    deferrals.defer()

    if not Manager.CanConnect then
        deferrals.done("Please wait to connect... The server just started!")
        return
    end

    local playerSource = tonumber(source)

    if playerSource then
        -- PlayerManager.Add()

        Manager.Player.Create(playerSource)
        deferrals.done("Created player kicking for testing")
    else
        deferrals.done("Unable to convert source to number")
    end
end

function Manager.Authenticating()

end

function Manager.Initializing()

end

function Manager.Connect()

end

Stax.Ready(function()
    Manager.PlayerManager = Stax.RequireAsync("PlayerManager")
    Manager.Player = Stax.RequireAsync("Player")

    AddEventHandler("playerConnecting", Manager.Connecting)

    Citizen.CreateThread(function()
        Citizen.Wait(5000)
        Manager.CanConnect = true
    end)
end)