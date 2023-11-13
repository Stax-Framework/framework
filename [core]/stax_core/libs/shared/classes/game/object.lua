---@class Object
local Object = {}
Object.__index = Object

--- Creates a new instance of Object
function Object.Init(handle)
  local newObject = {}
  setmetatable(newObject, Object)

  newObject.Handle = handle

  return newObject
end

--- [ SHARED ]
function Stax.Object()
  return Object
end