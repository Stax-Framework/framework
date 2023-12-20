---@class StaxConfig
---@field STORAGE { [string]: table }
Config = {
  STORAGE = {}
}
Config.__index = Config

function Config.Init(configs)
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

  setmetatable(newConfig, Config)

  return newConfig
end

function Config:Fetch(path)
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

---@class StaxLocale
---@field STORAGE { [string]: table }
Locale = {
  STORAGE = {}
}
Locale.__index = Locale

function Locale.Init(locales)
  local newLocale = { STORAGE = locales }

  for k, v in pairs(locales) do
    newLocale.STORAGE[k] = v
  end

  setmetatable(newLocale, Config)

  return newLocale
end

function Locale:Fetch(path)
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

---@class ComponentDetails
---@field NAME string Components Name
---@field REQUIREMENTS string[]
ComponentDetails = {
  NAME = "Default_Component_Name",
  REQUIREMENTS = {}
}

---@class StaxComponent
Component = {}
Component.__index = Component

--- Fetches a component
---@async
---@param name string Component Name
---@generic T
---@return Promise<T>
function Component.Fetch(name)
  local p = promise.new()

  TriggerEvent("Stax::Shared::GetComponent", name, function(component)
    return p:resolve(component)
  end)

  return Citizen.Await(p)
end

--- Fetches a components data
---@async
---@return Promise<ComponentDetails>
function Component.FetchData(name)
  local p = promise.new()

  TriggerEvent("Stax::Shared::GetComponentDetails", name, function(component)
    return p:resolve(component)
  end)

  return Citizen.Await(p)
end

--- Registers a component
---@param component any
---@param requirements? fun(components: { [string]: any })
function Component.Register(component, requirements)
  if not component.COMPONENT then
    error("[STAX]: Couldn't load component due to missing `COMPONENT` data property")
    return
  end

  AddEventHandler("Stax::Shared::GetComponentDetails", function(name, next)
    if name ~= component.COMPONENT.NAME then return end
    next(component.COMPONENT)
  end)

  AddEventHandler("Stax::Shared::GetComponent", function(name, next)
    if name ~= component.COMPONENT.NAME then return end
    next(component)
  end)

  Citizen.CreateThread(function()
    local requiredComponents = {}

    for _, requiredComponent in pairs(component.COMPONENT.REQUIREMENTS) do
      requiredComponents[requiredComponent] = Component.Fetch(requiredComponent)
    end

    if type(requirements) == "function" then
      requirements(requiredComponents)
    end
  end)
end

---@class Stax
---@field _RegisteredComponents { [string]: table }
---@field _Resource string
Stax = {
  --- Variables
  _RegisteredComponents = {},
  _LoadedComponents = {},
  _LastRegisteredComponent = nil,
  _Resource = GetCurrentResourceName(),
  _IsServer = IsDuplicityVersion(),

  --- Internal Components
  Component = Component,
  Config = Config,
  Locale = Locale
}

function Stax.Init(self)
  local _isServer = IsDuplicityVersion()

  print("____________________ STAX ____________________")
  print("[" .. GetCurrentResourceName() .. "]: INITIALIZING...")

  ---@param resource string
  local function HandleResourceStart(resource)
    if Stax._Resource ~= resource then return end

    if _isServer then
      TriggerEvent("Stax::Server::ResourceStarted", resource)
    else
      TriggerServerEvent("Stax::Client::ResourceStarted", resource)
    end

    Stax.LoadConfig(self)
    Stax.LoadLocale(self)
  end


  if _isServer then
    AddEventHandler("onServerResourceStart", HandleResourceStart)
  else
    AddEventHandler("onClientResourceStart", HandleResourceStart)
  end
end

---@return boolean
function Stax.IsServer()
  return IsDuplicityVersion() == true
end

---@return boolean
function Stax.IsClient()
  return IsDuplicityVersion() == false
end

--- Returns a component from component name
---@param name string
---@generic T
---@return T
function Stax.Require(name)
  return Stax.Component.Fetch(name)
end

--- Registers a component
---@param component any
---@param requirements? fun(components: { [string]: any })
function Stax.Register(component, requirements)
  Stax._LastRegisteredComponent = os.time()
  return Stax.Component.Register(component, requirements)
end

function Stax.LoadConfig(self)
  local event

  local function _load(configs)
    Stax.Config = Config.Init(configs)

    if event then
      RemoveEventHandler(event)
    end
  end

  if Stax.IsServer() then
    event = AddEventHandler("Stax::Shared::LoadConfigs", _load)
  else
    event = RegisterNetEvent("Stax::Shared::LoadConfigs", _load)
  end
end

function Stax.LoadLocale(self)
  local event

  local function _load(locales)
    Stax.Locale = Locale.Init(locales)

    if event then
      RemoveEventHandler(event)
    end
  end

  if Stax.IsServer() then
    event = AddEventHandler("Stax::Shared::LoadLocales", _load)
  else
    event = RegisterNetEvent("Stax::Shared::LoadLocales", _load)
  end
end

Citizen.CreateThread(function()
  local function loaded()
    if not Stax._LastRegisteredComponent then
      Stax._LastRegisteredComponent = os.time()
      return false
    end

    if os.time() > Stax._LastRegisteredComponent + 5 then
      return true
    end

    return false
  end

  while not loaded() do
    Citizen.Wait(1000)
  end

  TriggerEvent("Stax::Shared::Ready", GetCurrentResourceName())
end)

Stax.Init(Stax)