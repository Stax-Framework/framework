---@type StaxString
local String

---@class StaxConfig
local Config = {}
Config.__index = Config

function Config.Create()
  local newConfig = {}
  setmetatable(newConfig, Config)

  if IsDuplicityVersion() then
    AddEventHandler("Stax::Server::ConfigListen", Config.ListenServer)
  else
    AddEventHandler("Stax::Client::ConfigListen", Config.ListenClient)
  end

  return newConfig
end

function Config.ListenClient()

end

function Config.ListenServer()

end

function Config.Fetch(self)

end