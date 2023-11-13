local Events = {
  Server = {
    BASE = {
      EntityCreated = "STAX::Core::Server::EntityCreated",
      EntityCreating = "STAX::Core::Server::EntityCreating",
      EntityRemoved = "STAX::Core::Server::EntityRemoved",
      OnResourceListRefresh = "STAX::Core::Server::OnResourceListRefresh",
      OnResourceStart = "STAX::Core::Server::OnResourceStart",
      OnServerResourceStart = "STAX::Core::Server::OnServerResourceStart",
      OnResourceStarting = "STAX::Core::Server::OnResourceStarting",
      OnResourceStop = "STAX::Core::Server::OnResourceStop",
      OnServerResourceStop = "STAX::Core::Server::OnServerResourceStop",
      PlayerConnecting = "STAX::Core::Server::PlayerConnecting",
      PlayerEnteredScope = "STAX::Core::Server::PlayerEnteredScope",
      PlayerJoining = "STAX::Core::Server::PlayerJoining",
      PlayerLeftScope = "STAX::Core::Server::PlayerLeftScope",
      PTFX = "STAX::Core::Server::OnPTFXEvent",
      RemoveAllWeapons = "STAX::Core::Server::OnRemoveAllWeapons",
      OnStartProjectile = "STAX::Core::Server::OnStartProjectile",
      PlayerDropped = "STAX::Core::Server::PlayerDropped"
    },

    PLUGIN = {
      Mounted = "STAX::Core::Server::PluginMounted",
      UnMounted = "STAX::Core::Server::PluginUnMounted"
    },

    SAVE = {
      AutoSave = "STAX::Core::Server::AutoSave"
    },

    FRAMEWORK = {
      PlayerLeft = "STAX::Core::Server::PlayerLeft"
    }
  },
  Client = {
    BASE = {
      CEventName = "STAX::Core::Client::CEventName",
      EntityDamaged = "STAX::Core::Client::EntityDamaged",
      GameEvent = "STAX::Core::Client::GameEvent",
      MumbleConnected = "STAX::Core::Client::MumbleConnected",
      MumbleDisconnected = "STAX::Core::Client::MumbleDisconnected",
      OnClientResourceStart = "STAX::Core::Client::OnClientResourceStart",
      OnClientResourceStop = "STAX::Core::Client::OnClientResourceStop",
      OnResourceStart = "STAX::Core::Client::OnResourceStart",
      OnResourceStarting = "STAX::Core::Client::OnResourceStarting",
      OnResourceStop = "STAX::Core::Client::OnResourceStop",
      PopulationPedCreating = "STAX::Core::Client::PopulationPedCreating"
    }
  },
  Shared = {}
}


Stax.ServerOnly(function()
  function Stax.DefinedEvents.Core()
    return Events
  end
end)