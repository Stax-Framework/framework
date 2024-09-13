---@class StaxDatabase
---@field COMPONENT StaxComponent
local Database = {
    COMPONENT = Stax.Component.Init("Database")
}

--- Creates an asynchrnous query to the database
---@async
---@param queryData { query: string, data: table }
---@return { ok: boolean, results: table, meta?: { affectedRows: number, insertId: number, changedRows: number }, error?: string }
function Database.Async(queryData)
    return exports.stax_db:AsyncQuery(queryData)
end

--- Creates a synchronous query to the database
---@param queryData { query: string, data: table }
---@param callback fun(results: { ok: boolean, results: table, meta?: { affectedRows: number, insertId: number, changedRows: number }, error?: string })
function Database.Sync(queryData, callback)
    return exports.stax_db:SyncQuery(queryData, callback)
end

Stax.Register(Database)