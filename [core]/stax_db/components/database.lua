local resource_name = GetCurrentResourceName()

---@type Logger
local _Logger

---@class Database
---@field COMPONENT Component
local Database = {
    COMPONENT = Stax.Component.Init("Database"),
}

--- Fetches a single document from the database
---@async
---@param push fun(connected: boolean)
function Database.IsConnected(push)
    push(exports[resource_name]:isConnected())
end

--- Inserts multiple documents into the database
---@async
---@param params { collection: string, documents: table, options: table? }
---@param push fun(insertCount: number, insertedIds: {})
function Database.Insert(params, push)
    exports[resource_name]:insert(params, function(success, insertCount, insertedIds)
        if not success then
            -- Database.Logger.Error("[stax_db] | Insert |", tostring(insertCount))
            return push(0, {})
        end

        return push(insertCount, insertedIds)
    end)
end

--- Inserts one document into the database
---@async
---@param params { collection: string, document: table, options: table? }
---@param push fun(insertCount: number, insertedIds: {})
function Database.InsertOne(params, push)
    exports[resource_name]:insertOne(params, function(success, insertCount, insertedIds)
        if not success then
            -- Database.Logger.Error("[stax_db] | InsertOne |", tostring(insertCount))
            return push(0, {})
        end

        return push(insertCount, insertedIds)
    end)
end

--- Fetches multiple documents from the database
---@async
---@param params { collection: string, query: table, options: table? }
---@param push fun(results: table)
function Database.Find(params, push)
    exports[resource_name]:find(params, function(success, result)
        if not success then
            -- Database.Logger.Error("[stax_db] | Find |", tostring(result))
            return push({})
        end

        return push(result)
    end)
end

--- Fetches a single document from the database
---@async
---@param params { collection: string, query: table, options: table? }
---@param push fun(results: table)
function Database.FindOne(params, push)
    exports[resource_name]:findOne(params, function(success, result)
        if not success then
            -- Database.Logger.Error("[stax_db] | FindOne |", tostring(result))
            return push({})
        end

        return push(result)
    end)
end

--- Updates multiple documents in the database
---@async
---@param params { collection: string, query: table, update: table, options: table? }
---@param push fun(updatedCount: number)
function Database.Update(params, push)
    exports[resource_name]:update(params, function(success, updatedCount)
        if not success then
            -- Database.Logger.Error("[stax_db] | Update |", tostring(updatedCount))
            return push(0)
        end

        return push(updatedCount)
    end)
end

--- Updates a single document in the database
---@async
---@param params { collection: string, query: table, update: table, options: table? }
---@param push fun(updatedCount: number)
function Database.UpdateOne(params, push)
    exports[resource_name]:update(params, function(success, updatedCount)
        if not success then
            -- Database.Logger.Error("[stax_db] | UpdateOne |", tostring(updatedCount))
            return push(0)
        end

        return push(updatedCount)
    end)
end

--- Fetches a count of results from the database
---@async
---@param params { collection: string, query: table, options: table? }
---@param push fun(count: number)
function Database.Count(params, push)
    exports[resource_name]:count(params, function(success, count)
        if not success then
            -- Database.Logger.Error("[stax_db] | UpdateOne |", tostring(count))
            return push(0)
        end

        return push(count)
    end)
end

--- Deletes multiple documents from the database
---@async
---@param params { collection: string, query: table, options: table? }
---@param push fun(deletedCount: number)
function Database.Delete(params, push)
    exports[resource_name]:delete(params, function(success, deleteCount)
        if not success then
            -- Database.Logger.Error("[stax_db] | UpdateOne |", tostring(deleteCount))
            return push(0)
        end
        return push(deleteCount)
    end)
end

--- Deletes a single document from the database
---@async
---@param params { collection: string, query: table, options: table? }
---@param push fun(deletedCount: number)
function Database.DeleteOne(params, push)
    exports[resource_name]:deleteOne(params, function(success, deleteCount)
        if not success then
            -- Database.Logger.Error("[stax_db] | UpdateOne |", tostring(deleteCount))
            return push(0)
        end
        return push(deleteCount)
    end)
end

---[[
--- LOADER EVENT
---]]
Stax.Event("ComponentLoader", "Ready").create(false, function()
    ---@type Logger
    _Logger = Stax.Component.FetchAsync("Logger")
end)

Stax.Component.Register(Database)