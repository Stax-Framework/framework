---@meta

json = {}

--- Encodes an object into a JSON string
---
---@param data table
---@param options? { indent: boolean }
---@return string
function json.encode(data, options) end

--- Decodes a JSON string into an object
---
---@param data string
---@return any
function json.decode(data) end