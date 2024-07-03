---@meta

---@class Promise
promise = {}

--- Creates a new promise
---@return Promise
function promise.new() end

--- Rejects the promise
---@param ... any
function promise:reject(...) end

--- Resolves the promise
---@param ... any
function promise:resolve(...) end