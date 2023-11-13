local Events = Stax.Events()
local String = Stax.String()
local DateTime = Stax.DateTime()
local Player = Stax.Player()
local Class = Stax.Class()
local PlayerManager = Stax.PlayerManager()
local ServerManager = Stax.ServerManager()
local CBManager = Stax.CallbackManager()
local CoreEvents = Stax.DefinedEvents.Core()

--- EVENTS
local BaseEvents = CoreEvents.Server.BASE
local FrameworkEvents = CoreEvents.Server.FRAMEWORK

CBManager.ServerCallback("hello_world", function (player, payload, send)
  print(json.encode(payload, { indent = true }))

  send({"Testing This Result?"})
end)

--- Watches for players to start connecting to the server
---@param player Player
---@param deferrals table
Events.CreateEvent(BaseEvents.PlayerConnecting, function(player, deferrals)
  -- local src = tonumber(source)

  -- if src then
  --   local player = PlayerManager.Get(src)
  --   if player then
  --     player = Class.Init(player, Player)
  --   end
  -- end

  -- local supportLink = Stax.Config:Get("community.support_link")

  -- --- Holding user here to check their user data
  -- deferrals.defer()

  -- --- Kicks players during server startup
  -- if not ServerManager:IsServerReady() then
  --   deferrals.done("Server not ready.. Please wait..")
  --   return
  -- end

  -- local serverIdentifier = Stax.Config:Get("framework.identifier")
  -- local identifier = player:GetIdentifier(serverIdentifier)

  -- if not identifier then
  --   deferrals.done(String.Interpolate(Stax.Locale:Get("connecting_identifier_not_found"), { support = supportLink }))
  --   return
  -- end

  -- local loadedUser = player:LoadUser()

  -- if not loadedUser then
  --   deferrals.done(String.Interpolate(Stax.Locale:Get("connecting_unable_to_implement_user"), { support = supportLink }))
  --   return
  -- end

  -- deferrals.update(Stax.Locale:Get("connecting_bans_checked"))

  -- Citizen.Wait(500)

  -- deferrals.update(String.Interpolate(Stax.Locale:Get("connecting_server_stats"), {
  --   bans = #bans,
  --   kicks = #kicks,
  --   warns = #warns
  -- }))
  
  -- local DisableQueue = Config:Get("queue.disable")

  -- if not DisableQueue then
  --   local CanPlayerJoin = StaxQueueManager:CanPlayerJoin()

  --   if not CanPlayerJoin then
  --     StaxQueueManager:Insert(source, deferrals.update, function()
  --       StaxQueueManager:PlayerJoined()
  --       deferrals.done("Player left the queue and is now connecting!")
  --     end)
  --   else
  --     StaxQueueManager:PlayerJoined()
  --   end
  -- end

  -- deferrals.done("Dev-Stopping-Connections-Here")
end)

--- Watches for when the player is joining
---@param source string
---@param oldSource string
Events.CreateEvent(BaseEvents.PlayerJoining, function(source, oldSource)
  PlayerManager.Add(Player._init(source))
end)

--- Watches for when this resource starts
---@param resource string
Events.CreateEvent(BaseEvents.OnResourceStart, function(resource)
  if GetCurrentResourceName() ~= resource then return end
  SetGameType("Stax Server Framework")
  SetMapName("STAX")
end)

--- Watches for when a player is dropped from the server
---@param player Player
---@param reason string
Events.CreateEvent(BaseEvents.PlayerDropped, function(player, reason)
  PlayerManager.Remove(player)
  -- StaxQueueManager:PlayerLeft()
  Events.Fire(FrameworkEvents.PlayerLeft, player)
end)