---@class Config
_Config = {}

---@class Locale
_Locale = {}

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
        local template = 'xxxx-xx-xxxx'
        return string.gsub(template, '[xy]', function(c)
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

--- Fetches a value or table from config
---@param path string | nil Community.Table1.Table2.ValueKey = Community = { Table1 = { Table2 = { ValueKey = 'Hello World' } } }
---@param default any Default value that should be returned if nothing is found
function Stax.FetchConfig(path, default)
    if path == nil then
        return _Config
    end

    local function loadStepper(currentData, nextIndex)
        return currentData[nextIndex]
    end

    local function stringSplit(passed, sep)
        if sep == nil then
            sep = "%s"
        end
        local t = {}
        for str in string.gmatch(passed, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end
        return t
    end

    local splitPath = stringSplit(path, ".")

    if type(splitPath) == "table" then
        local lastStep

        if #splitPath > 1 then
            for _, key in pairs(splitPath) do
                local currentStep = loadStepper(_Config, key)

                if currentStep == nil then
                    if lastStep and lastStep[key] then
                        return lastStep[key]
                    end
                else
                    lastStep = currentStep
                end
            end
        else
            local currentStep = _Config[splitPath[1]]

            if currentStep then
                return currentStep
            else
                return default
            end
        end
    end
end

--- Fetches a value or language from the locale file
---@param lang string Example: `en` `fr`
---@param path string | nil Community.Table1.Table2.ValueKey = Community = { Table1 = { Table2 = { ValueKey = 'Hello World' } } }
---@param default any Default value that should be returned if nothing is found
---@return table | nil
function Stax.FetchLocale(lang, path, default)
    if not lang then
        error("[STAX]: Couldn't use Stax.FetchLocale because paramater `lang` was not defined!")
        return
    end

    if not path then
        return _Locale[lang]
    end

    local function loadStepper(currentData, nextIndex)
        return currentData[nextIndex]
    end

    local function stringSplit(passed, sep)
        if sep == nil then
            sep = "%s"
        end
        local t = {}
        for str in string.gmatch(passed, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end
        return t
    end

    local splitPath = stringSplit(path, ".")

    if type(splitPath) == "table" then
        local lastStep

        if #splitPath > 1 then
            for _, key in pairs(splitPath) do
                local currentStep = loadStepper(_Locale[lang], key)

                if currentStep == nil then
                    if lastStep and lastStep[key] then
                        return lastStep[key]
                    end
                else
                    lastStep = currentStep
                end
            end
        else
            local currentStep = _Locale[lang][splitPath[1]]

            if currentStep then
                return currentStep
            else
                return default
            end
        end
    end
end

--- Creates a new export for the script
---@param name string
---@param callback fun(...)
function Stax.Export(name, callback)
    exports(name, callback)
end

--- Creates a new text command handler
---@param commandName string
---@param handler fun(source: number, args: table<any>, rawCommand: string) (`source` > 0) = PLAYER | (`source` == 0) = SERVER | `args` arguments after /command is send (/command test test1 hello) | `rawCommand` full command string
---@param restricted boolean
function Stax.Command(commandName, handler, restricted)
    RegisterCommand(commandName, handler, restricted)
end

--- Creates a custom keybind that is editable by the user in the settings->controls in the pause menu
---@param name string
---@param description string
---@param defaultMapper string https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
---@param defaultParameter string https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
---@param alternate? { defaultMapper: string, defaultParameter: string }
function Stax.Keybind(name, description, defaultMapper, defaultParameter, alternate)
    RegisterKeyMapping(tostring("+" .. name), description, defaultMapper, defaultParameter)

    if alternate then
        RegisterKeyMapping(tostring("~!+" .. name), description .. " | ALTERNATE", alternate.defaultMapper, alternate.defaultParameter)
    end

    return {
        ---@param handler fun()
        pressed = function(handler)
            RegisterCommand(tostring("+" .. name), handler, false)
        end,
        ---@param handler fun()
        released = function(handler)
            RegisterCommand(tostring("-" .. name), handler, false)
        end
    }
end

---@param padIndex "PLAYER_CONTROL" | "CAMERA_CONTROL" | "FRONTEND_CONTROL"
---@param control number?
function Stax.Control(padIndex, control)
    ---@enum PadType
    local _PadType = {
        ["PLAYER_CONTROL"] = 0,
        ["CAMERA_CONTROL"] = 1,
        ["FRONTEND_CONTROL"] = 2
    }

    return {
        disableAll = function()
            DisableAllControlActions(_PadType[padIndex])
        end,
        ---@param disable boolean
        disable = function(disable)
            if not control then return end
            DisableControlAction(_PadType[padIndex], control, disable)
        end,
        enableAll = function()
            EnableAllControlActions(_PadType[padIndex])
        end,
        ---@param enable boolean
        enable = function(enable)
            if not control then return end
            EnableControlAction(_PadType[padIndex], control, enable)
        end,
        isEnabled = function()
            if not control then return end
            IsControlEnabled(_PadType[padIndex], control)
        end,
        isJustPressed = function()
            if not control then return end
            IsControlJustPressed(_PadType[padIndex], control)
        end,
        isJustReleased = function()
            if not control then return end
            IsControlJustReleased(_PadType[padIndex], control)
        end,
        isPressed = function()
            if not control then return end
            IsControlPressed(_PadType[padIndex], control)
        end,
        isReleased = function()
            if not control then return end
            IsControlReleased(_PadType[padIndex], control)
        end,
        isDisabledJustPressed = function()
            if not control then return end
            IsDisabledControlJustPressed(_PadType[padIndex], control)
        end,
        isDisabledJustReleased = function()
            if not control then return end
            IsDisabledControlJustReleased(_PadType[padIndex], control)
        end,
        isDisablePressed = function()
            if not control then return end
            IsDisabledControlPressed(_PadType[padIndex], control)
        end,
        isDisableReleased = function()
            if not control then return end
            IsDisabledControlReleased(_PadType[padIndex], control)
        end
    }
end