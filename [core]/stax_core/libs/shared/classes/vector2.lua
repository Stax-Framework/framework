---@class Vector2
local Vector2 = {}
Vector2.__index = Vector2

--- Creates a new instance of StaxVector2
---@param vector table<{ x: number, y: number }> Requires a table with an `x` and a `y` value
function Vector2.New(vector)
  local newVector2 = {}
  setmetatable(newVector2, Vector2)

  
  return newVector2
end

--- [ SHARED ]
function Stax.Vector2()
  return Vector2
end