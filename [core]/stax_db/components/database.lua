---[[
--- Method Param Types
---]]

---@class InsertOptions
---@field public w? number | string The write concern
---@field public wtimeout? number The write concern timeout
---@field public j? boolean Specify a journal write concern
---@field public serializeFunctions? boolean Serialize functions on any object
---@field public forceServerObjectId? boolean Force server to assign _id values instead of driver
---@field public bypassDocumentValidation? boolean Allow driver to bypass schema validation in MongoDB 3.2 or higher.

---@class FindOptions
---@field public limit? number Sets the limit of documents returned in the query.
---@field public sort? table Set to sort the documents coming back from the query. Array of indexes, [['a', 1]] etc.
---@field public projection? table The fields to return in the query. Object of fields to include or exclude (not both), {'a':1}
---@field public skip? number Set to skip N documents ahead in your query (useful for pagination).
---@field public hint? table Tell the query to use specific indexes in the query. Object of indexes to use, {'_id':1}
---@field public explain? boolean Explain the query instead of returning the data.
---@field public timeout? boolean Specify if the cursor can timeout.
---@field public tailable? boolean Specify if the cursor is tailable.
---@field public batchSize? number Set the batchSize for the getMoreCommand when iterating over the query results.
---@field public returnKey? boolean Only return the index key.
---@field public min? number Set index bounds.
---@field public max? number Set index bounds.
---@field public showDiscLoc? boolean Show disk location of results.
---@field public comment? string You can put a $comment field on a query to make looking in the profiler logs simpler.
---@field public raw? boolean Return document results as raw BSON buffers.
---@field public promoteLongs? boolean Promotes Long values to number if they fit inside the 53 bits resolution.
---@field public promoteValues? boolean Promotes BSON values to native types where possible, set to false to only receive wrapper types.
---@field public promoteBuffers? boolean Promotes Binary BSON values to native Node Buffers.
---@field public readPreference? string The preferred read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
---@field public partial? boolean Specify if the cursor should return partial results when querying against a sharded system
---@field public maxTimeMS? number Number of miliseconds to wait before aborting the query.
---@field public collation? table Specify collation (MongoDB 3.4 or higher) settings for update operation (see 3.4 documentation for available fields).

---@class UpdateOptions
---@field public w? number | string The write concern.
---@field public wtimeout? number The write concern timeout.
---@field public j? boolean Specify a journal write concern.
---@field public upsert? boolean Update operation is an upsert.
---@field public multi? boolean Update one/all documents with operation.
---@field public bypassDocumentValidation? boolean Allow driver to bypass schema validation in MongoDB 3.2 or higher.
---@field public collation? table Specify collation (MongoDB 3.4 or higher) settings for update operation (see 3.4 documentation for available fields).
---@field public arrayFilters? table optional list of array filters referenced in filtered positional operators

---@class CountOptions
---@field public limit? boolean The limit of documents to count.
---@field public skip? boolean The number of documents to skip for the count.
---@field public hint? string An index name hint for the query.
---@field public readPreference? string The preferred read preference (ReadPreference.PRIMARY, ReadPreference.PRIMARY_PREFERRED, ReadPreference.SECONDARY, ReadPreference.SECONDARY_PREFERRED, ReadPreference.NEAREST).
---@field public maxTimeMS? number Number of miliseconds to wait before aborting the query.

---@class DeleteOptions
---@field public w? number | string The write concern.
---@field public wtimeout? number The write concern timeout.
---@field public j? boolean Specify a journal write concern.

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
---@param params { collection: string, documents: table, options: InsertOptions? }
---@param push fun(insertCount: number, insertedIds: {})
function Database.Insert(params, push)
    exports[resource_name]:insert(params, function(success, insertCount, insertedIds)
        if not success then
            _Logger.Error("[stax_db] | Insert |", tostring(insertCount))
            return push(0, {})
        end

        return push(insertCount, insertedIds)
    end)
end

--- Inserts one document into the database
---@async
---@param params { collection: string, document: table, options: InsertOptions? }
---@param push fun(insertCount: number, insertedIds: {})
function Database.InsertOne(params, push)
    exports[resource_name]:insertOne(params, function(success, insertCount, insertedIds)
        if not success then
            _Logger.Error("[stax_db] | InsertOne |", tostring(insertCount))
            return push(0, {})
        end

        return push(insertCount, insertedIds)
    end)
end

--- Fetches multiple documents from the database
---@async
---@param params { collection: string, query: table, options: FindOptions? }
---@param push fun(results: table)
function Database.Find(params, push)
    exports[resource_name]:find(params, function(success, result)
        if not success then
            _Logger.Error("[stax_db] | Find |", tostring(result))
            return push({})
        end

        return push(result)
    end)
end

--- Fetches a single document from the database
---@async
---@param params { collection: string, query: table, options: FindOptions? }
---@param push fun(results: table)
function Database.FindOne(params, push)
    exports[resource_name]:findOne(params, function(success, result)
        if not success then
            _Logger.Error("[stax_db] | FindOne |", tostring(result))
            return push({})
        end

        return push(result)
    end)
end

--- Updates multiple documents in the database
---@async
---@param params { collection: string, query: table, update: table, options: UpdateOptions? }
---@param push fun(updatedCount: number)
function Database.Update(params, push)
    exports[resource_name]:update(params, function(success, updatedCount)
        if not success then
            _Logger.Error("[stax_db] | Update |", tostring(updatedCount))
            return push(0)
        end

        return push(updatedCount)
    end)
end

--- Updates a single document in the database
---@async
---@param params { collection: string, query: table, update: table, options: UpdateOptions? }
---@param push fun(updatedCount: number)
function Database.UpdateOne(params, push)
    exports[resource_name]:update(params, function(success, updatedCount)
        if not success then
            _Logger.Error("[stax_db] | UpdateOne |", tostring(updatedCount))
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
            _Logger.Error("[stax_db] | UpdateOne |", tostring(count))
            return push(0)
        end

        return push(count)
    end)
end

--- Deletes multiple documents from the database
---@async
---@param params { collection: string, query: table, options: DeleteOptions? }
---@param push fun(deletedCount: number)
function Database.Delete(params, push)
    exports[resource_name]:delete(params, function(success, deleteCount)
        if not success then
            _Logger.Error("[stax_db] | UpdateOne |", tostring(deleteCount))
            return push(0)
        end
        return push(deleteCount)
    end)
end

--- Deletes a single document from the database
---@async
---@param params { collection: string, query: table, options: DeleteOptions? }
---@param push fun(deletedCount: number)
function Database.DeleteOne(params, push)
    exports[resource_name]:deleteOne(params, function(success, deleteCount)
        if not success then
            _Logger.Error("[stax_db] | UpdateOne |", tostring(deleteCount))
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