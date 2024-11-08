---@class StaxConfig
---@field STORAGE { [string]: table }
local StaxConfig = {
  STORAGE = {}
}
StaxConfig.__index = StaxConfig

function StaxConfig.Init(configs)
  local newConfig = {
    STORAGE = {}
  }

  if configs["server"] then
    for k, v in pairs(configs["server"]) do
      newConfig.STORAGE[k] = v
    end
  end

  if configs["client"] then
    for k, v in pairs(configs["client"]) do
      newConfig.STORAGE[k] = v
    end
  end
  
  if configs["shared"] then
    for k, v in pairs(configs["shared"]) do
      newConfig.STORAGE[k] = v
    end
  end

  for k, v in pairs(configs) do
    if k ~= "shared" and k ~= "client" and k ~= "server" then
      newConfig.STORAGE[k] = v
    end
  end

  setmetatable(newConfig, StaxConfig)

  return newConfig
end

function StaxConfig:Fetch(path)
  --- Splits string into a table based on a seperator
  ---@param passed string
  ---@param sep string
  ---@return table
  local function split(passed, sep)
    if sep == nil then
      sep = "%s"
    end
    local t={}
    for str in string.gmatch(passed, "([^"..sep.."]+)") do
      table.insert(t, str)
    end
    return t
  end

  local function loadStepper(currentData, nextIndex)
    return currentData[nextIndex]
  end

  local result = {}

  if not path then
    return self.STORAGE
  end

  path = split(path, ".")

  if type(path) == "table" then
    local lastStep

    for _, v in pairs(path) do
      local currentStep = loadStepper(self.STORAGE, v)

      if currentStep == nil then
        if lastStep and lastStep[v] then
          return lastStep[v]
        end
      else
        lastStep = currentStep
      end
    end

    result = lastStep
  end

  return result
end

---@class StaxLocale
---@field STORAGE { [string]: table }
local StaxLocale = {
  STORAGE = {}
}
StaxLocale.__index = StaxLocale

function StaxLocale.Init(locales)
  local newLocale = { STORAGE = locales }

  for k, v in pairs(locales) do
    newLocale.STORAGE[k] = v
  end

  setmetatable(newLocale, StaxLocale)

  return newLocale
end

function StaxLocale:Fetch(path)
  --- Splits string into a table based on a seperator
  ---@param passed string
  ---@param sep string
  ---@return table
  local function split(passed, sep)
    if sep == nil then
      sep = "%s"
    end
    local t={}
    for str in string.gmatch(passed, "([^"..sep.."]+)") do
      table.insert(t, str)
    end
    return t
  end

  local function loadStepper(currentData, nextIndex)
    return currentData[nextIndex]
  end

  local result = {}

  if not path then
    return self.STORAGE
  end

  path = split(path, ".")

  if type(path) == "table" then
    local lastStep

    for _, v in pairs(path) do
      local currentStep = loadStepper(self.STORAGE, v)

      if currentStep == nil then
        return lastStep[v]
      else
        lastStep = currentStep
      end
    end

    result = lastStep
  end

  return result
end

---@class StaxComponentDetails
---@field NAME string Component Name
---@field REQUIREMENTS string[]
local StaxComponentDetails = {}

---@class StaxComponent
---@field Details StaxComponentDetails
local StaxComponent = {}

function StaxComponent.Init(name, requirements)
  return {
    NAME = name,
    REQUIREMENTS = requirements or {}
  }
end

--- Fetches a component asynchronously
---@async
---@generic T
---@param name string Component Name
---@return Promise<T>
function StaxComponent.FetchAsync(name)
  local p = promise.new()

  Stax.Fire({ name = "Components", action = "GetComponents" }, function(component)
    return p:resolve(component)
  end)

  return Citizen.Await(p)
end

--- Fetches a components data asynchronously
---@async
---@return Promise<StaxComponentDetails>
function StaxComponent.FetchDataAsync(name)
  local p = promise.new()

  Stax.Fire({ name = "Components", action = "GetDetails" }, function(component)
    return p:resolve(component)
  end)

  return Citizen.Await(p)
end

