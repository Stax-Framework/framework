local Logger = Stax.Logger()
local String = Stax.String()
local Events = Stax.Events()

---@class CallbackManager
local CallbackManager = {}

--- Creates a callback for the server
---@param name string
---@param callback fun(player: Player, payload: table, send: fun(data: table))
function CallbackManager.ServerCallback(name, callback)
  Stax.ServerOnly(function()
    ---@param player Player
    ---@param ... any
    Events.CreateNetEvent("STAX::Core::Server::Callback::" .. name, function (player, responseId, ...)
      callback(player, ..., function(data)
        local pack = msgpack.pack(data)

        print('Server Callback Player Handle: ' .. tostring(player.Handle))

        Events.FireClient("STAX::Core::Server::Callback::Response::" .. name .. "::" .. responseId, player.Handle, pack)
      end)
    end)
  end)
end

--- Creates a callback for the client
---@param name string
---@param callback fun(payload: table, send: fun(data: table))
function CallbackManager.ClientCallback(name, callback)
  Stax.ClientOnly(function()
    ---@param ... any
    Events.CreateNetEvent("STAX::Core::Client::Callback::" .. name, function(...)
      callback(..., function (data)
        local pack = msgpack.pack(data)

        Events.FireServer("STAX::Core::Client::Callback::Response::" .. name, pack)
      end)
    end)
  end)
end

--- Fires a server callback where the server returns results
---@param name string
---@param payload any
---@param callback fun(...)
function CallbackManager.FireServer(name, payload, callback)
  Stax.ServerOnly(function()
    local cbResultEvent = nil

    local responseId = String.Random(5)
    local pack = msgpack.pack(payload)

    Events.FireServer("STAX::Core::Server::Callback::" .. name, responseId, pack)

    cbResultEvent = Events.CreateNetEvent("STAX::Core::Server::Callack::Response::" .. name .. "::" .. responseId, function(package)
      local unpack = msgpack.unpack(package)

      callback(unpack)

      if cbResultEvent then
        RemoveEventHandler(cbResultEvent)
      end
    end)
  end)
end

--- Fires a server callback where the server returns results
---@param name string
---@param source string
---@param payload any
---@param callback fun(...)
function CallbackManager.FireClient(name, source, payload, callback)
  Stax.ClientOnly(function()
    local cbResultEvent = nil

    local responseId = String.Random(5)
    local pack = msgpack.pack(payload)

    Events.FireClient("STAX::Core::Client::Callback::" .. name, source, responseId, pack)

    cbResultEvent = Events.CreateNetEvent("STAX::Core::Client::Callback::Result" .. name .. "::" .. responseId, function (package)
      local unpack = msgpack.unpack(package)
      
      callback(unpack)

      if cbResultEvent then
        RemoveEventHandler(cbResultEvent)
      end
    end)
  end)
end

exports("CallbackManager_ServerCallback", CallbackManager.ServerCallback)
exports("CallbackManager_ClientCallback", CallbackManager.ClientCallback)
exports("CallbackManager_FireServer", CallbackManager.FireServer)
exports("CallbackManager_FireClient", CallbackManager.FireClient)
