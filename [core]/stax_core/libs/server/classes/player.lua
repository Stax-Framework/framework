local Events = Stax.Events()
local String = Stax.String()
local User = Stax.User()

---@class Player
---@field public Handle number Players server id
---@field public Name string Players server name
---@field public Identifiers string[] Table of players available identifiers
---@field public User User User instance for this player
local Player = {}
Player.__index = Player

--- Creates new instance of Player
---@param handle string
---@return Player
function Player._init(handle)
  local newPlayer = {}
  setmetatable(newPlayer, Player)

  local playerName = GetPlayerName(handle)
  local validatedName = String.StripInvalid(playerName)

  newPlayer.Handle = handle
  newPlayer.Name = validatedName
  newPlayer.Identifiers = newPlayer:GetIdentifiers()
  newPlayer.User = nil

  return newPlayer
end

--- Loads the user into the player instance
---@return boolean
function Player:LoadUser()
  local user = User.Create(self)

  if user then
    self.User = user
    return true
  end

  return false
end

---@return string[]
function Player:GetIdentifiers()
  local amount = GetNumPlayerIdentifiers(self.Handle)
  local identifiers = {}

  for a = 0, amount do
    identifiers[#identifiers + 1] = GetPlayerIdentifier(self.Handle, a)
  end

  return identifiers
end

--- Gets a specified type of player identifier if it exists
---@param identType string
---@return string | nil
function Player:GetIdentifier(identType)
  for a = 1, #self.Identifiers do
    if string.find(self.Identifiers[a], identType, 1) then
      return self.Identifiers[a]
    end
  end
  return nil
end

--- Kicks the player from the server
---@param admin Player
---@param reason string
function Player:Kick(admin, reason)
  DropPlayer(self.Handle, reason)
end

--- Bans the player from the server
---@param admin Player
---@param reason string
---@param time table
function Player:Ban(admin, reason, time)
  DropPlayer(self.Handle, reason)
end

--- Issues the player a warning
---@param admin Player
---@param reason string
function Player:Warn(admin, reason)
  DropPlayer(self.Handle, reason)
end

--- Fires an event on this player
---@param event string
---@param ... any
function Player:FireEvent(event, ...)
  Events.FireClient(event, self.Handle, ...)
end

--- Gets if the player is muted in Mumble
---@return boolean
function Player:IsMuted()
  return MumbleIsPlayerMuted(self.Handle)
end

--- Sets if the player is muted in Mumble
---@param muted boolean
function Player:SetMuted(muted)
  MumbleSetPlayerMuted(self.Handle, muted)
end

--- Checks if the player is allowed to join the server
function Player:IsAllowlisted()

end

--- Checks if the user has a role
---@param role string
function Player:HasRole(role)

end

--- Gets users discord roles
function Player:GetDiscordRoles()

end

Stax.ServerOnly(function()
  --- [ SERVER ]
  function Stax.Player()
    return Player
  end
end)