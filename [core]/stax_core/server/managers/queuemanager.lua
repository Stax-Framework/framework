local String = Stax.String()

---@class QueueManager
local QueueManager = {
  CurrentPlayerCount = 0,
  Queued = {}
}

--- Inserts a player into the connection queue
---@param source number
---@param update function
---@param connect function
function QueueManager:Add(source, update, connect)
  table.insert(self.Queued, { source = source, update = update, connect = connect })
end

--- Removes a player from the connection queue
---@param source number
function QueueManager:Remove(source)
  local slot, player = self:GetPlayerQueue(source)
  table.remove(self.Queued, slot)
  self:UpdatePlayerMessages()
end

--- Gets the player that is in the queue
function QueueManager:GetPlayerQueue(source)
  for k, v in pairs(self.Queued) do
    if v.source == source then
      return k, v
    end
  end
end

function QueueManager:CanPlayerJoin()
  local maxPlayers = Stax.Config:Get("queue.max_server_players")

  if self.CurrentPlayerCount >= maxPlayers then
    return false
  end

  return true
end

--- Updates the players queue placement message
function QueueManager:UpdatePlayerMessages()
  if #self.Queued > 0 then
    for placement, v in pairs(self.Queued) do
      local message = String.Interpolate(Stax.Locale:Get("connecting_queue_placement"), {
        place = placement,
        amount = #self.Queued
      })
      v.update(message)
    end
  end
end

function QueueManager:PlayerJoined()
  self.CurrentPlayerCount = self.CurrentPlayerCount + 1
  self:UpdatePlayerMessages()
end

function QueueManager:PlayerLeft()
  self.CurrentPlayerCount = self.CurrentPlayerCount - 1
  self:UpdatePlayerMessages()
end

Citizen.CreateThread(function()
  while true do
    local playersToRemove = {}

    for _, v in pairs(QueueManager.Queued) do
      local name = GetPlayerName(v.source)

      if not name then
        --- Player has disconnected from the queue
        playersToRemove[#playersToRemove + 1] = v.source
      end
    end

    if #playersToRemove > 0 then
      for a = 1, #playersToRemove do
        QueueManager:Remove(playersToRemove[a])
      end
    end

    QueueManager:UpdatePlayerMessages()

    Citizen.Wait(5000)
  end
end)