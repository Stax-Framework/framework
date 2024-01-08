---@class StaxComponentDetails
---@field NAME string Component Name
---@field REQUIREMENTS string[]
StaxComponentDetails = {}

---@class StaxComponent
---@field Details StaxComponentDetails
StaxComponent = {}

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
  Config = nil,
  Locale = nil
}

function Stax.Init(self)
  self._Resource = GetCurrentResourceName()

  print("____________________ STAX INITIALIZING (" .. self._Resource .. ") ____________________")

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
end

function Stax.Server()
  return IsDuplicityVersion()
end

function Stax.Client()
  return not IsDuplicityVersion()
end

function Stax.Game(game)
  return GetGameName() == game
end

function Stax.Register(component, required)
  return Stax.Component.Register(component, required)
end

function Stax.RequireAsync(name)
  return Stax.Component.FetchAsync(name)
end

function Stax.Require(name, result)
  return Stax.Component.Fetch(name, result)
end

Stax.Init(Stax)