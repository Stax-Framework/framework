---@class EventsSingleton
local Events = {}

--- Creates a local event handler
---@param event string
---@param callback fun(...: any)
function Events.CreateEvent(event, callback)
  AddEventHandler(event, function(...)
    callback(...)
  end)
end

-- Creates a networked event handler
---@param event string
---@param callback fun(...: any)
function Events.CreateNetEvent(event, callback)
  local player = nil
  local isServer = false

  if IsDuplicityVersion() then
    isServer = true
    player = tonumber(source)

    if player then
      local PlayerManager = Stax.PlayerManager()
      local foundPlayer = PlayerManager.Get(player)

      if foundPlayer then
        player = foundPlayer
      end
    end
  end

  return RegisterNetEvent(event, function(...)
    if isServer then
      callback(player, ...)
    else
      callback(...)
    end
  end)
end

--- Fires an event that has been registered
---@param event string
---@param ... any
---@return any
function Events.Fire(event, ...)
  TriggerEvent(event, ...)
end

--- Fires a client event that has been registered
---@param event string
---@param player any
---@param ... any
function Events.FireClient(event, player, ...)
  if IsDuplicityVersion() then return end
  TriggerClientEvent(event, player, ...)
end

--- Fires a server event that has been registered
---@param event string
---@param ... any
function Events.FireServer(event, ...)
  if not IsDuplicityVersion() then return end
  TriggerServerEvent(event, ...)
end

--- [ SHARED ]
function Stax.Events()
  return Events
end