---@class Mumble
---@field COMPONENT Component
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

--- Adds the specified player to the target list for the specified Mumble voice target ID.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
---@param serverId number The player's server id.
function Mumble.AddTargetByServerId(targetId, serverId)
    MumbleAddVoiceTargetPlayerByServerId(targetId, serverId)
end

--- Clears mumble voice channel
function Mumble.ClearChannel()
    MumbleClearVoiceChannel()
end

--- Clears the target list for the specified Mumble voice target ID.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
function Mumble.ClearTarget(targetId)
    MumbleClearVoiceTarget(targetId)
end

--- Clears channels from the target list for the specified Mumble voice target ID.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
function Mumble.ClearTargetChannels(targetId)
    MumbleClearVoiceTargetChannels(targetId)
end

--- Clears players from the target list for the specified Mumble voice target ID.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
function Mumble.ClearTargetPlayers(targetId)
    MumbleClearVoiceTargetPlayers(targetId)
end

--- Create a permanent voice channel.
---@param id number ID of the channel.
function Mumble.CreateChannel(id)
    MumbleCreateChannel(id)
end

--- Gets the clients speaking proximity
---@return number
function Mumble.GetTalkerProximity()
    return MumbleGetTalkerProximity()
end

--- Returns the mumble voice channel from a player's server id.
---@param serverId number The player's server id.
---@return number
function Mumble.GetChannelFromServerId(serverId)
    return MumbleGetVoiceChannelFromServerId(serverId)
end

--- If the player has their voice chat enabled
---@return boolean # True if the player has enabled voice chat.
function Mumble.IsActive()
    return MumbleIsActive()
end

--- This native will return true if the user succesfully connected to the voice server. If the user disabled the voice-chat setting it will return false.
---@return boolean # True if the player is connected to a mumble server.
function Mumble.IsConnected()
    return MumbleIsConnected()
end

--- Checks if the player is currently muted
---@param playerSrc number The player to get the mute state for
---@return boolean
function Mumble.IsPlayerMuted(playerSrc)
    return MumbleIsPlayerMuted(playerSrc)
end

--- Checks if the player is currently talking
---@param player number The target player.
---@return boolean
function Mumble.IsPlayerTalking(player)
    return MumbleIsPlayerTalking(player)
end

--- Stops listening to the specified channel.
---@param channel number A game voice channel ID.
function Mumble.RemoveChannelListen(channel)
    MumbleRemoveVoiceChannelListen(channel)
end

--- Check whether specified channel exists on the Mumble server.
---@param channel number A game voice channel ID.
---@return boolean # True if the specific channel exists. False otherwise.
function Mumble.DoesChannelExist(channel)
    ---@diagnostic disable-next-line
    return MumbleDoesChannelExist(channel)
end

--- Removes the specified voice channel from the user's voice targets.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
---@param channel number The game voice channel ID to remove from the target.
---@see Opposite https://docs.fivem.net/natives/?_0x4D386C9E
function Mumble.RemoveTargetChannel(targetId, channel)
    MumbleRemoveVoiceTargetChannel(targetId, channel)
end

--- Removes the specified player from the user's voice targets.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
---@param player number The player index to remove from the target.
function Mumble.RemoveTargetPlayer(targetId, player)
    MumbleRemoveVoiceTargetPlayer(targetId, player)
end

--- Removes the specified player from the user's voice targets.
---@param targetId number A Mumble voice target ID, ranging from 1..30 (inclusive).
---@param serverId number The player's server id to remove from the target.
function Mumble.RemoveTargetPlayerByServerId(targetId, serverId)
    MumbleRemoveVoiceTargetPlayerByServerId(targetId, serverId)
end

--- Sets mumble in an activated or deactivated state
---@param state boolean
function Mumble.SetActive(state)
    MumbleSetActive(state)
end

--- Sets the current input distance. The player will be able to talk to other players within this distance.
---@param distance number The input distance.
function Mumble.SetInputDistance(distance)
    MumbleSetAudioInputDistance(distance)
end

---Use this native to disable noise suppression and high pass filters.
---The possible intents for this are as follows (backticks are used to represent hashes):
---@param intentHash string | number `speech` Default Intent | `music` Disable noise suppression and high pass filter
function Mumble.SetInputIntent(intentHash)
    MumbleSetAudioInputIntent(intentHash)
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