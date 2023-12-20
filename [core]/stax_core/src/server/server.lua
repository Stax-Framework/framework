---@type StaxPlayer
local Player = Stax.Require("Player")

--- Captures when the player starts connecting
---@param playerName string
---@param setKickReason fun(reason: string)
---@param deferrals { defer: fun(), update: fun(message: string), presentCard: fun(card: table | string, cb?: fun(data: table, rawData: string)), done: fun(failReason: string) }
local function OnPlayerConnecting(playerName, setKickReason, deferrals)
  local src = source
  -- local _player = Player.Fetch(src)

  deferrals.defer()

  deferrals.update("Starting connection to STAX")

  deferrals.done("Stopping Connections Here... Dev Purproses...")

  TriggerEvent("Stax::Server::PlayerConnecting")
end

local function OnPlayerConnected()
  local src = source

  TriggerEvent("Stax::Server::PlayerConnected")
end

local function OnPlayerDropped(reason)
  local src = source

  TriggerEvent("Stax::Server::PlayerDropped")
end

AddEventHandler("playerConnecting", OnPlayerConnecting)
AddEventHandler("playerJoining", OnPlayerConnected)
AddEventHandler("playerDropped", OnPlayerDropped)