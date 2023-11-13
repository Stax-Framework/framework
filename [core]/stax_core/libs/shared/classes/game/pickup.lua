---@class Pickup
local Pickup = {}
Pickup.__index = Pickup

--- Creates a new instance of Pickup
function Pickup.Init(handle)
  local newPickup = {}
  setmetatable(newPickup, Pickup)

  newPickup.Handle = handle

  return newPickup
end

--- [ SHARED ]
function Stax.Pickup()
  return Pickup
end