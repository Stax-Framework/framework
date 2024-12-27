---@type Database
local _Database

---@class Player
---@field _id string ID generated by mongodb for this users data instance in the database
---@field source string | number Players source id set by the server to target that player
---@field name string Players username when connecting to the server
---@field identifier string Primary identifier used to query the database
---@field identifiers { [string]: string } Extra identifier storage for possible ban evade logic
local Player = {
    COMPONENT = Stax.Component.Init("Player")
}

--- Creates a new instance of a player
---@param playerId string | number
function Player.new(playerId)
    local newPlayer = setmetatable({
        _id = nil,
        source = playerId,
        name = GetPlayerName(playerId),
        identifier = nil,
        identifers = {}
    }, Player)

    ---[[
    --- IDENTIFIER FETCH LOGIC
    ---]]
    local PrimaryIdentifier = _Config.Player.PrimaryIdentifier
    local identifiers = {}
    local identifierCount = GetNumPlayerIdentifiers(playerId)
    local foundPrimaryIdentifier = false

    for i = 1, #identifierCount do
        local identifier = GetPlayerIdentifier(playerId, i)
        local colonPos = string.find(identifier, ":") - 1
        local identifierType = string.sub(identifier, 1, colonPos)
        identifiers[identifierType] = identifier

        if identifierType == PrimaryIdentifier then
            foundPrimaryIdentifier = true
        end
    end

    if not foundPrimaryIdentifier then
        DropPlayer(playerId, "Couldn't find the primary identifier required for this server! | " .. PrimaryIdentifier .. " |")
        return nil
    end

    newPlayer.identifier = identifiers[PrimaryIdentifier]
    newPlayer.identifers = identifiers

    return newPlayer
end

---@param self Player
---@return { sync: fun(callbacl: fun(results: table<any>)), async: fun(): Promise<table<any>> }
function Player.Load(self)
    return {
        sync = function(callback)
            _Database.FindOne({ collection = "players", query = { identifier = self.identifier } }, function(results)
                callback(results)
            end)
        end,
        async = function()
            local p = promise.new()

            _Database.FindOne({ collection = "players", query = { identifier = self.identifier } }, function(results)
                p:resolve(results)
            end)

            return Citizen.Await(p)
        end
    }
end

---@param self Player
---@return { sync: fun(callback: fun(success: boolean)), async: fun(): boolean }
function Player.Save(self)
    local saveData = {
        name = self.name,
        identifier = self.identifier,
        identifiers = self.identifiers
    }

    return {
        sync = function(callback)
            _Database.UpdateOne({ collection = "players", query = { _id = self._id }, update = saveData }, function(updatedCount)
                if updatedCount > 0 then
                    callback(true)
                else
                    callback(false)
                end
            end)
        end,
        async = function()
            local p = promise.new()

            _Database.UpdateOne({ collection = "players", query = { _id = self._id }, update = saveData }, function(updatedCount)
                if updatedCount > 0 then
                    p:resolve(true)
                else
                    p:resolve(false)
                end
            end)

            return Citizen.Await(p)
        end
    }
end

function Player.Ban()

end

function Player.Kick()

end

function Player.Warn()

end

---[[
--- LOADER EVENT
---]]
Stax.Event("ComponentLoader", "Ready").create(false, function()
    _Database = Stax.Component.FetchAsync("Database")
end)

Stax.Component.Register(Player)