--- Fetches a component asynchronously
---@generic T
---@param name string Component Name
---@param result fun(component: T)
function StaxComponent.Fetch(name, result)
  Stax.Fire({ name = "Components", action = "GetComponents" }, name, function(component)
    result(component)
  end)
end

--- Fetches a components data asynchronously
---@param name string Component Name
---@param result fun(component: StaxComponentDetails)
function StaxComponent.FetchData(name, result)
  Stax.Fire({ name = "Components", action = "GetDetails" }, name, function(details)
    result(details)
  end)
end

--- Registers a component
---@param component any
---@param request fun(components: table)?
function StaxComponent.Register(component, request)
  assert(component.COMPONENT ~= nil, "Failed to register component because ^1`COMPONENT`^0 is not defined")

  Stax.Event({ name = "Components", action = "GetDetails" }, function(name, next)
    if name ~= component.COMPONENT.NAME then return end
    next(component.COMPONENT)
  end)
  
  Stax.Event({ name = "Components", action = "GetComponent" }, function(name, next)
    if name ~= component.COMPONENT.NAME then return end
    next(component)
  end)

  if #component.COMPONENT.REQUIREMENTS > 0 then
    assert(type(request) == "function", "Register methods requires the 'required' parameter to be a function(components)")

    Citizen.CreateThread(function()
      local requiredComponents = {}

      for _, componentName in pairs(component.COMPONENT.REQUIREMENTS) do
        local fetchedComponent = Stax.RequireAsync(componentName)

        assert(fetchedComponent ~= nil, "Failed trying to fetch component " .. componentName .. " for " .. component.COMPONENT.NAME)

        requiredComponents[componentName] = fetchedComponent
      end

      request(requiredComponents)
    end)
  end

  print("^9[STAX] ^0Component Registered ^0-[ ^8" .. component.COMPONENT.NAME .. " ^0]- ")
end

---@class Stax
---@field _RegisteredComponents { [string]: table }
---@field _Resource string?
Stax = {
  _RegisteredComponents = {},
  _LoadedComponents = {},
  _LastRegisterTimestamp = nil,
  _Resource = nil,

  --- INTERNAL COMPONENTS
  Component = StaxComponent,
  Config = StaxConfig,
  Locale = StaxLocale
}

function Stax.Init(self)
  self._Resource = GetCurrentResourceName()

  print("^9===================================================^0")
  print(" STAX INITIALIZING (^9" .. self._Resource .. "^0)")
  print("^9===================================================^0")

  local function HandleResourceStart(resource)
    if self._Resource ~= resource then return end

    Stax.Fire({ name = "Core", action = "ResourceStarted" }, resource)
  end

  if Stax.Server() then
    Stax.BaseEvent("onServerResourceStart", HandleResourceStart)
  else
    Stax.BaseEvent("onClientResourceStart", HandleResourceStart)
  end

  local configLoaded = false
  local localeLoaded = false

  Stax.LoadConfig(self, function()
    Stax.Fire({ name = "Configs", action = "Loaded" })

    configLoaded = true
  end)

  Stax.LoadLocale(self, function()
    Stax.Fire({ name = "Locales", action = "Loaded" })

    localeLoaded = true
  end)

  Citizen.CreateThread(function()
    repeat
      Citizen.Wait(1000)
    until configLoaded == true and localeLoaded == true

    Stax.Fire({ name = "Core", action = "Ready" })
  end)
end

--- Returns if the the current scope is the server
---@return boolean
function Stax.Server()
  return IsDuplicityVersion()
end

--- Returns if the the current scope is the client
---@return boolean
function Stax.Client()
  return not IsDuplicityVersion()
end

--- Returns if the current game the code is running on is the same as the one you pass
---@param game "fxserver" | "fivem" | "libertym" | "redm"
---@return boolean
function Stax.Game(game)
  return GetGameName() == game
end

--- Registers a new component
---@param component any
---@param required? fun(components: { [string]: any })
function Stax.Register(component, required)
  return Stax.Component.Register(component, required)
end

--- Returns a component from component name
---@param name string
---@generic T
---@return T
function Stax.RequireAsync(name)
  return Stax.Component.FetchAsync(name)
end

--- Returns a component from component name
---@param name string
---@generic T
---@param result fun(component: T)
function Stax.Require(name, result)
  return Stax.Component.Fetch(name, result)
