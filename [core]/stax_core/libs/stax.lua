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
    print("[STAX]: Couldn't Register Component\n" .. tostring(component))
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

  print("[STAX]: Registered Component | " .. tostring(component.COMPONENT.NAME), json.encode(component.COMPONENT.REQUIREMENTS or {}))

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
Stax = {
  --- Variables
  _RegisteredComponents = {},
  _LoadedComponents = {},

  --- Internal Components
  Component = Component
}
Stax.__index = Stax

function Stax.Init()
  print("____________________ STAX ____________________")
  print("[" .. GetCurrentResourceName() .. "]: INITIALIZING...")
end

function Stax.LoadConfig()

end

function Stax.LoadLocale()

end

Citizen.CreateThread(function()
  Stax.Init()
end)