---@class TableSingleton
local Table = {}

--- Copy's a table into a new table
---@param t table
---@return table
function Table.Copy(t)
  local newTable = {}

  for k, v in pairs(t) do
    newTable[k] = v
  end

  return newTable
end

--- Filters table and returns a filtered table
---@generic T
---@param t `T`[]
---@param type `T`
---@param predicate fun(value: `T`): boolean
---@return `T`[]
function Table.Filter(t, type, predicate)
  local newTable = {}

  for _, v in pairs(t) do
    if predicate(v) then
      table.insert(newTable, v)
    end
  end

  return newTable
end

--- Maps a table and returns the new mapped table
---@generic T
---@generic K
---@param t `T`[]
---@param type `T`
---@param returnType `K`
---@param mapping fun(v: `T`): `K`
---@return `K`[]
function Table.Map(t, type, returnType, mapping)
  local newTable = {}

  for k, v in pairs(t) do
    newTable[k] = mapping(v)
  end

  return newTable
end

--- [ SHARED ]
function Stax.Table()
  return Table
end