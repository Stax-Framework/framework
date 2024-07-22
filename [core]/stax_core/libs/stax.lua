---@class Stax
Stax = {}

---@class Events
Stax.Events = {}

---@class State
Stax.State = {}

---@class Component
---@field private Components table<Component>
---@field private Details ComponentDetails
Stax.Component = {
    LoadCount = 0,
    Components = {}
}

---@class ComponentDetails
---@field NAME string
---@field REQUIRED table<string> 
Stax.Component.Details = {}

---@class Config
Stax.Config = {}

---@class Locale
Stax.Locale = {}

---[[ STAX ]]---

function Stax.Initialize()
    Citizen.CreateThread(function()
        Stax.Load()
    end)
end

function Stax.Load()
    local p = promise.new()

    

    return Citizen.Await(p)
end

function Stax.Unload()

end

---[[ STAX EVENTS ]]---

--- Creates a new event handler
---@param event string event handler name
---@param callback fun(...) event handler callback
---@param networked boolean If 'true' the event can be triggered across the network
function Stax.Events.Listen(event, callback, networked)
    if networked then
        RegisterNetEvent(event, callback)
    else
        AddEventHandler(event, callback)
    end
end

--- Fires an event handler
---@param event string event handler name
---@param ... any event arguments
function Stax.Events.Fire(event, ...)
    TriggerEvent(event, ...)
end

--- Fires an event handler on a single client
---@param event string event handler name
---@param player number player id to fire the event on
---@param ... any event arguments
function Stax.Events.FireClient(event, player, ...)
    TriggerClientEvent(event, player, ...)
end

--- Fires an event handler on multiple clients
---@param event string event handler name
---@param players table<number> table player ids to fire the event on
---@param ... any event arguments
function Stax.Events.FireClients(event, players, ...)
    if #players > 1 then
        for _, player in ipairs(players) do
            TriggerClientEvent(event, player, ...)
        end
    else
        Stax.Events.FireClient(event, players[1], ...)
    end
end

--- Fires an event handler on the server
---@param event string event handler name
---@param ... any event arguments
function Stax.Events.FireServer(event, ...)
    TriggerServerEvent(event, ...)
end

---[[ STAX STATE ]]---
--- Gets state from an Entity
---@param id number
---@param key string
---@generic T
---@return T
function Stax.State.EntityGetState(id, key)
    ---@diagnostic disable-next-line
    return Entity(id).state[key]
end

--- Sets state on an Entity
---@param id number
---@param key string
---@param value any
function Stax.State.EntitySetState(id, key, value)
    ---@diagnostic disable-next-line
    Entity(id).state[key] = value
end

--- Gets state from an Player
---@param id number
---@param key string
---@generic T
---@return T
function Stax.State.PlayerGetState(id, key)
    ---@diagnostic disable-next-line
    return Player(id).state[key]
end

--- Sets state on a Player
---@param id number
---@param key string
---@param value any
function Stax.State.PlayerSetState(id, key, value)
    ---@diagnostic disable-next-line
    Player(id).state[key] = value
end

--- Gets localplayer state
---@param key string
---@generic T
---@return T
function Stax.State.LocalPlayerGetState(key)
    ---@diagnostic disable-next-line
    return LocalPlayer.state[key]
end

--- Sets localplayer state
---@param key string
---@param value any
function Stax.State.LocalPlayerSetState(key, value)
    ---@diagnostic disable-next-line
    LocalPlayer.state[key] = value
end

--- Gets global state
---@param key string
---@generic T
---@return T
function Stax.State.GlobalGetState(key)
    ---@diagnostic disable-next-line
    return GlobalState[key]
end

--- Sets global state
---@param key string
---@param value any
function Stax.State.GlobalSetState(key, value)
    ---@diagnostic disable-next-line
    GlobalState[key] = value
end

---[[ STAX COMPONENT ]]---

--- Register a component system
---@param component Component
function  Stax.Component.Register(component, fetched)
    local event = tostring("stax.components.register." .. component.Details.NAME)
    Stax.Events.Listen("stax.components.register", function()
        ---@diagnostic disable-next-line
        return component
    end, false)
end

---@param name string
function Stax.Component.Fetch(name)
    ---@diagnostic disable-next-line
    return Stax.Events.Fire("stax.components.register." .. name)
end

function Stax.Component.FetchMany()

end