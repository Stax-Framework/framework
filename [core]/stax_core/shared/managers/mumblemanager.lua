local Logger = Stax.Logger()

---@class MumbleManager
local MumbleManager = {}

--- Create a permanent voice channel in mumble
---@param id number
function MumbleManager.CreateChannel(id)
  MumbleCreateChannel(id)
end

function MumbleManager.AddVoiceChannelListen(channel) end

function MumbleManager.AddVoiceTargetChannel(target, channel) end

function MumbleManager.AddVoiceTargetPlayer(target, player) end

function MumbleManager.AddVoiceTargetByServerId(target, serverId) end

exports("MumbleManager_CreateChannel", MumbleManager.CreateChannel)