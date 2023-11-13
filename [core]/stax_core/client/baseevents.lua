local Events = Stax.Events()
local CoreEvents = Stax.DefinedEvents.Core()
local BaseEvents = CoreEvents.Client.BASE

Events.CreateEvent("CEventName", function (entities, eventEntity, data)
  Events.Fire(BaseEvents.CEventName, entities, eventEntity, data)
end)

Events.CreateEvent("entityDamaged", function(victim, culprit, weapon, baseDamage)
  Events.Fire(BaseEvents.EntityDamaged, victim, culprit, weapon, baseDamage)
end)

Events.CreateEvent("gameEventTriggered", function (name, data)
  Events.Fire(BaseEvents.GameEvent, name, data)
end)

Events.CreateEvent("mumbleConnected", function (address, reconnecting)
  Events.Fire(BaseEvents.MumbleConnected, address, reconnecting)
end)

Events.CreateEvent("mumbleDisconnected", function (address)
  Events.Fire(BaseEvents.MumbleDisconnected, address)
end)