end

function Stax.LoadConfig(self, loaded)
  local event

  local function _load(configs)
    Stax.Config = StaxConfig.Init(configs)

    if event then
      loaded()
      event.remove()
    end
  end

  if Stax.Server() then
    event = Stax.Event({ name = "Configs", action = "Load" }, _load)
  else
    event = Stax.RemoteEvent({ name = "Configs", "Load" }, _load)
  end
end

function Stax.LoadLocale(self, loaded)
  local event

  local function _load(locales)
    Stax.Locale = StaxLocale.Init(locales)

    if event then
      event.remove()
      loaded()
    end
  end

  if Stax.Server() then
    event = Stax.Event({ name = "Locales", action = "Load" }, _load)
  else
    event = Stax.RemoteEvent({ name = "Locales", "Load" }, _load)
  end
end

function Stax.OnConfigsLoaded(callback)
  Stax.Event({ name = "Configs", action = "Loaded" }, callback)
end

function Stax.OnLocalesLoaded(callback)
  Stax.Event({ name = "Locales", "Loaded" }, callback)
end

function Stax.Ready(callback)
  Stax.Event({ name = "Core", action = "Ready" }, callback)
end

function Stax.Export(name, callback)
  return exports(name, callback)
end

function Stax.BaseEvent(event, callback)
  local eventHandler = AddEventHandler(event, callback)

  return {
    remove = function()
      if not eventHandler then return end
      RemoveEventHandler(eventHandler)
    end
  }
end

--- Creates a local event handler
---@param eventData { name: string, action: string }
---@param callback fun(...)
---@return { remove: fun() }
function Stax.Event(eventData, callback)
  local eventName = tostring("Stax::" .. eventData.name .. "::" .. eventData.action)
  local eventHandler = AddEventHandler(eventName, callback)

  return {
    remove = function()
      if not eventHandler then return end
      RemoveEventHandler(eventHandler)
    end
  }
end

--- Fires a local event handler
---@param eventData { name: string, action: string }
---@param ... any
function Stax.Fire(eventData, ...)
  local eventName = tostring("Stax::" .. eventData.name .. "::" .. eventData.action)
  TriggerEvent(eventName, ...)
end

--- REMOTE EVENT | "Stax::Name::Scope::Action"

--- Creates a remote event handler
---@param eventData { name: string, action: string }
---@param callback fun(...)
---@return { remove: fun() }
function Stax.RemoteEvent(eventData, callback)
  local _scope = "Client"

  if Stax.Server() then
    _scope = "Server"
  end

  local eventName = tostring("Stax::" .. eventData.name .. "::" .. _scope .. "::" .. eventData.action)
  RegisterNetEvent(eventName)
  local eventHandler = AddEventHandler(eventName, callback)

  return {
    remove = function()
      RemoveEventHandler(eventHandler)
    end
  }
end

--- Fires a client event from the server
---@param eventData { name: string, action: string }
---@param player number
function Stax.FireClient(eventData, player, ...)
  if Stax.Client() then return end
  local eventName = tostring("Stax::" .. eventData.name .. "::Client::" .. eventData.action)

  TriggerClientEvent(eventName, player, ...)
end

--- Fires a client event from the server on all players
---@param eventData { name: string, action: string }
function Stax.FireAllClients(eventData, ...)
  if Stax.Client() then return end
  local eventName = tostring("Stax::" .. eventData.name .. "::Client::" .. eventData.action)

  TriggerClientEvent(eventName, -1, ...)
end

--- Fires a client event from the server on specified players
---@param eventData { name: string, action: string }
---@param players table<number>
function Stax.FireClientList(eventData, players, ...)
  if Stax.Client() then return end
  local eventName = tostring("Stax::" .. eventData.name .. "::Client::" .. eventData.action)

  for _, player in pairs(players) do
    TriggerClientEvent(eventName, player, ...)
  end
end

--- Fires a server event from the client
---@param eventData { name: string, action: string }
function Stax.FireServer(eventData, ...)
  if Stax.Server() then return end
  local eventName = tostring("Stax::" .. eventData.name .. "::Server::" .. eventData.action)

  TriggerServerEvent(eventName, ...)
end

Stax.Init(Stax)