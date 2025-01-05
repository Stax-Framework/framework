---@class Mumble
local Mumble = {
    COMPONENT = Stax.Component.Init("Mumble")
}

--- Starts listening to the specified channel, when available.
---@param channel number
function Mumble.AddChannelListen(channel)
    MumbleAddVoiceChannelListen(channel)
end

--- Adds the specified channel to the target list for the specified Mumble voice target ID.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
---@param channel number A game voice channel ID.
function Mumble.AddTargetChannel(targetId, channel)
    MumbleAddVoiceTargetChannel(targetId, channel)
end

--- Adds the specified player to the target list for the specified Mumble voice target ID.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
---@param player number A game player index.
function Mumble.AddTargetPlayer(targetId, player)
    MumbleAddVoiceTargetPlayer(targetId, player)
end

function Mumble.AddTargetByServerId()

end

function Mumble.ClearChannel()

end

function Mumble.ClearTarget()

end

function Mumble.ClearTargetChannels()

end

function Mumble.ClearTargetPlayers()

end

function Mumble.CreateChannel()

end

function Mumble.DoesChannelExist()

end

function Mumble.GetChannelFromServerId()

end

function Mumble.IsActive()

end

function Mumble.IsConnected()

end

function Mumble.IsPlayerMuted()

end

function Mumble.IsPlayerTalking()

end

function Mumble.RemoveChannelListen()

end

function Mumble.RemoveTargetChannel()

end

function Mumble.RemoveTargetPlayer()

end

function Mumble.RemoveTargetPlayerByServerId()

end

function Mumble.SetActive()

end

function Mumble.SetInputDistance()

end

function Mumble.SetInputIntent()

end

--- Sets the current output distance. The player will be able to hear other players talking within this distance.
---@param distance number
function Mumble.SetOutputDistance(distance)
    MumbleSetAudioOutputDistance(distance)
end

--- `[SERVER ONLY]` | Mutes or unmutes the specified player
---@param player number The player to set the mute state of
---@param toggle boolean Whether to mute or unmute the player
function Mumble.SetPlayerMuted(player, toggle)
    if not Stax.IsServer then
        return
    end

    MumbleSetPlayerMuted(player, toggle)
end

--- Changes the Mumble server address to connect to, and reconnects to the new address.
---@param address string The address of the mumble server.
---@param port number The port of the mumble server.
function Mumble.SetServerAddress(address, port)
    MumbleSetServerAddress(address, port)
end

--- Sets the audio submix ID for a specified player using Mumble 'Native Audio' functionality.
---@param serverId number The player's server ID.
---@param submixId number The submix ID.
function Mumble.SetSubmixForServerId(serverId, submixId)
    MumbleSetSubmixForServerId(serverId, submixId)
end

--- Sets the current Mumble voice proximity
---@param proximity number
function Mumble.SetTalkerProximity(proximity)
    MumbleSetTalkerProximity(proximity)
end

--- Sets the current Mumble voice channel
---@param channel number A game voice channel ID.
function Mumble.SetChannel(channel)
    MumbleSetVoiceChannel(channel)
end

--- Sets the current Mumble voice target ID to broadcast voice to.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive). 0 disables voice targets, and 31 is server loopback.
function Mumble.SetTarget(targetId)
    MumbleSetVoiceTarget(targetId)
end

--- Overrides the output volume for a particular player on Mumble. This will also bypass 3D audio and distance calculations. -1.0 to reset the override.
--- Set to -1.0 to reset the Volume override.
---@param player number A game player index.
---@param volume number The volume, ranging from 0.0 to 1.0 (or above).
function Mumble.SetVolumeOverride(player, volume)
    MumbleSetVolumeOverride(player, volume)
end

--- Overrides the output volume for a particular player with the specified server id and player name on Mumble. This will also bypass 3D audio and distance calculations. -1.0 to reset the override.
---@param serverId number The player's server id.
---@param volume number The volume, ranging from 0.0 to 1.0 (or above).
function Mumble.SetVolumeOverrideByServerId(serverId, volume)
    MumbleSetVolumeOverrideByServerId(serverId, volume)
end

---[[
--- REGISTER COMPONENT
---]]
Stax.Component.Register(Mumble)