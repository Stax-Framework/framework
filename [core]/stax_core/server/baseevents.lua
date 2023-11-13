local Events = Stax.Events()
local CoreEvents = Stax.DefinedEvents.Core()
local BaseEvents = CoreEvents.Server.BASE

Events.CreateEvent("entityCreated", function(handle)
  Events.Fire(BaseEvents.EntityCreated, handle)
end)

Events.CreateEvent("entityCreating", function(handle)
  Events.Fire(BaseEvents.EntityCreating, handle)
end)

Events.CreateEvent("entityRemoved", function(handle)
  Events.Fire(BaseEvents.EntityRemoved, handle)
end)

Events.CreateEvent("onResourceListRefresh", function(handle)
  Events.Fire(BaseEvents.OnResourceListRefresh, handle)
end)

Events.CreateEvent("onResourceStart", function(resource)
  Events.Fire(BaseEvents.OnResourceStart, resource)
end)

Events.CreateEvent("onResourceStarting", function(resource)
  Events.Fire(BaseEvents.OnResourceStarting, resource)
end)

Events.CreateEvent("onResourceStop", function(resource)
  Events.Fire(BaseEvents.OnResourceStop, resource)
end)

Events.CreateEvent("onServerResourceStart", function(resource)
  Events.Fire(BaseEvents.OnServerResourceStart, resource)
end)

Events.CreateEvent("onServerResourceStop", function(resource)
  Events.Fire(BaseEvents.OnServerResourceStop, resource)
end)

Events.CreateEvent("playerConnecting", function(playerName, setKickReason, deferrals)
  Events.Fire(BaseEvents.PlayerConnecting, playerName, setKickReason, deferrals)
end)

Events.CreateEvent("playerEnteredScope", function(data)
  Events.Fire(BaseEvents.PlayerEnteredScope, data)
end)

Events.CreateEvent("playerJoining", function(source, oldSource)
  Events.Fire(BaseEvents.PlayerJoining, source, oldSource)
end)

Events.CreateEvent("playerLeftScope", function(data)
  Events.Fire(BaseEvents.PlayerLeftScope, data)
end)

Events.CreateEvent("ptFxEvent", function(sender, data)
  Events.Fire(BaseEvents.PTFX, sender, data)
end)

Events.CreateEvent("removeAllWeaponsEvent", function(sender, data)
  Events.Fire(BaseEvents.RemoveAllWeapons, sender, data)
end)

Events.CreateEvent("startProjectileEvent", function(sender, data)
  Events.Fire(BaseEvents.OnStartProjectile, sender, data)
end)

Events.CreateEvent("playerDropped", function(reason)
  Events.Fire(BaseEvents.PlayerDropped, source, reason)
end)