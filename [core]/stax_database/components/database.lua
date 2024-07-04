local resource_name = GetCurrentResourceName()

---@class StaxDatabase
---@field COMPONENT ComponentDetails
local Database = {
  COMPONENT = Stax.Component.Init("Database")
}

----------------------------------------
---                                  ---
---      Asynchronous Functions      ---
---                                  ---
----------------------------------------

--- Delete multiple documents
---@async
---@param collection string
---@param query table
---@param options table?
---@return { success: boolean, deletedCount: number }
function Database.AsyncDeleteMany(collection, query, options)
  local p = promise.new()

  exports[resource_name]:deleteMany(collection, query, options, function(success, deletedCount)
    p:resolve({ success = success, deletedCount = deletedCount })
  end)

  ---@type { success: boolean, deletedCount: number }
  return Citizen.Await(p);
end

--- Delete one document
---@async
---@param collection string
---@param query table
---@param options table?
---@return { success: boolean, deletedCount: number }
function Database.AsyncDeleteOne(collection, query, options)
  local p = promise.new()

  exports[resource_name]:deleteOne(collection, query, options, function(success, deletedCount)
    p:resolve({ success = success, deletedCount = deletedCount })
  end)

    ---@type { success: boolean, deletedCount: number }
  return Citizen.Await(p)
end

--- Find multiple documents
---@async
---@param collection string
---@param query table
---@param options table?
---@return { success: boolean, results: table<number, any> }
function Database.AsyncFind(collection, query, options)
  local p = promise.new()

  exports[resource_name]:find(collection, query, options, function(success, results)
    p:resolve({ success = success, results = results })
  end)

  ---@type { success: boolean, results: table<number, any> }
  return Citizen.Await(p)
end

--- Find one document
---@async
---@param collection string
---@param query table
---@param options table?
---@return { success: boolean, results: table }
function Database.AsyncFindOne(collection, query, options)
  local p = promise.new()

  exports[resource_name]:findOne(collection, query, options, function(success, results)
    p:resolve({ success = success, results = results })
  end)

  ---@type { success: boolean, results: table }
  return Citizen.Await(p)
end

--- Insert multiple documents
---@async
---@param collection string
---@param documents table
---@param options table?
---@return { success: boolean, insertedIds: table<number, number> }
function Database.AsyncInsertMany(collection, documents, options)
  local p = promise.new()

  exports[resource_name]:insertMany(collection, documents, options, function(success, insertedIds)
    p:resolve({ success = success, insertedIds = insertedIds });
  end)

  ---@type { success: boolean, insertedIds: table<number, number> }
  return Citizen.Await(p)
end

--- Insert one document
---@async
---@param collection string
---@param document table
---@param options table?
---@return { success: boolean, insertedIds: table<number, number> }
function Database.AsyncInsertOne(collection, document, options)
  local p = promise.new()

  exports[resource_name]:insertOne(collection, document, options, function(success, insertedIds)
    p:resolve({ success = success, insertedIds = insertedIds });
  end)

  ---@type { success: boolean, insertedIds: table<number, number> }
  return Citizen.Await(p)
end

--- Replaces one document
---@async
---@param collection string
---@param query table
---@param replaceDocument table
---@param options table?
---@return { success: boolean, modifiedCount: number }
function Database.AsyncReplaceOne(collection, query, replaceDocument, options)
  local p = promise.new()

  exports[resource_name]:replaceOne(collection, query, replaceDocument, options, function(success, modifiedCount)
    p:resolve({ success = success, modifiedCount = modifiedCount })
  end)

  ---@type { success: boolean, modifiedCount: number }
  return Citizen.Await(p)
end

--- Updates multiple documents
---@async
---@param collection string
---@param query table
---@param documents table
---@param options table?
---@return { success: boolean, modifiedCount: number }
function Database.AsyncUpdateMany(collection, query, documents, options)
  local p = promise.new()

  exports[resource_name]:updateMany(collection, query, documents, options, function(success, modifiedCount)
    p:resolve({ success = success, modifiedCount = modifiedCount })
  end)

  ---@type { success: boolean, modifiedCount: number }
  return Citizen.Await(p)
end

--- Updates ones document
---@async
---@param collection string
---@param query table
---@param document table
---@param options table?
---@return { success: boolean, modifiedCount: number }
function Database.AsyncUpdateOne(collection, query, document, options)
  local p = promise.new()

  exports[resource_name]:updateOne(collection, query, document, options, function(success, modifiedCount)
    p:resolve({ success = success, modifiedCount = modifiedCount })
  end)

  ---@type { success: boolean, modifiedCount: number }
  return Citizen.Await(p)
end

----------------------------------------
---                                  ---
---      Synchronous Functions       ---
---                                  ---
----------------------------------------

--- Delete multiple documents
---@param collection string
---@param query table
---@param options table?
---@param cb fun(results: { success: boolean, deletedCount: number })
function Database.SyncDeleteMany(collection, query, options, cb)
  exports[resource_name]:deleteMany(collection, query, options, cb)
end

--- Delete one document
---@async
---@param collection string
---@param query table
---@param options table?
---@param cb fun(results: { success: boolean, deletedCount: number })
function Database.SyncDeleteOne(collection, query, options, cb)
  exports[resource_name]:deleteOne(collection, query, options, cb)
end

--- Find multiple documents
---@param collection string
---@param query table
---@param options table?
---@param cb fun(results: { success: boolean, results: table<number, any> })
function Database.SyncFind(collection, query, options, cb)
  exports[resource_name]:find(collection, query, options, cb)
end

--- Find one documents
---@param collection string
---@param query table
---@param options table?
---@param cb fun(results: { success: boolean, results: table })
function Database.SyncFindOne(collection, query, options, cb)
  exports[resource_name]:findOne(collection, query, options, cb)
end

--- Insert multiple documents
---@param collection string
---@param documents table
---@param options table?
---@param cb fun(results: { success: boolean, insertedIds: table<number, number> })
function Database.SyncInsertMany(collection, documents, options, cb)
  exports[resource_name]:insertMany(collection, documents, options, cb)
end

--- Insert one document
---@param collection string
---@param document table
---@param options table?
---@param cb fun(results: { success: boolean, insertedIds: table<number, number> })
function Database.SyncInsertOne(collection, document, options, cb)
  exports[resource_name]:insertOne(collection, document, options, cb)
end

--- Replaces one document
---@param collection string
---@param query table
---@param replaceDocument table
---@param options table?
---@param cb fun(results: { success: boolean, modifiedCount: number }) 
function Database.SyncReplaceOne(collection, query, replaceDocument, options, cb)
  exports[resource_name]:replaceOne(collection, query, replaceDocument, options, cb)
end

--- Updates multiple documents
---@param collection string
---@param query table
---@param documents table
---@param options table?
---@param cb fun(results: { success: boolean, modifiedCount: number })
function Database.SyncUpdateMany(collection, query, documents, options, cb)
  exports[resource_name]:updateMany(collection, query, documents, options, cb)
end

--- Updates ones document
---@param collection string
---@param query table
---@param document table
---@param options table?
---@param cb fun(results: { success: boolean, modifiedCount: number }) 
function Database.SyncUpdateOne(collection, query, document, options, cb)
  exports[resource_name]:updateOne(collection, query, document, options, cb)
end

Stax.Component.Register(Database)