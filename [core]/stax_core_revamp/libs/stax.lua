---@class Locale
---@field storage { [string]: table }
local Locale = { storage = {} }
Locale.__index = Locale

function Locale.New(locales)
    local newLocale = { storage = {} }
    setmetatable(newLocale, Locale)

    for k, v in pairs(locales) do
        newLocale.storage[k] = v
    end

    return newLocale
end

function Locale.Load(self, loaded)
    local event

    local function _load(locales)
        Stax.Locale = Locale.New(locales)

        if event then
            Stax.RemoveEvent(event)
            loaded()
        end
    end

    if Stax.IsServer() then
        event = Stax.RegisterEvent(false, "STAX::SHARED::LoadLocales", _load)
    else
        event = Stax.RegisterEvent(true, "STAX::SHARED::LoadLocales", _load)
    end
end

function Locale.Fetch(self, path)
    local function split(passed, sep)
        if sep == nil then sep = "%s" end

        local t = {}

        for str in string.gmatch(passed, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end

        return t
    end

    local function loadStepper(currentData, nextIndex)
        return currentData[nextIndex]
    end

    local result = {}

    if not path then return self.storage end

    path = split(path, ".")

    if type(path) == "table" then
        local lastStep

        for _, v in pairs(path) do
            local currentStep = loadStepper(self.storage, v)

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

---@class Config
---@field storage { [string]: table }
local Config = { storage = {} }
Config.__index = Config

function Config.New(configs)
    local newConfig = { storage = {} }
    setmetatable(newConfig, Config)

    if configs["server"] then
        for serverKey, serverConfig in pairs(configs["server"]) do
            newConfig.storage[serverKey] = serverConfig
        end
    end

    if configs["client"] then
        for clientKey, clientConfig in pairs(configs["client"]) do
            newConfig.storage[clientKey] = clientConfig
        end
    end

    if configs["shared"] then
        for sharedKey, sharedConfig in pairs(configs["shared"]) do
            newConfig.storage[sharedKey] = sharedConfig
        end
    end

    for k, v in pairs(configs) do
        if k ~= "shared" and k ~= "client" and k ~= "server" then
           newConfig.storage[k] = v
        end
    end

    return newConfig
end

function Config.Load(self, loaded)
    local event

    local function _load(configs)
        Stax.Config = Config.New(configs)

        if event then
            Stax.RemoveEvent(event)
            loaded()
        end
    end

    if Stax.IsServer() then
        event = Stax.RegisterEvent(false, "STAX::SHARED::LoadConfigs", _load)
    else
        event = Stax.RegisterEvent(true, "STAX::SHARED::LoadConfigs", _load)
    end
end

function Config.Fetch(self, path)
    local function split(passed, sep)
        if sep == nil then sep = "%s" end

        local t = {}

        for str in string.gmatch(passed, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end

        return t
    end

    local function loadStepper(currentData, nextIndex)
        return currentData[nextIndex]
    end

    local result = {}

    if not path then return self.storage end

    path = split(path, ".")

    if type(path) == "table" then
        local lastStep

        for _, v in pairs(path) do
            local currentStep = loadStepper(self.storage, v)

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
function Component.Register(component, request)
    assert(component.COMPONENT ~= nil, "Failed to register component because ^1`COMPONENT`^0 is not defined")

    AddEventHandler("STAX::SHARED::GetComponentDetails", function(name, next)
        if name ~= component.COMPONENT.NAME then return end

        next(component.COMPONENT)
    end)

    AddEventHandler("STAX::SHARED::GetComponent", function(name, next)
        if name ~= component.COMPONENT.NAME then return end

        next(component)
    end)

    if #component.COMPONENT.REQUIREMENTS > 0 then
        assert(type(request) == "function", "Register methods requires the 'required' parameter to be a function(components)")
    
        Citizen.CreateThread(function()
            local required = {}

            for _, name in pairs(component) do
                
            end
        end)
    end
end

--- Fetches a component 
---@generic T
---@param name string
---@param result fun(component: Component)
function Component.Fetch(name, result)
    Stax.FireEvent("STAX::SHARED::GetComponent", name, function(component)
        result(component)
    end)
end

--- Fetches a components details 
---
function Component.FetchDetails(name, details)

end

--- Fetches a component asynchronously
---@async
---@generic T
---@param name string Component Name
---@return Promise<T>
function Component.FetchAsync(name)
    local p = promise.new()

    Stax.FireEvent("STAX::SHARED::GetComponent", name, function(component)
        p:resolve(component)
    end)

    return Citizen.Await(p)
end

--- Fetches a components details asynchronously
---@async
---@return Promise<ComponentDetails>
function Component.FetchDetailsAsync(name)
    local p = promise.new()

    Stax.FireEvent("STAX::SHARED::GetComponentDetails", name, function(details)
        p:resolve(details)
    end)

    return Citizen.Await(p)
end

---@class Stax
---@field _Components { [string]: { [string]: table } }
---@field _Resource string
Stax = {
    _Components = {},
    _Resource = GetCurrentResourceName(),

    --- INTERNAL COMPONENTS
    Component = Component,
    Config = Config,
    Locale = Locale
}

function Stax.Init(self)
    self._Resource = GetCurrentResourceName()

    print("^9===================================================^0")
    print(" STAX INITIALIZING (^9" .. self._Resource .. "^0)")
    print("^9===================================================^0")

    Stax.RegisterEvent(false, "onResourceStart", function(resource)
        Stax.FireEvent("STAX::SHARED::ResourceStarted", resource)
    end)

    Stax.RegisterEvent(false, "onResourceStop", function(resource)
        Stax.FireEvent("STAX::SHARED::ResourceStopped", resource)
    end)

    local configLoaded = false
    local localeLoaded = false

    Stax.Config.Load(Stax.Config, function()
        Stax.FireEvent("STAX::SHARED::ConfigsLoaded")
    end)

    Stax.Locale.Load(Stax.Locale, function()
        Stax.FireEvent("STAX::SHARED::LocalesLoaded")
    end)

    Citizen.CreateThread(function()
        repeat
          Citizen.Wait(1000)
        until configLoaded == true and localeLoaded == true

        Stax.FireEvent("STAX::SHARED::Ready")
    end)
end

--- Returns if the the current scope is the client
---@return boolean
function Stax.IsClient()
    return not IsDuplicityVersion()
end

--- Returns if the the current scope is the server
---@return boolean
function Stax.IsServer()
    return IsDuplicityVersion()
end

--- Returns if the current game the code is running on is the same as the one you pass
---@param game "fxserver" | "fivem" | "libertym" | "redm"
---@return boolean
function Stax.Game(game)
    return GetGameName() == game
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
        return RegisterNetEvent(event, callback)
    else
        return AddEventHandler(event, callback)
    end
end

--- Removes registered event handler
function Stax.RemoveEvent(event)
    RemoveEventHandler(event)
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

Stax.Init(Stax)