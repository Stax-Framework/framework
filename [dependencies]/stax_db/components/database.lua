---@class StaxDatabase
---@field COMPONENT StaxComponent
---@field Logger StaxLogger?
local Database = {
    COMPONENT = Stax.Component.Init("Database", { "Logger" }),
    Logger = nil
}

--- Creates an asynchrnous query to the database
---@async
---@param queryData { query: string, data: table }
---@return { ok: boolean, results: table, meta?: { affectedRows: number, insertId: number, changedRows: number }, error?: string }
function Database.Async(queryData)
    return exports["stax_db"]:AsyncQuery(queryData.query, queryData.data)
end

--- Creates a synchronous query to the database
---@param queryData { query: string, data: table }
---@param callback fun(results: { ok: boolean, results: table, meta?: { affectedRows: number, insertId: number, changedRows: number }, error?: string })
function Database.Sync(queryData, callback)
    return exports["stax_db"]:SyncQuery(queryData.query, queryData.data, callback)
end

Stax.Register(Database, function(components)
    Database.Logger = components.Logger
  end)