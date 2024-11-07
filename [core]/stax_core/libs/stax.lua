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

  TriggerEvent("Stax::Shared::GetComponent", name, function(component)
    return p:resolve(component)
  end)

  return Citizen.Await(p)
end

--- Fetches a components data asynchronously
---@async
---@return Promise<StaxComponentDetails>
function StaxComponent.FetchDataAsync(name)
  local p = promise.new()

  TriggerEvent("Stax::Shared::GetComponentDetails", name, function(component)
    return p:resolve(component)
  end)

  return Citizen.Await(p)
end

--- Fetches a component asynchronously
---@generic T
---@param name string Component Name
---@param result fun(component: T)
function StaxComponent.Fetch(name, result)
  TriggerEvent("Stax::Shared::GetComponent", name, function(component)
    result(component)
  end)
end

--- Fetches a components data asynchronously
---@param name string Component Name
---@param result fun(component: StaxComponentDetails)
function StaxComponent.FetchData(name, result)
  TriggerEvent("Stax::Shared::GetComponentDetails", name, function(details)
    result(details)
  end)
end

--- Registers a component
---@param component any
---@param request fun(components: table)?
function StaxComponent.Register(component, request)
  assert(component.COMPONENT ~= nil, "Failed to register component because ^1`COMPONENT`^0 is not defined")

  AddEventHandler("Stax::Shared::GetComponentDetails", function(name, next)
    if name ~= component.COMPONENT.NAME then return end
    next(component.COMPONENT)
  end)

  AddEventHandler("Stax::Shared::GetComponent", function(name, next)
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

    if Stax.Server() then
      TriggerEvent("Stax::Server::ResourceStarted", resource)
    else
      TriggerEvent("Stax::Client::ResourceStarted", resource)
    end
  end

  if Stax.Server() then
    AddEventHandler("onServerResourceStart", HandleResourceStart)
  else
    AddEventHandler("onClientResourceStart", HandleResourceStart)
  end

  local configLoaded = false
  local localeLoaded = false

  Stax.LoadConfig(self, function()
    TriggerEvent("Stax::Shared::ConfigsLoaded")
    configLoaded = true
  end)

  Stax.LoadLocale(self, function()
    TriggerEvent("Stax::Shared::LocalesLoaded")
    localeLoaded = true
  end)

  Citizen.CreateThread(function()
    repeat
      Citizen.Wait(1000)
    until configLoaded == true and localeLoaded == true

    TriggerEvent("Stax::Shared::Ready")
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
      RemoveEventHandler(event)
      loaded()
    end
  end

  if Stax.Server() then
    event = AddEventHandler("Stax::Shared::LoadConfigs", _load)
  else
    event = RegisterNetEvent("Stax::Shared::LoadConfigs", _load)
  end
end

function Stax.LoadLocale(self, loaded)
  local event

  local function _load(locales)
    Stax.Locale = StaxLocale.Init(locales)

    if event then
      RemoveEventHandler(event)
      loaded()
    end
  end

  if Stax.Server() then
    event = AddEventHandler("Stax::Shared::LoadLocales", _load)
  else
    event = RegisterNetEvent("Stax::Shared::LoadLocales", _load)
  end
end

function Stax.OnConfigsLoaded(callback)
  AddEventHandler("Stax::Shared::ConfigsLoaded", callback)
end

function Stax.OnLocalesLoaded(callback)
  AddEventHandler("Stax::Shared::LocalesLoaded", callback)
end

function Stax.Ready(callback)
  AddEventHandler("Stax::Shared::Ready", callback)
end

Stax.Init(Stax)