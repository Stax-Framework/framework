---@class ComponentDetails
---@field Name string
---@field Requirements string[]
local ComponentDetails = {}

---@class Component
---@field COMPONENT ComponentDetails
local Component = {}

function Component.Init(name, requirements)
    return {
        Name = name,
        Requirements = requirements
    }
end

--- Fetches a component synchronously through callback
---@generic T
---@param name string
---@param callback fun(component: Component<T>)
function Component.Fetch(name, callback)
    local _timeout = GetGameTimer() + 5000
    local _fetched = false

    TriggerEvent("STAX::ComponentLoader::Fetch", name, function(component)
        callback(component)
        _fetched = true
    end)

    Citizen.CreateThread(function()
        while not _fetched do
            if GetGameTimer() > _timeout then
                error("Failed to fetch component " .. name)
                callback(nil)
                return
            end
        end
    end)
end

--- Fetches a component synchronously through callback
---@generic T
---@param name string
---@return promise<Component<T>>
function Component.FetchAsync(name)
    local p = promise.new()

    ---@param component Component
    Component.Fetch(name, function(component)
        p:resolve(component)
    end)

    return Citizen.Await(p)
end

function Component.Register(component)
    assert(component.COMPONENT ~= nil, "Failed to register component because ^1`COMPONENT`^0 is not defined")

    TriggerEvent("STAX::ComponentLoader::Register", component)
end

---@class Stax
Stax = {
    IsServer = IsDuplicityVersion(),
    Component = Component
}

--- Can create or fire an event handler using stax name syntax
---@param key string `PlayerManager` | Component Name / System Name
---@param name any? `Fetch` | Component Method / System Method `IF NIL WILL DEFAULT TO BASE EVENT NAME SYNTAX = 'playerConnecting'`
---@return { create: fun(networked: boolean, callback: fun(...)), fireServer: fun(...), fireLocal: fun(...), fireClient: fun(clientId: string | number, ...) }
function Stax.Event(key, name)
    local eventStr

    if not name then
        eventStr = key
    else
        eventStr = tostring("STAX::" .. key .. "::" .. name)
    end

    --- Creates a new event handler
    ---@param networked boolean
    ---@param callback fun(...)
    ---@return fun()
    local function create(networked, callback)
        local eventHandle

        if networked then
            eventHandle = RegisterNetEvent(eventStr, callback)
        else
            eventHandle = AddEventHandler(eventStr, callback)
        end

        return function()
            if eventHandle then
                RemoveEventHandler(eventHandle)
            end
        end
    end

    return {
        create = create,
        fireServer = function(...)
            TriggerServerEvent(eventStr, ...)
        end,
        fireLocal = function(...)
            TriggerEvent(eventStr, ...)
        end,
        fireClient = function(clientId, ...)
            TriggerClientEvent(eventStr, clientId, ...)
        end
    }
end

--- Creates a callback that can be passed over the network
---@param name string
---@return { create: fun(callback: fun()), fireServer: fun(callback: fun(data: table<any>), ...), fireClient: fun(playerId: number | string, callback: fun(source: number | string, data: table<any>), ...) }
function Stax.NetworkCallback(name)
    local eventStr = tostring("STAX::NetworkCallback::" .. name)

    --- Creates a new event handler
    ---@param callback fun(...)
    ---@return fun()
    local function create(callback)
        local eventHandle = RegisterNetEvent(eventStr, function(id, ...)
            local resultStr = tostring("STAX::NetworkCallback::" .. id)

            if IsDuplicityVersion() then
                callback(function(data)
                    TriggerClientEvent(resultStr, source, msgpack.pack(data))
                end, source, ...)
            else
                callback(function(data)
                    TriggerServerEvent(resultStr, msgpack.pack(data))
                end, ...)
            end

        end)

        return function()
            if eventHandle then
                RemoveEventHandler(eventHandle)
            end
        end
    end

    local function uuid()
        local template ='xxxx-xx-xxxx'
        return string.gsub(template, '[xy]', function (c)
            local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
            return string.format('%x', v)
        end)
    end

    local function createResult(callback)
        local id = uuid()

        local eventHandle

        eventHandle = RegisterNetEvent(tostring("STAX::NetworkCallback::" .. id), function(dataPack)
            if IsDuplicityVersion() then
                callback(source, msgpack.unpack(dataPack))
            else
                callback(msgpack.unpack(dataPack))
            end

            if eventHandle then
                RemoveEventHandler(eventHandle)
            end
        end)

        return id
    end

    return {
        create = create,
        fireServer = function(callback, ...)
            if not Stax.IsServer then
                local id = createResult(callback)

                TriggerServerEvent(eventStr, id, ...)
            else
                print("[STAX]: Error | Can't fire network callback on a server from the from server!")
            end
        end,

        fireClient = function(playerId, callback, ...)
            if Stax.IsServer then
                local id = createResult(callback)

                TriggerClientEvent(eventStr, playerId, id, ...)
            else
                print("[STAX]: Error | Can't fire network callback on a client from the client!")
            end
        end
    }
end

function Stax.Export(name, callback)
    exports(name, callback)
end