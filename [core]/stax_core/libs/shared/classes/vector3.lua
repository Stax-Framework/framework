---@class Vector3
local Vector3 = {}
Vector3.__index = Vector3

--- Creates a new instance of StaxVector2
---@param vector table<{ x: number, y: number, z: number }> Requires a table with an `x`, `y` and `z` value
function Vector3.New(vector)
  local newVector3 = {}
  setmetatable(newVector3, Vector3)

  
  return Vector3
end

--- [ SHARED ]
function Stax.Vector3()
  return Vector3
end