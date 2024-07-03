---@class ComponentDetails
---@field NAME string Component Name
---@field REQUIREMENTS string[]
local ComponentDetails = {}

---@class Component
---@field Details ComponentDetails
local Component = {}

function Component.Init(name, requirements)
    return {
        NAME = name,
        REQUIREMENTS = requirements or {}
    }
end

--- Registers Usable Component
---@param component any
function Component.Register(component)
    assert(component.COMPONENT ~= nil, "Failed to register component because ^1`COMPONENT`^0 is not defined")
end

-- --- Registers a component
-- ---@param component any
-- ---@param request fun(components: table)?
-- function StaxComponent.Register(component, request)
--     assert(component.COMPONENT ~= nil, "Failed to register component because ^1`COMPONENT`^0 is not defined")
  
--     AddEventHandler("Stax::Shared::GetComponentDetails", function(name, next)
--       if name ~= component.COMPONENT.NAME then return end
--       next(component.COMPONENT)
--     end)
  
--     AddEventHandler("Stax::Shared::GetComponent", function(name, next)
--       if name ~= component.COMPONENT.NAME then return end
--       next(component)
--     end)
  
--     if #component.COMPONENT.REQUIREMENTS > 0 then
--       assert(type(request) == "function", "Register methods requires the 'required' parameter to be a function(components)")
  
--       Citizen.CreateThread(function()
--         local requiredComponents = {}
  
--         for _, componentName in pairs(component.COMPONENT.REQUIREMENTS) do
--           local fetchedComponent = Stax.RequireAsync(componentName)
  
--           assert(fetchedComponent ~= nil, "Failed trying to fetch component " .. componentName .. " for " .. component.COMPONENT.NAME)
  
--           requiredComponents[componentName] = fetchedComponent
--         end
  
--         request(requiredComponents)
--       end)
--     end
  
--     print("^9[STAX] ^0Component Registered ^0-[ ^8" .. component.COMPONENT.NAME .. " ^0]- ")
--   end

function Component.FetchAsync()

end

---@class Stax
---@field _Components { [string]: { [string]: table } }
---@field _Resource string
Stax = {}

function Stax.Init(self)
    self._Resource = GetCurrentResourceName()

    print("^9===================================================^0")
    print(" STAX INITIALIZING (^9" .. self._Resource .. "^0)")
    print("^9===================================================^0")

    local function Start(resource)

    end
end

function Stax.IsClient()
    return IsDuplicityVersion() == false or 0
end

function Stax.IsServer()
    return IsDuplicityVersion() == true or 1
end

--- Registers an event handler
---@param networked boolean TRUE: Networked Event | FALSE: Local Event
---@param event string
---@param callback fun(...)
function Stax.RegisterEvent(networked, event, callback)
    if networked == nil then
        networked = false
    end

    if networked then
        RegisterNetEvent(event, callback)
    else
        AddEventHandler(event, callback)
    end
end

--- Fires local event
---@param event string
function Stax.FireEvent(event, ...)
    TriggerEvent(event, ...)
end

--- Fires event on the server
---@param event string
function Stax.FireServerEvent(event, ...)
    TriggerServerEvent(event, ...)
end

--- Fires event on targeted client
---@param event string
---@param player number
function Stax.FireClientEvent(event, player, ...)
    TriggerClientEvent(event, player, ...)
end

--- Fires event on multiple clients
---@param event string
---@param players number[]
function Stax.FireMassClientEvent(event, players, ...)
    for _, player in pairs(players) do
        TriggerClientEvent(event, player, ...)
    end
end